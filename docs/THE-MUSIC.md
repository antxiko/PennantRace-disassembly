# The music

26 pieces. The sound engine (bank 6, with the scores in bank 5 and the
table of 72 sounds at `p04:600C`) drives eight channels: the PSG's three and
the SCC's five. Each sound's header says which channels it uses: the tunes use
6 or 8 and the effects only two, PSG channel 3 and SCC channel 1. A channel
takes a new sound if its priority is not lower than that of the one playing
(`p06:B305`).

During a game the background tune depends on the furthest occupied base and
on who is batting (`p00:5E74`, `p00:5E7A`): eight tunes, plus the seventh
inning ones. The home run is two requests in a row: 0x2C (PSG and one SCC
channel) and 0x3F (the other three SCC channels). F5 turns the music off and
on.

The pieces have not been rewritten: the cartridge's own engine runs on a
Python Z80 (`tools/musica.py`) and what it writes to the PSG and the SCC is
turned into sound. Each one has been checked against openMSX
(`tools/omsx_psg.tcl`, `tools/coteja_psg.py`): the state of both chips matches
frame by frame. Seven match with the "free tone" of channel 4 switched off
(`0xEFF4`): a whistle the game turns on by itself during a game, which those
pieces do not use. The effects are not here.

## 0x28: The intro

<audio controls preload="none" src="audio/musica_28.mp3?v=4adcf3e0"></audio>

Asked for by p15:BBD8. 3.6 s. Checked: 218 identical frames.

## 0x2D: Title and demo

<audio controls preload="none" src="audio/musica_2D.mp3?v=b814b4a5"></audio>

Asked for by p00:44DD, p15:AB3B. 63.2 s, looping back to frame 1998. Checked: 3790 identical frames.

## 0x23: Mode chosen

<audio controls preload="none" src="audio/musica_23.mp3?v=5d0f175a"></audio>

Asked for by p00:45C8. 2.9 s. Checked: 176 identical frames.

## 0x2E: The PENNANT menus

<audio controls preload="none" src="audio/musica_2E.mp3?v=bc7be881"></audio>

Asked for by p13:622A, p15:A548. 51.2 s, looping back to frame 1921. Checked: 3073 identical frames.

## 0x2F: Before the game: pitchers and order

<audio controls preload="none" src="audio/musica_2F.mp3?v=4db6ae48"></audio>

Asked for by p00:463A. 38.4 s, looping back to frame 1153. Checked: 2305 identical frames with the free tone off.

## 0x33: Visitors at bat: bases empty

<audio controls preload="none" src="audio/musica_33.mp3?v=de169fd4"></audio>

Asked for by p00:5E74; 0x32, the play-ball tune of p00:466E, is the same. 33.6 s, looping back to frame 865. Checked: 2017 identical frames with the free tone off.

## 0x34: Visitors at bat: runner on first

<audio controls preload="none" src="audio/musica_34.mp3?v=72b2625c"></audio>

19.2 s, looping back to frame 577. Checked: 1153 identical frames.

## 0x35: Visitors at bat: runner on second

<audio controls preload="none" src="audio/musica_35.mp3?v=db24cb00"></audio>

16.0 s, looping back to frame 481. Checked: 961 identical frames.

## 0x36: Visitors at bat: runner on third

<audio controls preload="none" src="audio/musica_36.mp3?v=111cc7c1"></audio>

32.0 s, looping back to frame 961. Checked: 1921 identical frames with the free tone off.

## 0x37: Home team at bat: bases empty

<audio controls preload="none" src="audio/musica_37.mp3?v=bb2161b9"></audio>

Asked for by p00:5E7A. 30.4 s, looping back to frame 865. Checked: 1825 identical frames with the free tone off.

## 0x38: Home team at bat: runner on first

<audio controls preload="none" src="audio/musica_38.mp3?v=45f54dad"></audio>

25.6 s, looping back to frame 769. Checked: 1537 identical frames.

## 0x39: Home team at bat: runner on second

<audio controls preload="none" src="audio/musica_39.mp3?v=66742abe"></audio>

32.0 s, looping back to frame 961. Checked: 1921 identical frames with the free tone off.

## 0x3A: Home team at bat: runner on third

<audio controls preload="none" src="audio/musica_3A.mp3?v=2cb80405"></audio>

26.7 s, looping back to frame 801. Checked: 1601 identical frames with the free tone off.

## 0x3B: The seventh inning, top

<audio controls preload="none" src="audio/musica_3B.mp3?v=7f2a02f1"></audio>

Asked for by p02:94E3. 37.8 s, looping back to frame 1115. Checked: 2267 identical frames.

## 0x3C: The seventh inning, bottom

<audio controls preload="none" src="audio/musica_3C.mp3?v=8146116f"></audio>

Asked for by p02:94ED. 34.6 s, looping back to frame 1115. Checked: 2075 identical frames with the free tone off.

## 0x3D: Ball in play, top

<audio controls preload="none" src="audio/musica_3D.mp3?v=a7a9d795"></audio>

Asked for by p01:6003. 10.2 s. Checked: 611 identical frames.

## 0x3E: Ball in play, bottom

<audio controls preload="none" src="audio/musica_3E.mp3?v=597d30bb"></audio>

Asked for by p01:6003. 6.3 s. Checked: 379 identical frames.

## 0x2C: Home run (0x2C with 0x3F, p02:9357)

<audio controls preload="none" src="audio/musica_2C.mp3?v=9baba99f"></audio>

14.1 s. Checked: 843 identical frames (each half on its own).

## 0x42: Out

<audio controls preload="none" src="audio/musica_42.mp3?v=69b7637b"></audio>

Asked for by p01:6171, p03:B131. 3.8 s. Checked: 229 identical frames.

## 0x45: Caught on the fly

<audio controls preload="none" src="audio/musica_45.mp3?v=6c28f39d"></audio>

Asked for by p03:AE58. 4.3 s. Checked: 259 identical frames.

## 0x43: Walk

<audio controls preload="none" src="audio/musica_43.mp3?v=5411e68b"></audio>

Asked for by p01:61BD. 3.6 s. Checked: 215 identical frames.

## 0x44: Run scored

<audio controls preload="none" src="audio/musica_44.mp3?v=d882ad0e"></audio>

Asked for by p02:8FA3. 4.1 s. Checked: 247 identical frames.

## 0x40: End of the half inning, runners left

<audio controls preload="none" src="audio/musica_40.mp3?v=e0cbe0cc"></audio>

Asked for by p02:9466. 3.4 s. Checked: 205 identical frames.

## 0x41: End of the half inning, bases empty

<audio controls preload="none" src="audio/musica_41.mp3?v=fca860af"></audio>

Asked for by p02:945F. 4.4 s. Checked: 266 identical frames.

## 0x30: Pitching change

<audio controls preload="none" src="audio/musica_30.mp3?v=e5b00249"></audio>

Asked for by p00:4A32. 11.1 s. Checked: 668 identical frames.

## 0x31: The champion and the ending

<audio controls preload="none" src="audio/musica_31.mp3?v=15b63dfd"></audio>

Asked for by p00:4925, p00:49A6. 76.8 s, looping back to frame 2049. Checked: 3968 identical frames out of 4609; then the game cuts it.
