#!/usr/bin/env python3
"""Lo que se ha MEDIDO del cartucho, clavado para que no se deshaga solo.

Estas comprobaciones necesitan la ROM, y si no esta **fallan**: no se saltan.
Un test que se salta no comprueba nada y en verde daria la impresion
contraria. Quien clone esto sin poner su copia del cartucho vera fallar este
fichero con un mensaje que dice exactamente que falta.

Cada una corresponde a una afirmacion de las notas o de tools/, y todas leen
el binario: ninguna compara una constante contra si misma.
"""
import hashlib
import os
import subprocess
import sys
import unittest

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TOOLS = os.path.join(RAIZ, "tools")
sys.path.insert(0, TOOLS)

from paginas import ORG, OTRO_SLOT   # noqa: E402

ROM = os.path.join(RAIZ, "pennantrace.rom")
SHA = "6576a4cfdd389fd47e4f314c775f3814118027764a75d7b8ec64a09efce82cbb"

FALTA = ("falta pennantrace.rom en la raiz del repo. Son los 131.072 bytes de "
         "The Pro Yakyuu Gekitotsu Pennant Race (Konami, RC-757, 1988, MSX2) y "
         "no se distribuyen aqui: pon tu copia. El sha256 tiene que ser %s" % SHA)


def leer_rom():
    if not os.path.exists(ROM):
        raise AssertionError(FALTA)
    with open(ROM, "rb") as f:
        return f.read()


def b(rom, banco, a, n=1):
    """n bytes del banco en la direccion a (con su org)."""
    o = banco * 0x2000 + (a - ORG[banco])
    return rom[o:o + n]


def escrituras(rom, reg):
    """(banco, direccion) de cada `ld (reg),a` del cartucho."""
    pat = bytes([0x32, reg & 0xFF, reg >> 8])
    res, i = [], rom.find(pat)
    while i >= 0:
        res.append((i // 0x2000, ORG[i // 0x2000] + i % 0x2000))
        i = rom.find(pat, i + 1)
    return res


class Cartucho(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.rom = leer_rom()

    def test_es_la_misma_rom(self):
        self.assertEqual(len(self.rom), 131072)
        self.assertEqual(hashlib.sha256(self.rom).hexdigest(), SHA)
        self.assertEqual(hashlib.sha1(self.rom).hexdigest(),
                         "e22a6317747903475095008d0d5ad9427ddb34af")

    def test_cabecera_ab(self):
        """0x4000 'AB', INIT 0x40F0 y los otros tres vectores a cero."""
        self.assertEqual(self.rom[0:2], b"AB")
        self.assertEqual(self.rom[2] | (self.rom[3] << 8), 0x40F0)
        self.assertEqual(self.rom[4:10], b"\x00" * 6)

    def test_segunda_cabecera_rc757(self):
        """0x4010: 'EF', 0x07 y 0x57, o sea RC-757."""
        self.assertEqual(self.rom[0x10:0x14], bytes([0x45, 0x46, 0x07, 0x57]))

    def test_mapper_konami_con_scc(self):
        """Escrituras a 0x5000, 0x7000, 0x9000 y 0xB000; a 0x6000 y 0xA000
        ninguna, y a 0x8000 solo las de OTRO_SLOT (otro cartucho)."""
        for reg in (0x5000, 0x7000, 0x9000, 0xB000):
            self.assertTrue(escrituras(self.rom, reg))
        for reg in (0x6000, 0xA000):
            self.assertEqual(escrituras(self.rom, reg), [])
        self.assertEqual(set(escrituras(self.rom, 0x8000)), OTRO_SLOT)

    def test_otro_slot_tras_enaslt(self):
        """Cada escritura de OTRO_SLOT va tras `ld h,0x80 / call ENASLT`
        (0x0024) y un `ld a,4`."""
        for banco, a in OTRO_SLOT:
            self.assertEqual(b(self.rom, banco, a - 7, 7),
                             bytes([0x26, 0x80, 0xCD, 0x24, 0x00, 0x3E, 0x04]))

    def test_regla_banco_org(self):
        """tools/reconocimiento.py: toda escritura con banco conocido lo pone en
        la ranura que dice tools/paginas.py (exit 0)."""
        r = subprocess.run([sys.executable, os.path.join(TOOLS, "reconocimiento.py"), ROM],
                           capture_output=True, text=True, cwd=TOOLS)
        self.assertEqual(r.returncode, 0, r.stdout)
        self.assertIn("OK: la regla banco -> org", r.stdout)

    def test_repartos_de_tres(self):
        """p00:438D/4392/4397/439F: `push af / ld a,N` con N = 1, 7, 10 y 13,
        y p00:439C llama a p00:43D9 (guarda el reparto) antes de caer en 439F."""
        self.assertEqual(b(self.rom, 0, 0x438D, 22), bytes.fromhex(
            "f53e011810f53e07180bf53e0a1806cdd943f53e0df3"))

    def test_puesta_en_marcha_del_mapper(self):
        """p00:415D: 0 en 0x5000 y 1-2-3 en 0x7000/0x9000/0xB000, con su copia
        en 0xDDF0-0xDDF3."""
        self.assertEqual(b(self.rom, 0, 0x415A, 3), bytes([0x21, 0xF0, 0xDD]))
        self.assertEqual(b(self.rom, 0, 0x415D, 20), bytes.fromhex(
            "32005077233c32007077233c32009077233c7732"))

    def test_ganchos(self):
        """INIT deja `rst 0x30` + slot + 0x4102 en H.STKE (0xFEDA); 0x4102
        engancha 0x418E en H.TIMI (0xFD9F) y se queda en `jr $`."""
        self.assertEqual(b(self.rom, 0, 0x40F5, 13), bytes.fromhex(
            "672ef722dafe21024122dcfec9"))
        self.assertEqual(b(self.rom, 0, 0x417C, 18), bytes.fromhex(
            "3ec3329ffd218e4122a0fdaf32dbf3fb18fe"))

    def test_despachador(self):
        """p00:4220: pop hl / add a,a / call 0x4216 / ld e,(hl) / inc hl /
        ld d,(hl) / ex de,hl / jp (hl)."""
        self.assertEqual(b(self.rom, 0, 0x4220, 10), bytes.fromhex(
            "e187cd16425e2356ebe9"))


if __name__ == "__main__":
    unittest.main()
