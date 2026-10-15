#!/usr/bin/env python3
"""Lo que tools/anota.py sabe de The Pro Yakyuu Gekitotsu Pennant Race:
rutinas con nombre, RAM y los campos de las fichas. Solo datos; la
maquinaria esta en anota.py.

CADA ENTRADA SALE DE LEER SU RUTINA en el listado (la direccion es la fuente).
Lo que no se sabe no esta en la tabla.
"""

# Los bancos con codigo (los demas son datos de punta a punta).
BANCOS = (0, 1, 2, 3, 6, 13, 14, 15)

# Los registros del mapper Konami con SCC (tools/paginas.py): 0x7000, 0x9000
# y 0xB000 eligen lo que se ve en 0x6000, 0x8000 y 0xA000.
REGISTROS_MAPPER = {0x5000: "0x4000", 0x7000: "0x6000", 0x9000: "0x8000", 0xB000: "0xA000"}


# Que banco se ve en cada ventana al empezar una rutina del banco b. Los
# bancos de codigo corren con su trio: 1-2-3 (p00:438D), 4-5-6 el sonido
# (p00:41BC) y 13-14-15 (p00:439F). El banco 0 (0x4000) no tiene reparto fijo.
def trio(b):
    if b == 0:
        return {}
    if b in (4, 5, 6):
        return {0x6000: 4, 0x8000: 5, 0xA000: 6}
    if b in (13, 14, 15):
        return {0x6000: 13, 0x8000: 14, 0xA000: 15}
    return {0x6000: 1, 0x8000: 2, 0xA000: 3}


# Las rutinas del banco 0 que cambian lo que se ve (ventana -> banco): las de
# cartucho.REPARTOS.
CAMBIOS_DE_BANCO = {
    0x438D: {0x6000: 1, 0x8000: 2, 0xA000: 3},
    0x4392: {0x6000: 7, 0x8000: 8, 0xA000: 9},
    0x4397: {0x6000: 10, 0x8000: 11, 0xA000: 12},
    0x439C: {0x6000: 13, 0x8000: 14, 0xA000: 15},
    0x439F: {0x6000: 13, 0x8000: 14, 0xA000: 15},
}

