# El juego

Todo lo de esta página está leído en el código del cartucho; cada cosa lleva
la dirección donde se ve.

## Los modos

El menú (`p01:6543`) tiene cinco: **1PLAYER**, **2PLAYERS**, **PENNANT**,
**TEAM EDIT** y **WATCH**. Si hay a la vez una unidad de disco y un Game
Master 2, sale un sexto, **MEDIA SELECT**, para elegir dónde se graba
(`p01:6561`). El modo se guarda como número del 0 al 5 y, para el partido, como
marcas: un jugador, dos, PENNANT o el ordenador solo (`p00:4A5E`).

- **PENNANT** es la liga: de 1 a 6 jugadores (`p13:633A`) y de 1 a 26 partidos
  por pareja de equipos (`p13:641A`). Lleva la tabla de resultados (試合結果)
  y la clasificación (順位表) con victorias, derrotas, porcentaje y diferencia.
  Con un solo jugador, los otros dos partidos de la jornada se echan a suertes:
  cada equipo saca de 0 a 15 carreras y, si empatan, uno de los dos se lleva
  una más (`p15:AC31`).
- **TEAM EDIT** cambia nombres y cifras de los equipos, con topes (abajo), y
  los graba en disco o en la SRAM del Game Master 2.

## Las reglas

- Tres strikes; cuatro bolas (FOUR BALL) o el pelotazo (DEAD BALL) dan la
  base.
- El partido se acaba (`p02:940A`, `p00:46A1`):
  - tras cualquier baja, con 10 carreras de diferencia, y en cuanto el local
    gana por 10 durante una baja;
  - desde la 9.ª, tras la alta si gana el local, tras la baja si no hay
    empate, y en cuanto el local se pone por delante en la baja;
  - si un marcador llega a 99.
- La velocidad del lanzamiento sale de las tres cifras SPD de la ficha: de 80
  a 199 km/h (`p03:AAE1`). Pulsando abajo al soltar va un cuarto más rápida;
  arriba, un cuarto más lenta (`p03:AB32`).
- Cada lanzamiento cansa: 1 el normal, 4 el rápido y 2 el lento. Cuando se
  acaba el aguante, la velocidad de la ficha baja de 4 a 7 km/h (sin bajar de
  80) y, de vez en cuando, cada efecto pierde un punto (`p03:ABAA`).
- En TEAM EDIT, un cambio que pase de los topes se deshace (`p15:B693`):
  - los 12 jugadores de campo suman como mucho 3,500 de 打率, 200 HR y 600 de
    RUN;
  - los 4 lanzadores suman como mucho 540 de SPD, 9,90 de 防御率, 200 de STM y
    25 en cada uno de los tres efectos (C, S y F).

## Los equipos

Seis equipos de serie (`p13:731F`): cada ficha tiene el nombre, 12 jugadores
de campo y 4 lanzadores. Las columnas son las de la pantalla de TEAM EDIT; los
nombres van en hiragana. Los equipos de serie no tienen por qué cumplir los
topes de TEAM EDIT: los FLYERS suman 590 de SPD.

Cada equipo tiene un tema (lectura nuestra de los nombres): los FLYERS se
llaman como aviones (ふぁんとむ, ぜろ, とむきゃっと), los RIDERS como motos
(かたな, にんじゃ), los KOBE LINES como estaciones de Kobe (ろっこう,
さんのみや), los BRENDS como cafés y tés (きりまん, だじりん), los PROGRAMS como
términos de programación (にーもにっく, れじすた, あせんぶる) y los DARKS
llevan apellidos.

### FLYERS (p13:7727)

| | NAME | LR | 打率 | HR | RUN |
|---|---|---|---|---|---|
| 1 | ふぁんとむ | R | .287 | 24 | 99 |
| 2 | ひえん | R | .290 | 32 | 82 |
| 3 | とむきゃっと | L | .342 | 37 | 75 |
| 4 | ぜろ | R | .337 | 50 | 50 |
| 5 | いーぐる | L | .307 | 44 | 62 |
| 6 | はりあー | R | .310 | 30 | 44 |
| 7 | たいがー | R | .283 | 29 | 72 |
| 8 | すかいほーく | L | .261 | 33 | 65 |
| 9 | もすきーと | L | .284 | 51 | 81 |
| 10 | らいでん | R | .275 | 26 | 93 |
| 11 | あるはとろす | R | .274 | 33 | 86 |
| 12 | ふおけうるふ | L | .248 | 35 | 70 |

