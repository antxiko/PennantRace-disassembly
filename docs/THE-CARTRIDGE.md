# The cartridge

## The banks

128 KB in 16 banks of 8 KB with the Konami SCC mapper: four windows
(`0x4000`, `0x6000`, `0x8000` and `0xA000`) switched by writing the bank
number to `0x5000`, `0x7000`, `0x9000` and `0xB000`. Bank `0x3F` at `0x9000`
opens the SCC at `0x9800`-`0x98FF`.

Bank 0 always stays at `0x4000` and the other three windows are set three at
a time: 1-2-3 (`p00:438D`), 7-8-9 (`p00:4392`), 10-11-12 (`p00:4397`) and
13-14-15 (`p00:439F`). The current set is kept at `0xDDF1`-`0xDDF3`. The
sound puts banks 4-5-6 in for a moment and goes back to the previous set.

| banks | what is there |
|---|---|
| p00 | the core: start-up, the interrupt, the state dispatcher (`p00:4220`), the VDP, pictures, texts and sound requests |
| p01-p03 | the game: pitching, batting, runners, fielding, camera, scoreboard and batting order |
| p04-p06 | the sound: the table of 72 sounds (`p04:600C`), the scores (p05) and the engine (p06) |
| p07-p12 | the graphics: palettes, pictures, the field map (`p08:9432`) and its tiles, the kanji (p09), the sprites (p10-p11) and the font (p12) |
| p13-p15 | the menus, PENNANT, TEAM EDIT, saving, the intro and the six teams (`p13:731F`) |

## The pictures

Almost everything on screen comes from picture lists (`p00:4FA3`): a number
of entries and, per entry, 6 bytes `[palette-type][VRAM][n][pointer]`. The
type says how many bits each pixel has: 0 and 1, one bit; 2 and 3, two; 4 and
5, three. Odd types are drawn mirrored. The high nibble picks the palette in a
table that gives 2, 4 or 8 colours; each bit combination is one of them.

Large things go in runs (`p00:4B35`): a count byte; 0 ends, with bit 7 clear
it repeats the next byte, `0x80` brings a new destination and `0x81` to
`0xFF` copy the bytes as they are.

## The texts

`p00:4EA6` and its sisters put banks 13-14-15 in and read `[x y]` and font
characters up to `0xFF`; `0xFE` brings another position and `0xFD` is a half
space. See [The texts](THE-TEXTS.html).

## The sound

Each sound has a header (`p04:600A` + 2 × number): a channel mask (bit 7
channel 1, bit 0 channel 8; 1 to 3 are the PSG, 4 to 8 the SCC), a priority
and a pointer to each channel's score. In the scores, `0xD0` to `0xFE` are
commands (`p06:B92F`: the octave, the priority and others through a table),
what is below are notes and `0xFF` ends. The engine steps each channel in the
interrupt (`p06:B41E`) and writes the PSG and the SCC (`p06:BBB8`). See
[The music](THE-MUSIC.html).

## Saving

TEAM EDIT and PENNANT save to one of three places: RAM, disk or the Game
Master 2's SRAM (`p13:6007`).

- **Disk** goes through the BDOS (`0xF37D`). Before each call the game's RAM
  that DOS would overwrite is moved aside (`p14:8334`) and put back after.
- **The Game Master 2** is searched for in the four slots and their subslots:
  it is the cartridge with `YZ` at `0x4010` (`p13:709A`). To use it, the game
  puts its bank 4 at `0x8000` and calls `0x8000` with the command in C: 5 the
  directory, `0x0A` save and `0x0B` load (`p13:721D`). The league is saved
  under the name `PENAN`. Meanwhile it removes the H.KEYI hook (H.TIMI for the
  directory).
