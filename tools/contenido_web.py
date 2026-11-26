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
    ("menu_alineacion.png",
     "STARTING LINE-UP (<code>p03:A2ED</code>).",
     "STARTING LINE-UP (<code>p03:A2ED</code>)."),
    ("menu_clasificacion.png",
     "Los resultados y la clasificaci&oacute;n de PENNANT (<code>p15:ADFA</code>).",
     "The PENNANT results and standings (<code>p15:ADFA</code>)."),
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
ESTILO = '\n:root{--tinta:#cfd0d4;--suave:#83868f;--fondo:#000;--panel:#0c0e13;--linea:#23262e;\n  --rojo:#ff897d;--cyan:#65dbef;--verde:#3eb849;--oro:#ded087}\n@media (prefers-color-scheme:light){:root{--tinta:#191a1e;--suave:#5a5d66;--fondo:#e9e7e1;\n  --panel:#f7f6f2;--linea:#d0cdc5;--rojo:#b23f34;--cyan:#1c6b7c;--verde:#2b7734;--oro:#8a7420}}\n:root[data-theme="dark"]{--tinta:#cfd0d4;--suave:#83868f;--fondo:#000;--panel:#0c0e13;\n  --linea:#23262e;--rojo:#ff897d;--cyan:#65dbef;--verde:#3eb849;--oro:#ded087}\n:root[data-theme="light"]{--tinta:#191a1e;--suave:#5a5d66;--fondo:#e9e7e1;--panel:#f7f6f2;\n  --linea:#d0cdc5;--rojo:#b23f34;--cyan:#1c6b7c;--verde:#2b7734;--oro:#8a7420}\n*{box-sizing:border-box}\nbody{margin:0;background:var(--fondo);color:var(--tinta);padding:0 1.25rem 6rem;\n  font:15px/1.7 ui-monospace,"SF Mono",Menlo,Consolas,monospace}\n.w{max-width:1120px;margin:0 auto}\n.n{max-width:68ch}\nh1,h2,h3,h4{font-weight:400;text-wrap:balance}\na{color:var(--cyan)}\nimg{image-rendering:pixelated;max-width:100%;height:auto;display:block}\nheader.top{display:flex;flex-direction:column;align-items:center;gap:1.5rem;\n  padding:4rem 0 2rem;text-align:center}\nheader.top img{width:min(100%,642px)}\n.claim{max-width:60ch;color:var(--suave);font-size:1.05rem}\n.claim b{color:var(--tinta);font-weight:400}\n.ficha{display:flex;flex-wrap:wrap;justify-content:center;gap:0 1.5rem;width:100%;\n  font-size:12px;letter-spacing:.08em;text-transform:uppercase;color:var(--suave);\n  border-top:1px solid var(--linea);border-bottom:1px solid var(--linea);padding:.85rem 0}\n.ficha b{color:var(--rojo);font-weight:400}\nnav{display:flex;flex-wrap:wrap;gap:1.25rem;justify-content:center;padding:1.25rem 0;\n  font-size:12px;letter-spacing:.08em;text-transform:uppercase}\nnav a{color:var(--suave);text-decoration:none;border-bottom:1px solid transparent}\nnav a:hover,nav a:focus{color:var(--tinta);border-bottom-color:var(--rojo)}\nnav.docs{border-top:1px solid var(--linea);border-bottom:1px solid var(--linea);\n  margin-bottom:1rem}\nsection{margin-top:4.5rem;scroll-margin-top:1rem}\nsection>h2{font-size:1rem;letter-spacing:.1em;text-transform:uppercase;\n  border-left:3px solid var(--rojo);padding-left:.9rem;margin:0 0 1.5rem}\n.cifras{display:grid;gap:1px;background:var(--linea);border:1px solid var(--linea);\n  grid-template-columns:repeat(auto-fit,minmax(160px,1fr))}\n.cifra{background:var(--panel);padding:1.1rem}\n.cifra b{display:block;font-size:1.7rem;color:var(--oro);font-weight:400;\n  font-variant-numeric:tabular-nums;line-height:1.2}\n.cifra span{font-size:11px;letter-spacing:.07em;text-transform:uppercase;color:var(--suave)}\n.hall{border-top:1px solid var(--linea);padding-top:1.75rem;margin-top:2.5rem}\n.hall:first-of-type{border-top:0;padding-top:0;margin-top:0}\n.hall h3{margin:0 0 .75rem;font-size:1.15rem;color:var(--rojo)}\n.hall h4{color:var(--oro);margin:1.5rem 0 .5rem;font-size:.95rem}\n.hall p{margin:0 0 1rem}\npre.asm{background:var(--panel);border-left:2px solid var(--verde);margin:1.25rem 0;\n  padding:1rem 1.1rem;overflow-x:auto;font-size:13px;line-height:1.6;color:var(--tinta)}\n.par{display:grid;gap:1.25rem;grid-template-columns:1fr}\n@media(min-width:820px){.par{grid-template-columns:1fr 1fr}}\n.par figure{margin:0}\ntable{border-collapse:collapse;width:100%;margin:1.25rem 0;font-size:13px;display:block;\n  overflow-x:auto}\nth,td{text-align:left;padding:.5rem .75rem;border-bottom:1px solid var(--linea)}\nth{color:var(--suave);font-weight:400;font-size:11px;letter-spacing:.07em;text-transform:uppercase}\ntd.num{font-variant-numeric:tabular-nums;color:var(--oro)}\n.nivel{margin-top:2rem}\n.nivel h3{margin:0 0 .9rem;font-size:.95rem;letter-spacing:.06em;text-transform:uppercase}\n.nivel em{color:var(--cyan);font-style:normal}\n.sep{color:var(--suave);margin:0 .6rem}\n.rejilla{display:grid;gap:.9rem;grid-template-columns:repeat(auto-fill,minmax(250px,1fr))}\n.rejilla figure{margin:0;background:var(--panel);box-shadow:0 0 0 1px var(--linea)}\n.rejilla figcaption{display:flex;justify-content:space-between;padding:.45rem .65rem;\n  font-size:11px;color:var(--suave);border-top:1px solid var(--linea)}\n.dir{font-variant-numeric:tabular-nums;color:var(--verde)}\nfooter{margin-top:5rem;padding-top:1.5rem;border-top:1px solid var(--linea);\n  color:var(--suave);font-size:12px}\n\n/* Aviso de trabajo en curso: tiene que verse antes que las cifras, porque un\n   100% mal leido hace mas dano que no ponerlo. */\n.aviso{background:#3a2a10;border-left:3px solid var(--oro);margin:1.5rem auto;\n  padding:1rem 1.2rem;max-width:900px;border-radius:4px}\n.aviso p{margin:0;color:var(--tinta);font-size:15px;line-height:1.65}\n.galeria{display:grid;grid-template-columns:repeat(auto-fit,minmax(280px,1fr));\n  gap:1.5rem;margin:1.5rem 0}\n.galeria figure{margin:0}\n.galeria img{width:100%;height:auto;image-rendering:pixelated;\n  border:1px solid var(--linea);border-radius:3px}\n.galeria figcaption{color:var(--suave);font-size:13px;margin-top:.5rem}\naudio{display:block;width:100%;max-width:640px;margin:.75rem 0 1.5rem}\n'

