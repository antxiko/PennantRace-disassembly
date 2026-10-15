; ==========================================================================
; THE PRO YAKYUU GEKITOTSU PENNANT RACE - Konami (1988) - MSX2 - MegaROM RC-757 de 128 KB (Konami SCC) - banco 06 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS sonido_A000: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x11,
;   0x14, 0x16, 0x18 (tools/partituras.py); lo leen p06:B51E (6 bytes)
;   0xa000..0xa006  (6 bytes)
DATA_sonido_A000:
	defb 040h,0c8h,080h,0e0h,007h,0fah	; a000

; ----------------------------------------------------------------------
; DATOS partitura_A006: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x07 (tools/partituras.py); lo leen p06:B51E (52 bytes)
;   0xa006..0xa03a  (52 bytes)
DATA_partitura_A006:
	defb 0feh,002h,0e2h,001h,064h,030h,0b2h,010h,0b2h,062h,0b2h,0b1h,0b3h,00ah,0b3h,06eh	; a006  ....d0...b.....n
	defb 0b3h,0dfh,0b4h,05fh,0f9h,068h,0a0h,0f7h,007h,0f9h,068h,0a0h,0f7h,004h,0f9h,068h	; a016  ..._.h....h....h
	defb 0a0h,0f7h,007h,0f9h,068h,0a0h,000h,000h,0f7h,008h,0f9h,068h,0a0h,0dfh,0e0h,005h	; a026  ....h......h....
	defb 0f9h,083h,0b0h,0ffh	; a036

