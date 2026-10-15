#!/usr/bin/env python3
"""Coteja una pantalla de tools/menus.py con un volcado de openMSX
(tools/omsx_vram.tcl): la pagina 0 que se ve, byte a byte, con la RAM del
mismo volcado como estado.

Uso: coteja_menus.py <pantalla> <work/dir> <segundo> [salida.png]
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import menus  # noqa: E402


def main(argv):
    que, carpeta, t = argv[1], argv[2], argv[3]
    ram = open(os.path.join(carpeta, "ram-%s.bin" % t), "rb").read()
    d = open(os.path.join(carpeta, "vram-%s.bin" % t), "rb").read()
    v = getattr(menus, que)(ram)
    dif = [i for i in range(212 * 128) if v.v[i] != d[i]]
    filas = sorted(set(i // 128 for i in dif))
    print("%s %s/%s: %d bytes distintos en la pagina 0; filas %s" % (
        que, carpeta, t, len(dif), (filas[:12], len(filas))))
    if len(argv) > 4:
        from vram import Vram
        from PIL import Image
        w = Vram()
        w.v[:] = d
        w.paleta = v.paleta
        v.png(argv[4] + "_mio.png", pagina=0, escala=2)
        w.png(argv[4] + "_omsx.png", pagina=0, escala=2)
        a, b = Image.open(argv[4] + "_mio.png"), Image.open(argv[4] + "_omsx.png")
        c = Image.new("RGB", (a.size[0] * 2 + 8, a.size[1]))
        c.paste(a, (0, 0)); c.paste(b, (a.size[0] + 8, 0))
        c.save(argv[4] + ".png")
    return 0 if not dif else 1


if __name__ == "__main__":
    sys.exit(main(sys.argv))
