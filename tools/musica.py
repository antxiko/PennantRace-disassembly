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
from motor_musica import P  # noqa: E402

# Las musicas: las cabeceras de 6 u 8 canales (los efectos usan solo los
# canales 3 y 4, mascara 0x30). Quien las pide sale del codigo.
K = "Konami"
PIEZAS = [
    P(0x28, "La presentación (p15:BBD8)", "The intro (p15:BBD8)", K),
    P(0x2D, "El título y la demostración (p00:44DD, p15:AB3B)", "Title and demo (p00:44DD, p15:AB3B)", K),
    P(0x23, "Al elegir el modo (p00:45C8)", "Mode chosen (p00:45C8)", K),
    P(0x2E, "Los menús de PENNANT (p13:622A, p15:A548)", "The PENNANT menus (p13:622A, p15:A548)", K),
    P(0x2F, "Antes del partido: lanzadores y orden (p00:463A)", "Before the game: pitchers and order (p00:463A)", K),
    P(0x33, "Batea el visitante: bases vacías (p00:5E74; 0x32, la de empezar el partido en p00:466E, es la misma)",
      "Visitors at bat: bases empty (p00:5E74; 0x32, the play-ball tune of p00:466E, is the same)", K),
    P(0x34, "Batea el visitante: corredor en primera", "Visitors at bat: runner on first", K),
    P(0x35, "Batea el visitante: corredor en segunda", "Visitors at bat: runner on second", K),
    P(0x36, "Batea el visitante: corredor en tercera", "Visitors at bat: runner on third", K),
    P(0x37, "Batea el local: bases vacías (p00:5E7A)", "Home team at bat: bases empty (p00:5E7A)", K),
    P(0x38, "Batea el local: corredor en primera", "Home team at bat: runner on first", K),
    P(0x39, "Batea el local: corredor en segunda", "Home team at bat: runner on second", K),
    P(0x3A, "Batea el local: corredor en tercera", "Home team at bat: runner on third", K),
    P(0x3B, "La séptima entrada, alta (p02:94E3)", "The seventh inning, top (p02:94E3)", K),
    P(0x3C, "La séptima entrada, baja (p02:94ED)", "The seventh inning, bottom (p02:94ED)", K),
    P(0x3D, "La pelota en juego, alta (p01:6003)", "Ball in play, top (p01:6003)", K),
    P(0x3E, "La pelota en juego, baja (p01:6003)", "Ball in play, bottom (p01:6003)", K),
    P(0x2C, "Home run (0x2C con 0x3F, p02:9357)", "Home run (0x2C with 0x3F, p02:9357)", K),
    P(0x42, "Out (p01:6171, p03:B131)", "Out (p01:6171, p03:B131)", K),
    P(0x45, "Cogida al vuelo (p03:AE58)", "Caught on the fly (p03:AE58)", K),
    P(0x43, "Base por bolas (p01:61BD)", "Walk (p01:61BD)", K),
    P(0x44, "Carrera (p02:8FA3)", "Run scored (p02:8FA3)", K),
    P(0x40, "Fin de la media entrada, con corredores (p02:9466)", "End of the half inning, runners left (p02:9466)", K),
    P(0x41, "Fin de la media entrada, sin corredores (p02:945F)", "End of the half inning, bases empty (p02:945F)", K),
    P(0x30, "Cambio de lanzador (p00:4A32)", "Pitching change (p00:4A32)", K),
    P(0x31, "El campeón y el final (p00:4925, p00:49A6)", "The champion and the ending (p00:4925, p00:49A6)", K),
]

CFG = dict(rom="pennantrace.rom", org=0x4000, mapper="konami_scc",
           bancos0=((0x4000, 0), (0x6000, 4), (0x8000, 5), (0xA000, 6)),
           bancos_frame=((0x6000, 4), (0x8000, 5), (0xA000, 6)),
           sp=0xD280, ram0=[], init=[(0x6000, {})], frame=0x6009, pide=0x6003,
           banco_frame=4, banco_pide=4, ram=(0xEE00, 0xF000), hz=60,
           psg0={7: 0xBF}, romtype="KonamiSCC", max_s=90, piezas=PIEZAS,
           pagina=None,
           # (numero, cuadros iguales a openMSX, nota): work/coteja_todas.sh y
           # work/coteja_ceros.sh (con 0xEFF4, el tono libre del canal 4, a 0)
           cotejado=[(0x28, 218, None), (0x23, 176, None), (0x2D, 3790, None), (0x2E, 3073, None),
                     (0x2F, 2305, "sin el tono libre"), (0x33, 2017, "sin el tono libre"),
                     (0x34, 1153, None), (0x35, 961, None), (0x36, 1921, "sin el tono libre"),
                     (0x37, 1825, "sin el tono libre"), (0x38, 1537, None), (0x39, 1921, "sin el tono libre"),
                     (0x3A, 1601, "sin el tono libre"), (0x3B, 2267, None), (0x3C, 2075, "sin el tono libre"),
                     (0x3D, 611, None), (0x3E, 379, None), (0x2C, 843, "sola"), (0x3F, 843, "sola"),
                     (0x42, 229, None), (0x45, 259, None), (0x43, 215, None), (0x44, 247, None),
                     (0x40, 205, None), (0x41, 266, None), (0x30, 668, None),
                     (0x31, 3968, "de 4609: luego el juego la corta")],
           # 0xEFF9 copia cada cuadro la cuenta de 0xFDA2 (p06:B427): no es
           # estado de la musica y no dejaria ver la vuelta
           excluye=[0xEFF9],
           # el home run: el juego pide 0x2C (PSG y un canal del SCC) y 0x3F
           # (los otros tres del SCC) seguidos (p02:9357)
           juntos={0x2C: [0x3F]},
           maquina="C-BIOS_MSX2_JP")

# Para cotejar cada mitad del home run por separado (cada una es una peticion)
if os.environ.get("SIN_JUNTOS"):
    CFG["juntos"] = {}

if __name__ == "__main__":
    sys.exit(motor_musica.main(CFG, sys.argv[1:]))