EDITOR = 'Konami'

# La portada: las cifras y el pie tal como estaban
for _i, _c in {'es': ([('100 %', 'del binario explicado'), ('2.933', 'rutinas comentadas, ninguna floja'), ('43,7 %', 'del listado comentado'), ('50.191', 'bytes de código'), ('80.881', 'bytes de datos'), ('0', 'bytes sin identificar')], 'El cartucho en cifras', 'Esto es trabajo de documentación y preservación: el código y los gráficos siguen siendo de sus autores y de Konami, y la imagen del cartucho no se distribuye.'), 'en': ([('100%', 'of the binary explained'), ('2,933', 'commented routines, none thin'), ('43.7%', 'of the listing commented'), ('50,191', 'bytes of code'), ('80,881', 'bytes of data'), ('0', 'bytes unidentified')], 'The cartridge in numbers', 'This is documentation and preservation work: the code and artwork still belong to their authors and to Konami, and the cartridge image is not distributed.')}.items():
    PORTADA[_i]["cifras"] = _c[0]
    PORTADA[_i]["h_num"] = _c[1]
    PORTADA[_i]["pie_leg"] = _c[2]

PAGINAS = [
    [('THE-GAME.html', 'EL-JUEGO.html', 'The game', 'El juego',
      'what the game is and how it plays',
      'qu&eacute; es el juego y c&oacute;mo se juega'),
     ('THE-SCREENS.html', 'LAS-PANTALLAS.html', 'The screens', 'Las pantallas',
      'all of them are drawn with our own code',
      'todas est&#225;n dibujadas con c&#243;digo propio'),
     ('THE-TEXTS.html', 'LOS-TEXTOS.html', 'The texts', 'Los textos',
      '100 texts taken from the ROM with tools/textos.py',
      '100 textos sacados de la ROM con tools/textos.py'),
     ('THE-PICTURES.html', 'LAS-IMAGENES.html', 'What the cartridge draws', 'Lo que el cartucho dibuja',
      'every picture drawn from the ROM, with its caption',
      'todas las im&aacute;genes dibujadas desde la ROM, con su pie'),
     ('THE-MUSIC.html', 'LA-MUSICA.html', 'The music', 'La m&#250;sica',
      'the tunes, from its own sound engine',
      'las m&uacute;sicas, de su propio motor de sonido')],
    [('CURIOSITIES.html', 'CURIOSIDADES.html', 'Curiosities', 'Curiosidades',
      'what turned up when taking it apart, and what is still open',
      'lo que apareci&oacute; al desmontarlo y lo que queda abierto')],
    [('UNDER-THE-HOOD.html', 'POR-DENTRO.html', 'Under the hood', 'Por dentro',
      'getting started, the cartridge and the code',
      'empezar, el cartucho y el c&oacute;digo')],
]

VIEJAS = {
    'FINDINGS.html': 'CURIOSITIES.html',
    'HALLAZGOS.html': 'CURIOSIDADES.html',
    'GETTING-STARTED.html': 'UNDER-THE-HOOD.html',
    'EMPEZAR.html': 'POR-DENTRO.html',
    'OPEN-QUESTIONS.html': 'CURIOSITIES.html',
    'PREGUNTAS-ABIERTAS.html': 'CURIOSIDADES.html',
    'THE-CARTRIDGE.html': 'UNDER-THE-HOOD.html',
    'EL-CARTUCHO.html': 'POR-DENTRO.html',
    'THE-CODE.html': 'UNDER-THE-HOOD.html',
    'EL-CODIGO.html': 'POR-DENTRO.html',
}
