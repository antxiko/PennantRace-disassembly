#!/usr/bin/env python3
"""Lo que el trazador de cartucho entero (tools/bancos.py) necesita saber de
ESTE cartucho: donde esta el despachador, como cambia de banco y por donde
arranca. bancos.py es maquinaria y no lleva direcciones de ningun juego; las
lee de aqui.

The Pro Yakyuu Gekitotsu Pennant Race (Konami, RC-757, 1988), mapper Konami
con SCC. Todo medido sobre los bytes (tools/reconocimiento.py repasa cada
escritura al mapper).
"""

# El despachador: `pop hl / add a,a / call p00:4216 (HL += A) / ld e,(hl) /
# inc hl / ld d,(hl) / ex de,hl / jp (hl)`, con la tabla de destinos pegada
# detras del `call`. En este cartucho esta en p00:4220.
DESPACHADOR = 0x4220
DESPACHADORES = (0x4220,)

# Registro del mapper -> casilla del reparto (0x6000, 0x8000, 0xA000). El de
# 0x5000 no esta: solo lo escribe la puesta en marcha, con un 0 (el banco 0
# se queda fijo).
RANURA_REG = {0x7000: 0, 0x9000: 1, 0xB000: 2}

# Las copias en RAM de los registros: 0xDDF1/0xDDF2/0xDDF3, que los repartos
# de tres (p00:43A2) escriben justo despues de cada registro y que el sonido
# (p00:41D5, p00:5818, p00:5CBC) lee para devolver lo que habia. 0xDDF0 es la
# del banco 0.
SOMBRA = {0xDDF1: 0, 0xDDF2: 1, 0xDDF3: 2}
SOMBRA_RANURA = {0: 0, 1: 1, 2: 2}
PONE_ZONA = ()
DEVUELVE_ZONA = ()

# Subrutinas del banco 0 que CAMBIAN de banco y vuelven con `ret`; sin ellas
# el trazador sigue tras el `call` con el reparto de antes. Todas acaban en
# p00:43A2, que escribe los tres registros Y su copia en RAM. None = esa
# ranura no la toca.
REPARTOS = {
    0x438D: (1, 2, 3),          # p00:438D  push af / ld a,1 / jr p00:43A2
    0x4392: (7, 8, 9),          # p00:4392  push af / ld a,7 / jr p00:43A2
    0x4397: (10, 11, 12),       # p00:4397  push af / ld a,10 / jr p00:43A2
    0x439C: (13, 14, 15),       # p00:439C  call p00:43D9 (guarda el reparto en 0xED46-0xED48) y cae en p00:439F
    0x439F: (13, 14, 15),       # p00:439F  push af / ld a,13 y cae en p00:43A2
}

