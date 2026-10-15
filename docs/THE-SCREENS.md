# The screens

All of them are drawn with our own code (`tools/vram.py` and
`tools/pantallas.py`) following the steps of the routine that paints them,
cited for each one. None is a capture. Each one has been compared with the
openMSX VRAM dumped with the game running (`tools/omsx_vram.tcl`,
`tools/coteja_vram.py`); under each one is how much matches.

The game runs in SCREEN 5 on the V9938 (256 × 212 pixels, 16 colours). Almost
everything is drawn in two steps: first the graphics are built on page 1 of
the VRAM (the "sheet", 32 characters per row) and then copied to the visible
page with VDP commands.

## The intro

![The title](imagenes/rotulo.png)

The "THEプロ野球 激突ペナントレース" title (`p15:BB97`, `p00:52E7`): the
pictures at `p09:B07A` and the character list at `p09:B6B9`, built on page 1.
The intro uncovers it column by column (`p15:BC39`). **Checked: 0 bytes
different.**

![The stadium](imagenes/estadio.png)

The stadium below it (`p00:5427`): the pictures at `p09:A619` and 16 × 11
characters in runs from `p09:AFC4`, with the palette at `p07:6000`.
**Checked: 0 bytes different.**

## The field

![The centre zone](imagenes/campo_1.png)

The field has three zones: the centre and the two sides. Each one is 256 ×
512 pixels and is a map of 16 × 8 tiles of 4 × 4 characters (`p08:9432`); the
tiles come from `p08:95B8` (and from `p08:9A58` in the last two strips of the
list). The screen shows part of the zone at a time. **Checked: centre zone,
the 256 lines that were in the VRAM, identical in two dumps;** in another
three, 8 to 22 lines differ: the signs and strips the game was drawing at that
moment.

![Left field](imagenes/campo_0.png)

The left field zone (tiles at `p08:9B28`).

![Right field](imagenes/campo_2.png)

The right field zone (tiles at `p09:A088`). These two are drawn with the same
code as the centre one, but **they are not checked**: the demo never leaves
the centre zone.

## The pitch

![The pitching screen](imagenes/lanceo.png)

The pitching screen, seen from behind home plate (`p01:6352`): the background
in runs from `p08:9220`, two frames and the text at `p13:7E1E` (S B O, the 回
of the inning, HR and 打率). With no game going, the boxes and figures are
empty. **Checked: 728 of 864 blocks identical**; the rest is the little bases
window and the figures of the game being played.

## The sprites

![The sprite patterns](imagenes/sprites.png)

The 64 patterns of 16 × 16 used in a game (VRAM `0xF800`-`0xFFFF`), set by
`p00:537C`, `p00:539D` and `p00:53CC`. During a play `p00:572E` changes the
pitcher's pose at `0xFAC0` and `p00:5716` the catcher's at `0xFFC0`.
**Checked: identical** except for those two poses, which depend on the
moment.

## The font

![The font](imagenes/fuente.png)

161 one-bit characters at `p12:B6C3`: digits, letters, hiragana, katakana and
signs. They are put twice on the sheet, the second time in colour 4. On top
go two kanji sets: 17 from `p09:B942` for the game (戦打数安本塁三振四死球盗失策防御率)
and 11 from `p09:B9DA` for the PENNANT screens (試合結果勝敗差順位表 and a
quote mark).
