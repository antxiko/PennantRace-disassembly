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
