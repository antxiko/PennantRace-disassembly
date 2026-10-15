#!/usr/bin/env python3
"""Escribe la pagina de la musica en los dos idiomas (docs/es/LA-MUSICA.md y
docs/THE-MUSIC.md) desde tools/musica.py: las piezas, quien las pide, cuanto
duran y a que cuadro vuelven (ejecutando el motor) y su cotejo con openMSX
(musica.CFG["cotejado"]).

Uso: pagina_musica.py
"""
import hashlib
import os
import re
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
sys.path.insert(0, AQUI)
import musica  # noqa: E402
import motor_musica  # noqa: E402

CABEZA = {
    "es": """# La música

{n} piezas. El motor de sonido (banco 6, con las partituras en el 5 y la
tabla de 72 sonidos en `p04:600C`) lleva ocho canales: los tres del PSG y los
cinco del SCC. La cabecera de cada sonido dice qué canales usa: las músicas
usan 6 u 8 y los efectos solo dos, el 3 del PSG y el 1 del SCC. Un canal toma
un sonido nuevo si su prioridad no es menor que la del que suena
(`p06:B305`).

Durante el partido, la música de fondo depende de la base más adelantada que
esté ocupada y de quién batea (`p00:5E74`, `p00:5E7A`): ocho temas, más los
de la séptima entrada. El home run son dos peticiones seguidas: la 0x2C (PSG y
un canal del SCC) y la 0x3F (los otros tres del SCC). F5 quita y pone la
música.

Las piezas no se han reescrito: se ejecuta el propio motor del cartucho en un
Z80 de Python (`tools/musica.py`) y lo que escribe en el PSG y en el SCC se
pasa a sonido. Cada una se ha cotejado con openMSX (`tools/omsx_psg.tcl`,
`tools/coteja_psg.py`): el estado de los dos chips coincide cuadro a cuadro.
Siete coinciden con el «tono libre» del canal 4 apagado (`0xEFF4`): es un
silbido que el juego enciende por su cuenta durante el partido y que esas
piezas no usan. Los efectos no van.
""",
    "en": """# The music

{n} pieces. The sound engine (bank 6, with the scores in bank 5 and the
table of 72 sounds at `p04:600C`) drives eight channels: the PSG's three and
the SCC's five. Each sound's header says which channels it uses: the tunes use
6 or 8 and the effects only two, PSG channel 3 and SCC channel 1. A channel
takes a new sound if its priority is not lower than that of the one playing
(`p06:B305`).

During a game the background tune depends on the furthest occupied base and
on who is batting (`p00:5E74`, `p00:5E7A`): eight tunes, plus the seventh
inning ones. The home run is two requests in a row: 0x2C (PSG and one SCC
channel) and 0x3F (the other three SCC channels). F5 turns the music off and
on.

The pieces have not been rewritten: the cartridge's own engine runs on a
Python Z80 (`tools/musica.py`) and what it writes to the PSG and the SCC is
turned into sound. Each one has been checked against openMSX
(`tools/omsx_psg.tcl`, `tools/coteja_psg.py`): the state of both chips matches
frame by frame. Seven match with the "free tone" of channel 4 switched off
(`0xEFF4`): a whistle the game turns on by itself during a game, which those
pieces do not use. The effects are not here.
""",
}

COTEJO = {
    "es": {None: "Cotejada: %d cuadros iguales.",
           "sin el tono libre": "Cotejada: %d cuadros iguales con el tono libre apagado.",
           "sola": "Cotejada: %d cuadros iguales (cada mitad por separado).",
           "de 4609: luego el juego la corta": "Cotejada: %d cuadros iguales de 4609; luego el juego la corta."},
    "en": {None: "Checked: %d identical frames.",
           "sin el tono libre": "Checked: %d identical frames with the free tone off.",
           "sola": "Checked: %d identical frames (each half on its own).",
           "de 4609: luego el juego la corta": "Checked: %d identical frames out of 4609; then the game cuts it."},
}


def coma(x, idioma):
    s = "%.1f" % x
    return s.replace(".", ",") if idioma == "es" else s


def main():
    cfg = musica.CFG
    rom = open(os.path.join(RAIZ, cfg["rom"]), "rb").read()
    cotejo = {n: (c, nota) for n, c, nota in cfg["cotejado"]}
    medidas = []
    for pieza in cfg["piezas"]:
        n, fichero = pieza[0], pieza[1]
        cuadros, vuelta = motor_musica.ejecuta(cfg, rom, n)
        v = hashlib.sha1(open(os.path.join(RAIZ, "docs", "audio", fichero), "rb").read()).hexdigest()[:8]
        medidas.append((pieza, len(cuadros), vuelta, v))
    for idioma, ruta in (("es", "docs/es/LA-MUSICA.md"), ("en", "docs/THE-MUSIC.md")):
        out = [CABEZA[idioma].format(n=len(medidas))]
        for pieza, cuadros, vuelta, v in medidas:
            n, fichero = pieza[0], pieza[1]
            titulo = pieza[3] if idioma == "es" else pieza[4]
            m = re.match(r"^(.*?) \((p.*)\)$", titulo)
            quien = ""
            if m:
                titulo, quien = m.group(1), m.group(2)
            out.append("## 0x%02X: %s\n" % (n, titulo))
            out.append('<audio controls preload="none" src="%saudio/%s?v=%s"></audio>\n'
                       % ("../" if idioma == "es" else "", fichero, v))
            s = coma(cuadros / 60, idioma)
            if idioma == "es":
                txt = ("Lo pide %s. " % quien) if quien else ""
                txt += ("%s s y vuelve al cuadro %d." % (s, vuelta)) if vuelta else "%s s." % s
            else:
                txt = ("Asked for by %s. " % quien) if quien else ""
                txt += ("%s s, looping back to frame %d." % (s, vuelta)) if vuelta else "%s s." % s
            c, nota = cotejo[n]
            txt += " " + COTEJO[idioma][nota] % c
            out.append(txt + "\n")
        open(os.path.join(RAIZ, ruta), "w", encoding="utf-8", newline="\n").write("\n".join(out))
        print("  %s: %d piezas" % (ruta, len(medidas)))


if __name__ == "__main__":
    main()