RUTINAS = {
    # --- banco 0: arranque e interrupcion ---
    (0, 0x40F0): ("init", "INIT de la cabecera: deja en H.STKE (0xFEDA) un rst 0x30 con el slot del cartucho y 0x4102"),
    (0, 0x4102): ("arranque", "la puesta en marcha (desde H.STKE): pila en 0xD280, RAM a cero, bancos 0-1-2-3, H.TIMI a 0x418E y a esperar en `jr $`"),
    (0, 0x418E): ("interrupcion", "H.TIMI: lee el estado del VDP, el sonido con 4-5-6 (p04:6009) y, si no esta ya en marcha (0xDE05), el cuadro del juego"),
    (0, 0x440C): ("slot_del_cartucho", "A = el slot de la pagina 1 (el cartucho) en el formato de ENASLT; lo apunta en 0xD2AA"),
    (0, 0x43EC): ("cartucho_en_pagina_2", "pone el slot del cartucho tambien en 0x8000-0xBFFF (ENASLT con H = 0x80)"),
    (0, 0x422A): ("sprites_a_vram", "si 0xED09 lo pide, copia los colores (0xDF00) y los atributos (0xE100) de sprite a la VRAM 0xF400 / 0xF600"),
    (0, 0x4480): ("cuadro_del_juego", "el estado del juego: despacha 0xDE00 (y 0xDE01 dentro) por la tabla de p00:4494"),
    (0, 0x5DC4): ("sonidos_del_partido", "en el estado 5-4 (el partido): la tecla F5, la cuenta de 0xED99 y el sonido de fondo segun 0xE23C"),
    (0, 0x4BDA): ("apaga_sprites", "R#8 con el bit 1 (SPD) a 1: no se pintan sprites"),
    (0, 0x4BE5): ("enciende_sprites", "R#8 con el bit 1 (SPD) a 0"),
    (1, 0x65BE): ("prepara_maquina", "arranca el sonido, SCREEN 5 (CHGMOD), borde 0, cuatro registros del VDP (0x65E8), la paleta y los sprites"),
    (1, 0x6608): ("mandos_y_teclado", "D = el primer mando con espacio y cursores, E = el segundo con SHIFT, CTRL y GRAPH (activos a 1)"),
    (1, 0x66ED): ("carreras_de_la_entrada", "suma C carreras al equipo que batea: al total (hasta 99) y a la casilla de la entrada"),
    (1, 0x6298): ("contador_del_bateo", "pinta el contador binario del equipo que batea (0xED59 / 0xED5B) en tres cifras"),
    (1, 0x6441): ("pinta_entrada", "pinta la alta o la baja y el numero de la entrada"),
    (1, 0x650E): ("borra_partido", "0xE194-0xEFFB a cero: un partido nuevo"),
    (1, 0x65F0): ("lee_mando", "lee el mando y el teclado: 0xDE07/0xDE09 lo pulsado y 0xDE06/0xDE08 lo recien pulsado"),
    # --- banco 0: aritmetica y despachador ---
    (0, 0x4216): ("hl_mas_a", "HL = HL + A"),
    (0, 0x421B): ("de_mas_a", "DE = DE + A"),
    (0, 0x4220): ("despacha", "salta a la palabra A de la tabla que va pegada detras del `call`"),
    (0, 0x556D): ("palabra_a", "HL = la palabra A de la tabla HL"),
    (0, 0x5FA4): ("multiplica", "HL = A x E (8 x 8 bits)"),
    # --- banco 0: el mapper ---
    (0, 0x438D): ("bancos_1_2_3", "pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL"),
    (0, 0x4392): ("bancos_7_8_9", "pone los bancos 7, 8 y 9 (los graficos) y sus copias"),
    (0, 0x4397): ("bancos_10_11_12", "pone los bancos 10, 11 y 12 (los graficos) y sus copias"),
    (0, 0x439C): ("guarda_y_13_14_15", "guarda el reparto en 0xED46-0xED48 (p00:43D9) y pone 13, 14 y 15"),
    (0, 0x439F): ("bancos_13_14_15", "pone los bancos 13, 14 y 15 y sus copias"),
    (0, 0x43BB): ("devuelve_reparto", "vuelve a poner el reparto guardado en 0xED46-0xED48"),
    (0, 0x43D9): ("guarda_reparto", "copia 0xDDF1-0xDDF3 a 0xED46-0xED48"),
    # --- banco 0: el VDP ---
    (0, 0x4AB7): ("copia_a_vram", "copia BC bytes de HL a la VRAM DE"),
    (0, 0x4AE3): ("byte_a_vram", "escribe A en la VRAM HL"),
    (0, 0x4AF1): ("vram_para_escribir", "pone la direccion HL de la VRAM (17 bits, R#14) para escribir"),
    (0, 0x4B10): ("vram_para_leer", "pone la direccion HL de la VRAM (R#14) para leer"),
    (0, 0x4B35): ("rachas_a_vram", "descomprime las rachas de DE a la VRAM HL (0 acaba, 0x80 trae otro destino)"),
    (0, 0x4B62): ("rachas", "descomprime las rachas de DE a la VRAM HL (C = 0: sin girar)"),
    (0, 0x4B2D): ("rachas_con_destino", "rachas con el destino de la VRAM delante (2 bytes en DE)"),
    (0, 0x4B9F): ("borra_pantalla", "esconde los sprites, apaga la pantalla, rellena la VRAM de 0, R#23 = 0 y la enciende"),
    (0, 0x4BB8): ("enciende_pantalla", "R#1 con el bit 6 (BL) a 1 (WRTVDP)"),
    (0, 0x4BC5): ("apaga_pantalla", "R#1 con el bit 6 (BL) a 0 (WRTVDP)"),
    (0, 0x4BD2): ("esconde_sprites", "escribe 0xD8 (Y = 216: no se pinta ninguno) en la VRAM 0xF600, el primer atributo de sprite"),
    (0, 0x4BF0): ("pon_color", "el color A de la paleta a D (rojo-azul) y E (verde), por R#16, y su copia en 0xDDC0 + 2 x A"),
    (0, 0x4C59): ("pon_paleta", "fichas de 3 bytes [color][rojo-azul][verde] hasta 0xFF, con p00:4BF0"),
    (0, 0x4C67): ("espera_vdp", "espera a que el VDP acabe la orden (S#2 bit 0, CE)"),
    (0, 0x4C71): ("lee_estado", "A = el registro de estado A del VDP (R#15)"),
    (0, 0x4C91): ("linea", "orden LINE (0x70) del VDP desde HL"),
    (0, 0x4CC7): ("linea_vertical", "orden LINE (0x70) del VDP, el lado largo en vertical"),
    (0, 0x4CFE): ("marco", "un marco de lineas: HL la esquina, DE el tamano"),
    (0, 0x4D2A): ("rellena", "orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'"),
    (0, 0x4D66): ("copia_rectangulo", "orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'"),
    (0, 0x4DFB): ("copia_logica", "orden LMMM (0x90 + operacion) del VDP: copia el rectangulo HL a DE, BC de tamano; las paginas en los bits 4-7 de A' y la operacion logica en los 0-3"),
    (0, 0x4DAA): ("rectangulo_desde_ram", "orden HMMC (0xF0) del VDP: el rectangulo DE, BC de tamano, con los bytes de HL"),
    # --- banco 0: textos y dibujos ---
    (0, 0x4EA6): ("texto", "pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto"),
    (0, 0x4EAB): ("texto_c0", "como texto, con C = 0"),
    (0, 0x4EB5): ("texto_en_de", "pinta el texto HL en la posicion DE (sin [x y] delante)"),
    (0, 0x4F1C): ("caracter", "pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)"),
    (0, 0x4F6F): ("siguiente_columna", "D += 8; si da la vuelta, E += 8"),
    (0, 0x4E47): ("caracteres_de_un_bit", "pinta B caracteres de un bit por punto de HL, con el color C, desde DE"),
    (0, 0x4EFC): ("lista_de_caracteres", "pinta la lista de caracteres HL (0xFF acaba, 0xFE baja de linea) desde DE"),
    (0, 0x4FA3): ("dibujos", "pinta la lista de dibujos HL ([n] y fichas de 6 bytes) con las paletas de la tabla DE"),
    (0, 0x4FDD): ("dibujo", "pinta un dibujo de B caracteres (tipo C & 0x0F: 1, 2 o 3 bits por punto) en el bufer 0xE400 y de ahi a la VRAM"),
    (0, 0x5659): ("rachas_a_ram", "descomprime las rachas de DE en la RAM HL"),
    (0, 0x5BF1): ("numero", "pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE"),
    # --- banco 0: sonido ---
    (0, 0x57FF): ("sonido", "pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes"),
    (0, 0x5CAC): ("arranca_sonido", "el arranque del motor de sonido (p04:6000) con los bancos 4-5-6"),
    (0, 0x5C7D): ("esconde_atributos", "pone las 32 fichas de sprite de 0xE100 fuera de la pantalla"),
    # --- banco 6: el motor de sonido ---
    (6, 0xB15E): ("motor_arranque", "calla todo (sonido 1), apaga el SCC y pone el mezclador del PSG a 0xBF"),
    (6, 0xB193): ("motor_pide", "empieza el sonido A: copia su cabecera (0x600A + 2 x A) y prepara cada canal"),
    (6, 0xB41E): ("motor_cuadro", "el sonido de un cuadro: avanza cada canal y escribe el PSG y el SCC"),
    (6, 0xB51E): ("lee_partitura", "lee la partitura del canal IX: 0xFF acaba, 0xD0-0xFE son ordenes y lo de abajo notas"),
    (6, 0xB92F): ("orden_de_partitura", "la orden A de la partitura: 0xD0-0xDF octava y volumen (p06:BB99), 0xE0-0xFE por la tabla 0xB944"),
}

