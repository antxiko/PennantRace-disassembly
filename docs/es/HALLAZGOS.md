# Hallazgos

## Graba en la SRAM del Game Master 2

Además de en disco, TEAM EDIT y PENNANT graban en el Game Master 2 de Konami.
Lo busca en todos los slots por la marca `YZ` de `0x4010`, pone su banco 4 en
`0x8000` y llama a su rutina de la SRAM con la orden en C: 5 el directorio,
`0x0A` grabar y `0x0B` leer (`p13:709A`, `p13:721D`). En el
[desensamblado del Game Master 2](https://antxiko.github.io/GameMaster2-disassembly/es/)
esa rutina es `p04:8000`, la puerta de su sistema de ficheros, y el cartucho
lleva de verdad `YZ` en `0x4010`. Leído en el código de los dos cartuchos; no
se ha probado a grabar.

## La velocidad, en km/h y de verdad

Las tres cifras SPD de la ficha del lanzador dan la velocidad de la pelota: de
80 a 199 km/h (`p03:AAE1`). Pulsando abajo al soltar va un cuarto más rápida y
arriba un cuarto más lenta; con el aguante agotado, la ficha pierde de 4 a 7
km/h (`p03:ABAA`).

## La regla de las diez carreras

Tras cualquier baja, diez carreras de diferencia acaban el partido
(`p02:9424`), y durante una baja se acaba en cuanto el local gana por diez
(`p00:46D8`). Desde la novena manda la regla de siempre (`p02:9428`).

## PENNANT echa a suertes lo que no juegas

Con un solo jugador, los otros dos partidos de la jornada no se juegan: cada
equipo saca de 0 a 15 carreras al azar y, si empatan, uno de los dos se lleva
una más (`p15:AC31`).

## El home run son dos músicas a la vez

El juego pide la 0x2C, que va en el PSG y en un canal del SCC, y justo detrás
la 0x3F, que toca los otros tres canales del SCC (`p02:9357`). Cotejado con
openMSX.

## La música sigue a los corredores

Mientras se batea, el fondo depende de la base más adelantada que esté ocupada
y de quién batea: cuatro temas para el visitante y cuatro para el local
(`p00:5E74`). La 0x32, la de empezar el partido (`p00:466E`), es la misma que
la 0x33, la del visitante con las bases vacías.

## Dos juegos de kanji en el mismo sitio

En el partido, los códigos `0x7F`-`0x8F` son 17 kanji para las cifras
(打, 数, 本, 塁, 防, 御, 率...). Las pantallas de PENNANT cargan encima otros 11
(試合結果, 順位表...) en `0x82`-`0x8C` o en `0xA0`-`0xAA` (`p00:52D9`,
`p00:52C7`): el mismo código es un carácter u otro según la pantalla.

## Seis equipos con tema

Los jugadores de cada equipo se llaman como aviones (FLYERS), motos (RIDERS),
estaciones de Kobe (KOBE LINES), cafés y tés (BRENDS) o términos de
programación (PROGRAMS: にーもにっく, れじすた, あせんぶる); los DARKS llevan
apellidos. Los temas son lectura nuestra de los nombres (`p13:731F`).
