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
    # las tablas del motor: 0x6346 (orden 0xF8, p06:BB07) y las seis de bateria
    # que elige p06:B65B. Esta zona se declara por su estructura: cada destino
    # hasta el siguiente.
    tablas = {0x6346: (72, "p06:BB07", "envolventes (orden 0xF8 n, p06:BB04: palabra n)"),
              0x6656: (12, "p06:B67D", "bateria"), 0x6903: (12, "p06:B681", "bateria"),
              0x6A8A: (12, "p06:B692", "bateria"), 0x6B60: (12, "p06:B696", "bateria"),
              0x6BEA: (12, "p06:B6A7", "bateria"), 0x6C03: (12, "p06:B6AB", "bateria")}
    zona = (0x6346, 0x6C1C)
    destinos = {}
    for t, (n, sitio, que) in tablas.items():
        B.declara(v, t, t + 2 * n, "tabla_%04X" % t, "%d punteros de %s del motor de sonido"
                  % (n, que), sitio, F="w%d" % min(n, 8))
        for k in range(n):
            destinos.setdefault(v.w(t + 2 * k), []).append((t, k))
    bordes = sorted(set(destinos) | set(tablas) | {t + 2 * n for t, (n, _, _) in tablas.items()}
                    | {zona[1]})
    for d in sorted(destinos):
        f = min(x for x in bordes if x > d)
        quien_t = ", ".join("0x%04X[%d]" % tk for tk in destinos[d][:4])
        B.declara(v, d, f, "motor_%04X" % d, "lo apuntan las entradas %s; el tamano llega hasta "
                  "el siguiente destino o tabla, no sale de recorrerlo" % quien_t,
                  tablas[destinos[d][0][0]][1], F=16)
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
        if b == 4 and zona[0] <= x < zona[1]:
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


def banco10_11():
    """Lo que leen las rutinas de p00:5689-5761 y p00:53E7-5403 (10-11-12)."""
    v = B.Ventana((10, 11, 12))
    # p00:56C4: tabla de 4 punteros (0xE1EB & 3) a listas de 7 dibujos de 128
    # bytes que p00:56F2 copia a la VRAM 0x7C80, 0x7D00...
    B.declara(v, 0x6FBE, 0x6FC6, "juegos_de_7", "4 punteros (p00:56D5, indice 0xE1EB & 3) "
              "a listas de 7 dibujos de 128 bytes", "p00:56D2", F="w4")
    hechos = set()
    for k in range(4):
        lst = v.w(0x6FBE + 2 * k)
        B.declara(v, lst, lst + 14, "juego_%d" % k, "7 punteros a dibujos de 128 bytes (16x16 "
                  "a 4 bits) que p00:56F2 copia a la VRAM 0x7C80 + 0x80 x n (juego %d de "
                  "0x6FBE)" % k, "p00:56DB", F="w7")
        for j in range(7):
            q = v.w(lst + 2 * j)
            if q not in hechos:
                hechos.add(q)
                B.declara(v, q, q + 0x80, "dibujo128_%04X" % q, "128 bytes (16x16 a 4 bits "
                          "por punto) que p00:56F2 copia tal cual a la VRAM (p00:4AB7, BC = "
                          "0x80)", "p00:56F2", F=16)
    # p00:5761: fichas de 11 bytes, una por 0xE1F6 (p00:5871, p02:8871, p02:88A0)
    for k in range(7):
        a = 0x6000 + 11 * k
        B.declara(v, a, a + 11, "ficha11_%d" % k,
                  "ficha %d de 11 bytes (p00:5761: 0x6000 + 11 x 0xE1F6): [bits altos: "
                  "color; bajos: cuantos] y un byte por cada uno que p00:57AD convierte en "
                  "coordenadas; las 7 llenan el hueco hasta las rachas de 0x604D" % k,
                  "p00:577A", F=11)
    # p00:53E7 / 53F4 / 5403: tres dibujos de sprite a la VRAM 0xFE00, 0xFE80 y
    # 0xFF00; el BC lo trae quien salta (p02:9680, 9690, 96A0)
    for a, d, sitio in ((0x782D, 0xFE00, "p00:53F0"), (0x78AD, 0xFE80, "p00:53FD"),
                        (0x792D, 0xFF00, "p00:5411")):
        B.declara(v, a, a + 0x80, "sprites_%04X" % a,
                  "128 bytes de dibujos de sprite que p00:4AB7 copia a la VRAM 0x%04X; los "
                  "tres seguidos llenan el hueco hasta las rachas de 0x79AD" % d, sitio, F=16)
    # p00:5689 / 5694: 0x280 bytes a la VRAM 0x7880 (p00:5697); el segundo pasa
    # del banco 10 al 11 (10-11-12 seguidos en 0x6000-0xBFFF)
    for a in (0x7C4B, 0x7ECB):
        f = a + 0x280
        B.declara(v, a, min(f, 0x8000), "copia280_%04X" % a,
                  "640 bytes que p00:5697 copia a la VRAM 0x7880 (BC = 0x280)%s"
                  % ("; sigue en el banco 11 hasta 0x%04X" % f if f > 0x8000 else ""),
                  "p00:569D", F=16)
        if f > 0x8000:
            B.declara(v, 0x8000, f, "copia280_%04X_cola" % a,
                      "lo que queda de los 640 bytes de 0x%04X (banco 10), que p00:5697 "
                      "copia a la VRAM 0x7880" % a, "p00:569D", F=16)
    # p00:5716: dibujos de 64 bytes, A = 0..0x0D (p01:6C47 0x0B, p01:6CA3 0x0C,
    # p00:53C4 y p01:70EF 0x0D)
    for k in range(14):
        a = 0x8759 + 64 * k
        B.declara(v, a, a + 64, "dibujo64_%02d" % k,
                  "dibujo %d de 64 bytes que p00:5716 (0x8759 + 64 x A) copia a la VRAM "
                  "0xFFC0" % k, "p00:5724", F=16)
    B.por_lector(0x4B2D, "DE", lambda v, a: rachas(v, a + 2), "rachas_destino",
                 "[destino lo hi] y rachas a la VRAM (p00:4B2D -> p00:4B35)")


