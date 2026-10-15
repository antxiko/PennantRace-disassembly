; ==========================================================================
; THE PRO YAKYUU GEKITOTSU PENNANT RACE - Konami (1988) - MSX2 - MegaROM RC-757 de 128 KB (Konami SCC) - banco 07 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ----------------------------------------------------------------------
; DATOS paleta_6000: paleta (p00:4C59): fichas de 3 bytes
;   [color][rojo-azul][verde] hasta 0xFF; lo leen p00:543C, p00:5514, p00:5567
;   (43 bytes)
;   0x6000..0x602b  (43 bytes)
DATA_paleta_6000:
	defb 00dh,077h,007h	; 6000
	defb 000h,000h,000h	; 6003
	defb 001h,022h,004h	; 6006
	defb 002h,022h,002h	; 6009
	defb 003h,033h,005h	; 600c
	defb 004h,030h,002h	; 600f
	defb 005h,041h,002h	; 6012
	defb 006h,022h,003h	; 6015
	defb 007h,073h,005h	; 6018
	defb 009h,006h,000h	; 601b
	defb 00ah,060h,000h	; 601e
	defb 00ch,077h,007h	; 6021
	defb 00eh,034h,004h	; 6024
	defb 00fh,000h,000h	; 6027
	defb 0ffh	; 602a

; ----------------------------------------------------------------------
; DATOS paletas_602B: 1 punteros a los colores de cada paleta (p00:556D desde
;   p00:4FB0), para la lista 0x60AE; se solapan 2 bloques: (paletas_602B
;   602B-603F); lo leen p00:51C7, p00:5483 (20 bytes)
;   0x602b..0x603f  (20 bytes)
DATA_paletas_602B:
	defw 0603fh	; 602b  -> DATA_colores_603F
	defw 06041h	; 602d  -> DATA_colores_6041
	defw 06043h	; 602f  -> DATA_colores_6043
	defw 06045h	; 6031  -> DATA_colores_6045
	defw 06047h	; 6033  -> DATA_colores_6047
	defw 06049h	; 6035  -> DATA_colores_6049
	defw 0604bh	; 6037  -> DATA_colores_604B
	defw 0604dh	; 6039  -> DATA_colores_604D
	defw 0604fh	; 603b  -> DATA_colores_604F
	defw 06051h	; 603d  -> DATA_colores_6051

; ----------------------------------------------------------------------
; DATOS colores_603F: 2 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 0 de la lista 0x60AE; lo leen p00:51C7,
;   p00:5483 (2 bytes)
;   0x603f..0x6041  (2 bytes)
DATA_colores_603F:
	defb 000h,001h	; 603f

; ----------------------------------------------------------------------
; DATOS colores_6041: 2 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 1 de la lista 0x6053; lo leen p00:5483
;   (2 bytes)
;   0x6041..0x6043  (2 bytes)
DATA_colores_6041:
	defb 00eh,00fh	; 6041

; ----------------------------------------------------------------------
; DATOS colores_6043: 2 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 2 de la lista 0x6053; lo leen p00:5483
;   (2 bytes)
;   0x6043..0x6045  (2 bytes)
DATA_colores_6043:
	defb 002h,00dh	; 6043

; ----------------------------------------------------------------------
; DATOS colores_6045: 2 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 3 de la lista 0x6053; lo leen p00:5483
;   (2 bytes)
;   0x6045..0x6047  (2 bytes)
DATA_colores_6045:
	defb 001h,006h	; 6045

; ----------------------------------------------------------------------
; DATOS colores_6047: 2 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 4 de la lista 0x6053; lo leen p00:5483
;   (2 bytes)
;   0x6047..0x6049  (2 bytes)
DATA_colores_6047:
	defb 004h,005h	; 6047

; ----------------------------------------------------------------------
; DATOS colores_6049: 2 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 5 de la lista 0x6053; lo leen p00:5483
;   (2 bytes)
;   0x6049..0x604b  (2 bytes)
DATA_colores_6049:
	defb 001h,005h	; 6049

; ----------------------------------------------------------------------
; DATOS colores_604B: 2 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 6 de la lista 0x6053; lo leen p00:5483
;   (2 bytes)
;   0x604b..0x604d  (2 bytes)
DATA_colores_604B:
	defb 004h,00dh	; 604b

; ----------------------------------------------------------------------
; DATOS colores_604D: 2 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 7 de la lista 0x6053; lo leen p00:5483
;   (2 bytes)
;   0x604d..0x604f  (2 bytes)
DATA_colores_604D:
	defb 001h,003h	; 604d

; ----------------------------------------------------------------------
; DATOS colores_604F: 2 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 8 de la lista 0x6053; lo leen p00:5483
;   (2 bytes)
;   0x604f..0x6051  (2 bytes)
DATA_colores_604F:
	defb 005h,006h	; 604f

; ----------------------------------------------------------------------
; DATOS colores_6051: 2 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 9 de la lista 0x6053; lo leen p00:5483
;   (2 bytes)
;   0x6051..0x6053  (2 bytes)
DATA_colores_6051:
	defb 00dh,00fh	; 6051

; ----------------------------------------------------------------------
; DATOS lista_6053: 15 fichas de dibujo de 6 bytes [paleta-tipo][VRAM lo
;   hi][caracteres][puntero] detras del numero (p00:4FA3, paletas en 0x602B);
;   lo leen p00:5483 (91 bytes)
;   0x6053..0x60ae  (91 bytes)
DATA_lista_6053:
	defb 00fh,000h,000h,098h,001h,0b5h	; 6053
	defb 060h,010h,004h,098h,004h,0bdh	; 6059
	defb 060h,011h,014h,098h,002h,0cdh	; 605f
	defb 060h,020h,01ch,098h,001h,0ddh	; 6065
	defb 060h,090h,020h,098h,008h,0e5h	; 606b
	defb 060h,030h,04ch,098h,007h,025h	; 6071
	defb 061h,040h,068h,098h,01bh,05dh	; 6077
	defb 061h,041h,054h,09ch,014h,095h	; 607d
	defb 061h,050h,024h,0a0h,005h,035h	; 6083
	defb 062h,051h,038h,0a0h,002h,04dh	; 6089
	defb 062h,060h,040h,0a0h,00dh,05dh	; 608f
	defb 062h,061h,074h,0a0h,00bh,06dh	; 6095
	defb 062h,070h,020h,0a4h,003h,0c5h	; 609b
	defb 062h,071h,02ch,0a4h,002h,0cdh	; 60a1
	defb 062h,080h,034h,0a4h,001h,0ddh	; 60a7
	defb 062h	; 60ad

; ----------------------------------------------------------------------
; DATOS lista_60AE: 1 fichas de dibujo de 6 bytes [paleta-tipo][VRAM lo
;   hi][caracteres][puntero] detras del numero (p00:4FA3, paletas en 0x602B);
;   lo leen p00:51C7 (7 bytes)
;   0x60ae..0x60b5  (7 bytes)
DATA_lista_60AE:
	defb 001h,000h,000h,094h,001h,0b5h	; 60ae
	defb 060h	; 60b4

