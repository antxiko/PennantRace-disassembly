# Las pantallas

Todas están dibujadas con código propio (`tools/vram.py` y
`tools/pantallas.py`) siguiendo los pasos de la rutina que las pinta, citada
en cada una. Ninguna es una captura. Cada una se ha comparado con la VRAM de
openMSX volcada con el juego en marcha (`tools/omsx_vram.tcl`,
`tools/coteja_vram.py`); debajo de cada una está cuánto coincide.

El juego va en SCREEN 5 del V9938 (256 × 212 puntos, 16 colores). Casi todo se
pinta en dos pasos: primero se montan los gráficos en la página 1 de la VRAM
(la «hoja», de 32 caracteres por fila) y luego se copian a la página que se ve
con las órdenes del VDP.

## La presentación

![El rótulo](../imagenes/rotulo.png)

El rótulo «THEプロ野球 激突ペナントレース» (`p15:BB97`, `p00:52E7`): los
dibujos de `p09:B07A` y la lista de caracteres de `p09:B6B9`, montados en la
página 1. La presentación lo destapa columna a columna (`p15:BC39`).
**Cotejado: 0 bytes distintos.**

![El estadio](../imagenes/estadio.png)

El estadio que sale debajo (`p00:5427`): los dibujos de `p09:A619` y 16 × 11
caracteres en rachas de `p09:AFC4`, con la paleta de `p07:6000`.
**Cotejado: 0 bytes distintos.**

## El campo

![La zona del centro](../imagenes/campo_1.png)

El campo tiene tres zonas: el centro y los dos lados. Cada una mide 256 × 512
puntos y es un mapa de 16 × 8 mosaicos de 4 × 4 caracteres (`p08:9432`); los
mosaicos salen de `p08:95B8` (y de `p08:9A58` en las dos últimas tiras de la lista). La
pantalla enseña cada vez una parte de la zona.
**Cotejado: zona del centro, las 256 líneas que había en la VRAM, iguales
en dos volcados;** en otros tres difieren de 8 a 22 líneas, que son los letreros y
las tiras que el juego estaba pintando en ese momento.

![El jardín izquierdo](../imagenes/campo_0.png)

La zona del jardín izquierdo (mosaicos de `p08:9B28`).

![El jardín derecho](../imagenes/campo_2.png)

La zona del jardín derecho (mosaicos de `p09:A088`). Estas dos están dibujadas
con el mismo código que la central, pero **no están cotejadas**: la
demostración no sale de la zona del centro.

## El lanzamiento

![La pantalla del lanzamiento](../imagenes/lanceo.png)

La pantalla del lanzamiento, vista desde detrás de la casa (`p01:6352`): el
fondo en rachas de `p08:9220`, dos marcos y el texto de `p13:7E1E` (S B O, el
回 de la entrada, HR y 打率). Sin partido, las casillas y las cifras quedan
vacías. **Cotejado: 728 de 864 bloques iguales**; lo demás es la ventanita de
las bases y las cifras del partido que se estaba jugando.

## Los sprites

![Los patrones de sprite](../imagenes/sprites.png)

Los 64 patrones de 16 × 16 del partido (VRAM `0xF800`-`0xFFFF`), puestos por
`p00:537C`, `p00:539D` y `p00:53CC`. Durante la jugada, `p00:572E` cambia la
postura del lanzador en `0xFAC0` y `p00:5716` la del receptor en `0xFFC0`.
**Cotejado: iguales** salvo esas dos posturas, que dependen del momento.

## La fuente

![La fuente](../imagenes/fuente.png)

161 caracteres de un bit en `p12:B6C3`: cifras, letras, hiragana, katakana y
signos. Se ponen dos veces en la hoja, la segunda en el color 4. Encima van
dos juegos de kanji: 17 de `p09:B942` para el partido (戦打数安本塁三振四死球盗失策防御率)
y 11 de `p09:B9DA` para las pantallas de PENNANT (試合結果勝敗差順位表 y una
comilla).