def dibujos_a_mano():
    """p00:5153-51B0: el HL de p00:4FA3 se pone antes de un salto a p00:5177
    (que pone DE = 0x51B2) y el trazador no lo lleva."""
    for trio, hls, sitio in (((13, 14, 15), (0x7925, 0xBA9B, 0xBA8E), "p00:5174"),
                             ((10, 11, 12), (0x96EE, 0x94BB, 0x94AE, 0x9401, 0x93F4,
                                             0x95A8, 0x95BB), "p00:51AD")):
        v = B.Ventana(trio)
        for hl in hls:
            dibujos(v, hl, 0x51B2, sitio)


def banco11_fichas():
    """p00:5877-5926: fichas de sprite de 4 bytes [y][x][dibujo][color] que se
    copian a los atributos de 0xE100 y 0xE150."""
    v = B.Ventana((10, 11, 12))
    for t, cual in ((0x9911, "sin 0xE1FE"), (0x991F, "con 0xE1FE")):
        B.declara(v, t, t + 14, "formaciones_%04X" % t,
                  "7 punteros (uno por 0xE1F6, p00:5889) a listas de fichas de sprite, %s "
                  "(p00:587A / p00:5883)" % cual, "p00:5889", F="w7")
        for k in range(7):
            q = v.w(t + 2 * k)
            n = v(q)
            B.declara(v, q, q + 1 + 4 * n, "formacion_%04X" % q,
                      "[n] y n fichas de sprite de 4 bytes [y][x][dibujo][color] que p00:5891 "
                      "copia a 0xE100 (la y y la x se suman a 0xE1F9 y 0xE1F5)", "p00:5891",
                      F=4)
    for a, n, sitio in ((0x9D12, 20, "p00:58CB"), (0x9D62, 20, "p00:58D4"),
                        (0x9F3A, 2, "p00:58F7"), (0x9F42, 2, "p00:58FD")):
        B.declara(v, a, a + 4 * n, "fichas_%04X" % a,
                  "%d fichas de sprite de 4 bytes [y][x][dibujo][color] (p00:%s, B = %d)"
                  % (n, "5891" if n == 20 else "5929", n), sitio, F=4)
    B.declara(v, 0x9DB2, 0x9DBA, "fichas_por_juego", "4 punteros (0xE1EB & 3, p00:5910) a "
              "6 grupos de 4 fichas de sprite, uno por 0xE1D3", "p00:5910", F="w4")
    for k in range(4):
        q = v.w(0x9DB2 + 2 * k)
        B.declara(v, q, q + 0x60, "fichas_%04X" % q,
                  "6 grupos (0xE1D3 x 16, p00:591E) de 4 fichas de sprite de 4 bytes "
                  "[y][x][dibujo][color] que p00:5929 copia a 0xE158 (juego %d de 0x9DB2)" % k,
                  "p00:5923", F=4)


