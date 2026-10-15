; ==========================================================================
; THE PRO YAKYUU GEKITOTSU PENNANT RACE - Konami (1988) - MSX2 - MegaROM RC-757 de 128 KB (Konami SCC) - banco 11 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; DATOS copia280_7ECB_cola: lo que queda de los 640 bytes de 0x7ECB (banco
;   10), que p00:5697 copia a la VRAM 0x7880; lo leen p00:569D (331 bytes)
;   0x8000..0x814b  (331 bytes)
DATA_copia280_7ECB_cola:
	defb 006h,004h,008h,01ch,033h,0c9h,0a4h,091h,0c1h,042h,02ch,03fh,07fh,0ffh,0feh,0fch	; 8000  ....3....B,?....
	defb 0f8h,0e0h,0c0h,0c0h,020h,010h,090h,030h,008h,084h,0f4h,0c0h,080h,000h,000h,000h	; 8010  .... ..0........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,020h,040h,081h,002h,004h	; 8020  ........... @...
	defb 018h,020h,040h,0c0h,0e0h,0f0h,0f0h,0f0h,0f8h,0fch,0fch,040h,080h,000h,000h,000h	; 8030  . @........@....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,01fh,00fh,001h,000h,001h	; 8040  ................
	defb 001h,001h,001h,002h,004h,004h,004h,008h,009h,009h,00bh,0ffh,0ffh,03fh,0bfh,0deh	; 8050  .............?..
	defb 07fh,03fh,000h,000h,03eh,030h,060h,0c0h,080h,000h,000h,01fh,00fh,001h,000h,001h	; 8060  .?..>0`.........
	defb 001h,001h,001h,003h,007h,007h,007h,00fh,00fh,00fh,00fh,0d4h,0d2h,0eah,0e5h,0f3h	; 8070  ................
	defb 0f9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0cfh,087h,003h,003h	; 8080  ................
	defb 0efh,0eeh,002h,002h,082h,042h,004h,004h,008h,010h,060h,0f8h,0f8h,0f8h,0f8h,0f8h	; 8090  .....B....`.....
	defb 0f0h,0e0h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0b0h,0f9h,0ffh,0ffh,0ffh	; 80a0  ................
	defb 0ffh,0feh,0feh,0feh,0feh,0feh,0fch,0fch,0f8h,0f0h,0e0h,0f8h,0f8h,0f8h,0f8h,0f8h	; 80b0  ................
	defb 0f0h,0e0h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 80c0  ................
	defb 000h,000h,007h,00fh,007h,003h,001h,001h,000h,000h,000h,00ah,006h,004h,004h,006h	; 80d0  ................
	defb 007h,009h,0f1h,05bh,0abh,0feh,0ffh,0ffh,0ffh,07fh,03eh,000h,000h,000h,000h,000h	; 80e0  ...[......>.....
	defb 000h,000h,007h,00fh,00fh,003h,003h,001h,000h,000h,000h,00fh,007h,007h,007h,007h	; 80f0  ................
	defb 007h,00fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,07fh,07eh,001h,007h,003h,007h,00fh	; 8100  ..........~.....
	defb 08eh,0fbh,0f9h,09fh,034h,063h,041h,09fh,0bfh,03fh,03fh,080h,000h,000h,080h,040h	; 8110  ....4cA..??....@
	defb 020h,030h,0f8h,0fch,0feh,0feh,0feh,0fch,0e0h,080h,000h,0ffh,0ffh,0ffh,0ffh,0ffh	; 8120   0..............
	defb 0ffh,0ffh,0ffh,0ffh,0f7h,0e3h,0c7h,09fh,0bfh,03fh,03fh,080h,000h,000h,080h,0c0h	; 8130  .........??.....
	defb 0e0h,0f0h,0f8h,0fch,0feh,0feh,0feh,0fch,0e4h,080h,080h	; 8140  ...........

; ----------------------------------------------------------------------
; DATOS rachas_destino_814B: [destino lo hi] y rachas a la VRAM (p00:4B2D ->
;   p00:4B35); lo leen p00:53D2 (846 bytes)
;   0x814b..0x8499  (846 bytes)
DATA_rachas_destino_814B:
	defb 000h,0f8h,092h,003h,007h,00fh,00fh,07fh,0ffh,0ffh,07fh,003h,008h,008h,007h,000h	; 814b  ................
	defb 000h,009h,00fh,0e0h,0f0h,005h,0f8h,092h,0f0h,0e2h,00eh,00eh,0f0h,008h,078h,030h	; 815b  ..............x0
	defb 000h,003h,007h,00fh,00fh,07fh,0dfh,0fbh,07ch,01fh,007h,00fh,082h,0e0h,0f0h,004h	; 816b  ........|.......
	defb 0f8h,084h,0e8h,010h,0feh,0feh,003h,0f8h,085h,078h,030h,000h,003h,007h,005h,00fh	; 817b  .........x0.....
	defb 08dh,007h,023h,070h,0f8h,0f7h,068h,00fh,006h,000h,0e0h,0f0h,0f8h,0f8h,003h,0feh	; 818b  ..#p..h.........
	defb 08bh,0f2h,0e0h,000h,008h,0f0h,000h,000h,048h,078h,003h,007h,004h,00fh,08ch,00bh	; 819b  ........Hx......
	defb 004h,03fh,07fh,0dfh,0ffh,06fh,00fh,006h,000h,0e0h,0f0h,004h,0f8h,083h,0eeh,01eh	; 81ab  .?...o..........
	defb 0fch,004h,0f8h,003h,078h,081h,00fh,005h,01fh,002h,00fh,089h,047h,070h,068h,067h	; 81bb  ....x.......Gphg
	defb 010h,01eh,00ch,000h,0e0h,004h,0f0h,095h,0f7h,0e7h,0efh,0ceh,090h,0a0h,0c0h,000h	; 81cb  ................
	defb 000h,090h,0f0h,00fh,01fh,01fh,017h,000h,002h,000h,038h,07fh,07fh,003h,01fh,08ch	; 81db  ..........8.....
	defb 01eh,00ch,000h,0e0h,0f0h,0f0h,0d0h,000h,087h,01dh,03fh,0feh,007h,0f0h,081h,00fh	; 81eb  ..........?.....
	defb 005h,01fh,08bh,04fh,0efh,0e7h,012h,00ah,007h,000h,000h,012h,01eh,0e0h,005h,0f0h	; 81fb  ...O............
	defb 002h,0e0h,091h,0c4h,01eh,02fh,0cfh,016h,0f0h,060h,000h,00fh,01fh,01fh,017h,000h	; 820b  ...../...`......
	defb 002h,070h,038h,03fh,004h,01fh,003h,01eh,0a3h,0e0h,0f0h,0f0h,0d0h,000h,080h,000h	; 821b  .p8?............
	defb 038h,0fch,0feh,0fbh,0ffh,0f6h,0f0h,060h,000h,007h,00fh,00fh,03fh,00fh,01fh,00fh	; 822b  8......`....?...
	defb 007h,007h,008h,00bh,00fh,007h,003h,003h,007h,0e0h,0f0h,0f0h,003h,0f8h,08fh,0f0h	; 823b  ................
	defb 0e0h,000h,000h,080h,0e0h,0c0h,080h,020h,0e0h,007h,00fh,00fh,03fh,004h,003h,000h	; 824b  ....... ....?...
	defb 091h,007h,00fh,00fh,00ch,00fh,007h,003h,007h,0e0h,0f0h,0f0h,0f8h,098h,098h,030h	; 825b  ...............0
	defb 060h,0c0h,004h,0e0h,097h,0c0h,0e0h,0e0h,000h,007h,00fh,00fh,03fh,00fh,01fh,00fh	; 826b  `...........?...
	defb 007h,007h,008h,038h,03fh,030h,018h,00ch,000h,0e0h,0f0h,0f0h,003h,0f8h,08fh,0f0h	; 827b  ...8?0..........
	defb 0e0h,080h,018h,03ch,0fch,03ch,01ch,078h,000h,007h,00fh,00fh,03fh,004h,003h,000h	; 828b  ...<.<.x....?...
	defb 09ah,007h,01fh,01fh,00fh,03fh,01eh,00ch,000h,0e0h,0f0h,0f0h,0f8h,098h,098h,030h	; 829b  .....?.........0
	defb 060h,0f0h,0f8h,0ech,0fch,0fch,03ch,078h,007h,00fh,00fh,003h,01fh,0a3h,00fh,007h	; 82ab  `.....<x........
	defb 000h,000h,001h,007h,000h,000h,004h,007h,0e0h,0f0h,0f0h,0fch,0f0h,0f8h,0f0h,0e0h	; 82bb  ................
	defb 0e0h,010h,0d0h,0f0h,0c0h,000h,0c0h,0e0h,007h,00fh,00fh,01fh,019h,019h,00ch,006h	; 82cb  ................
	defb 003h,004h,007h,088h,003h,007h,007h,0e0h,0f0h,0f0h,0fch,020h,003h,000h,08ch,0e0h	; 82db  ........... ....
	defb 0f0h,0f0h,030h,030h,0e0h,0c0h,0e0h,000h,007h,00fh,00fh,003h,01fh,0afh,00fh,007h	; 82eb  ..00............
	defb 001h,018h,01ch,01fh,020h,038h,01eh,000h,0e0h,0f0h,0f0h,0fch,0f0h,0f8h,0f0h,0e0h	; 82fb  .... 8..........
	defb 0e0h,010h,01eh,0feh,00eh,018h,030h,000h,007h,00fh,00fh,01fh,019h,019h,00ch,006h	; 830b  ......0.........
	defb 00fh,01fh,007h,007h,03fh,03ch,01eh,000h,0e0h,0f0h,0f0h,0fch,020h,003h,000h,088h	; 831b  ....?<...... ...
	defb 0e0h,0f8h,0fah,0f6h,0feh,078h,030h,00fh,005h,01fh,002h,00fh,089h,004h,01ch,01fh	; 832b  .....x0.........
	defb 01fh,000h,020h,07ch,07ch,0e0h,005h,0f0h,002h,0e0h,081h,0c0h,003h,0f0h,0a5h,000h	; 833b  .. ||...........
	defb 004h,03eh,03eh,00fh,01fh,01fh,017h,000h,002h,000h,01bh,01fh,03bh,01bh,01fh,01fh	; 834b  .>>.............
	defb 03ch,07ch,07ch,0e0h,0f0h,0f0h,0d0h,000h,080h,000h,0b0h,0f0h,0f8h,0b0h,0f0h,0f0h	; 835b  <||.............
	defb 07ch,03eh,03eh,00fh,005h,01fh,09bh,00fh,077h,073h,078h,00eh,001h,000h,040h,0f9h	; 836b  |>>.....wsx...@.
	defb 0f1h,0e0h,0f0h,0f0h,0fch,0f4h,0fch,0ffh,0efh,0cch,080h,0a0h,0c0h,000h,000h,0e0h	; 837b  ................
	defb 0f0h,00fh,003h,01fh,002h,008h,094h,030h,07ch,04fh,04fh,01fh,01fh,03fh,079h,0f9h	; 838b  .......0|OO..?y.
	defb 0f1h,0e0h,0f0h,0f0h,0fch,007h,0afh,00fh,01bh,0fch,0f8h,003h,0e0h,094h,0c0h,0e0h	; 839b  ................
	defb 0f0h,007h,00fh,00fh,03fh,03fh,04fh,04fh,07fh,03fh,039h,03dh,003h,000h,00eh,01fh	; 83ab  ....??OO.?9=....
	defb 003h,0f0h,005h,0f8h,09bh,0c8h,0c0h,080h,018h,060h,082h,002h,006h,08eh,09ch,007h	; 83bb  .........`......
	defb 00fh,00fh,03fh,030h,075h,07fh,07dh,03fh,00fh,00fh,007h,007h,00fh,01fh,003h,0f0h	; 83cb  ..?0u.}?........
	defb 003h,0f8h,002h,010h,005h,0f8h,002h,0feh,084h,0deh,08eh,09ch,00fh,003h,01fh,08dh	; 83db  ................
	defb 03fh,07fh,06fh,06fh,007h,012h,00ah,007h,000h,000h,012h,01eh,0e0h,005h,0f0h,002h	; 83eb  ?.oo............
	defb 0e0h,091h,0c4h,01eh,02fh,0cfh,006h,010h,0f0h,060h,00fh,01fh,01fh,0d7h,0c0h,022h	; 83fb  ..../....`....."
	defb 070h,078h,03fh,004h,01fh,003h,01eh,091h,0e0h,0f0h,0f0h,0d0h,000h,080h,000h,038h	; 840b  px?............8
	defb 0fch,0feh,0fbh,0ffh,0f6h,0f0h,0f0h,060h,00fh,005h,01fh,002h,00fh,089h,007h,038h	; 841b  .......`.......8
	defb 03ch,01fh,00ch,01eh,00ch,000h,0e0h,004h,0f0h,093h,0f7h,0e7h,0efh,0ceh,090h,0a0h	; 842b  <...............
	defb 0c0h,000h,000h,090h,0f0h,00fh,01fh,01fh,017h,000h,002h,000h,018h,003h,03fh,002h	; 843b  ..............?.
	defb 013h,08ch,01eh,00ch,000h,0e0h,0f0h,0f0h,0d0h,000h,087h,01dh,03fh,0feh,007h,0f0h	; 844b  ............?...
	defb 081h,00fh,005h,01fh,002h,00fh,089h,007h,019h,039h,03fh,018h,020h,07ch,07ch,0e0h	; 845b  .........9?. ||.
	defb 005h,0f0h,002h,0e0h,090h,0c0h,030h,078h,0fch,07ch,038h,07ch,07ch,00fh,01fh,01fh	; 846b  ......0x.|8||...
	defb 017h,000h,002h,000h,018h,003h,03fh,08dh,027h,007h,03ch,07ch,07ch,0e0h,0f0h,0f0h	; 847b  ......?.'.<||...
	defb 0d0h,000h,080h,000h,030h,003h,0f8h,085h,0ech,0fch,078h,07ch,07ch,000h	; 848b  ....0.....x||.

; ----------------------------------------------------------------------
; DATOS dibujos128_8499: 5 dibujos de 128 bytes: p00:572E lee 0x8499 + 128 x A
;   y los copia a la VRAM 0xFAC0; p01:6CF8 solo pide el 0 y el 1 (A = el bit
;   alto de H); lo leen p00:5731 (640 bytes)
;   0x8499..0x8719  (640 bytes)
DATA_dibujos128_8499:
	defb 000h,00fh,01fh,01fh,01fh,01fh,01fh,01fh,00fh,03bh,03ch,01fh,00ch,01eh,00ch,000h	; 8499  ..........<.....
	defb 000h,0e0h,0f0h,0f0h,0f0h,0f7h,0f7h,0efh,0eeh,0d0h,0a0h,0c0h,000h,000h,090h,0f0h	; 84a9  ................
	defb 000h,00fh,01fh,01fh,017h,000h,002h,010h,038h,03fh,03fh,013h,013h,01eh,00ch,000h	; 84b9  ........8??.....
	defb 000h,0e0h,0f0h,0f0h,0d0h,007h,08dh,01fh,03eh,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h,0f0h	; 84c9  ........>.......
	defb 00fh,01fh,01fh,01fh,03fh,07fh,06fh,06fh,007h,012h,00ah,007h,000h,000h,012h,01eh	; 84d9  ....?.oo........
	defb 0e0h,0f0h,0f0h,0f0h,0f0h,0f0h,0e0h,0e0h,0c4h,01eh,02fh,0cfh,006h,010h,0f0h,060h	; 84e9  ........../....`
	defb 00fh,01fh,01fh,0d7h,0c0h,022h,070h,078h,03fh,01fh,01fh,01fh,01fh,01eh,01eh,01eh	; 84f9  ....."px?.......
	defb 0e0h,0f0h,0f0h,0d0h,000h,080h,000h,038h,0fch,0feh,0fbh,0ffh,0f6h,0f0h,0f0h,060h	; 8509  .......8.......`
	defb 003h,007h,00fh,00fh,07fh,0ffh,0ffh,07fh,000h,008h,008h,007h,000h,006h,009h,00fh	; 8519  ................
	defb 0e0h,0f0h,0f8h,0f8h,0f8h,0f8h,0f8h,0fch,03ch,01ch,008h,0f0h,008h,078h,048h,030h	; 8529  ........<....xH0
	defb 003h,007h,00fh,00fh,07fh,0dfh,0fbh,07ch,01fh,00fh,00fh,00fh,00fh,00fh,00fh,00fh	; 8539  .......|........
	defb 0e0h,0f0h,0f8h,0f8h,0f8h,0f8h,0e8h,01ch,0f3h,0f3h,0f8h,0f8h,0f8h,078h,078h,030h	; 8549  .............xx0
	defb 000h,003h,007h,00fh,00fh,00fh,00fh,00fh,020h,070h,0f8h,0f7h,068h,00fh,009h,006h	; 8559  ........ p..h...
	defb 000h,0e0h,0f0h,0f8h,0f8h,0fch,0fch,0e4h,000h,000h,008h,0f0h,000h,030h,048h,078h	; 8569  .............0Hx
	defb 000h,003h,007h,00fh,00fh,00fh,00fh,00bh,03fh,07fh,0dfh,0ffh,06fh,00fh,00fh,006h	; 8579  ........?...o...
	defb 000h,0e0h,0f0h,0f8h,0f8h,0f8h,0f8h,0fch,0fch,0f8h,0f8h,0f8h,0f8h,078h,078h,078h	; 8589  .............xxx
	defb 003h,007h,007h,01fh,007h,00fh,007h,003h,017h,078h,078h,06fh,000h,000h,006h,01fh	; 8599  .........xxo....
	defb 0f0h,0f8h,0f8h,0fch,0fch,0fch,0fch,09ch,018h,000h,000h,0e0h,000h,020h,060h,0e0h	; 85a9  ............. `.
	defb 003h,007h,007h,01fh,002h,000h,000h,000h,01fh,05fh,07fh,06fh,00fh,007h,007h,01fh	; 85b9  ........._.o....
	defb 0f0h,0f8h,0f8h,0fch,04ch,04fh,01bh,078h,0f8h,0f0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h	; 85c9  ....LO.x........
	defb 01fh,03fh,03fh,0ffh,03fh,07fh,03fh,078h,078h,014h,010h,00fh,000h,060h,038h,01ch	; 85d9  .??.?.?xx....`8.
	defb 080h,0c0h,0c0h,0e0h,0e0h,0e0h,0c0h,080h,020h,030h,030h,0e0h,000h,008h,018h,0f8h	; 85e9  ........ 00.....
	defb 01fh,03fh,03fh,0ffh,012h,002h,000h,01fh,01fh,01fh,01fh,00fh,00fh,07fh,03ch,01ch	; 85f9  .??...........<.
	defb 080h,0c0h,0c0h,0e0h,060h,060h,0c0h,080h,0e0h,0f0h,0f0h,0e0h,0e0h,0f8h,078h,0f8h	; 8609  ....``........x.
	defb 00fh,01fh,01fh,03fh,03fh,03fh,03fh,039h,018h,000h,000h,007h,000h,004h,006h,007h	; 8619  ...????9........
	defb 0c0h,0e0h,0e0h,0f8h,0e0h,0f0h,0e0h,0c0h,0e8h,01eh,01eh,0f6h,000h,000h,060h,0f8h	; 8629  ..............`.
	defb 00fh,01fh,01fh,03fh,032h,0f2h,0d8h,01eh,01fh,00fh,007h,007h,007h,007h,007h,007h	; 8639  ...?2...........
	defb 0c0h,0e0h,0e0h,0f8h,040h,000h,000h,000h,0f8h,0fah,0feh,0f6h,0f0h,0e0h,0e0h,0f8h	; 8649  ....@...........
	defb 001h,003h,003h,007h,007h,007h,003h,001h,004h,00ch,00ch,007h,000h,010h,018h,01fh	; 8659  ................
	defb 0f8h,0fch,0fch,0ffh,0fch,0feh,0fch,01eh,01eh,028h,008h,0f0h,000h,006h,01ch,038h	; 8669  .........(.....8
	defb 001h,003h,003h,007h,006h,006h,003h,001h,007h,00fh,00fh,007h,007h,01fh,01eh,01fh	; 8679  ................
	defb 0f8h,0fch,0fch,0ffh,048h,040h,000h,0f8h,0f8h,0f8h,0f8h,0f0h,0f0h,0feh,03ch,038h	; 8689  ....H@........<8
	defb 000h,000h,000h,00fh,03fh,07fh,07fh,07fh,07fh,0ffh,01eh,078h,03ch,07dh,078h,000h	; 8699  ....?......x<}x.
	defb 000h,000h,000h,080h,0c0h,0e0h,0e0h,0e0h,0e0h,0c0h,012h,013h,093h,029h,058h,008h	; 86a9  .............)X.
	defb 000h,000h,000h,00fh,03fh,07fh,07fh,07ch,074h,0d1h,007h,07fh,0ffh,0f7h,078h,000h	; 86b9  ....?..|t.....x.
	defb 000h,000h,000h,080h,0c0h,0e0h,0e0h,0e0h,020h,0d8h,0feh,0ffh,0ffh,0f9h,058h,008h	; 86c9  ........ .....X.
	defb 000h,000h,000h,001h,003h,007h,007h,007h,007h,003h,048h,0c8h,0c9h,094h,01ah,010h	; 86d9  ..........H.....
	defb 000h,000h,000h,0f0h,0fch,0feh,0feh,0feh,0feh,0ffh,078h,01eh,03ch,0beh,01eh,000h	; 86e9  ..........x.<...
	defb 000h,000h,000h,001h,003h,007h,007h,007h,004h,01bh,07fh,0ffh,0ffh,09fh,01ah,010h	; 86f9  ................
	defb 000h,000h,000h,0f0h,0fch,0feh,0feh,03eh,02eh,08bh,0e0h,0feh,0ffh,0efh,01eh,000h	; 8709  .......>........