RAM = {
    0xD280: ("la ficha de 0xD280 (nombre de 5 letras, 8 ceros y 4 bytes; p13:71B8)", "p13:71B8"),
    0xDDF0: ("la copia del banco de 0x4000 (0)", "p00:415A"),
    0xDDF1: ("la copia del banco de 0x6000", "p00:43A4, p00:41D5"),
    0xDDF2: ("la copia del banco de 0x8000", "p00:43A4, p00:41DB"),
    0xDDF3: ("la copia del banco de 0xA000", "p00:43A4, p00:41E1"),
    0xDDC0: ("la copia de la paleta (2 bytes por color)", "p00:4C06"),
    0xDE00: ("el estado del juego (indice del despachador principal)", "p00:48A5"),
    0xDE01: ("el paso dentro del estado", "p00:4543, p00:4601"),
    0xDE04: ("la cuenta atras del estado", "p00:4529, p00:4609"),
    0xDE05: ("las marcas de la interrupcion (bit 0: cuadro en marcha, bit 1: sonido, bit 2: lectura del VDP)", "p00:4191-41EF"),
    0xE100: ("los atributos de sprite (32 fichas de 4 bytes [y][x][dibujo][color])", "p00:5C7D, p00:588E"),
    0xE400: ("el bufer de un dibujo a 4 bits antes de la VRAM", "p00:4FF5"),
    0xE800: ("el bufer de las rachas descomprimidas en RAM", "p00:5579"),
    0xEC00: ("los colores de la paleta del dibujo en curso", "p00:4FC0"),
    0xED46: ("el reparto guardado por p00:439C (3 bytes)", "p00:43D9"),
    0xEE00: ("las fichas de los 8 canales de sonido (0x2D bytes cada una)", "p06:B226"),
    0xEFC4: ("la cabecera del sonido que empieza (18 bytes)", "p06:B211"),
    0xEFFA: ("si no es 0, el motor rechaza los sonidos 0x32-0x3C", "p06:B194"),
    0xEFFC: ("el ultimo sonido pedido", "p04:6003"),
}

