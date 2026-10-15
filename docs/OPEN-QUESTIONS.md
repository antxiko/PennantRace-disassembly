# Open questions

- **`p14:9472`.** It jumps to the BIOS, to `0x003D` or `0x003E` depending on
  the half inning, and it is not clear what for.
- **Two pieces of page 1.** During a game, 185 bytes of the sheet are drawn on
  the fly, at (40-79, 200-207) and (216-223, 152-159), and they are not
  identified yet.
- **The finished-game sheet not drawn.** `p01:6991` clears it in four
  rectangles that leave the top centre band untouched (x 0x28-0xD7, y
  0x18-0x3F): whatever was on screen when the game ended stays there. In the
  dumps, which end the game by hand writing to the RAM, it is a piece of the
  field; one from a game played to the end is missing.
- **Saving.** Neither disk nor the Game Master 2 has been tried in the
  emulator; what is said about them is read in the code.