; ----------------------------------------------------------------------
; DATOS partitura_A03A: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x07 (tools/partituras.py); lo leen p06:B51E (76 bytes)
;   0xa03a..0xa086  (76 bytes)
DATA_partitura_A03A:
	defb 0feh,002h,0f8h,028h,0e2h,001h,0c3h,01dh,0c4h,062h,0f8h,022h,0c4h,0b1h,0c5h,00ah	; a03a  ...(.....b."....
	defb 0c5h,06eh,0c5h,0dfh,0c6h,05fh,000h,000h,0f8h,00bh,0f9h,075h,0a0h,0f7h,004h,0f9h	; a04a  .n..._.....u....
	defb 075h,0a0h,0f7h,006h,0f9h,075h,0a0h,0dfh,0e0h,00ah,0f9h,005h,0b1h,0ffh,000h,000h	; a05a  u....u..........
	defb 000h,000h,0a0h,08eh,0a0h,083h,0a0h,0e3h,0a1h,01fh,0fah,062h,01dh,062h,062h,062h	; a06a  ...........b.bbb
	defb 0b1h,063h,00ah,063h,063h,063h,0dfh,064h,05fh,000h,000h,0fah	; a07a  .c.ccc.d_...

; ----------------------------------------------------------------------
; DATOS partitura_A086: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x08 (tools/partituras.py); lo leen p06:B51E (42 bytes)
;   0xa086..0xa0b0  (42 bytes)
DATA_partitura_A086:
	defb 0feh,002h,0e2h,001h,0e5h,009h,000h,0b0h,000h,0b0h,000h,060h,000h,030h,000h,018h	; a086  ...........`.0..
	defb 000h,00ch,000h,006h,000h,003h,0e2h,001h,060h,0b0h,0e0h,007h,0e2h,001h,040h,0b1h	; a096  ........`.....@.
	defb 0e0h,008h,0e2h,001h,030h,0b1h,0f9h,08fh,0afh,0ffh	; a0a6  ....0.....

; ----------------------------------------------------------------------
; DATOS partitura_A0B0: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x08 (tools/partituras.py); lo leen p06:B51E (27 bytes)
;   0xa0b0..0xa0cb  (27 bytes)
DATA_partitura_A0B0:
	defb 0feh,002h,0f8h,01fh,0e2h,001h,0c0h,0b5h,0e0h,006h,0e2h,001h,020h,0b8h,0e0h,007h	; a0b0  ............ ...
	defb 0e2h,001h,010h,0b4h,0e0h,008h,0e2h,001h,000h,0b3h,0ffh	; a0c0  ...........

; ----------------------------------------------------------------------
; DATOS partitura_A0CB: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x09 (tools/partituras.py); lo leen p06:B51E (35 bytes)
;   0xa0cb..0xa0ee  (35 bytes)
DATA_partitura_A0CB:
	defb 0feh,002h,0e1h,001h,0f9h,0fdh,0a0h,000h,0e4h,00ch,004h,0e4h,00eh,004h,0e4h,010h	; a0cb  ................
	defb 004h,0e4h,012h,004h,0e4h,014h,004h,0e0h,003h,0e1h,001h,0f7h,005h,0f9h,0fdh,0a0h	; a0db  ................
	defb 0e0h,003h,0ffh	; a0eb

; ----------------------------------------------------------------------
; DATOS partitura_A0EE: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x09 (tools/partituras.py); lo leen p06:B51E (88 bytes)
;   0xa0ee..0xa146  (88 bytes)
DATA_partitura_A0EE:
	defb 0feh,002h,0f8h,005h,0e2h,001h,0f9h,01fh,0a1h,0f7h,00ch,0f9h,01fh,0a1h,0ffh,0e4h	; a0ee  ................
	defb 004h,003h,0e4h,006h,006h,0e4h,000h,007h,0e4h,002h,007h,0e4h,00ah,008h,0e4h,008h	; a0fe  ................
	defb 007h,0e4h,00ch,008h,0e4h,00eh,007h,0e4h,010h,006h,0e4h,012h,005h,0e4h,014h,005h	; a10e  ................
	defb 0fah,071h,0a0h,0a1h,0e0h,0b1h,050h,0b1h,080h,0c2h,000h,0b1h,0f0h,0c2h,050h,0b2h	; a11e  .q....P.......P.
	defb 0a0h,0a3h,000h,093h,080h,094h,000h,000h,000h,082h,050h,082h,0a0h,083h,000h,083h	; a12e  ..........P.....
	defb 080h,084h,000h,014h,000h,004h,000h,0fah	; a13e  ........

; ----------------------------------------------------------------------
; DATOS partitura_A146: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x0A (tools/partituras.py); lo leen p06:B51E (63 bytes)
;   0xa146..0xa185  (63 bytes)
DATA_partitura_A146:
	defb 0feh,002h,0e2h,001h,045h,040h,054h,030h,0e1h,001h,0e4h,015h,004h,0e4h,018h,005h	; a146  ....E@T0........
	defb 0e4h,019h,006h,007h,0e4h,014h,00ah,0e1h,005h,0e4h,019h,009h,0e4h,01ah,00ah,0e4h	; a156  ................
	defb 019h,00ah,006h,0e4h,018h,005h,0e4h,019h,004h,0e4h,018h,003h,0e4h,019h,002h,0e4h	; a166  ................
	defb 018h,002h,0e4h,019h,002h,0e4h,01ah,002h,0e4h,01bh,002h,0e4h,01ch,002h,0ffh	; a176  ...............

; ----------------------------------------------------------------------
; DATOS partitura_A185: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x0A (tools/partituras.py); lo leen p06:B51E (58 bytes)
;   0xa185..0xa1bf  (58 bytes)
DATA_partitura_A185:
	defb 0feh,002h,0f8h,00bh,0e2h,001h,047h,000h,0f5h,078h,089h,099h,0c4h,0b9h,0cah,0c9h	; a185  ......G..x......
	defb 089h,078h,069h,058h,049h,048h,049h,04ah,04bh,04ch,0f6h,0f8h,008h,047h,000h,0f5h	; a195  .xiXIHIJKL...G..
	defb 048h,049h,049h,044h,049h,04ah,049h,047h,048h,007h,008h,009h,009h,004h,009h,00ah	; a1a5  HIIDIJIGH.......
	defb 009h,007h,008h,0fbh,002h,0aeh,0a1h,0e0h,018h,0ffh	; a1b5  ..........

; ----------------------------------------------------------------------
; DATOS partitura_A1BF: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x0B (tools/partituras.py); lo leen p06:B51E (20 bytes)
;   0xa1bf..0xa1d3  (20 bytes)
DATA_partitura_A1BF:
	defb 0feh,002h,0f9h,0e9h,0a1h,0e0h,002h,0f7h,004h,0f9h,0e9h,0a1h,0e0h,003h,0f7h,006h	; a1bf  ................
	defb 0f9h,0e9h,0a1h,0ffh	; a1cf

; ----------------------------------------------------------------------
; DATOS partitura_A1D3: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x0B (tools/partituras.py); lo leen p06:B51E (47 bytes)
;   0xa1d3..0xa202  (47 bytes)
DATA_partitura_A1D3:
	defb 0feh,002h,0f8h,007h,0f9h,0f9h,0a1h,0e0h,002h,0f7h,004h,0f9h,0f9h,0a1h,0e0h,003h	; a1d3  ................
	defb 0f7h,006h,0f9h,0f9h,0a1h,0ffh,0e2h,001h,0a5h,0e1h,0e3h,001h,0e4h,002h,0a2h,010h	; a1e3  ................
	defb 0e1h,001h,0e4h,00fh,00ah,0fah,0e2h,001h,0b5h,0e1h,0b2h,010h,0bfh,000h,0fah	; a1f3  ...............

; ----------------------------------------------------------------------
; DATOS partitura_A202: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x0C (tools/partituras.py); lo leen p06:B51E (30 bytes)
;   0xa202..0xa220  (30 bytes)
DATA_partitura_A202:
	defb 0feh,002h,0e2h,001h,0a1h,011h,061h,00bh,051h,011h,041h,014h,031h,017h,021h,01ah	; a202  ......a.Q.A.1.!.
	defb 011h,01dh,0f4h,020h,023h,011h,00bh,011h,0f6h,021h,014h,021h,017h,0ffh	; a212  ... #....!.!..

; ----------------------------------------------------------------------
; DATOS partitura_A220: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x0C (tools/partituras.py); lo leen p06:B51E (32 bytes)
;   0xa220..0xa240  (32 bytes)
DATA_partitura_A220:
	defb 0feh,002h,0f8h,023h,0e2h,001h,0c1h,011h,0f8h,00dh,071h,00bh,061h,011h,051h,014h	; a220  ...#......q.a.Q.
	defb 041h,017h,031h,01ah,021h,01dh,011h,020h,0f4h,023h,011h,00bh,011h,014h,017h,0ffh	; a230  A.1.!.. .#......

; ----------------------------------------------------------------------
; DATOS partitura_A240: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x0D (tools/partituras.py); lo leen p06:B51E (12 bytes)
;   0xa240..0xa24c  (12 bytes)
DATA_partitura_A240:
	defb 0feh,002h,0f9h,006h,09fh,0f9h,0ach,0a2h,0f9h,051h,0adh,0ffh	; a240  .........Q..

; ----------------------------------------------------------------------
; DATOS partitura_A24C: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x0D (tools/partituras.py); lo leen p06:B51E (12 bytes)
;   0xa24c..0xa258  (12 bytes)
DATA_partitura_A24C:
	defb 0feh,002h,0f9h,026h,09fh,0f9h,0e1h,0a2h,0f9h,0d3h,0adh,0ffh	; a24c  ...&........

; ----------------------------------------------------------------------
; DATOS partitura_A258: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x0E (tools/partituras.py); lo leen p06:B51E (9 bytes)
;   0xa258..0xa261  (9 bytes)
DATA_partitura_A258:
	defb 0feh,002h,0f9h,0ach,0a2h,0f9h,070h,0aeh,0ffh	; a258  ......p..

; ----------------------------------------------------------------------
; DATOS partitura_A261: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x0E (tools/partituras.py); lo leen p06:B51E (9 bytes)
;   0xa261..0xa26a  (9 bytes)
DATA_partitura_A261:
	defb 0feh,002h,0f9h,0e1h,0a2h,0f9h,0f2h,0aeh,0ffh	; a261  .........

; ----------------------------------------------------------------------
; DATOS partitura_A26A: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x0F (tools/partituras.py); lo leen p06:B51E (9 bytes)
;   0xa26a..0xa273  (9 bytes)
DATA_partitura_A26A:
	defb 0feh,002h,0f9h,0ach,0a2h,0f9h,051h,0adh,0ffh	; a26a  ......Q..

; ----------------------------------------------------------------------
; DATOS partitura_A273: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x0F (tools/partituras.py); lo leen p06:B51E (9 bytes)
;   0xa273..0xa27c  (9 bytes)
DATA_partitura_A273:
	defb 0feh,002h,0f9h,0e1h,0a2h,0f9h,0d3h,0adh,0ffh	; a273  .........

; ----------------------------------------------------------------------
; DATOS partitura_A27C: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x10 (tools/partituras.py); lo leen p06:B51E (12 bytes)
;   0xa27c..0xa288  (12 bytes)
DATA_partitura_A27C:
	defb 0feh,002h,0f9h,039h,09fh,0f9h,0ach,0a2h,0f9h,051h,0adh,0ffh	; a27c  ...9.....Q..

; ----------------------------------------------------------------------
; DATOS partitura_A288: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x10 (tools/partituras.py); lo leen p06:B51E (12 bytes)
;   0xa288..0xa294  (12 bytes)
DATA_partitura_A288:
	defb 0feh,002h,0f9h,06ch,09fh,0f9h,0e1h,0a2h,0f9h,0d3h,0adh,0ffh	; a288  ...l........

; ----------------------------------------------------------------------
; DATOS partitura_A294: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x11 (tools/partituras.py); lo leen p06:B51E (12 bytes)
;   0xa294..0xa2a0  (12 bytes)
DATA_partitura_A294:
	defb 0feh,002h,0f9h,097h,09fh,0f9h,0ach,0a2h,0f9h,051h,0adh,0ffh	; a294  .........Q..

; ----------------------------------------------------------------------
; DATOS partitura_A2A0: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x0D, 0x0E, 0x0F, 0x10, 0x11 (tools/partituras.py); lo leen p06:B51E (120
;   bytes)
;   0xa2a0..0xa318  (120 bytes)
DATA_partitura_A2A0:
	defb 0feh,002h,0f9h,0d1h,09fh,0f9h,0e1h,0a2h,0f9h,0d3h,0adh,0ffh,0feh,002h,0eeh,005h	; a2a0  ................
	defb 0e2h,001h,082h,000h,081h,040h,081h,063h,061h,025h,061h,0a4h,061h,036h,061h,025h	; a2b0  .....@.ca%a.a6a%
	defb 031h,025h,021h,025h,061h,030h,061h,071h,082h,030h,031h,063h,022h,030h,021h,031h	; a2c0  1%!%a0aq.01c"0!1
	defb 041h,071h,072h,030h,031h,063h,032h,030h,034h,071h,021h,063h,021h,023h,0e0h,001h	; a2d0  Aqr01c204q!c!#..
	defb 0fah,0feh,002h,0f8h,014h,0e2h,001h,0c2h,000h,0c1h,040h,0f8h,023h,0c1h,063h,0a1h	; a2e0  ..........@.#.c.
	defb 025h,0a1h,0a4h,0a1h,036h,0a1h,025h,031h,025h,021h,036h,0a1h,030h,0a1h,071h,0c2h	; a2f0  %...6.%1%!6.0.q.
	defb 030h,021h,063h,012h,030h,011h,031h,071h,071h,0c2h,030h,011h,063h,012h,030h,014h	; a300  0!c.0.1qq.0.c.0.
	defb 071h,001h,063h,001h,023h,004h,071h,0fah	; a310  q.c.#.q.

; ----------------------------------------------------------------------
; DATOS partitura_A318: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x12 (tools/partituras.py); lo leen p06:B51E (26 bytes)
;   0xa318..0xa332  (26 bytes)
DATA_partitura_A318:
	defb 0feh,002h,0f9h,006h,09fh,0e0h,002h,0e2h,001h,0f7h,002h,0f9h,04bh,0a3h,0dfh,030h	; a318  ............K..0
	defb 030h,030h,024h,0f9h,066h,0a3h,0f9h,08fh,0afh,0ffh	; a328  00$.f.....

; ----------------------------------------------------------------------
; DATOS partitura_A332: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x12 (tools/partituras.py); lo leen p06:B51E (67 bytes)
;   0xa332..0xa375  (67 bytes)
DATA_partitura_A332:
	defb 0feh,002h,0f9h,026h,09fh,0f8h,015h,0e2h,001h,0f9h,04bh,0a3h,030h,030h,030h,024h	; a332  ...&......K.000$
	defb 0f9h,066h,0a3h,0e0h,002h,0f9h,0f6h,0afh,0ffh,060h,052h,070h,048h,080h,041h,090h	; a342  .f.......`RpH.A.
	defb 038h,090h,030h,080h,024h,070h,028h,060h,02ch,050h,030h,040h,035h,050h,039h,050h	; a352  8.0.$p(`,P0@5P9P
	defb 03dh,050h,041h,0fah,020h,028h,020h,02ch,020h,030h,020h,035h,010h,039h,010h,03dh	; a362  =PA. ( , 0 5.9.=
	defb 010h,041h,0fah	; a372

; ----------------------------------------------------------------------
; DATOS partitura_A375: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x13 (tools/partituras.py); lo leen p06:B51E (9 bytes)
;   0xa375..0xa37e  (9 bytes)
DATA_partitura_A375:
	defb 0feh,002h,0f9h,039h,09fh,0f9h,099h,0a3h,0ffh	; a375  ...9.....

; ----------------------------------------------------------------------
; DATOS partitura_A37E: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x13 (tools/partituras.py); lo leen p06:B51E (9 bytes)
;   0xa37e..0xa387  (9 bytes)
DATA_partitura_A37E:
	defb 0feh,002h,0f9h,06ch,09fh,0f9h,0c6h,0a3h,0ffh	; a37e  ...l.....

; ----------------------------------------------------------------------
; DATOS partitura_A387: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x14 (tools/partituras.py); lo leen p06:B51E (9 bytes)
;   0xa387..0xa390  (9 bytes)
DATA_partitura_A387:
	defb 0feh,002h,0f9h,097h,09fh,0f9h,099h,0a3h,0ffh	; a387  .........

; ----------------------------------------------------------------------
; DATOS partitura_A390: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x13, 0x14 (tools/partituras.py); lo leen p06:B51E (99 bytes)
;   0xa390..0xa3f3  (99 bytes)
DATA_partitura_A390:
	defb 0feh,002h,0f9h,0d1h,09fh,0f9h,0c6h,0a3h,0ffh,0eeh,005h,0e0h,001h,0e2h,001h,055h	; a390  ...............U
	defb 023h,063h,020h,072h,030h,0e2h,002h,071h,06ah,000h,000h,081h,030h,041h,06ah,081h	; a3a0  #c r0..qj...0Aj.
	defb 006h,081h,00ch,071h,028h,061h,006h,051h,00ch,041h,028h,091h,066h,041h,00ch,031h	; a3b0  ...q(a.Q.A(.fA.1
	defb 028h,031h,06ah,021h,00ch,0fah,0f8h,023h,0e2h,001h,085h,023h,0a3h,020h,0b2h,030h	; a3c0  (1j!...#...#. .0
	defb 0e2h,002h,091h,06ah,000h,000h,0c1h,030h,051h,06ah,0c1h,006h,0c1h,00ch,0a1h,028h	; a3d0  ...j...0Qj.....(
	defb 081h,006h,071h,00ch,061h,028h,0b1h,066h,051h,00ch,031h,028h,031h,06ah,021h,00ch	; a3e0  ..q.a(.fQ.1(1j!.
	defb 0e0h,001h,0fah	; a3f0

; ----------------------------------------------------------------------
; DATOS partitura_A3F3: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x15 (tools/partituras.py); lo leen p06:B51E (9 bytes)
;   0xa3f3..0xa3fc  (9 bytes)
DATA_partitura_A3F3:
	defb 0feh,002h,0f9h,039h,09fh,0f9h,017h,0a4h,0ffh	; a3f3  ...9.....

; ----------------------------------------------------------------------
; DATOS partitura_A3FC: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x15 (tools/partituras.py); lo leen p06:B51E (9 bytes)
;   0xa3fc..0xa405  (9 bytes)
DATA_partitura_A3FC:
	defb 0feh,002h,0f9h,06ch,09fh,0f9h,03ch,0a4h,0ffh	; a3fc  ...l..<..

; ----------------------------------------------------------------------
; DATOS partitura_A405: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x16 (tools/partituras.py); lo leen p06:B51E (9 bytes)
;   0xa405..0xa40e  (9 bytes)
DATA_partitura_A405:
	defb 0feh,002h,0f9h,097h,09fh,0f9h,017h,0a4h,0ffh	; a405  .........

; ----------------------------------------------------------------------
; DATOS partitura_A40E: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x15, 0x16 (tools/partituras.py); lo leen p06:B51E (83 bytes)
;   0xa40e..0xa461  (83 bytes)
DATA_partitura_A40E:
	defb 0feh,002h,0f9h,0d1h,09fh,0f9h,03ch,0a4h,0ffh,0e0h,002h,0eeh,005h,0e2h,001h,063h	; a40e  ......<........c
	defb 000h,074h,020h,081h,0fah,0e2h,002h,091h,06ah,081h,07fh,051h,097h,081h,0b3h,041h	; a41e  .t .....j..Q...A
	defb 0d5h,031h,0d5h,021h,07fh,021h,0d5h,011h,0d5h,021h,0b3h,001h,0d8h,0fah,0f8h,023h	; a42e  .1.!.!...!.....#
	defb 0e2h,001h,093h,000h,0a4h,020h,0b1h,0fah,0e2h,002h,0c1h,06ah,0b1h,07fh,071h,097h	; a43e  ..... .....j..q.
	defb 0b1h,0b3h,061h,0d5h,041h,0d5h,031h,07fh,031h,0d5h,021h,0d5h,031h,0b3h,011h,0d8h	; a44e  ..a.A.1.1.!.1...
	defb 0e0h,002h,0fah	; a45e

; ----------------------------------------------------------------------
; DATOS partitura_A461: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x17 (tools/partituras.py); lo leen p06:B51E (12 bytes)
;   0xa461..0xa46d  (12 bytes)
DATA_partitura_A461:
	defb 0feh,002h,0f9h,039h,09fh,0f9h,091h,0a4h,0f9h,051h,0adh,0ffh	; a461  ...9.....Q..

; ----------------------------------------------------------------------
; DATOS partitura_A46D: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x17 (tools/partituras.py); lo leen p06:B51E (12 bytes)
;   0xa46d..0xa479  (12 bytes)
DATA_partitura_A46D:
	defb 0feh,002h,0f9h,06ch,09fh,0f9h,0c6h,0a4h,0f9h,0d3h,0adh,0ffh	; a46d  ...l........

; ----------------------------------------------------------------------
; DATOS partitura_A479: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x18 (tools/partituras.py); lo leen p06:B51E (12 bytes)
;   0xa479..0xa485  (12 bytes)
DATA_partitura_A479:
	defb 0feh,002h,0f9h,097h,09fh,0f9h,091h,0a4h,0f9h,051h,0adh,0ffh	; a479  .........Q..

; ----------------------------------------------------------------------
; DATOS partitura_A485: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x17, 0x18 (tools/partituras.py); lo leen p06:B51E (118 bytes)
;   0xa485..0xa4fb  (118 bytes)
DATA_partitura_A485:
	defb 0feh,002h,0f9h,0d1h,09fh,0f9h,0c6h,0a4h,0f9h,0d3h,0adh,0ffh,0e0h,002h,0eeh,005h	; a485  ................
	defb 0e2h,001h,064h,000h,063h,010h,071h,0e8h,071h,085h,071h,046h,061h,050h,071h,049h	; a495  ..d.c.q.q.qFaPqI
	defb 071h,038h,063h,000h,074h,020h,071h,0fah,0e2h,002h,081h,06ah,071h,07fh,061h,097h	; a4a5  q8c.t q....jq.a.
	defb 071h,0b3h,061h,0d5h,041h,0d5h,021h,07fh,021h,0d5h,011h,0d5h,021h,0b3h,001h,0d8h	; a4b5  q.a.A.!.!...!...
	defb 0fah,0f8h,023h,0e2h,001h,0a4h,000h,0a3h,010h,0a1h,0e8h,0a1h,085h,0a1h,046h,091h	; a4c5  ..#...........F.
	defb 050h,0a1h,049h,0a1h,038h,083h,000h,094h,020h,0a1h,0fah,0e2h,002h,0c1h,06ah,0b1h	; a4d5  P.I.8... .....j.
	defb 07fh,061h,097h,0a1h,0b3h,0c1h,0d5h,0a1h,0d5h,021h,07fh,021h,0d5h,011h,0d5h,021h	; a4e5  .a.......!.!...!
	defb 0b3h,001h,0d8h,0e0h,002h,0fah	; a4f5

; ----------------------------------------------------------------------
; DATOS partitura_A4FB: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x19 (tools/partituras.py); lo leen p06:B51E (46 bytes)
;   0xa4fb..0xa529  (46 bytes)
DATA_partitura_A4FB:
	defb 0feh,002h,0e0h,002h,0eeh,005h,0e2h,001h,0f7h,002h,0f9h,054h,0a5h,0dfh,0f9h,061h	; a4fb  ...........T...a
	defb 0a5h,042h,0f0h,054h,010h,061h,0eah,0e2h,002h,061h,06ah,051h,07fh,041h,087h,051h	; a50b  .B.T.a...ajQ.A.Q
	defb 0b3h,061h,0d5h,051h,0d5h,021h,07fh,021h,0d5h,011h,0d5h,021h,0b3h,0ffh	; a51b  .a.Q.!.!...!..

; ----------------------------------------------------------------------
; DATOS partitura_A529: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x19 (tools/partituras.py); lo leen p06:B51E (81 bytes)
;   0xa529..0xa57a  (81 bytes)
DATA_partitura_A529:
	defb 0feh,002h,0f8h,023h,0e2h,001h,0f9h,054h,0a5h,0f9h,061h,0a5h,062h,0f0h,074h,010h	; a529  ...#...T..a.b.t.
	defb 081h,0eah,0e2h,002h,0a1h,06ah,091h,07fh,051h,087h,081h,0b3h,0a1h,0d5h,081h,0d5h	; a539  .....j..Q.......
	defb 021h,07fh,021h,0d5h,011h,0d5h,021h,0b3h,0e0h,002h,0ffh,084h,000h,083h,010h,000h	; a549  !.!...!.........
	defb 000h,081h,076h,081h,045h,081h,008h,0fah,030h,0fdh,040h,0f8h,021h,008h,031h,076h	; a559  ..v.E...0.@.!.1v
	defb 020h,0fdh,021h,008h,031h,020h,041h,030h,041h,045h,031h,064h,031h,089h,031h,090h	; a569   .!.1 A0AE1d1.1.
	defb 0fah	; a579

; ----------------------------------------------------------------------
; DATOS partitura_A57A: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x1A (tools/partituras.py); lo leen p06:B51E (47 bytes)
;   0xa57a..0xa5a9  (47 bytes)
DATA_partitura_A57A:
	defb 0feh,002h,0e0h,002h,0eeh,005h,0e2h,001h,074h,030h,063h,040h,061h,090h,061h,0c0h	; a57a  ........t0c@a.a.
	defb 000h,000h,061h,0b6h,061h,075h,061h,050h,051h,043h,061h,038h,041h,032h,031h,038h	; a58a  ..a.auaPQCa8A218
	defb 041h,0a6h,031h,032h,031h,038h,041h,050h,0f9h,0dbh,0a5h,0f9h,0e6h,0a5h,0ffh	; a59a  A.1218AP.......

; ----------------------------------------------------------------------
; DATOS partitura_A5A9: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x1A (tools/partituras.py); lo leen p06:B51E (72 bytes)
;   0xa5a9..0xa5f1  (72 bytes)
DATA_partitura_A5A9:
	defb 0feh,002h,0f8h,023h,0e2h,001h,0c4h,030h,0c3h,040h,0a1h,090h,0a1h,0c0h,000h,000h	; a5a9  ...#...0.@......
	defb 0a1h,0b6h,0a1h,075h,091h,050h,061h,043h,081h,038h,041h,032h,021h,038h,031h,0a6h	; a5b9  ...u.PaC.8A2!81.
	defb 021h,032h,021h,038h,031h,050h,0f9h,0dbh,0a5h,0f7h,002h,0f9h,0e6h,0a5h,0dfh,0e0h	; a5c9  !2!81P..........
	defb 002h,0ffh,041h,060h,041h,075h,031h,094h,031h,0c9h,031h,0d0h,0fah,021h,038h,0f4h	; a5d9  ..A`Au1.1.1..!8.
	defb 050h,060h,075h,094h,0c9h,0d0h,0f6h,0fah	; a5e9  P`u.....

; ----------------------------------------------------------------------
; DATOS partitura_A5F1: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x1B (tools/partituras.py); lo leen p06:B51E (39 bytes)
;   0xa5f1..0xa618  (39 bytes)
DATA_partitura_A5F1:
	defb 0feh,002h,0e0h,001h,0eeh,005h,0e2h,001h,083h,000h,082h,040h,081h,063h,0e2h,004h	; a5f1  ...........@.c..
	defb 081h,034h,081h,064h,081h,076h,061h,084h,0e2h,001h,081h,0a4h,043h,000h,042h,040h	; a601  .4.d.va.....C.B@
	defb 0e2h,004h,031h,076h,031h,084h,0ffh	; a611

; ----------------------------------------------------------------------
; DATOS partitura_A618: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x1B (tools/partituras.py); lo leen p06:B51E (39 bytes)
;   0xa618..0xa63f  (39 bytes)
DATA_partitura_A618:
	defb 0feh,002h,0f8h,023h,0e2h,001h,0a3h,000h,092h,040h,0a1h,063h,0e2h,004h,0a1h,034h	; a618  ...#.....@.c...4
	defb 0a1h,064h,0a1h,076h,061h,084h,0e2h,001h,0a1h,0a4h,043h,000h,042h,040h,0e2h,004h	; a628  .d.va.....C.B@..
	defb 001h,076h,001h,084h,0e0h,001h,0ffh	; a638

; ----------------------------------------------------------------------
; DATOS partitura_A63F: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x1C (tools/partituras.py); lo leen p06:B51E (40 bytes)
;   0xa63f..0xa667  (40 bytes)
DATA_partitura_A63F:
	defb 0feh,002h,0e0h,002h,0e2h,004h,080h,047h,080h,054h,0fbh,002h,045h,0a6h,070h,047h	; a63f  .......G.T..E.pG
	defb 070h,054h,060h,047h,060h,054h,050h,047h,050h,054h,040h,047h,040h,054h,030h,054h	; a64f  pT`G`TPGPT@G@T0T
	defb 030h,054h,0e0h,006h,0f9h,083h,0b0h,0ffh	; a65f  0T......

; ----------------------------------------------------------------------
; DATOS partitura_A667: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x1C (tools/partituras.py); lo leen p06:B51E (44 bytes)
;   0xa667..0xa693  (44 bytes)
DATA_partitura_A667:
	defb 0feh,002h,0f8h,023h,0e2h,004h,0c0h,047h,0c0h,054h,0fbh,002h,06dh,0a6h,060h,047h	; a667  ...#...G.T..m.`G
	defb 060h,054h,040h,047h,040h,054h,030h,047h,030h,054h,010h,047h,010h,054h,000h,047h	; a677  `T@G@T0G0T.G.T.G
	defb 000h,054h,000h,047h,000h,054h,0e0h,002h,0f9h,005h,0b1h,0ffh	; a687  .T.G.T......

; ----------------------------------------------------------------------
; DATOS partitura_A693: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x1D (tools/partituras.py); lo leen p06:B51E (21 bytes)
;   0xa693..0xa6a8  (21 bytes)
DATA_partitura_A693:
	defb 0feh,002h,0e0h,001h,0eeh,001h,0e2h,007h,090h,0a3h,090h,0c1h,0fbh,003h,09bh,0a6h	; a693  ................
	defb 030h,0a3h,030h,0c1h,0ffh	; a6a3

; ----------------------------------------------------------------------
; DATOS partitura_A6A8: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x1D (tools/partituras.py); lo leen p06:B51E (21 bytes)
;   0xa6a8..0xa6bd  (21 bytes)
DATA_partitura_A6A8:
	defb 0feh,002h,0f8h,023h,0e2h,007h,0a0h,0a3h,0a0h,0c1h,0fbh,003h,0aeh,0a6h,010h,0a3h	; a6a8  ...#............
	defb 010h,0c1h,0e0h,001h,0ffh	; a6b8

; ----------------------------------------------------------------------
; DATOS partitura_A6BD: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x1E (tools/partituras.py); lo leen p06:B51E (6 bytes)
;   0xa6bd..0xa6c3  (6 bytes)
DATA_partitura_A6BD:
	defb 0feh,001h,0f9h,083h,0b0h,0ffh	; a6bd

; ----------------------------------------------------------------------
; DATOS partitura_A6C3: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x1E (tools/partituras.py); lo leen p06:B51E (6 bytes)
;   0xa6c3..0xa6c9  (6 bytes)
DATA_partitura_A6C3:
	defb 0feh,001h,0f9h,005h,0b1h,0ffh	; a6c3

; ----------------------------------------------------------------------
; DATOS partitura_A6C9: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x1F (tools/partituras.py); lo leen p06:B51E (6 bytes)
;   0xa6c9..0xa6cf  (6 bytes)
DATA_partitura_A6C9:
	defb 0feh,001h,0f9h,051h,0adh,0ffh	; a6c9

; ----------------------------------------------------------------------
; DATOS partitura_A6CF: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x1F (tools/partituras.py); lo leen p06:B51E (6 bytes)
;   0xa6cf..0xa6d5  (6 bytes)
DATA_partitura_A6CF:
	defb 0feh,001h,0f9h,0d3h,0adh,0ffh	; a6cf

; ----------------------------------------------------------------------
; DATOS partitura_A6D5: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x20 (tools/partituras.py); lo leen p06:B51E (6 bytes)
;   0xa6d5..0xa6db  (6 bytes)
DATA_partitura_A6D5:
	defb 0feh,001h,0f9h,08fh,0afh,0ffh	; a6d5

; ----------------------------------------------------------------------
; DATOS partitura_A6DB: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x20 (tools/partituras.py); lo leen p06:B51E (6 bytes)
;   0xa6db..0xa6e1  (6 bytes)
DATA_partitura_A6DB:
	defb 0feh,001h,0f9h,0f6h,0afh,0ffh	; a6db

; ----------------------------------------------------------------------
; DATOS partitura_A6E1: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x21 (tools/partituras.py); lo leen p06:B51E (6 bytes)
;   0xa6e1..0xa6e7  (6 bytes)
DATA_partitura_A6E1:
	defb 0feh,001h,0f9h,070h,0aeh,0ffh	; a6e1

; ----------------------------------------------------------------------
; DATOS partitura_A6E7: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x21 (tools/partituras.py); lo leen p06:B51E (6 bytes)
;   0xa6e7..0xa6ed  (6 bytes)
DATA_partitura_A6E7:
	defb 0feh,001h,0f9h,0f2h,0aeh,0ffh	; a6e7

; ----------------------------------------------------------------------
; DATOS partitura_A6ED: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x22 (tools/partituras.py); lo leen p06:B51E (6 bytes)
;   0xa6ed..0xa6f3  (6 bytes)
DATA_partitura_A6ED:
	defb 0feh,001h,0f9h,070h,0aeh,0ffh	; a6ed

; ----------------------------------------------------------------------
; DATOS partitura_A6F3: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x23 (tools/partituras.py); lo leen p06:B51E (27 bytes)
;   0xa6f3..0xa70e  (27 bytes)
DATA_partitura_A6F3:
	defb 0feh,001h,0e9h,006h,0c3h,0feh,004h,0d0h,0e9h,004h,071h,0feh,001h,0e9h,001h,0c0h	; a6f3  ..........q.....
	defb 0fbh,006h,0f8h,0a6h,0feh,004h,0d0h,0e9h,006h,07fh,0ffh	; a703  ...........

; ----------------------------------------------------------------------
; DATOS partitura_A70E: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x23 (tools/partituras.py); lo leen p06:B51E (13 bytes)
;   0xa70e..0xa71b  (13 bytes)
DATA_partitura_A70E:
	defb 0feh,001h,0e9h,006h,0c5h,0feh,004h,0d0h,0e9h,004h,087h,08fh,0ffh	; a70e  .............

; ----------------------------------------------------------------------
; DATOS partitura_A71B: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x23 (tools/partituras.py); lo leen p06:B51E (66 bytes)
;   0xa71b..0xa75d  (66 bytes)
DATA_partitura_A71B:
	defb 0feh,002h,0f9h,0d2h,0a7h,0e4h,01dh,00ah,0e4h,01fh,00ah,0fbh,018h,020h,0a7h,0e4h	; a71b  ............. ..
	defb 01dh,009h,0e4h,01fh,009h,0fbh,010h,02ah,0a7h,0e4h,01dh,008h,0e4h,01fh,008h,0fbh	; a72b  .......*........
	defb 008h,034h,0a7h,0e4h,01dh,007h,0e4h,01fh,007h,0fbh,006h,03eh,0a7h,0e4h,01dh,004h	; a73b  .4.........>....
	defb 0e4h,01fh,004h,0fbh,004h,048h,0a7h,0e4h,01dh,003h,0e4h,01fh,003h,0fbh,002h,052h	; a74b  .....H.........R
	defb 0a7h,0ffh	; a75b

; ----------------------------------------------------------------------
; DATOS partitura_A75D: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x23 (tools/partituras.py); lo leen p06:B51E (36 bytes)
;   0xa75d..0xa781  (36 bytes)
DATA_partitura_A75D:
	defb 0feh,002h,0f9h,00ch,0a8h,0f9h,0c5h,0a7h,0fbh,00bh,062h,0a7h,0f7h,004h,0f9h,0c5h	; a75d  ..........b.....
	defb 0a7h,0fbh,004h,06bh,0a7h,0f7h,007h,0f9h,0c5h,0a7h,0fbh,002h,074h,0a7h,0f7h,008h	; a76d  ...k........t...
	defb 0f9h,0c5h,0a7h,0ffh	; a77d

; ----------------------------------------------------------------------
; DATOS partitura_A781: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x23 (tools/partituras.py); lo leen p06:B51E (19 bytes)
;   0xa781..0xa794  (19 bytes)
DATA_partitura_A781:
	defb 0feh,001h,0e9h,006h,0c2h,0feh,004h,0d0h,0f8h,004h,0e9h,004h,0a1h,0fbh,00ah,08dh	; a781  ................
	defb 0a7h,0afh,0ffh	; a791

; ----------------------------------------------------------------------
; DATOS partitura_A794: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x23 (tools/partituras.py); lo leen p06:B51E (19 bytes)
;   0xa794..0xa7a7  (19 bytes)
DATA_partitura_A794:
	defb 0feh,001h,0e9h,006h,0c2h,0feh,004h,0d0h,0f8h,00dh,0e9h,004h,061h,0fbh,00ah,0a0h	; a794  ............a...
	defb 0a7h,06fh,0ffh	; a7a4

; ----------------------------------------------------------------------
; DATOS partitura_A7A7: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x23 (tools/partituras.py); lo leen p06:B51E (16 bytes)
;   0xa7a7..0xa7b7  (16 bytes)
DATA_partitura_A7A7:
	defb 0feh,001h,0e9h,006h,0c2h,0feh,004h,0d0h,0f8h,004h,0e9h,004h,05fh,053h,05fh,0ffh	; a7a7  ............_S_.

; ----------------------------------------------------------------------
; DATOS partitura_A7B7: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x23, 0x24, 0x28 (tools/partituras.py); lo leen p06:B51E (142 bytes)
;   0xa7b7..0xa845  (142 bytes)
DATA_partitura_A7B7:
	defb 0feh,001h,0e9h,006h,0c2h,0feh,004h,0d0h,0e9h,004h,05bh,052h,05fh,0ffh,089h,0cah	; a7b7  ..........[R_...
	defb 088h,012h,08ah,0e4h,086h,00ah,088h,014h,08ah,0dch,0fah,0e1h,001h,0e4h,01bh,002h	; a7c7  ................
	defb 0e4h,01fh,003h,0e4h,01eh,004h,0e4h,01dh,005h,0e4h,01fh,006h,0e4h,01dh,007h,0e4h	; a7d7  ................
	defb 01fh,008h,0e4h,01dh,009h,0e4h,017h,009h,0e4h,01fh,009h,0e4h,01dh,009h,0e4h,01fh	; a7e7  ................
	defb 009h,0e4h,01dh,009h,009h,0e4h,01eh,009h,0e4h,01fh,009h,0e4h,01dh,009h,0e4h,01eh	; a7f7  ................
	defb 009h,0e4h,018h,009h,0fah,0f8h,01dh,0e2h,001h,018h,000h,02ah,0e4h,03ah,00ah,048h	; a807  ...........*.:.H
	defb 002h,05ah,0e4h,066h,00ah,078h,004h,07ah,0e4h,07ah,00ah,078h,006h,07ah,0e4h,07eh	; a817  .Z.f.x.z.z.x.z.~
	defb 00ah,078h,008h,07ah,0e4h,07eh,00ah,078h,00ah,07ah,0e4h,07bh,00ah,078h,00ch,07ah	; a827  .x.z.~.x.z.{.x.z
	defb 0e4h,07dh,00ah,078h,00eh,07ah,0e4h,07fh,00ah,078h,010h,07ah,0e4h,0fah	; a837  .}.x.z...x.z..

; ----------------------------------------------------------------------
; DATOS partitura_A845: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x24 (tools/partituras.py); lo leen p06:B51E (73 bytes)
;   0xa845..0xa88e  (73 bytes)
DATA_partitura_A845:
	defb 0feh,002h,0f9h,015h,0a9h,0feh,002h,0f9h,0d2h,0a7h,0e4h,01dh,00ah,0e4h,01fh,00ah	; a845  ................
	defb 0fbh,020h,04fh,0a8h,0e4h,01dh,009h,0e4h,01fh,009h,0fbh,010h,059h,0a8h,0e4h,01dh	; a855  . O.........Y...
	defb 008h,0e4h,01fh,008h,0fbh,008h,063h,0a8h,0e4h,01dh,007h,0e4h,01fh,007h,0fbh,006h	; a865  ......c.........
	defb 06dh,0a8h,0e4h,01dh,005h,0e4h,01fh,005h,0fbh,004h,077h,0a8h,0e4h,01dh,003h,0e4h	; a875  m.........w.....
	defb 01fh,003h,0fbh,002h,081h,0a8h,0e0h,00fh,0ffh	; a885  .........

; ----------------------------------------------------------------------
; DATOS partitura_A88E: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x24 (tools/partituras.py); lo leen p06:B51E (41 bytes)
;   0xa88e..0xa8b7  (41 bytes)
DATA_partitura_A88E:
	defb 0feh,002h,0f9h,032h,0a9h,0feh,002h,0f9h,00ch,0a8h,0f9h,0c5h,0a7h,0fbh,00dh,098h	; a88e  ...2............
	defb 0a8h,0f7h,004h,0f9h,0c5h,0a7h,0fbh,004h,0a1h,0a8h,0f7h,006h,0f9h,0c5h,0a7h,0fbh	; a89e  ................
	defb 002h,0aah,0a8h,0f7h,008h,0f9h,0c5h,0a7h,0ffh	; a8ae  .........

; ----------------------------------------------------------------------
; DATOS partitura_A8B7: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x25 (tools/partituras.py); lo leen p06:B51E (6 bytes)
;   0xa8b7..0xa8bd  (6 bytes)
DATA_partitura_A8B7:
	defb 0feh,002h,0f9h,051h,0adh,0ffh	; a8b7

; ----------------------------------------------------------------------
; DATOS partitura_A8BD: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x25 (tools/partituras.py); lo leen p06:B51E (6 bytes)
;   0xa8bd..0xa8c3  (6 bytes)
DATA_partitura_A8BD:
	defb 0feh,002h,0f9h,0d3h,0adh,0ffh	; a8bd

; ----------------------------------------------------------------------
; DATOS partitura_A8C3: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x26 (tools/partituras.py); lo leen p06:B51E (35 bytes)
;   0xa8c3..0xa8e6  (35 bytes)
DATA_partitura_A8C3:
	defb 0feh,002h,0eeh,002h,0e0h,001h,0e2h,001h,070h,0c0h,080h,060h,080h,030h,060h,018h	; a8c3  ........p..`.0`.
	defb 030h,018h,020h,018h,0e0h,003h,0e2h,001h,030h,0c0h,030h,060h,030h,030h,020h,018h	; a8d3  0. .....0.0`00 .
	defb 0e0h,001h,0ffh	; a8e3

; ----------------------------------------------------------------------
; DATOS partitura_A8E6: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x26 (tools/partituras.py); lo leen p06:B51E (35 bytes)
;   0xa8e6..0xa909  (35 bytes)
DATA_partitura_A8E6:
	defb 0feh,002h,0f8h,005h,0e2h,001h,0a0h,0c0h,0b0h,060h,0b0h,030h,070h,018h,020h,018h	; a8e6  .........`.0p. .
	defb 000h,018h,0e0h,003h,0e2h,001h,020h,0c0h,020h,060h,020h,030h,020h,018h,000h,018h	; a8f6  ...... . ` 0 ...
	defb 000h,018h,0ffh	; a906

; ----------------------------------------------------------------------
; DATOS partitura_A909: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x27 (tools/partituras.py); lo leen p06:B51E (6 bytes)
;   0xa909..0xa90f  (6 bytes)
DATA_partitura_A909:
	defb 0feh,002h,0f9h,015h,0a9h,0ffh	; a909

; ----------------------------------------------------------------------
; DATOS partitura_A90F: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x24, 0x27 (tools/partituras.py); lo leen p06:B51E (70 bytes)
;   0xa90f..0xa955  (70 bytes)
DATA_partitura_A90F:
	defb 0feh,002h,0f9h,032h,0a9h,0ffh,0e0h,001h,0e2h,003h,080h,0beh,080h,061h,090h,020h	; a90f  ...2.........a.
	defb 0f4h,010h,015h,013h,0f6h,050h,020h,0f4h,010h,015h,013h,0f6h,030h,020h,0f4h,010h	; a91f  .....P .....0 ..
	defb 015h,013h,0fah,0f8h,005h,0e2h,003h,0c0h,0bah,0c0h,05dh,0f8h,01dh,050h,080h,050h	; a92f  ..........]..P.P
	defb 040h,090h,052h,090h,040h,020h,080h,0f4h,040h,052h,040h,0f6h,000h,080h,0f4h,040h	; a93f  @.R.@ ..@R@....@
	defb 052h,040h,0f6h,0e0h,001h,0fah	; a94f

; ----------------------------------------------------------------------
; DATOS partitura_A955: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x48 (tools/partituras.py); lo leen p06:B51E (1 bytes)
;   0xa955..0xa956  (1 bytes)
DATA_partitura_A955:
	defb 0ffh	; a955

; ----------------------------------------------------------------------
; DATOS partitura_A956: 33 bytes con forma de partitura (0xFE 0x02 y ordenes
;   0xE0-0xFE) que no apunta ninguna cabecera ni ningun salto de los 72
;   sonidos: SIN LECTOR A LA VISTA; lo leen nadie (33 bytes)
;   0xa956..0xa977  (33 bytes)
DATA_partitura_A956:
	defb 0feh,002h,0e0h,005h,0eeh,001h,0e2h,005h,090h,0ach,061h,00fh,090h,0ach,041h,00fh	; a956  ..........a...A.
	defb 060h,0ach,041h,00fh,050h,0ach,031h,00fh,040h,0ach,031h,00fh,030h,0ach,021h,00fh	; a966  `.A.P.1.@.1.0.!.
	defb 0ffh	; a976

; ----------------------------------------------------------------------
; DATOS partitura_A977: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x48 (tools/partituras.py); lo leen p06:B51E (1 bytes)
;   0xa977..0xa978  (1 bytes)
DATA_partitura_A977:
	defb 0ffh	; a977

; ----------------------------------------------------------------------
; DATOS partitura_A978: 33 bytes con forma de partitura (0xFE 0x02 y ordenes
;   0xE0-0xFE) que no apunta ninguna cabecera ni ningun salto de los 72
;   sonidos: SIN LECTOR A LA VISTA; lo leen nadie (33 bytes)
;   0xa978..0xa999  (33 bytes)
DATA_partitura_A978:
	defb 0feh,002h,0f8h,025h,0e2h,005h,0c0h,0ach,081h,00fh,0c0h,0ach,031h,00fh,050h,0ach	; a978  ...%........1.P.
	defb 021h,00fh,030h,0ach,001h,00fh,020h,0ach,001h,00fh,010h,0ach,001h,00fh,000h,0ach	; a988  !.0... .........
	defb 0ffh	; a998

; ----------------------------------------------------------------------
; DATOS partitura_A999: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x28 (tools/partituras.py); lo leen p06:B51E (101 bytes)
;   0xa999..0xa9fe  (101 bytes)
DATA_partitura_A999:
	defb 0feh,002h,0e3h,001h,0e4h,017h,070h,01fh,030h,060h,000h,000h,0e2h,001h,0e5h,009h	; a999  ......p.0`......
	defb 009h,000h,000h,098h,0e3h,001h,0e4h,002h,0b0h,00eh,060h,0a0h,030h,0a0h,000h,000h	; a9a9  ..........`.0...
	defb 0e3h,003h,0e4h,001h,080h,004h,0e2h,001h,080h,098h,0e3h,004h,0e4h,002h,050h,00eh	; a9b9  ..............P.
	defb 0e3h,003h,0e4h,001h,040h,004h,0e2h,001h,050h,098h,0e3h,004h,0e4h,002h,020h,00eh	; a9c9  ....@...P..... .
	defb 0e3h,003h,0e4h,001h,010h,004h,0e2h,001h,030h,098h,0e3h,004h,0e4h,002h,000h,00eh	; a9d9  ........0.......
	defb 0e3h,003h,0e4h,001h,000h,004h,0feh,001h,0e9h,006h,0c7h,0feh,004h,0d0h,0e9h,004h	; a9e9  ................
	defb 0eeh,001h,08fh,08fh,0ffh	; a9f9

; ----------------------------------------------------------------------
; DATOS partitura_A9FE: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x28 (tools/partituras.py); lo leen p06:B51E (43 bytes)
;   0xa9fe..0xaa29  (43 bytes)
DATA_partitura_A9FE:
	defb 0feh,002h,0e0h,003h,0e2h,001h,0c0h,097h,0e2h,007h,000h,097h,0e2h,001h,060h,097h	; a9fe  ..............`.
	defb 0e0h,007h,0e2h,001h,040h,097h,0e0h,007h,0e2h,001h,020h,097h,0e0h,007h,0feh,001h	; aa0e  ....@..... .....
	defb 0e9h,006h,0c7h,0feh,004h,0d0h,0e9h,004h,08fh,08fh,0ffh	; aa1e  ...........

; ----------------------------------------------------------------------
; DATOS partitura_AA29: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x28 (tools/partituras.py); lo leen p06:B51E (96 bytes)
;   0xaa29..0xaa89  (96 bytes)
DATA_partitura_AA29:
	defb 0feh,002h,0e0h,003h,0e2h,001h,0c0h,099h,0e2h,007h,000h,099h,0e2h,001h,060h,099h	; aa29  ..............`.
	defb 0e0h,007h,0e2h,001h,040h,099h,0e0h,007h,0e2h,001h,020h,099h,0e0h,007h,0f7h,001h	; aa39  ....@..... .....
	defb 0f9h,0d2h,0a7h,0e4h,01dh,009h,0e4h,01fh,009h,0fbh,030h,04ch,0aah,0e4h,01dh,008h	; aa49  ..........0L....
	defb 0e4h,01fh,008h,0fbh,00ch,056h,0aah,0e4h,01dh,007h,0e4h,01fh,007h,0fbh,008h,060h	; aa59  .....V.........`
	defb 0aah,0e4h,01dh,006h,0e4h,01fh,006h,0fbh,006h,06ah,0aah,0e4h,01dh,004h,0e4h,01fh	; aa69  .........j......
	defb 004h,0fbh,004h,074h,0aah,0e4h,01dh,003h,0e4h,01fh,003h,0fbh,002h,07eh,0aah,0ffh	; aa79  ...t.........~..

; ----------------------------------------------------------------------
; DATOS partitura_AA89: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x28 (tools/partituras.py); lo leen p06:B51E (115 bytes)
;   0xaa89..0xaafc  (115 bytes)
DATA_partitura_AA89:
	defb 0feh,002h,0e0h,003h,0e2h,001h,0f8h,031h,0c0h,098h,0e0h,007h,0f8h,005h,0e2h,001h	; aa89  .......1........
	defb 040h,098h,0e0h,007h,0e2h,001h,000h,098h,0e0h,00eh,0f8h,01dh,0e2h,001h,008h,000h	; aa99  @...............
	defb 01ah,0e4h,02ah,00ah,038h,002h,04ah,0e4h,056h,00ah,068h,004h,06ah,0e4h,06ah,00ah	; aaa9  ..*.8.J.V.h.j.j.
	defb 068h,006h,06ah,0e4h,06eh,00ah,068h,008h,06ah,0e4h,06eh,00ah,068h,00ah,06ah,0e4h	; aab9  h.j.n.h.j.n.h.j.
	defb 06bh,00ah,068h,00ch,06ah,0e4h,06dh,00ah,068h,00eh,06ah,0e4h,06fh,00ah,068h,010h	; aac9  k.h.j.m.h.j.o.h.
	defb 06ah,0e4h,0f7h,001h,0f9h,0c5h,0a7h,0fbh,00ch,0ddh,0aah,0f7h,005h,0f9h,0c5h,0a7h	; aad9  j...............
	defb 0fbh,004h,0e6h,0aah,0f7h,007h,0f9h,0c5h,0a7h,0fbh,002h,0efh,0aah,0f7h,008h,0f9h	; aae9  ................
	defb 0c5h,0a7h,0ffh	; aaf9

; ----------------------------------------------------------------------
; DATOS partitura_AAFC: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x28 (tools/partituras.py); lo leen p06:B51E (28 bytes)
;   0xaafc..0xab18  (28 bytes)
DATA_partitura_AAFC:
	defb 0feh,002h,0e0h,003h,0e2h,001h,0f8h,031h,0c0h,098h,0e0h,01fh,0e0h,003h,0feh,004h	; aafc  .......1........
	defb 0d0h,0f8h,004h,0e9h,004h,0a1h,0fbh,00eh,011h,0abh,0afh,0ffh	; ab0c  ............

; ----------------------------------------------------------------------
; DATOS partitura_AB18: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x28 (tools/partituras.py); lo leen p06:B51E (31 bytes)
;   0xab18..0xab37  (31 bytes)
DATA_partitura_AB18:
	defb 0feh,002h,0e0h,003h,0e2h,001h,0f8h,00dh,0c0h,098h,0e0h,01fh,0feh,001h,0e9h,006h	; ab18  ................
	defb 0c1h,0feh,004h,0d0h,0f8h,00dh,0e9h,004h,061h,0fbh,00dh,030h,0abh,06fh,0ffh	; ab28  ........a..0.o.

; ----------------------------------------------------------------------
; DATOS partitura_AB37: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x28 (tools/partituras.py); lo leen p06:B51E (28 bytes)
;   0xab37..0xab53  (28 bytes)
DATA_partitura_AB37:
	defb 0feh,002h,0e0h,003h,0f8h,00ch,0e2h,001h,0c0h,097h,0e0h,01fh,0feh,001h,0e9h,006h	; ab37  ................
	defb 0c0h,0feh,004h,0d0h,0f8h,005h,0e9h,004h,05fh,053h,05fh,0ffh	; ab47  ........_S_.

; ----------------------------------------------------------------------
; DATOS partitura_AB53: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x28 (tools/partituras.py); lo leen p06:B51E (24 bytes)
;   0xab53..0xab6b  (24 bytes)
DATA_partitura_AB53:
	defb 0feh,002h,0e0h,003h,0e2h,001h,0c0h,098h,0e0h,01fh,0feh,001h,0e9h,006h,0c2h,0feh	; ab53  ................
	defb 004h,0d0h,0e9h,004h,05bh,052h,05fh,0ffh	; ab63  ....[R_.

; ----------------------------------------------------------------------
; DATOS partitura_AB6B: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x29 (tools/partituras.py); lo leen p06:B51E (40 bytes)
;   0xab6b..0xab93  (40 bytes)
DATA_partitura_AB6B:
	defb 0feh,002h,0e3h,001h,0e4h,006h,0c0h,08fh,0e4h,004h,040h,024h,0e4h,006h,070h,01fh	; ab6b  ..........@$..p.
	defb 0e0h,004h,0e3h,001h,0e4h,003h,030h,01fh,0e0h,007h,0e3h,001h,020h,01fh,0e0h,008h	; ab7b  ......0..... ...
	defb 0e3h,001h,010h,01fh,0f9h,08fh,0afh,0ffh	; ab8b  ........

; ----------------------------------------------------------------------
; DATOS partitura_AB93: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x29 (tools/partituras.py); lo leen p06:B51E (21 bytes)
;   0xab93..0xaba8  (21 bytes)
DATA_partitura_AB93:
	defb 0feh,002h,0f8h,014h,0e2h,001h,0a1h,070h,001h,070h,0e0h,005h,0e2h,001h,0f8h,00ch	; ab93  .......p.p......
	defb 001h,070h,0e0h,011h,0ffh	; aba3

; ----------------------------------------------------------------------
; DATOS partitura_ABA8: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x2A (tools/partituras.py); lo leen p06:B51E (38 bytes)
;   0xaba8..0xabce  (38 bytes)
DATA_partitura_ABA8:
	defb 0feh,002h,0e2h,001h,0e5h,009h,009h,000h,000h,0b0h,0e3h,001h,0e4h,008h,0b0h,008h	; aba8  ................
	defb 0e0h,005h,0e2h,001h,090h,0b0h,0e0h,007h,0e2h,001h,050h,0b0h,0e0h,008h,0e2h,001h	; abb8  ..........P.....
	defb 040h,0b0h,0f9h,051h,0adh,0ffh	; abc8

; ----------------------------------------------------------------------
; DATOS partitura_ABCE: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x2A (tools/partituras.py); lo leen p06:B51E (31 bytes)
;   0xabce..0xabed  (31 bytes)
DATA_partitura_ABCE:
	defb 0feh,002h,0f8h,004h,0e2h,001h,0c0h,0b1h,000h,0b2h,0e0h,005h,0e2h,001h,0f8h,00ch	; abce  ................
	defb 040h,0b1h,0e0h,007h,0e2h,001h,020h,0b1h,0e0h,008h,0e2h,001h,000h,0b1h,0ffh	; abde  @..... ........

; ----------------------------------------------------------------------
; DATOS partitura_ABED: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x2B (tools/partituras.py); lo leen p06:B51E (74 bytes)
;   0xabed..0xac37  (74 bytes)
DATA_partitura_ABED:
	defb 0feh,002h,0e3h,001h,0e4h,017h,0c0h,021h,0e4h,01dh,040h,062h,0e2h,001h,0e5h,009h	; abed  .......!..@b....
	defb 009h,000h,000h,098h,0e3h,001h,0e4h,00eh,080h,03eh,040h,03eh,030h,03eh,020h,03eh	; abfd  .........>@>0> >
	defb 0e2h,001h,0a0h,098h,0e3h,001h,060h,03eh,040h,03eh,030h,03eh,0e0h,004h,0e2h,001h	; ac0d  ......`>@>0>....
	defb 060h,098h,0e3h,001h,040h,03eh,030h,03eh,020h,03eh,0e0h,004h,0e2h,001h,040h,098h	; ac1d  `...@>0> >....@.
	defb 0e3h,001h,030h,03eh,020h,03eh,0f9h,083h,0b0h,0ffh	; ac2d  ..0> >....

; ----------------------------------------------------------------------
; DATOS partitura_AC37: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x2B (tools/partituras.py); lo leen p06:B51E (53 bytes)
;   0xac37..0xac6c  (53 bytes)
DATA_partitura_AC37:
	defb 0feh,002h,0f8h,028h,0e2h,001h,041h,021h,000h,000h,0f8h,031h,0c0h,096h,0f8h,00bh	; ac37  ...(..A!...1....
	defb 020h,030h,000h,030h,000h,030h,000h,000h,0f8h,031h,080h,096h,0f8h,00bh,000h,030h	; ac47   0.0.0...1.....0
	defb 0e0h,006h,0f8h,031h,0e2h,001h,030h,096h,0f8h,00bh,000h,030h,0e0h,006h,0e2h,001h	; ac57  ...1..0....0....
	defb 0f8h,005h,010h,096h,0ffh	; ac67

; ----------------------------------------------------------------------
; DATOS partitura_AC6C: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x47 (tools/partituras.py); lo leen p06:B51E (74 bytes)
;   0xac6c..0xacb6  (74 bytes)
DATA_partitura_AC6C:
	defb 0feh,002h,0e3h,001h,0e4h,017h,0c0h,01fh,040h,060h,0e2h,001h,0e5h,009h,009h,000h	; ac6c  ........@`......
	defb 000h,078h,0e3h,001h,0e4h,013h,0c0h,01fh,060h,060h,0e2h,003h,080h,078h,0e3h,002h	; ac7c  .x......``...x..
	defb 080h,01fh,050h,060h,0e2h,003h,060h,078h,0e3h,002h,070h,01fh,040h,060h,0e2h,003h	; ac8c  ..P`..`x..p.@`..
	defb 050h,078h,0e3h,002h,060h,01fh,030h,060h,0e2h,003h,040h,078h,0e3h,002h,050h,01fh	; ac9c  Px..`.0`..@x..P.
	defb 020h,060h,0e2h,003h,030h,078h,0f9h,083h,0b0h,0ffh	; acac   `..0x....

; ----------------------------------------------------------------------
; DATOS partitura_ACB6: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x47 (tools/partituras.py); lo leen p06:B51E (48 bytes)
;   0xacb6..0xace6  (48 bytes)
DATA_partitura_ACB6:
	defb 0feh,002h,0f8h,028h,0e2h,001h,0c1h,0d6h,020h,010h,0f8h,031h,0c0h,078h,0f8h,004h	; acb6  ...(.... ..1.x..
	defb 0e0h,004h,0e2h,001h,090h,078h,0e0h,006h,0e2h,001h,040h,078h,0f8h,00ch,0e0h,006h	; acc6  .....x....@x....
	defb 0e2h,001h,040h,078h,0e0h,006h,0e2h,001h,020h,078h,0e0h,007h,0f9h,005h,0b1h,0ffh	; acd6  ..@x.... x......

; ----------------------------------------------------------------------
; DATOS partitura_ACE6: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x2C (tools/partituras.py); lo leen p06:B51E (35 bytes)
;   0xace6..0xad09  (35 bytes)
DATA_partitura_ACE6:
	defb 0feh,002h,0e0h,060h,0feh,004h,0e9h,004h,0d0h,0a3h,0a3h,0a7h,0a3h,0a3h,0a7h,0a3h	; ace6  ...`............
	defb 0a3h,0a3h,0a3h,0a3h,0a3h,0a7h,0fbh,002h,0efh,0ach,0a1h,0fbh,010h,000h,0adh,0abh	; acf6  ................
	defb 0a1h,0abh,0ffh	; ad06

; ----------------------------------------------------------------------
; DATOS partitura_AD09: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x2C (tools/partituras.py); lo leen p06:B51E (35 bytes)
;   0xad09..0xad2c  (35 bytes)
DATA_partitura_AD09:
	defb 0feh,002h,0e0h,060h,0feh,004h,0e9h,004h,0d1h,0b3h,0b3h,0b7h,0b3h,0b3h,0b7h,0b3h	; ad09  ...`............
	defb 0b3h,0b3h,0b3h,0b3h,0b3h,0b7h,0fbh,002h,012h,0adh,0b1h,0fbh,010h,023h,0adh,0bbh	; ad19  .............#..
	defb 0b1h,0bbh,0ffh	; ad29

; ----------------------------------------------------------------------
; DATOS partitura_AD2C: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x07, 0x08, 0x0D, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x17, 0x18, 0x1C, 0x1E y
;   11 mas (tools/partituras.py); lo leen p06:B51E (1074 bytes)
;   0xad2c..0xb15e  (1074 bytes)
DATA_partitura_AD2C:
	defb 0feh,002h,0e0h,060h,0feh,004h,0f8h,028h,0e9h,004h,0d0h,053h,053h,057h,053h,053h	; ad2c  ...`...(...SSWSS
	defb 057h,053h,053h,053h,053h,053h,053h,057h,0fbh,002h,037h,0adh,051h,0fbh,010h,048h	; ad3c  WSSSSSSW..7.Q..H
	defb 0adh,05bh,051h,06bh,0ffh,0feh,002h,0e1h,001h,0e4h,01bh,001h,0e4h,01fh,002h,0e4h	; ad4c  .[Qk............
	defb 01eh,003h,0e4h,01dh,004h,0e4h,01fh,005h,0e4h,01dh,006h,0e4h,01fh,007h,0e4h,01dh	; ad5c  ................
	defb 008h,0e4h,017h,008h,0e4h,01fh,008h,0e4h,01dh,008h,0e4h,01fh,008h,0e4h,01dh,008h	; ad6c  ................
	defb 008h,0e4h,01eh,008h,0e4h,01fh,008h,0e4h,01dh,008h,0e4h,01eh,008h,0e4h,018h,008h	; ad7c  ................
	defb 0e4h,01dh,009h,0e4h,01fh,009h,0fbh,030h,08ch,0adh,0e4h,01dh,008h,0e4h,01fh,008h	; ad8c  .......0........
	defb 0fbh,00ch,096h,0adh,0e4h,01dh,007h,0e4h,01fh,007h,0fbh,008h,0a0h,0adh,0e4h,01dh	; ad9c  ................
	defb 006h,0e4h,01fh,006h,0fbh,006h,0aah,0adh,0e4h,01dh,005h,0e4h,01fh,005h,0fbh,005h	; adac  ................
	defb 0b4h,0adh,0e4h,01dh,004h,0e4h,01fh,004h,0fbh,004h,0beh,0adh,0e4h,01dh,003h,0e4h	; adbc  ................
	defb 01fh,003h,0fbh,002h,0c8h,0adh,0fah,0feh,002h,0f8h,01dh,0e2h,001h,038h,000h,04ah	; adcc  .............8.J
	defb 0e4h,05ah,00ah,068h,002h,07ah,0e4h,086h,00ah,098h,004h,09ah,0e4h,09ah,00ah,098h	; addc  .Z.h.z..........
	defb 006h,09ah,0e4h,09eh,00ah,098h,008h,09ah,0e4h,09eh,00ah,098h,00ah,09ah,0e4h,09bh	; adec  ................
	defb 00ah,098h,00ch,09ah,0e4h,09dh,00ah,098h,00eh,09ah,0e4h,09fh,00ah,098h,010h,09ah	; adfc  ................
	defb 0e4h,0a9h,0cah,0a8h,012h,0aah,0e4h,0a6h,00ah,0a8h,014h,0aah,0dch,0fbh,00ch,00dh	; ae0c  ................
	defb 0aeh,079h,0cah,078h,012h,07ah,0e4h,076h,00ah,078h,014h,07ah,0dch,0fbh,004h,01dh	; ae1c  .y.x.z.v.x.z....
	defb 0aeh,079h,0cah,078h,012h,07ah,0e4h,076h,00ah,078h,014h,07ah,0dch,0fbh,002h,02dh	; ae2c  .y.x.z.v.x.z...-
	defb 0aeh,059h,0cah,058h,012h,05ah,0e4h,056h,00ah,058h,014h,05ah,0dch,0fbh,002h,03dh	; ae3c  .Y.X.Z.V.X.Z...=
	defb 0aeh,039h,0cah,038h,012h,03ah,0e4h,036h,00ah,038h,014h,03ah,0dch,0fbh,002h,04dh	; ae4c  .9.8.:.6.8.:...M
	defb 0aeh,009h,0cah,008h,012h,00ah,0e4h,006h,00ah,008h,014h,00ah,0dch,0fbh,002h,05dh	; ae5c  ...............]
	defb 0aeh,0e0h,013h,0fah,0feh,002h,0e1h,001h,0e4h,01bh,001h,0e4h,01fh,002h,0e4h,01eh	; ae6c  ................
	defb 003h,0e4h,01dh,004h,0e4h,01fh,005h,0e4h,01dh,006h,0e4h,01fh,007h,0e4h,01dh,008h	; ae7c  ................
	defb 0e4h,017h,008h,0e4h,01fh,008h,0e4h,01dh,008h,0e4h,01fh,008h,0e4h,01dh,008h,008h	; ae8c  ................
	defb 0e4h,01eh,008h,0e4h,01fh,008h,0e4h,01dh,008h,0e4h,01eh,008h,0e4h,018h,008h,0e4h	; ae9c  ................
	defb 01dh,009h,0e4h,01fh,009h,0fbh,070h,0abh,0aeh,0e4h,01dh,008h,0e4h,01fh,008h,0fbh	; aeac  ......p.........
	defb 00ch,0b5h,0aeh,0e4h,01dh,007h,0e4h,01fh,007h,0fbh,008h,0bfh,0aeh,0e4h,01dh,006h	; aebc  ................
	defb 0e4h,01fh,006h,0fbh,006h,0c9h,0aeh,0e4h,01dh,005h,0e4h,01fh,005h,0fbh,005h,0d3h	; aecc  ................
	defb 0aeh,0e4h,01dh,004h,0e4h,01fh,004h,0fbh,004h,0ddh,0aeh,0e4h,01dh,003h,0e4h,01fh	; aedc  ................
	defb 003h,0fbh,002h,0e7h,0aeh,0fah,0feh,002h,0f8h,01dh,0e2h,001h,038h,000h,04ah,0e4h	; aeec  ............8.J.
	defb 05ah,00ah,068h,002h,07ah,0e4h,086h,00ah,098h,004h,09ah,0e4h,09ah,00ah,098h,006h	; aefc  Z.h.z...........
	defb 09ah,0e4h,09eh,00ah,098h,008h,09ah,0e4h,09eh,00ah,098h,00ah,09ah,0e4h,09bh,00ah	; af0c  ................
	defb 098h,00ch,09ah,0e4h,09dh,00ah,098h,00eh,09ah,0e4h,09fh,00ah,098h,010h,09ah,0e4h	; af1c  ................
	defb 0a9h,0cah,0a8h,012h,0aah,0e4h,0a6h,00ah,0a8h,014h,0aah,0dch,0fbh,01ch,02ch,0afh	; af2c  ..............,.
	defb 079h,0cah,078h,012h,07ah,0e4h,076h,00ah,078h,014h,07ah,0dch,0fbh,005h,03ch,0afh	; af3c  y.x.z.v.x.z...<.
	defb 079h,0cah,078h,012h,07ah,0e4h,076h,00ah,078h,014h,07ah,0dch,0fbh,002h,04ch,0afh	; af4c  y.x.z.v.x.z...L.
	defb 059h,0cah,058h,012h,05ah,0e4h,056h,00ah,058h,014h,05ah,0dch,0fbh,002h,05ch,0afh	; af5c  Y.X.Z.V.X.Z...\.
	defb 039h,0cah,038h,012h,03ah,0e4h,036h,00ah,038h,014h,03ah,0dch,0fbh,002h,06ch,0afh	; af6c  9.8.:.6.8.:...l.
	defb 009h,0cah,008h,012h,00ah,0e4h,006h,00ah,008h,014h,00ah,0dch,0fbh,002h,07ch,0afh	; af7c  ..............|.
	defb 0e0h,045h,0fah,0feh,002h,0e1h,001h,0e4h,01fh,002h,0e4h,01dh,003h,0e4h,01fh,004h	; af8c  .E..............
	defb 0e4h,01fh,005h,0e4h,01dh,007h,0e4h,01fh,007h,0e4h,01dh,007h,007h,0e4h,01eh,007h	; af9c  ................
	defb 0e4h,018h,007h,0e4h,01dh,009h,0e4h,01fh,009h,0fbh,022h,0afh,0afh,0e4h,01dh,008h	; afac  ..........".....
	defb 0e4h,01fh,008h,0fbh,00ah,0b9h,0afh,0e4h,01dh,007h,0e4h,01fh,007h,0fbh,008h,0c3h	; afbc  ................
	defb 0afh,0e4h,01dh,006h,0e4h,01fh,006h,0fbh,006h,0cdh,0afh,0e4h,01dh,005h,0e4h,01fh	; afcc  ................
	defb 005h,0fbh,005h,0d7h,0afh,0e4h,01dh,004h,0e4h,01fh,004h,0fbh,004h,0e1h,0afh,0e4h	; afdc  ................
	defb 01dh,003h,0e4h,01fh,003h,0fbh,002h,0ebh,0afh,0fah,0feh,002h,0f8h,01dh,0e2h,001h	; afec  ................
	defb 038h,000h,04ah,0e4h,05ah,00ah,068h,002h,07ah,0e4h,086h,00ah,098h,004h,09ah,0e4h	; affc  8.J.Z.h.z.......
	defb 09ah,00ah,098h,006h,09ah,0e4h,09eh,00ah,098h,008h,09ah,0e4h,09eh,00ah,098h,00ah	; b00c  ................
	defb 09ah,0e4h,09bh,00ah,098h,00ch,09ah,0e4h,09dh,00ah,098h,00eh,09ah,0e4h,09fh,00ah	; b01c  ................
	defb 098h,010h,09ah,0e4h,0a9h,0cah,0a8h,012h,0aah,0e4h,0a6h,00ah,0a8h,014h,0aah,0dch	; b02c  ................
	defb 0fbh,004h,030h,0b0h,079h,0cah,078h,012h,07ah,0e4h,076h,00ah,078h,014h,07ah,0dch	; b03c  ..0.y.x.z.v.x.z.
	defb 0fbh,004h,040h,0b0h,059h,0cah,058h,012h,05ah,0e4h,056h,00ah,058h,014h,05ah,0dch	; b04c  ..@.Y.X.Z.V.X.Z.
	defb 0fbh,002h,050h,0b0h,039h,0cah,038h,012h,03ah,0e4h,036h,00ah,038h,014h,03ah,0dch	; b05c  ..P.9.8.:.6.8.:.
	defb 0fbh,002h,060h,0b0h,009h,0cah,008h,012h,00ah,0e4h,006h,00ah,008h,014h,00ah,0dch	; b06c  ..`.............
	defb 0fbh,002h,070h,0b0h,0e0h,026h,0fah,0feh,002h,0e1h,001h,0e4h,01bh,003h,0e4h,01fh	; b07c  ..p..&..........
	defb 004h,0e4h,01eh,005h,0e4h,01dh,006h,0e4h,01fh,007h,0e4h,01dh,008h,0e4h,01fh,009h	; b08c  ................
	defb 0e4h,01dh,00ah,0e4h,017h,00ah,0e4h,01fh,00ah,0e4h,01dh,00ah,0e4h,01fh,00ah,0e4h	; b09c  ................
	defb 01dh,00ah,00ah,0e4h,01eh,00ah,0e4h,01fh,00ah,0e4h,01dh,00ah,0e4h,01eh,00ah,0e4h	; b0ac  ................
	defb 018h,00ah,0e4h,01dh,00ah,0e4h,01fh,00ah,0fbh,038h,0beh,0b0h,0e4h,01dh,009h,0e4h	; b0bc  .........8......
	defb 01fh,009h,0fbh,010h,0c8h,0b0h,0e4h,01dh,008h,0e4h,01fh,008h,0fbh,008h,0d2h,0b0h	; b0cc  ................
	defb 0e4h,01dh,007h,0e4h,01fh,007h,0fbh,004h,0dch,0b0h,0e4h,01dh,006h,0e4h,01fh,006h	; b0dc  ................
	defb 0fbh,004h,0e6h,0b0h,0e4h,01dh,005h,0e4h,01fh,005h,0fbh,004h,0f0h,0b0h,0e4h,01dh	; b0ec  ................
	defb 004h,0e4h,01fh,004h,0fbh,004h,0fah,0b0h,0fah,0feh,002h,0f8h,01dh,0e2h,001h,038h	; b0fc  ...............8
	defb 000h,04ah,0e4h,05ah,00ah,068h,002h,07ah,0e4h,086h,00ah,098h,004h,09ah,0e4h,09ah	; b10c  .J.Z.h.z........
	defb 00ah,098h,006h,09ah,0e4h,09eh,00ah,098h,008h,09ah,0e4h,09eh,00ah,098h,00ah,09ah	; b11c  ................
	defb 0e4h,09bh,00ah,098h,00ch,09ah,0e4h,09dh,00ah,098h,00eh,09ah,0e4h,09fh,00ah,098h	; b12c  ................
	defb 010h,09ah,0e4h,0f8h,015h,0e2h,001h,050h,02ah,060h,027h,070h,02ah,070h,027h,070h	; b13c  .......P*`'p*p'p
	defb 02ah,070h,027h,070h,02ah,0fbh,00ch,049h,0b1h,0e0h,003h,0fch,002h,041h,0b1h,0e0h	; b14c  *p'p*..I.....A..
	defb 04dh,0fah	; b15c

; ======================================================================
; CODIGO 0xb15e..0xb325  (455 bytes)
; ======================================================================


L_B15E:
	ld a,001h		;b15e
	call L_B193		;b160
	ld a,0ffh		;b163
	ld hl,0efe2h		;b165
	ld (hl),a			;b168
	inc hl			;b169
	ld (hl),a			;b16a
	inc hl			;b16b
	ld de,0efe5h		;b16c
	ld (hl),001h		;b16f
	ld bc,0000eh		;b171
	ldir		;b174
	call L_BE14		;b176
	ld a,03fh		;b179
	ld (09000h),a		;b17b
	xor a			;b17e
	ld (0988fh),a		;b17f
	ld a,005h		;b182
	ld (09000h),a		;b184
	ld a,0bfh		;b187
	ld (0efdah),a		;b189
	ld e,a			;b18c
	ld a,007h		;b18d
	jp 00093h		;b18f   ; BIOS WRTPSG - Writes data to PSG-register
L_B192:
	ret			;b192
L_B193:
	ld b,a			;b193
	ld a,(0effah)		;b194
	or a			;b197
	jr z,L_B1C7		;b198
	ld a,b			;b19a
	cp 032h		;b19b
	jr z,L_B192		;b19d
	cp 033h		;b19f
	jr z,L_B192		;b1a1
	cp 034h		;b1a3
	jr z,L_B192		;b1a5
	cp 035h		;b1a7
	jr z,L_B192		;b1a9
	cp 036h		;b1ab
	jr z,L_B192		;b1ad
	cp 037h		;b1af
	jr z,L_B192		;b1b1
	cp 038h		;b1b3
	jr z,L_B192		;b1b5
	cp 039h		;b1b7
	jr z,L_B192		;b1b9
	cp 03ah		;b1bb
	jr z,L_B192		;b1bd
	cp 03bh		;b1bf
	jr z,L_B192		;b1c1
	cp 03ch		;b1c3
	jr z,L_B192		;b1c5
L_B1C7:
	ld a,b			;b1c7
	ld c,a			;b1c8
	cp 080h		;b1c9
	jp z,L_B341		;b1cb
	cp 081h		;b1ce
	jp z,L_B353		;b1d0
	cp 082h		;b1d3
	jp z,L_B348		;b1d5
	cp 085h		;b1d8
	jp z,L_B331		;b1da
	cp 083h		;b1dd
	jp z,L_B3B0		;b1df
	cp 084h		;b1e2
	jp z,L_B36A		;b1e4
	ld hl,0ee00h		;b1e7
	ld a,c			;b1ea
	cp 02dh		;b1eb
	jr nz,L_B1F2		;b1ed
	ld a,(hl)			;b1ef
	cp c			;b1f0
	ret z			;b1f1
L_B1F2:
	cp 02eh		;b1f2
	jr nz,L_B1F9		;b1f4
	ld a,(hl)			;b1f6
	cp c			;b1f7
	ret z			;b1f8
L_B1F9:
	cp 02fh		;b1f9
	jr nz,L_B200		;b1fb
	ld a,(hl)			;b1fd
	cp c			;b1fe
	ret z			;b1ff
L_B200:
	ld hl,0efc3h		;b200
	ld (hl),c			;b203
	ld hl,0600ah		;b204
	ld a,c			;b207
	add a,c			;b208
	ld e,a			;b209
	ld d,000h		;b20a
	add hl,de			;b20c
	ld e,(hl)			;b20d
	inc hl			;b20e
	ld d,(hl)			;b20f
	ex de,hl			;b210
	ld de,0efc4h		;b211
	ld bc,00012h		;b214
	ldir		;b217
	ld ix,0efc6h		;b219
	ld hl,0efc4h		;b21d
	bit 7,(hl)		;b220
	jr z,L_B23B		;b222
	push ix		;b224
	ld ix,0ee00h		;b226
	call L_B405		;b22a
	pop ix		;b22d
	inc hl			;b22f
	ld a,(hl)			;b230
	ld hl,0ee01h		;b231
	call L_B305		;b234
	inc ix		;b237
	inc ix		;b239
L_B23B:
	ld hl,0efc4h		;b23b
	bit 6,(hl)		;b23e
	jr z,L_B259		;b240
	push ix		;b242
	ld ix,0ee2dh		;b244
	call L_B405		;b248
	pop ix		;b24b
	inc hl			;b24d
	ld a,(hl)			;b24e
	ld hl,0ee2eh		;b24f
	call L_B305		;b252
	inc ix		;b255
	inc ix		;b257
L_B259:
	ld hl,0efc4h		;b259
	bit 5,(hl)		;b25c
	jr z,L_B277		;b25e
	push ix		;b260
	ld ix,0ee5ah		;b262
	call L_B405		;b266
	pop ix		;b269
	inc hl			;b26b
	ld a,(hl)			;b26c
	ld hl,0ee5bh		;b26d
	call L_B305		;b270
	inc ix		;b273
	inc ix		;b275
L_B277:
	ld hl,0efc4h		;b277
	bit 4,(hl)		;b27a
	jr z,L_B295		;b27c
	push ix		;b27e
	ld ix,0ee87h		;b280
	call L_B405		;b284
	pop ix		;b287
	inc hl			;b289
	ld a,(hl)			;b28a
	ld hl,0ee88h		;b28b
	call L_B305		;b28e
	inc ix		;b291
	inc ix		;b293
L_B295:
	ld hl,0efc4h		;b295
	bit 3,(hl)		;b298
	jr z,L_B2B3		;b29a
	push ix		;b29c
	ld ix,0eeb4h		;b29e
	call L_B405		;b2a2
	pop ix		;b2a5
	inc hl			;b2a7
	ld a,(hl)			;b2a8
	ld hl,0eeb5h		;b2a9
	call L_B305		;b2ac
	inc ix		;b2af
	inc ix		;b2b1
L_B2B3:
	ld hl,0efc4h		;b2b3
	bit 2,(hl)		;b2b6
	jr z,L_B2D1		;b2b8
	push ix		;b2ba
	ld ix,0eee1h		;b2bc
	call L_B405		;b2c0
	pop ix		;b2c3
	inc hl			;b2c5
	ld a,(hl)			;b2c6
	ld hl,0eee2h		;b2c7
	call L_B305		;b2ca
	inc ix		;b2cd
	inc ix		;b2cf
L_B2D1:
	ld hl,0efc4h		;b2d1
	bit 1,(hl)		;b2d4
	jr z,L_B2EF		;b2d6
	push ix		;b2d8
	ld ix,0ef0eh		;b2da
	call L_B405		;b2de
	pop ix		;b2e1
	inc hl			;b2e3
	ld a,(hl)			;b2e4
	ld hl,0ef0fh		;b2e5
	call L_B305		;b2e8
	inc ix		;b2eb
	inc ix		;b2ed
L_B2EF:
	ld hl,0efc4h		;b2ef
	bit 0,(hl)		;b2f2
	ret z			;b2f4
	push ix		;b2f5
	ld ix,0ef3bh		;b2f7
	call L_B405		;b2fb
	pop ix		;b2fe
	inc hl			;b300
	ld a,(hl)			;b301
	ld hl,0ef3ch		;b302
L_B305:
	ld b,(hl)			;b305
	cp b			;b306
	ret c			;b307
	ex de,hl			;b308
	ld (de),a			;b309
	dec de			;b30a
	ld hl,0efc3h		;b30b
	ld a,(hl)			;b30e
	ld (de),a			;b30f
	inc de			;b310
	inc de			;b311
	ld a,(ix+000h)		;b312
	ld (de),a			;b315
	inc de			;b316
	ld a,(ix+001h)		;b317
	ld (de),a			;b31a
	inc de			;b31b
	ld hl,0b325h		;b31c
	ld bc,0000ch		;b31f
	ldir		;b322
	ret			;b324

; ----------------------------------------------------------------------
; DATOS sonido_B325: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x01,
;   0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C y 60 mas
;   (tools/partituras.py); lo leen p06:B51E (12 bytes)
;   0xb325..0xb331  (12 bytes)
DATA_sonido_B325:
	defb 001h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; b325  ............

; ======================================================================
; CODIGO 0xb331..0xb59e  (621 bytes)
; ======================================================================


L_B331:
	ld hl,0efc2h		;b331
	set 4,(hl)		;b334
	res 0,(hl)		;b336
	ld hl,0efd8h		;b338
	ld (hl),000h		;b33b
	inc hl			;b33d
	ld (hl),009h		;b33e
	ret			;b340
L_B341:
	ld hl,0efc2h		;b341
	res 0,(hl)		;b344
	jr L_B362		;b346
L_B348:
	ld hl,0efd6h		;b348
	ld (hl),025h		;b34b
	inc hl			;b34d
	ld (hl),00ah		;b34e
	jp L_B35B		;b350
L_B353:
	ld hl,0efd6h		;b353
	ld (hl),025h		;b356
	inc hl			;b358
	ld (hl),00ah		;b359
L_B35B:
	ld hl,0efc2h		;b35b
	set 0,(hl)		;b35e
	res 4,(hl)		;b360
L_B362:
	ld hl,0efd8h		;b362
	xor a			;b365
	ld (hl),a			;b366
	inc hl			;b367
	ld (hl),a			;b368
	ret			;b369
L_B36A:
	ld hl,0efc2h		;b36a
	bit 1,(hl)		;b36d
	ld b,000h		;b36f
	jr nz,L_B375		;b371
	ld b,001h		;b373
L_B375:
	res 1,(hl)		;b375
	bit 3,(hl)		;b377
	jr z,L_B37F		;b379
	res 3,(hl)		;b37b
	set 0,(hl)		;b37d
L_B37F:
	ld a,03fh		;b37f
	ld (09000h),a		;b381
	ld a,(0eff4h)		;b384
	ld (0988fh),a		;b387
	ld a,005h		;b38a
	ld (09000h),a		;b38c
	ld a,0ffh		;b38f
	ld hl,0efe2h		;b391
	ld (hl),a			;b394
	inc hl			;b395
	ld (hl),a			;b396
	call L_BE14		;b397
	ld a,b			;b39a
	or a			;b39b
	ret nz			;b39c
	ld hl,0ee0dh		;b39d
	ld a,(hl)			;b3a0
	rrca			;b3a1
	rrca			;b3a2
	rrca			;b3a3
	rrca			;b3a4
	ld (hl),a			;b3a5
	ld hl,0ee3ah		;b3a6
	ld a,(hl)			;b3a9
	rrca			;b3aa
	rrca			;b3ab
	rrca			;b3ac
	rrca			;b3ad
	ld (hl),a			;b3ae
	ret			;b3af
L_B3B0:
	ld hl,0efc2h		;b3b0
	bit 1,(hl)		;b3b3
	ld b,000h		;b3b5
	jr z,L_B3BB		;b3b7
	ld b,001h		;b3b9
L_B3BB:
	set 1,(hl)		;b3bb
	bit 0,(hl)		;b3bd
	jr z,L_B3C5		;b3bf
	res 0,(hl)		;b3c1
	set 3,(hl)		;b3c3
L_B3C5:
	ld a,(0efdah)		;b3c5
	and 09bh		;b3c8
	call L_BC93		;b3ca
	ld a,03fh		;b3cd
	ld (09000h),a		;b3cf
	ld a,(0eff3h)		;b3d2
	and 0feh		;b3d5
	ld (0988fh),a		;b3d7
	xor a			;b3da
	ld (0ee0ch),a		;b3db
	ld (0988bh),a		;b3de
	ld (0988ch),a		;b3e1
	ld (0988dh),a		;b3e4
	ld (0988eh),a		;b3e7
	ld a,005h		;b3ea
	ld (09000h),a		;b3ec
	ld a,b			;b3ef
	or a			;b3f0
	ret nz			;b3f1
	ld hl,0ee0dh		;b3f2
	ld a,(hl)			;b3f5
	rlca			;b3f6
	rlca			;b3f7
	rlca			;b3f8
	rlca			;b3f9
	ld (hl),a			;b3fa
	ld hl,0ee3ah		;b3fb
	ld a,(hl)			;b3fe
	rlca			;b3ff
	rlca			;b400
	rlca			;b401
	rlca			;b402
	ld (hl),a			;b403
	ret			;b404
L_B405:
	ld (ix+01ah),000h		;b405
	ld (ix+01bh),000h		;b409
	ld (ix+01ch),000h		;b40d
	ld (ix+01dh),000h		;b411
	ld (ix+01eh),000h		;b415
	ld (ix+026h),000h		;b419
	ret			;b41d
L_B41E:
	ld a,(0efdah)		;b41e
	call L_BC93		;b421
	ld a,(0fda2h)		;b424
	ld hl,0eff9h		;b427
	cp (hl)			;b42a
	jr z,L_B451		;b42b
	ld ix,0ee87h		;b42d
	set 7,(ix+00fh)		;b431
	ld ix,0eeb4h		;b435
	set 7,(ix+00fh)		;b439
	ld ix,0eee1h		;b43d
	set 7,(ix+00fh)		;b441
	ld ix,0ef0eh		;b445
	set 7,(ix+00fh)		;b449
	ld a,(0fda2h)		;b44d
	ld (hl),a			;b450
L_B451:
	inc (hl)			;b451
	ld a,(hl)			;b452
	ld (0fda2h),a		;b453
	ld hl,0efc2h		;b456
	bit 1,(hl)		;b459
	jp nz,L_B4F1		;b45b
	ld a,(0efc2h)		;b45e
	bit 0,a		;b461
	call nz,L_B852		;b463
	ld a,(0efc2h)		;b466
	bit 4,a		;b469
	call nz,L_B8D6		;b46b
	ld a,001h		;b46e
	ld (0efdbh),a		;b470
	ld ix,0ee00h		;b473
	call L_B4E9		;b477
	ld a,002h		;b47a
	ld (0efdbh),a		;b47c
	ld ix,0ee2dh		;b47f
	call L_B4E9		;b483
	ld a,004h		;b486
	ld (0efdbh),a		;b488
	ld ix,0ee5ah		;b48b
	call L_B4E9		;b48f
	ld a,008h		;b492
	ld (0efdbh),a		;b494
	ld ix,0ee87h		;b497
	ld a,(ix+000h)		;b49b
	or a			;b49e
	jr nz,L_B4B2		;b49f
	ld a,(0eff4h)		;b4a1
	or a			;b4a4
	jr z,L_B4AC		;b4a5
	call L_BF4E		;b4a7
	jr L_B4B5		;b4aa
L_B4AC:
	ld (ix+00dh),000h		;b4ac
	jr L_B4B5		;b4b0
L_B4B2:
	call L_B4E9		;b4b2
L_B4B5:
	ld a,010h		;b4b5
	ld (0efdbh),a		;b4b7
	ld ix,0eeb4h		;b4ba
	call L_B4E9		;b4be
	ld a,020h		;b4c1
	ld (0efdbh),a		;b4c3
	ld ix,0eee1h		;b4c6
	call L_B4E9		;b4ca
	ld a,040h		;b4cd
	ld (0efdbh),a		;b4cf
	ld ix,0ef0eh		;b4d2
	call L_B4E9		;b4d6
	ld a,080h		;b4d9
	ld (0efdbh),a		;b4db
	ld ix,0ef3bh		;b4de
	call L_B4E9		;b4e2
	call L_BBB8		;b4e5
	ret			;b4e8
L_B4E9:
	ld a,(ix+000h)		;b4e9
	or a			;b4ec
	call nz,L_B512		;b4ed
	ret			;b4f0
L_B4F1:
	ld a,004h		;b4f1
	ld (0efdbh),a		;b4f3
	ld ix,0ee5ah		;b4f6
	call L_B4E9		;b4fa
	ld a,008h		;b4fd
	ld (0efdbh),a		;b4ff
	ld ix,0ee87h		;b502
	call L_B4E9		;b506
	ld a,09bh		;b509
	ld (0efdah),a		;b50b
	call L_BBB8		;b50e
	ret			;b511
L_B512:
	dec (ix+004h)		;b512
	jp nz,L_B700		;b515
	ld l,(ix+002h)		;b518
	ld h,(ix+003h)		;b51b
L_B51E:
	ld a,(hl)			;b51e
	cp 0ffh		;b51f
	jp z,L_B8EE		;b521
	cp 0d0h		;b524
	jr c,L_B52F		;b526
	call L_B92F		;b528
	inc hl			;b52b
	jp L_B51E		;b52c
L_B52F:
	bit 0,(ix+009h)		;b52f
	jp nz,L_B546		;b533
	bit 1,(ix+009h)		;b536
	jp nz,L_B5AB		;b53a
	ld a,(ix+009h)		;b53d
	and 01ch		;b540
	jp nz,L_B624		;b542
	ret			;b545
L_B546:
	ld a,(hl)			;b546
	and 00fh		;b547
	ld b,a			;b549
	ld a,(ix+014h)		;b54a
	jr z,L_B553		;b54d
	ld e,a			;b54f
L_B550:
	add a,e			;b550
	djnz L_B550		;b551
L_B553:
	ld (ix+004h),a		;b553
	ld a,(hl)			;b556
	and 0f0h		;b557
	rrca			;b559
	rrca			;b55a
	rrca			;b55b
	rrca			;b55c
	call L_B84A		;b55d
	bit 7,(ix+009h)		;b560
	ret nz			;b564
	cp 00ch		;b565
	jr nc,L_B599		;b567
	ld hl,0b59eh		;b569
	ld e,a			;b56c
	ld d,000h		;b56d
	add hl,de			;b56f
	ld l,(hl)			;b570
	ld h,000h		;b571
	ld a,(ix+016h)		;b573
	or a			;b576
	jr z,L_B57D		;b577
	ld b,a			;b579
L_B57A:
	add hl,hl			;b57a
	djnz L_B57A		;b57b
L_B57D:
	ld (ix+010h),l		;b57d
	ld (ix+011h),h		;b580
	ld e,(ix+015h)		;b583
	ld a,(0efc2h)		;b586
	and 011h		;b589
	call nz,L_B8B2		;b58b
	ld (ix+012h),e		;b58e
	ld (ix+00dh),002h		;b591
	call L_B6AF		;b595
	ret			;b598
L_B599:
	ld (ix+00dh),000h		;b599
	ret			;b59d

; ----------------------------------------------------------------------
; DATOS sonido_B59E: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x2D,
;   0x2E, 0x2F, 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38 y 13 mas
;   (tools/partituras.py); se solapan 2 bloques: (notas B59E-B5AB); lo leen
;   p06:B51E, p06:B569 (13 bytes)
;   0xb59e..0xb5ab  (13 bytes)
DATA_sonido_B59E:
	defb 06ah,064h,05eh,059h,054h,04fh,04ah,046h,042h,03fh,03bh,038h,035h	; b59e  jd^YTOJFB?.85

; ======================================================================
; CODIGO 0xb5ab..0xb944  (921 bytes)
; ======================================================================


L_B5AB:
	ld a,(ix+00dh)		;b5ab
	and 003h		;b5ae
	jr z,L_B615		;b5b0
	cp 001h		;b5b2
	jr z,L_B5EC		;b5b4
	ld a,(hl)			;b5b6
	bit 6,(ix+00eh)		;b5b7
	jr nz,L_B5D8		;b5bb
	bit 5,(ix+00eh)		;b5bd
	jr nz,L_B5DD		;b5c1
	and 0f0h		;b5c3
	ld b,a			;b5c5
	xor (hl)			;b5c6
	ld d,a			;b5c7
	inc hl			;b5c8
	ld a,(hl)			;b5c9
	ld (ix+010h),a		;b5ca
	ld (ix+011h),d		;b5cd
	ld a,b			;b5d0
	rrca			;b5d1
	rrca			;b5d2
	rrca			;b5d3
	rrca			;b5d4
	ld b,a			;b5d5
	jr L_B5F0		;b5d6
L_B5D8:
	ld (ix+010h),a		;b5d8
	jr L_B604		;b5db
L_B5DD:
	and 0f0h		;b5dd
	rrca			;b5df
	rrca			;b5e0
	rrca			;b5e1
	rrca			;b5e2
	ld b,a			;b5e3
	ld a,(hl)			;b5e4
	and 00fh		;b5e5
	ld (ix+011h),a		;b5e7
	jr L_B5F0		;b5ea
L_B5EC:
	ld a,(hl)			;b5ec
	and 00fh		;b5ed
	ld b,a			;b5ef
L_B5F0:
	ld a,(0efdbh)		;b5f0
	cp 008h		;b5f3
	jr nc,L_B5FF		;b5f5
	bit 2,(ix+00dh)		;b5f7
	jr z,L_B5FF		;b5fb
	ld b,010h		;b5fd
L_B5FF:
	inc b			;b5ff
	inc b			;b600
	ld (ix+012h),b		;b601
L_B604:
	ld e,(ix+012h)		;b604
	ld a,(0efc2h)		;b607
	and 011h		;b60a
	call nz,L_B8B2		;b60c
	ld (ix+012h),e		;b60f
	call L_B6AF		;b612
L_B615:
	bit 7,(ix+009h)		;b615
	ret nz			;b619
	call L_B84A		;b61a
	ld a,(ix+013h)		;b61d
	ld (ix+004h),a		;b620
	ret			;b623
L_B624:
	set 7,(ix+009h)		;b624
	call L_B546		;b628
	ld b,a			;b62b
	call L_B65B		;b62c
	ld a,b			;b62f
	add a,a			;b630
	ld e,a			;b631
	ld d,000h		;b632
	add hl,de			;b634
	ld e,(hl)			;b635
	inc hl			;b636
	ld d,(hl)			;b637
	ex de,hl			;b638
	ld a,(hl)			;b639
L_B63A:
	set 1,(ix+009h)		;b63a
	call L_B51E		;b63e
	res 1,(ix+009h)		;b641
	res 7,(ix+009h)		;b645
	ld a,(ix+013h)		;b649
	ld (ix+019h),a		;b64c
	inc hl			;b64f
	ld (ix+017h),l		;b650
	ld (ix+018h),h		;b653
	set 0,(ix+00eh)		;b656
	ret			;b65a
L_B65B:
	bit 2,(ix+009h)		;b65b
	jp nz,L_B670		;b65f
	bit 3,(ix+009h)		;b662
	jp nz,L_B685		;b666
	bit 4,(ix+009h)		;b669
	jp nz,L_B69A		;b66d
L_B670:
	ld a,(ix+02ch)		;b670
	cp 000h		;b673
	jp z,L_B67D		;b675
	cp 001h		;b678
	jp z,L_B681		;b67a
L_B67D:
	ld hl,06656h		;b67d
	ret			;b680
L_B681:
	ld hl,06903h		;b681
	ret			;b684
L_B685:
	ld a,(ix+02ch)		;b685
	cp 000h		;b688
	jp z,L_B692		;b68a
	cp 001h		;b68d
	jp z,L_B696		;b68f
L_B692:
	ld hl,06a8ah		;b692
	ret			;b695
L_B696:
	ld hl,06b60h		;b696
	ret			;b699
L_B69A:
	ld a,(ix+02ch)		;b69a
	cp 000h		;b69d
	jp z,L_B6A7		;b69f
	cp 001h		;b6a2
	jp z,L_B6AB		;b6a4
L_B6A7:
	ld hl,06beah		;b6a7
	ret			;b6aa
L_B6AB:
	ld hl,06c03h		;b6ab
	ret			;b6ae
L_B6AF:
	call L_B739		;b6af
	res 4,(ix+00eh)		;b6b2
	ld a,(ix+00fh)		;b6b6
	and 0d7h		;b6b9
	ld (ix+00fh),a		;b6bb
	xor a			;b6be
	ld (ix+01dh),a		;b6bf
	ld (ix+01eh),a		;b6c2
	ld (ix+01fh),a		;b6c5
	ld (ix+020h),a		;b6c8
	set 2,(ix+00fh)		;b6cb
	ld a,(ix+012h)		;b6cf
	bit 7,(ix+00eh)		;b6d2
	jr z,L_B6DF		;b6d6
	ld e,(ix+029h)		;b6d8
	sub e			;b6db
	call m,L_B6FE		;b6dc
L_B6DF:
	ld (ix+00ch),a		;b6df
	ld a,(0efdbh)		;b6e2
	cp 008h		;b6e5
	jr nc,L_B6EE		;b6e7
	bit 2,(ix+00dh)		;b6e9
	ret nz			;b6ed
L_B6EE:
	bit 1,(ix+00fh)		;b6ee
	ret z			;b6f2
	ld a,(ix+025h)		;b6f3
	ld (ix+00ch),a		;b6f6
	res 2,(ix+00fh)		;b6f9
	ret			;b6fd
L_B6FE:
	xor a			;b6fe
	ret			;b6ff
L_B700:
	bit 0,(ix+00eh)		;b700
	jp nz,L_B716		;b704
	bit 2,(ix+00eh)		;b707
	call nz,L_B754		;b70b
	bit 0,(ix+00fh)		;b70e
	call nz,L_B7A2		;b712
	ret			;b715
L_B716:
	dec (ix+019h)		;b716
	ret nz			;b719
	ld l,(ix+017h)		;b71a
	ld h,(ix+018h)		;b71d
	ld a,(hl)			;b720
	cp 0ffh		;b721
	jr z,L_B72D		;b723
	set 7,(ix+009h)		;b725
	call L_B63A		;b729
	ret			;b72c
L_B72D:
	res 0,(ix+00eh)		;b72d
	xor a			;b731
	ld (ix+00ch),a		;b732
	ld (ix+00dh),a		;b735
	ret			;b738
L_B739:
	ld e,(ix+010h)		;b739
	ld d,(ix+011h)		;b73c
	bit 1,(ix+00eh)		;b73f
	jr z,L_B74D		;b743
	ld a,(ix+026h)		;b745
	add a,e			;b748
	ld e,a			;b749
	jr nc,L_B74D		;b74a
	inc d			;b74c
L_B74D:
	ld (ix+00ah),e		;b74d
	ld (ix+00bh),d		;b750
	ret			;b753
L_B754:
	inc (ix+01eh)		;b754
	ld a,(ix+01eh)		;b757
	ld b,(ix+00eh)		;b75a
	bit 4,b		;b75d
	jr nz,L_B773		;b75f
	bit 3,b		;b761
	jr z,L_B773		;b763
	cp (ix+01ah)		;b765
	ret nz			;b768
	ld (ix+01eh),000h		;b769
	set 4,(ix+00eh)		;b76d
	jr L_B777		;b771
L_B773:
	cp (ix+01bh)		;b773
	ret nz			;b776
L_B777:
	ld e,(ix+00ah)		;b777
	ld d,(ix+00bh)		;b77a
	ld b,(ix+01ch)		;b77d
	ld a,(ix+01dh)		;b780
	cpl			;b783
	ld (ix+01dh),a		;b784
	and a			;b787
	ld a,e			;b788
	jr nz,L_B792		;b789
	add a,b			;b78b
	ld e,a			;b78c
	jr nc,L_B797		;b78d
	inc d			;b78f
	jr L_B797		;b790
L_B792:
	sub b			;b792
	ld e,a			;b793
	jr nc,L_B797		;b794
	dec d			;b796
L_B797:
	ld (ix+00ah),e		;b797
	ld (ix+00bh),d		;b79a
	ld (ix+01eh),000h		;b79d
	ret			;b7a1
L_B7A2:
	ld a,(0efdbh)		;b7a2
	cp 008h		;b7a5
	jr nc,L_B7AE		;b7a7
	bit 2,(ix+00dh)		;b7a9
	ret nz			;b7ad
L_B7AE:
	call L_B7B5		;b7ae
	ld (ix+00ch),e		;b7b1
	ret			;b7b4
L_B7B5:
	ld e,(ix+00ch)		;b7b5
	inc (ix+01fh)		;b7b8
	ld b,(ix+01fh)		;b7bb
	bit 5,(ix+00fh)		;b7be
	jr nz,L_B839		;b7c2
	bit 3,(ix+00fh)		;b7c4
	jr nz,L_B7F7		;b7c8
	bit 2,(ix+00fh)		;b7ca
	jr nz,L_B7E3		;b7ce
	ld a,e			;b7d0
	inc a			;b7d1
	ld e,a			;b7d2
	cp (ix+012h)		;b7d3
	ret c			;b7d6
	set 2,(ix+00fh)		;b7d7
	ld e,(ix+012h)		;b7db
	ld (ix+01fh),000h		;b7de
	ret			;b7e2
L_B7E3:
	ld a,e			;b7e3
	dec a			;b7e4
	jp m,L_B7E9		;b7e5
	ld e,a			;b7e8
L_B7E9:
	ld a,b			;b7e9
	cp (ix+021h)		;b7ea
	ret c			;b7ed
	ld (ix+01fh),000h		;b7ee
	set 3,(ix+00fh)		;b7f2
	ret			;b7f6
L_B7F7:
	bit 4,(ix+00fh)		;b7f7
	jp nz,L_B823		;b7fb
	ld a,(ix+024h)		;b7fe
	cp (ix+004h)		;b801
	call nc,L_B845		;b804
	ld a,b			;b807
	cp (ix+022h)		;b808
	ret nz			;b80b
	ld a,e			;b80c
	dec a			;b80d
	ret m			;b80e
	ld e,a			;b80f
	inc (ix+020h)		;b810
	ld a,(ix+020h)		;b813
	cp (ix+023h)		;b816
	ld (ix+01fh),000h		;b819
	ret nz			;b81d
	set 5,(ix+00fh)		;b81e
	ret			;b822
L_B823:
	ld a,(ix+022h)		;b823
	ld d,a			;b826
	ld a,e			;b827
	sub d			;b828
	ld e,000h		;b829
	jp m,L_B82F		;b82b
	ld e,a			;b82e
L_B82F:
	ld a,b			;b82f
	cp (ix+023h)		;b830
	ret nz			;b833
	set 5,(ix+00fh)		;b834
	ret			;b838
L_B839:
	ld a,(ix+004h)		;b839
	cp (ix+024h)		;b83c
	ret nc			;b83f
	ld a,e			;b840
	dec a			;b841
	ret m			;b842
	ld e,a			;b843
	ret			;b844
L_B845:
	set 5,(ix+00fh)		;b845
	ret			;b849
L_B84A:
	inc hl			;b84a
	ld (ix+002h),l		;b84b
	ld (ix+003h),h		;b84e
	ret			;b851
L_B852:
	ld de,0efd6h		;b852
	ld a,(de)			;b855
	ld b,a			;b856
	inc de			;b857
	ld a,(de)			;b858
	ld c,a			;b859
	ld hl,0efd8h		;b85a
	inc (hl)			;b85d
	ld a,(hl)			;b85e
	cp b			;b85f
	ret nz			;b860
	ld (hl),000h		;b861
	inc hl			;b863
	inc (hl)			;b864
	ld a,(hl)			;b865
	cp c			;b866
	ret nz			;b867
	ld hl,0efc2h		;b868
	res 0,(hl)		;b86b
	xor a			;b86d
	ld hl,0efd8h		;b86e
	ld (hl),a			;b871
	inc hl			;b872
	ld (hl),a			;b873
	ld a,(0ee2dh)		;b874
	ld e,a			;b877
	ld a,(0ee5ah)		;b878
	cp e			;b87b
	jr nz,L_B88C		;b87c
	ld ix,0ee5ah		;b87e
	call L_B8EE		;b882
	ld ix,0ee87h		;b885
	call L_B8EE		;b889
L_B88C:
	ld de,0002dh		;b88c
	ld ix,0ee00h		;b88f
	call L_B8EE		;b893
	add ix,de		;b896
	call L_B8EE		;b898
	ld ix,0eeb4h		;b89b
	call L_B8EE		;b89f
	add ix,de		;b8a2
	call L_B8EE		;b8a4
	add ix,de		;b8a7
	call L_B8EE		;b8a9
	add ix,de		;b8ac
	call L_B8EE		;b8ae
	ret			;b8b1
L_B8B2:
	ld a,(0ee2dh)		;b8b2
	ld b,a			;b8b5
	ld a,(0ee5ah)		;b8b6
	cp b			;b8b9
	jr z,L_B8C2		;b8ba
	ld a,(0efdbh)		;b8bc
	and 0f3h		;b8bf
	ret z			;b8c1
L_B8C2:
	bit 2,(ix+00dh)		;b8c2
	jr nz,L_B8D3		;b8c6
	ld a,(0efd9h)		;b8c8
	ld b,a			;b8cb
	ld a,e			;b8cc
	sub b			;b8cd
	ld e,000h		;b8ce
	ret m			;b8d0
	ld e,a			;b8d1
	ret			;b8d2
L_B8D3:
	ld e,000h		;b8d3
	ret			;b8d5
L_B8D6:
	ld hl,0efd8h		;b8d6
	inc (hl)			;b8d9
	ld a,(hl)			;b8da
	cp 025h		;b8db
	ret nz			;b8dd
	ld (hl),000h		;b8de
	inc hl			;b8e0
	dec (hl)			;b8e1
	ret nz			;b8e2
	ld hl,0efc2h		;b8e3
	res 4,(hl)		;b8e6
	ld hl,0efd8h		;b8e8
	ld (hl),000h		;b8eb
	ret			;b8ed
L_B8EE:
	xor a			;b8ee
	ld (ix+000h),a		;b8ef
	ld (ix+001h),a		;b8f2
	ld (ix+005h),a		;b8f5
	ld (ix+006h),a		;b8f8
	ld (ix+00ah),a		;b8fb
	ld (ix+00bh),a		;b8fe
	ld (ix+00ch),a		;b901
	ld (ix+00dh),a		;b904
	ld (ix+00eh),a		;b907
	ld (ix+00fh),a		;b90a
	ld a,(0efdbh)		;b90d
	cp 008h		;b910
	ret nc			;b912
	nop			;b913
	cp 004h		;b914
	ld hl,0efdeh		;b916
	jr nz,L_B92A		;b919
	res 0,(hl)		;b91b
	res 1,(hl)		;b91d
	bit 3,(hl)		;b91f
	ret z			;b921
	bit 2,(hl)		;b922
	ret z			;b924
	set 2,(hl)		;b925
	res 3,(hl)		;b927
	ret			;b929
L_B92A:
	res 2,(hl)		;b92a
	res 3,(hl)		;b92c
	ret			;b92e
L_B92F:
	cp 0e0h		;b92f
	jp c,L_BB99		;b931
	and 01fh		;b934
	push hl			;b936
	ld hl,0b944h		;b937
	add a,a			;b93a
	ld e,a			;b93b
	ld d,000h		;b93c
	add hl,de			;b93e
	ld e,(hl)			;b93f
	inc hl			;b940
	ld d,(hl)			;b941
	ex de,hl			;b942
	jp (hl)			;b943

; ----------------------------------------------------------------------
; DATOS sonido_B944: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x02,
;   0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D y 57 mas
;   (tools/partituras.py); se solapan 3 bloques: (ordenes B944-B982)
;   (sonido_B954 B954-B982); lo leen p06:B51E, p06:B937 (62 bytes)
;   0xb944..0xb982  (62 bytes)
DATA_sonido_B944:
	defb 082h,0b9h,098h,0b9h,082h,0b9h,098h,0b9h,0b5h,0b9h,0dfh,0b9h,0f3h,0b9h,003h,0bah	; b944  ................
	defb 015h,0bah,026h,0bah,02dh,0bah,034h,0bah,087h,0bah,091h,0bah,098h,0bah,0a3h,0bah	; b954  ..&.-.4.........
	defb 0a9h,0bah,0b3h,0bah,0ceh,0bah,0ddh,0bah,0e3h,0bah,0e9h,0bah,0efh,0bah,0f9h,0bah	; b964  ................
	defb 004h,0bbh,01eh,0bbh,029h,0bbh,031h,0bbh,04bh,0bbh,060h,0bbh,063h,0bbh	; b974  ....).1.K.`.c.

; ======================================================================
; CODIGO 0xb982..0xbca4  (802 bytes)
; ======================================================================


L_B982:
	pop hl			;b982
L_B983:
	res 6,(ix+00eh)		;b983
	ld a,(hl)			;b987
	and 003h		;b988
	ld (ix+00dh),a		;b98a
	ld b,a			;b98d
	inc hl			;b98e
	ld a,(hl)			;b98f
	ld (ix+013h),a		;b990
	ld a,b			;b993
	or a			;b994
	ret nz			;b995
	dec hl			;b996
	ret			;b997
L_B998:
	pop hl			;b998
	ld a,(0efdbh)		;b999
	cp 004h		;b99c
	ld a,(0efdeh)		;b99e
	jr nz,L_B9AC		;b9a1
	set 0,a		;b9a3
	res 1,a		;b9a5
	ld (0efdeh),a		;b9a7
	jr L_B983		;b9aa
L_B9AC:
	set 2,a		;b9ac
	res 3,a		;b9ae
	ld (0efdeh),a		;b9b0
	jr L_B983		;b9b3
L_B9B5:
	pop hl			;b9b5
	inc hl			;b9b6
	ld a,(hl)			;b9b7
	and 01fh		;b9b8
	ld b,a			;b9ba
	ld a,(0efdbh)		;b9bb
	cp 004h		;b9be
	ld a,b			;b9c0
	jr nz,L_B9D1		;b9c1
	ld (0efdch),a		;b9c3
	ld a,(0efdeh)		;b9c6
	set 0,a		;b9c9
	res 1,a		;b9cb
	ld (0efdeh),a		;b9cd
	ret			;b9d0
L_B9D1:
	ld (0efddh),a		;b9d1
	ld a,(0efdeh)		;b9d4
	set 2,a		;b9d7
	res 3,a		;b9d9
	ld (0efdeh),a		;b9db
	ret			;b9de
L_B9DF:
	pop hl			;b9df
	inc hl			;b9e0
	res 3,(ix+00dh)		;b9e1
	ld a,(hl)			;b9e5
	ld (0efdfh),a		;b9e6
	ld de,0efdeh		;b9e9
	ld a,(de)			;b9ec
	set 5,a		;b9ed
	ld (de),a			;b9ef
	jp L_B9F4		;b9f0
L_B9F3:
	pop hl			;b9f3
L_B9F4:
	inc hl			;b9f4
	ld a,(hl)			;b9f5
	ld (0efe1h),a		;b9f6
	ld de,0efdeh		;b9f9
	ld a,(de)			;b9fc
	set 6,a		;b9fd
	ld (de),a			;b9ff
	jp L_BA04		;ba00
L_BA03:
	pop hl			;ba03
L_BA04:
	inc hl			;ba04
	ld a,(hl)			;ba05
	ld (0efe0h),a		;ba06
	ld de,0efdeh		;ba09
	ld a,(de)			;ba0c
	set 7,a		;ba0d
	ld (de),a			;ba0f
	set 2,(ix+00dh)		;ba10
	ret			;ba14
L_BA15:
	pop hl			;ba15
	ld de,0efdeh		;ba16
	ld a,(de)			;ba19
	and 01fh		;ba1a
	ld (de),a			;ba1c
	ld a,(ix+00dh)		;ba1d
	and 0f3h		;ba20
	ld (ix+00dh),a		;ba22
	ret			;ba25
L_BA26:
	pop hl			;ba26
	inc hl			;ba27
	ld a,(hl)			;ba28
	ld (ix+014h),a		;ba29
	ret			;ba2c
L_BA2D:
	pop hl			;ba2d
	inc hl			;ba2e
	ld a,(hl)			;ba2f
	ld (ix+015h),a		;ba30
	ret			;ba33
L_BA34:
	pop hl			;ba34
	inc hl			;ba35
	ld a,(ix+00fh)		;ba36
	and 080h		;ba39
	ld (ix+00fh),a		;ba3b
	ld a,(hl)			;ba3e
	and 0f0h		;ba3f
	rrca			;ba41
	rrca			;ba42
	rrca			;ba43
	rrca			;ba44
	cp 008h		;ba45
	jp nc,L_BA4E		;ba47
	set 2,(ix+00fh)		;ba4a
L_BA4E:
	res 3,a		;ba4e
	inc a			;ba50
	bit 2,(ix+00fh)		;ba51
	jp nz,L_BA5C		;ba55
	set 1,(ix+00fh)		;ba58
L_BA5C:
	ld (ix+021h),a		;ba5c
	ld a,(hl)			;ba5f
	and 00fh		;ba60
	cp 008h		;ba62
	jp c,L_BA6B		;ba64
	set 4,(ix+00fh)		;ba67
L_BA6B:
	res 3,a		;ba6b
	inc a			;ba6d
	ld (ix+022h),a		;ba6e
	inc hl			;ba71
	ld a,(hl)			;ba72
	and 0f0h		;ba73
	rrca			;ba75
	rrca			;ba76
	rrca			;ba77
	rrca			;ba78
	ld (ix+023h),a		;ba79
	ld a,(hl)			;ba7c
	and 00fh		;ba7d
	ld (ix+024h),a		;ba7f
	set 0,(ix+00fh)		;ba82
	ret			;ba86
L_BA87:
	pop hl			;ba87
	res 0,(ix+00fh)		;ba88
	res 1,(ix+00fh)		;ba8c
	ret			;ba90
L_BA91:
	pop hl			;ba91
	inc hl			;ba92
	ld a,(hl)			;ba93
	ld (ix+025h),a		;ba94
	ret			;ba97
L_BA98:
	pop hl			;ba98
	inc hl			;ba99
	ld a,(hl)			;ba9a
	ld (ix+026h),a		;ba9b
	set 1,(ix+00eh)		;ba9e
	ret			;baa2
L_BAA3:
	pop hl			;baa3
	res 1,(ix+00eh)		;baa4
	ret			;baa8
L_BAA9:
	pop hl			;baa9
	ld a,(ix+00eh)		;baaa
	and 0e2h		;baad
	ld (ix+00eh),a		;baaf
	ret			;bab2
L_BAB3:
	pop hl			;bab3
	inc hl			;bab4
	ld a,(ix+00eh)		;bab5
	or 014h		;bab8
	ld (ix+00eh),a		;baba
	ld a,(hl)			;babd
	and 00fh		;babe
	ld (ix+01ch),a		;bac0
	ld a,(hl)			;bac3
	and 0f0h		;bac4
	rrca			;bac6
	rrca			;bac7
	rrca			;bac8
	rrca			;bac9
	ld (ix+01bh),a		;baca
	ret			;bacd
L_BACE:
	pop hl			;bace
	inc hl			;bacf
	ld a,(hl)			;bad0
	ld (ix+01ah),a		;bad1
	ld a,(ix+00eh)		;bad4
	or 00ch		;bad7
	ld (ix+00eh),a		;bad9
	ret			;badc
L_BADD:
	pop hl			;badd
	res 3,(ix+00eh)		;bade
	ret			;bae2
L_BAE3:
	pop hl			;bae3
	set 6,(ix+00eh)		;bae4
	ret			;bae8
L_BAE9:
	pop hl			;bae9
	set 5,(ix+00eh)		;baea
	ret			;baee
L_BAEF:
	pop hl			;baef
	ld a,(ix+00eh)		;baf0
	and 09fh		;baf3
	ld (ix+00eh),a		;baf5
	ret			;baf8
L_BAF9:
	pop hl			;baf9
	set 7,(ix+00eh)		;bafa
	inc hl			;bafe
	ld a,(hl)			;baff
	ld (ix+029h),a		;bb00
	ret			;bb03
L_BB04:
	pop hl			;bb04
	inc hl			;bb05
	ld a,(hl)			;bb06
L_BB07:
	ld de,06346h		;bb07
	add a,a			;bb0a
	add a,e			;bb0b
	ld e,a			;bb0c
	jr nc,L_BB10		;bb0d
	inc d			;bb0f
L_BB10:
	ld a,(de)			;bb10
	ld (ix+027h),a		;bb11
	inc de			;bb14
	ld a,(de)			;bb15
	ld (ix+028h),a		;bb16
	set 7,(ix+00fh)		;bb19
	ret			;bb1d
L_BB1E:
	pop hl			;bb1e
	call L_BB3D		;bb1f
	ld (ix+007h),e		;bb22
	ld (ix+008h),d		;bb25
	ret			;bb28
L_BB29:
	pop hl			;bb29
	ld l,(ix+007h)		;bb2a
	ld h,(ix+008h)		;bb2d
	ret			;bb30
L_BB31:
	pop hl			;bb31
	inc hl			;bb32
	ld a,(ix+005h)		;bb33
	inc a			;bb36
	cp (hl)			;bb37
	jr z,L_BB44		;bb38
	ld (ix+005h),a		;bb3a
L_BB3D:
	inc hl			;bb3d
	ld e,(hl)			;bb3e
	inc hl			;bb3f
	ld d,(hl)			;bb40
	ex de,hl			;bb41
	dec hl			;bb42
	ret			;bb43
L_BB44:
	inc hl			;bb44
	inc hl			;bb45
	ld (ix+005h),000h		;bb46
	ret			;bb4a
L_BB4B:
	pop hl			;bb4b
	inc hl			;bb4c
	ld a,(ix+006h)		;bb4d
	inc a			;bb50
	cp (hl)			;bb51
	jr z,L_BB59		;bb52
	ld (ix+006h),a		;bb54
	jr L_BB3D		;bb57
L_BB59:
	inc hl			;bb59
	inc hl			;bb5a
	ld (ix+006h),000h		;bb5b
	ret			;bb5f
L_BB60:
	pop hl			;bb60
	jr L_BB3D		;bb61
L_BB63:
	pop hl			;bb63
	inc hl			;bb64
	ld b,(ix+009h)		;bb65
	ld a,(hl)			;bb68
	ld (ix+009h),a		;bb69
	cp 001h		;bb6c
	ld a,b			;bb6e
	jp z,L_BB89		;bb6f
	cp 001h		;bb72
	ret nz			;bb74
	ld a,(ix+00eh)		;bb75
	ld (ix+02ah),a		;bb78
	ld a,(ix+00fh)		;bb7b
	ld (ix+02bh),a		;bb7e
	xor a			;bb81
	ld (ix+00eh),a		;bb82
	ld (ix+00fh),a		;bb85
	ret			;bb88
L_BB89:
	cp 001h		;bb89
	ret z			;bb8b
	ld a,(ix+02ah)		;bb8c
	ld (ix+00eh),a		;bb8f
	ld a,(ix+02bh)		;bb92
	ld (ix+00fh),a		;bb95
	ret			;bb98
L_BB99:
	ld a,(hl)			;bb99
	and 00fh		;bb9a
	cp 006h		;bb9c
	jr nc,L_BBA7		;bb9e
	ld (ix+016h),a		;bba0
	ld (ix+02ch),a		;bba3
	ret			;bba6
L_BBA7:
	cp 00eh		;bba7
	ret c			;bba9
	jp z,L_BBB2		;bbaa
	res 7,(ix+00eh)		;bbad
	ret			;bbb1
L_BBB2:
	inc hl			;bbb2
	ld a,(hl)			;bbb3
	ld (ix+001h),a		;bbb4
	ret			;bbb7
L_BBB8:
	call L_BBBF		;bbb8
	call L_BCB0		;bbbb
	ret			;bbbe
L_BBBF:
	call L_BBCF		;bbbf
	call L_BBE6		;bbc2
	call L_BC1B		;bbc5
	call L_BC42		;bbc8
	call L_BC70		;bbcb
	ret			;bbce
L_BBCF:
	ld hl,0ee0dh		;bbcf
	ld a,(hl)			;bbd2
	and 001h		;bbd3
	jr z,L_BBE5		;bbd5
	ld hl,0ee67h		;bbd7
	ld a,(hl)			;bbda
	and 001h		;bbdb
	jr z,L_BBE5		;bbdd
	ld hl,0ee0dh		;bbdf
	ld a,002h		;bbe2
	ld (hl),a			;bbe4
L_BBE5:
	ret			;bbe5
L_BBE6:
	ld b,000h		;bbe6
	ld c,008h		;bbe8
	ld hl,0ee0ah		;bbea
	call L_BBFD		;bbed
	ld hl,0ee37h		;bbf0
	call L_BBFD		;bbf3
	ld hl,0ee64h		;bbf6
	call L_BBFD		;bbf9
	ret			;bbfc
L_BBFD:
	ld e,(hl)			;bbfd
	ld a,b			;bbfe
	call 00093h		;bbff   ; BIOS WRTPSG - Writes data to PSG-register
	inc hl			;bc02
	inc b			;bc03
	ld e,(hl)			;bc04
	ld a,b			;bc05
	call 00093h		;bc06   ; BIOS WRTPSG - Writes data to PSG-register
	inc hl			;bc09
	ld e,(hl)			;bc0a
	ld a,c			;bc0b
	inc b			;bc0c
	inc c			;bc0d
	inc hl			;bc0e
	bit 3,(hl)		;bc0f
	ret nz			;bc11
	call 00093h		;bc12   ; BIOS WRTPSG - Writes data to PSG-register
	bit 2,(hl)		;bc15
	ret z			;bc17
	set 3,(hl)		;bc18
	ret			;bc1a
L_BC1B:
	ld hl,0efdeh		;bc1b
	bit 0,(hl)		;bc1e
	jr z,L_BC2E		;bc20
	res 0,(hl)		;bc22
	set 1,(hl)		;bc24
	ld a,(0efdch)		;bc26
	ld e,a			;bc29
	ld a,006h		;bc2a
	jr L_BC3E		;bc2c
L_BC2E:
	bit 1,(hl)		;bc2e
	ret nz			;bc30
	bit 2,(hl)		;bc31
	ret z			;bc33
	res 2,(hl)		;bc34
	set 3,(hl)		;bc36
	ld a,(0efddh)		;bc38
	ld e,a			;bc3b
	ld a,006h		;bc3c
L_BC3E:
	call 00093h		;bc3e   ; BIOS WRTPSG - Writes data to PSG-register
	ret			;bc41
L_BC42:
	ld hl,0efdeh		;bc42
	bit 7,(hl)		;bc45
	ret z			;bc47
	res 7,(hl)		;bc48
	ld a,(0efe0h)		;bc4a
	ld e,a			;bc4d
	ld a,00bh		;bc4e
	call 00093h		;bc50   ; BIOS WRTPSG - Writes data to PSG-register
	bit 6,(hl)		;bc53
	ret z			;bc55
	res 6,(hl)		;bc56
	ld a,(0efe1h)		;bc58
	ld e,a			;bc5b
	ld a,00ch		;bc5c
	call 00093h		;bc5e   ; BIOS WRTPSG - Writes data to PSG-register
	bit 5,(hl)		;bc61
	ret z			;bc63
	res 5,(hl)		;bc64
	ld a,(0efdfh)		;bc66
	ld e,a			;bc69
	ld a,00dh		;bc6a
	call 00093h		;bc6c   ; BIOS WRTPSG - Writes data to PSG-register
	ret			;bc6f
L_BC70:
	ld hl,0ee0dh		;bc70
	ld a,(hl)			;bc73
	ld hl,0bca4h		;bc74
	call L_BC9D		;bc77
	ld b,(hl)			;bc7a
	ld hl,0ee3ah		;bc7b
	ld a,(hl)			;bc7e
	ld hl,0bca8h		;bc7f
	call L_BC9D		;bc82
	ld c,(hl)			;bc85
	ld hl,0ee67h		;bc86
	ld a,(hl)			;bc89
	ld hl,0bcach		;bc8a
	call L_BC9D		;bc8d
	ld a,(hl)			;bc90
	or b			;bc91
	or c			;bc92
L_BC93:
	ld e,a			;bc93
	ld (0efdah),a		;bc94
	ld a,007h		;bc97
	call 00093h		;bc99   ; BIOS WRTPSG - Writes data to PSG-register
	ret			;bc9c
L_BC9D:
	and 003h		;bc9d
	ld e,a			;bc9f
	ld d,000h		;bca0
	add hl,de			;bca2
	ret			;bca3

; ----------------------------------------------------------------------
; DATOS sonido_BCA4: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x01,
;   0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C y 60 mas
;   (tools/partituras.py); lo leen p06:B51E (12 bytes)
;   0xbca4..0xbcb0  (12 bytes)
DATA_sonido_BCA4:
	defb 089h,081h,088h,080h,092h,082h,090h,080h,0a4h,084h,0a0h,080h	; bca4  ............

; ======================================================================
; CODIGO 0xbcb0..0xbfe5  (821 bytes)
; ======================================================================


L_BCB0:
	call L_BCBD		;bcb0
	call L_BDC2		;bcb3
	call L_BE14		;bcb6
	call L_BEDB		;bcb9
	ret			;bcbc
L_BCBD:
	ld ix,0efe2h		;bcbd
	ld bc,0efeeh		;bcc1
	ld de,0efe4h		;bcc4
	ld hl,0ee91h		;bcc7
	ld a,(de)			;bcca
	res 0,(ix+000h)		;bccb
	cp (hl)			;bccf
	jr z,L_BCD8		;bcd0
	set 0,(ix+000h)		;bcd2
	ld a,(hl)			;bcd6
	ld (de),a			;bcd7
L_BCD8:
	inc de			;bcd8
	inc hl			;bcd9
	ld a,(de)			;bcda
	res 1,(ix+000h)		;bcdb
	cp (hl)			;bcdf
	jr z,L_BCE8		;bce0
	set 1,(ix+000h)		;bce2
	ld a,(hl)			;bce6
	ld (de),a			;bce7
L_BCE8:
	inc de			;bce8
	inc hl			;bce9
	res 2,(ix+001h)		;bcea
	ld a,(bc)			;bcee
	cp (hl)			;bcef
	jr z,L_BCF8		;bcf0
	set 2,(ix+001h)		;bcf2
	ld a,(hl)			;bcf6
	ld (bc),a			;bcf7
L_BCF8:
	inc bc			;bcf8
	ld hl,0eebeh		;bcf9
	ld a,(de)			;bcfc
	res 2,(ix+000h)		;bcfd
	cp (hl)			;bd01
	jr z,L_BD0A		;bd02
	set 2,(ix+000h)		;bd04
	ld a,(hl)			;bd08
	ld (de),a			;bd09
L_BD0A:
	inc de			;bd0a
	inc hl			;bd0b
	ld a,(de)			;bd0c
	res 3,(ix+000h)		;bd0d
	cp (hl)			;bd11
	jr z,L_BD1A		;bd12
	set 3,(ix+000h)		;bd14
	ld a,(hl)			;bd18
	ld (de),a			;bd19
L_BD1A:
	inc de			;bd1a
	inc hl			;bd1b
	res 3,(ix+001h)		;bd1c
	ld a,(bc)			;bd20
	cp (hl)			;bd21
	jr z,L_BD2A		;bd22
	set 3,(ix+001h)		;bd24
	ld a,(hl)			;bd28
	ld (bc),a			;bd29
L_BD2A:
	inc bc			;bd2a
	ld hl,0eeebh		;bd2b
	ld a,(de)			;bd2e
	res 4,(ix+000h)		;bd2f
	cp (hl)			;bd33
	jr z,L_BD3C		;bd34
	set 4,(ix+000h)		;bd36
	ld a,(hl)			;bd3a
	ld (de),a			;bd3b
L_BD3C:
	inc de			;bd3c
	inc hl			;bd3d
	ld a,(de)			;bd3e
	res 5,(ix+000h)		;bd3f
	cp (hl)			;bd43
	jr z,L_BD4C		;bd44
	set 5,(ix+000h)		;bd46
	ld a,(hl)			;bd4a
	ld (de),a			;bd4b
L_BD4C:
	inc de			;bd4c
	inc hl			;bd4d
	res 4,(ix+001h)		;bd4e
	ld a,(bc)			;bd52
	cp (hl)			;bd53
	jr z,L_BD5C		;bd54
	set 4,(ix+001h)		;bd56
	ld a,(hl)			;bd5a
	ld (bc),a			;bd5b
L_BD5C:
	inc bc			;bd5c
	ld hl,0ef18h		;bd5d
	ld a,(de)			;bd60
	res 6,(ix+000h)		;bd61
	cp (hl)			;bd65
	jr z,L_BD6E		;bd66
	set 6,(ix+000h)		;bd68
	ld a,(hl)			;bd6c
	ld (de),a			;bd6d
L_BD6E:
	inc de			;bd6e
	inc hl			;bd6f
	ld a,(de)			;bd70
	res 7,(ix+000h)		;bd71
	cp (hl)			;bd75
	jr z,L_BD7E		;bd76
	set 7,(ix+000h)		;bd78
	ld a,(hl)			;bd7c
	ld (de),a			;bd7d
L_BD7E:
	inc de			;bd7e
	inc hl			;bd7f
	res 5,(ix+001h)		;bd80
	ld a,(bc)			;bd84
	cp (hl)			;bd85
	jr z,L_BD8E		;bd86
	set 5,(ix+001h)		;bd88
	ld a,(hl)			;bd8c
	ld (bc),a			;bd8d
L_BD8E:
	inc bc			;bd8e
	ld hl,0ef45h		;bd8f
	ld a,(de)			;bd92
	res 0,(ix+001h)		;bd93
	cp (hl)			;bd97
	jr z,L_BDA0		;bd98
	set 0,(ix+001h)		;bd9a
	ld a,(hl)			;bd9e
	ld (de),a			;bd9f
L_BDA0:
	inc de			;bda0
	inc hl			;bda1
	ld a,(de)			;bda2
	res 1,(ix+001h)		;bda3
	cp (hl)			;bda7
	jr z,L_BDB0		;bda8
	set 1,(ix+001h)		;bdaa
	ld a,(hl)			;bdae
	ld (de),a			;bdaf
L_BDB0:
	inc de			;bdb0
	inc hl			;bdb1
	res 6,(ix+001h)		;bdb2
	ld a,(bc)			;bdb6
	cp (hl)			;bdb7
	jr z,L_BDC0		;bdb8
	set 6,(ix+001h)		;bdba
	ld a,(hl)			;bdbe
	ld (bc),a			;bdbf
L_BDC0:
	inc bc			;bdc0
	ret			;bdc1
L_BDC2:
	ld e,000h		;bdc2
	ld hl,0ee94h		;bdc4
	ld c,001h		;bdc7
	ld a,(hl)			;bdc9
	or a			;bdca
	jr z,L_BDCE		;bdcb
	ld a,c			;bdcd
L_BDCE:
	or e			;bdce
	ld e,a			;bdcf
	ld hl,0eec1h		;bdd0
	sla c		;bdd3
	ld a,(hl)			;bdd5
	or a			;bdd6
	jr z,L_BDDA		;bdd7
	ld a,c			;bdd9
L_BDDA:
	or e			;bdda
	ld e,a			;bddb
	ld hl,0eeeeh		;bddc
	sla c		;bddf
	ld a,(hl)			;bde1
	or a			;bde2
	jr z,L_BDE6		;bde3
	ld a,c			;bde5
L_BDE6:
	or e			;bde6
	ld e,a			;bde7
	ld hl,0ef1bh		;bde8
	sla c		;bdeb
	ld a,(hl)			;bded
	or a			;bdee
	jr z,L_BDF2		;bdef
	ld a,c			;bdf1
L_BDF2:
	or e			;bdf2
	ld e,a			;bdf3
	ld hl,0ef48h		;bdf4
	sla c		;bdf7
	ld a,(hl)			;bdf9
	or a			;bdfa
	jr z,L_BDFE		;bdfb
	ld a,c			;bdfd
L_BDFE:
	or e			;bdfe
	ld e,a			;bdff
	ld hl,0eff3h		;be00
	ld a,(hl)			;be03
	cp e			;be04
	jr z,L_BE0E		;be05
	ld (hl),e			;be07
	ld hl,0efe3h		;be08
	set 7,(hl)		;be0b
	ret			;be0d
L_BE0E:
	ld hl,0efe3h		;be0e
	res 7,(hl)		;be11
	ret			;be13
L_BE14:
	ld ix,0efe2h		;be14
	ld hl,0efe4h		;be18
	ld de,09880h		;be1b
	bit 0,(ix+000h)		;be1e
	jr z,L_BE27		;be22
	call L_BECC		;be24
L_BE27:
	inc hl			;be27
	inc de			;be28
	bit 1,(ix+000h)		;be29
	jr z,L_BE32		;be2d
	call L_BECC		;be2f
L_BE32:
	inc hl			;be32
	inc de			;be33
	bit 2,(ix+000h)		;be34
	jr z,L_BE3D		;be38
	call L_BECC		;be3a
L_BE3D:
	inc hl			;be3d
	inc de			;be3e
	bit 3,(ix+000h)		;be3f
	jr z,L_BE48		;be43
	call L_BECC		;be45
L_BE48:
	inc hl			;be48
	inc de			;be49
	bit 4,(ix+000h)		;be4a
	jr z,L_BE53		;be4e
	call L_BECC		;be50
L_BE53:
	inc hl			;be53
	inc de			;be54
	bit 5,(ix+000h)		;be55
	jr z,L_BE5E		;be59
	call L_BECC		;be5b
L_BE5E:
	inc hl			;be5e
	inc de			;be5f
	bit 6,(ix+000h)		;be60
	jr z,L_BE69		;be64
	call L_BECC		;be66
L_BE69:
	inc hl			;be69
	inc de			;be6a
	bit 7,(ix+000h)		;be6b
	jr z,L_BE74		;be6f
	call L_BECC		;be71
L_BE74:
	inc hl			;be74
	inc de			;be75
	bit 0,(ix+001h)		;be76
	jr z,L_BE7F		;be7a
	call L_BECC		;be7c
L_BE7F:
	inc hl			;be7f
	inc de			;be80
	bit 1,(ix+001h)		;be81
	jr z,L_BE8A		;be85
	call L_BECC		;be87
L_BE8A:
	inc hl			;be8a
	inc de			;be8b
	bit 2,(ix+001h)		;be8c
	jr z,L_BE95		;be90
	call L_BECC		;be92
L_BE95:
	inc hl			;be95
	inc de			;be96
	bit 3,(ix+001h)		;be97
	jr z,L_BEA0		;be9b
	call L_BECC		;be9d
L_BEA0:
	inc hl			;bea0
	inc de			;bea1
	bit 4,(ix+001h)		;bea2
	jr z,L_BEAB		;bea6
	call L_BECC		;bea8
L_BEAB:
	inc hl			;beab
	inc de			;beac
	bit 5,(ix+001h)		;bead
	jr z,L_BEB6		;beb1
	call L_BECC		;beb3
L_BEB6:
	inc hl			;beb6
	inc de			;beb7
	bit 6,(ix+001h)		;beb8
	jr z,L_BEC1		;bebc
	call L_BECC		;bebe
L_BEC1:
	inc hl			;bec1
	inc de			;bec2
	bit 7,(ix+001h)		;bec3
	ret z			;bec7
	call L_BECC		;bec8
	ret			;becb
L_BECC:
	ld a,(hl)			;becc
	ld c,a			;becd
	ld a,03fh		;bece
	ld (09000h),a		;bed0
	ld a,c			;bed3
	ld (de),a			;bed4
	ld a,005h		;bed5
	ld (09000h),a		;bed7
	ret			;beda
L_BEDB:
	ld hl,0ee96h		;bedb
	bit 7,(hl)		;bede
	jr z,L_BEF1		;bee0
	res 7,(hl)		;bee2
	ld hl,0eeaeh		;bee4
	ld e,(hl)			;bee7
	inc hl			;bee8
	ld d,(hl)			;bee9
	ex de,hl			;beea
	ld de,09800h		;beeb
	call L_BF2F		;beee
L_BEF1:
	ld hl,0eec3h		;bef1
	bit 7,(hl)		;bef4
	jr z,L_BF07		;bef6
	res 7,(hl)		;bef8
	ld hl,0eedbh		;befa
	ld e,(hl)			;befd
	inc hl			;befe
	ld d,(hl)			;beff
	ex de,hl			;bf00
	ld de,09820h		;bf01
	call L_BF2F		;bf04
L_BF07:
	ld hl,0eef0h		;bf07
	bit 7,(hl)		;bf0a
	jr z,L_BF1D		;bf0c
	res 7,(hl)		;bf0e
	ld hl,0ef08h		;bf10
	ld e,(hl)			;bf13
	inc hl			;bf14
	ld d,(hl)			;bf15
	ex de,hl			;bf16
	ld de,09840h		;bf17
	call L_BF2F		;bf1a
L_BF1D:
	ld hl,0ef1dh		;bf1d
	bit 7,(hl)		;bf20
	ret z			;bf22
	res 7,(hl)		;bf23
	ld hl,0ef35h		;bf25
	ld e,(hl)			;bf28
	inc hl			;bf29
	ld d,(hl)			;bf2a
	ex de,hl			;bf2b
	ld de,09860h		;bf2c
L_BF2F:
	ld a,03fh		;bf2f
	ld (09000h),a		;bf31
	xor a			;bf34
	ld (0988fh),a		;bf35
	ld b,020h		;bf38
L_BF3A:
	ld a,(hl)			;bf3a
	ld (de),a			;bf3b
	inc hl			;bf3c
	inc de			;bf3d
	djnz L_BF3A		;bf3e
	ld hl,0988fh		;bf40
	ld de,0eff3h		;bf43
	ld a,(de)			;bf46
	ld (hl),a			;bf47
	ld a,005h		;bf48
	ld (09000h),a		;bf4a
	ret			;bf4d
L_BF4E:
	nop			;bf4e
	ld a,(0eff4h)		;bf4f
	and 001h		;bf52
	jr z,L_BF59		;bf54
	jp L_BF5C		;bf56
L_BF59:
	jp L_BFA5		;bf59
L_BF5C:
	ld a,(0eff4h)		;bf5c
	and 080h		;bf5f
	jr nz,L_BF91		;bf61
	ld a,(0eff5h)		;bf63
	cpl			;bf66
	ld (0eff5h),a		;bf67
	and a			;bf6a
	ret z			;bf6b
	ld hl,(0eff6h)		;bf6c
	ld de,00001h		;bf6f
	sbc hl,de		;bf72
	call L_BFD8		;bf74
	ld (0eff6h),hl		;bf77
L_BF7A:
	ld (ix+00dh),002h		;bf7a
	ld hl,(0eff6h)		;bf7e
	ld (ix+00ah),l		;bf81
	ld (ix+00bh),h		;bf84
	ld a,00eh		;bf87
	call L_BB07		;bf89
	ld (ix+00ch),008h		;bf8c
	ret			;bf90
L_BF91:
	xor a			;bf91
	ld (0eff5h),a		;bf92
	ld hl,000c0h		;bf95
	ld (0eff6h),hl		;bf98
	ld a,(0eff4h)		;bf9b
	and 07fh		;bf9e
	ld (0eff4h),a		;bfa0
	jr L_BF7A		;bfa3
L_BFA5:
	ld a,(0eff4h)		;bfa5
	and 080h		;bfa8
	jr nz,L_BFC4		;bfaa
	ld a,(0eff5h)		;bfac
	cpl			;bfaf
	ld (0eff5h),a		;bfb0
	and a			;bfb3
	ret z			;bfb4
	ld hl,(0eff6h)		;bfb5
	ld a,001h		;bfb8
	add a,l			;bfba
	ld l,a			;bfbb
	jr nc,L_BFBF		;bfbc
	inc h			;bfbe
L_BFBF:
	ld (0eff6h),hl		;bfbf
	jr L_BF7A		;bfc2
L_BFC4:
	xor a			;bfc4
	ld (0eff5h),a		;bfc5
	ld hl,00040h		;bfc8
	ld (0eff6h),hl		;bfcb
	ld a,(0eff4h)		;bfce
	and 07fh		;bfd1
	ld (0eff4h),a		;bfd3
	jr L_BF7A		;bfd6
L_BFD8:
	ld a,h			;bfd8
	and 00fh		;bfd9
	jr nz,L_BFE4		;bfdb
	ld a,l			;bfdd
	cp 010h		;bfde
	ret nc			;bfe0
	ld hl,00010h		;bfe1
L_BFE4:
	ret			;bfe4

; ----------------------------------------------------------------------
; DATOS relleno_ff: 27 bytes a 0xFF hasta el final del banco: relleno; lo leen
;   nadie (27 bytes)
;   0xbfe5..0xc000  (27 bytes)
DATA_relleno_ff:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfe5  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bff5  ...........
