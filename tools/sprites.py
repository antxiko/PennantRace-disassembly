#!/usr/bin/env python3
"""Los sprites del Pro Yakyuu: el pintor del V9938 (modo de sprites 2, el de
SCREEN 5) y lo que el juego pone en sus tablas para cada jugador.

Las tablas, en la VRAM (R#5 = 0xEF, R#11 = 1, R#6 = 0x1F):
  0xF600  32 atributos [y][x][dibujo][indice]; y = 216 acaba la lista
  0xF400  los colores: 16 bytes por sprite, uno por linea
          (bit 7 EC: 32 puntos a la izquierda; bit 6 CC: hace OR con los de
          delante; bits 0-3 el color)
  0xF800  los dibujos de 16 x 16 (32 bytes: las dos columnas de 8)
El juego lleva los atributos en la RAM 0xE100; el cuarto byte NO es el color
sino un indice: p00:5B1F descomprime la racha p09:BC05 + 2 x indice en los
16 colores de ese sprite (0xDF00 + 16 n) y p00:422A copia todo a la VRAM.

El bateador (p02:8860): p00:5677 descomprime su almacen de dibujos en la
pagina 0, lineas 0xD8 en adelante (VRAM 0x6C00: las rachas de p10:604D y 640
bytes de p10:7C4B; o p10:6808 y p10:7ECB si batea por la izquierda), y cada
formacion (0xE1F6, 0-6) copia de alli medias lineas de 64 bytes a los dibujos
de sprite (p00:5761, la ficha de 11 bytes de p10:6000) y pone sus atributos
(p00:5877: p11:9911, o p11:991F por la izquierda, mas la x 0xE1F5 y la y
0xE1F9).
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from vram import byte, palabra, rom, rachas_a_ram  # noqa: E402

ATRIBUTOS, COLORES, DIBUJOS = 0xF600, 0xF400, 0xF800


def pinta(v, imagen, paleta, alto=212):
    """Pinta los sprites de la VRAM v (bytes) sobre imagen (lista de filas de
    indices de color, 256 de ancho): por cada punto manda el primer grupo
    (un sprite sin CC y los CC que le siguen) que tenga algo, con el OR de los
    colores de los que lo tengan. Sin el limite de 8 por linea."""
    sprites = []
    for n in range(32):
        y, x, d = v[ATRIBUTOS + 4 * n], v[ATRIBUTOS + 4 * n + 1], v[ATRIBUTOS + 4 * n + 2]
        if y == 216:
            break
        sprites.append((n, y, x, d & 0xFC))
    for fila in range(alto):
        grupos = []                         # [[(n, x, bits, color)], ...]
        for n, y, x, d in sprites:
            linea = (fila - y - 1) & 0xFF
            if linea >= 16:
                continue
            c = v[COLORES + 16 * n + linea]
            dib = DIBUJOS + 8 * d
            bits = v[dib + linea] << 8 | v[dib + 16 + linea]
            xx = x - 32 if c & 0x80 else x
            if c & 0x40 and grupos:
                grupos[-1].append((xx, bits, c & 0x0F))
            elif not c & 0x40:
                grupos.append([(xx, bits, c & 0x0F)])
        if not grupos:
            continue
        for px in range(256):
            for g in grupos:
                col, hay = 0, False
                for xx, bits, c in g:
                    k = px - xx
                    if 0 <= k < 16 and bits & (0x8000 >> k):
                        col |= c
                        hay = True
                if hay:
                    if col:
                        imagen[fila][px] = col
                    break
    return imagen


def colores_de(indice):
    """p00:5B1F: los 16 colores de linea del indice (la racha p09:BC05)."""
    return rachas_a_ram(7, palabra(7, 0xBC05 + 2 * indice))[:16]


# ------------------------------------------------------------------ el bateador

def almacen_del_bateador(v, lado):
    """p00:5677: el almacen de dibujos del bateador en la VRAM 0x6C00."""
    datos = rachas_a_ram(10, 0x604D if lado == 0 else 0x6808)
    v.v[0x6C00:0x6C00 + len(datos)] = datos
    v.v[0x7880:0x7880 + 0x280] = rom(10, 0x7C4B if lado == 0 else 0x7ECB, 0x280)


def dibujos_de_la_formacion(v, n):
    """p00:5761: la ficha de 11 bytes de p10:6000 + 11 n: [color-cuantos] y
    un byte por media linea: la copia de (128 b, 0xD8 + b / 2) de la pagina 0
    a (128 i, 0xF0 + i / 2) de la pagina 1 (0xF5 con los bits altos)."""
    f = 0x6000 + 11 * n
    cab = byte(10, f)
    y0 = 0xF5 if cab & 0xF0 else 0xF0
    for i in range(cab & 0x0F):
        b = byte(10, f + 1 + i)
        org = (0xD8 + b // 2) * 128 + (b & 1) * 64
        dst = 0x8000 + (y0 + i // 2) * 128 + (i & 1) * 64
        v.v[dst:dst + 64] = v.v[org:org + 64]


def fichas(trio, d, n, dy, dx, camiseta, espejo=False):
    """[y][x][dibujo][indice] x n mas (dy, dx); el indice 0 o 7 se queda y
    cualquier otro pasa a ser el de la camiseta (p00:5961 da Z con 0 o 7;
    p00:5891, p00:5929). La camiseta: 0x18 el local, 0x1B el visitante
    (p00:58A4, al reves con 0xEDD0)."""
    out = []
    for k in range(n):
        y, x, dib, ind = (byte(trio, d + 4 * k + j) for j in range(4))
        if espejo:
            x = (-x) & 0xFF
        out.append(((y + dy) & 0xFF, (x + dx) & 0xFF, dib, ind if ind in (0, 7) else camiseta))
    return out


def formacion(n, lado, x=None, y=0x7C, camiseta=0x1B):
    """p00:5877: los atributos del bateador en la formacion n."""
    tabla = 0x9911 if lado == 0 else 0x991F
    d = palabra(10, tabla + 2 * n)
    if x is None:
        x = 0x4C if lado == 0 else 0x94       # p02:890D
    return fichas(10, d + 1, byte(10, d), y, x, camiseta)


def pon_atributos(v, lista, desde=0):
    """Los atributos y sus colores (p00:5B1F, p00:422A) a la VRAM."""
    for k, (y, x, d, ind) in enumerate(lista):
        n = desde + k
        v.v[ATRIBUTOS + 4 * n:ATRIBUTOS + 4 * n + 4] = bytes([y, x, d, ind])
        v.v[COLORES + 16 * n:COLORES + 16 * n + 16] = colores_de(ind)


def acaba_atributos(v, n):
    v.v[ATRIBUTOS + 4 * n] = 216


# ------------------------------------------------------------------ el lanzador

def _espejo(dib):
    """p00:4B72: un dibujo de 16 x 16 girado: cada columna de 8 al otro lado
    y con los bits del reves."""
    rev = [int("{:08b}".format(b)[::-1], 2) for b in dib]
    return bytes(rev[16:32] + rev[0:16])


def posturas_del_lanzador(v, estilo):
    """p00:56C4: las 7 posturas de 128 bytes (4 dibujos) del estilo
    0xE1EB & 3 (p10:6FBE) a la VRAM 0x7C80 en adelante (lineas 0xF9-0xFF de
    la pagina 0); con el bit 2, en espejo (p00:570A)."""
    t = palabra(10, 0x6FBE + 2 * (estilo & 3))
    for k in range(7):
        datos = rom(10, palabra(10, t + 2 * k), 128)
        if estilo & 4:
            datos = b"".join(_espejo(datos[32 * j:32 * j + 32]) for j in range(4))
        v.v[0x7C80 + 128 * k:0x7C80 + 128 * k + 128] = datos


def postura_del_lanzador(v, paso):
    """p00:56B1 (la pide p02:91D5 cuando cambia 0xE1D3): la linea 0xF9 + paso
    de la pagina 0 a la linea 0xFB de la pagina 1, los dibujos 0xB0-0xBF."""
    org = (0xF9 + paso) * 128
    v.v[0xFD80:0xFE00] = v.v[org:org + 128]


def lanzador(estilo, paso, x=0x78, camiseta=0x18):
    """p00:5908: 4 fichas del grupo 0xE1D3 (paso) del estilo (p11:9DB2) en
    los sprites 22-25, con la y + 0x48 y la x (al reves con el bit 2) mas
    0xE1E1 (0x78 en el centro, p03:A9FD). En el paso 2 de los estilos con el
    bit 1, 2 fichas mas en los sprites 20-21 (p11:9F3A o p11:9F42, p00:58E9)."""
    d = palabra(10, 0x9DB2 + 2 * (estilo & 3)) + 16 * paso
    cuatro = _fichas_lanzador(d, 4, estilo, x, camiseta)
    extra = []
    if paso == 2 and estilo & 2:
        extra = _fichas_lanzador(0x9F42 if estilo & 1 else 0x9F3A, 2, estilo, x, camiseta)
    return extra, cuatro


def _fichas_lanzador(d, n, estilo, x, camiseta):
    out = []
    for k in range(n):
        yy, xx, dib, ind = (byte(10, d + 4 * k + j) for j in range(4))
        if estilo & 4:
            xx = (-xx) & 0xFF
        out.append(((yy + 0x48) & 0xFF, (xx + x) & 0xFF, dib, ind if ind in (0, 7) else camiseta))
    return out


# los pasos del lanzamiento (p03:AA11 empieza en 5; p03:A597 baja uno cada
# espera de la tabla p03:A83F; en el 1 sale la pelota y, tras su espera, el 0)
PASOS_DEL_LANZADOR = [(5, 30), (4, 16), (3, 16), (2, 20), (1, 24), (0, 40)]
# el swing (p02:8663): en reposo la formacion 4; con el boton, cada 2 cuadros
# 3, 2, 1, 0; al soltar, cada 3 cuadros 1, 2, 3 y 4. En la fase 2 la formacion
# es la 5 con arriba y la 6 con abajo (p00:584F)
SWING = [(4, 30), (3, 2), (2, 2), (1, 2), (0, 24), (1, 3), (2, 3), (3, 3), (4, 30)]


def colores_de_equipo(v, visitante, local):
    """p00:5517: el color 11 del visitante y el 8 del local, de la tabla de
    p09:BFDE (2 bytes [rojo-azul][verde] por equipo, en el orden de
    p13:62D7: 0 FLYERS, 1 RIDERS, 2 KOBE LINES, 3 BRENDS, 4 PROGRAMS,
    5 DARKS)."""
    for n, eq in ((11, visitante), (8, local)):
        v.pon_color(n, byte(7, 0xBFDE + 2 * eq), byte(7, 0xBFDF + 2 * eq))