def banco8_9():
    """El fondo en tiras (p00:5B76) y las tablas de p00:59EB-5F95 (7-8-9)."""
    v = B.Ventana((7, 8, 9))
    B.declara(v, 0x9432, 0x9438, "tiras_de_fondo", "3 punteros (0xE1A6, p00:5B7F) a las "
              "listas de mosaicos del fondo", "p00:5B7C", F="w3")
    for k, (lst, bases) in enumerate(((0x9438, "0x9B28"), (0x94B8, "0x95B8 (y 0x9A58 desde "
                                                                      "la posicion 0x70)"),
                                      (0x9538, "0xA088"))):
        B.declara(v, lst, lst + 0x80, "tira_%d" % k,
                  "128 numeros de mosaico (0xEC41 avanza 8 por llamada, p00:5BAE); cada uno "
                  "x 16 + %s (p03:B317 pone la base en 0xEC43)" % bases, "p00:5B90", F=16)
    for ini, fin, base, cual in ((0x95B8, 0x9A58, 0x95B8, "0xE1A6 = 1, posiciones 0-0x6F"),
                                 (0x9A58, 0x9B28, 0x9A58, "0xE1A6 = 1, desde la 0x70"),
                                 (0x9B28, 0xA088, 0x9B28, "0xE1A6 = 0"),
                                 (0xA088, 0xA5D8, 0xA088, "0xE1A6 = 2")):
        partes = [(ini, min(fin, 0xA000)), (max(ini, 0xA000), fin)]
        for i, f in partes:
            if i >= f:
                continue
            B.declara(v, i, f, "mosaicos_%04X" % i,
                      "%d mosaicos de 16 bytes (4 filas de 4 bytes: 8x4 puntos a 4 bits, "
                      "p00:5BB9) desde la base 0x%04X (%s); los indices de la tira llegan "
                      "justo hasta 0x%04X%s" % ((f - i) // 16, base, cual, fin,
                                               "; sigue en el banco 9" if f == 0xA000 and fin > f
                                               else ""), "p00:5BBD", F=16)
    # p00:5A64: 0xBA2A + 0xE1FF (0, 0x10 ... 0x50, p00:5A13) + (R & 0x0F)
    B.declara(v, 0xBA2A, 0xBA8A, "efecto_al_azar", "6 filas de 16 bytes: p00:5A64 lee 0xBA2A + "
              "0xE1FF (0x00-0x50, p00:5A28) + (R & 0x0F)", "p00:5A6D", F=16)
    B.declara(v, 0xBA8A, 0xBA90, "tablas_de_fuerza", "3 punteros (IX+7 - 2, p00:59FF) a "
              "tablas de punteros", "p00:5A01", F="w3")
    for t, n in ((0xBA90, 5), (0xBA9A, 5), (0xBAA4, 7)):
        B.declara(v, t, t + 2 * n, "fuerzas_%04X" % t, "%d punteros (IX+8 >> 1, p00:5A0A) a "
                  "filas de 8 bytes que p00:5A4C lee con 8 - (0xE1FB - 1)" % n, "p00:5A0C",
                  F="w%d" % n)
    B.declara(v, 0xBAB2, 0xBB1A, "filas_de_fuerza", "13 filas de 8 bytes: las apuntan las "
              "tablas de 0xBA90-0xBAB1 y 0xBAB2 la usa tal cual p00:59F1 (0xED2C)",
              "p00:5A4F", F=8)
    B.declara(v, 0xBB1A, 0xBBC4, "valores_bb1a", "85 palabras: p00:5BCC devuelve en DE la "
              "del indice A (p03:AB23: la mitad de lo que pasa de 0x50)", "p00:5BD2", F="w8")
    B.declara(v, 0xBBC4, 0xBC05, "valores_bbc4", "65 bytes: p00:5BD9 devuelve el de 0xE1F0",
              "p00:5BDF", F=16)
    B.declara(v, 0xBC05, 0xBC45, "rachas_por_dibujo", "32 punteros (uno por dibujo de sprite, "
              "p00:5B50) a rachas que p00:5659 descomprime en 0xDEF0 + 16 x n", "p00:5B54",
              F="w8")
    for k in range(32):
        q = v.w(0xBC05 + 2 * k)
        B.declara(v, q, rachas_ram(v, q), "rachas_%04X" % q, "rachas a la RAM (p00:5659): "
                  "el dibujo de sprite %d de 0xBC05" % k, "p00:5B5C", F=16)
    B.declara(v, 0xBE96, 0xBF96, "direcciones", "256 bytes: p00:5F35 lee 0xBE96 + (dx & "
              "0xF0) + dy >> 4: la direccion de un desplazamiento", "p00:5F32", F=16)
    B.declara(v, 0xBF96, 0xBFD6, "senos", "64 bytes: p00:5ECE y p00:5F88 leen el n y el "
              "0x3F - n", "p00:5ECA", F=16)
    B.declara(v, 0xBFDE, 0xBFFE, "colores_de_equipo", "16 colores de 2 bytes [rojo-azul]"
              "[verde] que p00:5525 y p00:5558 ponen con p00:4BF0 (indice 0xD70A & 0x0F)",
              "p00:5520", F=2)


