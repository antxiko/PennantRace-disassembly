#!/usr/bin/env python3
"""Que bytes de la ROM lee el motor de sonido al tocar cada sonido.

Se ejecuta el motor del cartucho (tools/motor_musica.py, con la
configuracion de tools/musica.py): se pide el sonido y se corren sus cuadros
hasta que se calla o vuelve sobre si mismo, apuntando cada lectura de la ROM
que NO es una instruccion (lo que el motor lee como datos: cabeceras,
partituras, tablas de bateria y de envolventes).

La tabla de sonidos es p04:600C (palabra n-1 = la cabecera del sonido n,
p06:B204 suma 2 x n a 0x600A). Su primera cabecera, en 0x609C, marca donde
acaba la tabla: 72 sonidos.

Uso: partituras.py resumen          cuantos bytes lee cada sonido
     partituras.py json fichero     {sonido: [[banco, ini, fin], ...]}
"""
import json
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
sys.path.insert(0, AQUI)
import motor_musica                      # noqa: E402
from musica import CFG                   # noqa: E402

ROM = open(os.path.join(RAIZ, CFG["rom"]), "rb").read()
TABLA = 0x600C
N_SONIDOS = (ROM[4 * 0x2000 + 0x0C] | ROM[4 * 0x2000 + 0x0D] << 8) - TABLA >> 1
CUADROS = 60 * 75


class Lector(motor_musica.Cartucho):
    """El cartucho del motor, apuntando las lecturas de datos de la ROM."""

    def __init__(self, cfg, rom):
        super().__init__(cfg, rom)
        self.leidos = set()
        self._en_instruccion = False

    def _leer(self, d):
        d &= 0xFFFF
        if 0x4000 <= d < 0xC000 and not self._en_instruccion:
            b = 0 if d < 0x6000 else self.bancos.get(d & 0xE000)
            self.leidos.add((b, d))
        return super()._leer(d)


def instrucciones():
    """{(banco, direccion)} de cada byte trazado como codigo."""
    from paginas import ORG, N_PAGINAS, nombre
    out = set()
    for p in range(N_PAGINAS):
        ruta = os.path.join(RAIZ, "work", nombre(p) + ".trace.json")
        for k, a, b in json.load(open(ruta))["blocks"]:
            if k == "c":
                out.update((p, x) for x in range(a, b))
    return out


def toca(n, codigo):
    """Las lecturas de datos del sonido n."""
    motor_musica.Cartucho = Lector
    z = motor_musica.arranca(CFG, ROM, n)
    vistos = set()
    a, b = CFG["ram"]
    for _ in range(CUADROS):
        motor_musica.corre_frame(z)
        h = bytes(z.mem[a:b])
        if h in vistos:
            break
        vistos.add(h)
    return sorted(x for x in z.leidos if x not in codigo)


def tramos(leidos):
    out = []
    for b, d in leidos:
        if out and out[-1][0] == b and out[-1][2] == d:
            out[-1][2] = d + 1
        else:
            out.append([b, d, d + 1])
    return out


def main(argv):
    codigo = instrucciones()
    todos = {}
    for n in range(1, N_SONIDOS + 1):
        todos[n] = tramos(toca(n, codigo))
    if argv[1:2] == ["json"]:
        json.dump(todos, open(argv[2], "w"), indent=0)
    else:
        for n, ts in todos.items():
            print("0x%02X  %5d bytes en %d tramos" % (n, sum(f - i for _, i, f in ts), len(ts)))


if __name__ == "__main__":
    main(sys.argv)