; ----------------------------------------------------------------------
; DATOS copia_8719: 64 bytes que p00:4AB7 copia tal cual a la VRAM 0xFA00; lo
;   leen p00:51D9 (64 bytes)
;   0x8719..0x8759  (64 bytes)
DATA_copia_8719:
	defb 00fh,01fh,01fh,01fh,01fh,01fh,00fh,00fh,004h,01ch,01fh,01fh,000h,020h,07ch,07ch	; 8719  ............. ||
	defb 0e0h,0f0h,0f0h,0f0h,0f0h,0f0h,0e0h,0e0h,0c0h,0f0h,0f0h,0f0h,000h,004h,03eh,03eh	; 8729  ..............>>
	defb 00fh,01fh,01fh,017h,000h,002h,000h,01bh,01fh,03bh,01bh,01fh,01fh,03ch,07ch,07ch	; 8739  .............<||
	defb 0e0h,0f0h,0f0h,0d0h,000h,080h,000h,0b0h,0f0h,0f8h,0b0h,0f0h,0f0h,07ch,03eh,03eh	; 8749  .............|>>

; ----------------------------------------------------------------------
; DATOS dibujo64_00: dibujo 0 de 64 bytes que p00:5716 (0x8759 + 64 x A) copia
;   a la VRAM 0xFFC0; lo leen p00:5724 (64 bytes)
;   0x8759..0x8799  (64 bytes)
DATA_dibujo64_00:
	defb 003h,007h,00fh,009h,077h,0ffh,0ffh,07fh,006h,00bh,009h,007h,000h,006h,009h,00fh	; 8759  ....w...........
	defb 060h,0f0h,078h,0c8h,0f0h,0f8h,0f8h,0f0h,062h,0ceh,00eh,0f0h,008h,078h,030h,000h	; 8769  `.x.....b....x0.
	defb 003h,007h,00eh,00fh,07fh,0dfh,0fbh,07ch,01fh,00fh,00fh,00fh,00fh,00fh,00fh,00fh	; 8779  .......|........
	defb 0e0h,070h,0b8h,078h,0f8h,0f8h,0e8h,010h,0feh,0feh,0f8h,0f8h,0f8h,078h,030h,000h	; 8789  .p.x.........x0.

; ----------------------------------------------------------------------
; DATOS dibujo64_01: dibujo 1 de 64 bytes que p00:5716 (0x8759 + 64 x A) copia
;   a la VRAM 0xFFC0; lo leen p00:5724 (64 bytes)
;   0x8799..0x87d9  (64 bytes)
DATA_dibujo64_01:
	defb 003h,007h,00fh,009h,007h,00fh,00fh,007h,023h,071h,0f8h,0f7h,068h,00fh,006h,000h	; 8799  ........#q..h...
	defb 060h,0f0h,078h,0c8h,0f6h,0feh,0feh,0f2h,030h,0e0h,048h,0f0h,000h,030h,048h,078h	; 87a9  `.x.....0.H..0Hx
	defb 003h,007h,00eh,00fh,00fh,00fh,00bh,004h,03fh,07fh,0dfh,0ffh,06fh,00fh,006h,000h	; 87b9  ........?...o...
	defb 0e0h,070h,0b8h,078h,0f8h,0f8h,0eeh,01eh,0fch,0f8h,0f8h,0f8h,0f8h,078h,078h,078h	; 87c9  .p.x.........xxx

; ----------------------------------------------------------------------
; DATOS dibujo64_02: dibujo 2 de 64 bytes que p00:5716 (0x8759 + 64 x A) copia
;   a la VRAM 0xFFC0; lo leen p00:5724 (64 bytes)
;   0x87d9..0x8819  (64 bytes)
DATA_dibujo64_02:
	defb 00fh,01ch,01fh,018h,017h,014h,01bh,00ch,04fh,07fh,06fh,06fh,017h,01fh,00ch,000h	; 87d9  ........O.oo....
	defb 0e0h,070h,0f0h,030h,0d0h,057h,0b7h,07fh,0feh,0f0h,0e0h,0e0h,0e0h,0f0h,0f0h,0f0h	; 87e9  .p.0.W..........
	defb 00fh,01fh,01fh,017h,01fh,01bh,01fh,03bh,07fh,078h,01fh,018h,01ch,01fh,00ch,000h	; 87f9  .........x......
	defb 0e0h,0f0h,0f0h,0d0h,0f0h,0b7h,0fdh,0bfh,0deh,010h,0f0h,030h,070h,090h,0b0h,0f0h	; 8809  ...........0p...