def textos_seguidos(v, a, n, sitio, nota):
    """n textos [x y]...0xFF seguidos desde a; devuelve el final."""
    ini = a
    for _ in range(n):
        a = texto(v, a)
    B.declara(v, ini, a, "textos_%04X" % ini, "%d textos seguidos ([x y] y caracteres hasta "
              "0xFF; 0xFE trae otra posicion) %s" % (n, nota), sitio)
    return a


def tabla_textos(v, t, n, sitio, nota):
    B.declara(v, t, t + 2 * n, "textos_%04X" % t, "%d punteros a textos %s" % (n, nota), sitio,
              F="w%d" % n)
    for k in range(n):
        q = v.w(t + 2 * k)
        B.declara(v, q, texto(v, q), "texto_%04X" % q, "texto %d de la tabla 0x%04X ([x y] y "
                  "caracteres hasta 0xFF), que se pinta con p00:4EA6" % (k, t), sitio)


def banco13():
    v = B.Ventana((13, 14, 15))
    B.declara(v, 0x62D7, 0x6319, "nombres_de_equipo", "los 6 nombres de equipo, 11 letras en "
              "ASCII cada uno (FLYERS, RIDERS, KOBE LINES, BRENDS, PROGRAMS, DARKS): p13:6028 "
              "copia los 0x42 bytes a 0xDAAE", "p13:6028", F=11)
    B.declara(v, 0x731F, 0x732B, "fichas_de_equipo", "6 punteros (uno por equipo, p13:6F35) a "
              "su ficha de 255 bytes", "p13:6F32", F="w6")
    for k in range(6):
        q = v.w(0x731F + 2 * k)
        B.declara(v, q, q + 255, "equipo_%d" % k, "ficha del equipo %d: 255 bytes que p13:6F44 "
                  "copia con ldir (BC = 0xFF) a donde apunta 0xE340: la cabecera y los "
                  "jugadores, cada uno con su nombre en la fuente" % k, "p13:6F44", F=16)
    tabla_textos(v, 0x6828, 3, "p13:681E", "elegidos por 0xD759 (p13:6825 salta a p00:4EA6)")
    tabla_textos(v, 0x6CB4, 5, "p13:6CAA", "elegidos por 0xD759 (p13:6CB1 salta a p00:4EA6)")
    B.declara(v, 0x689C, 0x68A8, "pares_689C", "6 pares de bytes (0xD74F x 2, p13:6889): el "
              "primero va a la VRAM 0xF600 y el segundo a la 0xF601 (p00:4AE3)", "p13:6885", F=2)
    B.declara(v, 0x69ED, 0x6A0D, "pares_69ED", "16 pares de bytes ((A - 0xD751) x 2, p13:69CE) "
              "que p13:69DC escribe en la VRAM 0xF600/0xF601", "p13:69CA", F=2)
    B.declara(v, 0x6AAB, 0x6AB5, "diez_espacios", "10 espacios en ASCII que p15:A651 pinta "
              "(B = 10): borra un nombre", "p13:6743", F=10)
    B.declara(v, 0x6BD8, 0x6BDC, "inicio_e194", "4 bytes que p13:6BAA copia a 0xE194",
              "p13:6BA7", F=4)
    B.declara(v, 0x6C68, 0x6C6E, "columnas_6C68", "6 bytes, uno por 0xD758 (p13:6C4F): la x "
              "de la flecha (con D = 0x48)", "p13:6C4C", F=6)
    B.declara(v, 0x713E, 0x7143, "penan", "'PENAN' en ASCII: p13:71C0 copia 5 bytes a la ficha "
              "de 0xD280", "p13:712B", F=5)
    for a, sitio in ((0x7164, "p13:7107"), (0x7189, "p13:7173"), (0x7219, "p13:7128")):
        B.declara(v, a, a + 4, "cola_%04X" % a, "4 bytes que p13:71CD copia (BC = 4) detras del "
                  "nombre en la ficha de 0xD280", sitio, F=4)
    textos_seguidos(v, 0x7BBA, 2, "p13:6D94", "antes de 0x7BEA")
    textos_seguidos(v, 0x7C33, 3, "p03:B6C1", "(DE = 0x7C33)")
    textos_seguidos(v, 0x7C8A, 2, "p00:483C", "(HL = 0x7C8A)")
    textos_seguidos(v, 0x7DA9, 4, "p00:4559", "(DE = 0x7DA9 / 0x7DB4 segun A)")


