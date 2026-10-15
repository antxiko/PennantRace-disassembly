#!/usr/bin/env python3
"""Los 6 equipos de serie, sacados de la ROM.

p13:62D7: los 6 nombres (11 letras ASCII). p13:731F: 6 punteros a la ficha
de 255 bytes de cada equipo (la que se copia a 0xD380 / 0xD47F):
  +0     el nombre (11 caracteres de la fuente)
  +0x0B  12 jugadores de campo, 14 bytes: nombre (6), LR (1), 打率 (3 cifras,
         se pinta .xyz), HR (2), RUN (2)
  +0xB3  4 lanzadores, 19 bytes: nombre (6), LR (1), U o D (1), SPD (3 cifras,
         km/h; p03:AAE1), 防御率 (3, se pinta x.yz), STM (2), C S F (1 + 1 + 1)
Los nombres de las columnas son los de la pantalla de TEAM EDIT (p13:7EC6).
Las cifras van en la fuente: 1-10 son 0-9 (0 es un hueco).

Uso: equipos.py [md]
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
sys.path.insert(0, AQUI)
import fuente  # noqa: E402

ROM = open(os.path.join(RAIZ, "pennantrace.rom"), "rb").read()


def lee(a):
    return ROM[(13 + (a - 0x6000) // 0x2000) * 0x2000 + (a & 0x1FFF)]


def cifras(cs):
    return "".join(" " if c == 0 else str(c - 1) for c in cs)


def equipos():
    out = []
    for k in range(6):
        nombre = bytes(lee(0x62D7 + 11 * k + i) for i in range(11)).decode("ascii").strip()
        p = lee(0x731F + 2 * k) | lee(0x7320 + 2 * k) << 8
        f = [lee(p + i) for i in range(255)]
        campo = []
        for j in range(12):
            r = f[0x0B + 14 * j:0x0B + 14 * j + 14]
            campo.append(dict(nombre=fuente.texto(r[:6]).strip(), lr=fuente.caracter(r[6]),
                              avg="." + cifras(r[7:10]), hr=cifras(r[10:12]).strip(),
                              run=cifras(r[12:14]).strip()))
        lanz = []
        for j in range(4):
            r = f[0xB3 + 19 * j:0xB3 + 19 * j + 19]
            era = cifras(r[11:14])
            lanz.append(dict(nombre=fuente.texto(r[:6]).strip(), lr=fuente.caracter(r[6]),
                             ud=fuente.caracter(r[7]), spd=cifras(r[8:11]).strip(),
                             era=era[0] + "." + era[1:], stm=cifras(r[14:16]).strip(),
                             c=cifras(r[16:17]), s=cifras(r[17:18]), f=cifras(r[18:19])))
        out.append(dict(nombre=nombre, ficha=p, propio=fuente.texto(f[:11]).strip(),
                        campo=campo, lanz=lanz))
    return out


def main(argv):
    for e in equipos():
        print("## %s (p13:%04X)\n" % (e["nombre"], e["ficha"]))
        print("| | NAME | LR | 打率 | HR | RUN |\n|---|---|---|---|---|---|")
        for n, j in enumerate(e["campo"], 1):
            print("| %d | %s | %s | %s | %s | %s |" % (n, j["nombre"], j["lr"], j["avg"], j["hr"], j["run"]))
        print("\n| | NAME | LR | U/D | SPD | 防御率 | STM | C | S | F |\n|---|---|---|---|---|---|---|---|---|---|")
        for n, j in enumerate(e["lanz"], 1):
            print("| %d | %s | %s | %s | %s | %s | %s | %s | %s | %s |" % (
                n, j["nombre"], j["lr"], j["ud"], j["spd"], j["era"], j["stm"], j["c"], j["s"], j["f"]))
        print()


if __name__ == "__main__":
    main(sys.argv)
