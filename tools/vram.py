#!/usr/bin/env python3
"""La VRAM del V9938 en SCREEN 5 y las rutinas de dibujo del cartucho,
reescritas aqui para pintar las pantallas desde la ROM (no se ejecuta el
juego: cada funcion repite la rutina que se cita).

SCREEN 5: 256 puntos de ancho, 4 bits por punto (el de la izquierda en el
nibble alto), 128 bytes por linea; la pagina p empieza en p x 0x8000. El
juego solo escribe con direcciones de 16 bits (paginas 0 y 1).
"""
import os

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ROM = open(os.path.join(RAIZ, "pennantrace.rom"), "rb").read()

# los repartos de bancos con que corren las rutinas (p00:438D...)
TRIOS = {1: (1, 2, 3), 4: (4, 5, 6), 7: (7, 8, 9), 10: (10, 11, 12), 13: (13, 14, 15)}


def rom(trio, d, n=1):
    """n bytes desde la direccion de CPU d con el trio de bancos que empieza
    en `trio` (0x4000-0x5FFF es siempre el banco 0)."""
    out = bytearray()
    for a in range(d, d + n):
        if 0x4000 <= a < 0x6000:
            out.append(ROM[a - 0x4000])
        else:
            b = TRIOS[trio][(a - 0x6000) // 0x2000]
            out.append(ROM[b * 0x2000 + (a & 0x1FFF)])
    return bytes(out)


def byte(trio, d):
    return rom(trio, d)[0]


def palabra(trio, d):
    b = rom(trio, d, 2)
    return b[0] | b[1] << 8


class Vram:
    def __init__(self):
        self.v = bytearray(0x20000)
        self.paleta = [(0, 0, 0)] * 16          # (r, g, b) de 0 a 7

    # ---------------------------------------------------------------- la paleta
    def pon_color(self, n, rb, g):
        """p00:4BF0: rojo en los bits 4-6 de rb, azul en los 0-2, verde en g."""
        self.paleta[n] = ((rb >> 4) & 7, g & 7, rb & 7)

    def pon_paleta(self, trio, d):
        """p00:4C59: fichas [color][rojo-azul][verde] hasta 0xFF."""
        while True:
            c = byte(trio, d)
            if c == 0xFF:
                return
            self.pon_color(c, byte(trio, d + 1), byte(trio, d + 2))
            d += 3

    # ---------------------------------------------------------------- puntos
    def punto(self, x, y):
        b = self.v[(y * 128 + x // 2) & 0x1FFFF]
        return b >> 4 if x % 2 == 0 else b & 0x0F

    def pon_punto(self, x, y, c):
        a = (y * 128 + x // 2) & 0x1FFFF
        if x % 2 == 0:
            self.v[a] = (self.v[a] & 0x0F) | (c << 4)
        else:
            self.v[a] = (self.v[a] & 0xF0) | c

    # ---------------------------------------------------------------- dibujos
    def bufer_a_vram(self, bufer, de, n, al_reves=False):
        """p00:4F79 (y p00:513B al reves): n caracteres de 8x8 (32 bytes cada
        uno, 4 por fila) a la VRAM DE; 4 bytes a la derecha cada vez y, al
        llegar al byte 0x80 de la linea, 8 lineas mas abajo."""
        d, e = de >> 8, de & 0xFF
        for k in range(n):
            car = bufer[32 * k:32 * k + 32]
            for fila in range(8):
                f = car[4 * fila:4 * fila + 4]
                if al_reves:            # p00:5115: los 4 bytes del reves, nibbles girados
                    f = bytes(((b << 4) | (b >> 4)) & 0xFF for b in reversed(f))
                a = ((d << 8) | e) + 0x80 * fila
                self.v[a:a + 4] = f
            e += 4
            if e == 0x80:
                d, e = d + 4, 0
            e &= 0xFF

    def dibujo(self, tipo, colores, de, n, datos):
        """p00:4FDD: n caracteres; tipo 0-1 un bit por punto (8 bytes cada
        uno), 2-3 dos bits (16), 4-5 tres bits (24); los impares al reves.
        Cada punto es el color colores[bits] (la lista copiada a 0xEC00)."""
        planos = {0: 1, 1: 1, 2: 2, 3: 2, 4: 3, 5: 3}[tipo]
        bufer = bytearray()
        p = 0
        for _ in range(n):
            for _ in range(8):
                filas = datos[p:p + planos]
                p += planos
                pix = []
                for bit in range(7, -1, -1):
                    i = 0
                    # p00:5087 / p00:50EA: el plano del ultimo byte es el bit alto
                    for k in range(planos - 1, -1, -1):
                        i = (i << 1) | ((filas[k] >> bit) & 1)
                    pix.append(colores[i] & 0x0F)
                for a in range(0, 8, 2):
                    bufer.append((pix[a] << 4) | pix[a + 1])
        self.bufer_a_vram(bufer, de, n, al_reves=bool(tipo & 1))

    def dibujos(self, trio, lista, paletas):
        """p00:4FA3: [n] y n fichas [paleta-tipo][VRAM][cuantos][dibujo]."""
        n = byte(trio, lista)
        for k in range(n):
            f = rom(trio, lista + 1 + 6 * k, 6)
            pt, de, cuantos, ptr = f[0], f[1] | f[2] << 8, f[3], f[4] | f[5] << 8
            pal = palabra(trio, paletas + 2 * (pt >> 4))
            nc = (pt & 6) * 2 or 2
            colores = rom(trio, pal, nc)
            planos = {0: 1, 1: 1, 2: 2, 3: 2, 4: 3, 5: 3}[pt & 0x0F]
            datos = rom(trio, ptr, 8 * planos * cuantos)
            self.dibujo(pt & 0x0F, colores, de, cuantos, datos)

    # ---------------------------------------------------------------- rachas
    def rachas(self, trio, origen, de, girar=False):
        """p00:4B35: [cuenta]: 0 acaba, 0x01-0x7F un byte repetido, 0x80 otro
        destino (2 bytes), 0x81-0xFF tantos bytes tal cual."""
        a = de
        while True:
            c = byte(trio, origen)
            origen += 1
            if c == 0:
                return
            if c == 0x80:               # p00:4B2D: otro destino, y sin girar
                a = palabra(trio, origen)
                origen += 2
                girar = False
                continue
            if c & 0x80:
                for _ in range(c & 0x7F):
                    self.v[a & 0xFFFF] = self._gira(byte(trio, origen), girar)
                    origen += 1
                    a += 1
            else:
                b = self._gira(byte(trio, origen), girar)
                origen += 1
                for _ in range(c):
                    self.v[a & 0xFFFF] = b
                    a += 1

    @staticmethod
    def _gira(b, girar):
        if not girar:
            return b
        return int("{:08b}".format(b)[::-1], 2)

    # ---------------------------------------------------------------- un bit
    def caracteres_un_bit(self, trio, origen, n, color, x, y):
        """p00:4E47: n caracteres de un bit (8 bytes cada uno) a la pagina 1
        en (x, y): el bit a 1 es el color, el 0 el color 0 (p00:4E50); cada
        uno 8 puntos a la derecha y, al dar la vuelta, 8 lineas mas abajo
        (p00:4F6F)."""
        for k in range(n):
            for f in range(8):
                b = byte(trio, origen + 8 * k + f)
                for c in range(8):
                    self.pon_punto(x + c, 256 + y + f, color if b & (0x80 >> c) else 0)
            x += 8
            if x >= 256:
                x, y = 0, y + 8

    def lista_de_caracteres(self, trio, lista, x, y, fila):
        """p00:4EFC: codigos de la hoja (fila `fila`, p00:4F44) copiados de la
        pagina 1 a la 1 en (x, y); 0xFE [dx]: la linea siguiente, x + dx; 0xFF
        acaba."""
        x0 = x
        while True:
            c = byte(trio, lista)
            lista += 1
            if c == 0xFF:
                return
            if c == 0xFE:
                x0 = (x0 + byte(trio, lista)) & 0xFF
                lista += 1
                x, y = x0, y + 8
                continue
            sx, sy = (c & 0x1F) * 8, (c >> 5) * 8 + fila
            for f in range(8):
                for p in range(8):
                    self.pon_punto(x + p, 256 + y + f, self.punto(sx + p, 256 + sy + f))
            x = (x + 8) & 0xFF
            if x == 0:
                y += 8

    # ---------------------------------------------------------------- la hoja
    def caracter(self, codigo, x, y, fila=0):
        """p00:4F1C (fila 0), p00:4F30 (0x28), 4F35 (0x30), 4F3A (0x68),
        4F3F (0xA8): el caracter de la hoja de la pagina 1 (32 por fila,
        x = (c and 31) x 8, y = (c >> 5) x 8 + fila) a (x, y) de la pagina 0."""
        sx, sy = (codigo & 0x1F) * 8, (codigo >> 5) * 8 + fila
        for f in range(8):
            o = 0x8000 + (sy + f) * 128 + sx // 2
            dd = ((y + f) & 0xFF) * 128 + x // 2
            self.v[dd:dd + 4] = self.v[o:o + 4]

    def bloque(self, codigos, x, y, ancho, alto, fila):
        """p00:55CD y sus hermanas: `ancho` caracteres por fila, `alto` filas."""
        k = 0
        for f in range(alto):
            for c in range(ancho):
                self.caracter(codigos[k], x + 8 * c, y + 8 * f, fila)
                k += 1

    def rellena(self, x, y, ancho, alto, color, pagina=0):
        """HMMV (p00:4D2A): un rectangulo del byte `color` (dos puntos)."""
        for f in range(alto):
            a = pagina * 0x8000 + ((y + f) & 0xFF) * 128 + x // 2
            self.v[a:a + ancho // 2] = bytes([color]) * (ancho // 2)

    # ---------------------------------------------------------------- lineas
    def linea(self, x, y, largo, color, vertical=False):
        """p00:4C91 / p00:4CC7: orden LINE de `largo` puntos (0 = 256) desde
        (x, y) en la pagina 0."""
        for k in range(largo or 256):
            if vertical:
                self.pon_punto(x, (y + k) & 0xFF, color)
            else:
                self.pon_punto((x + k) & 0xFF, y, color)

    def marco(self, x, y, ancho, alto, color):
        """p00:4CFE: los cuatro lados (x, y, ancho D, alto E)."""
        self.linea(x, y, alto, color, True)
        self.linea(x, y, ancho, color)
        self.linea(x, (y + alto) & 0xFF, ancho, color)
        self.linea((x + ancho) & 0xFF, y, alto, color, True)

    def texto(self, trio, d, mascara=0xFF, xy=None):
        """p00:4EA6: [x y] (salvo con xy) y codigos de la hoja hasta 0xFF;
        0xFE trae otra posicion, 0xFD es medio espacio (4 x 8 de color 0),
        0x0C y 0x0D avanzan 4 y los demas 8."""
        if xy is None:
            x, y = byte(trio, d), byte(trio, d + 1)
            d += 2
        else:
            x, y = xy
        while True:
            c = byte(trio, d)
            d += 1
            if c == 0xFF:
                return
            if c == 0xFE:
                x, y = byte(trio, d), byte(trio, d + 1)
                d += 2
                continue
            if c == 0xFD:
                self.rellena(x, y, 4, 8, 0)
                x += 4
                continue
            c &= mascara
            self.caracter(c, x, y, 0)
            x += 4 if c in (0x0C, 0x0D) else 8

    # ---------------------------------------------------------------- la imagen
    def png(self, ruta, pagina=0, y0=0, alto=212, x0=0, ancho=256, escala=2):
        from PIL import Image
        img = Image.new("RGB", (ancho, alto))
        pal = [(r * 255 // 7, g * 255 // 7, b * 255 // 7) for r, g, b in self.paleta]
        px = img.load()
        for y in range(alto):
            for x in range(ancho):
                px[x, y] = pal[self.punto(x0 + x, pagina * 256 + y0 + y)]
        if escala != 1:
            img = img.resize((ancho * escala, alto * escala), Image.NEAREST)
        img.save(ruta)


def hoja_de_sprites(vram, ruta, base=0xF800, n=64, color=(255, 255, 255), escala=3, por_fila=16):
    """Los n dibujos de 16 x 16 de la tabla de dibujos de sprite (base: los
    4 de 8 x 8 de cada uno: arriba-izquierda, abajo-izquierda, arriba-derecha,
    abajo-derecha), en un color, con su numero (el primero de los 4)."""
    from PIL import Image, ImageDraw
    filas = (n + por_fila - 1) // por_fila
    celda = 20
    img = Image.new("RGB", (por_fila * celda * escala, filas * (celda + 8) * escala), (40, 40, 60))
    d = ImageDraw.Draw(img)
    for k in range(n):
        x0 = (k % por_fila) * celda * escala
        y0 = (k // por_fila) * (celda + 8) * escala
        d.text((x0 + 2, y0), "%02X" % (4 * k), fill=(255, 200, 0))
        for cuarto in range(4):
            for f in range(8):
                b = vram[base + 32 * k + 8 * cuarto + f]
                for c in range(8):
                    if b & (0x80 >> c):
                        x = x0 + (2 + c + 8 * (cuarto // 2)) * escala
                        y = y0 + (10 + f + 8 * (cuarto % 2)) * escala
                        d.rectangle([x, y, x + escala - 1, y + escala - 1], fill=color)
    img.save(ruta)


def rachas_a_ram(trio, origen):
    """p00:5659: lo mismo que las rachas, a la RAM (sin otro destino)."""
    out = bytearray()
    while True:
        c = byte(trio, origen)
        origen += 1
        if c == 0:
            return bytes(out)
        if c & 0x80:
            n = c & 0x7F
            out += rom(trio, origen, n)
            origen += n
        else:
            out += bytes([byte(trio, origen)]) * c
            origen += 1
