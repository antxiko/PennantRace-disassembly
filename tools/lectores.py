#!/usr/bin/env python3
"""Los lectores de datos de The Pro Yakyuu Gekitotsu Pennant Race y sus
formatos, para tools/bloques.py.

Cada recorredor hace con los bytes lo mismo que la rutina del cartucho que
lo lee, y devuelve donde acaba. Las rutinas, con su direccion en NUESTRO
listado:

  p00:4B62  rachas a la VRAM (HL = destino, DE = origen; entra en p00:4B35):
            n == 0 acaba; n < 0x80 repite el byte siguiente n veces;
            n == 0x80 trae otro destino (2 bytes, p00:4B2D); n > 0x80 copia
            n & 0x7F bytes.
  p00:5659  rachas a la RAM (HL = destino, DE = origen): igual, pero 0x80 no
            trae nada (se salta).
  p00:4EA6  texto con la fuente de la VRAM, con los bancos 13-14-15 (p00:439C
            guarda el reparto y p00:43BB lo devuelve al acabar): [x y] y
            caracteres; 0xFF acaba, 0xFE trae otra posicion [x y], 0xFD es
            medio espacio, 0x0C y 0x0D son caracteres estrechos. p00:4EAB,
            p00:4EB0 y p00:4EBA lo mismo; p00:4EB5 sin la posicion delante
            (la pone quien llama en DE).
  p00:4C59  paleta: fichas de 3 bytes [color][rojo-azul][verde] (p00:4BF0)
            hasta un 0xFF.
  p00:4FA3  dibujos (HL = lista, DE = tabla de paletas): [n] y n fichas de 6
            bytes [paleta-tipo][VRAM lo hi][caracteres][puntero lo hi]. El
            nibble alto de la primera elige la paleta (palabra de la tabla de
            DE, p00:556D) y los bits 1-2 cuantos colores copia a 0xEC00 (2, 4
            u 8, p00:4FB5). El nibble bajo es el tipo (p00:4FDD): 0-1 a un bit
            por punto (8 bytes por caracter), 2-3 a dos (16) y 4-5 a tres
            (24); los impares se pintan al reves (p00:513B).
  p00:4AB7  copia BC bytes de HL a la VRAM (DE).
  p00:4E47  B caracteres de un bit por punto (8 bytes cada uno) a la VRAM.
  p00:4EFC  lista de caracteres de la fuente: 0xFF acaba, 0xFE [dy] baja de
            linea; los demas son caracteres.
"""
import bloques as B


# ---------------------------------------------------------------- formatos

def rachas(v, a):
    """p00:4B35. Devuelve el final (detras del 0)."""
    while True:
        n = v(a)
        a += 1
        if n == 0:
            return a
        if n < 0x80:
            a += 1
        elif n == 0x80:
            a += 2
        else:
            a += n & 0x7F


def rachas_ram(v, a):
    """p00:5659: como las rachas, pero 0x80 no trae destino."""
    while True:
        n = v(a)
        a += 1
        if n == 0:
            return a
        if n < 0x80:
            a += 1
        else:
            a += n & 0x7F


def texto(v, a, con_posicion=True):
    """p00:4EBE: [x y] y caracteres hasta 0xFF; 0xFE trae otro [x y]."""
    if con_posicion:
        a += 2
    while True:
        x = v(a)
        a += 1
        if x == 0xFF:
            return a
        if x == 0xFE:
            a += 2


def paleta(v, a):
    """p00:4C59: fichas de 3 bytes hasta un 0xFF."""
    while v(a) != 0xFF:
        a += 3
    return a + 1


def lista_fuente(v, a):
    """p00:4EFC: 0xFF acaba, 0xFE [dy]."""
    while True:
        x = v(a)
        a += 1
        if x == 0xFF:
            return a
        if x == 0xFE:
            a += 1


TAM_CARACTER = {0: 8, 1: 8, 2: 16, 3: 16, 4: 24, 5: 24}
COLORES = {0: 2, 2: 4, 4: 8, 6: 8}


def dibujos(v, lista, tabla, sitio):
    """p00:4FA3: declara la lista, la tabla de paletas, cada paleta y cada
    dibujo. Devuelve el final de la lista."""
    n = v(lista)
    paletas = {}
    for k in range(n):
        f = lista + 1 + 6 * k
        c, cuantos, ptr = v(f), v(f + 3), v.w(f + 4)
        tipo = c & 0x0F
        tam = TAM_CARACTER[tipo] * (cuantos or 256)
        B.declara(v, ptr, ptr + tam, "dibujo_%04X" % ptr,
                  "%d caracteres de 8x8 a %d bit%s por punto (%d bytes cada uno), ficha %d "
                  "de la lista 0x%04X (p00:4FA3, tipo %d en p00:4FDD)%s"
                  % (cuantos or 256, TAM_CARACTER[tipo] // 8, "" if tipo < 2 else "s",
                     TAM_CARACTER[tipo], k, lista, tipo,
                     "; se pinta al reves (p00:513B)" if tipo & 1 else ""),
                  sitio, F=TAM_CARACTER[tipo])
        p = c >> 4
        paletas[p] = max(paletas.get(p, 0), COLORES[c & 6])
    B.declara(v, lista, lista + 1 + 6 * n, "lista_%04X" % lista,
              "%d fichas de dibujo de 6 bytes [paleta-tipo][VRAM lo hi][caracteres][puntero] "
              "detras del numero (p00:4FA3, paletas en 0x%04X)" % (n, tabla), sitio, F=6)
    if paletas:
        cuantas = max(paletas) + 1
        B.declara(v, tabla, tabla + 2 * cuantas, "paletas_%04X" % tabla,
                  "%d punteros a los colores de cada paleta (p00:556D desde p00:4FB0), "
                  "para la lista 0x%04X" % (cuantas, lista), sitio, F="w%d" % min(cuantas, 8))
        for p, nc in sorted(paletas.items()):
            q = v.w(tabla + 2 * p)
            B.declara(v, q, q + nc, "colores_%04X" % q,
                      "%d colores (un nibble cada uno, ya en su sitio) que p00:4FC3 copia a "
                      "0xEC00: la paleta %d de la lista 0x%04X" % (nc, p, lista), sitio, F=nc)
    return lista + 1 + 6 * n


