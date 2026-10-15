# The Pro Yakyuu Gekitotsu Pennant Race (RC-757)

*The Pro Yakyuu Gekitotsu Pennant Race* (Konami, 1988) es el béisbol de Konami
para MSX2: seis equipos de serie, partidos contra el ordenador o entre dos, una
liga de hasta seis jugadores (PENNANT) y un editor de equipos (TEAM EDIT) que
graba en disco o en la SRAM del Game Master 2. Es un MegaROM de 128 KB con el
SCC.

![El rótulo de la presentación](../imagenes/rotulo.png)

Aquí está su código entero: los 131.072 bytes, en 16 bancos de 8 KB, se
vuelven a montar byte a byte, y el 43,7 % de las instrucciones va comentado.

## Qué hay en esta web

- [El juego](EL-JUEGO.html): los seis equipos con sus fichas, las reglas
  sacadas del código y los modos.
- [Las pantallas](LAS-PANTALLAS.html): el logo, la presentación animada, el
  menú, el campo en tres zonas, la pantalla del lanzamiento con sus letreros,
  el bateador, el lanzador y los jugadores animados, y la fuente, dibujados
  desde la ROM.
- [La música](LA-MUSICA.html): las 26 piezas, sacadas de su propio motor.
- [Los textos](LOS-TEXTOS.html): todo lo que escribe en pantalla.
- [El cartucho](EL-CARTUCHO.html): los bancos, los formatos de los dibujos y
  los textos, el sonido y la grabación.
- [El código](EL-CODIGO.html): cómo está hecho el desensamblado y cómo se
  vuelve a montar.
- [Hallazgos](HALLAZGOS.html) y [Preguntas abiertas](PREGUNTAS-ABIERTAS.html).

## Aquí no hay capturas

Todas las imágenes están dibujadas con código propio leyendo las tablas del
cartucho y comparadas con la VRAM de openMSX; cada pantalla dice cuánto
coincide. Las músicas salen de ejecutar el motor de sonido del cartucho y
coinciden con openMSX cuadro a cuadro.

## Montarlo

Hace falta la imagen del cartucho, que no se distribuye: `pennantrace.rom`,
el volcado GoodMSX (sha1 `e22a6317...`, 131.072 bytes), en la raíz.
`make verify` vuelve a montar los 16 bancos y comprueba que salen idénticos.
