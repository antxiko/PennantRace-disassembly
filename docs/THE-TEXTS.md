# The texts

100 texts taken from the ROM with `tools/textos.py`. The text routines at
`p00:4EA6` read a position `[x y]` and then font characters up to `0xFF`;
`0xFE` brings another position and `0xFD` is a half space (`p00:4EC0`). The
list has the addresses the code loads just before calling them, those of
their pointer tables and those of the texts drawn one after another.

The characters come from the game's font (`tools/fuente.py`): digits, letters,
hiragana, katakana and kanji. The kanji of the PENNANT screens (試合結果,
順位表...) use codes that are other characters during a game: another kanji
set is loaded on top (`p00:52D9`, `p00:52C7`). The ● is character `0x9A`, the marker of the chosen option
(`p01:65AF`).

The position is in screen pixels. "Where" is the address of the text and
"drawn from" the instruction that asks for it.

| text | where | drawn from |
|---|---|---|
| (88,52) データを / (88,64) ロードしますか / (104,76) はい / (104,88) いいえ | p03:BE24 | p03:BDC4 |
| (88,52) どこから / (88,64) ロードしますか / (104,76) DISK / (104,88) SRAM | p03:BE42 | p03:BC6A |
| (80,56) PLEASE SELECT / (96,96) CONTINUE / (96,112) NEW SEASON / (98,16) ペナントレース | p13:6115 | p13:6102, p13:615B |
| (96,96) CONTINUE / (96,112) NEW SEASON / (98,16) ペナントレース | p13:6125 | p13:6161 |
| (96,112) NEW SEASON / (98,16) ペナントレース | p13:6130 | p13:6167 |
| (98,16) ペナントレース | p13:613D | p13:6202 |
| (64,0) LEAGUE SELECTION / (104,84) TEAMS / (10,200) PLAYER / (66,200) SELECT / (208,200) CLEAR / (122,200) COUNT / (174,200) END | p13:6294 | p13:6208 |
| (174,200) END | p13:62D1 | p13:64AA |
| (100,136) 試 合 数 | p13:6412 | p13:6401 |
| (48,32) VISITORS / (48,56) HOME / (10,200) VISITORS / (82,200) HOME / (130,200) END | p13:6594 | p13:6588, p13:6811 |
| (130,200) END | p13:65B8 | p13:667A |
| (10,200) VISITORS | p13:682E | table 6828 |
| (82,200) HOME | p13:6839 | table 6828 |
| (130,200) END | p13:6840 | table 6828 |
| (72,16)   / (72,26)   / (72,36)   / (72,46)   / (72,56)   / (72,66)   | p13:6C31 | p13:6C15 |
| (10,200) PLAYER | p13:6CBE | table 6CB4 |
| (66,200) SELECT | p13:6CC7 | table 6CB4 |
| (208,200) CLEAR | p13:6CD0 | table 6CB4 |
| (122,200) COUNT | p13:6CD8 | table 6CB4 |
| (174,200) END | p13:6CE0 | table 6CB4 |
| (10,200) PLAYER / (66,200) SELECT / (208,200) CLEAR / (122,200) COUNT / (174,200) END | p13:6CE6 | p13:6C9D |
| (144,172) ピッチャーをひとりだけ / (144,184) いれてください | p13:7B48 | p03:A4F0 |
| (80,12) MEMBER CHANGE / (72,28) BATTER  打 率 HR / (72,160) PITCHER / (134,160) 防御率 | p13:7B63 | p14:9D1B |
| (200,120) 00 | p13:7B94 | p01:648B |
| (88,52) TEAM EDITを / (88,64) おわりますか / (104,76) はい / (104,88) いいえ | p13:7B99 | p03:B700 |
| (88,52) SAVEちゅうです | p13:7BDD | p00:48E9, p13:6D5B, p13:6DD0 |
| (88,52) SRAM ERROR / (104,76) もういちど / (104,88) おわる | p13:7C06 | p03:BD3E, p13:6D99 |
| (88,52) SAVE  / (88,64) しゅうりょう | p13:7C22 | p03:B9A4, p13:6D73, p13:6FB2 |
| (72,176) PUSH SPACE KEY | p13:7C79 | p00:4809 |
| (72,184) PUSH SPACE KEY | p13:7CA8 | p00:4845 |
| (72,184) PUSH  F1 KEY | p13:7CB9 | p00:4860 |
| (24,96) 打 数 / (24,108) 安 打 / (24,120) 本塁打 / (24,132) 三 振 / (24,144) 四死球 | p13:7CD1 | p00:47E7 |
| (84,136) プレイヤー 数 | p13:7CEF | p13:6329 |
| (88,52) しゅうりょう / (88,64) します | p13:7CFA | p13:6DE0, p13:6E8C |
| (88,52) LOAD / (88,64) しゅうりょう | p13:7D09 | p13:7045 |
| (88,52) コンティニューの / (88,64) データが / (88,76) ありません | p13:7D19 | p13:607B |
| (88,12) 第 / (136,12) 回 / (146,12) 戦 | p13:7D35 | p14:9737 |
| (88,52) LOADちゅうです | p13:7D41 | p13:701A |
| (88,52) チームデータが / (88,64) ありません | p13:7D4E | p03:BC7C |
| (24,172) ピッチャーをひとりだけ / (24,184) いれてください | p13:7D62 | p03:A4BE |
| (88,52) どこに / (88,64) セーブしますか | p13:7D7D | p14:8463 |
| (80,80) (C)KONAMI  1988 / (40,112) 1PLAYER | p13:7D8F | p01:6543, after 7D8F |
| (40,128) 2PLAYERS | p13:7DA9 | after 7D8F |
| (40,144) PENNANT | p13:7DB4 | after 7D8F |
| (40,160) TEAM EDIT | p13:7DBE | after 7D8F |
| (40,176) WATCH | p13:7DCA | after 7D8F |
| (40,192) MEDIA SELECT | p13:7DD2 | p01:655B, after 7D8F |
| (56,120) MEDIA / (48,144) DISK / (48,160) SRAM | p13:7DE1 | p15:AA5A |
| ● | p13:7DF7 | p01:65B8, p03:BCFC, p15:AAC9 |
| (92,40) FOUR BALL | p13:7DF9 | p01:61A8 |
| (92,40) DEAD BALL | p13:7E05 | p02:8AAF |
| (16,120) S / (16,128) B / (16,136) O / (216,120) 回 / (204,176) HR / (204,184) 打率 / (8,168) P / (32,176) . / (40,184) 球 | p13:7E1E | p01:63F6 |
| (132,112) km/h | p13:7E44 | p01:64F4 |
| (224,120) ウラ | p13:7E4E | p01:644B |
| (112,136) FOUL | p13:7E53 | p01:6508 |
| (112,240) FOUL | p13:7E5A | p14:93FB |
| (112,240)  OUT  | p13:7E69 | p01:7011, p02:8FDB, p03:B129 |
| (112,240) SAFE | p13:7E71 | p03:B101 |
| (68,8) STARTING LINEーUP / (80,32) 打 率 HR / (200,32) 打 率 HR | p13:7E86 | p03:A320 |
| (224,184) 150 / (228,176)  0 | p13:7EAB | p01:6A1E |
| 150  0 | p13:7EB6 | p03:A25C |
| (108,112)  TIME  | p13:7EBD | p01:649F |
| (92,0) TEAM EDIT / (36,12) TEAM NAME / (48,32) NAME  LR   打 率  HR  RUN / (8,40) BA / (8,164) PI / (48,156) NAME  LR / (116,156) SPD / (144,156) 防御率 / (172,156) STM / (208,156) C S F / (128,139) 1700 / (168,139) 200 / (204,139) 600 / (116,199) 540 / (144,199) 990 / (172,199) 200 / (200,199) 252525 | p13:7EC6 | p03:BA8B |
| (88,84) せんぱつ ピッチャー / (78,116) 防御率 / (198,116) 防御率 | p13:7F55 | p02:9EC9 |
| DISK | p14:8498 | p14:8476 |
| SRAM | p14:849D | p14:8487 |
| RAM | p14:84A2 | p14:8490 |
| (80,140) DISK ERROR | p14:8547 | p14:8520 |
| (72,156) DISK IO ERROR | p14:8554 | table 8539 |
| (72,156) FILE NOT FOUND | p14:8564 | table 8539 |
| (88,156) DISK FULL | p14:8575 | table 8539 |
| (64,156) DISK NOT READY | p14:8581 | table 8539 |
| (72,156) WRITE PROTECT | p14:8592 | table 8539 |
| (72,156) TOO MANY FILES | p14:85A2 | table 8539 |
| (72,156) DATA TYPE ERROR | p14:85B3 | table 8539 |
| (120,52) VS | p14:97F5 | p14:9773, p14:97AB, p14:97D9 |
| (36,32) PLAYER1 | p14:97FA | p14:9795 |
| (168,32) CPU | p14:980E | p14:97A5 |
| (36,32) VISITORS / (156,32) HOME | p14:9814 | p14:97D3 |
| (56,32) CPU1 | p14:9826 | p14:9779 |
| (168,32) CPU2 | p14:982D | p14:977F |
| (76,184) ひかえピッチャーがいません | p14:9DAE | p14:9D88 |
| (10,200) 1P | p15:A6CC | table A6BE |
| (66,200) 2P | p15:A6D1 | table A6BE |
| (66,200) CPU | p15:A6D6 | table A6BE |
| (114,200) END | p15:A6DC | table A6BE, table A6C6 |
| (10,200) CPU1 | p15:A6E2 | table A6C6 |
| (66,200) CPU2 | p15:A6E9 | table A6C6 |
| (60,0) TEAM NAME SELECT / (104,84) TEAMS | p15:A710 | p13:6545, p15:A492 |
| (56,32) PLAYER1 / (56,56) PLAYER2 / (10,200) 1P / (66,200) 2P / (114,200) END | p15:A72B | p15:A4E6, p15:A68B |
| (114,200) END | p15:A76A | p15:A5CE |
| (96,8) 試 合 結 果 | p15:B071 | p15:AE5B |
| (68,96) 試合数 | p15:B07B | p15:AE61 |
| (104,80) 順 位 表 | p15:B081 | p15:AE67 |
| (24,96) チーム | p15:B089 | p15:AE6D |
| (108,96) 勝数 | p15:B08F | p15:AE73 |
| (140,96) 敗数 | p15:B094 | p15:AE79 |
| (176,96) 勝率 | p15:B099 | p15:AE7F |
| (208,96) ゲーム差 | p15:B09E | p15:AE85 |
| (216,108) ーーー | p15:B0A6 | p15:AE55 |