; ----------------------------------------------------------------------
; DATOS dibujo64_03: dibujo 3 de 64 bytes que p00:5716 (0x8759 + 64 x A) copia
;   a la VRAM 0xFFC0; lo leen p00:5724 (64 bytes)
;   0x8819..0x8859  (64 bytes)
DATA_dibujo64_03:
	defb 00fh,01ch,01fh,018h,017h,014h,05bh,0fch,0ffh,01fh,00fh,00fh,00fh,01fh,01eh,01eh	; 8819  ......[.........
	defb 0e0h,070h,0f0h,030h,0d0h,050h,0b0h,060h,0e4h,0feh,0efh,0efh,0d6h,0f0h,060h,000h	; 8829  .p.0.P.`......`.
	defb 00fh,01fh,01fh,017h,01fh,01bh,07fh,03bh,037h,010h,01fh,018h,01ch,017h,01ah,01eh	; 8839  ........7.......
	defb 0e0h,0f0h,0f0h,0d0h,0f0h,0b0h,0f0h,0b8h,0fch,03eh,0fbh,03fh,076h,0f0h,060h,000h	; 8849  .........>.?v.`.

; ----------------------------------------------------------------------
; DATOS dibujo64_04: dibujo 4 de 64 bytes que p00:5716 (0x8759 + 64 x A) copia
;   a la VRAM 0xFFC0; lo leen p00:5724 (64 bytes)
;   0x8859..0x8899  (64 bytes)
DATA_dibujo64_04:
	defb 007h,00bh,01fh,011h,01eh,012h,01dh,00bh,00fh,01eh,01fh,01fh,01fh,01fh,00bh,007h	; 8859  ................
	defb 0e0h,0f0h,0f0h,0fch,0f8h,0f8h,0f0h,0e0h,000h,000h,080h,0e0h,0c0h,080h,020h,0e0h	; 8869  .............. .
	defb 007h,00fh,01fh,01eh,01fh,01dh,01fh,00dh,00fh,013h,01fh,014h,01fh,017h,00bh,007h	; 8879  ................
	defb 0e0h,0f0h,0f0h,0fch,098h,098h,030h,060h,0c0h,0e0h,0e0h,0e0h,0e0h,0c0h,0e0h,0e0h	; 8889  ......0`........

; ----------------------------------------------------------------------
; DATOS dibujo64_05: dibujo 5 de 64 bytes que p00:5716 (0x8759 + 64 x A) copia
;   a la VRAM 0xFFC0; lo leen p00:5724 (64 bytes)
;   0x8899..0x88d9  (64 bytes)
DATA_dibujo64_05:
	defb 000h,007h,00bh,01fh,011h,01eh,012h,01dh,00bh,007h,00fh,03fh,03fh,03fh,01fh,00eh	; 8899  ...........???..
	defb 000h,0e0h,0f0h,0f0h,0fch,0f8h,0f8h,0f0h,0e0h,0e0h,0d8h,0bch,0fch,0bch,01ch,078h	; 88a9  ...............x
	defb 000h,007h,00fh,01fh,01eh,01fh,01dh,01fh,00dh,007h,018h,01fh,008h,03fh,019h,00eh	; 88b9  .............?..
	defb 000h,0e0h,0f0h,0f0h,0fch,098h,098h,030h,060h,0b0h,078h,0ech,07ch,0fch,03ch,078h	; 88c9  .......0`.x.|.<x

; ----------------------------------------------------------------------
; DATOS dibujo64_06: dibujo 6 de 64 bytes que p00:5716 (0x8759 + 64 x A) copia
;   a la VRAM 0xFFC0; lo leen p00:5724 (64 bytes)
;   0x88d9..0x8919  (64 bytes)
DATA_dibujo64_06:
	defb 007h,00fh,00fh,03fh,01fh,01fh,00fh,007h,000h,000h,001h,007h,000h,000h,004h,007h	; 88d9  ...?............
	defb 0e0h,0d0h,0f8h,088h,078h,048h,0b8h,0d0h,0f0h,078h,0f8h,0f8h,0f8h,038h,0d0h,0e0h	; 88e9  ....xH...x...8..
	defb 007h,00fh,00fh,03fh,019h,019h,00ch,006h,003h,007h,007h,007h,007h,003h,007h,007h	; 88f9  ...?............
	defb 0e0h,0f0h,0f8h,078h,0f8h,0b8h,0f8h,0b0h,0f0h,0c8h,0f8h,028h,038h,0e8h,0d0h,0e0h	; 8909  ...x.......(8...

; ----------------------------------------------------------------------
; DATOS dibujo64_07: dibujo 7 de 64 bytes que p00:5716 (0x8759 + 64 x A) copia
;   a la VRAM 0xFFC0; lo leen p00:5724 (64 bytes)
;   0x8919..0x8959  (64 bytes)
DATA_dibujo64_07:
	defb 000h,007h,00fh,00fh,03fh,01fh,01fh,00fh,007h,007h,01bh,01dh,01fh,021h,038h,01eh	; 8919  ....?........!8.
	defb 000h,0e0h,0d0h,0f8h,088h,078h,048h,0b8h,0d0h,0e0h,0f4h,0feh,0feh,0feh,0f8h,070h	; 8929  .....xH........p
	defb 000h,007h,00fh,00fh,03fh,019h,019h,00ch,006h,00dh,01eh,007h,006h,03fh,03ch,01eh	; 8939  ....?........?<.
	defb 000h,0e0h,0f0h,0f8h,078h,0f8h,0b8h,0f8h,0b0h,0e0h,01ch,0fah,016h,0feh,098h,070h	; 8949  ....x..........p

; ----------------------------------------------------------------------
; DATOS dibujo64_08: dibujo 8 de 64 bytes que p00:5716 (0x8759 + 64 x A) copia
;   a la VRAM 0xFFC0; lo leen p00:5724 (64 bytes)
;   0x8959..0x8999  (64 bytes)
DATA_dibujo64_08:
	defb 000h,000h,00fh,01fh,01fh,01ch,01fh,018h,057h,0fch,0ffh,01fh,00fh,03fh,037h,07dh	; 8959  ........W....?7}
	defb 000h,000h,0e0h,0f0h,0f0h,070h,0f0h,030h,0d0h,060h,0f8h,0f8h,0f0h,0f8h,038h,03ch	; 8969  .....p.0.`....8<
	defb 000h,000h,00fh,01fh,01fh,01fh,01fh,017h,07fh,03bh,037h,010h,01fh,009h,03fh,07dh	; 8979  ..........7...?}
	defb 000h,000h,0e0h,0f0h,0f0h,0f0h,0f0h,0d0h,0f0h,0b8h,0f8h,058h,0d0h,0e0h,0f8h,0fch	; 8989  ...........X....

; ----------------------------------------------------------------------
; DATOS dibujo64_09: dibujo 9 de 64 bytes que p00:5716 (0x8759 + 64 x A) copia
;   a la VRAM 0xFFC0; lo leen p00:5724 (64 bytes)
;   0x8999..0x89d9  (64 bytes)
DATA_dibujo64_09:
	defb 00fh,01fh,01fh,01eh,01dh,01dh,00eh,07fh,07fh,07fh,00fh,037h,07bh,079h,0f9h,0f1h	; 8999  ...........7{y..
	defb 0e0h,010h,0f0h,00ch,0fch,01ch,0efh,01fh,0ech,0e0h,0f0h,0f0h,0f0h,0f0h,0e0h,0f0h	; 89a9  ................
	defb 00fh,01fh,01fh,01dh,00fh,00eh,035h,07eh,04bh,048h,01fh,03ch,04fh,049h,0f9h,0f1h	; 89b9  ......5~KH.<OI..
	defb 0e0h,0f0h,0f0h,0fch,0ffh,0efh,0ffh,0fbh,0fch,018h,0f0h,010h,030h,0d0h,0e0h,0f0h	; 89c9  ............0...

; ----------------------------------------------------------------------
; DATOS dibujo64_10: dibujo 10 de 64 bytes que p00:5716 (0x8759 + 64 x A)
;   copia a la VRAM 0xFFC0; lo leen p00:5724 (64 bytes)
;   0x89d9..0x8a19  (64 bytes)
DATA_dibujo64_10:
	defb 007h,008h,00fh,030h,03fh,048h,04fh,07fh,03fh,03fh,03fh,007h,007h,01fh,03fh,007h	; 89d9  ...0?HO.???...?.
	defb 0f0h,0f8h,0f8h,078h,0b8h,0b8h,0c8h,0c0h,0c0h,0f8h,0e0h,0fah,0feh,01eh,08eh,09ch	; 89e9  ...x............
	defb 007h,00fh,00fh,03fh,03fh,077h,07fh,07dh,03fh,008h,00fh,000h,004h,01bh,03fh,007h	; 89f9  ...??w.}?.....?.
	defb 0f0h,0f8h,0f8h,0b8h,0f0h,070h,0f8h,0f8h,0f8h,038h,0f8h,03eh,0e6h,0c6h,08eh,09ch	; 8a09  .....p...8.>....

; ----------------------------------------------------------------------
; DATOS dibujo64_11: dibujo 11 de 64 bytes que p00:5716 (0x8759 + 64 x A)
;   copia a la VRAM 0xFFC0; lo leen p00:5724 (64 bytes)
;   0x8a19..0x8a59  (64 bytes)
DATA_dibujo64_11:
	defb 003h,007h,00fh,009h,077h,0ffh,0ffh,07fh,006h,00bh,009h,007h,000h,006h,009h,00fh	; 8a19  ....w...........
	defb 060h,0f0h,078h,0c8h,0f0h,0f8h,0f8h,0fch,07ch,0dch,008h,0f0h,008h,078h,048h,030h	; 8a29  `.x.....|....xH0
	defb 003h,007h,00eh,00fh,07fh,0dfh,0fbh,07ch,01fh,00fh,00fh,00fh,00fh,00fh,00fh,00fh	; 8a39  .......|........
	defb 0e0h,070h,0b8h,078h,0f8h,0f8h,0e8h,01ch,0f3h,0f3h,0f8h,0f8h,0f8h,078h,078h,030h	; 8a49  .p.x.........xx0

; ----------------------------------------------------------------------
; DATOS dibujo64_12: dibujo 12 de 64 bytes que p00:5716 (0x8759 + 64 x A)
;   copia a la VRAM 0xFFC0; lo leen p00:5724 (64 bytes)
;   0x8a59..0x8a99  (64 bytes)
DATA_dibujo64_12:
	defb 003h,007h,00fh,009h,007h,00fh,00fh,007h,023h,071h,0f8h,0f7h,068h,00fh,009h,006h	; 8a59  ........#q..h...
	defb 060h,0f0h,078h,0c8h,0f0h,0fch,0fch,0f4h,030h,0e0h,048h,0f0h,000h,030h,048h,078h	; 8a69  `.x.....0.H..0Hx
	defb 003h,007h,00eh,00fh,00fh,00fh,00bh,004h,03fh,07fh,0dfh,0ffh,06fh,00fh,00fh,006h	; 8a79  ........?...o...
	defb 0e0h,070h,0b8h,078h,0f8h,0f8h,0e8h,01ch,0fch,0f8h,0f8h,0f8h,0f8h,078h,078h,078h	; 8a89  .p.x.........xxx

; ----------------------------------------------------------------------
; DATOS dibujo64_13: dibujo 13 de 64 bytes que p00:5716 (0x8759 + 64 x A)
;   copia a la VRAM 0xFFC0; lo leen p00:5724 (64 bytes)
;   0x8a99..0x8ad9  (64 bytes)
DATA_dibujo64_13:
	defb 00eh,01fh,01eh,013h,00fh,01fh,00fh,00fh,006h,023h,031h,00fh,030h,038h,030h,07ch	; 8a99  .........#1.080|
	defb 0e0h,0f0h,0f0h,090h,0e0h,0f0h,0e0h,0e0h,0c0h,088h,018h,0e0h,018h,038h,018h,07ch	; 8aa9  .............8.|
	defb 00fh,01eh,01dh,01eh,01fh,01fh,007h,018h,03fh,03fh,03fh,01fh,01fh,00fh,03ch,07ch	; 8ab9  ........???...<|
	defb 0e0h,0f0h,070h,0f0h,0f0h,0f0h,0c0h,030h,0f8h,0f8h,0f8h,0f0h,0f0h,0e0h,078h,07ch	; 8ac9  ..p....0......x|

