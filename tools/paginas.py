#!/usr/bin/env python3
"""La regla banco -> direccion del MegaROM, compartida por todas las herramientas.

The Pro Yakyuu Gekitotsu Pennant Race (Konami, RC-757, 1988, MSX2) es un
cartucho de 128 KB con el mapper Konami CON SCC: 16 bancos de 8 KB que se
eligen escribiendo el numero de banco en 0x5000 (para 0x4000-0x5FFF), 0x7000
(0x6000-0x7FFF), 0x9000 (0x8000-0x9FFF) y 0xB000 (0xA000-0xBFFF). Escribir
0x3F en 0x9000 no pone un banco: enciende el SCC en 0x9800-0x9FFF.

Lo que dice la ROM (tools/reconocimiento.py lo vuelve a medir cada vez):
  - 0x5000 solo lo escribe la puesta en marcha (p00:415D), con un 0: el
    banco 0 se queda fijo en 0x4000.
  - Los repartos van de tres en tres, con `ld a,N` / `inc a` / `inc a`:
    p00:4163 y p00:438D ponen 1-2-3, p00:41BC, p00:5806 y p00:5CAC 4-5-6
    (el sonido), p00:4392 7-8-9, p00:4397 10-11-12, p00:439F y p00:5CCF
    13-14-15. Ningun banco sale de la casilla de su trio.
  - p06:B17B, p06:B381, p06:B3CF, p06:BED0 y p06:BF31 escriben 0x3F en
    0x9000 (el SCC), y p06:B184, p06:B38C, p06:B3EC, p06:BED7 y p06:BF4A
    devuelven el banco 5.
  - p13:722D, p13:725A y p13:72B0 escriben en 0x8000 despues de
    `ld h,0x80 / call ENASLT`: van a OTRO cartucho, no a este.

Uso como programa:
    paginas.py org <n>               imprime el org del banco n
    paginas.py lista                 imprime "n org" para los 16
    paginas.py corta <rom> <dir>     escribe <dir>/pNN.bin con cada banco
"""
import os
import sys

TAM_PAGINA = 0x2000
N_PAGINAS = 16

# banco -> direccion de ejecucion. Medido, no supuesto: ver reconocimiento.py.
ORG = {0: 0x4000}
for _b in range(1, 16):
    ORG[_b] = (0x6000, 0x8000, 0xA000)[(_b - 1) % 3]

# Registro del mapper -> ranura que gobierna (Konami con SCC).
REGISTROS = {0x5000: 0x4000, 0x7000: 0x6000, 0x9000: 0x8000, 0xB000: 0xA000}

# Los registros del OTRO mapper Konami: nadie de este cartucho escribe en
# ellos, salvo las escrituras de OTRO_SLOT.
AJENOS = (0x6000, 0x8000, 0xA000)

# Escrituras a un registro ajeno que van a otro slot: el `call ENASLT` de
# antes (con H = 0x80) pone en 0x8000-0xBFFF otro cartucho. (banco, pc).
OTRO_SLOT = {(13, 0x722D), (13, 0x725A), (13, 0x72B0)}

# Valores escritos en un registro que no son un banco: (registro, valor).
NO_BANCO = {(0x9000, 0x3F): "enciende el SCC en 0x9800"}

# Escrituras al mapper que ponen un banco fuera de su ranura, medidas en
# reconocimiento.py: (banco, pc de la escritura) -> ranura.
EXCEPCIONES = {}

NUNCA_MAPEADOS = ()


def org(p):
    """Direccion en la que se ejecuta el banco p."""
    return ORG[p]


def nombre(p):
    """Nombre del modulo del banco p: p00..p15."""
    return "p%02d" % p


def main(argv):
    if len(argv) < 2:
        sys.exit(__doc__)
    if argv[1] == "org":
        print("%#06x" % org(int(argv[2], 10)))
    elif argv[1] == "lista":
        for p in range(N_PAGINAS):
            print("%d %#06x" % (p, org(p)))
    elif argv[1] == "corta":
        rom, dst = argv[2], argv[3]
        d = open(rom, "rb").read()
        if len(d) != TAM_PAGINA * N_PAGINAS:
            sys.exit("la ROM mide %d bytes y no %d" % (len(d), TAM_PAGINA * N_PAGINAS))
        os.makedirs(dst, exist_ok=True)
        for p in range(N_PAGINAS):
            with open(os.path.join(dst, nombre(p) + ".bin"), "wb") as f:
                f.write(d[p * TAM_PAGINA:(p + 1) * TAM_PAGINA])
        print("%d bancos de %d bytes en %s/" % (N_PAGINAS, TAM_PAGINA, dst))
    else:
        sys.exit(__doc__)


if __name__ == "__main__":
    main(sys.argv)
