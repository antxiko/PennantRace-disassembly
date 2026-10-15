#!/usr/bin/env python3
"""Las pantallas de los menus y de entre partidos, dibujadas desde la ROM
siguiendo las rutinas que las pintan. Lo que cambia de una partida a otra
(los equipos elegidos, la opcion, los resultados) se lee de una RAM: la de un
volcado de openMSX (tools/omsx_vram.tcl), que es tambien con lo que se
cotejan (tools/coteja_menus.py).

Las primitivas son las del juego (tools/vram.py): texto (p00:4EA6), caracter
(p00:4F1C), linea (p00:4C91 / p00:4CC7: H = x, L = y), marco (p00:4CFE) y
rellena (p00:4D2A). En las posiciones DE de los caracteres, D es la x y E la y.
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import pantallas  # noqa: E402
from vram import Vram  # noqa: E402

AZUL_CLARO = 0x0D      # el color de las lineas de los menus


def base():
    """La pagina 1 con la fuente (p00:5991, al encender) y la paleta de
    p07:6000 (p00:5427); la pagina 0 borrada (p00:4B9F)."""
    v = Vram()
    pantallas.fuente(v)
    v.pon_paleta(7, 0x6000)
    v.pon_color(13, 0x77, 0x07)
    return v


def letra_ascii(c):
    """p14:9834: una letra ASCII a la fuente: 0, espacio, '$' y '_' son 0; las
    cifras - 0x2F; lo demas - 0x32."""
    if c in (0, 0x20, 0x24, 0x5F):
        return 0
    if 0x30 <= c <= 0x39:
        return c - 0x2F
    return (c - 0x32) & 0xFF


def letras(v, ram_o_bytes, x, y, n=10, color4=False):
    """p15:A651 / p13:6A86: n letras ASCII, 8 puntos cada una."""
    for k in range(n):
        c = letra_ascii(ram_o_bytes[k])
        if c and color4:
            c += 0xA0
        v.caracter(c, x + 8 * k, y)


# ------------------------------------------------------------------ TEAM NAME SELECT

def seleccion_equipos(ram):
    """La eleccion de equipos para jugar (p15:A470 y siguientes)."""
    v = base()
    v.texto(13, 0xA710)                                  # TEAM NAME SELECT / TEAMS
    v.linea(0x00, 0x50, 0, AZUL_CLARO)                   # p15:A498
    v.marco(0x08, 0xC6, 0xF2, 0x0C, AZUL_CLARO)          # p15:A4A2
    for x in (0x3E, 0x6E, 0x9E, 0xCE):                   # p15:A4AD
        v.linea(x, 0xC6, 0x0C, AZUL_CLARO, vertical=True)
    _titulo_y_opcion(v, ram)                             # p15:A67A
    _lista_de_equipos(v, ram)                            # p13:6A0D
    elegidos = ram[0xDA6C:0xDA83]                        # p15:A603
    letras(v, elegidos[0:] if ram[0xD70A] != 0xFF else b" " * 10, 0x80, 0x20)
    letras(v, elegidos[11:] if ram[0xD70B] != 0xFF else b" " * 10, 0x80, 0x38)
    return v


def _titulo_y_opcion(v, ram):
    """p15:A67A: el titulo segun el modo (0xDE02) y el texto de la opcion
    (0xD759) de la tabla p15:A6BE (p15:A6C6 con el ordenador solo)."""
    from vram import palabra
    modo, op = ram[0xDE02], ram[0xD759]
    if modo & 0x08:
        v.texto(13, 0xA770)
        v.texto(13, palabra(13, 0xA6C6 + 2 * op))
        return
    v.texto(13, 0xA74F if not modo & 0x20 else 0xA72B)
    if op == 1 and not modo & 0x20:
        op = 3
    v.texto(13, palabra(13, 0xA6BE + 2 * op))


def _lista_de_equipos(v, ram):
    """p13:6A0D: los nombres de 0xDAAE desde la fila 0xD751, 8 filas de dos
    columnas (0x68 aparte), 12 puntos entre filas, desde (0x28, 0x60) (en
    TEAM EDIT, y = 0x30); los
    elegidos (0xD70A, 6) en el color 4; '$' acaba."""
    fila = ram[0xD751]
    d = 0xDAAE + 11 * fila
    x, y = 0x28, (0x30 if ram[0xE190] == 3 else 0x60)
    elegidos = list(ram[0xD70A:0xD710])
    for _ in range(8):
        for col in (0, 1):
            nombre = ram[d:d + 11]
            letras(v, nombre, x + 0x68 * col, y, color4=fila in elegidos)
            d += 11
            fila += 1
            if ram[d] == 0x24:
                if col == 0:
                    letras(v, b" " * 10, x + 0x68, y)
                return
        y += 12


# ------------------------------------------------------------------ STARTING LINE-UP

def letras_estrechas(v, cods, x, y, color4=False):
    """p03:A425 (p03:A43C en el color 4): letras de la fuente; 0x0C (el
    dakuten) avanza 4 y las demas 8. Devuelve la x del final."""
    for c in cods:
        v.caracter((c + 0xA0) & 0xFF if color4 else c, x, y)
        x += 4 if c == 0x0C else 8
    return x


def caracteres(v, cods, x, y):
    """p00:5BE6: caracteres seguidos de 8 en 8 (si la x da la vuelta, la
    fila de abajo, p00:4F6F)."""
    for c in cods:
        v.caracter(c, x, y)
        x = (x + 8) & 0xFF
        if x == 0:
            y += 8
    return x, y


def _jugadores_de_campo(v, ram, d, x, y, n=12):
    """p03:A3EA: n fichas de 14 bytes: el nombre (6 letras estrechas), el
    caracter 0x90 a 0x34, el promedio (3 cifras) 4 mas alla, 8 mas los HR
    (2 cifras); 8 mas abajo, y 24 tras el 8.o."""
    for k in range(n):
        f = ram[d + 14 * k:d + 14 * k + 14]
        letras_estrechas(v, f[0:6], x, y)
        v.caracter(0x90, x + 0x34, y)
        xx, yy = caracteres(v, f[7:10], x + 0x38, y)
        caracteres(v, f[10:12], (xx + 8) & 0xFF, yy)
        y += 0x18 if (n - k) == 5 else 8


def _lanzador_en_fila(v, ram, d, idx, x, y):
    """p03:A242: el lanzador idx (13 o mas) de la ficha d: su nombre en el
    color 4 (p03:A439, con el sitio borrado), el caracter 0x90 y el texto de
    p13:7EB6 (.150 y 0 HR) 4 mas alla; de la y 0xA7 para abajo (la lista de
    lanzadores), su nombre y su 防御率 (p03:A3B4)."""
    f = d + 19 * (idx - 13) + 0xA8                    # p03:A264: fichas de 19 bytes
    if y >= 0xA7:                                       # p03:A275 -> p03:A3B4
        v.rellena(x, y, 0x30, 8, 0)
        letras_estrechas(v, ram[f:f + 6], x, y)
        v.caracter(0x90, x + 0x3C, y)
        caracteres(v, ram[f + 11:f + 12], x + 0x34, y)
        caracteres(v, ram[f + 12:f + 14], x + 0x40, y)
        return
    v.rellena(x, y, 0x30, 8, 0)
    letras_estrechas(v, ram[f:f + 6], x, y, color4=True)
    v.caracter(0x90, x + 0x34, y)
    v.texto(13, 0x7EB6, xy=(x + 0x38, y))


def alineacion(ram):
    """STARTING LINE-UP (p03:A2ED): dos marcos, el texto de p13:7E86, los
    numeros 1-9 en columna (p03:A452), los nombres de los equipos (0xD380 y
    0xD47F), sus 12 de campo (0xD38B y 0xD48A) y el lanzador elegido en la
    fila 9 (0xEC58 y 0xEC6A, p03:A220)."""
    v = base()
    v.marco(0x0E, 0x18, 0x73, 0x85, AZUL_CLARO)
    v.marco(0x86, 0x18, 0x73, 0x85, AZUL_CLARO)
    v.texto(13, 0x7E86)
    for x in (0x10, 0x88):
        for k in range(9):
            v.caracter(2 + k, x, 0x28 + 8 * k)
    caracteres(v, ram[0xD380:0xD38A], 0x20, 0x14)
    caracteres(v, ram[0xD47F:0xD489], 0x98, 0x14)
    _jugadores_de_campo(v, ram, 0xD38B, 0x18, 0x28)
    _lanzador_en_fila(v, ram, 0xD38B, ram[0xEC58], 0x18, 0x68)
    _jugadores_de_campo(v, ram, 0xD48A, 0x90, 0x28)
    _lanzador_en_fila(v, ram, 0xD48A, ram[0xEC6A], 0x90, 0x68)
    return v


# ------------------------------------------------------------------ los lanzadores iniciales

def _letrero_del_partido(v, ram):
    """p14:9787: el ordenador solo, tres textos (p14:97F5, p14:9826,
    p14:982D); PENNANT, p14:9814 y p14:97F5; si no, p14:97FA, el de dos
    jugadores (p14:9804) o uno (p14:980E) y p14:97F5. Luego los dos nombres
    ASCII de 0xD680 y 0xD740 en el color 4 en (0x18, 0x34) y (0x90, 0x34),
    cambiados en PENNANT con el jugador de local (p14:97B1)."""
    modo = ram[0xDE02]
    if modo & 0x10:
        _jornada(v, ram)
    if modo & 0x08:
        for t in (0x97F5, 0x9826, 0x982D):
            v.texto(13, t)
    elif ram[0xE190] == 2:
        v.texto(13, 0x9814)
        v.texto(13, 0x97F5)
    else:
        v.texto(13, 0x97FA)
        v.texto(13, 0x9804 if modo & 0x20 else 0x980E)
        v.texto(13, 0x97F5)
    a, b = (0x18, 0x34), (0x90, 0x34)
    if not modo & 0x20 and ram[0xD6DC] & 1:
        a, b = b, a
    for d, (x, y) in ((0xD680, a), (0xD740, b)):
        for k in range(10):
            v.caracter((letra_ascii(ram[d + k]) + 0xA0) & 0xFF, x + 8 * k, y)


def tres_cifras(v, n, x, y):
    """p00:5C56: un numero de tres cifras con los ceros de la izquierda en
    blanco (el caracter 0), de 8 en 8."""
    c = [n // 100, n // 10 % 10, n % 10]
    vivo = False
    for k, d in enumerate(c):
        vivo = vivo or d != 0 or k == 2
        v.caracter(d + 1 if vivo else 0, x + 8 * k, y)


def _jornada(v, ram):
    """p14:971A: con un jugador, la jornada (0xD6DC + 1) en (0x6C, 0x0C) y el
    texto de p13:7D35 (第 回 戦). (Con varios jugadores sale de la tabla de
    partidos de 0xD6E3; no esta hecho aqui.)"""
    if ram[0xD6E1] != 1:
        raise NotImplementedError("la jornada con varios jugadores")
    tres_cifras(v, ram[0xD6DC] + 1, 0x6C, 0x0C)
    v.texto(13, 0x7D35)


def _cuatro_lanzadores(v, ram, d, x, y):
    """p02:9F20: los 4 lanzadores de la ficha d: el nombre (6 letras
    estrechas), el caracter 0x90 a 0x3C, una cifra 8 antes y dos 4 despues
    (el 防御率 x.yz); 16 mas abajo cada uno."""
    for k in range(4):
        f = ram[d + 19 * k:d + 19 * k + 19]
        letras_estrechas(v, f[0:6], x, y)
        v.caracter(0x90, x + 0x3C, y)
        caracteres(v, f[11:12], x + 0x34, y)
        caracteres(v, f[12:14], x + 0x40, y)
        y += 0x10


def lanzadores_iniciales(ram):
    """La pantalla de los lanzadores (p02:9EA9): el texto de p13:7F55, dos
    marcos de 0x58 x 0x50 en (0x14, 0x6C) y (0x8C, 0x6C), los nombres de los
    equipos en (0x18, 0x68) y (0x90, 0x68), los 4 lanzadores de cada uno
    (0xD433 y 0xD532) desde (0x18, 0x80) y (0x90, 0x80), y el letrero del
    partido (p14:9787)."""
    v = base()
    v.texto(13, 0x7F55)
    v.marco(0x14, 0x6C, 0x58, 0x50, AZUL_CLARO)
    v.marco(0x8C, 0x6C, 0x58, 0x50, AZUL_CLARO)
    caracteres(v, ram[0xD380:0xD38A], 0x18, 0x68)
    caracteres(v, ram[0xD47F:0xD489], 0x90, 0x68)
    _cuatro_lanzadores(v, ram, 0xD433, 0x18, 0x80)
    _cuatro_lanzadores(v, ram, 0xD532, 0x90, 0x80)
    _letrero_del_partido(v, ram)
    return v


# ------------------------------------------------------------------ TEAM EDIT

def _columna(v, c, x, y, n):
    """p14:8722: el caracter c en una columna de n, de 8 en 8."""
    for k in range(n):
        v.caracter(c, x, y + 8 * k)


def team_edit(ram=None):
    """TEAM EDIT con un equipo nuevo (p03:B9E7): el color 0 a gris (0x0222);
    p03:BA8B: el texto de p13:7EC6 y tres lineas de color 0x0D (0x50 en
    (0x78, 0x15), 0xD0 en (0x28, 0x8A) y en (0x28, 0xC5)); p14:8654: las
    columnas de los valores de partida (el 0x90 y las cifras 2, 6, 1 de los
    de campo desde la y 0x29; las de los lanzadores desde la y 0xA4; el
    lado 0x20 y el 0x23)."""
    v = base()
    v.pon_color(0, 0x22, 0x02)
    v.texto(13, 0x7EC6)
    v.linea(0x78, 0x15, 0x50, AZUL_CLARO)
    v.linea(0x28, 0x8A, 0xD0, AZUL_CLARO)
    v.linea(0x28, 0xC5, 0xD0, AZUL_CLARO)
    _columna(v, 0x90, 0x85, 0x29, 12)
    _columna(v, 0x90, 0x20, 0x25, 12)
    _columna(v, 0x90, 0x20, 0xA1, 4)
    _columna(v, 0x02, 0x88, 0x29, 12)
    _columna(v, 0x06, 0x90, 0x29, 12)
    for x in (0x98, 0xB8, 0xDC):
        _columna(v, 0x01, x, 0x29, 12)
    for x in (0x84, 0x90, 0x98, 0xA0, 0xB8, 0xD0, 0xE0, 0xF0):
        _columna(v, 0x01, x, 0xA4, 4)
    _columna(v, 0x20, 0x64, 0x29, 12)
    _columna(v, 0x20, 0x60, 0xA4, 4)
    _columna(v, 0x23, 0x68, 0xA4, 4)
    return v


# ------------------------------------------------------------------ LEAGUE SELECTION

def liga(ram):
    """LEAGUE SELECTION (p13:61BD): una linea en la y 0x50, el marco de la
    barra (0x08, 0xC6) de 0xF2 x 0x0C y sus cuatro separaciones (x 0x3E,
    0x76, 0xA6, 0xCC); el titulo de p13:613D borrado (p00:4EAB) y el texto de
    p13:6294; la barra y su opcion (p13:6C9D: p13:6CE6 y la tabla p13:6CB4);
    la lista de equipos (p13:6A0D); los numeros de los que juegan en
    (0x48, 0x10) de 10 en 10 (p13:6C15) y sus nombres en (0x58, 0x10)
    (p13:6B17)."""
    from vram import palabra
    v = base()
    v.linea(0x00, 0x50, 0, AZUL_CLARO)
    v.marco(0x08, 0xC6, 0xF2, 0x0C, AZUL_CLARO)
    for x in (0x3E, 0x76, 0xA6, 0xCC):
        v.linea(x, 0xC6, 0x0C, AZUL_CLARO, vertical=True)
    v.texto(13, 0x613D, mascara=0)
    v.texto(13, 0x6294)
    v.texto(13, 0x6CE6)
    v.texto(13, palabra(13, 0x6CB4 + 2 * ram[0xD759]))
    _lista_de_equipos(v, ram)
    n = 6 if ram[0xD6E1] == 1 else ram[0xD6E1]
    v.texto(13, 0x6C31)
    for k in range(n):
        v.caracter(2 + k, 0x48, 0x10 + 10 * k)
    for k in range(6):
        nombre = ram[0xDA6C + 11 * k:0xDA6C + 11 * k + 10] if ram[0xD70A + k] != 0xFF else b" " * 10
        letras(v, nombre, 0x58, 0x10 + 10 * k)
    return v


# ------------------------------------------------------------------ 試合結果 / 順位表

def _bcd(b):
    return (b >> 4) * 10 + (b & 15)


def numero(v, b, x, y):
    """p00:5BF1 con B = 1: un byte BCD; la cifra alta en blanco si es 0 y la
    baja siempre."""
    v.caracter(((b >> 4) + 1) if b >> 4 else 0, x, y)
    v.caracter((b & 15) + 1, x + 8, y)


def tres_cifras_bcd(v, cent, bcd, x, y):
    """p00:5C56: las centenas (la mitad baja de un byte) y un byte BCD, con
    los ceros de la izquierda en blanco."""
    tres_cifras(v, (cent & 15) * 100 + _bcd(bcd), x, y)


def _porcentaje(ganados, jugados):
    """p15:AFBD: la division larga de cuatro vueltas: (es_uno, [3 cifras])."""
    d = [0, 0, 0]
    if ganados == 0:
        return False, d
    hl, idx = ganados, 0
    for b in (4, 3, 2, 1):
        c = -1
        while True:
            c += 1
            hl -= jugados
            if hl == 0:
                if b == 4:
                    return True, [0, 0, 0]
                d[idx] = c + 1
                return False, d
            if hl < 0:
                hl += jugados
                break
        if b != 4:
            d[idx] = c
            idx += 1
        hl *= 10
    return False, d


def clasificacion(ram):
    """Los resultados de la jornada y la clasificacion de PENNANT
    (p15:ADFA): las rayas (0x0E) entre las carreras, los puestos, las
    columnas de puntos, los titulos (p15:B0A6, p15:B071...), el partido del
    jugador (p15:AEAE), los dos de las suertes (con un jugador) y la tabla
    (p15:AF2C): partidos, victorias, derrotas, porcentaje y diferencia de
    cada equipo, en el orden de 0xD730. Los kanji, los de p09:B9DA en 0xA0
    (p00:52C7)."""
    v = base()
    v.pon_color(0, 0x07, 0x03)                                 # p00:47DD: el fondo azul
    v.caracteres_un_bit(7, 0xB9DA, 11, 0x0D, 0x00, 0x28)       # p00:52C7
    uno = ram[0xD6E1] == 1
    n = 6 if uno else ram[0xD6E1]
    v.caracter(0x0E, 0x78, 0x1C)
    if uno:
        v.caracter(0x0E, 0x78, 0x28)
        v.caracter(0x0E, 0x78, 0x34)
    for k in range(n):
        v.caracter(2 + k, 0x04, 0x6C + 12 * k)
    for k in range(n - 1):
        v.caracter(0x90, 0xE8, 0x78 + 12 * k)
        v.caracter(0x01, 0xEC, 0x78 + 12 * k)
    for k in range(n):
        v.caracter(0x90, 0xAC, 0x6C + 12 * k)
    for t in (0xB0A6, 0xB071, 0xB07B, 0xB081, 0xB089, 0xB08F, 0xB094, 0xB099, 0xB09E):
        v.texto(13, t)

    def ficha(eq):
        return 0xD680 + (eq - 1) * 15

    def nombre(eq, x, y, n=10):
        d = ficha(eq)
        for k in range(n):
            v.caracter(letra_ascii(ram[d + k]), x + 8 * k, y)

    nombre(ram[0xE195], 0x08, 0x1C)
    numero(v, ram[0xE194], 0x60, 0x1C)
    nombre(ram[0xE197], 0xA0, 0x1C)
    numero(v, ram[0xE196], 0x88, 0x1C)
    if uno:
        for y, base_ in ((0x28, 0xD710), (0x34, 0xD714)):
            nombre(ram[base_ + 1], 0x08, y)
            numero(v, ram[base_], 0x60, y)
            nombre(ram[base_ + 3], 0xA0, y)
            numero(v, ram[base_ + 2], 0x88, y)

    def victorias(eq):
        d = ficha(eq) + 11
        return (ram[d] & 15) * 100 + _bcd(ram[d + 1])
    primero = victorias(ram[0xD730])
    y = 0x6C
    for k in range(n):
        eq = ram[0xD730 + 2 * k]
        ind = list(ram[0xD72A:0xD730]).index(ram[0xD70A + eq - 1])
        jugados = sum(ram[0xD6E3 + 6 * ind:0xD6E3 + 6 * ind + 6]) & 0xFF
        tres_cifras(v, jugados, 0x44, y)
        d = ficha(eq) + 11
        tres_cifras_bcd(v, ram[d], ram[d + 1], 0x64, y)
        tres_cifras_bcd(v, ram[d + 2], ram[d + 3], 0x84, y)
        es_uno, cif = _porcentaje(victorias(eq), jugados)
        if es_uno:
            v.caracter(0x02, 0xA4, y)
        for j, c in enumerate(cif):
            v.caracter(c + 1, 0xB0 + 8 * j, y)
        if y != 0x6C:
            tres_cifras(v, (primero - victorias(eq)) & 0xFF, 0xD0, y)
        nombre(eq, 0x10, y, 6)
        y += 12
    v.texto(13, 0x7CA8)                                        # p00:4845
    return v


def web(carpeta, escala=2):
    """Las pantallas de menus para la web, con los estados de
    tools/estados_menus.json."""
    import estados_menus as E
    est = E.carga()
    for que, carp, t, png in E.PANTALLAS:
        e = est["%s/%s" % (carp, t)]
        v = globals()[que](E.ram_de(e))
        v.paleta = E.paleta_de(e)
        v.png(os.path.join(carpeta, png), pagina=0, escala=escala)
        print(png)



# ------------------------------------------------------------------ MEMBER CHANGE

def jugador_a(v, ram, d, a, x, y):
    """p03:A220: el jugador a de la ficha d en (x, y): 0 la fila en blanco
    (0x68 x 8); 1-12 uno de campo (p03:A3EC); 13 o mas un lanzador."""
    if a == 0:
        v.rellena(x, y, 0x68, 8, 0)
    elif a < 13:
        v.rellena(x, y, 0x30, 8, 0)
        _jugadores_de_campo(v, ram, d + 14 * (a - 1), x, y, n=1)
    else:
        _lanzador_en_fila(v, ram, d, a, x, y)


def member_change(ram):
    """El cambio de jugadores del visitante (p14:9BCC): la pantalla
    (p14:9CF6: el color 4 = 0x7003 y el texto de p13:7B63), el nombre del
    equipo en (0x60, 0x00), los numeros 1-9 en (0x48, 0x28) (p03:A452), los
    17 de su lista de 0xEC50 desde (0x50, 0x28) con huecos de 16 tras el 9.o
    y de 24 tras el 13.o (p03:A220), y la marca 0x9A en el que batea (0xEC4F,
    la y de p14:9BBB, x 0x3C)."""
    from vram import byte
    v = base()
    v.pon_color(4, 0x70, 0x03)
    v.texto(13, 0x7B63)
    caracteres(v, ram[0xD380:0xD38A], 0x60, 0x00)
    for k in range(9):
        v.caracter(2 + k, 0x48, 0x28 + 8 * k)
    y = 0x28
    for k in range(17):
        jugador_a(v, ram, 0xD38B, ram[0xEC50 + k], 0x50, y)
        y += 0x10 if k == 8 else 0x18 if k == 12 else 8
    v.caracter(0x9A, 0x3C, byte(13, 0x9BBB + ram[0xEC4F]))
    return v


if __name__ == "__main__":
    web(sys.argv[1] if len(sys.argv) > 1 else "docs/imagenes")
