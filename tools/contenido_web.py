#!/usr/bin/env python3
"""Lo que la web dice de ESTE cartucho: nombre, cifras, cabecera, hallazgos,
galeria y paginas. La maquinaria (md2html.py, make_web.py) no nombra ningun
juego."""

NOMBRE = "The Pro Yakyuu Gekitotsu Pennant Race"
CATALOGO = "RC-757"
ANIO = 1988
REPOSITORIO = "https://github.com/antxiko/PennantRace-disassembly"

# Las cifras del listado (tools/densidad_total.py y tools/presupuesto.py)
CODIGO = 50191
DATOS = 80881
RUTINAS = 2933          # las que mide densidad.py, todas por encima del minimo
INSTRUCCIONES = 25026
COMENTARIOS = 10940

BANCOS_CON_CODIGO = ("00", "01", "02", "03", "04", "06", "13", "14", "15")

ROTULO_RUTINAS = {"es": "rutinas comentadas, ninguna floja",
                  "en": "commented routines, none thin"}

# Las paginas, en el mismo orden en los dos idiomas (la pareja sale de ahi)
NAV_EN = [("index.html", "Home"), ("GETTING-STARTED.html", "Start"),
          ("THE-GAME.html", "The game"),
          ("THE-SCREENS.html", "The screens"),
          ("THE-MUSIC.html", "The music"),
          ("THE-TEXTS.html", "The texts"),
          ("THE-CARTRIDGE.html", "The cartridge"),
          ("THE-CODE.html", "The code"),
          ("FINDINGS.html", "Findings"),
          ("OPEN-QUESTIONS.html", "Open questions")]
NAV_ES = [("index.html", "Portada"), ("EMPEZAR.html", "Empezar"),
          ("EL-JUEGO.html", "El juego"),
          ("LAS-PANTALLAS.html", "Las pantallas"),
          ("LA-MUSICA.html", "La música"),
          ("LOS-TEXTOS.html", "Los textos"),
          ("EL-CARTUCHO.html", "El cartucho"),
          ("EL-CODIGO.html", "El código"),
          ("HALLAZGOS.html", "Hallazgos"),
          ("PREGUNTAS-ABIERTAS.html", "Preguntas abiertas")]


def densidad(idioma):
    """El porcentaje comentado, con la coma o el punto de cada idioma."""
    d = "%.1f" % (100.0 * COMENTARIOS / INSTRUCCIONES)
    return d.replace(".", ",") if idioma == "es" else d


PIE_LEGAL = {
    "es": "<em>The Pro Yakyuu Gekitotsu Pennant Race</em> lo public&oacute; "
          "Konami para MSX2 en 1988; su n&uacute;mero de cat&aacute;logo es "
          "RC-757 y son 128 KB con el SCC. Todos los derechos siguen siendo de "
          "sus titulares. Este trabajo es de preservaci&oacute;n, estudio y "
          "documentaci&oacute;n, y la imagen del cartucho no se distribuye.",
    "en": "<em>The Pro Yakyuu Gekitotsu Pennant Race</em> was published by "
          "Konami for the MSX2 in 1988; its catalogue number is RC-757 and it "
          "is 128 KB with the SCC. All rights remain with their holders. This "
          "is preservation, study and documentation work, and the cartridge "
          "image is not distributed.",
}

PORTADA = {
    "es": dict(
        titulo="The Pro Yakyuu Gekitotsu Pennant Race - desensamblado comentado",
        claim="El b&eacute;isbol de Konami para MSX2 por dentro: seis equipos "
              "con sus fichas, las reglas que se leen en el c&oacute;digo, el "
              "bateador, el lanzador y los jugadores animados como los mueve el "
              "juego, el campo en tres zonas y 26 m&uacute;sicas de PSG y SCC "
              "sacadas de su propio motor.",
        ficha=["Konami - <b>(c) Konami 1988</b>",
               "Cartucho <b>RC-757</b>, 128 KB con el SCC (mapper Konami SCC)",
               "<b>MSX2</b>", "Volcado <b>e22a6317...</b>"],
        aviso="<b>Aqu&iacute; no hay ninguna captura.</b> Todas las "
              "im&aacute;genes est&aacute;n <b>dibujadas desde los bytes de la "
              "ROM</b> y <b>cotejadas</b> contra la VRAM de openMSX. Las "
              "m&uacute;sicas salen del propio motor y coinciden con openMSX "
              "cuadro a cuadro. El listado se reensambla <b>byte a byte</b> con "
              "<code>make</code>.",
    ),
    "en": dict(
        titulo="The Pro Yakyuu Gekitotsu Pennant Race - a commented disassembly",
        claim="Konami's MSX2 baseball from the inside: six teams with their "
              "player cards, the rules as the code has them, the batter, the "
              "pitcher and the fielders animated the way the game moves them, "
              "the field in three zones and 26 PSG and SCC tunes taken from its "
              "own engine.",
        ficha=["Konami - <b>(c) Konami 1988</b>",
               "An <b>RC-757</b> cartridge, 128 KB with the SCC (Konami SCC mapper)",
               "<b>MSX2</b>", "Dump <b>e22a6317...</b>"],
        aviso="<b>Not one capture here.</b> Every picture is <b>drawn from the "
              "bytes of the ROM</b> and <b>checked</b> against the openMSX VRAM. "
              "The tunes come from the cartridge's own engine and match openMSX "
              "frame by frame. The listing reassembles <b>byte for byte</b> with "
              "<code>make</code>.",
    ),
}

