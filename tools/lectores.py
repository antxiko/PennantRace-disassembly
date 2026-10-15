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


def sonido():
    """Los bancos 4-5-6: la tabla de sonidos, sus cabeceras y lo que el motor
    lee al tocar cada uno (tools/partituras.py lo ejecuta y lo apunta en
    work/partituras.json)."""
    import json
    import os
    ruta = os.path.join(B.RAIZ, "work", "partituras.json")
    if not os.path.exists(ruta):
        import partituras
        partituras.main(["", "json", ruta])
    leidos = json.load(open(ruta))
    v = B.Ventana((4, 5, 6))
    n_sonidos = (v.w(0x600C) - 0x600C) // 2
    B.declara(v, 0x600C, 0x600C + 2 * n_sonidos, "sonidos",
              "%d punteros, uno por sonido del 1 al 0x%02X, a su cabecera (p06:B204: "
              "0x600A + 2 x numero)" % (n_sonidos, n_sonidos), "p06:B204", F="w8")
    cabeceras = set()
    inicios = {}
    for n in range(1, n_sonidos + 1):
        h = v.w(0x600A + 2 * n)
        mascara = v(h)
        canales = [k for k in range(8) if mascara & (0x80 >> k)]
        fin = h + 2 + 2 * len(canales)
        cabeceras.update(range(h, fin))
        for j, k in enumerate(canales):
            inicios.setdefault(v.w(h + 2 + 2 * j), set()).add(n)
        B.declara(v, h, fin, "cabecera_%04X" % h,
                  "cabecera de sonido (p06:B211): [canales %02X][prioridad %02X] y %d "
                  "punteros, uno por canal encendido (bit 7 = el primero de 0xEE00)"
                  % (mascara, v(h + 1), len(canales)), "p06:B217", F=2)
    quien = {}
    for n, ts in leidos.items():
        for b, i, f in ts:
            for x in range(i, f):
                quien.setdefault((b, x), set()).add(int(n))
    org = {4: 0x6000, 5: 0x8000, 6: 0xA000}
    tramo = None
    tramos = []
    for (b, x) in sorted(quien):
        if b not in org or x in cabeceras or 0x600C <= x < 0x600C + 2 * n_sonidos:
            continue
        a = x if b != 5 else x
        if tramo and tramo[0] == b and tramo[2] == a and a not in inicios:
            tramo[2] += 1
            tramo[3] |= quien[(b, x)]
        else:
            tramo = [b, a, a + 1, set(quien[(b, x)])]
            tramos.append(tramo)
    for b, i, f, ss in tramos:
        lista = ", ".join("0x%02X" % k for k in sorted(ss)[:12]) + (
            " y %d mas" % (len(ss) - 12) if len(ss) > 12 else "")
        que = "partitura de canal" if i in inicios else "datos de sonido"
        B.declara(B.Ventana((4, 5, 6)), i, f, "%s_%04X" % ("partitura" if i in inicios else "sonido", i),
                  "%s (ordenes 0xD0-0xFE de p06:B92F, notas por debajo, 0xFF acaba) que "
                  "lee el motor de p06 al tocar los sonidos %s (tools/partituras.py)"
                  % (que, lista), "p06:B51E", F=16)


def todo():
    sonido()
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
