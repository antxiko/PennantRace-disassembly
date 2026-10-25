# The code

One listing per bank in `src/pennantrace_pNN.asm` (p00 to p15), assembled with
pasmo, which comes out identical to the ROM: `make verify`. 100% of the binary
is explained: 50,191 bytes of code and 80,881 of data. Of the 25,026
instructions, 43.7% are commented, and none of the 2,933 routines is below the
comment minimum. Every bank with code is over 40%.

## How it is made

- `tools/z80trace.py` walks the code from its entry points (start-up, the
  interrupt and the dispatchers) and separates code from data.
- `tools/bancos.py` and `tools/cartucho.py` know which bank is in each window:
  the sets of three, the jumps between banks and the routines that return with
  another set (`tools/colas.py`).
- Data is identified by who reads it (`tools/lectores.py`): pictures, runs,
  texts, palettes, tiles, sound headers and scores.
- `tools/anota.py` comments the variables, the BIOS, the calls and the cards
  of the players on the field; `tools/check_refs.py` checks that every
  `pNN:XXXX` reference in the comments lands on an instruction or a data block
  of that bank.
- 12 tests (`tests/`) and `make sanity` watch the build and the trace.

## The pictures and the music

- `tools/vram.py` is a V9938 VRAM in Python with what the game uses: pictures,
  runs, one-bit characters, copy commands and palettes. `tools/pantallas.py`
  repeats step by step the routines that paint each screen.
  `tools/sprites.py` draws sprites the way the V9938 does (with the CC bit)
  and builds the batter and the pitcher the way the game does;
  `tools/animaciones.py` writes the GIFs with the code's timing.
  `tools/omsx_vram.tcl` dumps the openMSX VRAM and `tools/coteja_vram.py`
  compares.
- `tools/musica.py` runs the sound engine on a Python Z80 and writes the MP3s;
  `tools/omsx_psg.tcl` and `tools/coteja_psg.py` check them against openMSX.
  The probe lets a single game request through, can zero RAM bytes every frame
  (the free tone) and diverts the engine start-up after the first time.
- `tools/textos.py`, `tools/equipos.py` and `tools/fuente.py` take out the
  texts, the teams and the font.

## Code shared with other Konami cartridges

This disassembly has been compared, instruction by instruction, with
every other Konami one in the series. A block counts when the same
instructions, at least six of them from a label to its `ret` or its
unconditional jump, are in both cartridges; the addresses are left
aside, because they change from one cartridge to the next. Of the
other 57, **46** have at least one block in common with this one;
these are the ones that share the most:

| Cartridge | Blocks | Instructions | For example (here = there) |
|---|---:|---:|---|
| [Gekitotsu Pennant Race 2](https://antxiko.github.io/PennantRace2-disassembly/) | 119 | 1,758 | `dibujos` (p00:4FA3) |
| [King's Valley II](https://antxiko.github.io/KingsValley2-disassembly/) | 85 | 1,378 | `rachas_con_destino` (p00:4B2D) |
| [Parodius](https://antxiko.github.io/Parodius-disassembly/) | 71 | 1,189 | `sonido` (p00:57FF) = `pide_sonido` |
| [Salamander - Operation X](https://antxiko.github.io/Salamander-disassembly/) | 70 | 1,140 | `sonido` (p00:57FF) = `pide_sonido` |
| [Nemesis 3 - The Eve of Destruction](https://antxiko.github.io/Nemesis3-disassembly/) | 61 | 973 | `cartucho_en_pagina_2` (p00:43EC) = `cartucho_en_8000` |
| [Konami’s Game Master 2](https://antxiko.github.io/GameMaster2-disassembly/) | 59 | 976 | `rectangulo_desde_ram` (p00:4DAA) = `vdp_hmmc` |
| [Contra](https://antxiko.github.io/Contra-disassembly/) | 56 | 1,007 | `nota_empieza` (p06:B6AF) |
| [Hai no Majutsushi - Mahjong 2](https://antxiko.github.io/Majutsushi-disassembly/) | 52 | 581 | `cartucho_en_pagina_2` (p00:43EC) = `cartucho_en_8000` |
| [Shalom: Knightmare III](https://antxiko.github.io/Shalom-disassembly/) | 43 | 539 | `cartucho_en_pagina_2` (p00:43EC) = `cartucho_en_8000` |
| [F-1 Spirit — The Way to Formula 1](https://antxiko.github.io/F1Spirit-disassembly/) | 41 | 704 | `canal_ocupa` (p06:B305) = `SONIDO_CANAL` |

The whole matrix, the 58 cartridges against each other, is on
[The routines](https://antxiko.github.io/MSX-disassembly-database/THE-ROUTINES.html) in the series database, along
with the method and the program that measures it.