| | NAME | LR | U/D | SPD | 防御率 | STM | C | S | F |
|---|---|---|---|---|---|---|---|---|---|
| 1 | しでんかい | R | U | 160 | 1.32 | 43 | 9 | 9 | 9 |
| 2 | みらーじゅ | L | U | 150 | 2.79 | 75 | 3 | 8 | 1 |
| 3 | ふぉっかー | L | D | 140 | 2.61 | 40 | 9 | 9 | 1 |
| 4 | しゅみっと | R | U | 140 | 2.60 | 19 | 9 | 0 | 9 |

### RIDERS (p13:732B)

| | NAME | LR | 打率 | HR | RUN |
|---|---|---|---|---|---|
| 1 | はりけーん | R | .287 | 5 | 96 |
| 2 | かたな | L | .310 | 11 | 91 |
| 3 | しゃどう | R | .326 | 38 | 78 |
| 4 | はあれい | L | .333 | 45 | 82 |
| 5 | とらい | R | .324 | 32 | 36 |
| 6 | じいた | L | .290 | 20 | 65 |
| 7 | にんじゃ | R | .348 | 14 | 72 |
| 8 | ば は | L | .254 | 9 | 84 |
| 9 | えりみねーた | R | .257 | 12 | 55 |
| 10 | いんとるーた | L | .270 | 6 | 42 |
| 11 | ふぁらお | R | .246 | 10 | 46 |
| 12 | りくおう | L | .301 | 18 | 62 |

| | NAME | LR | U/D | SPD | 防御率 | STM | C | S | F |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ふぇいざー | R | U | 161 | 1.45 | 55 | 8 | 8 | 8 |
| 2 | ぱりだか | L | D | 130 | 2.09 | 82 | 2 | 9 | 0 |
| 3 | ほうく | R | U | 140 | 2.25 | 41 | 5 | 5 | 5 |
| 4 | ぶろす | L | U | 145 | 3.60 | 34 | 2 | 9 | 0 |

### KOBE LINES (p13:742A)

| | NAME | LR | 打率 | HR | RUN |
|---|---|---|---|---|---|
| 1 | ろっこう | L | .230 | 5 | 53 |
| 2 | みかげ | R | .243 | 6 | 50 |
| 3 | あしや | R | .280 | 9 | 31 |
| 4 | おかもと | L | .298 | 12 | 23 |
| 5 | たかとり | L | .203 | 8 | 36 |
| 6 | にしのみや | R | .221 | 8 | 40 |
| 7 | ぽーあい | R | .159 | 5 | 42 |
| 8 | いたやど | L | .188 | 7 | 10 |
| 9 | はなくま | L | .199 | 7 | 4 |
| 10 | たるみ | R | .205 | 3 | 18 |
| 11 | おうじ | R | .176 | 4 | 25 |
| 12 | ふかえ | L | .243 | 1 | 21 |

| | NAME | LR | U/D | SPD | 防御率 | STM | C | S | F |
|---|---|---|---|---|---|---|---|---|---|
| 1 | さんのみや | R | D | 130 | 2.04 | 91 | 9 | 9 | 0 |
| 2 | な だ | R | U | 155 | 2.82 | 34 | 5 | 3 | 1 |
| 3 | もとまち | R | U | 140 | 1.53 | 50 | 5 | 2 | 0 |
| 4 | す ま | L | U | 150 | 2.26 | 18 | 3 | 9 | 9 |

### BRENDS (p13:7628)

