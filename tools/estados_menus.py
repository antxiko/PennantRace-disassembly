#!/usr/bin/env python3
"""Los estados de las pantallas de menus: los trozos de RAM que leen
(tools/menus.py) y la paleta de ese instante, sacados de los volcados de
openMSX con los que se cotejaron, para poder dibujarlas sin el emulador. Se
guardan en tools/estados_menus.json.

Uso: estados_menus.py            (lee work/menusN/ram-T.bin y escribe el json)
"""
import json
import os

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
JSON = os.path.join(AQUI, "estados_menus.json")

# lo que leen las pantallas: las fichas de los dos equipos, las de PENNANT,
# las listas de equipos y de nombres, el modo, el marcador y los lanzadores
TROZOS = [(0xD380, 0xD580), (0xD680, 0xD760), (0xDA6B, 0xDB00), (0xDE00, 0xDE10),
          (0xE190, 0xE1A0), (0xEC50, 0xEC70)]

# la pantalla, el volcado de donde sale su estado y la imagen de la web
PANTALLAS = [
    ("seleccion_equipos", "menus2", "24", "menu_equipos.png"),
    ("lanzadores_iniciales", "menus2", "28", "menu_lanzadores.png"),
    ("alineacion", "menus2", "32", "menu_alineacion.png"),
    ("team_edit", "menus6", "26", "menu_team_edit.png"),
    ("liga", "menus3", "39", "menu_liga.png"),
    ("lanzadores_iniciales", "menus5", "79", "menu_jornada.png"),
    ("clasificacion", "menus5", "73", "menu_clasificacion.png"),
]


def ram_de(estado):
    """Una RAM de 64 KB con los trozos del estado."""
    r = bytearray(0x10000)
    for desde, hexa in estado.items():
        if desde == "paleta":
            continue
        d = int(desde, 16)
        b = bytes.fromhex(hexa)
        r[d:d + len(b)] = b
    return bytes(r)


def paleta_de(estado):
    """La paleta del estado: 16 (r, g, b) de 0 a 7."""
    return [tuple(int(c) for c in p) for p in estado["paleta"]]


def carga():
    return json.load(open(JSON, encoding="utf-8"))


def main():
    out = {}
    for que, carpeta, t, png in PANTALLAS:
        ram = open(os.path.join(RAIZ, "work", carpeta, "ram-%s.bin" % t), "rb").read()
        e = {"%04X" % a: ram[a:b].hex() for a, b in TROZOS}
        # la paleta de ese instante (la que dejaron las pantallas de antes)
        import coteja_sprites
        _, pal = coteja_sprites.lee_vdp(os.path.join(RAIZ, "work", carpeta, "vdp-%s.txt" % t))
        e["paleta"] = ["%d%d%d" % c for c in pal]
        out["%s/%s" % (carpeta, t)] = e
    json.dump(out, open(JSON, "w", encoding="utf-8"), indent=0, sort_keys=True)
    print("%s: %d estados" % (JSON, len(out)))


if __name__ == "__main__":
    main()
