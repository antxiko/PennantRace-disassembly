#!/usr/bin/env python3
"""Coteja lo que pinta tools/pantallas.py con un volcado de openMSX
(tools/omsx_vram.tcl).

  coteja_vram.py hoja work/omsx/vram-60.bin
      la pagina 1 entera (las fuentes y los graficos del partido), byte a byte
  coteja_vram.py campo work/omsx/vram-60.bin work/omsx/vdp-60.txt
      las lineas de la pagina 0 que tienen el campo de la zona del volcado
      (0xE1A6): cada linea Y es la Y o la Y + 256 del campo pintado aqui
"""
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import pantallas  # noqa: E402
from vram import Vram  # noqa: E402


def lee_vdp(ruta):
    out = {}
    for ln in open(ruta):
        m = re.match(r"(\w+) = 0x([0-9A-F]+)", ln)
        if m:
            out[m.group(1)] = int(m.group(2), 16)
    return out


def main(argv):
    que, ruta = argv[1], argv[2]
    vr = open(ruta, "rb").read()
    if que == "hoja":
        v = Vram()
        pantallas.graficos_del_partido(v)
        ini, fin = 0x8000, 0x10000
        malos = [a for a in range(ini, fin) if v.v[a] != vr[a]]
        # solo cuenta lo que pinta alguna de las listas (lo demas lo pone otra pantalla)
        print("pagina 1: %d bytes distintos de %d" % (len(malos), fin - ini))
        if malos:
            lineas = sorted(set((a - 0x8000) // 128 for a in malos))
            print("  lineas con diferencias:", lineas[:40], "..." if len(lineas) > 40 else "")
    elif que == "campo":
        vdp = lee_vdp(argv[3])
        zona = vdp["zona"]
        _, lineas = pantallas.campo(zona)
        bien, mal, malas = 0, 0, []
        for y in range(256):
            real = [(vr[y * 128 + x // 2] >> (4 if x % 2 == 0 else 0)) & 15 for x in range(256)]
            if real == lineas[y] or real == lineas[y + 256]:
                bien += 1
            else:
                mal += 1
                malas.append(y)
        print("zona %d, desplazamiento 0x%02X%02X: %d lineas de la pagina 0 iguales, %d no (%s)" % (
            zona, vdp["desp_h"], vdp["desp_l"], bien, mal, malas[:30]))


if __name__ == "__main__":
    main(sys.argv)
