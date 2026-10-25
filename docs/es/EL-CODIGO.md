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
  pantalla. `tools/sprites.py` pinta los sprites como el V9938 (con el bit CC)
  y monta el bateador y el lanzador como el juego; `tools/animaciones.py`
  saca los GIF con los tiempos del código. `tools/omsx_vram.tcl` vuelca la VRAM
  de openMSX y `tools/coteja_vram.py` compara.
- `tools/musica.py` ejecuta el motor de sonido en un Z80 de Python y saca los
  MP3; `tools/omsx_psg.tcl` y `tools/coteja_psg.py` lo cotejan con openMSX.
  La sonda deja pasar una sola petición del juego, puede poner a cero bytes
  de RAM en cada cuadro (el tono libre) y desvía el arranque del motor tras la
  primera vez.
- `tools/textos.py`, `tools/equipos.py` y `tools/fuente.py` sacan los textos,
  los equipos y la fuente.

## Código compartido con otros cartuchos de Konami

Este desensamblado se ha comparado, instrucción por instrucción, con
todos los demás de Konami de la serie. Cuenta un bloque cuando las
mismas instrucciones, al menos seis desde una etiqueta hasta su `ret`
o su salto sin condición, están en los dos cartuchos; las direcciones
no se miran, porque cambian de un cartucho a otro. De los otros 57,
**46** tienen al menos un bloque en común con este; estos son los
que más comparten:

| Cartucho | Bloques | Instrucciones | Por ejemplo (aquí = allí) |
|---|---:|---:|---|
| [Gekitotsu Pennant Race 2](https://antxiko.github.io/PennantRace2-disassembly/es/) | 119 | 1.758 | `dibujos` (p00:4FA3) |
| [King's Valley II](https://antxiko.github.io/KingsValley2-disassembly/es/) | 85 | 1.378 | `rachas_con_destino` (p00:4B2D) |
| [Parodius](https://antxiko.github.io/Parodius-disassembly/es/) | 71 | 1.189 | `sonido` (p00:57FF) = `pide_sonido` |
| [Salamander - Operation X](https://antxiko.github.io/Salamander-disassembly/es/) | 70 | 1.140 | `sonido` (p00:57FF) = `pide_sonido` |
| [Nemesis 3 - The Eve of Destruction](https://antxiko.github.io/Nemesis3-disassembly/es/) | 61 | 973 | `cartucho_en_pagina_2` (p00:43EC) = `cartucho_en_8000` |
| [Konami’s Game Master 2](https://antxiko.github.io/GameMaster2-disassembly/es/) | 59 | 976 | `rectangulo_desde_ram` (p00:4DAA) = `vdp_hmmc` |
| [Contra](https://antxiko.github.io/Contra-disassembly/es/) | 56 | 1.007 | `nota_empieza` (p06:B6AF) |
| [Hai no Majutsushi - Mahjong 2](https://antxiko.github.io/Majutsushi-disassembly/es/) | 52 | 581 | `cartucho_en_pagina_2` (p00:43EC) = `cartucho_en_8000` |
| [Shalom: Knightmare III](https://antxiko.github.io/Shalom-disassembly/es/) | 43 | 539 | `cartucho_en_pagina_2` (p00:43EC) = `cartucho_en_8000` |
| [F-1 Spirit — The Way to Formula 1](https://antxiko.github.io/F1Spirit-disassembly/es/) | 41 | 704 | `canal_ocupa` (p06:B305) = `SONIDO_CANAL` |

La matriz entera, los 58 cartuchos entre sí, está en
[Las rutinas](https://antxiko.github.io/MSX-disassembly-database/es/LAS-RUTINAS.html) de la base de datos de la
serie, con el método y el programa que la mide.