| | NAME | LR | 打率 | HR | RUN |
|---|---|---|---|---|---|
| 1 | あめりかん | R | .208 | 15 | 41 |
| 2 | も か | L | .254 | 27 | 32 |
| 3 | きりまん | L | .320 | 31 | 15 |
| 4 | ぶるまん | R | .303 | 39 | 8 |
| 5 | えすぷれそ | R | .298 | 25 | 44 |
| 6 | ぶらじる | R | .267 | 18 | 72 |
| 7 | ぎょくろ | L | .244 | 11 | 33 |
| 8 | ぺこ | L | .235 | 6 | 82 |
| 9 | てっかんのん | R | .222 | 12 | 21 |
| 10 | だじりん | L | .211 | 15 | 36 |
| 11 | あるぐれい | R | .198 | 10 | 42 |
| 12 | うーろん | L | .232 | 7 | 79 |

| | NAME | LR | U/D | SPD | 防御率 | STM | C | S | F |
|---|---|---|---|---|---|---|---|---|---|
| 1 | ぷーある | R | U | 150 | 2.14 | 92 | 9 | 3 | 8 |
| 2 | さんとす | L | U | 160 | 1.17 | 71 | 3 | 9 | 4 |
| 3 | げんまい | R | U | 145 | 2.02 | 43 | 7 | 7 | 7 |
| 4 | やむちゃ | R | D | 140 | 2.71 | 56 | 9 | 5 | 0 |

### PROGRAMS (p13:7529)

| | NAME | LR | 打率 | HR | RUN |
|---|---|---|---|---|---|
| 1 | にーもにっく | L | .255 | 21 | 55 |
| 2 | れじすた | R | .302 | 13 | 90 |
| 3 | さぶるちん | R | .299 | 20 | 41 |
| 4 | おうえす | L | .260 | 34 | 23 |
| 5 | りたーん | R | .246 | 30 | 36 |
| 6 | あせんぶる | L | .240 | 17 | 65 |
| 7 | りんく | L | .276 | 17 | 13 |
| 8 | しふと | R | .247 | 6 | 25 |
| 9 | ろうど | R | .267 | 15 | 52 |
| 10 | いんく | R | .238 | 9 | 78 |
| 11 | あんどおあ | L | .272 | 11 | 63 |
| 12 | こーる | R | .250 | 4 | 29 |

| | NAME | LR | U/D | SPD | 防御率 | STM | C | S | F |
|---|---|---|---|---|---|---|---|---|---|
| 1 | じゃんぷ | R | U | 160 | 1.66 | 66 | 7 | 1 | 1 |
| 2 | りすとあ | L | D | 135 | 1.37 | 90 | 1 | 6 | 5 |
| 3 | へっくす | L | U | 135 | 2.38 | 29 | 2 | 5 | 7 |
| 4 | こんぺあ | R | U | 140 | 3.15 | 42 | 5 | 0 | 0 |

### DARKS (p13:7826)

| | NAME | LR | 打率 | HR | RUN |
|---|---|---|---|---|---|
| 1 | いわさき | R | .300 | 11 | 80 |
| 2 | まつい | R | .220 | 8 | 38 |
| 3 | しょうがき | R | .201 | 32 | 12 |
| 4 | もあい | L | .354 | 50 | 2 |
| 5 | ながえ | R | .270 | 21 | 21 |
| 6 | ちあき | L | .224 | 5 | 65 |
| 7 | ふくい | R | .199 | 8 | 24 |
| 8 | みよし | L | .210 | 10 | 9 |
| 9 | ながた | R | .200 | 12 | 32 |
| 10 | かみお | L | .175 | 7 | 71 |
| 11 | は る | R | .205 | 9 | 25 |
| 12 | おーた | R | .211 | 4 | 34 |

| | NAME | LR | U/D | SPD | 防御率 | STM | C | S | F |
|---|---|---|---|---|---|---|---|---|---|
| 1 | おーつか | R | U | 140 | 2.45 | 73 | 9 | 1 | 1 |
| 2 | うえはら | L | U | 130 | 2.19 | 36 | 7 | 7 | 2 |
| 3 | あかだ | R | D | 130 | 2.71 | 12 | 4 | 6 | 3 |
| 4 | さぎさか | R | U | 160 | 2.07 | 99 | 3 | 0 | 0 |