; ----------------------------------------------------------------------
; DATOS rachas_8AD9: rachas a la VRAM (p00:4B62 -> p00:4B35); lo leen p00:5433
;   (1290 bytes)
;   0x8ad9..0x8fe3  (1290 bytes)
DATA_rachas_8AD9:
	defb 006h,000h,081h,001h,003h,003h,00ch,000h,085h,080h,0c0h,0e0h,080h,080h,00dh,000h	; 8ad9  ................
	defb 083h,003h,000h,001h,00bh,000h,085h,0c0h,060h,020h,0e0h,0c0h,00bh,000h,081h,003h	; 8ae9  ........` ......
	defb 003h,007h,081h,003h,00ah,000h,002h,080h,085h,0c0h,0f0h,0c0h,080h,080h,009h,000h	; 8af9  ................
	defb 087h,001h,000h,000h,001h,006h,000h,001h,009h,000h,087h,0c0h,0e0h,0b0h,030h,070h	; 8b09  ..............0p
	defb 0e0h,0c0h,008h,000h,082h,002h,007h,004h,00fh,002h,007h,009h,000h,088h,080h,0e0h	; 8b19  ................
	defb 0f0h,0e8h,0c0h,0c0h,080h,080h,007h,000h,089h,003h,004h,008h,001h,002h,002h,00ah	; 8b29  ................
	defb 001h,003h,007h,000h,089h,0e0h,070h,0f8h,018h,018h,038h,038h,070h,0e0h,006h,000h	; 8b39  ......p...88p...
	defb 084h,001h,000h,007h,00fh,003h,01fh,082h,00fh,007h,008h,000h,08ah,080h,0c0h,0e0h	; 8b49  ................
	defb 0e0h,0f8h,0e4h,0e0h,0c0h,080h,080h,005h,000h,08bh,001h,007h,008h,000h,001h,012h	; 8b59  ................
	defb 00ch,000h,008h,007h,001h,005h,000h,08bh,0c0h,0f0h,0b8h,098h,01ch,01ch,03ch,058h	; 8b69  ..............<X
	defb 0b8h,0f0h,0c0h,004h,000h,084h,003h,000h,00fh,01fh,005h,03fh,082h,01fh,00fh,006h	; 8b79  ...........?....
	defb 000h,082h,080h,0c0h,005h,0e0h,085h,0ech,0d0h,0a0h,040h,040h,003h,000h,083h,003h	; 8b89  ..........@@....
	defb 00fh,010h,005h,000h,085h,031h,00eh,010h,00fh,003h,003h,000h,093h,0e0h,0f8h,07ch	; 8b99  .....1.........|
	defb 03ch,03eh,03eh,05eh,09eh,01eh,03ch,07ch,0f8h,0e0h,000h,001h,007h,01fh,03fh,07fh	; 8ba9  <>>^..<|......?.
	defb 006h,0ffh,084h,07fh,03fh,01fh,007h,003h,000h,083h,0c0h,0f0h,0f0h,003h,0f8h,08ch	; 8bb9  ....?...........
	defb 0fch,0fbh,0f8h,0f0h,0f0h,0e0h,0c0h,040h,007h,019h,021h,040h,003h,000h,09fh,0e0h	; 8bc9  .......@..!@....
	defb 018h,004h,002h,001h,040h,020h,018h,007h,0e0h,0f8h,03ch,08eh,08eh,047h,027h,017h	; 8bd9  ....@ ....<..G'.
	defb 00fh,007h,007h,00eh,08eh,09ch,078h,0e0h,000h,000h,007h,03fh,07fh,07fh,007h,0ffh	; 8be9  ......x....?....
	defb 002h,07fh,088h,03fh,040h,020h,0d0h,0f8h,0fch,0feh,0feh,005h,0ffh,002h,0feh,085h	; 8bf9  ...?@ ..........
	defb 0fch,0f8h,003h,00fh,018h,007h,000h,082h,0c1h,03eh,004h,000h,090h,0f8h,0feh,03fh	; 8c09  .........>.....?
	defb 017h,013h,011h,011h,020h,040h,080h,003h,004h,009h,011h,023h,027h,00dh,000h,083h	; 8c19  .... @.....#'...
	defb 03fh,002h,002h,006h,000h,081h,007h,016h,000h,086h,0c2h,07fh,01fh,004h,006h,006h	; 8c29  ?...............
	defb 007h,007h,002h,006h,084h,004h,0f8h,0f0h,0c0h,00bh,000h,002h,001h,003h,003h,006h	; 8c39  ................
	defb 000h,002h,002h,082h,01fh,07fh,006h,0ffh,00fh,000h,081h,003h,006h,000h,085h,007h	; 8c49  ................
	defb 01fh,062h,081h,001h,00dh,000h,088h,0c0h,0f0h,0f8h,0fch,0fch,0feh,0feh,0ffh,016h	; 8c59  .b..............
	defb 000h,08ah,0f0h,0fch,03fh,00fh,007h,083h,063h,01dh,003h,001h,009h,000h,002h,080h	; 8c69  ....?...c.......
	defb 002h,0c0h,003h,0e0h,004h,003h,002h,001h,00ah,000h,007h,0ffh,083h,07fh,01fh,001h	; 8c79  ................
	defb 016h,000h,084h,0c0h,020h,010h,010h,003h,008h,084h,084h,062h,01fh,007h,005h,000h	; 8c89  .... ......b....
	defb 004h,0feh,086h,0fch,0fdh,0f9h,0f2h,0ech,0f0h,006h,000h,005h,080h,00bh,000h,004h	; 8c99  ................
	defb 001h,002h,003h,085h,007h,00fh,01fh,0fch,0f0h,005h,000h,004h,0e0h,002h,0c0h,002h	; 8ca9  ................
	defb 080h,012h,000h,083h,001h,003h,003h,003h,007h,005h,000h,002h,004h,082h,00fh,03fh	; 8cb9  ...............?
	defb 007h,0ffh,009h,000h,081h,001h,005h,000h,081h,007h,005h,000h,087h,007h,01fh,074h	; 8cc9  ...............t
	defb 0c2h,002h,001h,001h,00bh,000h,086h,0c0h,0f0h,0f8h,0fch,0feh,0feh,003h,0ffh,015h	; 8cd9  ................
	defb 000h,08bh,0f0h,0fch,03fh,00fh,007h,003h,001h,081h,080h,040h,020h,008h,000h,085h	; 8ce9  ....?......@ ...
	defb 080h,0c0h,0c0h,0e0h,0e0h,003h,0f0h,004h,007h,002h,003h,081h,001h,009h,000h,008h	; 8cf9  ................
	defb 0ffh,082h,03fh,00fh,00dh,000h,081h,001h,008h,000h,08ch,0c0h,030h,008h,004h,002h	; 8d09  ..?.........0...
	defb 001h,000h,000h,0c0h,070h,01fh,007h,004h,000h,004h,0ffh,002h,0feh,086h,0fch,0f8h	; 8d19  ....p...........
	defb 0f0h,0c0h,020h,020h,007h,000h,081h,0f0h,00ch,000h,08ch,010h,00ch,003h,000h,001h	; 8d29  ..  ............
	defb 001h,083h,087h,04fh,07fh,0fch,0f0h,004h,000h,004h,0f0h,002h,0e0h,002h,0c0h,081h	; 8d39  ...O............
	defb 080h,010h,000h,084h,001h,003h,007h,007h,003h,00fh,006h,000h,082h,00fh,03fh,008h	; 8d49  ..............?.
	defb 0ffh,008h,000h,082h,001h,002h,00ah,000h,084h,007h,01fh,070h,0c0h,00ch,000h,002h	; 8d59  ...........p....
	defb 020h,002h,0f0h,083h,0f8h,0fch,0feh,005h,0ffh,00dh,000h,003h,080h,004h,000h,08ch	; 8d69   ...............
	defb 0f0h,0fch,01fh,01fh,017h,013h,011h,010h,020h,020h,040h,080h,007h,000h,086h,080h	; 8d79  ........  @.....
	defb 0c0h,0e0h,0e0h,0f0h,0f0h,003h,078h,004h,00fh,084h,007h,003h,003h,001h,008h,000h	; 8d89  ......x.........
	defb 009h,0ffh,082h,03fh,00fh,005h,000h,089h,008h,006h,001h,000h,000h,004h,000h,002h	; 8d99  ...?............
	defb 001h,007h,000h,083h,001h,006h,0f8h,006h,000h,084h,0c0h,070h,01fh,007h,003h,000h	; 8da9  ...........p....
	defb 006h,0ffh,087h,0feh,0fch,0f8h,0f0h,0c0h,080h,080h,003h,000h,084h,080h,0f8h,080h	; 8db9  ................
	defb 080h,00eh,000h,08bh,001h,002h,004h,008h,011h,023h,047h,04fh,0bfh,0fch,0f0h,003h	; 8dc9  .........#GO....
	defb 000h,002h,078h,088h,0f8h,078h,0f0h,0f0h,0e0h,0e0h,0c0h,080h,00dh,000h,085h,001h	; 8dd9  ..x..x..........
	defb 003h,007h,00fh,00fh,004h,01fh,003h,000h,002h,001h,082h,01fh,07fh,009h,0ffh,006h	; 8de9  ................
	defb 000h,083h,001h,002h,004h,006h,000h,081h,00fh,003h,000h,088h,00fh,03fh,0e2h,082h	; 8df9  .............?..
	defb 002h,002h,001h,001h,00ah,000h,085h,080h,0e0h,0f8h,0fch,0feh,006h,0ffh,00bh,000h	; 8e09  ................
	defb 002h,080h,003h,0c0h,003h,000h,08dh,0f8h,0feh,07fh,01fh,007h,003h,001h,000h,080h	; 8e19  ................
	defb 080h,040h,020h,010h,005h,000h,088h,080h,0c0h,0e0h,0f0h,0f0h,0f8h,078h,07ch,003h	; 8e29  .@ ..........x|.
	defb 03ch,005h,01fh,002h,00fh,002h,007h,081h,001h,006h,000h,00bh,0ffh,086h,03fh,000h	; 8e39  <.............?.
	defb 001h,000h,000h,010h,008h,000h,082h,002h,001h,005h,000h,088h,0c0h,020h,010h,008h	; 8e49  ............. ..
	defb 004h,002h,001h,001h,003h,000h,085h,0c0h,03fh,00fh,000h,000h,007h,0ffh,086h,0feh	; 8e59  ........?.......
	defb 0fch,0f8h,0e0h,080h,080h,003h,000h,002h,0c0h,084h,0c4h,0f8h,080h,080h,00ah,000h	; 8e69  ................
	defb 083h,008h,006h,001h,004h,000h,095h,001h,083h,087h,09fh,0ffh,0feh,0f8h,000h,000h	; 8e79  ................
	defb 03ch,03ch,0bch,07ch,07ch,078h,0f8h,0f0h,0f0h,0e0h,0c0h,080h,00ah,000h,086h,001h	; 8e89  <<.||x..........
	defb 003h,00fh,00fh,01fh,01fh,004h,03fh,004h,000h,082h,00fh,07fh,00ah,0ffh,005h,000h	; 8e99  ......?.........
	defb 083h,001h,002h,004h,005h,000h,002h,001h,08eh,002h,000h,000h,00fh,03fh,0f0h,080h	; 8ea9  .............?..
	defb 001h,006h,018h,020h,040h,080h,080h,007h,000h,084h,080h,0e0h,0f8h,0feh,008h,0ffh	; 8eb9  ... @...........
	defb 009h,000h,083h,080h,0c0h,0c0h,004h,0e0h,002h,000h,087h,0f8h,0feh,07fh,01fh,0ffh	; 8ec9  ................
	defb 007h,001h,00bh,000h,088h,080h,0c0h,0e0h,0f0h,0f8h,0f8h,07ch,07ch,004h,03eh,005h	; 8ed9  ...........||.>.
	defb 03fh,002h,01fh,002h,00fh,082h,003h,001h,005h,000h,00bh,0ffh,082h,07fh,00fh,003h	; 8ee9  ?...............
	defb 000h,005h,002h,002h,001h,002h,000h,083h,004h,002h,001h,00bh,000h,089h,080h,040h	; 8ef9  ...............@
	defb 030h,00fh,080h,0f0h,03fh,00fh,000h,00ah,0ffh,086h,0feh,0f8h,090h,008h,008h,000h	; 8f09  0...?...........
	defb 003h,0f0h,086h,0e8h,0c6h,0c0h,0c0h,080h,080h,011h,000h,086h,001h,0e7h,07fh,0feh	; 8f19  ................
	defb 0f8h,000h,004h,01eh,089h,03eh,03ch,03ch,078h,078h,0f0h,0e0h,0c0h,080h,008h,000h	; 8f29  .....><<xx......
	defb 086h,003h,00fh,01fh,01fh,03fh,03fh,005h,07fh,081h,000h,003h,008h,081h,07fh,00bh	; 8f39  .....??.........
	defb 0ffh,003h,000h,083h,001h,003h,004h,004h,000h,084h,001h,002h,00ch,070h,003h,000h	; 8f49  .............p..
	defb 08fh,01fh,07fh,0ffh,090h,010h,020h,020h,040h,080h,000h,001h,002h,004h,008h,008h	; 8f59  ......  @.......
	defb 004h,000h,084h,0c0h,0f0h,0fch,0feh,008h,0ffh,009h,000h,093h,080h,0e0h,0d8h,0c4h	; 8f69  ................
	defb 0e2h,0e1h,0e0h,000h,0fch,0ffh,0ffh,03fh,00fh,003h,001h,000h,01fh,060h,080h,007h	; 8f79  .......?.....`..
	defb 000h,08ah,0c0h,0e0h,0f0h,0f8h,0fch,0fch,07eh,0feh,03fh,03fh,003h,01fh,006h,07fh	; 8f89  ........~.??....
	defb 002h,03fh,002h,01fh,083h,00fh,007h,001h,003h,000h,00dh,0ffh,083h,07fh,002h,001h	; 8f99  .?..............
	defb 00ch,000h,086h,002h,001h,000h,000h,010h,010h,006h,020h,003h,010h,002h,008h,083h	; 8fa9  .......... .....
	defb 084h,07fh,01fh,00ah,0ffh,086h,0feh,0fch,0f0h,0c0h,000h,000h,005h,0e0h,002h,0c0h	; 8fb9  ................
	defb 002h,080h,011h,000h,086h,001h,003h,00fh,03fh,0ffh,0fch,005h,01fh,08bh,03fh,03eh	; 8fc9  ........?.....?>
	defb 07eh,07ch,0fch,0f8h,0f0h,0e0h,0c0h,000h,000h,000h	; 8fd9  ~|........

