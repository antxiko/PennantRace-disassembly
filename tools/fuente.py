#!/usr/bin/env python3
"""La fuente del juego: 161 caracteres de un bit en p12:B6C3 (p00:5991 los
pone en la pagina 1, uno por codigo). Aqui, el caracter de cada codigo, leido
del dibujo (scratchpad: work/fuente.png lo pinta tools/fuente.py png).

Codigos: 0 espacio, 0x01-0x0A las cifras 0-9, 0x0B (C), 0x0C dakuten, 0x0D
handakuten, 0x0E la raya larga, 0x0F-0x28 las letras A-Z, 0x29-0x5F hiragana,
0x60-0x8F katakana, 0x90 en adelante signos y kanji. +0xA0: el mismo
caracter en el color 4 (p00:59BF).

Uso: fuente.py png fichero.png
"""
import os
import sys

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BASE = 12 * 0x2000 + 0xB6C3 - 0xA000
N = 161

HIRA = ("あいうえおかき" "くけこさしすせそたちつてとなにぬ" "ねのはひふへほまみむめもやゆよら"
        "りるれろわをんぁぃぅぇぉゃゅょっ")
KATA = ("ウラヒッチャヘナントレスケムセコ" "ニテタィュロフイヤネアエオカキク"
        "サシソツヌノハホマミメモユヨリル")
OTROS = {0x00: " ", 0x0B: "(C)", 0x0C: "゛", 0x0D: "゜", 0x0E: "ー",
         0x90: ".", 0x91: "ワ", 0x92: "球", 0x93: "第", 0x94: "節",
         0x95: "km", 0x96: "/h", 0x97: "回", 0x98: "村", 0x99: "済", 0x9B: "H", 0x9C: "R",
         # 0x9A: el marcador de la opcion elegida (p01:65AF), dibujado como una pelota
         0x9A: "●"}


# Los kanji que se cargan encima de la fuente:
#  p00:52B5: 17 de p09:B942 en (0xF8, 0x18) de la hoja: los codigos 0x7F-0x8F
KANJI_A = "戦打数安本塁三振四死球盗失策防御率"
#  p00:52D9 / p00:52C7: 11 de p09:B9DA en (0x10, 0x20) -> codigos 0x82-0x8C,
#  o en (0x00, 0x28) -> codigos 0xA0-0xAA (las pantallas de PENNANT)
KANJI_B = "試合結果勝敗差順位表'"


def caracter(c, juego=""):
    """El caracter del codigo c. juego: "" (la fuente con KANJI_A), "B82"
    (con KANJI_B en 0x82-0x8C) o "BA0" (con KANJI_B en 0xA0-0xAA)."""
    c &= 0xFF
    if c == 0xFD:               # medio espacio (p00:4EC0), no un caracter
        return " "
    if juego == "B82" and 0x82 <= c <= 0x8C:
        return KANJI_B[c - 0x82]
    if juego == "BA0" and 0xA0 <= c <= 0xAA:
        return KANJI_B[c - 0xA0]
    if 0x7F <= c <= 0x8F:
        return KANJI_A[c - 0x7F]
    if c >= 0xA0 and c - 0xA0 <= 0x9F:
        c -= 0xA0
        if 0x7F <= c <= 0x8F:
            return KANJI_A[c - 0x7F]
    if 0x01 <= c <= 0x0A:
        return str(c - 1)
    if 0x0F <= c <= 0x28:
        return chr(ord("A") + c - 0x0F)
    if 0x29 <= c <= 0x5F:
        return HIRA[c - 0x29]
    if 0x60 <= c <= 0x8F:
        return KATA[c - 0x60]
    return OTROS.get(c, "<%02X>" % c)


def texto(codigos, juego=""):
    """Une el dakuten y el handakuten a la letra de delante."""
    import unicodedata
    s = "".join(caracter(c, juego) for c in codigos)
    s = s.replace("゛", "゙").replace("゜", "゚")
    return unicodedata.normalize("NFC", s)


def png(ruta):
    from PIL import Image, ImageDraw
    rom = open(os.path.join(RAIZ, "pennantrace.rom"), "rb").read()
    esc, cols = 4, 16
    img = Image.new("RGB", (cols * 12 * esc, ((N + cols - 1) // cols) * 20 * esc), (255, 255, 255))
    d = ImageDraw.Draw(img)
    for i in range(N):
        x0, y0 = (i % cols) * 12 * esc, (i // cols) * 20 * esc
        d.text((x0 + 2, y0 + 1), "%02X" % i, fill=(200, 0, 0))
        for fila in range(8):
            b = rom[BASE + 8 * i + fila]
            for c in range(8):
                if b & (0x80 >> c):
                    x, y = x0 + c * esc + 8, y0 + fila * esc + 32
                    d.rectangle([x, y, x + esc - 1, y + esc - 1], fill=(0, 0, 0))
    img.save(ruta)


if __name__ == "__main__":
    if len(sys.argv) > 2 and sys.argv[1] == "png":
        png(sys.argv[2])