def sueltos():
    """Lo que queda: cada cosa con su lector, y lo que no tiene lector a la
    vista dicho asi."""
    v = B.Ventana((13, 14, 15))
    for a, sitio in ((0x7E49, "p01:6446"), (0x7E4E, "p01:644B")):
        B.declara(v, a, texto(v, a), "texto_%04X" % a, "texto ([x y] y caracteres hasta 0xFF): "
                  "p01:644E lo pinta con p00:4EA6", sitio)
    for a, sitio in ((0xB23F, "p03:B518"), (0xB24F, "p03:B510")):
        B.declara(v, a, a + 16, "copia16_%04X" % a, "16 bytes que p00:5DA1 copia (BC = 0x10) "
                  "con 13-14-15 puesto a 0xE231 / 0xE241", sitio, F=16)
    v1 = B.Ventana((10, 11, 12))
    B.declara(v1, 0x8499, 0x8719, "dibujos128_8499", "5 dibujos de 128 bytes: p00:572E lee "
              "0x8499 + 128 x A y los copia a la VRAM 0xFAC0; p01:6CF8 solo pide el 0 y el 1 "
              "(A = el bit alto de H)", "p00:5731", F=16)
    v6 = B.Ventana((4, 5, 6))
    B.declara(v6, 0xB59E, 0xB5AB, "notas", "13 divisores de nota (de do a do): p06:B569 lee "
              "0xB59E + A, pero p06:B565 corta en 0x0C y el 13.o no se lee", "p06:B569", F=13)
    B.declara(v6, 0xB944, 0xB982, "ordenes", "31 destinos, uno por orden de la partitura de 0xE0 "
              "a 0xFE (p06:B937: 0xB944 + 2 x (orden & 0x1F); jp (hl) en p06:B943)", "p06:B937",
              F="w8")