RAM.update({
    0xE190: ("el modo de juego (0 1PLAYER, 1 2PLAYERS, 2 PENNANT, 3 TEAM EDIT, 4 WATCH, 5 MEDIA SELECT)", "p00:4550, textos p13:7D9F-7DD2"),
    0xDE03: ("el contador de cuadros del juego (sube uno por cuadro)", "p00:4480"),
    0xDE06: ("los botones recien pulsados del mando 1 / cursores", "p01:65F0"),
    0xDE07: ("los botones pulsados del mando 1 / cursores", "p01:65F0"),
    0xDE08: ("los botones recien pulsados (segundo mando)", "p01:65F0"),
    0xDE09: ("los botones pulsados (segundo mando)", "p01:65F0"),
    0xED09: ("la peticion de copiar sprites a la VRAM (1 colores, 2 todo)", "p00:422A"),
    0xED04: ("cuantos sprites rotan (9 o 10)", "p00:429D"),
    0xECE5: ("la rotacion de sprites de este cuadro", "p00:428B"),
    0xED0F: ("los cuadros de la interrupcion", "p00:41AC"),
    0xED4A: ("el reloj de juego: cuadros (0-59)", "p00:4428"),
    0xED4B: ("el reloj de juego: segundos (0-59)", "p00:442F"),
    0xED4C: ("el reloj de juego: minutos, cifra baja", "p00:4434"),
    0xED4D: ("el reloj de juego: minutos, cifra alta", "p00:4434"),
    0xED4E: ("el reloj de juego: horas", "p00:4439"),
    0xE1A0: ("el modo elegido en el menu (no 0: elegido)", "p00:4513"),
    0xDF00: ("los colores de sprite (16 bytes por sprite) antes de la VRAM 0xF400", "p00:4235"),
    0xE194: ("las carreras del visitante (BCD; 0x99 acaba el partido)", "p00:46AE, p00:46CA"),
    0xE196: ("las carreras del local (BCD; 0x99 acaba el partido)", "p00:46B5, p00:46CA"),
    0xE19B: ("la media entrada (bit 0: 0 la alta, 1 la baja; 0x11 = la baja de la 9.a)", "p00:46C4, p00:46E2"),
    0xEDA1: ("si no es 0, el partido vuelve al menu", "p00:46A7"),
    0xED87: ("si no es 0, el partido se acaba", "p00:46A1"),
    0xE198: ("los strikes de la cuenta (3 = eliminado)", "p01:6127"),
    0xE199: ("las bolas de la cuenta (4 = base por bolas, FOUR BALL)", "p01:6134, p13:7DF9"),
    0xE19A: ("los outs de la media entrada", "p01:6151"),
    0xED13: ("los bateadores del visitante (BCD; uno mas por turno, p01:6316)", "p01:6306, p01:60AC"),
    0xED14: ("los bateadores del local (BCD)", "p01:6306, p01:60BC"),
    0xEC4F: ("el orden de bateo del visitante (0-8)", "p01:631B"),
    0xEC61: ("el orden de bateo del local (0-8)", "p01:631B"),
    0xED1B: ("las bases por bolas del visitante (BCD)", "p01:61C7"),
    0xED1C: ("las bases por bolas del local (BCD)", "p01:61C7"),
    0xEFFB: ("la tecla F5 estaba suelta", "p00:5E58"),
    0xED99: ("la espera antes de la siguiente musica", "p00:5E80"),
    0xED9A: ("la siguiente musica", "p00:5E80"),
    0xE33D: ("la musica que suena en el partido", "p00:5DE6"),
    0xEF3B: ("lo que dice el motor que suena", "p00:5DE0"),
    0xE231: ("las 4 fichas de 16 bytes de los corredores (0xE23C = su estado)", "p00:5B0D, p01:61E2"),
    0xE1F6: ("la formacion del campo (0-6)", "p00:5868"),
    0xE1FE: ("el lado por el que batea (0 si IX+6 de su ficha es 0x20, si no 1): elige las tablas del otro lado", "p02:8919"),
    0xFAF5: ("DPPAGE de la BIOS: la pagina que se ve", "p01:6056"),
    0xFAF6: ("ACPAGE de la BIOS: la pagina en la que se pinta", "p00:5993"),
    0xE311: ("las carreras del visitante por entrada (10 casillas, 12-13 el total)", "p01:66FA"),
    0xE321: ("las carreras del local por entrada (10 casillas, 12-13 el total)", "p01:66F2"),
    0xE1A2: ("el desplazamiento de la pantalla, 16 bits (en TEAM EDIT, la fila elegida)", "p01:66B3, p03:B440; p03:B726"),
    0xE211: ("la ficha de 16 bytes de la pelota", "p01:6CD2"),
    0xE213: ("la y de la pelota (vertical)", "ficha 0xE211 + 2; p01:7D0D"),
    0xE215: ("la velocidad y de la pelota", "ficha 0xE211 + 4; p01:7D11"),
    0xE218: ("la x de la pelota", "ficha 0xE211 + 7; p01:7D04"),
    0xE21A: ("la velocidad x de la pelota", "ficha 0xE211 + 9; p01:7D08"),
    0xE220: ("el defensor que tiene la pelota (1-9; 0 nadie)", "p01:6AF1, p01:6D35"),
    0xE22B: ("el defensor que va a por la pelota (desplazamiento de 16 en 16)", "p01:7D27, p01:7FB2"),
    0xE271: ("las 9 fichas de 16 bytes de los defensores", "p01:6ACF"),
    0xE19F: ("el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)", "p01:6B4F, p01:724A"),
    0xE19D: ("el mando del bateador o los corredores", "p01:77D5, p01:7AC0"),
    0xED3E: ("el paso del lanzador del ordenador", "p01:75D8"),
    0xECEE: ("el paso del bateador del ordenador", "p01:7788"),
    0xED29: ("el paso de los corredores del ordenador", "p01:7910"),
    0xECE6: ("el paso de la defensa del ordenador", "p01:7B82"),
    0xE340: ("variable de paso (cada rutina la usa a su manera)", "p00:42C2, p01:6DD5, p02:84EF"),
    0xDE02: ("las marcas del modo: bit 6 un jugador, 5 dos jugadores, 4 PENNANT (contra el ordenador), 3 el ordenador solo", "p00:4A5E, p01:6F52"),
    0xD6DC: ("el equipo del jugador en PENNANT (bit 0)", "p01:6F61, p02:83C9"),
    0xD380: ("la ficha del visitante (255 bytes de p13:731F: nombre de 11 letras y jugadores)", "p13:6F44, p01:63FC"),
    0xD47F: ("la ficha del local (255 bytes de p13:731F; en TEAM EDIT, el paso del dialogo de guardar)", "p13:6F44, p01:6405, p03:BC22"),
    0xD38B: ("los jugadores del visitante (14 bytes cada uno)", "p01:69E9, p02:88BA"),
    0xD48A: ("los jugadores del local (14 bytes cada uno)", "p01:69F5, p02:88C6"),
    0xEC50: ("el orden de bateo del visitante (9 numeros de jugador)", "p02:88E2"),
    0xEC62: ("el orden de bateo del local (9 numeros de jugador)", "p02:88EF"),
    0xED44: ("el jugador del visitante al bate (13 en adelante: lanzador)", "p02:88E9"),
    0xED45: ("el jugador del local al bate", "p02:88F6"),
    0xE1A1: ("el paso de la jugada (y de TEAM EDIT)", "p02:917C, p03:B694"),
    0xED0E: ("el contador de cuadros de la jugada (las piernas de los sprites)", "p02:923A, p01:7023"),
    0xD74C: ("el despachador de los menus (y 0xD74D)", "p00:4521, p00:489D"),
    0xED15: ("los hits del visitante (BCD)", "p02:9325, p02:9054"),
    0xED16: ("los hits del local (BCD)", "p02:9325"),
    0xED17: ("los home runs del visitante (BCD)", "p02:9325"),
    0xED18: ("los home runs del local (BCD)", "p02:9325"),
    0xE33B: ("lo que acaba la jugada: 1 home run, 2 jugada anulada", "p02:931C"),
    0xED21: ("los corredores que entran con el home run", "p02:934E, p01:6974"),
    0xE338: ("el resultado del lanzamiento: 1 strike, 2 bola, 3 pelotazo", "p03:A6E9, p02:8A9D"),
    0xEDDC: ("foul (la jugada se anula y cuenta como strike hasta 2)", "p03:A748, p03:A724"),
    0xED19: ("los eliminados por strikes del visitante (BCD)", "p03:A694"),
    0xED1A: ("los eliminados por strikes del local (BCD)", "p03:A694"),
    0xEDDE: ("la jugada anulada (foul)", "p03:A748, p02:92BF"),
    0xE1D1: ("la marca de acabado de los pasos; en el lanzamiento, su paso (p03:A525)", "p00:44D8, p03:A592"),
    0xDD8E: ("los soportes que hay: bit 0 el disco, bit 1 el Game Master 2", "p14:84C6"),
    0xDD8F: ("el soporte elegido: 0 la RAM, 1 el disco, 2 el Game Master 2", "p14:84D0, p14:814B"),
    0xDD0E: ("el slot del Game Master 2 (0xFF si no esta)", "p13:70CD, p13:70B7"),
    0xD2B1: ("como acabo el paso: 1 bien, 2 mal (o vuelta al menu)", "p13:7243, p14:852F"),
    0xD2B0: ("el paso de MEDIA SELECT y de la grabacion", "p13:6D0E"),
    0xD2E1: ("la espera de los avisos", "p13:6081"),
    0xD6E1: ("el numero de jugadores de PENNANT (1-6)", "p13:633A"),
    0xD753: ("los partidos de cada pareja en PENNANT (1-26)", "p13:641A"),
    0xD759: ("la opcion del menu de PENNANT", "p13:6800"),
    0xD74F: ("la fila del cursor de las listas", "p13:6846"),
    0xD70A: ("los 6 equipos elegidos (0xFF libre)", "p13:6AB5"),
    0xDAAE: ("los nombres de los equipos (11 letras cada uno)", "p13:6028, p14:8423"),
})