LEIDO = {"es": "<p>Le&iacute;do en el c&oacute;digo.</p>", "en": "<p>Read in the code.</p>"}
COTEJADO = {"es": "<p>Cotejado con openMSX.</p>", "en": "<p>Checked against openMSX.</p>"}

HALLAZGOS = {
    "es": [
        ("Graba en la SRAM del Game Master 2",
         "<p>Adem&aacute;s de en disco, TEAM EDIT y PENNANT graban en el Game "
         "Master 2 de Konami: lo busca por la marca <code>YZ</code> de "
         "<code>0x4010</code>, pone su banco 4 en <code>0x8000</code> y llama "
         "a su rutina de la SRAM con la orden en C (<code>p13:709A</code>, "
         "<code>p13:721D</code>). En el desensamblado del Game Master 2 esa "
         "rutina es <code>p04:8000</code>, la puerta de su sistema de "
         "ficheros.</p>" + LEIDO["es"]),
        ("La velocidad, en km/h y de verdad",
         "<p>Las tres cifras SPD de la ficha del lanzador dan la velocidad de "
         "la pelota: de 80 a 199 km/h (<code>p03:AAE1</code>). Pulsando abajo "
         "al soltar va un cuarto m&aacute;s r&aacute;pida y arriba un cuarto "
         "m&aacute;s lenta; con el aguante agotado pierde de 4 a 7 km/h "
         "(<code>p03:ABAA</code>).</p>" + LEIDO["es"]),
        ("La regla de las diez carreras",
         "<p>Tras cualquier baja, diez carreras de diferencia acaban el partido "
         "(<code>p02:9424</code>). Desde la novena manda la regla de siempre: "
         "se acaba si el local va por delante o si no hay empate al cerrar la "
         "entrada (<code>p02:9428</code>).</p>" + LEIDO["es"]),
        ("PENNANT echa a suertes lo que no juegas",
         "<p>Con un solo jugador, los otros dos partidos de la jornada no se "
         "juegan: cada equipo saca de 0 a 15 carreras al azar y, si empatan, "
         "uno de los dos se lleva una m&aacute;s (<code>p15:AC31</code>).</p>"
         + LEIDO["es"]),
        ("El home run son dos m&uacute;sicas a la vez",
         "<p>El juego pide la 0x2C, que va en el PSG y en un canal del SCC, y "
         "justo detr&aacute;s la 0x3F, que toca los otros tres canales del SCC "
         "(<code>p02:9357</code>).</p>" + COTEJADO["es"]),
        ("La m&uacute;sica sigue a los corredores",
         "<p>Mientras se batea, el fondo depende de la base m&aacute;s adelantada "
         "que est&eacute; ocupada y de qui&eacute;n batea: cuatro temas para el "
         "visitante y cuatro para el local (<code>p00:5E74</code>).</p>"
         + COTEJADO["es"]),
    ],
    "en": [
        ("It saves to the Game Master 2's SRAM",
         "<p>Besides disk, TEAM EDIT and PENNANT save to Konami's Game Master "
         "2: it finds it by the <code>YZ</code> mark at <code>0x4010</code>, "
         "puts its bank 4 at <code>0x8000</code> and calls its SRAM routine "
         "with the command in C (<code>p13:709A</code>, <code>p13:721D</code>). "
         "In the Game Master 2 disassembly that routine is "
         "<code>p04:8000</code>, the door to its file system.</p>" + LEIDO["en"]),
        ("The speed, in real km/h",
         "<p>The three SPD digits on the pitcher's card give the speed of the "
         "ball: 80 to 199 km/h (<code>p03:AAE1</code>). Pressing down on "
         "release makes it a quarter faster and up a quarter slower; with no "
         "stamina left it loses 4 to 7 km/h (<code>p03:ABAA</code>).</p>"
         + LEIDO["en"]),
        ("The ten-run rule",
         "<p>After any bottom half, a ten-run lead ends the game "
         "(<code>p02:9424</code>). From the ninth on the usual rule applies: it "
         "ends if the home team is ahead or if the score is not tied when the "
         "inning closes (<code>p02:9428</code>).</p>" + LEIDO["en"]),
        ("PENNANT draws lots for the games you do not play",
         "<p>With a single player the other two games of the round are not "
         "played: each team gets 0 to 15 runs at random and, on a tie, one of "
         "the two gets one more (<code>p15:AC31</code>).</p>" + LEIDO["en"]),
        ("The home run is two tunes at once",
         "<p>The game asks for 0x2C, on the PSG and one SCC channel, and right "
         "after for 0x3F, which plays the other three SCC channels "
         "(<code>p02:9357</code>).</p>" + COTEJADO["en"]),
        ("The music follows the runners",
         "<p>While a team bats, the background tune depends on the furthest "
         "occupied base and on who is batting: four tunes for the visitors and "
         "four for the home team (<code>p00:5E74</code>).</p>" + COTEJADO["en"]),
    ],
}