def sin_lector():
    """Lo que no lee nadie a la vista, dicho asi, y los rellenos."""
    v4 = B.Ventana((4, 5, 6))
    B.declara(v4, 0x7AEE, 0x7AEF, "cierre_7AEE", "0xFF de cierre que no se alcanza: la "
              "partitura de delante acaba saltando", "nadie", F=1)
    for a in (0xA956, 0xA978):
        B.declara(v4, a, texto(v4, a, False) if False else a + 33, "partitura_%04X" % a,
                  "33 bytes con forma de partitura (0xFE 0x02 y ordenes 0xE0-0xFE) que no apunta "
                  "ninguna cabecera ni ningun salto de los 72 sonidos: SIN LECTOR A LA VISTA",
                  "nadie", F=16)
    for trio, a, f, tabla in (((7, 8, 9), 0x73C8, 0x73CA, 0x73C4), ((7, 8, 9), 0x75CF, 0x75D1, 0),
                              ((7, 8, 9), 0xA5F4, 0xA5F8, 0xA5D8), ((7, 8, 9), 0xB74B, 0xB74F, 0xB747),
                              ((10, 11, 12), 0xA039, 0xA03F, 0xA01F),
                              ((10, 11, 12), 0xA80D, 0xA80F, 0xA7EF),
                              ((10, 11, 12), 0xAD60, 0xAD66, 0xAD58)):
        B.declara(B.Ventana(trio), a, f, "paletas_sobran_%04X" % a,
                  "%d punteros mas de la tabla de paletas%s: ninguna ficha de la lista pide ese "
                  "numero de paleta (p00:4FB0)" % ((f - a) // 2, " de 0x%04X" % tabla if tabla
                                                  else " de delante"), "nadie", F="w%d" % ((f - a) // 2))
    v7 = B.Ventana((7, 8, 9))
    B.declara(v7, 0xB9CA, 0xB9DA, "dos_caracteres", "16 bytes entre las dos tiras de caracteres "
              "de un bit (0xB942, 17 caracteres, y 0xB9DA): dos caracteres mas que no pinta "
              "nadie: SIN LECTOR A LA VISTA", "nadie", F=8)
    B.declara(v7, 0xBFD6, 0xBFDE, "tras_los_senos", "8 bytes detras de los 64 de 0xBF96: SIN "
              "LECTOR A LA VISTA", "nadie", F=8)
    B.declara(v7, 0xBFFE, 0xC000, "relleno_ff", "2 bytes a 0xFF hasta el final del banco: "
              "relleno", "nadie", F=2)
    v = B.Ventana((13, 14, 15))
    for a, f in ((0x7CC8, 0x7CD1), (0x7E11, 0x7E1E), (0x7E78, 0x7E86), (0xB68C, 0xB693)):
        B.declara(v, a, f, "texto_suelto_%04X" % a, "con forma de texto ([x y], caracteres y "
                  "0xFF), pero ninguna instruccion ni palabra lo apunta: SIN LECTOR A LA VISTA",
                  "nadie")
    B.declara(v, 0x92C8, 0x9348, "datos_92C8", "128 bytes (pares 0x00/0x0F y 0xFF: parecen "
              "mascaras) que no apunta nadie: SIN LECTOR A LA VISTA", "nadie", F=16)
    B.declara(v, 0xBE27, 0xBE42, "relleno_ff", "27 bytes a 0xFF entre los textos: relleno",
              "nadie", F=16)
    B.declara(B.Ventana((1, 2, 3)), 0xAD5C, 0xAD60, "datos_AD5C", "4 bytes detras de un ret "
              "(0x38 0x78 0x00 0x00): SIN LECTOR A LA VISTA", "nadie", F=4)


def todo():
    sin_lector()
    sueltos()
    banco13()
    banco8_9()
    sonido()
    banco10_11()
    dibujos_a_mano()
    banco11_fichas()
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
