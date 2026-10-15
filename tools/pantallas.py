#!/usr/bin/env python3
"""Las pantallas del Pro Yakyuu, dibujadas desde la ROM con tools/vram.py
(cada paso cita la rutina del cartucho que repite). El emulador solo sirve
para cotejar: tools/omsx_vram.tcl vuelca la VRAM de openMSX y
tools/coteja_vram.py la compara con lo de aqui.

Uso: pantallas.py <campo|todas> <carpeta>
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from vram import Vram, byte, palabra, rom, rachas_a_ram  # noqa: E402


def fuente(v):
    """La fuente en la hoja de la pagina 1: p00:5991 (161 caracteres de un bit
    de p12:B6C3 con el color 0x0D en (0, 0)), p00:59BF (otra vez con el color
    4 en (0, 0x28), y el color 4 = 0x7003) y p00:52B5 (los 17 kanji de
    p09:B942 en (0xF8, 0x18): los codigos 0x7F-0x8F)."""
    v.caracteres_un_bit(10, 0xB6C3, 161, 0x0D, 0, 0)
    v.caracteres_un_bit(10, 0xB6C3, 161, 4, 0, 0x28)
    v.pon_color(4, 0x70, 0x03)
    v.caracteres_un_bit(7, 0xB942, 17, 0x0D, 0xF8, 0x18)


def graficos_del_cambio(v):
    """Lo que la media entrada nueva (p03:ACC2) pone antes del marcador:
    p00:547A (tres listas de dibujos de p07) y p00:550E (la paleta de
    p07:6000)."""
    v.dibujos(7, 0x6053, 0x602B)
    v.dibujos(7, 0x6323, 0x62E5)
    v.dibujos(7, 0x69CA, 0x69A4)
    v.pon_paleta(7, 0x6000)


def graficos_del_campo(v):
    """Y los del campo, despues (p03:AD1D y p03:B47E): p00:54B3 (seis listas
    de p07 y p09), p00:549B (dos de p08), p00:54EF (p08:8B53) y p00:51BE
    (p07:60AE). Pisan filas de las de p00:547A."""
    for lista, pal in ((0x6CC3, 0x6C87), (0x73D6, 0x73C4), (0x75EC, 0x75B7),
                       (0x78B3, 0x7881), (0x7EF1, 0x7ED2), (0xB759, 0xB747)):
        v.dibujos(7, lista, pal)
    v.dibujos(7, 0x8412, 0x83E0)
    v.dibujos(7, 0x8B40, 0x8B21)
    v.dibujos(7, 0x8B53, 0x8B21)
    v.dibujos(7, 0x60AE, 0x602B)


def graficos_del_partido(v):
    """La pagina 1 del partido: la fuente (p00:45D2) y las dos cargas."""
    fuente(v)
    graficos_del_cambio(v)
    graficos_del_campo(v)


def base_de_mosaicos(zona, posicion):
    """p03:B317: zona 0 p08:9B28, zona 2 p09:A088, zona 1 p08:95B8 (o
    p08:9A58 desde la posicion 0x70 de la lista)."""
    if zona == 0:
        return 0x9B28
    if zona != 1:
        return 0xA088
    return 0x9A58 if posicion >= 0x70 else 0x95B8


def fila_de_la_fuente(zona, posicion):
    """p03:B1A5: zona 1 la fila 0x28 (p00:55CD) o, desde 0x70, la 0x68;
    zona 2 la 0xA8 (p00:5636); la 0 la 0x68 (p00:5613)."""
    if zona == 1:
        return 0x68 if posicion >= 0x70 else 0x28
    return 0xA8 if zona == 2 else 0x68


def marcador():
    """El marcador grande del cambio de campo: los graficos del partido, el
    fondo de p00:5576 (las rachas de p08:9220: 32 x 27 caracteres de la fila
    0x30) y p01:6352: dos marcos, rellenos, lineas y el texto de p13:7E1E
    (las letras S B O, el 回 de la entrada, HR y 打率...). Sin partido: las
    casillas y los numeros quedan vacios."""
    v = Vram()
    fuente(v)                   # al empezar el partido (p00:45D2)...
    graficos_del_cambio(v)      # ...y en cada media entrada (p03:ACC2), encima
    v.bloque(rachas_a_ram(7, 0x9220), 0, 0, 32, 27, 0x30)
    v.marco(0x0F, 0x77, 0x22, 0x1A, 0x0D)
    v.marco(0xC7, 0x77, 0x2A, 0x1A, 0x0D)
    v.rellena(0x10, 0x78, 0x20, 0x19, 0x00)
    v.rellena(0x30, 0x78, 0x02, 0x19, 0x0D)
    v.rellena(0xC8, 0x78, 0x28, 0x19, 0x00)
    v.rellena(0xF0, 0x78, 0x02, 0x19, 0x0D)
    v.linea(0x07, 0xA7, 0x32, 0x0D)
    v.linea(0x07, 0xC1, 0x32, 0x0D)
    v.linea(0x07, 0xA7, 0x1A, 0x0D, True)
    v.linea(0xC7, 0xA7, 0x32, 0x0D)
    v.linea(0xC7, 0xC1, 0x32, 0x0D)
    v.linea(0xC7, 0xA7, 0x1A, 0x0D, True)
    v.rellena(0x08, 0xA8, 0x30, 0x19, 0x00)
    v.rellena(0x38, 0xA8, 0x02, 0x19, 0x0D)
    v.rellena(0xC8, 0xA8, 0x30, 0x19, 0x00)
    v.rellena(0xF8, 0xA8, 0x02, 0x19, 0x0D)
    v.texto(13, 0x7E1E)
    return v


def campo(zona):
    """El campo entero de una zona: 16 tiras de 8 mosaicos de 4 x 4
    caracteres (p03:B166, p00:5B76): 256 x 512 puntos, como una lista de
    lineas de 256 colores."""
    v = Vram()
    graficos_del_partido(v)
    mapa = palabra(7, 0x9432 + 2 * zona)          # p00:5B79: la lista de la zona
    lineas = [[0] * 256 for _ in range(512)]
    for r in range(16):
        codigos = bytearray(32 * 4)                 # el bufer 0xDE10: 32 x 4 caracteres
        for c in range(8):
            pos = 8 * r + c
            m = byte(7, mapa + pos)
            t = rom(7, base_de_mosaicos(zona, 8 * r) + 16 * m, 16)
            for f in range(4):
                codigos[32 * f + 4 * c:32 * f + 4 * c + 4] = t[4 * f:4 * f + 4]
        fila = fila_de_la_fuente(zona, 8 * r + 7)   # 0xE1B2: la ultima posicion de la tira
        v.bloque(codigos, 0, 0, 32, 4, fila)        # pintada arriba de la pagina 0...
        for y in range(32):                         # ...y copiada a su sitio
            lineas[32 * r + y] = [v.punto(x, y) for x in range(256)]
    return v, lineas


def logotipo():
    """p00:57C6 (la pantalla del menu de modos): la paleta de p09:BE86, 13
    caracteres de un bit de p09:BCE6 con el color 1 en (0x08, 0x38) de la
    pagina 1, 13 de p09:BD4E con el 2 en (0x70, 0x38), 26 de p09:BDB6 con el
    3 en (0xD8, 0x38) y la lista de p09:BCA5 (fila 0x38) en (0x40, 0x70)."""
    v = Vram()
    v.pon_paleta(7, 0xBE86)
    v.caracteres_un_bit(7, 0xBCE6, 13, 1, 0x08, 0x38)
    v.caracteres_un_bit(7, 0xBD4E, 13, 2, 0x70, 0x38)
    v.caracteres_un_bit(7, 0xBDB6, 26, 3, 0xD8, 0x38)
    v.lista_de_caracteres(7, 0xBCA5, 0x40, 0x70, 0x38)
    return v


def titulo():
    """La presentacion (p15:BB97): un rectangulo de color 0 de 0xD0 x 0x48 en
    (0x28, 0x70) de la pagina 1; p00:5427: la paleta de p07:6000, el color 13,
    los dibujos de p09:A619 y las rachas de p09:AFC4 (16 x 11 caracteres de la
    fila 0x28 en (0x80, 0x68) de la pagina 0); p00:52E7: los dibujos de
    p09:B07A, la lista de p09:B6B9 en (0x28, 0x70) y los colores 15 y 12. El
    rotulo queda en la pagina 1 y la presentacion lo destapa columna a columna
    (p15:BC39)."""
    v = Vram()
    v.rellena(0x28, 0x70, 0xD0, 0x48, 0, pagina=1)
    v.pon_paleta(7, 0x6000)
    v.pon_color(13, 0x77, 0x07)
    v.dibujos(7, 0xA619, 0xA5D8)
    v.bloque(rachas_a_ram(7, 0xAFC4), 0x80, 0x68, 16, 11, 0x28)
    v.dibujos(7, 0xB07A, 0xB066)
    v.lista_de_caracteres(7, 0xB6B9, 0x28, 0x70, 0x38)
    v.pon_color(15, 0x70, 0x00)
    v.pon_color(12, 0x60, 0x06)
    return v


def copia(v, sx, sy, sp, dx, dy, dp, ancho, alto):
    """HMMM (p00:4D66): el rectangulo (sx, sy) de la pagina sp a (dx, dy) de
    la pagina dp, de dos en dos puntos."""
    for f in range(alto):
        o = sp * 0x8000 + ((sy + f) & 0xFF) * 128 + sx // 2
        d = dp * 0x8000 + ((dy + f) & 0xFF) * 128 + dx // 2
        v.v[d:d + ancho // 2] = v.v[o:o + ancho // 2]


def logo_konami(filas=0x30):
    """La pantalla del logo de Konami (p03:B670): el rectangulo de 0xA8 x
    0x30 en (0x28, 0x70) de la pagina 1 a 0, el logo de p00:57C6 (logotipo)
    y, cada dos cuadros, una fila mas de ese rectangulo a (0x28, 0x40) de la
    pagina 0 (p14:872E: 0x30 filas)."""
    v = logotipo()
    copia(v, 0x28, 0x70, 1, 0x28, 0x40, 0, 0xA8, filas)
    return v


def menu(modo=0):
    """El menu de modos (p01:651C): la presentacion (titulo), con la fuente
    que se carga al encender (p00:5991); el rotulo de (0x28, 0x70) de la
    pagina 1 a (0x1C, 0x08) de la pagina 0 (p01:6535); los 5 textos seguidos
    de p13:7D8F (p01:6543) y el marcador, el caracter 0x9A, en la fila del
    modo: (0x18, 16 x modo + 0x70) (p01:65AF)."""
    import textos
    v = titulo()
    fuente(v)
    copia(v, 0x28, 0x70, 1, 0x1C, 0x08, 0, 0xD0, 0x48)
    d = 0x7D8F
    for _ in range(5):
        v.texto(13, d)
        d = textos.descodifica(d)[1]
    v.caracter(0x9A, 0x18, 16 * modo + 0x70)
    return v


# Los letreros de la pantalla del lanzamiento: listas de dibujos que se pintan
# en la pagina 0 con las paletas de p00:51B2 (azul o rojo); cada una con su
# pareja para el bateador del otro lado
LETREROS = [
    ("PLAY BALL!", 13, 0x7925, "p00:5163, al empezar la media entrada"),
    ("LUCKY 7", 10, 0x96EE, "p00:5180, la de la 7.a"),
    ("PLAY!", 13, 0xBA9B, "p00:5168 (p13:BA8E por el otro lado)"),
    ("BALL!", 10, 0x9401, "p00:5193 (p11:93F4)"),
    ("STRIKE!", 10, 0x94BB, "p00:5185 (p11:94AE)"),
    ("OUT!", 10, 0x95A8, "p00:51A1 (p11:95BB)"),
]


def ventanitas():
    """La pantalla del lanzamiento con las dos ventanitas de las bases
    (p03:AD46): la de 1.a, las rachas de p08:9178 en 8 x 12 caracteres de la
    fila 0xA8 en (0xB8, 0x08) (p00:5591), y la de 3.a, las de p08:91CC en
    (0x08, 0x08) (p00:55AF). Sus marcadores son sprites (p02:988A)."""
    v = marcador()
    v.bloque(rachas_a_ram(7, 0x9178), 0xB8, 0x08, 8, 12, 0xA8)
    v.bloque(rachas_a_ram(7, 0x91CC), 0x08, 0x08, 8, 12, 0xA8)
    return v


def letreros(salida, escala=3):
    """Los letreros sobre la pantalla del lanzamiento, cada uno recortado."""
    from PIL import Image
    piezas = []
    for _, trio, lista, _ in LETREROS:
        v = marcador()
        v.dibujos(trio, lista, 0x51B2)
        ruta = os.path.join(salida, "_letrero.png")
        v.png(ruta, pagina=0, y0=118, alto=34, x0=60, ancho=136, escala=escala)
        piezas.append(Image.open(ruta).copy())
        os.remove(ruta)
    w, h = piezas[0].size
    hoja = Image.new("RGB", (2 * w, 3 * h))
    for k, im in enumerate(piezas):
        hoja.paste(im, ((k % 2) * w, (k // 2) * h))
    hoja.save(os.path.join(salida, "letreros.png"))


def sprites_del_partido():
    """Los dibujos de sprite del partido (VRAM 0xF800-0xFFFF): p00:537C
    (rachas de p10:76BE y p12:BBC3), p00:539D (p12:BC3C, p10:79AD, p10:7B90,
    p11:9380) y p00:53CC (p11:814B, con su destino delante). Durante la
    jugada p00:572E pone en 0xFAC0 los de quien lleva la pelota (128 bytes
    de p11:8499) y p00:5716 en 0xFFC0 los del receptor (64 de p11:8759); la
    postura del lanzador la pone p00:56B1 en 0xFD80 (tools/sprites.py)."""
    v = Vram()
    v.rachas(10, 0x76BE, 0xFE00)
    v.rachas(10, 0xBBC3, 0xFD00)
    v.rachas(10, 0xBC3C, 0xFD80)
    v.rachas(10, 0x79AD, 0xFB80)
    v.rachas(10, 0x7B90, 0xFF00)
    v.rachas(10, 0x9380, 0xFE20)
    v.rachas(10, 0x814D, palabra(10, 0x814B))
    return v


def png_lineas(v, lineas, ruta, escala=2):
    from PIL import Image
    pal = [(r * 255 // 7, g * 255 // 7, b * 255 // 7) for r, g, b in v.paleta]
    img = Image.new("RGB", (256, len(lineas)))
    px = img.load()
    for y, fila in enumerate(lineas):
        for x, c in enumerate(fila):
            px[x, y] = pal[c]
    img.resize((256 * escala, len(lineas) * escala), Image.NEAREST).save(ruta)


def main(argv):
    que, salida = argv[1], argv[2]
    os.makedirs(salida, exist_ok=True)
    if que in ("logotipo", "todas"):
        v = logotipo()
        v.png(os.path.join(salida, "logotipo_hoja.png"), pagina=1, y0=0, alto=212, escala=2)
        print("logotipo_hoja.png")
    if que in ("titulo", "todas"):
        v = titulo()
        v.png(os.path.join(salida, "titulo_hoja.png"), pagina=1, y0=0, alto=212, escala=2)
        v.png(os.path.join(salida, "titulo_p0.png"), pagina=0, y0=0, alto=212, escala=2)
        print("titulo")
    if que in ("marcador", "todas"):
        v = marcador()
        v.png(os.path.join(salida, "marcador.png"), pagina=0, y0=0, alto=212, escala=2)
        print("marcador.png")
    if que in ("web", "todas"):
        from PIL import Image
        from vram import hoja_de_sprites
        import fuente as F
        v = titulo()
        v.png(os.path.join(salida, "_t1.png"), pagina=1, y0=0x70, alto=0x48, x0=0x28, ancho=0xD0, escala=3)
        os.replace(os.path.join(salida, "_t1.png"), os.path.join(salida, "rotulo.png"))
        v.png(os.path.join(salida, "estadio.png"), pagina=0, y0=0x60, alto=0x60, x0=0x78, ancho=0x88, escala=3)
        v = marcador()
        v.png(os.path.join(salida, "lanceo.png"), pagina=0, y0=0, alto=212, escala=2)
        hoja_de_sprites(sprites_del_partido().v, os.path.join(salida, "sprites.png"))
        F.png(os.path.join(salida, "fuente.png"))
        for z in range(3):
            v, lineas = campo(z)
            png_lineas(v, lineas, os.path.join(salida, "campo_%d.png" % z), 2)
        menu(0).png(os.path.join(salida, "menu.png"), pagina=0, alto=212, escala=2)
        logo_konami().png(os.path.join(salida, "logo_konami.png"), pagina=0, alto=212, escala=2)
        letreros(salida)
        ventanitas().png(os.path.join(salida, "lanceo_bases.png"), pagina=0, alto=212, escala=2)
        print("web")
    if que in ("campo", "todas"):
        for z in range(3):
            v, lineas = campo(z)
            png_lineas(v, lineas, os.path.join(salida, "campo_%d.png" % z), 1)
            print("campo_%d.png" % z)


if __name__ == "__main__":
    main(sys.argv)
