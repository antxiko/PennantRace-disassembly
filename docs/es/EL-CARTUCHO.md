# El cartucho

## Los bancos

128 KB en 16 bancos de 8 KB con el mapper Konami SCC: cuatro ventanas
(`0x4000`, `0x6000`, `0x8000` y `0xA000`) que se cambian escribiendo el número
del banco en `0x5000`, `0x7000`, `0x9000` y `0xB000`. El banco `0x3F` en
`0x9000` abre el SCC en `0x9800`-`0x98FF`.

El banco 0 se queda siempre en `0x4000` y las otras tres ventanas se ponen de
tres en tres: 1-2-3 (`p00:438D`), 7-8-9 (`p00:4392`), 10-11-12 (`p00:4397`) y
13-14-15 (`p00:439F`). El reparto puesto se guarda en `0xDDF1`-`0xDDF3`. El
sonido pone los bancos 4-5-6 un momento y vuelve al reparto de antes.

| bancos | qué hay |
|---|---|
| p00 | el núcleo: el arranque, la interrupción, el despachador de estados (`p00:4220`), el VDP, los dibujos, los textos y las peticiones de sonido |
| p01-p03 | el partido: lanzamiento, bateo, corredores, defensa, cámara, marcador y orden de bateo |
| p04-p06 | el sonido: la tabla de 72 sonidos (`p04:600C`), las partituras (p05) y el motor (p06) |
| p07-p12 | los gráficos: paletas, dibujos, el mapa del campo (`p08:9432`) y sus mosaicos, los kanji (p09), los sprites (p10-p11) y la fuente (p12) |
| p13-p15 | los menús, PENNANT, TEAM EDIT, la grabación, la presentación y los seis equipos (`p13:731F`) |

## Los dibujos

Casi todo lo que se ve sale de listas de dibujos (`p00:4FA3`): un número de
fichas y, por ficha, 6 bytes `[paleta-tipo][VRAM][n][puntero]`. El tipo dice
cuántos bits lleva cada punto: 0 y 1, un bit; 2 y 3, dos; 4 y 5, tres. Los
impares se pintan en espejo. El nibble alto elige la paleta en una tabla que
da 2, 4 u 8 colores; cada combinación de bits es uno de ellos.

Lo grande va en rachas (`p00:4B35`): un byte de cuenta; 0 acaba, con el bit 7
a 0 repite el byte siguiente, `0x80` trae otro destino y de `0x81` a `0xFF`
copia los bytes tal cual.

## Los textos

`p00:4EA6` y sus hermanas ponen los bancos 13-14-15 y leen `[x y]` y
caracteres de la fuente hasta `0xFF`; `0xFE` trae otra posición y `0xFD` es
medio espacio. Ver [Los textos](LOS-TEXTOS.html).

## El sonido

Cada sonido tiene una cabecera (`p04:600A` + 2 × número): una máscara de
canales (bit 7 el canal 1, bit 0 el canal 8; del 1 al 3 el PSG, del 4 al 8 el
SCC), una prioridad y un puntero a la partitura de cada canal. En las
partituras, de `0xD0` a `0xFE` son órdenes (`p06:B92F`: la octava, la prioridad
y otras por una tabla), lo de debajo son notas y `0xFF` acaba. El motor
avanza cada canal en la interrupción (`p06:B41E`) y escribe el PSG y el SCC
(`p06:BBB8`). Ver [La música](LA-MUSICA.html).

## La grabación

TEAM EDIT y PENNANT graban en uno de tres sitios: la RAM, el disco o la SRAM
del Game Master 2 (`p13:6007`).

- **El disco** va por el BDOS (`0xF37D`). Antes de cada llamada se aparta la
  RAM del juego que pisaría el DOS (`p14:8334`) y después se devuelve.
- **El Game Master 2** se busca en los cuatro slots y sus subslots: es el
  cartucho que lleva `YZ` en `0x4010` (`p13:709A`). Para usarlo, pone su banco
  4 en `0x8000` y llama a `0x8000` con la orden en C: 5 el directorio, `0x0A`
  grabar y `0x0B` leer (`p13:721D`). La liga se graba con el nombre `PENAN`.
  Mientras tanto quita el gancho H.KEYI (H.TIMI para el directorio).
