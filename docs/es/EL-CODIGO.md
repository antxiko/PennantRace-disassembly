# El código

Un listado por banco en `src/pennantrace_pNN.asm` (de p00 a p15), que se monta
con pasmo y sale idéntico a la ROM: `make verify`. El 100 % del binario está
explicado: 50.191 bytes de código y 80.881 de datos. De las 25.026
instrucciones, el 43,7 % va comentado, y ninguna de las 2.933 rutinas queda
por debajo del mínimo de comentarios. Todos los bancos con código pasan del
40 %.

## Cómo está hecho

- `tools/z80trace.py` recorre el código desde sus entradas (el arranque, la
  interrupción y los despachadores) y separa código de datos.
- `tools/bancos.py` y `tools/cartucho.py` saben qué banco va en cada ventana:
  los repartos de tres en tres, los saltos entre bancos y las rutinas que
  vuelven con otro reparto (`tools/colas.py`).
- Los datos se identifican por quién los lee (`tools/lectores.py`): dibujos,
  rachas, textos, paletas, mosaicos, cabeceras y partituras de sonido.
- `tools/anota.py` comenta las variables, la BIOS, las llamadas y las fichas
  de los jugadores en el campo; `tools/check_refs.py` comprueba que cada
  referencia `pNN:XXXX` de los comentarios cae en una instrucción o un bloque
  de datos de ese banco.
- 12 pruebas (`tests/`) y `make sanity` vigilan el montaje y el trazado.

## Las imágenes y la música

- `tools/vram.py` es una VRAM de V9938 en Python con lo que usa el juego:
  dibujos, rachas, caracteres de un bit, órdenes de copia y paletas.
  `tools/pantallas.py` repite paso a paso las rutinas que pintan cada
  pantalla. `tools/omsx_vram.tcl` vuelca la VRAM de openMSX y
  `tools/coteja_vram.py` compara.
- `tools/musica.py` ejecuta el motor de sonido en un Z80 de Python y saca los
  MP3; `tools/omsx_psg.tcl` y `tools/coteja_psg.py` lo cotejan con openMSX.
  La sonda deja pasar una sola petición del juego, puede poner a cero bytes
  de RAM en cada cuadro (el tono libre) y desvía el arranque del motor tras la
  primera vez.
- `tools/textos.py`, `tools/equipos.py` y `tools/fuente.py` sacan los textos,
  los equipos y la fuente.
