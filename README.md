# The Pro Yakyuu Gekitotsu Pennant Race (RC-757) — a commented disassembly

*(También disponible [en castellano](README.es.md).)*

**[→ Read it on the web](https://antxiko.github.io/PennantRace-disassembly/)**

Full commented disassembly of *The Pro Yakyuu Gekitotsu Pennant Race*
(THEプロ野球 激突ペナントレース), Konami's baseball for the MSX2 (1988):
RC-757, a 128 KB MegaROM with the SCC.

Six stock teams, games against the computer or between two players, a league
for up to six players (PENNANT) and a team editor (TEAM EDIT) that saves to
disk or to the Game Master 2's SRAM.

| | |
|---|---|
| binary explained | **100%**, 131,072 of 131,072 bytes |
| code traced | 50,191 bytes |
| data identified | 80,881 bytes |
| routines | 2,933, **none thin** |
| comment density | **43.7%** |
| pictures drawn | 8; 6 checked against the openMSX VRAM |
| tunes | 26, checked against openMSX |
| texts | 100, taken from the ROM |
| tests | 12 |

## Reproducing it

The cartridge is not distributed. Put your copy in the root as
`pennantrace.rom` (sha256 `6576a4cfdd38…`) and:

    make verify    # reassembles the 16 banks and compares them byte for byte
    make sanity    # checks the trace
    make web       # builds the website

## The pictures and the music

No picture is a capture: they are drawn by reading the cartridge's tables and
checked against the openMSX VRAM; each one says how much matches. The tunes
come from running its own sound engine and match openMSX frame by frame.

See [LEGAL-NOTICE.md](LEGAL-NOTICE.md) and [LICENSE](LICENSE).