# ---------------------------------------------------------------- llamadas

def inmediato_antes(b, pc, op, n=8):
    """El inmediato del `ld rr,nn` (op = 0x01 BC, 0x11 DE, 0x21 HL) mas cercano
    por delante de pc en linea recta, o None."""
    t = B.trazador()
    previas = sorted(a for (bb, a) in t.arranques if bb == b and a < pc)[-n:]
    for a in reversed(previas):
        i = b * 0x2000 + (a - B.ORG[b])
        if B.ROM[i] == op:
            return B.ROM[i + 1] | B.ROM[i + 2] << 8
        if B.ROM[i] in (0xC9, 0xC3, 0x18, 0xCD):
            return None
    return None


def llamadas(lector):
    """[(b, pc, reparto, hl, de)] de cada call/jp a lector."""
    t = B.trazador()
    out = set()
    for (dst, b, pc, s, hl, de) in t.llamadas:
        if dst == lector:
            out.add((b, pc, tuple(s), hl, de))
    return sorted(out)


def por_textos():
    """Los impresores de texto ponen 13-14-15 ellos mismos (p00:439C): el
    puntero se lee con ese reparto, no con el de quien llama."""
    v = B.Ventana((13, 14, 15))
    for lector, pos in ((0x4EA6, True), (0x4EAB, True), (0x4EB0, True),
                        (0x4EBA, True), (0x4EB5, False)):
        for b, pc, s, hl, de in llamadas(lector):
            if hl is None or not 0x4000 <= hl < 0xC000:
                continue
            B.declara(v, hl, texto(v, hl, pos), "texto_%04X" % hl,
                      "texto (p00:%04X, con 13-14-15 puesto por p00:439C): %s"
                      "caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, "
                      "0xFD es medio espacio" % (lector, "[x y] y " if pos else ""),
                      "%s:%04X" % (B.nombre(b), pc))


def por_dibujos():
    for b, pc, s, hl, de in llamadas(0x4FA3):
        if hl is None or de is None:
            continue
        v = B.Ventana(s)
        dibujos(v, hl, de, "%s:%04X" % (B.nombre(b), pc))


def por_copias():
    for b, pc, s, hl, de in llamadas(0x4AB7):
        bc = inmediato_antes(b, pc, 0x01)
        if hl is None or bc is None or not 0x4000 <= hl < 0xC000:
            continue
        v = B.Ventana(s)
        B.declara(v, hl, hl + bc, "copia_%04X" % hl,
                  "%d bytes que p00:4AB7 copia tal cual a la VRAM 0x%04X" % (bc, de or 0),
                  "%s:%04X" % (B.nombre(b), pc), F=16)


def por_caracteres():
    for b, pc, s, hl, de in llamadas(0x4E47):
        bc = inmediato_antes(b, pc, 0x01)
        if hl is None or bc is None or not 0x4000 <= hl < 0xC000:
            continue
        v = B.Ventana(s)
        n = bc >> 8 or 256
        B.declara(v, hl, hl + 8 * n, "caracteres_%04X" % hl,
                  "%d caracteres de 8x8 a un bit por punto que p00:4E47 pinta en la VRAM "
                  "0x%04X con el color %d" % (n, de or 0, bc & 0xFF),
                  "%s:%04X" % (B.nombre(b), pc), F=8)


def todo():
    B.por_lector(0x4B62, "DE", rachas, "rachas",
                 "rachas a la VRAM (p00:4B62 -> p00:4B35)")
    B.por_lector(0x5659, "DE", rachas_ram, "rachas_ram",
                 "rachas a la RAM 0xE800 (p00:5659)")
    por_textos()
    B.por_lector(0x4C59, "HL", paleta, "paleta",
                 "paleta (p00:4C59): fichas de 3 bytes [color][rojo-azul][verde] hasta 0xFF",
                 F=3)
    B.por_lector(0x4EFC, "HL", lista_fuente, "fuente",
                 "caracteres de la fuente (p00:4EFC): 0xFF acaba, 0xFE [dy] baja de linea")
    por_dibujos()
    por_copias()
    por_caracteres()