; ----------------------------------------------------------------------
; DATOS dibujo_60B5: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 0 de la lista 0x60AE (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:51C7, p00:5483 (8 bytes)
;   0x60b5..0x60bd  (8 bytes)
DATA_dibujo_60B5:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 60b5  ........

; ----------------------------------------------------------------------
; DATOS dibujo_60BD: 4 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 1 de la lista 0x6053 (p00:4FA3, tipo 0 en p00:4FDD); se solapan 2
;   bloques: (dibujo_60CD 60CD-60DD); lo leen p00:5483 (32 bytes)
;   0x60bd..0x60dd  (32 bytes)
DATA_dibujo_60BD:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 60bd  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0ffh	; 60c5  ........
	defb 0bfh,0bfh,0bfh,0bfh,0bfh,0bfh,0bfh,0bfh	; 60cd  ........
	defb 0bfh,0bfh,0bfh,0bfh,0bfh,0bfh,000h,0ffh	; 60d5  ........

; ----------------------------------------------------------------------
; DATOS dibujo_60DD: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 3 de la lista 0x6053 (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:5483 (8 bytes)
;   0x60dd..0x60e5  (8 bytes)
DATA_dibujo_60DD:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 60dd  ........

; ----------------------------------------------------------------------
; DATOS dibujo_60E5: 8 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 4 de la lista 0x6053 (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:5483 (64 bytes)
;   0x60e5..0x6125  (64 bytes)
DATA_dibujo_60E5:
	defb 0ffh,0ffh,0ffh,0feh,0fch,0fch,0ffh,0ffh	; 60e5  ........
	defb 0c7h,0c7h,088h,038h,071h,047h,08fh,08fh	; 60ed  ...8qG..
	defb 0e6h,0e4h,0c9h,0c3h,087h,083h,033h,039h	; 60f5  ......39
	defb 071h,0c0h,0cch,099h,099h,033h,032h,086h	; 60fd  q....32.
	defb 0cch,0cch,089h,089h,023h,023h,066h,066h	; 6105  ....##ff
	defb 0e3h,0c3h,093h,093h,033h,003h,072h,072h	; 610d  ....3.rr
	defb 0ceh,0cch,08dh,08ah,02ah,024h,064h,06ch	; 6115  ....*$dl
	defb 019h,039h,033h,073h,067h,0e7h,0cfh,0cfh	; 611d  .93sg...

; ----------------------------------------------------------------------
; DATOS dibujo_6125: 7 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 5 de la lista 0x6053 (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:5483 (56 bytes)
;   0x6125..0x615d  (56 bytes)
DATA_dibujo_6125:
	defb 055h,0ffh,055h,0aah,055h,0aah,055h,0aah	; 6125  U.U.U.U.
	defb 055h,0ffh,055h,0aah,055h,0aah,000h,000h	; 612d  U.U.U...
	defb 055h,0ffh,055h,0aah,044h,0aah,000h,000h	; 6135  U.U.D...
	defb 055h,0ffh,055h,0aah,000h,0aah,000h,000h	; 613d  U.U.....
	defb 0ffh,000h,000h,000h,000h,000h,000h,000h	; 6145  ........
	defb 055h,0ffh,055h,0aah,055h,0aah,055h,002h	; 614d  U.U.U.U.
	defb 055h,0ffh,055h,0aah,055h,0aah,055h,080h	; 6155  U.U.U.U.

; ----------------------------------------------------------------------
; DATOS dibujo_615D: 27 caracteres de 8x8 a 1 bit por punto (8 bytes cada
;   uno), ficha 6 de la lista 0x6053 (p00:4FA3, tipo 0 en p00:4FDD); se
;   solapan 2 bloques: (dibujo_6195 6195-6235); lo leen p00:5483 (216 bytes)
;   0x615d..0x6235  (216 bytes)
DATA_dibujo_615D:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 615d  ........
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 6165  ........
	defb 0ffh,0ffh,0ffh,0aah,055h,0aah,055h,0aah	; 616d  ....U.U.
	defb 0ffh,0ffh,055h,0aah,055h,0aah,055h,0aah	; 6175  ..U.U.U.
	defb 055h,0abh,05fh,0bfh,07fh,0ffh,0ffh,0ffh	; 617d  U._.....
	defb 055h,0aah,0f5h,0fah,0fdh,0feh,0ffh,0ffh	; 6185  U.......
	defb 0ffh,0ffh,0ffh,0ffh,0f7h,0edh,000h,000h	; 618d  ........
	defb 0ffh,0afh,01dh,087h,05dh,0b7h,0dfh,0ffh	; 6195  ....]...
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0f5h,0aah	; 619d  ........
	defb 0ffh,0ffh,0ffh,0ffh,0fdh,0fah,0d5h,0aah	; 61a5  ........
	defb 0ffh,0ffh,0ffh,0fah,0d5h,0aah,055h,0aah	; 61ad  ......U.
	defb 0fdh,0fah,0d5h,0aah,055h,0aah,055h,0aah	; 61b5  ....U.U.
	defb 0ffh,0fah,055h,0aah,055h,0aah,055h,0aah	; 61bd  ..U.U.U.
	defb 055h,0aah,055h,0aah,055h,0aah,055h,0aah	; 61c5  U.U.U.U.
	defb 0d5h,0aah,055h,0aah,055h,0aah,055h,0aah	; 61cd  ..U.U.U.
	defb 055h,0aah,055h,0aah,055h,0aah,050h,080h	; 61d5  U.U.U.P.
	defb 080h,0f8h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 61dd  ........
	defb 055h,0aah,055h,0aah,050h,080h,000h,000h	; 61e5  U.U.P...
	defb 0ffh,0ffh,0ffh,0feh,0f5h,0eah,0d5h,0aah	; 61ed  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0fdh,0fah	; 61f5  ........
	defb 0ffh,0fah,0f5h,0eah,055h,0aah,055h,0aah	; 61fd  ....U.U.
	defb 055h,0aah,055h,0aah,055h,0aah,054h,0a8h	; 6205  U.U.U.T.
	defb 055h,0a8h,050h,0a0h,000h,000h,000h,000h	; 620d  U.P.....
	defb 055h,0aah,055h,0aah,050h,0a0h,040h,080h	; 6215  U.U.P.@.
	defb 040h,080h,000h,000h,000h,000h,000h,000h	; 621d  @.......
	defb 055h,0aah,050h,0a0h,040h,080h,000h,000h	; 6225  U.P.@...
	defb 054h,0a8h,050h,0a0h,040h,0a0h,040h,080h	; 622d  T.P.@.@.

; ----------------------------------------------------------------------
; DATOS dibujo_6235: 5 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 8 de la lista 0x6053 (p00:4FA3, tipo 0 en p00:4FDD); se solapan 2
;   bloques: (dibujo_624D 624D-625D); lo leen p00:5483 (40 bytes)
;   0x6235..0x625d  (40 bytes)
DATA_dibujo_6235:
	defb 000h,000h,000h,000h,000h,000h,0ffh,0ffh	; 6235  ........
	defb 000h,000h,000h,003h,00fh,03fh,07fh,0ffh	; 623d  .....?..
	defb 000h,007h,07fh,0ffh,0ffh,0ffh,0ffh,0ffh	; 6245  ........
	defb 0f8h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 624d  ........
	defb 000h,000h,000h,000h,000h,000h,080h,0feh	; 6255  ........

; ----------------------------------------------------------------------
; DATOS dibujo_625D: 13 caracteres de 8x8 a 1 bit por punto (8 bytes cada
;   uno), ficha 10 de la lista 0x6053 (p00:4FA3, tipo 0 en p00:4FDD); se
;   solapan 2 bloques: (dibujo_626D 626D-62C5); lo leen p00:5483 (104 bytes)
;   0x625d..0x62c5  (104 bytes)
DATA_dibujo_625D:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 625d  ........
	defb 000h,000h,000h,000h,000h,0ffh,0ffh,0ffh	; 6265  ........
	defb 01ch,01ch,038h,038h,070h,070h,0e0h,0e0h	; 626d  ..88pp..
	defb 001h,001h,003h,003h,007h,007h,00fh,00fh	; 6275  ........
	defb 0c0h,0c0h,080h,080h,000h,0ffh,0ffh,0ffh	; 627d  ........
	defb 00eh,00eh,00fh,007h,007h,007h,003h,003h	; 6285  ........
	defb 000h,000h,000h,000h,000h,080h,080h,080h	; 628d  ........
	defb 003h,001h,001h,001h,000h,000h,000h,000h	; 6295  ........
	defb 0c0h,0c0h,0c0h,0e0h,0e0h,0e0h,0f0h,070h	; 629d  .......p
	defb 038h,038h,01ch,01ch,01ch,01ch,01ch,00eh	; 62a5  88......
	defb 00eh,00eh,00eh,00eh,007h,007h,007h,007h	; 62ad  ........
	defb 00eh,00eh,00eh,00eh,00eh,01ch,01ch,01ch	; 62b5  ........
	defb 0c0h,0c0h,080h,080h,000h,000h,000h,000h	; 62bd  ........

; ----------------------------------------------------------------------
; DATOS dibujo_62C5: 3 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 12 de la lista 0x6053 (p00:4FA3, tipo 0 en p00:4FDD); se solapan 2
;   bloques: (dibujo_62CD 62CD-62DD); lo leen p00:5483 (24 bytes)
;   0x62c5..0x62dd  (24 bytes)
DATA_dibujo_62C5:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 62c5  ........
	defb 020h,080h,000h,000h,000h,000h,000h,000h	; 62cd   .......
	defb 000h,000h,000h,000h,000h,000h,048h,002h	; 62d5  ......H.

; ----------------------------------------------------------------------
; DATOS dibujo_62DD: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 14 de la lista 0x6053 (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:5483 (8 bytes)
;   0x62dd..0x62e5  (8 bytes)
DATA_dibujo_62DD:
	defb 000h,000h,000h,000h,000h,000h,000h,0ffh	; 62dd  ........

; ----------------------------------------------------------------------
; DATOS paletas_62E5: 11 punteros a los colores de cada paleta (p00:556D desde
;   p00:4FB0), para la lista 0x6323; lo leen p00:548C (22 bytes)
;   0x62e5..0x62fb  (22 bytes)
DATA_paletas_62E5:
	defw 062fbh,062ffh,06303h,06307h,0630bh,0630eh,06312h,06316h	; 62e5
	defw 06317h,0631ah,0631fh	; 62f5  -> 0x6317 0x631a DATA_colores_631F

; ----------------------------------------------------------------------
; DATOS colores_62FB: 4 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 0 de la lista 0x6323; lo leen p00:548C
;   (4 bytes)
;   0x62fb..0x62ff  (4 bytes)
DATA_colores_62FB:
	defb 002h,00dh,00eh,00fh	; 62fb

; ----------------------------------------------------------------------
; DATOS colores_62FF: 4 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 1 de la lista 0x6323; lo leen p00:548C
;   (4 bytes)
;   0x62ff..0x6303  (4 bytes)
DATA_colores_62FF:
	defb 001h,003h,004h,006h	; 62ff

; ----------------------------------------------------------------------
; DATOS colores_6303: 4 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 2 de la lista 0x6323; lo leen p00:548C
;   (4 bytes)
;   0x6303..0x6307  (4 bytes)
DATA_colores_6303:
	defb 004h,00dh,00eh,00fh	; 6303

; ----------------------------------------------------------------------
; DATOS colores_6307: 4 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 3 de la lista 0x6323; lo leen p00:548C
;   (4 bytes)
;   0x6307..0x630b  (4 bytes)
DATA_colores_6307:
	defb 004h,005h,00dh,00fh	; 6307

; ----------------------------------------------------------------------
; DATOS colores_630B: 4 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 4 de la lista 0x6323; se solapan 2
;   bloques: (colores_630E 630E-6312); lo leen p00:548C (7 bytes)
;   0x630b..0x6312  (7 bytes)
DATA_colores_630B:
	defb 004h,005h,006h,004h	; 630b
	defb 005h,006h,00dh	; 630f

; ----------------------------------------------------------------------
; DATOS colores_6312: 8 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 6 de la lista 0x6323; se solapan 2
;   bloques: (colores_6317 6317-631F); lo leen p00:548C (13 bytes)
;   0x6312..0x631f  (13 bytes)
DATA_colores_6312:
	defb 001h,004h,005h,006h,003h,00dh,00eh,00fh	; 6312  ........
	defb 001h,004h,007h,009h,00ah	; 631a

; ----------------------------------------------------------------------
; DATOS colores_631F: 4 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 10 de la lista 0x6323; lo leen p00:548C
;   (4 bytes)
;   0x631f..0x6323  (4 bytes)
DATA_colores_631F:
	defb 002h,009h,00eh,00fh	; 631f

; ----------------------------------------------------------------------
; DATOS lista_6323: 16 fichas de dibujo de 6 bytes [paleta-tipo][VRAM lo
;   hi][caracteres][puntero] detras del numero (p00:4FA3, paletas en 0x62E5);
;   lo leen p00:548C (97 bytes)
;   0x6323..0x6384  (97 bytes)
DATA_lista_6323:
	defb 010h,002h,038h,0a4h,00bh,084h	; 6323
	defb 063h,003h,064h,0a4h,006h,0d4h	; 6329
	defb 063h,012h,014h,0a8h,003h,034h	; 632f
	defb 064h,013h,020h,0a8h,001h,054h	; 6335
	defb 064h,022h,024h,0a8h,002h,064h	; 633b
	defb 064h,023h,02ch,0a8h,002h,064h	; 6341
	defb 064h,032h,034h,0a8h,001h,084h	; 6347
	defb 064h,033h,038h,0a8h,001h,084h	; 634d
	defb 064h,042h,03ch,0a8h,001h,094h	; 6353
	defb 064h,052h,040h,0a8h,011h,0a4h	; 6359
	defb 064h,053h,004h,0ach,009h,024h	; 635f
	defb 065h,062h,028h,0ach,014h,0b4h	; 6365
	defb 065h,0a2h,078h,0ach,001h,0f4h	; 636b
	defb 066h,064h,07ch,0ach,016h,004h	; 6371
	defb 067h,065h,054h,0b0h,00eh,0c4h	; 6377
	defb 067h,084h,00ch,0b4h,006h,014h	; 637d
	defb 069h	; 6383

; ----------------------------------------------------------------------
; DATOS dibujo_6384: 11 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0x6323 (p00:4FA3, tipo 2 en p00:4FDD); se
;   solapan 2 bloques: (dibujo_63D4 63D4-6434); lo leen p00:548C (176 bytes)
;   0x6384..0x6434  (176 bytes)
DATA_dibujo_6384:
	defb 000h,000h,006h,000h,00eh,000h,00eh,008h,006h,000h,006h,000h,00fh,000h,00fh,00fh	; 6384  ................
	defb 000h,000h,038h,000h,07dh,010h,06dh,000h,07dh,064h,039h,008h,07dh,001h,07ch,07ch	; 6394  ..8.}.m.}d9.}.||
	defb 000h,000h,0e0h,000h,0b0h,000h,0b0h,000h,0b7h,000h,0b7h,001h,0f6h,010h,026h,026h	; 63a4  ..............&&
	defb 000h,000h,000h,000h,000h,000h,000h,000h,0f0h,000h,0f8h,020h,0d8h,000h,0d8h,0d8h	; 63b4  ........... ....
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh	; 63c4  ................
	defb 0fbh,0fdh,0fbh,0fdh,0fbh,0fdh,0fbh,0fdh,0fbh,0fdh,0fbh,0fdh,0fbh,0fdh,0fbh,0fdh	; 63d4  ................
	defb 0dfh,0bfh,0dfh,0bfh,0dfh,0bfh,0dfh,0bfh,0dfh,0bfh,0c0h,0bfh,0ffh,080h,0ffh,0ffh	; 63e4  ................
	defb 03eh,058h,02dh,043h,02bh,057h,02fh,05fh,027h,057h,02fh,057h,02fh,043h,03fh,059h	; 63f4  >X-C+W/_'W/W/C?Y
	defb 03bh,05ch,03dh,05eh,03fh,05ch,03eh,058h,02dh,043h,02bh,057h,027h,05fh,08fh,0afh	; 6404  .\=^?\>X-C+W'_..
	defb 0ffh,000h,005h,0feh,039h,03ah,0f9h,0fah,0f9h,0fah,0f9h,0fah,001h,0feh,0ffh,0ffh	; 6414  ....9:..........
	defb 00fh,000h,008h,011h,008h,030h,009h,071h,00fh,077h,08fh,0b7h,048h,047h,07fh,07fh	; 6424  .....0.q.w..HG..

; ----------------------------------------------------------------------
; DATOS dibujo_6434: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0x6323 (p00:4FA3, tipo 2 en p00:4FDD); se
;   solapan 2 bloques: (dibujo_6454 6454-6464); lo leen p00:548C (48 bytes)
;   0x6434..0x6464  (48 bytes)
DATA_dibujo_6434:
	defb 000h,0ffh,003h,0ffh,01dh,0fch,0e0h,0e0h,014h,000h,040h,000h,000h,000h,000h,000h	; 6434  ..........@.....
	defb 0ffh,0ffh,011h,000h,044h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6444  ....D...........
	defb 0c2h,0c0h,088h,000h,020h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6454  .... ...........

; ----------------------------------------------------------------------
; DATOS dibujo_6464: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0x6323 (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:548C (32 bytes)
;   0x6464..0x6484  (32 bytes)
DATA_dibujo_6464:
	defb 0ffh,000h,0ffh,000h,0ffh,000h,03fh,0c0h,0c1h,0feh,03eh,03fh,001h,001h,000h,000h	; 6464  ......?...>?....
	defb 00fh,000h,00fh,000h,00fh,000h,000h,00fh,00fh,00fh,000h,000h,000h,000h,000h,000h	; 6474  ................

; ----------------------------------------------------------------------
; DATOS dibujo_6484: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 6 de la lista 0x6323 (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:548C (16 bytes)
;   0x6484..0x6494  (16 bytes)
DATA_dibujo_6484:
	defb 000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0fch,000h,080h,007h,007h,007h	; 6484  ................

; ----------------------------------------------------------------------
; DATOS dibujo_6494: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 8 de la lista 0x6323 (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:548C (16 bytes)
;   0x6494..0x64a4  (16 bytes)
DATA_dibujo_6494:
	defb 0ffh,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 6494  ................

; ----------------------------------------------------------------------
; DATOS dibujo_64A4: 17 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 9 de la lista 0x6323 (p00:4FA3, tipo 2 en p00:4FDD); se
;   solapan 2 bloques: (dibujo_6524 6524-65B4); lo leen p00:548C (272 bytes)
;   0x64a4..0x65b4  (272 bytes)
DATA_dibujo_64A4:
	defb 0ffh,0ffh,0ffh,0ffh,000h,000h,055h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 64a4  ......U.........
	defb 0aah,000h,000h,000h,000h,000h,055h,000h,000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh	; 64b4  ......U.........
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0f5h,000h,0aah,000h,055h,000h,0eah,0e0h	; 64c4  ............U...
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,057h,000h,0aah,000h,055h,000h,0afh,007h	; 64d4  ........W...U...
	defb 0f8h,0f8h,0f8h,0f8h,01ch,01ch,05ch,01ch,00eh,00eh,00eh,00eh,007h,007h,007h,007h	; 64e4  ......\.........
	defb 05fh,01fh,09fh,01fh,078h,038h,0bdh,038h,07ah,070h,0f4h,070h,0e0h,0e0h,0e0h,0e0h	; 64f4  _...x8.8zp.p....
	defb 0ffh,0ffh,0ffh,0ffh,003h,003h,057h,007h,007h,007h,007h,007h,007h,007h,007h,007h	; 6504  ......W.........
	defb 0ffh,0ffh,0ffh,0ffh,0c0h,0c0h,0f5h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h	; 6514  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0f0h,07fh,07fh,007h,007h,080h,000h,0e8h,000h	; 6524  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0fah,0f0h,07fh,07eh,007h,007h	; 6534  .............~..
	defb 055h,001h,0a9h,001h,043h,003h,003h,003h,007h,007h,007h,007h,00eh,00eh,00eh,00eh	; 6544  U...C...........
	defb 0aah,080h,080h,080h,080h,080h,055h,000h,000h,000h,000h,000h,007h,007h,007h,007h	; 6554  ......U.........
	defb 0ffh,000h,0ffh,0f0h,07fh,07fh,007h,007h,080h,000h,0f8h,000h,0ffh,000h,0ffh,000h	; 6564  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0f0h,07fh,07fh,007h,007h,080h,000h,0f8h,000h	; 6574  ................
	defb 000h,00fh,0f0h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0f0h,07fh,07fh,007h,007h	; 6584  ................
	defb 07fh,07fh,007h,007h,080h,000h,0f8h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 6594  ................
	defb 0f8h,001h,0feh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 65a4  ................

; ----------------------------------------------------------------------
; DATOS dibujo_65B4: 20 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 11 de la lista 0x6323 (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:548C (320 bytes)
;   0x65b4..0x66f4  (320 bytes)
DATA_dibujo_65B4:
	defb 000h,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 65b4  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,0ffh,000h,000h	; 65c4  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,0ffh,000h,000h,000h,000h	; 65d4  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h	; 65e4  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,000h	; 65f4  ................
	defb 000h,0ffh,000h,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6604  ................
	defb 000h,000h,000h,000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 6614  ................
	defb 000h,000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 6624  ................
	defb 000h,000h,020h,0c0h,006h,0f8h,011h,0eeh,002h,0fdh,00ah,0f5h,027h,0d8h,05dh,0a2h	; 6634  .. .........'.].
	defb 000h,000h,000h,000h,000h,000h,0c0h,000h,0f0h,000h,0bch,040h,0feh,000h,0bfh,040h	; 6644  ...........@...@
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0a0h,05fh,0cah,035h,0ffh,000h,0ffh,0fch	; 6654  ........._.5....
	defb 055h,055h,0aah,0aah,055h,055h,0ffh,000h,0eah,015h,0d5h,02ah,0aah,055h,055h,0aah	; 6664  UU..UU.....*.UU.
	defb 055h,055h,0aah,0aah,0ffh,000h,055h,0aah,0aah,055h,054h,0abh,0a0h,05fh,000h,0ffh	; 6674  UU....U..UT.._..
	defb 055h,055h,0aah,0aah,0ffh,000h,050h,0afh,080h,07fh,000h,0ffh,000h,0ffh,000h,0ffh	; 6684  UU....P.........
	defb 050h,050h,080h,080h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 6694  PP..............
	defb 055h,055h,0aah,0aah,055h,055h,0ffh,000h,0afh,050h,057h,0a8h,0abh,054h,055h,0aah	; 66a4  UU..UU...PW..TU.
	defb 055h,055h,0aah,0aah,0ffh,000h,055h,0aah,0aah,055h,055h,0aah,00ah,0f5h,001h,0feh	; 66b4  UU....U..UU.....
	defb 055h,055h,0aah,0aah,0ffh,000h,015h,0eah,002h,0fdh,000h,0ffh,000h,0ffh,000h,0ffh	; 66c4  UU..............
	defb 005h,005h,002h,002h,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 66d4  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,0a5h,05ah,057h,0a8h,0dbh,024h,0ffh,000h,0ffh,03fh	; 66e4  .......ZW..$...?

; ----------------------------------------------------------------------
; DATOS dibujo_66F4: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 12 de la lista 0x6323 (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:548C (16 bytes)
;   0x66f4..0x6704  (16 bytes)
DATA_dibujo_66F4:
	defb 000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,0ffh	; 66f4  ................

; ----------------------------------------------------------------------
; DATOS dibujo_6704: 22 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 13 de la lista 0x6323 (p00:4FA3, tipo 4 en p00:4FDD); se
;   solapan 2 bloques: (dibujo_67C4 67C4-6914); lo leen p00:548C (528 bytes)
;   0x6704..0x6914  (528 bytes)
DATA_dibujo_6704:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,022h,000h,000h,008h,0ffh,0ffh,000h,0ffh,000h,000h,000h,0ffh,000h,000h,0ffh,000h	; 6704  ........"...............
	defb 002h,0fdh,000h,049h,0b6h,000h,0a7h,058h,000h,07bh,084h,000h,0dfh,020h,000h,0ffh,003h,000h,0fch,0fch,000h,000h,000h,085h	; 671c  ...I...X.{... ..........
	defb 07fh,080h,000h,06bh,094h,000h,0ffh,000h,000h,0ffh,001h,000h,0feh,01eh,000h,0e0h,0e0h,001h,000h,000h,024h,000h,000h,050h	; 6734  ...k................$..P
	defb 0c0h,03fh,000h,0f8h,0c7h,000h,03fh,038h,080h,007h,007h,000h,000h,000h,028h,000h,000h,002h,000h,000h,000h,000h,000h,000h	; 674c  .?....?8......(.........
	defb 000h,0ffh,000h,000h,0ffh,000h,0a0h,05fh,000h,0f9h,086h,000h,07fh,078h,000h,007h,007h,080h,000h,000h,024h,000h,000h,00ah	; 6764  ......._.....x......$...
	defb 000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,020h,0dfh,000h,0cah,035h,000h,0ffh,0c0h,000h,03fh,03fh,000h,000h,000h,0a1h	; 677c  ......... ...5....??....
	defb 000h,000h,000h,000h,000h,088h,0ffh,0ffh,000h,0ffh,000h,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h	; 6794  ........................
	defb 000h,000h,000h,000h,000h,040h,000h,000h,011h,0ffh,0ffh,000h,0ffh,000h,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h	; 67ac  .....@..................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,000h,000h,008h,000h,000h,0a2h,000h,000h,008h,00fh,00fh,040h	; 67c4  .......................@
	defb 0feh,001h,0fch,0ffh,000h,0feh,001h,0feh,0feh,0ffh,0feh,0feh,0ffh,000h,000h,054h,0abh,000h,001h,0feh,000h,000h,0ffh,000h	; 67dc  ...............T........
	defb 00fh,0f0h,000h,000h,0ffh,000h,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 67f4  ........................
	defb 000h,000h,00ah,000h,000h,040h,000h,000h,001h,000h,000h,000h,000h,000h,022h,003h,003h,008h,01fh,01ch,040h,07ch,063h,000h	; 680c  .....@........".....@|c.
	defb 0f0h,0ffh,000h,00eh,00fh,040h,003h,003h,014h,01fh,01ch,040h,0fch,0e3h,000h,0e0h,01fh,000h,000h,0ffh,000h,000h,0ffh,000h	; 6824  .....@.....@............
	defb 003h,003h,008h,00fh,00ch,0a0h,03ch,033h,000h,070h,04fh,080h,0c0h,0bfh,000h,080h,07fh,000h,000h,0ffh,000h,000h,0ffh,000h	; 683c  ......<3.pO.............
	defb 000h,000h,000h,000h,000h,012h,03fh,03fh,040h,0ffh,0c0h,000h,0c0h,03fh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h	; 6854  ......??@....?..........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,002h,000h,000h,010h,00fh,00fh,040h,0ffh,0f0h,000h,0f0h,00fh,000h,000h,0ffh,000h	; 686c  ..............@.........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,001h,000h,000h,000h,000h,000h,028h,03fh,03fh,080h,0ffh,0c0h,000h,0c0h,03fh,000h	; 6884  ..............(??.....?.
	defb 000h,000h,040h,000h,000h,002h,000h,000h,010h,0f0h,0f0h,001h,0ffh,00fh,000h,00fh,0f0h,000h,000h,0ffh,000h,000h,0ffh,000h	; 689c  ..@.....................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,048h,000h,000h,000h,080h,080h,012h,0f0h,0f0h,000h,0ffh,00fh,000h,00fh,0f0h,000h	; 68b4  ........H...............
	defb 000h,000h,088h,0f0h,0f0h,001h,0ffh,00fh,000h,00fh,0f0h,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,0f0h,00fh,0f0h	; 68cc  ........................
	defb 000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,080h,0ffh,000h,078h,07fh,000h,007h,007h,0a0h	; 68e4  ..................x.....
	defb 000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,000h,080h,0ffh,000h,078h,07fh,000h,007h,007h,090h,000h,000h,002h,000h,000h,048h	; 68fc  ............x..........H

; ----------------------------------------------------------------------
; DATOS dibujo_6914: 6 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 15 de la lista 0x6323 (p00:4FA3, tipo 4 en p00:4FDD); lo leen
;   p00:548C (144 bytes)
;   0x6914..0x69a4  (144 bytes)
DATA_dibujo_6914:
	defb 0cfh,0ffh,036h,0e7h,0ffh,066h,0e7h,0ffh,060h,0ffh,01fh,000h,0ffh,013h,00ch,00dh,0f3h,03ch,009h,0ffh,030h,033h,0ffh,0fdh	; 6914  ..6..f..`........<..03..
	defb 09fh,0fch,067h,09fh,0ffh,066h,0ffh,0c8h,006h,0ffh,018h,01eh,0fch,03fh,01bh,0f8h,0ffh,001h,099h,0ffh,060h,086h,0e7h,0f8h	; 692c  ..g..f.......?......`...
	defb 0f3h,0ffh,03dh,0feh,0ffh,000h,09eh,0ffh,060h,0beh,0f3h,071h,0ffh,0f0h,030h,0ffh,09ch,06ch,07fh,08ch,0ech,067h,0d8h,098h	; 6944  ..=.....`..q..0..l...g..
	defb 086h,087h,098h,001h,09fh,018h,061h,09eh,018h,07fh,09ch,080h,07fh,0e7h,098h,0ffh,083h,018h,03ch,0d0h,0c0h,00ch,0fch,0c0h	; 695c  ......a...........<.....
	defb 0cfh,0ffh,0bch,07fh,0ffh,000h,079h,0ffh,006h,07dh,0cfh,08eh,0ffh,00fh,00ch,0ffh,039h,036h,0ffh,000h,000h,000h,0ffh,000h	; 6974  ......y..}......96......
	defb 061h,0e1h,019h,080h,0f9h,018h,086h,079h,018h,0feh,039h,001h,0feh,0e7h,019h,0ffh,0c1h,018h,0ffh,000h,000h,000h,0ffh,000h	; 698c  a......y..9.............

; ----------------------------------------------------------------------
; DATOS paletas_69A4: 7 punteros a los colores de cada paleta (p00:556D desde
;   p00:4FB0), para la lista 0x69CA; lo leen p00:5495 (14 bytes)
;   0x69a4..0x69b2  (14 bytes)
DATA_paletas_69A4:
	defw 069b2h,069b4h,069b6h,069b8h,069bah,069beh,069c2h	; 69a4

; ----------------------------------------------------------------------
; DATOS colores_69B2: 4 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 0 de la lista 0x69CA; se solapan 2
;   bloques: (colores_69B4 69B4-69B6); lo leen p00:5495 (4 bytes)
;   0x69b2..0x69b6  (4 bytes)
DATA_colores_69B2:
	defb 001h,003h,005h,00dh	; 69b2

; ----------------------------------------------------------------------
; DATOS colores_69B6: 4 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 2 de la lista 0x69CA; se solapan 2
;   bloques: (colores_69B8 69B8-69BA); lo leen p00:5495 (4 bytes)
;   0x69b6..0x69ba  (4 bytes)
DATA_colores_69B6:
	defb 001h,00dh,004h,005h	; 69b6

; ----------------------------------------------------------------------
; DATOS colores_69BA: 4 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 4 de la lista 0x69CA; lo leen p00:5495
;   (4 bytes)
;   0x69ba..0x69be  (4 bytes)
DATA_colores_69BA:
	defb 001h,004h,005h,006h	; 69ba

; ----------------------------------------------------------------------
; DATOS colores_69BE: 4 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 5 de la lista 0x69CA; lo leen p00:5495
;   (4 bytes)
;   0x69be..0x69c2  (4 bytes)
DATA_colores_69BE:
	defb 001h,00dh,00eh,00fh	; 69be

; ----------------------------------------------------------------------
; DATOS colores_69C2: 8 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 6 de la lista 0x69CA; lo leen p00:5495
;   (8 bytes)
;   0x69c2..0x69ca  (8 bytes)
DATA_colores_69C2:
	defb 001h,003h,005h,006h,00dh,004h,00eh,00fh	; 69c2  ........

; ----------------------------------------------------------------------
; DATOS lista_69CA: 18 fichas de dibujo de 6 bytes [paleta-tipo][VRAM lo
;   hi][caracteres][puntero] detras del numero (p00:4FA3, paletas en 0x69A4);
;   lo leen p00:5495 (109 bytes)
;   0x69ca..0x6a37  (109 bytes)
DATA_lista_69CA:
	defb 012h,020h,000h,0ech,005h,037h	; 69ca
	defb 06ah,021h,014h,0ech,002h,04fh	; 69d0
	defb 06ah,010h,01ch,0ech,004h,05fh	; 69d6
	defb 06ah,011h,02ch,0ech,002h,06fh	; 69dc
	defb 06ah,030h,034h,0ech,003h,07fh	; 69e2
	defb 06ah,031h,040h,0ech,002h,087h	; 69e8
	defb 06ah,000h,048h,0ech,001h,097h	; 69ee
	defb 06ah,001h,04ch,0ech,001h,097h	; 69f4
	defb 06ah,042h,050h,0ech,002h,09fh	; 69fa
	defb 06ah,043h,058h,0ech,001h,0afh	; 6a00
	defb 06ah,052h,05ch,0ech,001h,0bfh	; 6a06
	defb 06ah,053h,060h,0ech,001h,0bfh	; 6a0c
	defb 06ah,002h,064h,0ech,003h,0cfh	; 6a12
	defb 06ah,003h,070h,0ech,003h,0cfh	; 6a18
	defb 06ah,022h,07ch,0ech,00bh,0ffh	; 6a1e
	defb 06ah,023h,028h,0f0h,004h,06fh	; 6a24
	defb 06bh,064h,038h,0f0h,009h,0afh	; 6a2a
	defb 06bh,065h,05ch,0f0h,009h,0afh	; 6a30
	defb 06bh	; 6a36

; ----------------------------------------------------------------------
; DATOS dibujo_6A37: 5 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 0 de la lista 0x69CA (p00:4FA3, tipo 0 en p00:4FDD); se solapan 2
;   bloques: (dibujo_6A4F 6A4F-6A5F); lo leen p00:5495 (40 bytes)
;   0x6a37..0x6a5f  (40 bytes)
DATA_dibujo_6A37:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 6a37  ........
	defb 0ffh,0ffh,0ffh,000h,000h,000h,000h,000h	; 6a3f  ........
	defb 000h,000h,000h,000h,000h,0ffh,0ffh,0ffh	; 6a47  ........
	defb 0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h	; 6a4f  ........
	defb 0e0h,0e0h,0e0h,0e0h,070h,07fh,03fh,00fh	; 6a57  ....p.?.

; ----------------------------------------------------------------------
; DATOS dibujo_6A5F: 4 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 2 de la lista 0x69CA (p00:4FA3, tipo 0 en p00:4FDD); se solapan 2
;   bloques: (dibujo_6A6F 6A6F-6A7F); lo leen p00:5495 (32 bytes)
;   0x6a5f..0x6a7f  (32 bytes)
DATA_dibujo_6A5F:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 6a5f  ........
	defb 000h,000h,000h,000h,000h,0ffh,0ffh,0ffh	; 6a67  ........
	defb 000h,000h,000h,000h,000h,000h,001h,003h	; 6a6f  ........
	defb 0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h	; 6a77  ........

; ----------------------------------------------------------------------
; DATOS dibujo_6A7F: 3 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 4 de la lista 0x69CA (p00:4FA3, tipo 0 en p00:4FDD); se solapan 2
;   bloques: (dibujo_6A87 6A87-6A97); lo leen p00:5495 (24 bytes)
;   0x6a7f..0x6a97  (24 bytes)
DATA_dibujo_6A7F:
	defb 0fch,0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 6a7f  ........
	defb 0ffh,05fh,0ffh,07fh,0ffh,0ffh,0ffh,0ffh	; 6a87  ._......
	defb 0bfh,0fdh,0afh,0ffh,0b5h,06fh,06bh,03fh	; 6a8f  .....ok?

; ----------------------------------------------------------------------
; DATOS dibujo_6A97: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 6 de la lista 0x69CA (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:5495 (8 bytes)
;   0x6a97..0x6a9f  (8 bytes)
DATA_dibujo_6A97:
	defb 040h,000h,040h,000h,000h,000h,000h,000h	; 6a97  @.@.....

; ----------------------------------------------------------------------
; DATOS dibujo_6A9F: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 8 de la lista 0x69CA (p00:4FA3, tipo 2 en p00:4FDD); se
;   solapan 2 bloques: (dibujo_6AAF 6AAF-6ABF); lo leen p00:5495 (32 bytes)
;   0x6a9f..0x6abf  (32 bytes)
DATA_dibujo_6A9F:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,0ffh,0ffh,000h,000h,0ffh	; 6a9f  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,080h,0ffh,040h,07fh	; 6aaf  ..............@.

; ----------------------------------------------------------------------
; DATOS dibujo_6ABF: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 10 de la lista 0x69CA (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:5495 (16 bytes)
;   0x6abf..0x6acf  (16 bytes)
DATA_dibujo_6ABF:
	defb 0ffh,0f0h,0ffh,0c0h,0ffh,080h,0f0h,080h,0e0h,000h,0e0h,000h,0e0h,000h,0e0h,000h	; 6abf  ................

; ----------------------------------------------------------------------
; DATOS dibujo_6ACF: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 12 de la lista 0x69CA (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:5495 (48 bytes)
;   0x6acf..0x6aff  (48 bytes)
DATA_dibujo_6ACF:
	defb 007h,0ffh,007h,0ffh,007h,0ffh,007h,0ffh,007h,0f7h,007h,0e7h,017h,0c7h,007h,087h	; 6acf  ................
	defb 047h,007h,007h,007h,047h,007h,007h,007h,007h,007h,007h,007h,007h,007h,007h,007h	; 6adf  G...G...........
	defb 000h,0ffh,000h,0feh,001h,0fch,000h,0f8h,004h,0f0h,000h,0e0h,014h,0c0h,001h,080h	; 6aef  ................

; ----------------------------------------------------------------------
; DATOS dibujo_6AFF: 11 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 14 de la lista 0x69CA (p00:4FA3, tipo 2 en p00:4FDD); se
;   solapan 2 bloques: (dibujo_6B6F 6B6F-6BAF); lo leen p00:5495 (176 bytes)
;   0x6aff..0x6baf  (176 bytes)
DATA_dibujo_6AFF:
	defb 0ffh,01fh,0ffh,00fh,0ffh,007h,0ffh,003h,0efh,011h,0e7h,018h,0e3h,01ch,0f9h,01eh	; 6aff  ................
	defb 0ffh,0f8h,0ffh,0f0h,0ffh,0e0h,0ffh,0c0h,0f7h,088h,0e7h,018h,0ffh,000h,09fh,078h	; 6b0f  ...............x
	defb 0fch,01fh,0feh,01fh,0ffh,01fh,0ffh,01fh,0ffh,01fh,0ffh,01fh,0ffh,01fh,0ffh,01fh	; 6b1f  ................
	defb 03fh,0f8h,07fh,0f8h,0ffh,0f8h,0ffh,0f0h,0ffh,0e8h,0ffh,0d8h,0ffh,0b8h,0ffh,078h	; 6b2f  ?..............x
	defb 03fh,0feh,07fh,0fdh,0ffh,0fbh,0ffh,0f7h,0ffh,0efh,0ffh,0dfh,0ffh,0bfh,0ffh,07fh	; 6b3f  ?...............
	defb 0ffh,000h,07fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0ffh,000h,0ffh,000h	; 6b4f  ................
	defb 0fch,0ffh,0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0ffh,000h,0ffh,000h	; 6b5f  ................
	defb 087h,0f8h,00eh,0f1h,0bch,0e3h,079h,0c7h,0f3h,08fh,0e7h,01fh,0cfh,03fh,09fh,07fh	; 6b6f  ......y......?..
	defb 0ffh,0f8h,0feh,0f1h,0fch,0e3h,0f9h,0c7h,0f3h,08fh,0e7h,01fh,0cfh,03fh,09fh,07fh	; 6b7f  .............?..
	defb 088h,0ffh,0e6h,0ffh,015h,0ffh,0dbh,0ffh,06eh,0ffh,0dah,0ffh,0ffh,0feh,0ffh,0fch	; 6b8f  ........n.......
	defb 0ffh,018h,07fh,088h,03fh,0c0h,09fh,0e0h,0ceh,0f0h,0feh,000h,0fch,000h,0f0h,000h	; 6b9f  ....?...........

; ----------------------------------------------------------------------
; DATOS dibujo_6BAF: 9 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 16 de la lista 0x69CA (p00:4FA3, tipo 4 en p00:4FDD); lo leen
;   p00:5495 (216 bytes)
;   0x6baf..0x6c87  (216 bytes)
DATA_dibujo_6BAF:
	defb 000h,000h,0e0h,000h,000h,0e0h,000h,000h,0e0h,000h,000h,0e0h,000h,000h,0e0h,01fh,01fh,0e0h,01fh,000h,0ffh,000h,01fh,0e0h	; 6baf  ........................
	defb 0c0h,080h,000h,040h,0c0h,000h,034h,0e0h,000h,010h,0f0h,000h,00dh,0f8h,000h,004h,0fch,000h,003h,07eh,080h,001h,03fh,0c0h	; 6bc7  ...@..4............~..?.
	defb 0d0h,080h,007h,040h,0c0h,007h,030h,0e0h,007h,010h,0f0h,007h,008h,0f8h,007h,000h,0f8h,007h,000h,078h,087h,000h,038h,0c7h	; 6bdf  ...@..0............x..8.
	defb 004h,0fch,000h,009h,0f8h,000h,014h,0f0h,000h,021h,0e0h,000h,048h,0c0h,000h,080h,080h,000h,048h,000h,000h,000h,000h,000h	; 6bf7  .........!..H.....H.....
	defb 000h,0f8h,007h,008h,0f8h,007h,010h,0f0h,007h,020h,0e0h,007h,048h,0c0h,007h,0a0h,080h,007h,000h,000h,007h,0a0h,000h,007h	; 6c0f  ......... ..H...........
	defb 0a0h,03fh,000h,010h,01fh,000h,048h,00fh,000h,004h,007h,000h,012h,003h,000h,000h,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh	; 6c27  .?....H.................
	defb 053h,0ach,053h,02bh,0d4h,02bh,0d7h,028h,0d7h,0bfh,040h,0bfh,05eh,0a0h,05fh,03eh,0c1h,03fh,06fh,091h,06fh,09fh,060h,09fh	; 6c3f  S.S+.+.(..@.^._>.?o.o.`.
	defb 04eh,0b1h,04eh,0b1h,04eh,0b1h,080h,000h,0ffh,000h,001h,0ffh,000h,003h,0ffh,001h,0ffh,0ffh,0feh,0feh,0ffh,0fch,000h,0ffh	; 6c57  N.N.N...................
	defb 0a0h,058h,0a7h,051h,0a0h,05fh,063h,080h,0ffh,046h,081h,0feh,08ch,083h,0fch,018h,007h,0f8h,030h,00fh,0f0h,060h,01fh,0e0h	; 6c6f  .X.Q._c..F........0..`..

; ----------------------------------------------------------------------
; DATOS paletas_6C87: 15 punteros a los colores de cada paleta (p00:556D desde
;   p00:4FB0), para la lista 0x6CC3; lo leen p00:54BC (30 bytes)
;   0x6c87..0x6ca5  (30 bytes)
DATA_paletas_6C87:
	defw 06ca5h,06ca7h,06ca9h,06cabh,06cadh,06cafh,06cb1h,06cb3h	; 6c87
	defw 06cb5h,06cb7h,06cb9h,06cbbh,06cbdh,06cbfh,06cc1h	; 6c97

; ----------------------------------------------------------------------
; DATOS colores_6CA5: 4 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 0 de la lista 0x6CC3; se solapan 4
;   bloques: (colores_6CA7 6CA7-6CAB) (colores_6CA9 6CA9-6CAD) (colores_6CAB
;   6CAB-6CAD); lo leen p00:54BC (8 bytes)
;   0x6ca5..0x6cad  (8 bytes)
DATA_colores_6CA5:
	defb 004h,005h,002h,00ch	; 6ca5
	defb 00eh,000h,004h,00ch	; 6ca9

; ----------------------------------------------------------------------
; DATOS colores_6CAD: 4 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 4 de la lista 0x6CC3; se solapan 2
;   bloques: (colores_6CAF 6CAF-6CB1); lo leen p00:54BC (4 bytes)
;   0x6cad..0x6cb1  (4 bytes)
DATA_colores_6CAD:
	defb 00ch,000h,009h,00eh	; 6cad

; ----------------------------------------------------------------------
; DATOS colores_6CB1: 2 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 6 de la lista 0x6CC3; lo leen p00:54BC
;   (2 bytes)
;   0x6cb1..0x6cb3  (2 bytes)
DATA_colores_6CB1:
	defb 009h,000h	; 6cb1

; ----------------------------------------------------------------------
; DATOS colores_6CB3: 4 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 7 de la lista 0x6CC3; se solapan 4
;   bloques: (colores_6CB5 6CB5-6CB9) (colores_6CB7 6CB7-6CBB) (colores_6CB9
;   6CB9-6CBB); lo leen p00:54BC (8 bytes)
;   0x6cb3..0x6cbb  (8 bytes)
DATA_colores_6CB3:
	defb 005h,00ch,001h,006h	; 6cb3
	defb 004h,005h,002h,000h	; 6cb7

; ----------------------------------------------------------------------
; DATOS colores_6CBB: 4 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 11 de la lista 0x6CC3; lo leen p00:54BC
;   (4 bytes)
;   0x6cbb..0x6cbf  (4 bytes)
DATA_colores_6CBB:
	defb 002h,00eh,004h,006h	; 6cbb

; ----------------------------------------------------------------------
; DATOS colores_6CBF: 2 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 13 de la lista 0x6CC3; lo leen p00:54BC
;   (2 bytes)
;   0x6cbf..0x6cc1  (2 bytes)
DATA_colores_6CBF:
	defb 000h,001h	; 6cbf

; ----------------------------------------------------------------------
; DATOS colores_6CC1: 2 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 14 de la lista 0x6CC3; lo leen p00:54BC
;   (2 bytes)
;   0x6cc1..0x6cc3  (2 bytes)
DATA_colores_6CC1:
	defb 00dh,000h	; 6cc1

; ----------------------------------------------------------------------
; DATOS lista_6CC3: 32 fichas de dibujo de 6 bytes [paleta-tipo][VRAM lo
;   hi][caracteres][puntero] detras del numero (p00:4FA3, paletas en 0x6C87);
;   lo leen p00:54BC (193 bytes)
;   0x6cc3..0x6d84  (193 bytes)
DATA_lista_6CC3:
	defb 020h,0d0h,000h,094h,001h,084h	; 6cc3
	defb 06dh,0e0h,004h,094h,007h,08ch	; 6cc9
	defb 06dh,040h,020h,094h,006h,0c4h	; 6ccf
	defb 06dh,0e0h,038h,094h,005h,0f4h	; 6cd5
	defb 06dh,040h,04ch,094h,002h,01ch	; 6cdb
	defb 06eh,0e0h,064h,0cch,002h,02ch	; 6ce1
	defb 06eh,080h,054h,094h,00ch,03ch	; 6ce7
	defb 06eh,081h,004h,098h,001h,094h	; 6ced
	defb 06eh,030h,008h,098h,006h,09ch	; 6cf3
	defb 06eh,031h,020h,098h,006h,09ch	; 6cf9
	defb 06eh,000h,038h,098h,00dh,0cch	; 6cff
	defb 06eh,001h,06ch,098h,00ah,0e4h	; 6d05
	defb 06eh,0a0h,014h,09ch,001h,034h	; 6d0b
	defb 06fh,0a1h,018h,09ch,001h,034h	; 6d11
	defb 06fh,0b0h,01ch,09ch,003h,03ch	; 6d17
	defb 06fh,050h,028h,09ch,001h,054h	; 6d1d
	defb 06fh,060h,02ch,09ch,001h,05ch	; 6d23
	defb 06fh,012h,030h,09ch,00ch,064h	; 6d29
	defb 06fh,013h,064h,09ch,004h,0e4h	; 6d2f
	defb 06fh,042h,074h,09ch,001h,024h	; 6d35
	defb 070h,0b2h,078h,09ch,001h,034h	; 6d3b
	defb 070h,0b3h,07ch,09ch,001h,034h	; 6d41
	defb 070h,092h,000h,0a0h,007h,044h	; 6d47
	defb 070h,093h,01ch,0a0h,005h,094h	; 6d4d
	defb 070h,002h,024h,0a0h,00eh,0b4h	; 6d53
	defb 070h,003h,05ch,0a0h,007h,024h	; 6d59
	defb 071h,022h,078h,0a0h,002h,094h	; 6d5f
	defb 071h,023h,000h,0a4h,002h,094h	; 6d65
	defb 071h,082h,008h,0a4h,01dh,0b4h	; 6d6b
	defb 071h,083h,07ch,0a4h,017h,014h	; 6d71
	defb 072h,072h,058h,0a8h,004h,084h	; 6d77
	defb 073h,073h,068h,0a8h,004h,084h	; 6d7d
	defb 073h	; 6d83

; ----------------------------------------------------------------------
; DATOS dibujo_6D84: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 0 de la lista 0x6CC3 (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:54BC (8 bytes)
;   0x6d84..0x6d8c  (8 bytes)
DATA_dibujo_6D84:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 6d84  ........

; ----------------------------------------------------------------------
; DATOS dibujo_6D8C: 7 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 1 de la lista 0x6CC3 (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:54BC (56 bytes)
;   0x6d8c..0x6dc4  (56 bytes)
DATA_dibujo_6D8C:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 6d8c  ........
	defb 0ffh,0e7h,0f7h,0f7h,0f7h,0e3h,0ffh,0ffh	; 6d94  ........
	defb 0ffh,0e3h,0fbh,0e3h,0efh,0e3h,0ffh,0ffh	; 6d9c  ........
	defb 0ffh,0e3h,0fbh,0e3h,0fbh,0e3h,0ffh,0ffh	; 6da4  ........
	defb 0ffh,0ebh,0ebh,0e3h,0fbh,0fbh,0ffh,0ffh	; 6dac  ........
	defb 0ffh,0e3h,0efh,0e3h,0fbh,0e3h,0ffh,0ffh	; 6db4  ........
	defb 0ffh,0e3h,0efh,0e3h,0ebh,0e3h,0ffh,0ffh	; 6dbc  ........

; ----------------------------------------------------------------------
; DATOS dibujo_6DC4: 6 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 2 de la lista 0x6CC3 (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:54BC (48 bytes)
;   0x6dc4..0x6df4  (48 bytes)
DATA_dibujo_6DC4:
	defb 0e6h,0e4h,0c9h,0c3h,087h,087h,023h,031h	; 6dc4  ......#1
	defb 071h,0c0h,0cch,099h,099h,033h,032h,086h	; 6dcc  q....32.
	defb 0cch,0cch,089h,089h,023h,023h,066h,066h	; 6dd4  ....##ff
	defb 0e3h,0c3h,093h,093h,033h,003h,072h,072h	; 6ddc  ....3.rr
	defb 0ceh,0cch,08dh,08ah,02ah,024h,064h,06ch	; 6de4  ....*$dl
	defb 019h,039h,033h,073h,067h,0e7h,0cfh,0cfh	; 6dec  .93sg...

; ----------------------------------------------------------------------
; DATOS dibujo_6DF4: 5 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 3 de la lista 0x6CC3 (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:54BC (40 bytes)
;   0x6df4..0x6e1c  (40 bytes)
DATA_dibujo_6DF4:
	defb 0ffh,0e3h,0fbh,0fbh,0f7h,0f7h,0ffh,0ffh	; 6df4  ........
	defb 0ffh,0e3h,0ebh,0e3h,0ebh,0e3h,0ffh,0ffh	; 6dfc  ........
	defb 0ffh,0e3h,0ebh,0e3h,0fbh,0e3h,0ffh,0ffh	; 6e04  ........
	defb 0ffh,0d1h,0d5h,0d5h,0d5h,0d1h,0ffh,0ffh	; 6e0c  ........
	defb 0ffh,0c7h,0dbh,0c7h,0dbh,0dbh,0ffh,0ffh	; 6e14  ........

; ----------------------------------------------------------------------
; DATOS dibujo_6E1C: 2 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 4 de la lista 0x6CC3 (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:54BC (16 bytes)
;   0x6e1c..0x6e2c  (16 bytes)
DATA_dibujo_6E1C:
	defb 0feh,0feh,0fch,0f0h,0e1h,0e1h,0feh,0feh	; 6e1c  ........
	defb 01fh,01fh,021h,0e1h,0c3h,00fh,01fh,01fh	; 6e24  ..!.....

; ----------------------------------------------------------------------
; DATOS dibujo_6E2C: 2 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 5 de la lista 0x6CC3 (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:54BC (16 bytes)
;   0x6e2c..0x6e3c  (16 bytes)
DATA_dibujo_6E2C:
	defb 0ffh,0e3h,0ebh,0ebh,0ebh,0e3h,0ffh,0ffh	; 6e2c  ........
	defb 0ffh,0e7h,0e7h,0ffh,0e7h,0e7h,0ffh,0ffh	; 6e34  ........

; ----------------------------------------------------------------------
; DATOS dibujo_6E3C: 12 caracteres de 8x8 a 1 bit por punto (8 bytes cada
;   uno), ficha 6 de la lista 0x6CC3 (p00:4FA3, tipo 0 en p00:4FDD); se
;   solapan 2 bloques: (dibujo_6E94 6E94-6E9C); lo leen p00:54BC (96 bytes)
;   0x6e3c..0x6e9c  (96 bytes)
DATA_dibujo_6E3C:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 6e3c  ........
	defb 055h,0aah,055h,0aah,055h,0aah,055h,0aah	; 6e44  U.U.U.U.
	defb 0ffh,0aah,055h,0aah,055h,0aah,055h,0aah	; 6e4c  ..U.U.U.
	defb 055h,0aah,055h,0aah,055h,0aah,054h,0a0h	; 6e54  U.U.U.T.
	defb 055h,0aah,055h,0aah,050h,080h,000h,000h	; 6e5c  U.U.P...
	defb 055h,0a8h,040h,000h,000h,000h,000h,000h	; 6e64  U.@.....
	defb 055h,00ah,001h,000h,000h,000h,000h,000h	; 6e6c  U.......
	defb 055h,0aah,055h,02ah,005h,000h,000h,000h	; 6e74  U.U*....
	defb 055h,0aah,055h,0aah,055h,0aah,015h,002h	; 6e7c  U.U.U...
	defb 0f5h,0aah,055h,0aah,055h,0aah,055h,0aah	; 6e84  ..U.U.U.
	defb 05fh,0aah,055h,0aah,055h,0aah,055h,0aah	; 6e8c  _.U.U.U.
	defb 000h,000h,000h,000h,000h,000h,000h,003h	; 6e94  ........

; ----------------------------------------------------------------------
; DATOS dibujo_6E9C: 6 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 8 de la lista 0x6CC3 (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:54BC (48 bytes)
;   0x6e9c..0x6ecc  (48 bytes)
DATA_dibujo_6E9C:
	defb 000h,000h,000h,080h,080h,080h,080h,080h	; 6e9c  ........
	defb 0ffh,080h,080h,080h,080h,080h,000h,000h	; 6ea4  ........
	defb 03fh,000h,000h,000h,000h,000h,001h,001h	; 6eac  ?.......
	defb 0c0h,0ffh,000h,000h,000h,000h,000h,000h	; 6eb4  ........
	defb 000h,007h,004h,004h,008h,008h,008h,008h	; 6ebc  ........
	defb 010h,010h,010h,010h,010h,020h,020h,020h	; 6ec4  .....

; ----------------------------------------------------------------------
; DATOS dibujo_6ECC: 13 caracteres de 8x8 a 1 bit por punto (8 bytes cada
;   uno), ficha 10 de la lista 0x6CC3 (p00:4FA3, tipo 0 en p00:4FDD); se
;   solapan 2 bloques: (dibujo_6EE4 6EE4-6F34); lo leen p00:54BC (104 bytes)
;   0x6ecc..0x6f34  (104 bytes)
DATA_dibujo_6ECC:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 6ecc  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 6ed4  ........
	defb 0f3h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 6edc  ........
	defb 040h,0a0h,040h,0a0h,040h,0a0h,040h,0a0h	; 6ee4  @.@.@.@.
	defb 040h,0a0h,040h,0a0h,040h,0a0h,050h,0a8h	; 6eec  @.@.@.P.
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,057h,0aah	; 6ef4  ......W.
	defb 0d0h,0a8h,0d4h,0eah,0f5h,0fah,0fdh,0fah	; 6efc  ........
	defb 055h,0aah,055h,0a0h,000h,000h,000h,000h	; 6f04  U.U.....
	defb 055h,0aah,040h,000h,000h,000h,000h,000h	; 6f0c  U.@.....
	defb 0fdh,0fah,0f5h,0fah,0f5h,0fah,0fdh,07eh	; 6f14  .......~
	defb 03fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 6f1c  ?.......
	defb 0ffh,0feh,0fdh,0fah,0fdh,0fah,0fdh,0feh	; 6f24  ........
	defb 0d5h,0aah,0d4h,0a8h,050h,0a8h,050h,0a0h	; 6f2c  ....P.P.

; ----------------------------------------------------------------------
; DATOS dibujo_6F34: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 12 de la lista 0x6CC3 (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:54BC (8 bytes)
;   0x6f34..0x6f3c  (8 bytes)
DATA_dibujo_6F34:
	defb 000h,000h,000h,000h,000h,000h,000h,00fh	; 6f34  ........

; ----------------------------------------------------------------------
; DATOS dibujo_6F3C: 3 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 14 de la lista 0x6CC3 (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:54BC (24 bytes)
;   0x6f3c..0x6f54  (24 bytes)
DATA_dibujo_6F3C:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 6f3c  ........
	defb 0ffh,0ffh,000h,000h,000h,000h,000h,000h	; 6f44  ........
	defb 0ffh,000h,000h,000h,000h,000h,000h,000h	; 6f4c  ........

; ----------------------------------------------------------------------
; DATOS dibujo_6F54: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 15 de la lista 0x6CC3 (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:54BC (8 bytes)
;   0x6f54..0x6f5c  (8 bytes)
DATA_dibujo_6F54:
	defb 0ffh,000h,000h,000h,000h,000h,000h,0ffh	; 6f54  ........

; ----------------------------------------------------------------------
; DATOS dibujo_6F5C: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 16 de la lista 0x6CC3 (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:54BC (8 bytes)
;   0x6f5c..0x6f64  (8 bytes)
DATA_dibujo_6F5C:
	defb 0ffh,07fh,007h,001h,03fh,0ffh,0ffh,0ffh	; 6f5c  ....?...

; ----------------------------------------------------------------------
; DATOS dibujo_6F64: 12 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 17 de la lista 0x6CC3 (p00:4FA3, tipo 2 en p00:4FDD); se
;   solapan 2 bloques: (dibujo_6FE4 6FE4-7024); lo leen p00:54BC (192 bytes)
;   0x6f64..0x7024  (192 bytes)
DATA_dibujo_6F64:
	defb 00ch,000h,01ch,000h,01ch,010h,00ch,000h,00ch,000h,00ch,000h,00ch,000h,01eh,000h	; 6f64  ................
	defb 078h,000h,0fdh,030h,0cdh,000h,0cdh,0c0h,01dh,004h,079h,008h,0f5h,010h,0fdh,001h	; 6f74  x..0......y.....
	defb 0f0h,000h,0f8h,060h,098h,000h,098h,000h,099h,000h,099h,000h,099h,000h,0f9h,008h	; 6f84  ...`............
	defb 000h,000h,000h,000h,000h,000h,000h,000h,0dch,000h,0feh,000h,0feh,048h,0b6h,000h	; 6f94  .............H..
	defb 0f7h,0efh,0f7h,0efh,0f7h,0efh,0e7h,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh	; 6fa4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh	; 6fb4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,000h,000h,000h	; 6fc4  ................
	defb 0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 6fd4  ................
	defb 0efh,09fh,0e0h,09fh,0ffh,0c0h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 6fe4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0c0h,0e0h,09fh,0efh,09fh	; 6ff4  ................
	defb 0efh,09fh,0efh,09fh,0efh,09fh,0efh,09fh,0efh,08fh,0bfh,0c0h,0c0h,0ffh,0ffh,0ffh	; 7004  ................
	defb 0efh,09fh,0efh,09fh,0efh,09fh,0efh,09fh,0efh,09fh,0efh,09fh,0efh,09fh,0efh,09fh	; 7014  ................

; ----------------------------------------------------------------------
; DATOS dibujo_7024: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 19 de la lista 0x6CC3 (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:54BC (16 bytes)
;   0x7024..0x7034  (16 bytes)
DATA_dibujo_7024:
	defb 0efh,008h,0e8h,00fh,0e8h,00fh,0e8h,00fh,0e8h,00fh,0e8h,00fh,0ebh,00ch,0efh,008h	; 7024  ................

; ----------------------------------------------------------------------
; DATOS dibujo_7034: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 20 de la lista 0x6CC3 (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:54BC (16 bytes)
;   0x7034..0x7044  (16 bytes)
DATA_dibujo_7034:
	defb 07fh,09fh,0ffh,000h,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 7034  ................

; ----------------------------------------------------------------------
; DATOS dibujo_7044: 7 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 22 de la lista 0x6CC3 (p00:4FA3, tipo 2 en p00:4FDD); se
;   solapan 4 bloques: (dibujo_7094 7094-70E4) (dibujo_70B4 70B4-7194)
;   (dibujo_7124 7124-7194); lo leen p00:54BC (336 bytes)
;   0x7044..0x7194  (336 bytes)
DATA_dibujo_7044:
	defb 01eh,0ffh,000h,0ffh,0ffh,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h,000h	; 7044  ................
	defb 0fch,0ffh,000h,0ffh,0ffh,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h,000h	; 7054  ................
	defb 0f1h,0ffh,000h,0ffh,0ffh,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h,000h	; 7064  ................
	defb 0b6h,0ffh,000h,0ffh,0ffh,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h,000h	; 7074  ................
	defb 000h,0ffh,000h,0ffh,0ffh,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h,000h	; 7084  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,00fh,0ffh,0f0h,0f0h,00fh,000h	; 7094  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,00fh,0ffh,0f0h,0f0h,00fh,000h,0ffh,000h,0ffh,000h	; 70a4  ................
	defb 0f3h,030h,0cfh,0c0h,03fh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 70b4  .0..?...........
	defb 0fah,0c0h,034h,030h,0cch,00ch,0f3h,003h,0e8h,000h,0f4h,000h,0fah,000h,0ffh,000h	; 70c4  ..40............
	defb 05fh,003h,02ch,00ch,033h,030h,0cfh,0c0h,017h,000h,02fh,000h,05fh,003h,0bch,00ch	; 70d4  _.,.30..../._...
	defb 0ffh,003h,0fch,00ch,0f3h,030h,0cfh,0c0h,03fh,000h,0ffh,0c0h,03fh,033h,0cch,00ch	; 70e4  .....0..?...?3..
	defb 0ffh,003h,0fch,00ch,0f3h,030h,0cfh,0c0h,03fh,000h,0ffh,000h,0ffh,003h,0fch,00ch	; 70f4  .....0..?.......
	defb 03fh,000h,0ffh,000h,0ffh,003h,0fch,00ch,0f3h,030h,0cfh,0c0h,03fh,000h,0ffh,000h	; 7104  ?........0..?...
	defb 015h,000h,0ffh,000h,0ffh,003h,0fch,00ch,0f3h,030h,0cfh,0c0h,03fh,000h,0ffh,000h	; 7114  .........0..?...
	defb 0ffh,0c0h,03fh,030h,0cfh,00ch,0f3h,003h,0fch,000h,0fah,000h,0f5h,000h,0eah,000h	; 7124  ..?0............
	defb 0f5h,000h,0aah,000h,055h,000h,0aah,000h,0d5h,0c0h,038h,030h,04ch,00ch,083h,003h	; 7134  ....U.....80L...
	defb 001h,001h,001h,001h,001h,001h,002h,002h,002h,002h,082h,002h,042h,002h,0a2h,002h	; 7144  ............B...
	defb 057h,003h,0aah,000h,055h,000h,0aah,000h,0d5h,000h,0eah,000h,0fdh,000h,0feh,000h	; 7154  W...U...........
	defb 0ffh,0ffh,000h,000h,000h,000h,0a8h,000h,055h,000h,0aah,000h,055h,000h,0aah,000h	; 7164  ........U...U...
	defb 0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,0aah,000h,055h,000h,0aah,000h	; 7174  ............U...
	defb 0ffh,003h,0fch,00ch,0f3h,030h,0cfh,0c0h,03fh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 7184  .....0..?.......

; ----------------------------------------------------------------------
; DATOS dibujo_7194: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 26 de la lista 0x6CC3 (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:54BC (32 bytes)
;   0x7194..0x71b4  (32 bytes)
DATA_dibujo_7194:
	defb 000h,0ffh,0c0h,0ffh,040h,0ffh,040h,0ffh,05fh,0ffh,09fh,0ffh,087h,0e7h,099h,0e1h	; 7194  ....@.@._.......
	defb 086h,0f8h,081h,0feh,080h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 71a4  ................

; ----------------------------------------------------------------------
; DATOS dibujo_71B4: 29 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 28 de la lista 0x6CC3 (p00:4FA3, tipo 2 en p00:4FDD); se
;   solapan 2 bloques: (dibujo_7214 7214-7384); lo leen p00:54BC (464 bytes)
;   0x71b4..0x7384  (464 bytes)
DATA_dibujo_71B4:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h	; 71b4  ................
	defb 000h,000h,000h,000h,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 71c4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0f0h,0ffh,00fh,0f0h,0f5h,000h,0aah,000h,055h,000h,0aah,000h	; 71d4  ............U...
	defb 0f0h,0ffh,00fh,0f0h,0f5h,000h,0aah,000h,055h,000h,0aah,000h,055h,000h,0aah,000h	; 71e4  ........U...U...
	defb 0ffh,0ffh,0ffh,0ffh,00fh,0ffh,0f0h,00fh,05fh,000h,0aah,000h,055h,000h,0aah,000h	; 71f4  ........_...U...
	defb 00fh,0ffh,0f0h,00fh,05fh,000h,0aah,000h,055h,000h,0aah,000h,055h,000h,0aah,000h	; 7204  ...._...U...U...
	defb 030h,0c0h,0cch,0f0h,0f3h,0fch,0fch,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 7214  0...............
	defb 000h,000h,000h,000h,000h,000h,003h,000h,00ch,003h,033h,00fh,0cfh,03fh,03fh,0ffh	; 7224  ..........3..??.
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,03fh,03fh,00fh,00fh,003h,003h,000h	; 7234  .........??.....
	defb 0ffh,03fh,03fh,00fh,00fh,003h,003h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 7244  .??.............
	defb 0d5h,0ffh,0fah,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0c0h,0c0h,000h	; 7254  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,003h,003h,01fh,01fh,07eh,07fh	; 7264  ..............~.
	defb 000h,000h,000h,000h,000h,000h,000h,000h,07fh,07fh,0ffh,0ffh,0d5h,0ffh,0aah,0ffh	; 7274  ................
	defb 000h,000h,001h,001h,001h,001h,001h,003h,001h,003h,001h,003h,002h,001h,001h,000h	; 7284  ................
	defb 0bfh,07fh,04fh,03fh,031h,00fh,00eh,001h,001h,000h,000h,000h,000h,000h,000h,000h	; 7294  ..O?1...........
	defb 0d5h,0ffh,0ffh,0ffh,0ffh,0ffh,01fh,0ffh,0e0h,01fh,01fh,000h,000h,000h,000h,000h	; 72a4  ................
	defb 000h,000h,000h,000h,000h,000h,007h,000h,038h,007h,0c7h,03fh,03fh,0ffh,0feh,0ffh	; 72b4  ........8..??...
	defb 000h,000h,00fh,000h,0f0h,00fh,00fh,0ffh,0ffh,0ffh,0fah,0ffh,0d5h,0ffh,0aah,0ffh	; 72c4  ................
	defb 03fh,000h,0c0h,03fh,03fh,0ffh,0ffh,0ffh,0ffh,0ffh,0aah,0ffh,055h,0ffh,0aah,0ffh	; 72d4  ?..??.......U...
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,07fh,0feh,07fh,0ffh,07fh,0feh,07fh	; 72e4  ................
	defb 0ffh,07fh,0feh,07fh,0fdh,07fh,0feh,07fh,0fdh,07fh,0feh,07fh,07dh,03fh,07eh,03fh	; 72f4  ............}?~?
	defb 07fh,03fh,07eh,03fh,07fh,03fh,07eh,03fh,07fh,03fh,03fh,01fh,03fh,01fh,03fh,01fh	; 7304  .?~?.?~?.??.?.?.
	defb 01fh,00fh,01fh,00fh,00fh,007h,007h,003h,007h,003h,003h,001h,001h,000h,001h,000h	; 7314  ................
	defb 0ffh,07fh,07fh,01fh,01fh,007h,007h,001h,001h,000h,000h,000h,000h,000h,000h,000h	; 7324  ................
	defb 055h,0ffh,0eah,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,07fh,07fh,00fh,00fh,000h,000h,000h	; 7334  U...............
	defb 0fdh,07fh,0feh,07fh,07fh,03fh,03fh,01fh,01fh,00fh,00fh,007h,007h,001h,001h,000h	; 7344  .....??.........
	defb 055h,0ffh,0aah,0ffh,055h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h	; 7354  U...U...........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0bfh,07fh,0bfh,07fh,0bfh,07fh,0bfh,07fh	; 7364  ................
	defb 0beh,07fh,0bdh,07fh,0beh,07fh,0bdh,07fh,0beh,07fh,0bfh,07fh,0bfh,07fh,0bfh,07fh	; 7374  ................

; ----------------------------------------------------------------------
; DATOS dibujo_7384: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 30 de la lista 0x6CC3 (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:54BC (64 bytes)
;   0x7384..0x73c4  (64 bytes)
DATA_dibujo_7384:
	defb 0c0h,0c0h,030h,0f0h,0cch,03ch,0f3h,0cfh,03ch,0f3h,00fh,0fch,003h,0ffh,000h,0ffh	; 7384  ..0..<..<.......
	defb 000h,000h,000h,000h,000h,000h,000h,000h,0c0h,0c0h,030h,0f0h,0cch,03ch,0f3h,0cfh	; 7394  ..........0..<..
	defb 03ch,0cfh,0f0h,03fh,0f0h,0cfh,03ch,0f3h,00fh,0fch,003h,0ffh,000h,0ffh,000h,0ffh	; 73a4  <..?..<.........
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0c0h,03fh,0f0h,0cfh,030h,0ffh	; 73b4  ...........?..0.

; ----------------------------------------------------------------------
; DATOS paletas_73C4: 2 punteros a los colores de cada paleta (p00:556D desde
;   p00:4FB0), para la lista 0x73D6; lo leen p00:54C5 (4 bytes)
;   0x73c4..0x73c8  (4 bytes)
DATA_paletas_73C4:
	defw 073cah,073ceh	; 73c4  -> DATA_colores_73CA 0x73ce

; ----------------------------------------------------------------------
; DATOS sin identificar  0x73c8..0x73ca  (2 bytes)
DATA_73C8:
	defb 0d2h,073h	; 73c8

; ----------------------------------------------------------------------
; DATOS colores_73CA: 8 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 0 de la lista 0x73D6; se solapan 2
;   bloques: (colores_73CE 73CE-73D6); lo leen p00:54C5 (12 bytes)
;   0x73ca..0x73d6  (12 bytes)
DATA_colores_73CA:
	defb 001h,006h,005h,00dh,002h,004h,00eh,00fh	; 73ca  ........
	defb 007h,00ah,001h,009h	; 73d2

; ----------------------------------------------------------------------
; DATOS lista_73D6: 4 fichas de dibujo de 6 bytes [paleta-tipo][VRAM lo
;   hi][caracteres][puntero] detras del numero (p00:4FA3, paletas en 0x73C4);
;   lo leen p00:54C5 (25 bytes)
;   0x73d6..0x73ef  (25 bytes)
DATA_lista_73D6:
	defb 004h,004h,000h,0ach,009h,0efh	; 73d6
	defb 073h,005h,024h,0ach,007h,01fh	; 73dc
	defb 074h,014h,040h,0ach,00ah,0c7h	; 73e2
	defb 074h,015h,068h,0ach,00ah,0c7h	; 73e8
	defb 074h	; 73ee

; ----------------------------------------------------------------------
; DATOS dibujo_73EF: 9 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 0 de la lista 0x73D6 (p00:4FA3, tipo 4 en p00:4FDD); se
;   solapan 2 bloques: (dibujo_741F 741F-74C7); lo leen p00:54C5 (216 bytes)
;   0x73ef..0x74c7  (216 bytes)
DATA_dibujo_73EF:
	defb 0ffh,00fh,0ffh,00fh,0f0h,00fh,000h,0ffh,000h,000h,0ffh,000h,0f0h,00fh,0f0h,0ffh,000h,00fh,05fh,000h,000h,0aah,000h,000h	; 73ef  .................._.....
	defb 0ffh,0f0h,0ffh,0f0h,00fh,0f0h,000h,0ffh,000h,000h,0ffh,000h,00fh,0f0h,00fh,0ffh,000h,0f0h,0f5h,000h,000h,0aah,000h,000h	; 7407  ........................
	defb 0aah,055h,0aah,0ffh,000h,0ffh,0ffh,03fh,0c0h,0c0h,03fh,0ffh,0ffh,03fh,0ffh,0ffh,000h,0ffh,0aah,055h,0aah,055h,0aah,055h	; 741f  .U.....?..?..?.....U.U.U
	defb 0aah,055h,0aah,0edh,092h,06dh,0fah,0e5h,01ah,09dh,0f2h,07dh,07ah,0e5h,0fah,0fdh,082h,0fdh,0eah,015h,0eah,0d0h,02fh,0d0h	; 7437  .U...m.....}z........./.
	defb 000h,000h,0ffh,00fh,00fh,0ffh,0ffh,0f0h,0ffh,0f0h,00fh,0f0h,000h,0ffh,000h,000h,0ffh,000h,00fh,0f0h,00fh,0ffh,000h,0f0h	; 744f  ........................
	defb 0c0h,03fh,040h,0c0h,03fh,040h,0c0h,03fh,040h,080h,07fh,080h,003h,0ffh,000h,00fh,0fch,003h,03ch,0f3h,00ch,0f0h,0cfh,030h	; 7467  .?@.?@.?@.........<....0
	defb 0f0h,000h,0c0h,03ch,0c0h,030h,00fh,0f0h,00ch,003h,0fch,003h,0c0h,0ffh,000h,0f0h,03fh,0c0h,03ch,0cfh,030h,00fh,0f3h,00ch	; 747f  ...<.0..........?.<.0...
	defb 05fh,0aeh,051h,0ffh,03fh,0c0h,0ffh,0ffh,000h,03fh,0ffh,0c0h,0ceh,0ffh,031h,0f1h,03fh,0cfh,07fh,08eh,073h,0afh,053h,0ach	; 7497  _.Q.?....?....1.?...s.S.
	defb 0abh,055h,0aah,0ffh,007h,0f8h,0ffh,01fh,0e0h,0e7h,03fh,0f8h,0f9h,01fh,0feh,0feh,007h,0ffh,0abh,055h,0abh,055h,0aah,055h	; 74af  .U........?........U.U.U

; ----------------------------------------------------------------------
; DATOS dibujo_74C7: 10 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 2 de la lista 0x73D6 (p00:4FA3, tipo 4 en p00:4FDD); lo leen
;   p00:54C5 (240 bytes)
;   0x74c7..0x75b7  (240 bytes)
DATA_dibujo_74C7:
	defb 007h,01fh,0e7h,003h,03fh,0c3h,003h,0ffh,082h,03fh,0c1h,0c0h,07fh,080h,080h,000h,0ffh,000h,000h,0ffh,000h,000h,000h,000h	; 74c7  ....?....?..............
	defb 0e6h,0f8h,0e1h,0ffh,0fch,000h,0fch,0ffh,003h,0f0h,0f3h,00fh,0e0h,0e3h,01fh,000h,0ffh,000h,000h,0ffh,000h,000h,000h,000h	; 74df  ........................
	defb 007h,01fh,0e7h,003h,03fh,0c3h,003h,0ffh,082h,03fh,0c1h,0c0h,07fh,080h,080h,0ffh,080h,000h,000h,0ffh,000h,000h,0ffh,000h	; 74f7  ....?....?..............
	defb 0cfh,0c1h,0f0h,0ffh,0e0h,0f0h,000h,0ffh,000h,000h,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 750f  ........................
	defb 067h,01fh,087h,0ffh,03fh,000h,03fh,0ffh,0c0h,00fh,0cfh,0f0h,007h,0c7h,0f8h,003h,0c3h,0bch,027h,0e7h,098h,000h,0ffh,000h	; 7527  g...?.?...........'.....
	defb 067h,01fh,087h,0ffh,03fh,000h,03fh,0ffh,0c0h,00fh,0cfh,0f0h,007h,0c7h,0f8h,003h,0c3h,0bch,027h,0e7h,098h,078h,0ffh,006h	; 753f  g...?.?...........'..x..
	defb 0e0h,0f8h,0e7h,0c0h,0fch,0c3h,0c0h,0ffh,041h,0fch,083h,003h,0feh,001h,001h,0ffh,001h,000h,00fh,081h,070h,007h,081h,078h	; 7557  ........A...........p..x
	defb 080h,07fh,01fh,087h,07fh,03fh,00fh,0ffh,03fh,080h,078h,03fh,0c8h,038h,037h,0e8h,018h,017h,0fch,01ch,003h,0ffh,01fh,007h	; 756f  .....?..?.x?.87.........
	defb 0cfh,0c1h,0f0h,0ffh,0e0h,0f0h,0fch,0e3h,0f4h,0ffh,0e0h,07ch,07fh,040h,0b8h,0ffh,0c0h,030h,0f0h,088h,077h,0f0h,088h,0f7h	; 7587  ...........|.@...0..w...
	defb 067h,01fh,087h,0ffh,03fh,000h,03fh,0ffh,0c0h,00fh,0cfh,0f0h,000h,0ffh,000h,000h,0ffh,000h,000h,000h,000h,000h,000h,000h	; 759f  g...?.?.................

; ----------------------------------------------------------------------
; DATOS paletas_75B7: 12 punteros a los colores de cada paleta (p00:556D desde
;   p00:4FB0), para la lista 0x75EC; lo leen p00:54CE (24 bytes)
;   0x75b7..0x75cf  (24 bytes)
DATA_paletas_75B7:
	defw 075d1h,075d2h,075d5h,075d8h,075d9h,075dah,075dch,075deh	; 75b7
	defw 075e0h,075e2h,075e4h,075e6h	; 75c7  -> DATA_colores_75E0 0x75e2 0x75e4 0x75e6

; ----------------------------------------------------------------------
; DATOS sin identificar  0x75cf..0x75d1  (2 bytes)
DATA_75CF:
	defb 0eah,075h	; 75cf

; ----------------------------------------------------------------------
; DATOS colores_75D1: 8 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 0 de la lista 0x75EC; se solapan 4
;   bloques: (colores_75D8 75D8-75DC) (colores_75DA 75DA-75DE) (colores_75DC
;   75DC-75E0); lo leen p00:54CE (15 bytes)
;   0x75d1..0x75e0  (15 bytes)
DATA_colores_75D1:
	defb 002h,004h,005h,00fh,001h,006h,007h,00ah	; 75d1  ........
	defb 00dh,001h,006h,004h,005h,006h,00fh	; 75d9

; ----------------------------------------------------------------------
; DATOS colores_75E0: 4 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 8 de la lista 0x75EC; se solapan 4
;   bloques: (colores_75E2 75E2-75E6) (colores_75E4 75E4-75EC) (colores_75E6
;   75E6-75EA); lo leen p00:54CE (12 bytes)
;   0x75e0..0x75ec  (12 bytes)
DATA_colores_75E0:
	defb 002h,00dh,00eh,00fh	; 75e0
	defb 002h,004h,001h,007h	; 75e4
	defb 00eh,00fh,009h,00ah	; 75e8

; ----------------------------------------------------------------------
; DATOS lista_75EC: 18 fichas de dibujo de 6 bytes [paleta-tipo][VRAM lo
;   hi][caracteres][puntero] detras del numero (p00:4FA3, paletas en 0x75B7);
;   lo leen p00:54CE (109 bytes)
;   0x75ec..0x7659  (109 bytes)
DATA_lista_75EC:
	defb 012h,050h,000h,0b4h,002h,059h	; 75ec
	defb 076h,080h,008h,0b4h,001h,069h	; 75f2
	defb 076h,050h,00ch,0b4h,002h,071h	; 75f8
	defb 076h,032h,018h,0b4h,008h,081h	; 75fe
	defb 076h,082h,038h,0b4h,004h,001h	; 7604
	defb 077h,083h,048h,0b4h,003h,011h	; 760a
	defb 077h,092h,054h,0b4h,002h,041h	; 7610
	defb 077h,093h,05ch,0b4h,002h,041h	; 7616
	defb 077h,052h,064h,0b4h,001h,061h	; 761c
	defb 077h,053h,068h,0b4h,001h,061h	; 7622
	defb 077h,062h,06ch,0b4h,001h,071h	; 7628
	defb 077h,063h,070h,0b4h,001h,071h	; 762e
	defb 077h,0b2h,074h,0b4h,001h,081h	; 7634
	defb 077h,0b3h,078h,0b4h,001h,081h	; 763a
	defb 077h,004h,000h,0b8h,003h,091h	; 7640
	defb 077h,005h,00ch,0b8h,002h,0a9h	; 7646
	defb 077h,0a4h,014h,0b8h,007h,0d9h	; 764c
	defb 077h,0a5h,030h,0b8h,007h,0d9h	; 7652
	defb 077h	; 7658

; ----------------------------------------------------------------------
; DATOS dibujo_7659: 2 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 0 de la lista 0x75EC (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:54CE (16 bytes)
;   0x7659..0x7669  (16 bytes)
DATA_dibujo_7659:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 7659  ........
	defb 0ffh,000h,000h,000h,000h,000h,000h,000h	; 7661  ........

; ----------------------------------------------------------------------
; DATOS dibujo_7669: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 1 de la lista 0x75EC (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:54CE (8 bytes)
;   0x7669..0x7671  (8 bytes)
DATA_dibujo_7669:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 7669  ........

; ----------------------------------------------------------------------
; DATOS dibujo_7671: 2 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 2 de la lista 0x75EC (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:54CE (16 bytes)
;   0x7671..0x7681  (16 bytes)
DATA_dibujo_7671:
	defb 0f9h,000h,000h,000h,000h,000h,000h,000h	; 7671  ........
	defb 0f8h,000h,000h,000h,000h,000h,000h,000h	; 7679  ........

; ----------------------------------------------------------------------
; DATOS dibujo_7681: 8 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0x75EC (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:54CE (128 bytes)
;   0x7681..0x7701  (128 bytes)
DATA_dibujo_7681:
	defb 000h,0ffh,000h,0ffh,001h,0ffh,003h,0feh,007h,0fch,007h,0fch,007h,0ffh,000h,0ffh	; 7681  ................
	defb 07ch,0c7h,07fh,0c7h,0ffh,088h,0ffh,038h,0ffh,071h,0ffh,047h,0f9h,08fh,0f9h,08fh	; 7691  |......8.q.G....
	defb 03fh,0e6h,03fh,0e4h,0ffh,0c9h,0ffh,0c3h,0ffh,087h,0ffh,083h,0ffh,033h,0ffh,039h	; 76a1  ?.?..........3.9
	defb 0ffh,071h,0ffh,0c0h,0ffh,0cch,0ffh,099h,0ffh,099h,0ffh,033h,0ffh,032h,0ffh,086h	; 76b1  .q.........3.2..
	defb 07fh,0cch,0ffh,0cch,0ffh,089h,0ffh,089h,0ffh,023h,0ffh,023h,0ffh,066h,0ffh,066h	; 76c1  .........#.#.f.f
	defb 0beh,0e3h,0feh,0c3h,0feh,093h,0feh,093h,0ffh,033h,0ffh,003h,0ffh,072h,0ffh,072h	; 76d1  .........3...r.r
	defb 07bh,0ceh,07fh,0cch,0ffh,08dh,0ffh,08ah,0ffh,02ah,0ffh,024h,0ffh,064h,0ffh,06ch	; 76e1  {........*.$.d.l
	defb 0ffh,019h,0ffh,039h,0feh,033h,0feh,073h,0fch,067h,0fch,0e7h,0f8h,0cfh,0f8h,0cfh	; 76f1  ...9.3.s.g......

; ----------------------------------------------------------------------
; DATOS dibujo_7701: 4 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 4 de la lista 0x75EC (p00:4FA3, tipo 2 en p00:4FDD); se
;   solapan 2 bloques: (dibujo_7711 7711-7741); lo leen p00:54CE (64 bytes)
;   0x7701..0x7741  (64 bytes)
DATA_dibujo_7701:
	defb 0ffh,000h,000h,0ffh,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh	; 7701  ................
	defb 0c0h,000h,030h,0c0h,0cch,0f0h,033h,0fch,00ch,0ffh,003h,0ffh,0c0h,0ffh,0f0h,0ffh	; 7711  ..0...3.........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,0c0h,000h,030h,0c0h,0cch,0f0h,033h,0fch	; 7721  ..........0...3.
	defb 03fh,0ffh,00fh,03fh,003h,00fh,000h,003h,000h,000h,000h,000h,000h,000h,000h,000h	; 7731  ?..?............

; ----------------------------------------------------------------------
; DATOS dibujo_7741: 2 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 6 de la lista 0x75EC (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:54CE (32 bytes)
;   0x7741..0x7761  (32 bytes)
DATA_dibujo_7741:
	defb 0ffh,003h,0ffh,000h,0ffh,000h,0ffh,000h,03fh,000h,00fh,0c0h,003h,0f0h,000h,0fch	; 7741  ........?.......
	defb 0ffh,0c0h,03fh,000h,00fh,0c0h,003h,0f0h,000h,0fch,000h,0ffh,000h,0ffh,000h,0ffh	; 7751  ..?.............

; ----------------------------------------------------------------------
; DATOS dibujo_7761: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 8 de la lista 0x75EC (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:54CE (16 bytes)
;   0x7761..0x7771  (16 bytes)
DATA_dibujo_7761:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0c0h,000h,030h,0c0h,0cch,0f0h	; 7761  ............0...

; ----------------------------------------------------------------------
; DATOS dibujo_7771: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 10 de la lista 0x75EC (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:54CE (16 bytes)
;   0x7771..0x7781  (16 bytes)
DATA_dibujo_7771:
	defb 0f0h,003h,03ch,000h,0cfh,0c0h,0f3h,0f0h,0fch,0fch,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 7771  ..<.............

; ----------------------------------------------------------------------
; DATOS dibujo_7781: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 12 de la lista 0x75EC (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:54CE (16 bytes)
;   0x7781..0x7791  (16 bytes)
DATA_dibujo_7781:
	defb 0fch,0ffh,0ffh,0ffh,0fbh,0ebh,0f8h,0e0h,0f8h,0e4h,0fch,0c6h,0fch,0eeh,01eh,09fh	; 7781  ................

; ----------------------------------------------------------------------
; DATOS dibujo_7791: 3 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 14 de la lista 0x75EC (p00:4FA3, tipo 4 en p00:4FDD); se
;   solapan 2 bloques: (dibujo_77A9 77A9-77D9); lo leen p00:54CE (72 bytes)
;   0x7791..0x77d9  (72 bytes)
DATA_dibujo_7791:
	defb 0ffh,000h,0ffh,0ffh,000h,000h,000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h	; 7791  ........................
	defb 00fh,0f0h,003h,0c3h,03ch,000h,0f0h,0cfh,000h,03ch,033h,000h,00fh,00ch,000h,003h,003h,000h,000h,000h,000h,000h,000h,000h	; 77a9  ....<....<3.............
	defb 000h,000h,0ffh,0c0h,000h,0ffh,0f0h,000h,03fh,03ch,0c0h,00fh,00fh,0f0h,003h,0c3h,03ch,000h,0f0h,0cfh,000h,0fch,0f3h,000h	; 77c1  ........?<......<.......

; ----------------------------------------------------------------------
; DATOS dibujo_77D9: 7 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 16 de la lista 0x75EC (p00:4FA3, tipo 4 en p00:4FDD); lo leen
;   p00:54CE (168 bytes)
;   0x77d9..0x7881  (168 bytes)
DATA_dibujo_77D9:
	defb 007h,0e1h,0f8h,0ffh,000h,0fch,0f8h,017h,0e8h,0f8h,01fh,0e0h,0f8h,01bh,0e4h,0fch,039h,0c6h,0fch,011h,0eeh,01eh,060h,09fh	; 77d9  ................9.....`.
	defb 001h,0f8h,006h,001h,0fch,0e2h,000h,0fch,0c3h,0f0h,0cch,033h,0f1h,0cch,032h,0f7h,0c8h,030h,0ffh,080h,078h,01fh,0e0h,0f8h	; 77f1  ...........3..2..0..x...
	defb 003h,0e3h,0fch,001h,0c1h,0feh,080h,041h,0feh,0bch,003h,0c0h,0beh,001h,0c0h,01fh,010h,0e1h,03fh,030h,0c1h,03fh,038h,0c1h	; 7809  .......A..........?0.?8.
	defb 0f8h,00bh,087h,0f8h,00fh,00fh,038h,02fh,0efh,0b9h,03eh,0ffh,0dfh,01dh,07eh,0efh,00ch,03fh,0efh,08eh,07fh,0eeh,0cfh,03fh	; 7821  ......8/..>...~..?.....?
	defb 030h,000h,0ffh,0c0h,000h,0ffh,003h,000h,0ffh,00fh,000h,0ffh,03eh,001h,0fch,0ffh,000h,0f1h,0ffh,030h,0c1h,03fh,038h,0c1h	; 7839  0...........>......0.?8.
	defb 0c0h,0c7h,03fh,080h,083h,07fh,001h,082h,07fh,03dh,0c0h,003h,07dh,080h,003h,0f8h,000h,087h,0fch,004h,083h,0fch,004h,083h	; 7851  ..?......=..}...........
	defb 007h,0e1h,0f8h,0ffh,000h,0fch,0f8h,007h,0f8h,0f8h,00fh,0f0h,0f8h,00bh,0f4h,0fch,009h,0f6h,0fch,011h,0eeh,01eh,060h,09fh	; 7869  ......................`.

; ----------------------------------------------------------------------
; DATOS paletas_7881: 12 punteros a los colores de cada paleta (p00:556D desde
;   p00:4FB0), para la lista 0x78B3; lo leen p00:54D7 (24 bytes)
;   0x7881..0x7899  (24 bytes)
DATA_paletas_7881:
	defw 07899h,0789bh,0789dh,0789fh,078a1h,078a3h,078a5h,078a7h	; 7881
	defw 078a9h,078abh,078adh,078afh	; 7891  -> 0x78a9 0x78ab 0x78ad DATA_colores_78AF

; ----------------------------------------------------------------------
; DATOS colores_7899: 4 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 0 de la lista 0x78B3; se solapan 4
;   bloques: (colores_789B 789B-789F) (colores_789D 789D-78A1) (colores_789F
;   789F-78A1); lo leen p00:54D7 (8 bytes)
;   0x7899..0x78a1  (8 bytes)
DATA_colores_7899:
	defb 00dh,00fh,002h,004h	; 7899
	defb 00eh,00fh,002h,00dh	; 789d

; ----------------------------------------------------------------------
; DATOS colores_78A1: 4 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 4 de la lista 0x78B3; se solapan 2
;   bloques: (colores_78A3 78A3-78A5); lo leen p00:54D7 (4 bytes)
;   0x78a1..0x78a5  (4 bytes)
DATA_colores_78A1:
	defb 009h,00eh,002h,00fh	; 78a1

; ----------------------------------------------------------------------
; DATOS colores_78A5: 2 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 6 de la lista 0x78B3; lo leen p00:54D7
;   (2 bytes)
;   0x78a5..0x78a7  (2 bytes)
DATA_colores_78A5:
	defb 002h,00eh	; 78a5

; ----------------------------------------------------------------------
; DATOS colores_78A7: 4 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 7 de la lista 0x78B3; se solapan 3
;   bloques: (colores_78A9 78A9-78AD) (colores_78AB 78AB-78AF); lo leen
;   p00:54D7 (8 bytes)
;   0x78a7..0x78af  (8 bytes)
DATA_colores_78A7:
	defb 001h,00dh,004h,005h	; 78a7
	defb 001h,006h,005h,00dh	; 78ab

; ----------------------------------------------------------------------
; DATOS colores_78AF: 4 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 11 de la lista 0x78B3; lo leen p00:54D7
;   (4 bytes)
;   0x78af..0x78b3  (4 bytes)
DATA_colores_78AF:
	defb 002h,004h,005h,00fh	; 78af

; ----------------------------------------------------------------------
; DATOS lista_78B3: 21 fichas de dibujo de 6 bytes [paleta-tipo][VRAM lo
;   hi][caracteres][puntero] detras del numero (p00:4FA3, paletas en 0x7881);
;   lo leen p00:54D7 (127 bytes)
;   0x78b3..0x7932  (127 bytes)
DATA_lista_78B3:
	defb 015h,020h,04ch,0b8h,005h,032h	; 78b3
	defb 079h,000h,060h,0b8h,004h,05ah	; 78b9
	defb 079h,050h,070h,0b8h,003h,07ah	; 78bf
	defb 079h,060h,07ch,0b8h,003h,092h	; 78c5
	defb 079h,040h,008h,0bch,001h,0aah	; 78cb
	defb 079h,070h,00ch,0bch,001h,0b2h	; 78d1
	defb 079h,030h,010h,0bch,001h,0bah	; 78d7
	defb 079h,080h,014h,0bch,003h,0c2h	; 78dd
	defb 079h,081h,020h,0bch,001h,0d2h	; 78e3
	defb 079h,090h,024h,0bch,00bh,0dah	; 78e9
	defb 079h,091h,050h,0bch,001h,02ah	; 78ef
	defb 07ah,002h,054h,0bch,001h,032h	; 78f5
	defb 07ah,012h,058h,0bch,001h,042h	; 78fb
	defb 07ah,072h,05ch,0bch,003h,052h	; 7901
	defb 07ah,042h,068h,0bch,003h,082h	; 7907
	defb 07ah,022h,074h,0bch,01fh,0b2h	; 790d
	defb 07ah,023h,070h,0c0h,003h,072h	; 7913
	defb 07ch,092h,07ch,0c0h,00ch,0a2h	; 7919
	defb 07ch,0b2h,02ch,0c4h,006h,062h	; 791f
	defb 07dh,082h,044h,0c4h,011h,0c2h	; 7925
	defb 07dh,083h,008h,0c8h,003h,0a2h	; 792b
	defb 07eh	; 7931

; ----------------------------------------------------------------------
; DATOS dibujo_7932: 5 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 0 de la lista 0x78B3 (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:54D7 (40 bytes)
;   0x7932..0x795a  (40 bytes)
DATA_dibujo_7932:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 7932  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0f0h	; 793a  ........
	defb 0e0h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 7942  ........
	defb 0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 794a  ........
	defb 0fch,0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 7952  ........

; ----------------------------------------------------------------------
; DATOS dibujo_795A: 4 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 1 de la lista 0x78B3 (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:54D7 (32 bytes)
;   0x795a..0x797a  (32 bytes)
DATA_dibujo_795A:
	defb 081h,081h,081h,081h,0c3h,0ffh,0ffh,0c3h	; 795a  ........
	defb 081h,081h,0c3h,0ffh,0ffh,0c3h,081h,081h	; 7962  ........
	defb 0c3h,0ffh,0ffh,0c3h,081h,081h,081h,081h	; 796a  ........
	defb 0ffh,0c3h,081h,081h,081h,081h,0c3h,0ffh	; 7972  ........

; ----------------------------------------------------------------------
; DATOS dibujo_797A: 3 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 2 de la lista 0x78B3 (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:54D7 (24 bytes)
;   0x797a..0x7992  (24 bytes)
DATA_dibujo_797A:
	defb 000h,000h,000h,000h,000h,000h,000h,00fh	; 797a  ........
	defb 000h,000h,000h,000h,000h,000h,000h,080h	; 7982  ........
	defb 000h,000h,000h,000h,000h,000h,000h,0c0h	; 798a  ........

; ----------------------------------------------------------------------
; DATOS dibujo_7992: 3 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 3 de la lista 0x78B3 (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:54D7 (24 bytes)
;   0x7992..0x79aa  (24 bytes)
DATA_dibujo_7992:
	defb 007h,000h,000h,000h,000h,000h,000h,000h	; 7992  ........
	defb 0ffh,0ffh,000h,000h,000h,000h,000h,000h	; 799a  ........
	defb 0ffh,000h,000h,000h,000h,000h,000h,000h	; 79a2  ........

; ----------------------------------------------------------------------
; DATOS dibujo_79AA: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 4 de la lista 0x78B3 (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:54D7 (8 bytes)
;   0x79aa..0x79b2  (8 bytes)
DATA_dibujo_79AA:
	defb 0ffh,000h,000h,000h,000h,000h,000h,0ffh	; 79aa  ........

; ----------------------------------------------------------------------
; DATOS dibujo_79B2: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 5 de la lista 0x78B3 (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:54D7 (8 bytes)
;   0x79b2..0x79ba  (8 bytes)
DATA_dibujo_79B2:
	defb 000h,000h,000h,000h,000h,000h,000h,003h	; 79b2  ........

; ----------------------------------------------------------------------
; DATOS dibujo_79BA: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 6 de la lista 0x78B3 (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:54D7 (8 bytes)
;   0x79ba..0x79c2  (8 bytes)
DATA_dibujo_79BA:
	defb 007h,007h,007h,007h,007h,007h,007h,007h	; 79ba  ........

; ----------------------------------------------------------------------
; DATOS dibujo_79C2: 3 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 7 de la lista 0x78B3 (p00:4FA3, tipo 0 en p00:4FDD); se solapan 2
;   bloques: (dibujo_79D2 79D2-79DA); lo leen p00:54D7 (24 bytes)
;   0x79c2..0x79da  (24 bytes)
DATA_dibujo_79C2:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 79c2  ........
	defb 0fch,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 79ca  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0eah,055h	; 79d2  .......U

; ----------------------------------------------------------------------
; DATOS dibujo_79DA: 11 caracteres de 8x8 a 1 bit por punto (8 bytes cada
;   uno), ficha 9 de la lista 0x78B3 (p00:4FA3, tipo 0 en p00:4FDD); se
;   solapan 2 bloques: (dibujo_7A2A 7A2A-7A32); lo leen p00:54D7 (88 bytes)
;   0x79da..0x7a32  (88 bytes)
DATA_dibujo_79DA:
	defb 000h,000h,000h,000h,000h,000h,080h,080h	; 79da  ........
	defb 055h,0aah,055h,0aah,055h,0aah,0d5h,0eah	; 79e2  U.U.U...
	defb 055h,0aah,055h,0aah,055h,0aah,055h,0aah	; 79ea  U.U.U.U.
	defb 055h,0aah,054h,0a8h,050h,0a0h,040h,080h	; 79f2  U.T.P.@.
	defb 055h,0aah,055h,0aah,055h,0aah,054h,0a0h	; 79fa  U.U.U.T.
	defb 055h,0aah,055h,0aah,050h,080h,000h,000h	; 7a02  U.U.P...
	defb 055h,0a8h,040h,000h,000h,000h,000h,000h	; 7a0a  U.@.....
	defb 0f5h,0aah,055h,0aah,055h,0aah,055h,0aah	; 7a12  ..U.U.U.
	defb 0ffh,0aah,055h,0aah,055h,0aah,055h,0aah	; 7a1a  ..U.U.U.
	defb 003h,000h,000h,000h,000h,000h,000h,000h	; 7a22  ........
	defb 000h,000h,000h,000h,000h,000h,000h,003h	; 7a2a  ........

; ----------------------------------------------------------------------
; DATOS dibujo_7A32: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 11 de la lista 0x78B3 (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:54D7 (16 bytes)
;   0x7a32..0x7a42  (16 bytes)
DATA_dibujo_7A32:
	defb 000h,0f8h,000h,0f8h,000h,0f8h,000h,0f8h,000h,0f8h,001h,0f8h,003h,0f9h,006h,0fah	; 7a32  ................

; ----------------------------------------------------------------------
; DATOS dibujo_7A42: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 12 de la lista 0x78B3 (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:54D7 (16 bytes)
;   0x7a42..0x7a52  (16 bytes)
DATA_dibujo_7A42:
	defb 00fh,00ch,000h,003h,003h,00fh,00fh,03fh,03fh,07fh,00fh,03fh,003h,00fh,000h,003h	; 7a42  .......??..?....

; ----------------------------------------------------------------------
; DATOS dibujo_7A52: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 13 de la lista 0x78B3 (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:54D7 (48 bytes)
;   0x7a52..0x7a82  (48 bytes)
DATA_dibujo_7A52:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,03fh,03fh,0cfh,0cfh,0f3h,0f3h,0fch	; 7a52  .........??.....
	defb 0fah,03fh,034h,0cfh,0cch,0f3h,0f3h,0fch,0e8h,0ffh,0f4h,0ffh,0fah,0ffh,0ffh,0ffh	; 7a62  .?4.............
	defb 0ffh,03fh,03fh,0cfh,0cfh,0f3h,0f3h,0fch,0fch,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 7a72  .??.............

; ----------------------------------------------------------------------
; DATOS dibujo_7A82: 3 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 14 de la lista 0x78B3 (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:54D7 (48 bytes)
;   0x7a82..0x7ab2  (48 bytes)
DATA_dibujo_7A82:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fch,0fch,0f0h,0f0h,0c0h,0c0h,000h	; 7a82  ................
	defb 0ffh,0fch,0fch,0f0h,0f0h,0c0h,0c0h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 7a92  ................
	defb 07fh,08ch,07ch,0b0h,0f0h,0c0h,0c0h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 7aa2  ..|.............

; ----------------------------------------------------------------------
; DATOS dibujo_7AB2: 31 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 15 de la lista 0x78B3 (p00:4FA3, tipo 2 en p00:4FDD); se
;   solapan 2 bloques: (dibujo_7C72 7C72-7CA2); lo leen p00:54D7 (496 bytes)
;   0x7ab2..0x7ca2  (496 bytes)
DATA_dibujo_7AB2:
	defb 0f3h,00bh,0f3h,00bh,0f3h,00bh,0f3h,00bh,0f3h,00bh,0f3h,00bh,0f3h,00bh,0f3h,00bh	; 7ab2  ................
	defb 01eh,09eh,01eh,09eh,01eh,09eh,01eh,09eh,01eh,09eh,01eh,09eh,01eh,09eh,01eh,09eh	; 7ac2  ................
	defb 0f0h,0f0h,00fh,000h,0f0h,000h,00eh,08eh,01eh,09eh,01eh,09eh,01eh,09eh,01eh,09eh	; 7ad2  ................
	defb 0ffh,07eh,0ffh,07eh,0ffh,07eh,0ffh,07eh,0ffh,03ch,0ffh,000h,0dfh,018h,0dfh,01fh	; 7ae2  .~.~.~.~.<......
	defb 0ffh,07eh,0ffh,07eh,0ffh,03ch,0ffh,000h,0dfh,018h,0dfh,01fh,0f0h,0f0h,00fh,000h	; 7af2  .~.~.<..........
	defb 0ffh,03ch,0ffh,000h,0dfh,018h,0dfh,01fh,0f0h,0f0h,00fh,000h,0ffh,000h,0ffh,000h	; 7b02  .<..............
	defb 0dfh,018h,0dfh,01fh,0f0h,0f0h,00fh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 7b12  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0f0h,000h,0efh,00fh,0ffh,010h,0ffh,000h,0ffh,03ch	; 7b22  ...............<
	defb 0ffh,000h,0f0h,000h,00fh,00fh,0ffh,0f0h,0ffh,000h,0ffh,03ch,0ffh,07eh,0ffh,07eh	; 7b32  ...........<.~.~
	defb 00fh,00fh,0ffh,0f0h,0ffh,000h,0ffh,03ch,0ffh,07eh,0ffh,07eh,0ffh,07eh,0ffh,07eh	; 7b42  .......<.~.~.~.~
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0f0h,000h,00fh,00fh,0ffh,0f0h	; 7b52  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0f0h,000h,00fh,00fh,0ffh,0f0h,0ffh,000h,0ffh,03ch	; 7b62  ...............<
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,000h,0ffh,000h	; 7b72  ................
	defb 0f7h,0f0h,00fh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 7b82  ................
	defb 0f0h,0f0h,00fh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 7b92  ................
	defb 0f0h,000h,00eh,08eh,01eh,09eh,01eh,09eh,01eh,09eh,01eh,09eh,01eh,09eh,01eh,09eh	; 7ba2  ................
	defb 01eh,09eh,01eh,09eh,01eh,09eh,01eh,09eh,01eh,09eh,01eh,09eh,01ch,09ch,013h,090h	; 7bb2  ................
	defb 000h,0ffh,000h,0ffh,080h,07fh,080h,07fh,0c0h,0bfh,0c0h,0bfh,060h,05fh,060h,05fh	; 7bc2  ............`_`_
	defb 0b0h,02fh,0b0h,02fh,058h,017h,058h,017h,02ch,00bh,0ach,00bh,096h,005h,0d6h,005h	; 7bd2  ././X.X.,.......
	defb 000h,0ffh,000h,0ffh,000h,0ffh,080h,07fh,0e0h,09fh,078h,067h,01eh,019h,007h,006h	; 7be2  ..........xg....
	defb 000h,0ffh,000h,0ffh,000h,0ffh,080h,07fh,0c0h,0bfh,0c0h,0bfh,060h,05fh,060h,05fh	; 7bf2  ............`_`_
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,007h,0fbh	; 7c02  ................
	defb 000h,0ffh,000h,0ffh,01eh,0efh,03eh,0d7h,07eh,0a7h,06eh,0b7h,06eh,0b7h,0eeh,0b7h	; 7c12  ......>.~.n.n...
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,00ch,0f7h,01ch,0efh	; 7c22  ................
	defb 00fh,0f5h,01fh,0e9h,01bh,0edh,01bh,0edh,01bh,0efh,01fh,0edh,01fh,0e1h,003h,0fdh	; 7c32  ................
	defb 0b0h,02fh,0b0h,02fh,058h,017h,058h,017h,02ch,00bh,0a6h,005h,093h,002h,0c9h,001h	; 7c42  ././X.X.,.......
	defb 0f0h,0cfh,03ch,033h,0cfh,00ch,033h,003h,00ch,000h,003h,000h,0c0h,000h,0f0h,000h	; 7c52  ..<3..3.........
	defb 000h,0ffh,000h,0ffh,000h,0ffh,0c0h,03fh,0f0h,0cfh,03ch,033h,0cfh,00ch,033h,003h	; 7c62  .......?..<3..3.
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,03fh,0e0h,060h,0efh,060h	; 7c72  ...........?.`.`
	defb 0efh,060h,0efh,060h,0efh,060h,0efh,060h,0efh,070h,0bfh,03fh,0c0h,000h,0ffh,000h	; 7c82  .`.`.`.`.p.?....
	defb 0efh,060h,0efh,060h,0efh,060h,0efh,060h,0efh,060h,0efh,060h,0efh,060h,0efh,060h	; 7c92  .`.`.`.`.`.`.`.`

; ----------------------------------------------------------------------
; DATOS dibujo_7CA2: 12 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 17 de la lista 0x78B3 (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:54D7 (192 bytes)
;   0x7ca2..0x7d62  (192 bytes)
DATA_dibujo_7CA2:
	defb 0d5h,0c0h,0fah,030h,07dh,00ch,0afh,003h,057h,000h,0aah,000h,055h,000h,0aah,000h	; 7ca2  ...0}...W...U...
	defb 055h,000h,0aah,000h,055h,000h,0aah,000h,0d5h,0c0h,0fah,030h,07dh,00ch,0afh,003h	; 7cb2  U...U......0}...
	defb 0c0h,0c0h,0f0h,030h,03ch,00ch,00fh,003h,003h,000h,000h,000h,000h,000h,000h,000h	; 7cc2  ...0<...........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,0c0h,0c0h,0f0h,030h,03ch,00ch,00fh,003h	; 7cd2  ...........0<...
	defb 0c0h,03fh,030h,00fh,00ch,003h,003h,000h,00ch,00ch,03fh,033h,0f3h,0c0h,0c0h,000h	; 7ce2  .?0.......?3....
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0c0h,03fh,030h,00fh,0cch,0c3h,073h,030h	; 7cf2  .........?0...s0
	defb 00fh,00ch,03ch,030h,030h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 7d02  ..<00...........
	defb 03ch,00ch,00fh,003h,003h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 7d12  <...............
	defb 0c0h,03fh,030h,00fh,0cch,0c3h,0f3h,030h,03ch,00ch,00fh,003h,003h,000h,000h,000h	; 7d22  .?0....0<.......
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0c0h,03fh,030h,00fh,0cch,0c3h,0f3h,030h	; 7d32  .........?0....0
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,003h,003h,00fh,00ch,00ch,000h	; 7d42  ................
	defb 03ch,00ch,00fh,003h,00fh,00ch,03ch,030h,0f0h,0c0h,0c0h,000h,000h,000h,000h,000h	; 7d52  <.....<0........

; ----------------------------------------------------------------------
; DATOS dibujo_7D62: 6 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 18 de la lista 0x78B3 (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:54D7 (96 bytes)
;   0x7d62..0x7dc2  (96 bytes)
DATA_dibujo_7D62:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,001h,003h,002h,006h,005h	; 7d62  ................
	defb 00ch,00bh,00ch,00bh,006h,005h,006h,005h,003h,002h,003h,002h,001h,001h,001h,001h	; 7d72  ................
	defb 00fh,00ch,003h,003h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 7d82  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,00fh,00fh,0ffh,0f0h,0f0h,00fh	; 7d92  ................
	defb 000h,000h,000h,000h,000h,000h,00fh,00fh,0ffh,0f0h,0f0h,00fh,000h,0ffh,000h,0ffh	; 7da2  ................
	defb 000h,000h,000h,000h,0ffh,0ffh,0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h	; 7db2  ................

; ----------------------------------------------------------------------
; DATOS dibujo_7DC2: 17 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 19 de la lista 0x78B3 (p00:4FA3, tipo 2 en p00:4FDD); se
;   solapan 2 bloques: (dibujo_7EA2 7EA2-7ED2); lo leen p00:54D7 (272 bytes)
;   0x7dc2..0x7ed2  (272 bytes)
DATA_dibujo_7DC2:
	defb 00bh,0f8h,00bh,0f8h,00bh,0f8h,00bh,0f8h,00bh,0f8h,00bh,0f8h,007h,0fch,003h,0ffh	; 7dc2  ................
	defb 008h,0f8h,00bh,0f8h,00bh,0f8h,00bh,0f8h,00bh,0f8h,00bh,0f8h,00bh,0f8h,00bh,0f8h	; 7dd2  ................
	defb 040h,07fh,040h,07fh,0a0h,03fh,0a0h,03fh,0d0h,01fh,0d0h,01fh,0e8h,00fh,06ch,00fh	; 7de2  @.@..?.?......l.
	defb 040h,07fh,040h,07fh,0a0h,03fh,0a0h,03fh,0d0h,01fh,0d0h,01fh,0e8h,00fh,068h,00fh	; 7df2  @.@..?.?......h.
	defb 050h,01fh,090h,01fh,068h,00fh,0a8h,00fh,068h,00fh,0f4h,007h,0f4h,007h,0f4h,007h	; 7e02  P...h...h.......
	defb 080h,0ffh,040h,07fh,040h,07fh,040h,07fh,0a0h,03fh,0a0h,03fh,0a0h,03fh,0d0h,01fh	; 7e12  ..@.@.@..?.?.?..
	defb 0b5h,03fh,06ah,07fh,0d5h,0ffh,0aah,0ffh,055h,0ffh,0aah,0ffh,055h,0ffh,0aah,0ffh	; 7e22  .?j.....U...U...
	defb 00ch,0fch,033h,0f0h,0cfh,0c0h,03fh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 7e32  ..3...?.........
	defb 0ffh,000h,0ffh,000h,0f0h,000h,00fh,00fh,0f5h,0ffh,0aah,0ffh,055h,0ffh,0aah,0ffh	; 7e42  ............U...
	defb 0f0h,000h,00fh,00fh,0f5h,0ffh,0aah,0ffh,055h,0ffh,0aah,0ffh,055h,0ffh,0aah,0ffh	; 7e52  ........U...U...
	defb 055h,07fh,06ah,07fh,0b5h,03fh,0aah,03fh,0d5h,01fh,0dah,01fh,06dh,00fh,06ah,00fh	; 7e62  U.j..?.?....m.j.
	defb 0b5h,03fh,0aah,03fh,0b5h,03fh,0aah,03fh,0d5h,01fh,0dah,01fh,06dh,00fh,06ah,00fh	; 7e72  .?.?.?.?....m.j.
	defb 000h,0ffh,000h,0ffh,000h,0ffh,003h,0ffh,004h,0fch,00bh,0f8h,00bh,0f8h,00bh,0f8h	; 7e82  ................
	defb 00bh,0f8h,00bh,0f8h,00bh,0f8h,00bh,0f8h,00bh,0f8h,00bh,0f8h,00bh,0f8h,00bh,0f8h	; 7e92  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,0c0h,0ffh,030h,03fh,0cch,00fh,0f3h,003h,0fch,000h	; 7ea2  ........0?......
	defb 0ffh,0c0h,03fh,0f0h,00fh,0fch,003h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 7eb2  ..?.............
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0c0h,03fh,0f0h,00fh,0fch,003h,0ffh	; 7ec2  ..........?.....

; ----------------------------------------------------------------------
; DATOS paletas_7ED2: 7 punteros a los colores de cada paleta (p00:556D desde
;   p00:4FB0), para la lista 0x7EF1; lo leen p00:54E0 (14 bytes)
;   0x7ed2..0x7ee0  (14 bytes)
DATA_paletas_7ED2:
	defw 07ee0h,07ee3h,07ee5h,07ee8h,07ee9h,07eebh,07eedh	; 7ed2

; ----------------------------------------------------------------------
; DATOS colores_7EE0: 8 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 0 de la lista 0x7EF1; se solapan 5
;   bloques: (colores_7EE3 7EE3-7EEB) (colores_7EE5 7EE5-7EE9) (colores_7EE9
;   7EE9-7EF1) (colores_7EED 7EED-7EF1); lo leen p00:54E0 (17 bytes)
;   0x7ee0..0x7ef1  (17 bytes)
DATA_colores_7EE0:
	defb 005h,00ah,00fh,004h,009h,002h,007h,00eh	; 7ee0  ........
	defb 001h,00dh,00fh,001h,005h,002h,004h,006h	; 7ee8  ........
	defb 00eh	; 7ef0

; ----------------------------------------------------------------------
; DATOS lista_7EF1: 5 fichas de dibujo de 6 bytes [paleta-tipo][VRAM lo
;   hi][caracteres][puntero] detras del numero (p00:4FA3, paletas en 0x7ED2);
;   lo leen p00:54E0 (31 bytes)
;   0x7ef1..0x7f10  (31 bytes)
DATA_lista_7EF1:
	defb 005h,062h,014h,0c8h,001h,010h	; 7ef1
	defb 07fh,022h,018h,0c8h,001h,020h	; 7ef7
	defb 07fh,044h,01ch,0c8h,010h,030h	; 7efd
	defb 07fh,004h,05ch,0c8h,005h,0b0h	; 7f03
	defb 080h,014h,070h,0c8h,01dh,028h	; 7f09
	defb 081h	; 7f0f

; ----------------------------------------------------------------------
; DATOS dibujo_7F10: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0x7EF1 (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:54E0 (16 bytes)
;   0x7f10..0x7f20  (16 bytes)
DATA_dibujo_7F10:
	defb 007h,0feh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 7f10  ................

; ----------------------------------------------------------------------
; DATOS dibujo_7F20: 1 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x7EF1 (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:54E0 (16 bytes)
;   0x7f20..0x7f30  (16 bytes)
DATA_dibujo_7F20:
	defb 0e0h,01fh,0c0h,03eh,080h,0fch,0c0h,0f8h,080h,0f0h,000h,0e0h,000h,0c0h,000h,080h	; 7f20  ...>............

; ----------------------------------------------------------------------
; DATOS dibujo_7F30: 16 caracteres de 8x8 a 3 bits por punto (24 bytes cada
;   uno), ficha 2 de la lista 0x7EF1 (p00:4FA3, tipo 4 en p00:4FDD) (sigue en
;   el banco 8, en 0x8000); lo leen p00:54E0 (208 bytes)
;   0x7f30..0x8000  (208 bytes)
DATA_dibujo_7F30:
	defb 0ffh,000h,00fh,0ffh,00fh,0f0h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0f0h,00fh,0f0h,00fh,0ffh,000h,0ffh,0f5h,000h,0ffh,0aah	; 7f30  ........................
	defb 000h,000h,0ffh,00fh,000h,0f0h,03fh,000h,0cfh,07fh,00fh,0b0h,0ffh,03fh,040h,0ffh,07fh,080h,0ffh,0f0h,00fh,0f0h,0cfh,03ah	; 7f48  ......?......?@........:
	defb 000h,000h,0ffh,00fh,000h,0f0h,0ffh,000h,00fh,0ffh,00fh,0f0h,0ffh,0ffh,000h,0ffh,0ffh,000h,0ffh,0f0h,00fh,0f0h,00fh,0ffh	; 7f60  ........................
	defb 0f8h,037h,04dh,0f8h,037h,04eh,07ch,01bh,0a7h,07ch,01bh,0a6h,03eh,00dh,0d3h,03eh,00dh,0d3h,01fh,006h,0e9h,01fh,006h,0e9h	; 7f78  .7M.7N|..|..>..>........
	defb 020h,000h,0c3h,048h,000h,083h,088h,000h,001h,0aah,000h,001h,0ach,000h,003h,0a9h,000h,006h,0b3h,000h,00dh,0a7h,001h,01ah	; 7f90   ..H....................
	defb 049h,000h,010h,048h,000h,011h,048h,000h,011h,04ah,000h,011h,044h,000h,003h,079h,000h,006h,003h,000h,07dh,007h,001h,07ah	; 7fa8  I..H..H..J..D..y....}..z
	defb 012h,000h,0e4h,012h,000h,0e4h,009h,000h,0f0h,006h,000h,0f9h,000h,000h,0ffh,001h,000h,0feh,003h,000h,0fdh,007h,001h,0fah	; 7fc0  ........................
	defb 0f8h,037h,04ch,0f8h,037h,04ch,07ch,01bh,0a6h,07ch,01bh,0a6h,03eh,00dh,0d3h,03eh,00dh,0d3h,01fh,006h,0e9h,01fh,006h,0e9h	; 7fd8  .7L.7L|..|..>..>........
	defb 0fch,033h,04fh,0ffh,03ch,043h,07fh,00fh,0b0h,03fh,003h,0cch,00fh,000h,0f3h,003h	; 7ff0  .3O.<C...?......
