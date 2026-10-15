#!/usr/bin/env python3
"""Los textos del juego, sacados de la ROM.

Las rutinas de texto de p00 (texto 0x4EA6, texto_c0 0x4EAB, 0x4EB0 y
texto_en_de 0x4EB5) ponen los bancos 13-14-15 y leen: [x y] (salvo
texto_en_de), luego caracteres de la fuente (tools/fuente.py) hasta 0xFF;
0xFE trae otra posicion [x y] y 0xFD es medio espacio (p00:4EC0).

Se recogen las direcciones que el codigo carga en HL justo antes de llamar a
esas rutinas, y las de las tablas de punteros que se leen igual
(TABLAS). Uso: textos.py [md]
"""
import os
import re
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
sys.path.insert(0, AQUI)
import fuente  # noqa: E402

ROM = open(os.path.join(RAIZ, "pennantrace.rom"), "rb").read()
CON_XY = {0x4EA6, 0x4EAB, 0x4EB0}
# p00:4EBA lee el texto sin poner los bancos 13-14-15: con los del que llama
CON_XY_AQUI = {0x4EBA}
TRIO = {1: 1, 2: 1, 3: 1, 13: 13, 14: 13, 15: 13}
# los textos de las pantallas de PENNANT, con los kanji de p00:52D9 / p00:52C7
JUEGO = {0x6412: "B82", 0xB071: "BA0", 0xB07B: "BA0", 0xB081: "BA0", 0xB08F: "BA0",
         0xB094: "BA0", 0xB099: "BA0", 0xB09E: "BA0"}
SIN_XY = {0x4EB5}
# tablas de punteros a textos: (direccion, cuantos)
TABLAS = [(0x6828, 3), (0x6CB4, 5), (0xA6BE, 4), (0xA6C6, 4), (0x8539, 7)]
# textos que se pintan uno detras de otro: (el primero, cuantos). El menu de
# modos (p01:6543): 5 seguidos y MEDIA SELECT con disco y Game Master 2
SEGUIDOS = [(0x7D8F, 6)]


def lee(a, trio=13):
    """El byte de 0x6000-0xBFFF con los bancos trio, trio+1, trio+2."""
    return ROM[(trio + (a - 0x6000) // 0x2000) * 0x2000 + (a & 0x1FFF)]


LEE = lee


def descodifica(a, con_xy=True, trio=13):
    """[(x, y, codigos)] y la direccion del final."""
    def lee(d):
        return LEE(d, trio)
    trozos = []
    if con_xy:
        x, y = lee(a), lee(a + 1)
        a += 2
    else:
        x, y = None, None
    cod = []
    while True:
        c = lee(a)
        a += 1
        if c == 0xFF:
            break
        if c == 0xFE:
            trozos.append((x, y, cod))
            x, y, cod = lee(a), lee(a + 1), []
            a += 2
            continue
        cod.append(c)
        if len(cod) > 200:
            break
    trozos.append((x, y, cod))
    return trozos, a


def llamadas():
    """{direccion del texto: (con_xy, [donde se usa])}"""
    out = {}
    for b in (0, 1, 2, 3, 13, 14, 15):
        ruta = os.path.join(RAIZ, "src", "pennantrace_p%02d.asm" % b)
        hl, donde = None, None
        for ln in open(ruta, encoding="utf-8"):
            m = re.match(r"^\t([a-z][^\t;]*?)\s*;([0-9a-f]{4})", ln)
            if not m:
                continue
            ins, a = m.group(1), int(m.group(2), 16)
            mm = re.match(r"ld hl,0([0-9a-f]{4})h$", ins)
            if mm:
                hl, donde = int(mm.group(1), 16), a
                continue
            mm = re.match(r"(?:call|jp)\s+(?:\w+,)?(?:0([0-9a-f]{4})h|(texto\w*))$", ins)
            if mm and hl is not None:
                d = int(mm.group(1), 16) if mm.group(1) else {"texto": 0x4EA6, "texto_c0": 0x4EAB, "texto_en_de": 0x4EB5}.get(mm.group(2))
                if d in CON_XY or d in SIN_XY or d in CON_XY_AQUI:
                    if 0x6000 <= hl < 0xC000:
                        trio = TRIO.get(b, 13) if d in CON_XY_AQUI else 13
                        e = out.setdefault((trio, hl), [d not in SIN_XY, []])
                        e[1].append("p%02d:%04X" % (b, donde))
                hl = None
            elif not ins.startswith("ld ") and not ins.startswith("push"):
                hl = None
    for t, n in TABLAS:
        for k in range(n):
            p = lee(t + 2 * k) | lee(t + 2 * k + 1) << 8
            if not 0x6000 <= p < 0xC000:
                print("tabla %04X: la entrada %d (%04X) no es un texto" % (t, k, p), file=sys.stderr)
                continue
            e = out.setdefault((13, p), [True, []])
            e[1].append("tabla %04X" % t)
    for primero, n in SEGUIDOS:
        t = primero
        for k in range(n):
            out.setdefault((13, t), [True, []])[1].append("seguidos %04X" % primero)
            t = descodifica(t)[1]
    return out


def main(argv):
    todos = llamadas()
    filas = []
    for trio, a in sorted(todos):
        con_xy, donde = todos[(trio, a)]
        trozos, fin = descodifica(a, con_xy, trio)
        partes = []
        for x, y, cod in trozos:
            pos = "" if x is None else "(%d,%d) " % (x, y)
            partes.append(pos + fuente.texto(cod, JUEGO.get(a, "")))
        filas.append((trio + (a - 0x6000) // 0x2000, a, " / ".join(partes), ", ".join(sorted(set(donde)))))
    if "md" in argv:
        print("| texto | dónde | se pinta desde |\n|---|---|---|")
        for b, a, t, d in filas:
            print("| %s | p%02d:%04X | %s |" % (t.replace("|", "/"), b, a, d))
    else:
        for b, a, t, d in filas:
            print("p%02d:%04X  %s   [%s]" % (b, a, t, d))


if __name__ == "__main__":
    main(sys.argv)