RAM16 = {}

# Tramos en los que el juego usa la RAM del partido para otra cosa: alli sus
# nombres no valen. p15:A8AC-AA40 calcula las medias del equipo de TEAM EDIT
# en 0xE1B4-0xE22B (donde en el partido estan la pelota y los demas), y
# p15:B693-BA8E reparte los puntos de los jugadores en esa misma RAM.
RAM_PRESTADA = ((15, 0xA8AC, 0xAA40), (15, 0xB693, 0xBA8E))

# Las fichas de 16 bytes de los que se mueven por el campo: la pelota
# (0xE211), los 4 corredores (0xE231) y los 9 de campo (0xE271, p01:6ACF).
# La y es la vertical (p01:7561 la pone como Y del sprite restando el
# desplazamiento 0xE1A2) y la x la horizontal.
CAMPOS_JUGADOR = {
    0x00: "el numero (bits 0-3) y el estado (bits 4-7)",
    0x01: "la y, fraccion",
    0x02: "la y (vertical)",
    0x03: "la y, byte alto",
    0x04: "la velocidad y, byte bajo",
    0x05: "la velocidad y, byte alto",
    0x06: "la x, fraccion",
    0x07: "la x (horizontal)",
    0x08: "la x, byte alto",
    0x09: "la velocidad x, byte bajo",
    0x0A: "la velocidad x, byte alto",
    0x0B: "las marcas",
    0x0C: "el dibujo de su sprite",
    0x0D: "la base de destino (nibble alto; 2 abajo: llegado)",
    0x0E: "la y de destino",
    0x0F: "la x de destino",
}
CARGAS_JUGADOR = (0xE211, 0xE231, 0xE271, 0xE281)
IX_JUGADOR_POR_DEFECTO = {1: ((0x6AEA, 0x75D5), (0x78F2, 0x7B79)), 2: ((0x8BB8, 0x8FFF),)}

FICHAS = ((CARGAS_JUGADOR, IX_JUGADOR_POR_DEFECTO, CAMPOS_JUGADOR),)