# Las subrutinas que SALEN SALTANDO a una de las de arriba (`call 0x4392 /
# call 0x9xxx / jp 0x438D`) y por eso vuelven con ese reparto. Las saca
# tools/colas.py (`colas.py --python`), siguiendo el camino recto de cada una.
COLAS = {
    0x4030: (13, 14, 15),
    0x4039: (13, 14, 15),
    0x4042: (13, 14, 15),
    0x404B: (13, 14, 15),
    0x4054: (13, 14, 15),
    0x405D: (13, 14, 15),
    0x4066: (13, 14, 15),
    0x406F: (13, 14, 15),
    0x4078: (13, 14, 15),
    0x4081: (13, 14, 15),
    0x408A: (13, 14, 15),
    0x4093: (13, 14, 15),
    0x40AE: (13, 14, 15),
    0x40C0: (13, 14, 15),
    0x40C9: (13, 14, 15),
    0x40D2: (13, 14, 15),
    0x40DB: (13, 14, 15),
    0x40E1: (13, 14, 15),
    0x40E7: (1, 2, 3),
    0x51CD: (1, 2, 3),
    0x51FC: (13, 14, 15),
    0x5202: (1, 2, 3),
    0x5222: (1, 2, 3),
    0x526E: (1, 2, 3),
    0x52B5: (1, 2, 3),
    0x52C7: (1, 2, 3),
    0x52D9: (1, 2, 3),
    0x52E1: (13, 14, 15),
    0x52E7: (1, 2, 3),
    0x530F: (1, 2, 3),
    0x5336: (1, 2, 3),
    0x5348: (1, 2, 3),
    0x535A: (1, 2, 3),
    0x537C: (1, 2, 3),
    0x538E: (1, 2, 3),
    0x539D: (1, 2, 3),
    0x53CC: (1, 2, 3),
    0x541B: (13, 14, 15),
    0x5421: (13, 14, 15),
    0x546B: (1, 2, 3),
    0x547A: (1, 2, 3),
    0x549B: (1, 2, 3),
    0x54B3: (1, 2, 3),
    0x54EF: (1, 2, 3),
    0x5561: (1, 2, 3),
    0x5576: (1, 2, 3),
    0x5591: (1, 2, 3),
    0x55AF: (1, 2, 3),
    0x57C6: (1, 2, 3),
    0x5832: (1, 2, 3),
    0x596F: (1, 2, 3),
    0x59AD: (1, 2, 3),
    0x59B6: (13, 14, 15),
    0x59D3: (1, 2, 3),
    0x5A35: (1, 2, 3),
    0x5B69: (1, 2, 3),
    0x5BCC: (1, 2, 3),
    0x5C94: (1, 2, 3),
    0x5CA3: (1, 2, 3),
    0x5CED: (1, 2, 3),
    0x5CF6: (1, 2, 3),
    0x5CFF: (1, 2, 3),
    0x5D08: (1, 2, 3),
    0x5D11: (1, 2, 3),
    0x5D1A: (1, 2, 3),
    0x5D23: (1, 2, 3),
    0x5D35: (1, 2, 3),
    0x5D3E: (1, 2, 3),
    0x5D47: (1, 2, 3),
    0x5D50: (1, 2, 3),
    0x5D59: (1, 2, 3),
    0x5D62: (1, 2, 3),
    0x5D6B: (1, 2, 3),
    0x5D74: (1, 2, 3),
    0x5D7D: (13, 14, 15),
    0x5D86: (1, 2, 3),
    0x5D8F: (1, 2, 3),
    0x5DB2: (1, 2, 3),
    0x5DBB: (13, 14, 15),
    0x5F81: (1, 2, 3),
    0x5FF1: (1, 2, 3),
}

PONE_BANCOS = {**REPARTOS, **COLAS}


def semillas_iniciales(rom):
    """Los puntos de entrada que el hardware garantiza.

    - INIT de la cabecera "AB" (0x40F0): lo llama la BIOS al arrancar, con el
      mapper en su estado de encendido (bancos 1, 2 y 3 en 0x6000, 0x8000 y
      0xA000).
    - 0x4102: lo que INIT deja en el gancho H.STKE: `ld h,a / ld l,0xF7 /
      ld (0xFEDA),hl / ld hl,0x4102 / ld (0xFEDC),hl` (p00:40F5-40FE) es un
      `rst 0x30` con el slot del cartucho y esta direccion. La BIOS lo llama
      cuando ha terminado de arrancar.
    - 0x418E: lo que 0x4102 instala en el gancho H.TIMI, con `ld a,0xC3 /
      ld (0xFD9F),a / ld hl,0x418E / ld (0xFDA0),hl` (p00:417C-4184).
      Despues se queda en `jr $` (p00:418C): el juego entero corre desde la
      interrupcion.
    """
    init = rom[2] | (rom[3] << 8)
    return [(init, (1, 2, 3), "cabecera AB: INIT"),
            (0x4102, (1, 2, 3),
             "gancho H.STKE: INIT escribe rst 0x30 + slot en 0xFEDA y esta"
             " direccion en 0xFEDC (p00:40F5-p00:40FE)"),
            (0x418E, (1, 2, 3),
             "gancho de interrupcion H.TIMI: p00:417C escribe 0xC3 en 0xFD9F"
             " y esta direccion en 0xFDA0")]
