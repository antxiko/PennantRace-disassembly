#!/usr/bin/env python3
"""Coteja el pintor de sprites (tools/sprites.py) con openMSX: pinta un
volcado de VRAM de tools/omsx_vram.tcl (fondo de la pagina que se ve y
sprites) con su paleta y lo compara punto a punto con la captura de pantalla
del mismo instante.

Uso: coteja_sprites.py work/omsx2 100 [salida.png]
"""
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import sprites  # noqa: E402


def lee_vdp(ruta):
    regs, pal = {}, [(0, 0, 0)] * 16
    for ln in open(ruta):
        m = re.match(r"R(\d+) = 0x([0-9A-F]+)", ln)
        if m:
            regs[int(m.group(1))] = int(m.group(2), 16)
        m = re.match(r"P(\d+) = 0x([0-9A-F]+)", ln)
        if m:
            # getcolor da "RGB" en cifras 0-7 y el volcado lo escribio con
            # format %X: Tcl lo lee en decimal, o en octal si empieza por 0
            # (con el rojo a 0), y entonces sale por debajo de 100
            n = int(m.group(2), 16)
            r, g, b = ("%03d" % n) if n >= 100 else ("%03o" % n)
            pal[int(m.group(1))] = (int(r), int(g), int(b))
    return regs, pal


def a_rgb(pal):
    return [(r * 255 // 7, g * 255 // 7, b * 255 // 7) for r, g, b in pal]


def pinta_volcado(v, regs, con_sprites=True):
    pagina = (regs.get(2, 0x1F) >> 5) & 3
    desp = regs.get(23, 0)
    img = []
    for y in range(212):
        yy = (y + desp) & 0xFF
        fila = []
        for x in range(256):
            b = v[pagina * 0x8000 + yy * 128 + x // 2]
            fila.append(b >> 4 if x % 2 == 0 else b & 0x0F)
        img.append(fila)
    if con_sprites:
        sprites.pinta(v, img, None)
    return img


def compara(img, pal, captura):
    """La captura es 320 x 240 por 3 con borde y lineas de barrido: el centro
    de cada bloque de 3 x 3 (la fila clara) lleva el color de la paleta tal
    cual (cifra x 255 / 7). Se busca el borde y se cuentan los distintos."""
    from PIL import Image
    cap = Image.open(captura).convert("RGB")
    esc = cap.size[0] // 320
    pxc = cap.load()
    rgb = a_rgb(pal)

    def px(x, y):
        return pxc[esc * x + esc // 2, esc * y + esc // 2]

    def malos(ox, oy, paso):
        return sum(1 for y in range(0, 212, paso) for x in range(0, 256, paso)
                   if px(ox + x, oy + y) != rgb[img[y][x]])
    _, ox, oy = min((malos(ox, oy, 4), ox, oy) for oy in range(0, 29) for ox in range(0, 64))
    distintos = [(x, y) for y in range(212) for x in range(256)
                 if px(ox + x, oy + y) != rgb[img[y][x]]]
    return distintos, (ox, oy)


def main(argv):
    carpeta, et = argv[1], argv[2]
    v = open(os.path.join(carpeta, "vram-%s.bin" % et), "rb").read()
    regs, pal = lee_vdp(os.path.join(carpeta, "vdp-%s.txt" % et))
    img = pinta_volcado(v, regs)
    distintos, off = compara(img, pal, os.path.join(carpeta, "ver-%s.png" % et))
    print("%s: %d puntos distintos de %d (borde %s)" % (et, len(distintos), 256 * 212, off))
    # dentro de las cajas de los sprites que se ven: lo que cotejamos aqui
    cajas = set()
    for n in range(32):
        y, x = v[sprites.ATRIBUTOS + 4 * n], v[sprites.ATRIBUTOS + 4 * n + 1]
        if y == 216:
            break
        if y >= 212 and y < 240:
            continue
        for yy in range(16):
            for xx in range(16):
                p = (x + xx, (y + 1 + yy) & 0xFF)
                if p[0] < 256 and p[1] < 212:
                    cajas.add(p)
    dentro = [p for p in distintos if p in cajas]
    print("  en las cajas de los sprites: %d distintos de %d" % (len(dentro), len(cajas)))
    distintos = dentro
    if len(argv) > 3:
        from PIL import Image
        out = Image.new("RGB", (256, 212))
        rgb = a_rgb(pal)
        out.putdata([rgb[c] for fila in img for c in fila])
        for x, y in distintos:
            out.putpixel((x, y), (255, 0, 255))
        out.resize((512, 424), Image.NEAREST).save(argv[3])
    return 0 if not distintos else 1


if __name__ == "__main__":
    sys.exit(main(sys.argv))