; ----------------------------------------------------------------------
; DATOS rachas_8FE3: rachas a la VRAM (p00:4B62 -> p00:4B35); lo leen p00:5474
;   (925 bytes)
;   0x8fe3..0x9380  (925 bytes)
DATA_rachas_8FE3:
	defb 00dh,000h,083h,001h,003h,007h,007h,000h,085h,001h,007h,00fh,03fh,07fh,004h,0ffh	; 8fe3  ............?...
	defb 016h,000h,089h,001h,006h,008h,010h,008h,070h,038h,047h,00dh,006h,000h,082h,003h	; 8ff3  ........p8G.....
	defb 03fh,009h,0ffh,005h,000h,00bh,0ffh,002h,000h,085h,003h,00fh,03fh,0fch,0c0h,005h	; 9003  ?...........?...
	defb 000h,086h,0c0h,000h,000h,0e0h,000h,03fh,003h,0ffh,011h,000h,082h,0f0h,0feh,008h	; 9013  .......?........
	defb 0ffh,008h,000h,084h,080h,0e0h,0f8h,0fch,004h,0ffh,081h,000h,005h,0ffh,082h,00fh	; 9023  ................
	defb 001h,00ah,000h,082h,0e0h,0fch,004h,0ffh,088h,07fh,01fh,007h,003h,003h,000h,000h	; 9033  ................
	defb 007h,00ah,000h,086h,010h,00eh,01ch,0e2h,0b0h,080h,015h,000h,086h,0c0h,0e0h,0f0h	; 9043  ................
	defb 0f8h,0fch,0feh,004h,0ffh,081h,07fh,00ch,000h,087h,080h,0c0h,0e0h,0e0h,007h,00fh	; 9053  ................
	defb 00fh,003h,01fh,003h,03fh,007h,07fh,010h,0ffh,010h,000h,081h,003h,00fh,000h,020h	; 9063  ....?..........
	defb 0ffh,090h,040h,020h,0f8h,010h,010h,03eh,008h,008h,01fh,004h,004h,01fh,002h,002h	; 9073  ..@ ...>........
	defb 00fh,002h,00eh,000h,082h,080h,000h,020h,0ffh,00eh,000h,094h,001h,000h,002h,004h	; 9083  ....... ........
	defb 01fh,008h,008h,07ch,010h,010h,0f8h,020h,020h,0f8h,040h,040h,0f0h,040h,0c0h,0c0h	; 9093  ...|...  .@@.@..
	defb 003h,0e0h,003h,0f0h,006h,0f8h,002h,0fch,010h,000h,082h,0ffh,03fh,003h,01fh,003h	; 90a3  ............?...
	defb 00fh,006h,007h,002h,003h,002h,0f0h,002h,0f8h,003h,0fch,003h,0feh,006h,0ffh,007h	; 90b3  ................
	defb 07fh,003h,03fh,003h,01fh,002h,00fh,081h,007h,010h,0ffh,020h,000h,020h,0ffh,095h	; 90c3  ..?........ . ..
	defb 002h,00fh,002h,002h,00fh,002h,002h,01fh,004h,004h,01fh,004h,008h,03eh,008h,010h	; 90d3  .............>..
	defb 000h,080h,000h,000h,080h,00bh,000h,020h,0ffh,085h,000h,001h,000h,000h,001h,00bh	; 90e3  ....... ........
	defb 000h,090h,040h,0f0h,040h,040h,0f0h,040h,040h,0f8h,020h,020h,0f8h,020h,010h,07ch	; 90f3  ..@.@@.@@.  . .|
	defb 010h,008h,008h,0fch,004h,0f8h,003h,0f0h,081h,0e0h,010h,000h,008h,003h,004h,007h	; 9103  ................
	defb 003h,00fh,081h,01fh,008h,0ffh,003h,0feh,003h,0fch,002h,0f8h,084h,007h,003h,003h	; 9113  ................
	defb 001h,00ch,000h,005h,0ffh,085h,07fh,03fh,01fh,007h,003h,019h,000h,089h,001h,000h	; 9123  .......?........
	defb 00dh,007h,018h,00eh,004h,003h,001h,004h,000h,00bh,0ffh,082h,01fh,001h,003h,000h	; 9133  ................
	defb 00dh,0ffh,003h,000h,087h,07ch,020h,020h,0f0h,080h,080h,0c0h,004h,000h,084h,0e0h	; 9143  .....|  ........
	defb 07eh,01fh,003h,00eh,000h,002h,0ffh,081h,07fh,00bh,0ffh,081h,0f8h,004h,000h,007h	; 9153  ~...............
	defb 0ffh,083h,0f8h,0f0h,0c0h,011h,000h,081h,007h,003h,0ffh,09ah,0feh,03eh,004h,004h	; 9163  .............>..
	defb 00fh,001h,001h,003h,007h,00fh,03fh,0ffh,0ffh,0feh,0f8h,0e0h,000h,0e0h,0c0h,0c0h	; 9173  ......?.........
	defb 080h,000h,0b0h,0e0h,018h,060h,017h,000h,083h,01fh,03fh,03fh,004h,0ffh,085h,0feh	; 9183  .....`....??....
	defb 0f8h,0f0h,0e0h,080h,004h,000h,002h,0f0h,084h,0e0h,0c0h,080h,080h,017h,000h,083h	; 9193  ................
	defb 001h,003h,007h,007h,000h,084h,001h,007h,00fh,03fh,005h,0ffh,00dh,000h,002h,001h	; 91a3  .........?......
	defb 007h,000h,08ah,001h,006h,008h,010h,000h,080h,0a0h,060h,040h,068h,005h,000h,082h	; 91b3  ..........`@h...
	defb 003h,03fh,009h,0ffh,005h,000h,00bh,0ffh,002h,000h,085h,003h,00fh,03fh,0fch,0c0h	; 91c3  .?...........?..
	defb 00ah,000h,081h,03fh,003h,0ffh,011h,000h,082h,0f0h,0feh,008h,0ffh,008h,000h,085h	; 91d3  ...?............
	defb 080h,0e0h,0f8h,0fch,0feh,003h,0ffh,081h,000h,005h,0ffh,082h,00fh,001h,00ah,000h	; 91e3  ................
	defb 082h,0e0h,0fch,004h,0ffh,088h,07fh,01fh,007h,003h,001h,000h,001h,001h,009h,000h	; 91f3  ................
	defb 087h,028h,018h,018h,054h,060h,0a0h,0e0h,015h,000h,086h,0c0h,0e0h,0f0h,0f8h,0fch	; 9203  .(..T`..........
	defb 0feh,003h,0ffh,002h,07fh,00ch,000h,087h,080h,0c0h,0e0h,0e0h,007h,00fh,00fh,003h	; 9213  ................
	defb 01fh,003h,03fh,007h,07fh,010h,0ffh,010h,000h,086h,078h,049h,00fh,009h,001h,001h	; 9223  ..?.......xI....
	defb 00ah,000h,020h,0ffh,002h,000h,086h,020h,0a4h,074h,02fh,024h,004h,00bh,000h,086h	; 9233  .. .... .t/$....
	defb 080h,092h,092h,0ffh,092h,012h,007h,000h,020h,0ffh,003h,000h,086h,009h,049h,04fh	; 9243  ........ .....IO
	defb 0f9h,049h,040h,007h,000h,087h,004h,005h,026h,03ch,0e4h,020h,020h,009h,000h,002h	; 9253  .I@.....&<.  ...
	defb 0d0h,003h,0e0h,003h,0f0h,006h,0f8h,002h,0fch,010h,000h,002h,0bfh,083h,09fh,01fh	; 9263  ................
	defb 01fh,003h,00fh,006h,007h,002h,003h,002h,0f0h,002h,0f8h,003h,0fch,003h,0feh,006h	; 9273  ................
	defb 0ffh,007h,07fh,003h,03fh,003h,01fh,002h,00fh,081h,007h,010h,0ffh,01ah,000h,002h	; 9283  ....?...........
	defb 001h,084h,009h,00fh,049h,078h,020h,0ffh,008h,000h,086h,004h,024h,02fh,074h,0a4h	; 9293  ....Ix .....$/t.
	defb 020h,009h,000h,086h,012h,092h,0ffh,092h,092h,080h,003h,000h,020h,0ffh,007h,000h	; 92a3   ........... ...
	defb 086h,040h,049h,0f9h,04fh,049h,009h,00ch,000h,002h,020h,085h,0e4h,03ch,026h,005h	; 92b3  .@I.OI.... ..<&.
	defb 004h,008h,0fch,004h,0f8h,004h,0f0h,010h,000h,008h,003h,004h,007h,084h,00fh,08fh	; 92c3  ................
	defb 09fh,09fh,008h,0ffh,003h,0feh,003h,0fch,002h,0f8h,084h,007h,003h,003h,001h,00ch	; 92d3  ................
	defb 000h,005h,0ffh,085h,07fh,03fh,01fh,007h,003h,007h,000h,002h,001h,00dh,000h,085h	; 92e3  .....?..........
	defb 068h,040h,060h,0a0h,080h,003h,000h,084h,008h,004h,003h,001h,004h,000h,00bh,0ffh	; 92f3  h@`.............
	defb 082h,01fh,001h,003h,000h,00dh,0ffh,00eh,000h,084h,0e0h,07eh,01fh,003h,00eh,000h	; 9303  ...........~....
	defb 002h,0ffh,081h,07fh,00bh,0ffh,081h,0f8h,004h,000h,005h,0ffh,085h,0feh,0fch,0f8h	; 9313  ................
	defb 0f0h,0c0h,011h,000h,081h,007h,003h,0ffh,083h,0feh,001h,001h,003h,000h,08bh,001h	; 9323  ................
	defb 003h,007h,00fh,03fh,0ffh,0ffh,0feh,0f8h,0e0h,000h,003h,0e0h,084h,0d4h,018h,018h	; 9333  ...?............
	defb 028h,019h,000h,084h,07fh,03fh,07fh,07fh,003h,0ffh,085h,0feh,0f8h,0f0h,0e0h,080h	; 9343  (....?..........
	defb 004h,000h,002h,0f0h,084h,0e0h,0c0h,080h,080h,00ah,000h,003h,0e0h,084h,0d4h,018h	; 9353  ................
	defb 018h,028h,019h,000h,084h,07fh,03fh,07fh,07fh,003h,0ffh,085h,0feh,0f8h,0f0h,0e0h	; 9363  .(....?.........
	defb 080h,004h,000h,002h,0f0h,084h,0e0h,0c0h,080h,080h,00ah,000h,000h	; 9373  .............

; ----------------------------------------------------------------------
; DATOS rachas_9380: rachas a la VRAM (p00:4B62 -> p00:4B35); lo leen p00:53C1
;   (116 bytes)
;   0x9380..0x93f4  (116 bytes)
DATA_rachas_9380:
	defb 00bh,000h,085h,001h,006h,018h,07eh,0ffh,007h,000h,085h,001h,006h,018h,060h,080h	; 9380  ......~.......`.
	defb 007h,000h,085h,001h,007h,01fh,067h,081h,007h,000h,081h,007h,003h,000h,085h,080h	; 9390  ......g.........
	defb 0e0h,0f8h,0e6h,081h,007h,000h,081h,0e0h,007h,000h,085h,080h,060h,018h,006h,001h	; 93a0  ............`...
	defb 00fh,000h,089h,080h,060h,018h,07eh,0ffh,07eh,018h,006h,001h,00fh,000h,085h,080h	; 93b0  ....`.~.~.......
	defb 060h,018h,006h,001h,00fh,000h,085h,08fh,06fh,01fh,007h,001h,00bh,000h,085h,0f1h	; 93c0  `.......o.......
	defb 0f6h,0f8h,0e0h,080h,007h,000h,085h,001h,006h,018h,060h,080h,008h,000h,084h,07eh	; 93d0  ..........`....~
	defb 018h,060h,080h,012h,000h,084h,001h,003h,003h,001h,00ch,000h,084h,080h,0c0h,0c0h	; 93e0  .`..............
	defb 080h,006h,000h,000h	; 93f0

; ----------------------------------------------------------------------
; DATOS lista_93F4: 2 fichas de dibujo de 6 bytes [paleta-tipo][VRAM lo
;   hi][caracteres][puntero] detras del numero (p00:4FA3, paletas en 0x51B2);
;   lo leen p00:51AD (13 bytes)
;   0x93f4..0x9401  (13 bytes)
DATA_lista_93F4:
	defb 002h,012h,02eh,042h,005h,00eh	; 93f4
	defb 094h,012h,02eh,046h,005h,05eh	; 93fa
	defb 094h	; 9400

; ----------------------------------------------------------------------
; DATOS lista_9401: 2 fichas de dibujo de 6 bytes [paleta-tipo][VRAM lo
;   hi][caracteres][puntero] detras del numero (p00:4FA3, paletas en 0x51B2);
;   lo leen p00:51AD (13 bytes)
;   0x9401..0x940e  (13 bytes)
DATA_lista_9401:
	defb 002h,012h,03eh,042h,005h,00eh	; 9401
	defb 094h,012h,03eh,046h,005h,05eh	; 9407
	defb 094h	; 940d

; ----------------------------------------------------------------------
; DATOS dibujo_940E: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0x9401 (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:51AD (80 bytes)
;   0x940e..0x945e  (80 bytes)
DATA_dibujo_940E:
	defb 0ffh,000h,0ffh,000h,0c0h,03fh,09fh,07fh,00ch,0ffh,00ch,0ffh,00fh,0ffh,00ch,0ffh	; 940e  .....?..........
	defb 0ffh,000h,0e0h,01fh,000h,0ffh,087h,0ffh,0c9h,0ffh,0c9h,0ffh,089h,0ffh,0cfh,0ffh	; 941e  ................
	defb 0ffh,000h,000h,0ffh,000h,0ffh,01eh,0ffh,08ch,0ffh,08ch,0ffh,08ch,0ffh,08ch,0ffh	; 942e  ................
	defb 0ffh,000h,003h,0fch,000h,0ffh,03ch,0ffh,018h,0ffh,018h,0ffh,018h,0ffh,099h,0ffh	; 943e  ......<.........
	defb 0ffh,000h,0ffh,000h,001h,0feh,03ch,0ffh,03ch,0ffh,038h,0ffh,038h,0ffh,000h,0ffh	; 944e  ......<.<.8.8...

; ----------------------------------------------------------------------
; DATOS dibujo_945E: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x9401 (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:51AD (80 bytes)
;   0x945e..0x94ae  (80 bytes)
DATA_dibujo_945E:
	defb 00ch,0ffh,01fh,0ffh,080h,07fh,0e0h,01fh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 945e  ................
	defb 0c9h,0ffh,099h,0ffh,000h,0ffh,000h,0ffh,0fch,003h,0ffh,000h,0ffh,000h,0ffh,000h	; 946e  ................
	defb 08ch,0ffh,0dfh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h	; 947e  ................
	defb 099h,0ffh,0bfh,0ffh,000h,0ffh,000h,0ffh,03fh,0c0h,0ffh,000h,0ffh,000h,0ffh,000h	; 948e  ........?.......
	defb 070h,0ffh,070h,0ffh,001h,0feh,007h,0f8h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 949e  p.p.............

; ----------------------------------------------------------------------
; DATOS lista_94AE: 2 fichas de dibujo de 6 bytes [paleta-tipo][VRAM lo
;   hi][caracteres][puntero] detras del numero (p00:4FA3, paletas en 0x51B2);
;   lo leen p00:51AD (13 bytes)
;   0x94ae..0x94bb  (13 bytes)
DATA_lista_94AE:
	defb 002h,002h,02ah,042h,007h,0c8h	; 94ae
	defb 094h,002h,02ah,046h,007h,038h	; 94b4
	defb 095h	; 94ba

; ----------------------------------------------------------------------
; DATOS lista_94BB: 2 fichas de dibujo de 6 bytes [paleta-tipo][VRAM lo
;   hi][caracteres][puntero] detras del numero (p00:4FA3, paletas en 0x51B2);
;   lo leen p00:51AD (13 bytes)
;   0x94bb..0x94c8  (13 bytes)
DATA_lista_94BB:
	defb 002h,002h,03ah,042h,007h,0c8h	; 94bb
	defb 094h,002h,03ah,046h,007h,038h	; 94c1
	defb 095h	; 94c7

; ----------------------------------------------------------------------
; DATOS dibujo_94C8: 7 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0x94BB (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:51AD (112 bytes)
;   0x94c8..0x9538  (112 bytes)
DATA_dibujo_94C8:
	defb 0ffh,000h,0ffh,000h,0c0h,03fh,08fh,07fh,099h,07fh,098h,07fh,08eh,07fh,083h,07fh	; 94c8  .....?..........
	defb 0ffh,000h,0e0h,01fh,000h,0ffh,07eh,0ffh,05ah,0ffh,018h,0ffh,018h,0ffh,018h,0ffh	; 94d8  ......~.Z.......
	defb 0ffh,000h,000h,0ffh,000h,0ffh,0f8h,0ffh,06ch,0ffh,06ch,0ffh,06ch,0ffh,078h,0ffh	; 94e8  ........l.l.l.x.
	defb 0ffh,000h,000h,0ffh,000h,0ffh,0f7h,0ffh,063h,0ffh,063h,0ffh,063h,0ffh,063h,0ffh	; 94f8  ........c.c.c.c.
	defb 0ffh,000h,001h,0feh,000h,0ffh,0bbh,0ffh,031h,0ffh,061h,0ffh,0c1h,0ffh,0e1h,0ffh	; 9508  ........1.a.....
	defb 0ffh,000h,0ffh,000h,000h,0ffh,0f0h,0ffh,090h,0ffh,080h,0ffh,0e0h,0ffh,080h,0ffh	; 9518  ................
	defb 0ffh,000h,0ffh,000h,007h,0f8h,0f3h,0fch,0f3h,0fch,0e3h,0fch,0e3h,0fch,003h,0fch	; 9528  ................

; ----------------------------------------------------------------------
; DATOS dibujo_9538: 7 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x94BB (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:51AD (112 bytes)
;   0x9538..0x95a8  (112 bytes)
DATA_dibujo_9538:
	defb 093h,07fh,09eh,07fh,080h,07fh,0c0h,03fh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 9538  .......?........
	defb 018h,0ffh,03ch,0ffh,000h,0ffh,000h,0ffh,0fch,003h,0ffh,000h,0ffh,000h,0ffh,000h	; 9548  ..<.............
	defb 06ch,0ffh,0eeh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h	; 9558  l...............
	defb 063h,0ffh,0f7h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h	; 9568  c...............
	defb 071h,0ffh,0bbh,0ffh,000h,0ffh,000h,0ffh,00fh,0f0h,0ffh,000h,0ffh,000h,0ffh,000h	; 9578  q...............
	defb 093h,0ffh,0f3h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 9588  ................
	defb 0c3h,0fch,0c3h,0fch,003h,0fch,007h,0f8h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 9598  ................

; ----------------------------------------------------------------------
; DATOS lista_95A8: 3 fichas de dibujo de 6 bytes [paleta-tipo][VRAM lo
;   hi][caracteres][puntero] detras del numero (p00:4FA3, paletas en 0x51B2);
;   lo leen p00:51AD (19 bytes)
;   0x95a8..0x95bb  (19 bytes)
DATA_lista_95A8:
	defb 003h,012h,03ch,040h,006h,0ceh	; 95a8
	defb 095h,012h,03ch,044h,006h,02eh	; 95ae
	defb 096h,012h,03ch,048h,006h,08eh	; 95b4
	defb 096h	; 95ba

; ----------------------------------------------------------------------
; DATOS lista_95BB: 3 fichas de dibujo de 6 bytes [paleta-tipo][VRAM lo
;   hi][caracteres][puntero] detras del numero (p00:4FA3, paletas en 0x51B2);
;   lo leen p00:51AD (19 bytes)
;   0x95bb..0x95ce  (19 bytes)
DATA_lista_95BB:
	defb 003h,012h,02ch,040h,006h,0ceh	; 95bb
	defb 095h,012h,02ch,044h,006h,02eh	; 95c1
	defb 096h,012h,02ch,048h,006h,08eh	; 95c7
	defb 096h	; 95cd

; ----------------------------------------------------------------------
; DATOS dibujo_95CE: 6 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0x95A8 (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:51AD (96 bytes)
;   0x95ce..0x962e  (96 bytes)
DATA_dibujo_95CE:
	defb 0cfh,030h,0e3h,01ch,0f0h,00fh,0f8h,007h,0f8h,007h,0fch,003h,0f0h,00fh,0c0h,03fh	; 95ce  .0.............?
	defb 0efh,010h,0c7h,038h,083h,07ch,000h,0ffh,000h,0ffh,00fh,0ffh,019h,0ffh,019h,0ffh	; 95de  ...8.|..........
	defb 0f9h,006h,0f0h,00fh,0e0h,01fh,0c0h,03fh,000h,0ffh,033h,0ffh,0b3h,0ffh,0b3h,0ffh	; 95ee  .......?..3.....
	defb 0ffh,000h,0feh,001h,07ch,083h,030h,0cfh,000h,0ffh,07eh,0ffh,05ah,0ffh,018h,0ffh	; 95fe  ....|.0...~.Z...
	defb 07fh,080h,03ch,0c3h,010h,0efh,001h,0feh,001h,0feh,07bh,0fch,078h,0ffh,070h,0ffh	; 960e  ..<.......{.x.p.
	defb 03fh,0c0h,07fh,080h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,03fh,0c0h	; 961e  ?.............?.

; ----------------------------------------------------------------------
; DATOS dibujo_962E: 6 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x95A8 (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:51AD (96 bytes)
;   0x962e..0x968e  (96 bytes)
DATA_dibujo_962E:
	defb 000h,0ffh,0c0h,03fh,0f0h,00fh,0fch,003h,0f8h,007h,0f8h,007h,0f0h,00fh,0e3h,01ch	; 962e  ...?............
	defb 019h,0ffh,019h,0ffh,019h,0ffh,00fh,0ffh,000h,0ffh,000h,0ffh,080h,07fh,0c3h,03ch	; 963e  ...............<
	defb 0b3h,0ffh,0b3h,0ffh,0b3h,0ffh,01eh,0ffh,000h,0ffh,000h,0ffh,0c0h,03fh,0e0h,01fh	; 964e  .............?..
	defb 018h,0ffh,018h,0ffh,018h,0ffh,03ch,0ffh,000h,0ffh,000h,0ffh,030h,0cfh,07ch,083h	; 965e  ......<.....0.|.
	defb 070h,0ffh,000h,0ffh,0e0h,0ffh,0e3h,0fch,001h,0feh,001h,0feh,010h,0efh,03ch,0c3h	; 966e  p.............<.
	defb 00fh,0f0h,03fh,0c0h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,07fh,080h	; 967e  ..?.............

; ----------------------------------------------------------------------
; DATOS dibujo_968E: 6 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0x95A8 (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:51AD (96 bytes)
;   0x968e..0x96ee  (96 bytes)
DATA_dibujo_968E:
	defb 0cfh,030h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 968e  .0..............
	defb 0c7h,038h,0efh,010h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 969e  .8..............
	defb 0f0h,00fh,0f9h,006h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 96ae  ................
	defb 0feh,001h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 96be  ................
	defb 03fh,0c0h,07fh,080h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 96ce  ?...............
	defb 03fh,0c0h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 96de  ?...............

; ----------------------------------------------------------------------
; DATOS lista_96EE: 3 fichas de dibujo de 6 bytes [paleta-tipo][VRAM lo
;   hi][caracteres][puntero] detras del numero (p00:4FA3, paletas en 0x51B2);
;   lo leen p00:51AD (19 bytes)
;   0x96ee..0x9701  (19 bytes)
DATA_lista_96EE:
	defb 003h,002h,02ah,03eh,00bh,001h	; 96ee
	defb 097h,002h,02ah,042h,00bh,0b1h	; 96f4
	defb 097h,002h,02ah,046h,00bh,061h	; 96fa
	defb 098h	; 9700

; ----------------------------------------------------------------------
; DATOS dibujo_9701: 11 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0x96EE (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:51AD (176 bytes)
;   0x9701..0x97b1  (176 bytes)
DATA_dibujo_9701:
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0fch,003h,0f0h,00fh,0f0h,00fh,0e0h,01fh,0e0h,01fh	; 9701  ................
	defb 0ffh,000h,0ffh,000h,080h,07fh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 9711  ................
	defb 0ffh,000h,0ffh,000h,000h,0ffh,000h,0ffh,0f0h,0ffh,060h,0ffh,060h,0ffh,060h,0ffh	; 9721  ..........`.`.`.
	defb 0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,0e7h,0ffh,066h,0ffh,066h,0ffh,066h,0ffh	; 9731  ..........f.f.f.
	defb 0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,01eh,0ffh,033h,0ffh,033h,0ffh,030h,0ffh	; 9741  ..........3.3.0.
	defb 0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,03dh,0ffh,019h,0ffh,01bh,0ffh,01ah,0ffh	; 9751  ........=.......
	defb 0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,09ch,0ffh,008h,0ffh,00ch,0ffh,004h,0ffh	; 9761  ................
	defb 0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,0e0h,0ffh,040h,0ffh,0c0h,0ffh,080h,0ffh	; 9771  ..........@.....
	defb 0ffh,000h,0ffh,000h,000h,0ffh,000h,0ffh,0feh,0ffh,0feh,0ffh,08ch,0ffh,00ch,0ffh	; 9781  ................
	defb 0ffh,000h,0ffh,000h,001h,0feh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 9791  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,03fh,0c0h,00fh,0f0h,00fh,0f0h,007h,0f8h,007h,0f8h	; 97a1  ......?.........

; ----------------------------------------------------------------------
; DATOS dibujo_97B1: 11 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x96EE (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:51AD (176 bytes)
;   0x97b1..0x9861  (176 bytes)
DATA_dibujo_97B1:
	defb 0e0h,01fh,0e0h,01fh,0e0h,01fh,0f0h,00fh,0f0h,00fh,0fch,003h,0ffh,000h,0ffh,000h	; 97b1  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,080h,07fh,0ffh,000h	; 97c1  ................
	defb 060h,0ffh,060h,0ffh,064h,0ffh,064h,0ffh,0fch,0ffh,000h,0ffh,000h,0ffh,0ffh,000h	; 97d1  `.`.d.d.........
	defb 066h,0ffh,066h,0ffh,066h,0ffh,066h,0ffh,03ch,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 97e1  f.f.f.f.<.......
	defb 030h,0ffh,030h,0ffh,033h,0ffh,033h,0ffh,01eh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 97f1  0.0.3.3.........
	defb 01eh,0ffh,01eh,0ffh,01bh,0ffh,019h,0ffh,03dh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 9801  ........=.......
	defb 007h,0ffh,003h,0ffh,003h,0ffh,003h,0ffh,087h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 9811  ................
	defb 080h,0ffh,000h,0ffh,000h,0ffh,080h,0ffh,080h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 9821  ................
	defb 018h,0ffh,018h,0ffh,038h,0ffh,038h,0ffh,038h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h	; 9831  ....8.8.8.......
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,001h,0feh,0ffh,000h	; 9841  ................
	defb 007h,0f8h,007h,0f8h,007h,0f8h,00fh,0f0h,00fh,0f0h,03fh,0c0h,0ffh,000h,0ffh,000h	; 9851  ..........?.....

; ----------------------------------------------------------------------
; DATOS dibujo_9861: 11 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0x96EE (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:51AD (176 bytes)
;   0x9861..0x9911  (176 bytes)
DATA_dibujo_9861:
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 9861  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 9871  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 9881  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 9891  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 98a1  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 98b1  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 98c1  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 98d1  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 98e1  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 98f1  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 9901  ................

; ----------------------------------------------------------------------
; DATOS formaciones_9911: 7 punteros (uno por 0xE1F6, p00:5889) a listas de
;   fichas de sprite, sin 0xE1FE (p00:587A / p00:5883); lo leen p00:5889 (14
;   bytes)
;   0x9911..0x991f  (14 bytes)
DATA_formaciones_9911:
	defw 099bfh,09976h,09a51h,09a08h,0992dh,09aa2h,09af3h	; 9911

; ----------------------------------------------------------------------
; DATOS formaciones_991F: 7 punteros (uno por 0xE1F6, p00:5889) a listas de
;   fichas de sprite, con 0xE1FE (p00:587A / p00:5883); lo leen p00:5889 (14
;   bytes)
;   0x991f..0x992d  (14 bytes)
DATA_formaciones_991F:
	defw 09b8dh,09b44h,09c1fh,09bd6h,0992dh,09c70h,09cc1h	; 991f

; ----------------------------------------------------------------------
; DATOS formacion_992D: [n] y n fichas de sprite de 4 bytes
;   [y][x][dibujo][color] que p00:5891 copia a 0xE100 (la y y la x se suman a
;   0xE1F9 y 0xE1F5); lo leen p00:5891 (73 bytes)
;   0x992d..0x9976  (73 bytes)
DATA_formacion_992D:
	defb 012h,000h,000h,000h	; 992d
	defb 007h,000h,000h,004h	; 9931
	defb 018h,000h,010h,008h	; 9935
	defb 007h,000h,010h,00ch	; 9939
	defb 018h,010h,000h,010h	; 993d
	defb 007h,010h,000h,014h	; 9941
	defb 018h,010h,010h,018h	; 9945
	defb 007h,010h,010h,01ch	; 9949
	defb 018h,020h,000h,020h	; 994d
	defb 007h,020h,000h,024h	; 9951
	defb 018h,020h,010h,028h	; 9955
	defb 007h,020h,010h,02ch	; 9959
	defb 018h,030h,000h,030h	; 995d
	defb 007h,030h,000h,034h	; 9961
	defb 018h,030h,010h,038h	; 9965
	defb 007h,030h,010h,03ch	; 9969
	defb 018h,0f0h,008h,040h	; 996d
	defb 007h,0f0h,008h,044h	; 9971
	defb 018h	; 9975

; ----------------------------------------------------------------------
; DATOS formacion_9976: [n] y n fichas de sprite de 4 bytes
;   [y][x][dibujo][color] que p00:5891 copia a 0xE100 (la y y la x se suman a
;   0xE1F9 y 0xE1F5); lo leen p00:5891 (73 bytes)
;   0x9976..0x99bf  (73 bytes)
DATA_formacion_9976:
	defb 012h,000h,008h,050h	; 9976
	defb 007h,000h,008h,054h	; 997a
	defb 018h,000h,018h,058h	; 997e
	defb 007h,000h,018h,05ch	; 9982
	defb 018h,010h,008h,060h	; 9986
	defb 007h,010h,008h,064h	; 998a
	defb 018h,010h,018h,068h	; 998e
	defb 007h,010h,018h,06ch	; 9992
	defb 018h,020h,008h,070h	; 9996
	defb 007h,020h,008h,074h	; 999a
	defb 018h,020h,018h,078h	; 999e
	defb 007h,020h,018h,07ch	; 99a2
	defb 018h,030h,008h,080h	; 99a6
	defb 007h,030h,008h,084h	; 99aa
	defb 018h,030h,018h,088h	; 99ae
	defb 007h,030h,018h,08ch	; 99b2
	defb 018h,010h,028h,090h	; 99b6
	defb 007h,010h,028h,094h	; 99ba
	defb 018h	; 99be

; ----------------------------------------------------------------------
; DATOS formacion_99BF: [n] y n fichas de sprite de 4 bytes
;   [y][x][dibujo][color] que p00:5891 copia a 0xE100 (la y y la x se suman a
;   0xE1F9 y 0xE1F5); lo leen p00:5891 (73 bytes)
;   0x99bf..0x9a08  (73 bytes)
DATA_formacion_99BF:
	defb 012h,000h,000h,000h	; 99bf
	defb 007h,000h,000h,004h	; 99c3
	defb 018h,000h,010h,008h	; 99c7
	defb 007h,000h,010h,00ch	; 99cb
	defb 018h,010h,000h,010h	; 99cf
	defb 007h,010h,000h,014h	; 99d3
	defb 018h,010h,010h,018h	; 99d7
	defb 007h,010h,010h,01ch	; 99db
	defb 018h,020h,000h,020h	; 99df
	defb 007h,020h,000h,024h	; 99e3
	defb 018h,020h,010h,028h	; 99e7
	defb 007h,020h,010h,02ch	; 99eb
	defb 018h,030h,000h,030h	; 99ef
	defb 007h,030h,000h,034h	; 99f3
	defb 018h,030h,010h,038h	; 99f7
	defb 007h,030h,010h,03ch	; 99fb
	defb 018h,008h,0f0h,040h	; 99ff
	defb 007h,008h,0f0h,044h	; 9a03
	defb 018h	; 9a07

; ----------------------------------------------------------------------
; DATOS formacion_9A08: [n] y n fichas de sprite de 4 bytes
;   [y][x][dibujo][color] que p00:5891 copia a 0xE100 (la y y la x se suman a
;   0xE1F9 y 0xE1F5); lo leen p00:5891 (73 bytes)
;   0x9a08..0x9a51  (73 bytes)
DATA_formacion_9A08:
	defb 012h,000h,008h,050h	; 9a08
	defb 007h,000h,008h,054h	; 9a0c
	defb 018h,000h,018h,058h	; 9a10
	defb 007h,000h,018h,05ch	; 9a14
	defb 018h,010h,008h,060h	; 9a18
	defb 007h,010h,008h,064h	; 9a1c
	defb 018h,010h,018h,068h	; 9a20
	defb 007h,010h,018h,06ch	; 9a24
	defb 018h,020h,008h,070h	; 9a28
	defb 007h,020h,008h,074h	; 9a2c
	defb 018h,020h,018h,078h	; 9a30
	defb 007h,020h,018h,07ch	; 9a34
	defb 018h,030h,008h,080h	; 9a38
	defb 007h,030h,008h,084h	; 9a3c
	defb 018h,030h,018h,088h	; 9a40
	defb 007h,030h,018h,08ch	; 9a44
	defb 018h,020h,028h,090h	; 9a48
	defb 007h,020h,028h,094h	; 9a4c
	defb 018h	; 9a50

; ----------------------------------------------------------------------
; DATOS formacion_9A51: [n] y n fichas de sprite de 4 bytes
;   [y][x][dibujo][color] que p00:5891 copia a 0xE100 (la y y la x se suman a
;   0xE1F9 y 0xE1F5); lo leen p00:5891 (81 bytes)
;   0x9a51..0x9aa2  (81 bytes)
DATA_formacion_9A51:
	defb 014h,000h,008h,000h	; 9a51
	defb 007h,000h,008h,004h	; 9a55
	defb 018h,000h,018h,008h	; 9a59
	defb 007h,000h,018h,00ch	; 9a5d
	defb 018h,010h,008h,010h	; 9a61
	defb 007h,010h,008h,014h	; 9a65
	defb 018h,010h,018h,018h	; 9a69
	defb 007h,010h,018h,01ch	; 9a6d
	defb 018h,020h,008h,020h	; 9a71
	defb 007h,020h,008h,024h	; 9a75
	defb 018h,020h,018h,028h	; 9a79
	defb 007h,020h,018h,02ch	; 9a7d
	defb 018h,030h,008h,030h	; 9a81
	defb 007h,030h,008h,034h	; 9a85
	defb 018h,030h,018h,038h	; 9a89
	defb 007h,030h,018h,03ch	; 9a8d
	defb 018h,01eh,028h,040h	; 9a91
	defb 007h,01eh,028h,044h	; 9a95
	defb 018h,01eh,038h,048h	; 9a99
	defb 007h,01eh,038h,04ch	; 9a9d
	defb 018h	; 9aa1

; ----------------------------------------------------------------------
; DATOS formacion_9AA2: [n] y n fichas de sprite de 4 bytes
;   [y][x][dibujo][color] que p00:5891 copia a 0xE100 (la y y la x se suman a
;   0xE1F9 y 0xE1F5); lo leen p00:5891 (81 bytes)
;   0x9aa2..0x9af3  (81 bytes)
DATA_formacion_9AA2:
	defb 014h,000h,008h,000h	; 9aa2
	defb 007h,000h,008h,004h	; 9aa6
	defb 018h,000h,018h,008h	; 9aaa
	defb 007h,000h,018h,00ch	; 9aae
	defb 018h,010h,008h,010h	; 9ab2
	defb 007h,010h,008h,014h	; 9ab6
	defb 018h,010h,018h,018h	; 9aba
	defb 007h,010h,018h,01ch	; 9abe
	defb 018h,020h,008h,020h	; 9ac2
	defb 007h,020h,008h,024h	; 9ac6
	defb 018h,020h,018h,028h	; 9aca
	defb 007h,020h,018h,02ch	; 9ace
	defb 018h,030h,008h,030h	; 9ad2
	defb 007h,030h,008h,034h	; 9ad6
	defb 018h,030h,018h,038h	; 9ada
	defb 007h,030h,018h,03ch	; 9ade
	defb 018h,018h,028h,040h	; 9ae2
	defb 007h,018h,028h,044h	; 9ae6
	defb 018h,016h,038h,048h	; 9aea
	defb 007h,016h,038h,04ch	; 9aee
	defb 018h	; 9af2

; ----------------------------------------------------------------------
; DATOS formacion_9AF3: [n] y n fichas de sprite de 4 bytes
;   [y][x][dibujo][color] que p00:5891 copia a 0xE100 (la y y la x se suman a
;   0xE1F9 y 0xE1F5); lo leen p00:5891 (81 bytes)
;   0x9af3..0x9b44  (81 bytes)
DATA_formacion_9AF3:
	defb 014h,000h,008h,000h	; 9af3
	defb 007h,000h,008h,004h	; 9af7
	defb 018h,000h,018h,008h	; 9afb
	defb 007h,000h,018h,00ch	; 9aff
	defb 018h,010h,008h,010h	; 9b03
	defb 007h,010h,008h,014h	; 9b07
	defb 018h,010h,018h,018h	; 9b0b
	defb 007h,010h,018h,01ch	; 9b0f
	defb 018h,020h,008h,020h	; 9b13
	defb 007h,020h,008h,024h	; 9b17
	defb 018h,020h,018h,028h	; 9b1b
	defb 007h,020h,018h,02ch	; 9b1f
	defb 018h,030h,008h,030h	; 9b23
	defb 007h,030h,008h,034h	; 9b27
	defb 018h,030h,018h,038h	; 9b2b
	defb 007h,030h,018h,03ch	; 9b2f
	defb 018h,01eh,028h,040h	; 9b33
	defb 007h,01eh,028h,044h	; 9b37
	defb 018h,022h,038h,048h	; 9b3b
	defb 007h,022h,038h,04ch	; 9b3f
	defb 018h	; 9b43

; ----------------------------------------------------------------------
; DATOS formacion_9B44: [n] y n fichas de sprite de 4 bytes
;   [y][x][dibujo][color] que p00:5891 copia a 0xE100 (la y y la x se suman a
;   0xE1F9 y 0xE1F5); lo leen p00:5891 (73 bytes)
;   0x9b44..0x9b8d  (73 bytes)
DATA_formacion_9B44:
	defb 012h,000h,0f8h,050h	; 9b44
	defb 007h,000h,0f8h,054h	; 9b48
	defb 018h,000h,008h,058h	; 9b4c
	defb 007h,000h,008h,05ch	; 9b50
	defb 018h,010h,0f8h,060h	; 9b54
	defb 007h,010h,0f8h,064h	; 9b58
	defb 018h,010h,008h,068h	; 9b5c
	defb 007h,010h,008h,06ch	; 9b60
	defb 018h,020h,0f8h,070h	; 9b64
	defb 007h,020h,0f8h,074h	; 9b68
	defb 018h,020h,008h,078h	; 9b6c
	defb 007h,020h,008h,07ch	; 9b70
	defb 018h,030h,0f8h,080h	; 9b74
	defb 007h,030h,0f8h,084h	; 9b78
	defb 018h,030h,008h,088h	; 9b7c
	defb 007h,030h,008h,08ch	; 9b80
	defb 018h,010h,0e8h,090h	; 9b84
	defb 007h,010h,0e8h,094h	; 9b88
	defb 018h	; 9b8c

; ----------------------------------------------------------------------
; DATOS formacion_9B8D: [n] y n fichas de sprite de 4 bytes
;   [y][x][dibujo][color] que p00:5891 copia a 0xE100 (la y y la x se suman a
;   0xE1F9 y 0xE1F5); lo leen p00:5891 (73 bytes)
;   0x9b8d..0x9bd6  (73 bytes)
DATA_formacion_9B8D:
	defb 012h,000h,000h,000h	; 9b8d
	defb 007h,000h,000h,004h	; 9b91
	defb 018h,000h,010h,008h	; 9b95
	defb 007h,000h,010h,00ch	; 9b99
	defb 018h,010h,000h,010h	; 9b9d
	defb 007h,010h,000h,014h	; 9ba1
	defb 018h,010h,010h,018h	; 9ba5
	defb 007h,010h,010h,01ch	; 9ba9
	defb 018h,020h,000h,020h	; 9bad
	defb 007h,020h,000h,024h	; 9bb1
	defb 018h,020h,010h,028h	; 9bb5
	defb 007h,020h,010h,02ch	; 9bb9
	defb 018h,030h,000h,030h	; 9bbd
	defb 007h,030h,000h,034h	; 9bc1
	defb 018h,030h,010h,038h	; 9bc5
	defb 007h,030h,010h,03ch	; 9bc9
	defb 018h,008h,020h,040h	; 9bcd
	defb 007h,008h,020h,044h	; 9bd1
	defb 018h	; 9bd5

; ----------------------------------------------------------------------
; DATOS formacion_9BD6: [n] y n fichas de sprite de 4 bytes
;   [y][x][dibujo][color] que p00:5891 copia a 0xE100 (la y y la x se suman a
;   0xE1F9 y 0xE1F5); lo leen p00:5891 (73 bytes)
;   0x9bd6..0x9c1f  (73 bytes)
DATA_formacion_9BD6:
	defb 012h,000h,0f8h,050h	; 9bd6
	defb 007h,000h,0f8h,054h	; 9bda
	defb 018h,000h,008h,058h	; 9bde
	defb 007h,000h,008h,05ch	; 9be2
	defb 018h,010h,0f8h,060h	; 9be6
	defb 007h,010h,0f8h,064h	; 9bea
	defb 018h,010h,008h,068h	; 9bee
	defb 007h,010h,008h,06ch	; 9bf2
	defb 018h,020h,0f8h,070h	; 9bf6
	defb 007h,020h,0f8h,074h	; 9bfa
	defb 018h,020h,008h,078h	; 9bfe
	defb 007h,020h,008h,07ch	; 9c02
	defb 018h,030h,0f8h,080h	; 9c06
	defb 007h,030h,0f8h,084h	; 9c0a
	defb 018h,030h,008h,088h	; 9c0e
	defb 007h,030h,008h,08ch	; 9c12
	defb 018h,020h,0e8h,090h	; 9c16
	defb 007h,020h,0e8h,094h	; 9c1a
	defb 018h	; 9c1e

; ----------------------------------------------------------------------
; DATOS formacion_9C1F: [n] y n fichas de sprite de 4 bytes
;   [y][x][dibujo][color] que p00:5891 copia a 0xE100 (la y y la x se suman a
;   0xE1F9 y 0xE1F5); lo leen p00:5891 (81 bytes)
;   0x9c1f..0x9c70  (81 bytes)
DATA_formacion_9C1F:
	defb 014h,000h,0f8h,000h	; 9c1f
	defb 007h,000h,0f8h,004h	; 9c23
	defb 018h,000h,008h,008h	; 9c27
	defb 007h,000h,008h,00ch	; 9c2b
	defb 018h,010h,0f8h,010h	; 9c2f
	defb 007h,010h,0f8h,014h	; 9c33
	defb 018h,010h,008h,018h	; 9c37
	defb 007h,010h,008h,01ch	; 9c3b
	defb 018h,020h,0f8h,020h	; 9c3f
	defb 007h,020h,0f8h,024h	; 9c43
	defb 018h,020h,008h,028h	; 9c47
	defb 007h,020h,008h,02ch	; 9c4b
	defb 018h,030h,0f8h,030h	; 9c4f
	defb 007h,030h,0f8h,034h	; 9c53
	defb 018h,030h,008h,038h	; 9c57
	defb 007h,030h,008h,03ch	; 9c5b
	defb 018h,01eh,0e8h,040h	; 9c5f
	defb 007h,01eh,0e8h,044h	; 9c63
	defb 018h,01eh,0d8h,048h	; 9c67
	defb 007h,01eh,0d8h,04ch	; 9c6b
	defb 018h	; 9c6f

; ----------------------------------------------------------------------
; DATOS formacion_9C70: [n] y n fichas de sprite de 4 bytes
;   [y][x][dibujo][color] que p00:5891 copia a 0xE100 (la y y la x se suman a
;   0xE1F9 y 0xE1F5); lo leen p00:5891 (81 bytes)
;   0x9c70..0x9cc1  (81 bytes)
DATA_formacion_9C70:
	defb 014h,000h,0f8h,000h	; 9c70
	defb 007h,000h,0f8h,004h	; 9c74
	defb 018h,000h,008h,008h	; 9c78
	defb 007h,000h,008h,00ch	; 9c7c
	defb 018h,010h,0f8h,010h	; 9c80
	defb 007h,010h,0f8h,014h	; 9c84
	defb 018h,010h,008h,018h	; 9c88
	defb 007h,010h,008h,01ch	; 9c8c
	defb 018h,020h,0f8h,020h	; 9c90
	defb 007h,020h,0f8h,024h	; 9c94
	defb 018h,020h,008h,028h	; 9c98
	defb 007h,020h,008h,02ch	; 9c9c
	defb 018h,030h,0f8h,030h	; 9ca0
	defb 007h,030h,0f8h,034h	; 9ca4
	defb 018h,030h,008h,038h	; 9ca8
	defb 007h,030h,008h,03ch	; 9cac
	defb 018h,018h,0e8h,040h	; 9cb0
	defb 007h,018h,0e8h,044h	; 9cb4
	defb 018h,016h,0d8h,048h	; 9cb8
	defb 007h,016h,0d8h,04ch	; 9cbc
	defb 018h	; 9cc0

; ----------------------------------------------------------------------
; DATOS formacion_9CC1: [n] y n fichas de sprite de 4 bytes
;   [y][x][dibujo][color] que p00:5891 copia a 0xE100 (la y y la x se suman a
;   0xE1F9 y 0xE1F5); lo leen p00:5891 (81 bytes)
;   0x9cc1..0x9d12  (81 bytes)
DATA_formacion_9CC1:
	defb 014h,000h,0f8h,000h	; 9cc1
	defb 007h,000h,0f8h,004h	; 9cc5
	defb 018h,000h,008h,008h	; 9cc9
	defb 007h,000h,008h,00ch	; 9ccd
	defb 018h,010h,0f8h,010h	; 9cd1
	defb 007h,010h,0f8h,014h	; 9cd5
	defb 018h,010h,008h,018h	; 9cd9
	defb 007h,010h,008h,01ch	; 9cdd
	defb 018h,020h,0f8h,020h	; 9ce1
	defb 007h,020h,0f8h,024h	; 9ce5
	defb 018h,020h,008h,028h	; 9ce9
	defb 007h,020h,008h,02ch	; 9ced
	defb 018h,030h,0f8h,030h	; 9cf1
	defb 007h,030h,0f8h,034h	; 9cf5
	defb 018h,030h,008h,038h	; 9cf9
	defb 007h,030h,008h,03ch	; 9cfd
	defb 018h,01eh,0e8h,040h	; 9d01
	defb 007h,01eh,0e8h,044h	; 9d05
	defb 018h,022h,0d8h,048h	; 9d09
	defb 007h,022h,0d8h,04ch	; 9d0d
	defb 018h	; 9d11

; ----------------------------------------------------------------------
; DATOS fichas_9D12: 20 fichas de sprite de 4 bytes [y][x][dibujo][color]
;   (p00:5891, B = 20); lo leen p00:58CB (80 bytes)
;   0x9d12..0x9d62  (80 bytes)
DATA_fichas_9D12:
	defb 000h,0e8h,000h,007h	; 9d12
	defb 000h,0e8h,004h,018h	; 9d16
	defb 000h,0f8h,008h,007h	; 9d1a
	defb 000h,0f8h,00ch,018h	; 9d1e
	defb 000h,008h,010h,007h	; 9d22
	defb 000h,008h,014h,018h	; 9d26
	defb 010h,0e8h,018h,007h	; 9d2a
	defb 010h,0e8h,01ch,018h	; 9d2e
	defb 010h,0f8h,020h,007h	; 9d32
	defb 010h,0f8h,024h,018h	; 9d36
	defb 010h,008h,028h,007h	; 9d3a
	defb 010h,008h,02ch,018h	; 9d3e
	defb 020h,0f0h,030h,007h	; 9d42
	defb 020h,0f0h,034h,018h	; 9d46
	defb 020h,000h,038h,007h	; 9d4a
	defb 020h,000h,03ch,018h	; 9d4e
	defb 030h,0f8h,040h,007h	; 9d52
	defb 030h,0f8h,044h,018h	; 9d56
	defb 030h,008h,048h,007h	; 9d5a
	defb 030h,008h,04ch,018h	; 9d5e

; ----------------------------------------------------------------------
; DATOS fichas_9D62: 20 fichas de sprite de 4 bytes [y][x][dibujo][color]
;   (p00:5891, B = 20); lo leen p00:58D4 (80 bytes)
;   0x9d62..0x9db2  (80 bytes)
DATA_fichas_9D62:
	defb 000h,008h,000h,007h	; 9d62
	defb 000h,008h,004h,018h	; 9d66
	defb 000h,018h,008h,007h	; 9d6a
	defb 000h,018h,00ch,018h	; 9d6e
	defb 000h,028h,010h,007h	; 9d72
	defb 000h,028h,014h,018h	; 9d76
	defb 010h,008h,018h,007h	; 9d7a
	defb 010h,008h,01ch,018h	; 9d7e
	defb 010h,018h,020h,007h	; 9d82
	defb 010h,018h,024h,018h	; 9d86
	defb 010h,028h,028h,007h	; 9d8a
	defb 010h,028h,02ch,018h	; 9d8e
	defb 020h,010h,030h,007h	; 9d92
	defb 020h,010h,034h,018h	; 9d96
	defb 020h,020h,038h,007h	; 9d9a
	defb 020h,020h,03ch,018h	; 9d9e
	defb 030h,008h,040h,007h	; 9da2
	defb 030h,008h,044h,018h	; 9da6
	defb 030h,018h,048h,007h	; 9daa
	defb 030h,018h,04ch,018h	; 9dae

; ----------------------------------------------------------------------
; DATOS fichas_por_juego: 4 punteros (0xE1EB & 3, p00:5910) a 6 grupos de 4
;   fichas de sprite, uno por 0xE1D3; lo leen p00:5910 (8 bytes)
;   0x9db2..0x9dba  (8 bytes)
DATA_fichas_por_juego:
	defw 09dbah,09e1ah,09e7ah,09edah	; 9db2  -> DATA_fichas_9DBA DATA_fichas_9E1A DATA_fichas_9E7A DATA_fichas_9EDA

; ----------------------------------------------------------------------
; DATOS fichas_9DBA: 6 grupos (0xE1D3 x 16, p00:591E) de 4 fichas de sprite de
;   4 bytes [y][x][dibujo][color] que p00:5929 copia a 0xE158 (juego 0 de
;   0x9DB2); lo leen p00:5923 (96 bytes)
;   0x9dba..0x9e1a  (96 bytes)
DATA_fichas_9DBA:
	defb 003h,0feh,0b0h,007h	; 9dba
	defb 003h,0feh,0b4h,018h	; 9dbe
	defb 013h,0feh,0b8h,007h	; 9dc2
	defb 013h,0feh,0bch,018h	; 9dc6
	defb 008h,001h,0b0h,007h	; 9dca
	defb 008h,001h,0b4h,018h	; 9dce
	defb 013h,0ffh,0b8h,007h	; 9dd2
	defb 013h,0ffh,0bch,018h	; 9dd6
	defb 003h,0ffh,0b0h,007h	; 9dda
	defb 003h,0ffh,0b4h,018h	; 9dde
	defb 013h,000h,0b8h,007h	; 9de2
	defb 013h,000h,0bch,018h	; 9de6
	defb 004h,001h,0b0h,007h	; 9dea
	defb 004h,001h,0b4h,018h	; 9dee
	defb 013h,000h,0b8h,007h	; 9df2
	defb 013h,000h,0bch,018h	; 9df6
	defb 000h,000h,0b0h,007h	; 9dfa
	defb 000h,000h,0b4h,018h	; 9dfe
	defb 010h,000h,0b8h,007h	; 9e02
	defb 010h,000h,0bch,018h	; 9e06
	defb 000h,000h,0b0h,007h	; 9e0a
	defb 000h,000h,0b4h,018h	; 9e0e
	defb 010h,000h,0b8h,007h	; 9e12
	defb 010h,000h,0bch,018h	; 9e16

; ----------------------------------------------------------------------
; DATOS fichas_9E1A: 6 grupos (0xE1D3 x 16, p00:591E) de 4 fichas de sprite de
;   4 bytes [y][x][dibujo][color] que p00:5929 copia a 0xE158 (juego 1 de
;   0x9DB2); lo leen p00:5923 (96 bytes)
;   0x9e1a..0x9e7a  (96 bytes)
DATA_fichas_9E1A:
	defb 003h,0feh,0b0h,007h	; 9e1a
	defb 003h,0feh,0b4h,018h	; 9e1e
	defb 013h,0feh,0b8h,007h	; 9e22
	defb 013h,0feh,0bch,018h	; 9e26
	defb 008h,001h,0b0h,007h	; 9e2a
	defb 008h,001h,0b4h,018h	; 9e2e
	defb 013h,0ffh,0b8h,007h	; 9e32
	defb 013h,0ffh,0bch,018h	; 9e36
	defb 004h,0ffh,0b0h,007h	; 9e3a
	defb 004h,0ffh,0b4h,018h	; 9e3e
	defb 014h,000h,0b8h,007h	; 9e42
	defb 014h,000h,0bch,018h	; 9e46
	defb 001h,000h,0b0h,007h	; 9e4a
	defb 001h,000h,0b4h,018h	; 9e4e
	defb 010h,0ffh,0b8h,007h	; 9e52
	defb 010h,0ffh,0bch,018h	; 9e56
	defb 002h,003h,0b0h,007h	; 9e5a
	defb 002h,003h,0b4h,018h	; 9e5e
	defb 012h,003h,0b8h,007h	; 9e62
	defb 012h,003h,0bch,018h	; 9e66
	defb 000h,001h,0b0h,007h	; 9e6a
	defb 000h,001h,0b4h,018h	; 9e6e
	defb 010h,001h,0b8h,007h	; 9e72
	defb 010h,001h,0bch,018h	; 9e76

; ----------------------------------------------------------------------
; DATOS fichas_9E7A: 6 grupos (0xE1D3 x 16, p00:591E) de 4 fichas de sprite de
;   4 bytes [y][x][dibujo][color] que p00:5929 copia a 0xE158 (juego 2 de
;   0x9DB2); lo leen p00:5923 (96 bytes)
;   0x9e7a..0x9eda  (96 bytes)
DATA_fichas_9E7A:
	defb 004h,0fch,0b0h,007h	; 9e7a
	defb 004h,0fch,0b4h,018h	; 9e7e
	defb 014h,0fch,0b8h,007h	; 9e82
	defb 014h,0fch,0bch,018h	; 9e86
	defb 004h,000h,0b0h,007h	; 9e8a
	defb 004h,000h,0b4h,018h	; 9e8e
	defb 014h,000h,0b8h,007h	; 9e92
	defb 014h,000h,0bch,018h	; 9e96
	defb 004h,001h,0b0h,007h	; 9e9a
	defb 004h,001h,0b4h,018h	; 9e9e
	defb 014h,001h,0b8h,007h	; 9ea2
	defb 014h,001h,0bch,018h	; 9ea6
	defb 004h,000h,0b0h,007h	; 9eaa
	defb 004h,000h,0b4h,018h	; 9eae
	defb 014h,000h,0b8h,007h	; 9eb2
	defb 014h,000h,0bch,018h	; 9eb6
	defb 000h,000h,0b0h,007h	; 9eba
	defb 000h,000h,0b4h,018h	; 9ebe
	defb 010h,000h,0b8h,007h	; 9ec2
	defb 010h,000h,0bch,018h	; 9ec6
	defb 000h,000h,0b0h,007h	; 9eca
	defb 000h,000h,0b4h,018h	; 9ece
	defb 010h,000h,0b8h,007h	; 9ed2
	defb 010h,000h,0bch,018h	; 9ed6

; ----------------------------------------------------------------------
; DATOS fichas_9EDA: 6 grupos (0xE1D3 x 16, p00:591E) de 4 fichas de sprite de
;   4 bytes [y][x][dibujo][color] que p00:5929 copia a 0xE158 (juego 3 de
;   0x9DB2); lo leen p00:5923 (96 bytes)
;   0x9eda..0x9f3a  (96 bytes)
DATA_fichas_9EDA:
	defb 004h,0fah,0b0h,007h	; 9eda
	defb 004h,0fah,0b4h,018h	; 9ede
	defb 014h,0fah,0b8h,007h	; 9ee2
	defb 014h,0fah,0bch,018h	; 9ee6
	defb 004h,0fdh,0b0h,007h	; 9eea
	defb 004h,0fdh,0b4h,018h	; 9eee
	defb 014h,0fdh,0b8h,007h	; 9ef2
	defb 014h,0fdh,0bch,018h	; 9ef6
	defb 004h,0feh,0b0h,007h	; 9efa
	defb 004h,0feh,0b4h,018h	; 9efe
	defb 014h,0feh,0b8h,007h	; 9f02
	defb 014h,0feh,0bch,018h	; 9f06
	defb 000h,0feh,0b0h,007h	; 9f0a
	defb 000h,0feh,0b4h,018h	; 9f0e
	defb 010h,0feh,0b8h,007h	; 9f12
	defb 010h,0feh,0bch,018h	; 9f16
	defb 002h,003h,0b0h,007h	; 9f1a
	defb 002h,003h,0b4h,018h	; 9f1e
	defb 012h,003h,0b8h,007h	; 9f22
	defb 012h,003h,0bch,018h	; 9f26
	defb 000h,001h,0b0h,007h	; 9f2a
	defb 000h,001h,0b4h,018h	; 9f2e
	defb 010h,001h,0b8h,007h	; 9f32
	defb 010h,001h,0bch,018h	; 9f36

; ----------------------------------------------------------------------
; DATOS fichas_9F3A: 2 fichas de sprite de 4 bytes [y][x][dibujo][color]
;   (p00:5929, B = 2); lo leen p00:58F7 (8 bytes)
;   0x9f3a..0x9f42  (8 bytes)
DATA_fichas_9F3A:
	defb 010h,0f1h,098h,007h	; 9f3a
	defb 010h,0f1h,09ch,018h	; 9f3e

; ----------------------------------------------------------------------
; DATOS fichas_9F42: 2 fichas de sprite de 4 bytes [y][x][dibujo][color]
;   (p00:5929, B = 2); lo leen p00:58FD (8 bytes)
;   0x9f42..0x9f4a  (8 bytes)
DATA_fichas_9F42:
	defb 010h,0eeh,098h,007h	; 9f42
	defb 010h,0eeh,09ch,018h	; 9f46

; ----------------------------------------------------------------------
; DATOS resto_9F4A: lo apuntan con el banco puesto p00:5249 (0x9F4A); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p00:5249 (160 bytes)
;   0x9f4a..0x9fea  (160 bytes)
DATA_resto_9F4A:
	defb 073h,074h,058h,052h,052h,052h,052h,052h,052h,052h,052h,052h,052h,057h,075h,076h	; 9f4a  stXRRRRRRRRRRWuv
	defb 042h,041h,041h,041h,041h,041h,053h,054h,055h,056h,041h,041h,041h,041h,041h,043h	; 9f5a  BAAAAASTUVAAAAAC
	defb 078h,063h,063h,063h,063h,063h,063h,063h,063h,063h,063h,063h,063h,063h,063h,07ah	; 9f6a  xccccccccccccccz
	defb 07ch,06fh,070h,06fh,070h,06fh,070h,06fh,070h,06fh,070h,06fh,070h,06fh,070h,09dh	; 9f7a  |opopopopopopop.
	defb 07dh,07eh,07fh,080h,082h,083h,082h,083h,082h,083h,082h,083h,07fh,080h,08eh,08fh	; 9f8a  }~..............
	defb 084h,085h,086h,087h,093h,094h,081h,094h,081h,094h,081h,094h,086h,087h,099h,09ah	; 9f9a  ................
	defb 06bh,06ch,06dh,06ch,044h,044h,04ch,048h,048h,04eh,044h,044h,06dh,06ch,06dh,06eh	; 9faa  klmlDDLHHNDDmlmn
	defb 046h,044h,044h,049h,04ah,04bh,050h,077h,079h,051h,04dh,059h,05ah,044h,044h,047h	; 9fba  FDDIJKPwyQMYZDDG
	defb 046h,044h,044h,05bh,05ch,05dh,05eh,04fh,04fh,05fh,060h,061h,062h,044h,044h,047h	; 9fca  FDD[\]^OO_`abDDG
	defb 065h,045h,045h,045h,045h,066h,067h,064h,064h,06ah,069h,045h,045h,045h,045h,068h	; 9fda  eEEEEfgddjiEEEEh

; ----------------------------------------------------------------------
; DATOS fuente_9FEA: caracteres de la fuente (p00:4EFC): 0xFF acaba, 0xFE [dy]
;   baja de linea (sigue en el banco 12, en 0xA000); lo leen p00:5243 (22
;   bytes)
;   0x9fea..0xa000  (22 bytes)
DATA_fuente_9FEA:
	defb 03bh,031h,032h,031h,032h,031h,032h,031h,032h,031h,032h,031h,032h,031h,032h,050h	; 9fea  .12121212121212P
	defb 0feh,000h,04ch,04dh,04ah,04bh	; 9ffa