LOGOTIPO = "rotulo.png"
GALERIA = [
    ("bateador_derecha.gif",
     "El swing, con los tiempos de <code>p02:8663</code>: cada formaci&oacute;n "
     "copia sus dibujos de sprite de un almac&eacute;n de la VRAM "
     "(<code>p00:5761</code>).",
     "The swing, timed as in <code>p02:8663</code>: each stance copies its "
     "sprite patterns from a store in the VRAM (<code>p00:5761</code>)."),
    ("lanzador_0.gif",
     "El lanzador, pasos 5 a 0 (<code>p03:A597</code>, esperas de "
     "<code>p03:A83F</code>).",
     "The pitcher, steps 5 to 0 (<code>p03:A597</code>, waits from "
     "<code>p03:A83F</code>)."),
    ("presentacion.gif",
     "La presentaci&oacute;n: la pelota se acerca y cruza destapando el "
     "r&oacute;tulo (<code>p15:BB97</code>).",
     "The intro: the ball comes closer and crosses the screen uncovering the "
     "title (<code>p15:BB97</code>)."),
    ("menu.png",
     "El men&uacute; de modos (<code>p01:651C</code>).",
     "The mode menu (<code>p01:651C</code>)."),
    ("campo_jugadores.gif",
     "Defensores y corredores en el campo, cambiando de pierna cada 8 cuadros "
     "(<code>p01:7280</code>, <code>p02:8FC8</code>).",
     "Fielders and runners on the field, switching legs every 8 frames "
     "(<code>p01:7280</code>, <code>p02:8FC8</code>)."),
    ("letreros.png",
     "Los letreros del lanzamiento (<code>p00:5163</code>-<code>p00:51A1</code>).",
     "The pitching signs (<code>p00:5163</code>-<code>p00:51A1</code>)."),
    ("estadio.png",
     "El estadio de la presentaci&oacute;n (<code>p15:BB97</code>).",
     "The stadium of the intro (<code>p15:BB97</code>)."),
    ("lanceo.png",
     "La pantalla del lanzamiento, desde detr&aacute;s de la casa "
     "(<code>p01:6352</code>).",
     "The pitching screen, from behind home plate (<code>p01:6352</code>)."),
    ("campo_1.png",
     "El campo, zona del centro: 256 &times; 512 puntos (<code>p08:9432</code>).",
     "The field, centre zone: 256 &times; 512 pixels (<code>p08:9432</code>)."),
    ("campo_0.png",
     "La zona del jard&iacute;n izquierdo.",
     "The left field zone."),
    ("campo_2.png",
     "La zona del jard&iacute;n derecho.",
     "The right field zone."),
    ("sprites.png",
     "Los patrones de los sprites del partido (<code>p00:537C</code>, "
     "<code>p00:539D</code>, <code>p00:53CC</code>).",
     "The sprite patterns of a game (<code>p00:537C</code>, "
     "<code>p00:539D</code>, <code>p00:53CC</code>)."),
]
