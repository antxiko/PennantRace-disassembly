#!/usr/bin/env python3
"""La musica del cartucho (PSG y SCC), ejecutando su motor de sonido
(ver motor_musica.py).

El motor vive en el banco 6 (0xA000) y se entra por el salto del principio
del banco 4 (0x6000), con los bancos 4-5-6 puestos:
  p04:6000  jp p06:B15E   arranque: calla todo (sonido 1), apaga el SCC
                          (0x988F) y pone el mezclador del PSG a 0xBF
  p04:6003  ld (0xEFFC),a / jp p06:B193   pide el sonido A (p00:5806)
  p04:6009  jp p06:B41E   el sonido de cada cuadro (la interrupcion, p00:41CC)
La cabecera de cada sonido sale de la tabla p04:600A + 2 x numero. El mapper
es el Konami SCC: el banco 0x3F en 0x9000 abre el SCC en 0x9800-0x98FF.
MegaROM de 128 KB.
Uso:  musica.py registros 0x10 [cuadros] | mp3 0x10 f.mp3 | todas docs/audio
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import motor_musica  # noqa: E402

PIEZAS = []

CFG = dict(rom="pennantrace.rom", org=0x4000, mapper="konami_scc",
           bancos0=((0x4000, 0), (0x6000, 4), (0x8000, 5), (0xA000, 6)),
           bancos_frame=((0x6000, 4), (0x8000, 5), (0xA000, 6)),
           sp=0xD280, ram0=[], init=[(0x6000, {})], frame=0x6009, pide=0x6003,
           banco_frame=4, banco_pide=4, ram=(0xEE00, 0xF000), hz=60,
           psg0={7: 0xBF}, romtype="KonamiSCC", max_s=75, piezas=PIEZAS,
           pagina=None, cotejado=[])

if __name__ == "__main__":
    sys.exit(motor_musica.main(CFG, sys.argv[1:]))
