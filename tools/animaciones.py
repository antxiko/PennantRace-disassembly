#!/usr/bin/env python3
"""Las animaciones de los jugadores, dibujadas desde la ROM: el fondo de la
pantalla del lanzamiento (tools/pantallas.py) y encima los sprites tal como
los pone el juego (tools/sprites.py): el bateador por formaciones y el
lanzador por pasos, con los tiempos de su codigo.

Uso: animaciones.py <carpeta>   (escribe los GIF y las laminas)
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import pantallas  # noqa: E402
import sprites  # noqa: E402
from vram import Vram  # noqa: E402

LOCAL, VISITANTE = 0x18, 0x1B


def rgb(paleta):
    return [(r * 255 // 7, g * 255 // 7, b * 255 // 7) for r, g, b in paleta]


class Escena:
    """La pantalla del lanzamiento con el bateador y el lanzador."""

    def __init__(self, lado=0, estilo=0, visitante=1, local=2):
        """Por defecto, los equipos de la demostracion: RIDERS de visitante y
        KOBE LINES de local."""
        self.v = pantallas.marcador()
        sprites.colores_de_equipo(self.v, visitante, local)
        self.lado, self.estilo = lado, estilo
        sprites.almacen_del_bateador(self.v, lado)        # p00:5677
        sprites.posturas_del_lanzador(self.v, estilo)     # p00:56C4

    def fotograma(self, formacion, paso, x_bateador=None, x_lanzador=0x78,
                  bateador=VISITANTE, lanzador=LOCAL, fondo=True):
        v = Vram()
        v.v[:] = self.v.v
        v.paleta = self.v.paleta
        sprites.dibujos_de_la_formacion(v, formacion)     # p00:5761
        sprites.postura_del_lanzador(v, paso)             # p00:56B1
        bat = sprites.formacion(formacion, self.lado, x=x_bateador, camiseta=bateador)
        extra, cuatro = sprites.lanzador(self.estilo, paso, x=x_lanzador, camiseta=lanzador)
        fuera = (0xE0, 0, 0, 0)
        lista = bat + [fuera] * (20 - len(bat))           # p00:583B: 18 y 19 fuera
        lista += extra + [fuera] * (2 - len(extra))       # 20-21
        lista += cuatro                                   # 22-25
        sprites.pon_atributos(v, lista)
        sprites.acaba_atributos(v, len(lista))
        # fondo: True, la pantalla; un numero, ese color liso
        img = [[(v.punto(x, y) if fondo is True else fondo) for x in range(256)] for y in range(212)]
        sprites.pinta(v.v, img, None)
        return img, rgb(v.paleta)


def a_imagen(img, pal, escala=2, caja=None):
    from PIL import Image
    im = Image.new("RGB", (256, 212))
    im.putdata([pal[c] for fila in img for c in fila])
    if caja:
        im = im.crop(caja)
    return im.resize((im.size[0] * escala, im.size[1] * escala), Image.NEAREST)


def gif(ruta, cuadros):
    """cuadros: [(imagen, cuadros de 1/60 s)]."""
    from PIL import Image
    imgs = [im.convert("P", palette=Image.ADAPTIVE, colors=16) for im, _ in cuadros]
    dur = [max(20, round(n * 1000 / 60)) for _, n in cuadros]
    imgs[0].save(ruta, save_all=True, append_images=imgs[1:], duration=dur, loop=0, optimize=False)


def swing(carpeta):
    """El bateador: el swing recto por los dos lados (p02:8663), con el
    lanzador quieto en el paso 5."""
    for lado, nombre in ((0, "bateador_derecha"), (1, "bateador_izquierda")):
        e = Escena(lado=lado)
        cuadros = []
        for f, n in sprites.SWING:
            img, pal = e.fotograma(f, 5)
            cuadros.append((a_imagen(img, pal), n))
        gif(os.path.join(carpeta, nombre + ".gif"), cuadros)


def lanzamiento(carpeta):
    """El lanzador: los pasos 5 a 0 de cada estilo (p03:A597), con el
    bateador en reposo."""
    for estilo in range(4):
        e = Escena(estilo=estilo)
        cuadros = []
        for paso, n in sprites.PASOS_DEL_LANZADOR:
            img, pal = e.fotograma(4, paso)
            cuadros.append((a_imagen(img, pal, caja=(56, 40, 200, 140)), n))
        gif(os.path.join(carpeta, "lanzador_%d.gif" % estilo), cuadros)


def laminas(carpeta):
    """Las 7 formaciones del bateador por los dos lados y los 6 pasos de los
    4 estilos del lanzador (y en espejo), sobre el verde del cesped (el
    contorno es el color 15, negro)."""
    from PIL import Image, ImageDraw
    esc = 3
    # el bateador
    cel = (64, 84)
    hoja = Image.new("RGB", (7 * cel[0] * esc, 2 * (cel[1] + 10) * esc), (0, 0, 0))
    d = ImageDraw.Draw(hoja)
    for lado in (0, 1):
        e = Escena(lado=lado)
        x0 = 0x4C if lado == 0 else 0x94
        for f in range(7):
            img, pal = e.fotograma(f, 5, fondo=1)
            caja = (x0 - 22, 0x7C - 20, x0 - 22 + cel[0], 0x7C - 20 + cel[1])
            im = a_imagen(img, pal, esc, caja)
            px, py = f * cel[0] * esc, lado * (cel[1] + 10) * esc
            hoja.paste(im, (px, py + 10 * esc))
            d.text((px + 4, py + 4), "%d" % f, fill=(255, 220, 0))
    hoja.save(os.path.join(carpeta, "bateador_formaciones.png"))
    # el lanzador
    cel = (40, 44)
    hoja = Image.new("RGB", (6 * cel[0] * esc, 8 * (cel[1] + 6) * esc), (0, 0, 0))
    d = ImageDraw.Draw(hoja)
    for estilo in range(8):
        e = Escena(estilo=estilo)
        for k, paso in enumerate((5, 4, 3, 2, 1, 0)):
            img, pal = e.fotograma(4, paso, fondo=1)
            caja = (0x78 - 14, 0x48 - 6, 0x78 - 14 + cel[0], 0x48 - 6 + cel[1])
            im = a_imagen(img, pal, esc, caja)
            px, py = k * cel[0] * esc, estilo * (cel[1] + 6) * esc
            hoja.paste(im, (px, py + 6 * esc))
            d.text((px + 4, py + 2), "%d/%d" % (estilo, paso), fill=(255, 220, 0))
    hoja.save(os.path.join(carpeta, "lanzador_posturas.png"))


# ------------------------------------------------------------------ el campo

def _base_del_campo(visitante=1, local=2):
    """Los dibujos de sprite del partido (pantallas.sprites_del_partido) con
    la paleta del campo y los colores de los equipos."""
    v = pantallas.sprites_del_partido()
    c, _ = pantallas.campo(1)
    v.paleta = c.paleta
    sprites.colores_de_equipo(v, visitante, local)
    return v


def _pareja(y, x, d):
    """p01:7594: un jugador del campo son dos sprites en el mismo sitio: el
    dibujo d con el indice 7 y el d + 4 con la camiseta: 0x18 el que
    defiende (dibujos por debajo de 0x70, y el receptor 0xF8) y 0x1B el que
    batea (0x70 en adelante), en la alta."""
    cam = LOCAL if (d < 0x70 or d == 0xF8) else VISITANTE
    return [(y, x, d, 7), (y, x, d + 4, cam)]


def _pinta_lista(v, lista, ancho, alto, fondo=1, escala=3):
    img = [[fondo] * 256 for _ in range(212)]
    for t in range(0, len(lista), 32):
        w = Vram()
        w.v[:] = v.v
        trozo = lista[t:t + 32]
        sprites.pon_atributos(w, trozo)
        sprites.acaba_atributos(w, len(trozo)) if len(trozo) < 32 else None
        sprites.pinta(w.v, img, None)
    return a_imagen(img, rgb(v.paleta), escala, (0, 0, ancho, alto))


def campo_jugadores(carpeta):
    """Los defensores y los corredores corriendo: el dibujo de la direccion
    (p01:7280 arriba 0x00, abajo 0x10, izquierda 0x20, derecha 0x30; los
    corredores 0x70 + 0x10 x direccion, p02:8FC8) con el bit 3 del contador
    0xED0E, que cambia cada 8 cuadros: las piernas."""
    v = _base_del_campo()
    cuadros = []
    for piernas in (0, 8):
        lista = []
        for k, d in enumerate((0x00, 0x10, 0x20, 0x30)):
            lista += _pareja(8, 8 + 28 * k, d | piernas)
        for k, d in enumerate((0x70, 0x80, 0x90, 0xA0)):
            lista += _pareja(36, 8 + 28 * k, d | piernas)
        cuadros.append((_pinta_lista(v, lista, 120, 60), 8))
    gif(os.path.join(carpeta, "campo_jugadores.gif"), cuadros)


def campo_posturas(carpeta):
    """Todas las posturas de los jugadores del campo, con su dibujo."""
    from PIL import Image, ImageDraw
    v = _base_del_campo()
    esc, cel = 3, 26
    # de 7 en 7: una fila de sprites no puede pasar de los 256 puntos
    filas = [
        ("defensor", [0x00, 0x08, 0x10, 0x18, 0x20, 0x28, 0x30]),
        ("defensor", [0x38, 0x40, 0x48, 0x50, 0x60, 0x68]),
        ("corredor", [0x70, 0x78, 0x80, 0x88, 0x90, 0x98, 0xA0]),
        ("corredor", [0xA8, 0xE0, 0xE8, 0xF0]),
    ]
    alto = (len(filas) + 3) * (cel + 8)
    hoja = Image.new("RGB", (14 * cel * esc, alto * esc), (0, 0, 0))
    d = ImageDraw.Draw(hoja)
    py = 0
    for nombre, dibs in filas:
        im = _pinta_lista(v, [p for k, dib in enumerate(dibs) for p in _pareja(4, 4 + cel * k, dib)],
                          cel * len(dibs), cel, escala=esc)
        hoja.paste(im, (0, (py + 8) * esc))
        for k, dib in enumerate(dibs):
            d.text((k * cel * esc + 4, py * esc + 4), "%02X" % dib, fill=(255, 220, 0))
        py += cel + 8
    # el receptor: el dibujo 0xF8 con las 14 posturas de 64 bytes (p00:5716)
    im = Image.new("RGB", (14 * cel * esc, cel * esc))
    for k in range(14):
        w = Vram()
        w.v[:] = v.v
        w.paleta = v.paleta
        w.v[0xFFC0:0x10000] = sprites.rom(10, 0x8759 + 64 * k, 64)
        im.paste(_pinta_lista(w, _pareja(4, 4, 0xF8), cel, cel, escala=esc), (k * cel * esc, 0))
        d.text((k * cel * esc + 4, py * esc + 4), "F8/%d" % k, fill=(255, 220, 0))
    hoja.paste(im, (0, (py + 8) * esc))
    py += cel + 8
    # con la pelota: los dibujos 0x58 y 0x60 de las 5 de 128 bytes (p00:572E)
    for k in range(5):
        w = Vram()
        w.v[:] = v.v
        w.paleta = v.paleta
        w.v[0xFAC0:0xFB40] = sprites.rom(10, 0x8499 + 128 * k, 128)
        im = _pinta_lista(w, _pareja(4, 4, 0x58) + _pareja(4, 4 + cel, 0x60), 2 * cel, cel, escala=esc)
        hoja.paste(im, (2 * k * cel * esc, (py + 8) * esc))
        d.text((2 * k * cel * esc + 4, py * esc + 4), "58-60/%d" % k, fill=(255, 220, 0))
    hoja.save(os.path.join(carpeta, "campo_posturas.png"))


# ------------------------------------------------------------------ la presentacion

def _s8(b):
    return b - 256 if b > 127 else b


def pelota_grande(y, x, forma):
    """p15:BCAD: los sprites de la pelota de la presentacion: la forma
    (0xECF8) elige en p15:BD13 la lista de piezas de p15:BD31 y el primer
    dibujo; cada pieza son dos sprites [dy dx][dy dx] con los indices de color
    0x0D y 0x1E (0 si la x pasa de 0xEF) y dibujos de 4 en 4."""
    from vram import byte, palabra
    e = 0xBD13 + 2 * (forma - 1)
    lista, dib = byte(13, e), byte(13, e + 1)
    p = palabra(13, 0xBD31 + 2 * lista)
    out = []
    for k in range(byte(13, p)):
        dy1, dx1, dy2, dx2 = (byte(13, p + 1 + 4 * k + j) for j in range(4))
        x1 = (x + dx1) & 0xFF
        dentro = x1 < 0xF0
        out.append(((y + dy1) & 0xFF, x1, dib & 0xFF, 0x0D if dentro else 0))
        out.append(((y + dy2) & 0xFF, (x + dx2) & 0xFF, (dib + 4) & 0xFF, 0x1E if dentro else 0))
        dib += 8
    return out


def _estado(d):
    from vram import byte
    b = [byte(13, d + i) for i in range(9)]
    return dict(y=b[0] | b[1] << 8, vy=b[2] | b[3] << 8, x=b[4] | b[5] << 8,
                vx=b[6] | b[7] << 8, forma=b[8])


def presentacion_cuadros():
    """Los cuadros de la presentacion (p15:BB97): [(vram, atributos)].
    Paso 0: el estadio y 32 cuadros. Pasos 1-2: la pelota de p15:BD99 se
    acerca: se mueve, frena (vy - 5, vx - 8, p15:BC89) y cada 8 cuadros baja
    de forma hasta 0. Luego los dibujos de p11:8FE3 (p00:5421) y la de
    p15:BDA2 cruza a 4 puntos por cuadro, cambiando entre las formas 15 y 14
    cada 8 cuadros (p15:BC9E) y destapando el rotulo de la pagina 1 columna
    a columna (p15:BC39) hasta la x 0xE9; 16 cuadros mas."""
    v = pantallas.titulo()
    v.rachas(10, 0x8AD9, 0xF800)                     # p00:5427
    out = []
    for _ in range(32):
        out.append((bytes(v.v), []))
    e = _estado(0xBD99)
    cuenta = 8
    while True:                                      # paso 2
        out.append((bytes(v.v), pelota_grande(e["y"] >> 8, e["x"] >> 8, e["forma"])))
        e["y"] = (e["y"] + e["vy"]) & 0xFFFF
        e["x"] = (e["x"] + e["vx"]) & 0xFFFF
        e["vy"] = (e["vy"] - 5) & 0xFFFF
        e["vx"] = (e["vx"] - 8) & 0xFFFF
        cuenta -= 1
        if cuenta == 0:
            cuenta = 8
            e["forma"] -= 1
            if e["forma"] == 0:
                break
    v.rachas(10, 0x8FE3, 0xF800)                     # p00:546B
    e = _estado(0xBDA2)
    cuadro = 0
    while True:                                      # paso 3
        out.append((bytes(v.v), pelota_grande(e["y"] >> 8, e["x"] >> 8, e["forma"])))
        e["y"] = (e["y"] + e["vy"]) & 0xFFFF
        e["x"] = (e["x"] + e["vx"]) & 0xFFFF
        cuadro += 1
        if cuadro % 8 == 0:
            e["forma"] ^= 1
        x = e["x"] >> 8
        if x > 0x1C:
            d = (x & 0xF8) - 4
            pantallas.copia(v, d + 0x0C, 0x70, 1, d, 0x08, 0, 8, 0x48)
            if x >= 0xE9:
                break
    for _ in range(16):
        out.append((bytes(v.v), []))
    return out, v.paleta


def presentacion(carpeta, cada=2):
    cuadros, paleta = presentacion_cuadros()
    pal = rgb(paleta)
    imgs = []
    for k in range(0, len(cuadros), cada):
        vv, lista = cuadros[k]
        w = Vram()
        w.v[:] = vv
        sprites.pon_atributos(w, lista)
        sprites.acaba_atributos(w, len(lista))
        img = [[w.punto(x, y) for x in range(256)] for y in range(212)]
        sprites.pinta(w.v, img, None)
        imgs.append((a_imagen(img, pal), cada))
    imgs[-1] = (imgs[-1][0], 120)
    gif(os.path.join(carpeta, "presentacion.gif"), imgs)


def main(argv):
    carpeta = argv[1] if len(argv) > 1 else "docs/imagenes"
    os.makedirs(carpeta, exist_ok=True)
    swing(carpeta)
    lanzamiento(carpeta)
    laminas(carpeta)
    campo_jugadores(carpeta)
    campo_posturas(carpeta)
    presentacion(carpeta)
    print("hecho:", carpeta)


if __name__ == "__main__":
    main(sys.argv)
