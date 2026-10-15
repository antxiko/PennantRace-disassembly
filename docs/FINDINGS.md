# Findings

## It saves to the Game Master 2's SRAM

Besides disk, TEAM EDIT and PENNANT save to Konami's Game Master 2. The game
looks for it in every slot by the `YZ` mark at `0x4010`, puts its bank 4 at
`0x8000` and calls its SRAM routine with the command in C: 5 the directory,
`0x0A` save and `0x0B` load (`p13:709A`, `p13:721D`). In the
[Game Master 2 disassembly](https://antxiko.github.io/GameMaster2-disassembly/)
that routine is `p04:8000`, the door to its file system, and the cartridge
really has `YZ` at `0x4010`. Read in the code of both cartridges; saving has
not been tried.

## The speed, in real km/h

The three SPD digits on the pitcher's card give the speed of the ball: 80 to
199 km/h (`p03:AAE1`). Pressing down on release makes it a quarter faster and
up a quarter slower; with no stamina left, the card loses 4 to 7 km/h
(`p03:ABAA`).

## The ten-run rule

After any bottom half, a ten-run difference ends the game (`p02:9424`), and
during a bottom half it ends as soon as the home team leads by ten
(`p00:46D8`). From the ninth on the usual rule applies (`p02:9428`).

## PENNANT draws lots for the games you do not play

With a single player the other two games of the round are not played: each
team gets 0 to 15 runs at random and, on a tie, one of the two gets one more
(`p15:AC31`).

## The home run is two tunes at once

The game asks for 0x2C, on the PSG and one SCC channel, and right after for
0x3F, which plays the other three SCC channels (`p02:9357`). Checked against
openMSX.

## The music follows the runners

While a team bats, the background tune depends on the furthest occupied base
and on who is batting: four tunes for the visitors and four for the home team
(`p00:5E74`). 0x32, the play-ball tune (`p00:466E`), is the same as 0x33, the
visitors with the bases empty.

## Two kanji sets in the same place

During a game, codes `0x7F`-`0x8F` are 17 kanji for the figures (打, 数, 本, 塁,
防, 御, 率...). The PENNANT screens load another 11 on top (試合結果,
順位表...) at `0x82`-`0x8C` or at `0xA0`-`0xAA` (`p00:52D9`, `p00:52C7`): the
same code is one character or another depending on the screen.

## Six teams with a theme

Each team's players are named after aircraft (FLYERS), motorbikes (RIDERS),
Kobe stations (KOBE LINES), coffees and teas (BRENDS) or programming terms
(PROGRAMS: にーもにっく mnemonic, れじすた register, あせんぶる assemble); the
DARKS carry surnames. The themes are our reading of the names (`p13:731F`).
