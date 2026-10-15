# The game

Everything on this page is read in the cartridge's code; each item carries
the address where it can be seen.

## The modes

The menu (`p01:6543`) has five: **1PLAYER**, **2PLAYERS**, **PENNANT**,
**TEAM EDIT** and **WATCH**. If there is both a disk drive and a Game Master 2,
a sixth one appears, **MEDIA SELECT**, to choose where to save (`p01:6561`).
The mode is kept as a number from 0 to 5 and, for the game, as flags: one
player, two, PENNANT or the computer alone (`p00:4A5E`).

- **PENNANT** is the league: 1 to 6 players (`p13:633A`) and 1 to 26 games per
  pair of teams (`p13:641A`). It keeps the results table (試合結果) and the
  standings (順位表) with wins, losses, percentage and games behind. With a
  single player the other two games of the round are drawn by lot: each team
  gets 0 to 15 runs and, on a tie, one of the two gets one more
  (`p15:AC31`).
- **TEAM EDIT** changes the teams' names and figures, within caps (below), and
  saves them to disk or to the Game Master 2's SRAM.

## The rules

- Three strikes; four balls (FOUR BALL) or a hit by pitch (DEAD BALL) give the
  base.
- The game ends (`p02:940A`, `p00:46A1`):
  - after any bottom half, with a ten-run difference, and as soon as the home
    team leads by ten during a bottom half;
  - from the ninth on, after the top half if the home team is ahead, after the
    bottom half if the score is not tied, and as soon as the home team goes
    ahead in the bottom half;
  - if a score reaches 99.
- The speed of a pitch comes from the three SPD digits of the card: 80 to 199
  km/h (`p03:AAE1`). Pressing down on release makes it a quarter faster; up, a
  quarter slower (`p03:AB32`).
- Every pitch tires: 1 the normal one, 4 the fast one and 2 the slow one. When
  the stamina runs out, the card's speed drops by 4 to 7 km/h (never below 80)
  and, every so often, each breaking ball loses a point (`p03:ABAA`).
- In TEAM EDIT, a change that goes over the caps is undone (`p15:B693`):
  - the 12 fielders add up to at most 3.500 of 打率, 200 HR and 600 of RUN;
  - the 4 pitchers add up to at most 540 of SPD, 9.90 of 防御率, 200 of STM
    and 25 in each of the three breaking balls (C, S and F).

## The teams

Six stock teams (`p13:731F`): each card has the name, 12 fielders and 4
pitchers. The columns are those of the TEAM EDIT screen; the names are in
hiragana. The stock teams do not have to meet the TEAM EDIT caps: the FLYERS
add up to 590 of SPD.

Each team has a theme (our reading of the names): the FLYERS are named after
aircraft (ふぁんとむ phantom, ぜろ zero, とむきゃっと tomcat), the RIDERS after
motorbikes (かたな katana, にんじゃ ninja), the KOBE LINES after Kobe stations
(ろっこう Rokkō, さんのみや Sannomiya), the BRENDS after coffees and teas
(きりまん Kilimanjaro, だじりん Darjeeling), the PROGRAMS after programming
terms (にーもにっく mnemonic, れじすた register, あせんぶる assemble) and the
DARKS carry surnames.

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
