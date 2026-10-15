# Open questions

- **`p14:9472`.** It jumps to the BIOS, to `0x003D` or `0x003E` depending on
  the half inning, and it is not clear what for.
- **Two pieces of page 1.** During a game, 185 bytes of the sheet are drawn on
  the fly, at (40-79, 200-207) and (216-223, 152-159), and they are not
  identified yet.
- **The two sides of the field.** The left and right zones are drawn with the
  same code as the centre one, but they are not checked: the demo never
  leaves the centre zone.
- **Two screens not drawn.** In the dumps, the finished-game sheet (打数,
  安打..., `p00:47DA`) shows a scrambled piece at the top that we have not
  explained (the games were ended by hand, writing to the RAM), and the
  substitution screen (MEMBER CHANGE, `p14:9D1B`) has not been reached in the
  emulator.
- **Saving.** Neither disk nor the Game Master 2 has been tried in the
  emulator; what is said about them is read in the code.
