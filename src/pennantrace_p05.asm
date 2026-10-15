; ==========================================================================
; THE PRO YAKYUU GEKITOTSU PENNANT RACE - Konami (1988) - MSX2 - MegaROM RC-757 de 128 KB (Konami SCC) - banco 05 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; DATOS partitura_8000: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3B (tools/partituras.py); lo leen p06:B51E (5 bytes)
;   0x8000..0x8005  (5 bytes)
DATA_partitura_8000:
	defb 0feh,002h,0f9h,065h,082h	; 8000

; ----------------------------------------------------------------------
; DATOS partitura_8005: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x32, 0x33, 0x3B (tools/partituras.py); lo leen p06:B51E (30 bytes)
;   0x8005..0x8023  (30 bytes)
DATA_partitura_8005:
	defb 0feh,004h,0d0h,0f8h,028h,0e9h,006h,063h,063h,067h,067h,067h,063h,063h,067h,067h	; 8005  ....(..ccgggccgg
	defb 067h,063h,063h,067h,0fbh,002h,00fh,080h,0f9h,084h,083h,0fdh,00fh,080h	; 8015  gccg..........

; ----------------------------------------------------------------------
; DATOS partitura_8023: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3B (tools/partituras.py); lo leen p06:B51E (5 bytes)
;   0x8023..0x8028  (5 bytes)
DATA_partitura_8023:
	defb 0feh,002h,0f9h,07eh,082h	; 8023

; ----------------------------------------------------------------------
; DATOS partitura_8028: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x32, 0x33, 0x3B (tools/partituras.py); lo leen p06:B51E (79 bytes)
;   0x8028..0x8077  (79 bytes)
DATA_partitura_8028:
	defb 0feh,004h,0d0h,0f8h,005h,0e9h,006h,063h,063h,067h,0f8h,014h,0a7h,0a7h,0a3h,0a3h	; 8028  .......ccg......
	defb 0a7h,0a7h,0a7h,0a3h,0a3h,0a7h,0a7h,0a7h,0a3h,0a3h,0a7h,0feh,001h,0f8h,013h,0eah	; 8038  ................
	defb 004h,0d2h,060h,0eah,001h,060h,0eah,004h,062h,0eah,001h,060h,0eah,004h,040h,0eah	; 8048  ..`..`..b..`..@.
	defb 001h,040h,0eah,004h,032h,0eah,001h,030h,0eah,004h,062h,0eah,001h,060h,0eah,004h	; 8058  .@..2..0..b..`..
	defb 08dh,0eah,001h,081h,0feh,004h,0d0h,0f8h,005h,0f9h,084h,083h,0fdh,032h,080h	; 8068  .............2.

; ----------------------------------------------------------------------
; DATOS partitura_8077: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3B (tools/partituras.py); lo leen p06:B51E (5 bytes)
;   0x8077..0x807c  (5 bytes)
DATA_partitura_8077:
	defb 0feh,002h,0f9h,0d5h,082h	; 8077

; ----------------------------------------------------------------------
; DATOS partitura_807C: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x32, 0x33, 0x3B (tools/partituras.py); lo leen p06:B51E (228 bytes)
;   0x807c..0x8160  (228 bytes)
DATA_partitura_807C:
	defb 0feh,004h,0d0h,0e9h,006h,0f8h,014h,0a3h,0a3h,0a7h,0feh,001h,0f8h,013h,0eah,005h	; 807c  ................
	defb 0d2h,082h,0eah,001h,080h,0eah,005h,0b2h,0eah,001h,0b0h,0eah,005h,0d1h,011h,0eah	; 808c  ................
	defb 001h,010h,0eah,005h,0d2h,0b0h,090h,0eah,001h,090h,0eah,005h,080h,0eah,001h,080h	; 809c  ................
	defb 0eah,005h,092h,0eah,001h,090h,0eah,005h,0b2h,0eah,001h,0b0h,0eah,005h,0d1h,015h	; 80ac  ................
	defb 0eah,001h,011h,0eah,005h,0d2h,062h,0eah,001h,060h,0eah,005h,082h,0eah,001h,080h	; 80bc  ......b..`......
	defb 0eah,005h,091h,0eah,001h,090h,0eah,005h,080h,060h,0eah,001h,060h,0eah,005h,040h	; 80cc  .........`..`..@
	defb 0eah,001h,040h,0eah,005h,082h,0eah,001h,080h,0eah,005h,092h,0eah,001h,090h,0eah	; 80dc  ..@.............
	defb 005h,0b5h,0eah,001h,0b1h,0eah,005h,0d2h,082h,0eah,001h,080h,0eah,005h,0b2h,0eah	; 80ec  ................
	defb 001h,0b0h,0eah,005h,0d1h,011h,0eah,001h,010h,0eah,005h,0d2h,0b0h,090h,0eah,001h	; 80fc  ................
	defb 090h,0eah,005h,080h,0eah,001h,080h,0eah,005h,092h,0eah,001h,090h,0eah,005h,0b2h	; 810c  ................
	defb 0eah,001h,0b0h,0eah,005h,0d1h,015h,0eah,001h,011h,0eah,005h,030h,0eah,001h,030h	; 811c  ............0..0
	defb 0eah,005h,032h,0eah,001h,030h,0eah,005h,010h,0eah,001h,010h,0eah,005h,0d2h,0b2h	; 812c  ..2..0..........
	defb 0eah,001h,0b0h,0eah,005h,0d1h,032h,0eah,001h,030h,0eah,005h,04dh,0eah,001h,041h	; 813c  ......2..0..M..A
	defb 0feh,004h,0d0h,0f8h,014h,0a3h,0a3h,0a7h,0a3h,0a3h,0a7h,0a3h,0a3h,0a3h,0a3h,0a7h	; 814c  ................
	defb 0a7h,0fdh,086h,080h	; 815c

; ----------------------------------------------------------------------
; DATOS partitura_8160: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3B (tools/partituras.py); lo leen p06:B51E (5 bytes)
;   0x8160..0x8165  (5 bytes)
DATA_partitura_8160:
	defb 0feh,002h,0f9h,02ch,083h	; 8160

; ----------------------------------------------------------------------
; DATOS partitura_8165: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x32, 0x33, 0x3B, 0x3C (tools/partituras.py); lo leen p06:B51E (556 bytes)
;   0x8165..0x8391  (556 bytes)
DATA_partitura_8165:
	defb 0feh,001h,0e9h,006h,0cfh,0efh,0eah,004h,0d2h,042h,0eah,001h,040h,0eah,004h,082h	; 8165  .........B..@...
	defb 0eah,001h,080h,0eah,004h,091h,0eah,001h,090h,0eah,004h,080h,060h,0eah,001h,060h	; 8175  ............`..`
	defb 0eah,004h,040h,0eah,001h,040h,0eah,004h,062h,0eah,001h,060h,0eah,004h,082h,0eah	; 8185  ..@..@..b..`....
	defb 001h,080h,0eah,004h,095h,0eah,001h,091h,0eah,004h,032h,0eah,001h,030h,0eah,004h	; 8195  ..........2..0..
	defb 042h,0eah,001h,040h,0eah,004h,061h,0eah,001h,060h,0eah,004h,040h,030h,0eah,001h	; 81a5  B..@..a..`..@0..
	defb 030h,0eah,004h,010h,0eah,001h,010h,0eah,004h,042h,0eah,001h,040h,0eah,004h,062h	; 81b5  0........B..@..b
	defb 0eah,001h,060h,0eah,004h,085h,0eah,001h,081h,0eah,004h,0d2h,042h,0eah,001h,040h	; 81c5  ..`.........B..@
	defb 0eah,004h,082h,0eah,001h,080h,0eah,004h,091h,0eah,001h,090h,0eah,004h,080h,060h	; 81d5  ...............`
	defb 0eah,001h,060h,0eah,004h,040h,0eah,001h,040h,0eah,004h,062h,0eah,001h,060h,0eah	; 81e5  ..`..@..@..b..`.
	defb 004h,082h,0eah,001h,080h,0eah,004h,095h,0eah,001h,091h,0eah,004h,0b0h,0eah,001h	; 81f5  ................
	defb 0b0h,0eah,004h,0b2h,0eah,001h,0b0h,0eah,004h,090h,0eah,001h,090h,0eah,004h,062h	; 8205  ...............b
	defb 0eah,001h,060h,0eah,004h,0b2h,0eah,001h,0b0h,0eah,004h,0bdh,0eah,001h,0b1h,0cfh	; 8215  ..`.............
	defb 0cfh,0cfh,0cfh,0fdh,06ah,081h,0feh,002h,0e0h,038h,0feh,004h,0d0h,0e9h,004h,077h	; 8225  ....j....8.....w
	defb 077h,0feh,004h,0e9h,004h,071h,0feh,001h,0e9h,001h,0c0h,0fbh,008h,036h,082h,0feh	; 8235  w....q.......6..
	defb 004h,0e9h,004h,07dh,0feh,002h,0e0h,002h,0fah,0feh,002h,0e0h,038h,0feh,001h,0e9h	; 8245  ...}........8...
	defb 004h,0c7h,0feh,004h,0d0h,0a1h,0fbh,00ch,05ah,082h,0afh,0feh,002h,0e0h,002h,0fah	; 8255  ........Z.......
	defb 0feh,002h,0e0h,038h,0feh,001h,0e9h,004h,0c5h,0feh,004h,0d0h,0f8h,025h,0a1h,0fbh	; 8265  ...8.........%..
	defb 00ch,073h,082h,0afh,0feh,002h,0e0h,00ah,0fah,0feh,002h,0e0h,038h,0feh,001h,0f8h	; 8275  .s..........8...
	defb 01dh,0f2h,00bh,0f1h,041h,0e9h,002h,0eah,00dh,0d1h,020h,0eah,002h,020h,0eah,00dh	; 8285  ....A..... .. ..
	defb 030h,0eah,002h,030h,0eah,00fh,041h,0eah,002h,041h,0fbh,003h,099h,082h,0eah,00fh	; 8295  0..0..A..A......
	defb 041h,0eah,002h,041h,0eah,00fh,001h,0eah,002h,001h,0eah,00fh,041h,0eah,002h,041h	; 82a5  A..A........A..A
	defb 0eah,00fh,071h,0eah,002h,071h,0eah,00fh,041h,0eah,002h,041h,0eah,00fh,071h,0eah	; 82b5  ..q..q..A..A..q.
	defb 002h,071h,0e9h,006h,0d0h,0eah,00fh,00bh,0eah,001h,005h,0e9h,002h,0c2h,0f0h,0fah	; 82c5  .q..............
	defb 0feh,002h,0e0h,038h,0feh,001h,0f8h,01dh,0eeh,001h,0f2h,00bh,0f1h,041h,0e9h,002h	; 82d5  ...8.........A..
	defb 0c2h,0eah,004h,0d1h,020h,0eah,002h,020h,0eah,004h,030h,0eah,002h,030h,0eah,004h	; 82e5  .... .. ..0..0..
	defb 041h,0eah,002h,041h,0fbh,003h,0f3h,082h,0eah,004h,041h,0eah,002h,041h,0eah,004h	; 82f5  A..A......A..A..
	defb 001h,0eah,002h,001h,0eah,004h,041h,0eah,002h,041h,0eah,004h,071h,0eah,002h,071h	; 8305  ......A..A..q..q
	defb 0eah,004h,041h,0eah,002h,041h,0eah,004h,071h,0eah,002h,071h,0e9h,006h,0d0h,0eah	; 8315  ..A..A..q..q....
	defb 004h,00bh,0eah,001h,005h,0f0h,0fah,0feh,002h,0e0h,038h,0feh,001h,0f2h,00bh,0f1h	; 8325  ..........8.....
	defb 041h,0e9h,002h,0eah,00bh,0d2h,0a0h,0eah,002h,0a0h,0eah,00bh,0b0h,0eah,002h,0b0h	; 8335  A...............
	defb 0d1h,0eah,00dh,001h,0eah,002h,001h,0fbh,003h,045h,083h,0eah,00dh,001h,0eah,002h	; 8345  .........E......
	defb 001h,0d2h,0eah,00dh,071h,0eah,002h,071h,0d1h,0eah,00dh,001h,0eah,002h,001h,0eah	; 8355  ....q..q........
	defb 00dh,021h,0eah,002h,021h,0eah,00dh,001h,0eah,002h,001h,0eah,00dh,021h,0eah,002h	; 8365  .!..!........!..
	defb 021h,0e9h,006h,0d1h,0eah,00dh,07bh,0eah,001h,075h,0e9h,002h,0c2h,0f0h,0fah,063h	; 8375  !.....{..u.....c
	defb 063h,067h,063h,063h,067h,063h,063h,063h,063h,067h,067h,0fah	; 8385  cgccgccccgg.

; ----------------------------------------------------------------------
; DATOS partitura_8391: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x34 (tools/partituras.py); lo leen p06:B51E (25 bytes)
;   0x8391..0x83aa  (25 bytes)
DATA_partitura_8391:
	defb 0feh,004h,0d0h,0e9h,006h,093h,093h,093h,093h,097h,097h,087h,087h,083h,083h,087h	; 8391  ................
	defb 087h,083h,083h,083h,083h,087h,0fdh,091h,083h	; 83a1  .........

; ----------------------------------------------------------------------
; DATOS partitura_83AA: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x34 (tools/partituras.py); lo leen p06:B51E (34 bytes)
;   0x83aa..0x83cc  (34 bytes)
DATA_partitura_83AA:
	defb 0feh,004h,0d0h,0e9h,006h,083h,083h,083h,083h,087h,087h,0feh,001h,0eah,00ch,0ebh	; 83aa  ................
	defb 017h,0f5h,0d4h,007h,007h,003h,003h,007h,0d5h,077h,093h,0b3h,0d4h,007h,007h,0fdh	; 83ba  .........w......
	defb 0aah,083h	; 83ca

; ----------------------------------------------------------------------
; DATOS partitura_83CC: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x34 (tools/partituras.py); lo leen p06:B51E (23 bytes)
;   0x83cc..0x83e3  (23 bytes)
DATA_partitura_83CC:
	defb 0feh,004h,0d0h,0e9h,006h,0f8h,028h,0f9h,027h,085h,067h,067h,063h,063h,067h,067h	; 83cc  ......(.'.ggccgg
	defb 063h,063h,067h,067h,0fdh,0cch,083h	; 83dc

; ----------------------------------------------------------------------
; DATOS partitura_83E3: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x34 (tools/partituras.py); lo leen p06:B51E (56 bytes)
;   0x83e3..0x841b  (56 bytes)
DATA_partitura_83E3:
	defb 0feh,004h,0d0h,0e9h,006h,0f8h,005h,0f9h,027h,085h,0a7h,0a7h,0a3h,0a3h,0a7h,0feh	; 83e3  ........'.......
	defb 001h,0f8h,013h,0d1h,0e9h,006h,0eah,005h,043h,0eah,002h,041h,0eah,005h,040h,0eah	; 83f3  ........C..A..@.
	defb 002h,040h,0eah,005h,021h,0eah,002h,021h,0eah,005h,021h,0eah,002h,021h,0d2h,0eah	; 8403  .@..!..!..!..!..
	defb 005h,04bh,0eah,002h,043h,0fdh,0e3h,083h	; 8413  .K..C...

; ----------------------------------------------------------------------
; DATOS partitura_841B: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x34 (tools/partituras.py); lo leen p06:B51E (140 bytes)
;   0x841b..0x84a7  (140 bytes)
DATA_partitura_841B:
	defb 0feh,004h,0d0h,0e9h,006h,0f8h,014h,0a3h,0a3h,0a3h,0a3h,0a7h,0a3h,0feh,001h,0f8h	; 841b  ................
	defb 013h,0e9h,004h,0eah,006h,0d2h,070h,0eah,002h,070h,0eah,006h,0d1h,000h,0eah,002h	; 842b  ......p..p......
	defb 000h,0eah,006h,040h,0eah,002h,040h,0e9h,006h,0eah,006h,073h,0eah,002h,071h,0eah	; 843b  ...@..@....s..q.
	defb 006h,070h,0eah,002h,070h,0eah,006h,053h,0eah,002h,051h,0eah,006h,050h,0eah,002h	; 844b  .p..p..S..Q..P..
	defb 050h,0eah,006h,041h,0eah,002h,041h,0eah,006h,001h,0eah,002h,001h,0eah,006h,0d2h	; 845b  P..A..A.........
	defb 072h,0eah,002h,070h,0e9h,004h,0eah,006h,040h,0eah,002h,040h,0eah,006h,050h,0eah	; 846b  r..p....@..@..P.
	defb 002h,050h,0eah,006h,060h,0eah,002h,060h,0e9h,006h,0eah,006h,073h,0eah,002h,071h	; 847b  .P..`..`....s..q
	defb 0eah,006h,070h,0eah,002h,070h,0eah,006h,091h,0eah,002h,091h,0eah,006h,0b1h,0eah	; 848b  ..p..p..........
	defb 002h,0b1h,0eah,006h,0d1h,00bh,0eah,002h,003h,0fdh,01bh,084h	; 849b  ............

; ----------------------------------------------------------------------
; DATOS partitura_84A7: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x34 (tools/partituras.py); lo leen p06:B51E (135 bytes)
;   0x84a7..0x852e  (135 bytes)
DATA_partitura_84A7:
	defb 0feh,001h,0e9h,006h,0cfh,0cbh,0e9h,004h,0eah,005h,0d2h,040h,0eah,002h,040h,0eah	; 84a7  ...........@..@.
	defb 005h,070h,0eah,002h,070h,0eah,005h,0d1h,000h,0eah,002h,000h,0e9h,006h,0eah,005h	; 84b7  .p..p...........
	defb 043h,0eah,002h,041h,0eah,005h,040h,0eah,002h,040h,0eah,005h,023h,0eah,002h,021h	; 84c7  C..A..@..@..#..!
	defb 0eah,005h,020h,0eah,002h,020h,0eah,005h,001h,0eah,002h,001h,0eah,005h,0d2h,071h	; 84d7  .. .. .........q
	defb 0eah,002h,071h,0eah,005h,042h,0eah,002h,040h,0e9h,004h,0eah,005h,000h,0eah,002h	; 84e7  ..q..B..@.......
	defb 000h,0eah,005h,020h,0eah,002h,020h,0eah,005h,030h,0eah,002h,030h,0e9h,006h,0eah	; 84f7  ... .. ..0..0...
	defb 005h,043h,0eah,002h,041h,0eah,005h,040h,0eah,002h,040h,0eah,005h,051h,0eah,002h	; 8507  .C..A..@..@..Q..
	defb 051h,0eah,005h,071h,0eah,002h,071h,0eah,005h,07bh,0eah,002h,073h,0fdh,0a7h,084h	; 8517  Q..q..q..{..s...
	defb 063h,063h,063h,063h,067h,067h,0fah	; 8527

; ----------------------------------------------------------------------
; DATOS partitura_852E: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x35 (tools/partituras.py); lo leen p06:B51E (22 bytes)
;   0x852e..0x8544  (22 bytes)
DATA_partitura_852E:
	defb 0feh,004h,0d0h,0e9h,005h,093h,093h,093h,093h,097h,097h,077h,0fbh,006h,039h,085h	; 852e  ...........w..9.
	defb 073h,073h,077h,0fdh,02eh,085h	; 853e

; ----------------------------------------------------------------------
; DATOS partitura_8544: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x35 (tools/partituras.py); lo leen p06:B51E (31 bytes)
;   0x8544..0x8563  (31 bytes)
DATA_partitura_8544:
	defb 0feh,004h,0d0h,0e9h,005h,073h,073h,073h,073h,077h,077h,0feh,001h,0eah,00dh,0ebh	; 8544  .....ssssww.....
	defb 017h,0f5h,0d5h,0a7h,097h,077h,057h,077h,097h,0a3h,0a3h,0a7h,0fdh,044h,085h	; 8554  .....wWw.....D.

; ----------------------------------------------------------------------
; DATOS partitura_8563: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x35 (tools/partituras.py); lo leen p06:B51E (22 bytes)
;   0x8563..0x8579  (22 bytes)
DATA_partitura_8563:
	defb 0feh,004h,0d0h,0e9h,005h,0f8h,028h,053h,053h,053h,053h,057h,0fbh,008h,06eh,085h	; 8563  ......(SSSSW..n.
	defb 053h,053h,057h,0fdh,063h,085h	; 8573

; ----------------------------------------------------------------------
; DATOS partitura_8579: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x35 (tools/partituras.py); lo leen p06:B51E (58 bytes)
;   0x8579..0x85b3  (58 bytes)
DATA_partitura_8579:
	defb 0feh,004h,0d0h,0e9h,005h,0f8h,005h,063h,063h,063h,063h,067h,067h,0f8h,014h,0a7h	; 8579  .......ccccgg...
	defb 0a7h,0a7h,0a7h,0feh,001h,0f8h,00ah,0d1h,0eah,006h,021h,0eah,002h,021h,0eah,006h	; 8589  ..........!..!..
	defb 021h,0eah,002h,021h,0eah,006h,001h,0eah,002h,001h,0eah,006h,001h,0eah,002h,001h	; 8599  !..!............
	defb 0d2h,0eah,006h,02bh,0eah,002h,023h,0fdh,079h,085h	; 85a9  ...+..#.y.

; ----------------------------------------------------------------------
; DATOS partitura_85B3: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x35 (tools/partituras.py); lo leen p06:B51E (105 bytes)
;   0x85b3..0x861c  (105 bytes)
DATA_partitura_85B3:
	defb 0feh,004h,0d0h,0e9h,005h,0f8h,014h,0a3h,0a3h,0a3h,0a3h,0a7h,0a7h,0feh,001h,0f8h	; 85b3  ................
	defb 013h,0eah,007h,0d2h,0a1h,0eah,003h,0a1h,0eah,007h,0a1h,0eah,003h,0a1h,0eah,007h	; 85c3  ................
	defb 091h,0eah,003h,091h,0eah,007h,091h,0eah,003h,091h,0eah,007h,070h,0eah,003h,070h	; 85d3  ............p..p
	defb 0eah,007h,071h,0eah,003h,071h,0eah,007h,090h,0eah,003h,090h,0eah,007h,071h,0eah	; 85e3  ..q..q........q.
	defb 003h,071h,0eah,007h,051h,0eah,003h,051h,0eah,007h,071h,0eah,003h,071h,0eah,007h	; 85f3  .q..Q..Q..q..q..
	defb 071h,0eah,003h,071h,0eah,007h,091h,0eah,003h,091h,0eah,007h,091h,0eah,003h,091h	; 8603  q..q............
	defb 0eah,007h,0abh,0eah,003h,0a3h,0fdh,0b3h,085h	; 8613  .........

; ----------------------------------------------------------------------
; DATOS partitura_861C: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x35 (tools/partituras.py); lo leen p06:B51E (96 bytes)
;   0x861c..0x867c  (96 bytes)
DATA_partitura_861C:
	defb 0feh,001h,0e9h,005h,0cfh,0cfh,0feh,001h,0eah,006h,0d2h,051h,0eah,002h,051h,0eah	; 861c  ...........Q..Q.
	defb 006h,051h,0eah,002h,051h,0eah,006h,051h,0eah,002h,051h,0eah,006h,051h,0eah,002h	; 862c  .Q..Q..Q..Q..Q..
	defb 051h,0eah,006h,030h,0eah,002h,030h,0eah,006h,031h,0eah,002h,031h,0eah,006h,050h	; 863c  Q..0..0..1..1..P
	defb 0eah,002h,050h,0eah,006h,031h,0eah,002h,031h,0eah,006h,021h,0eah,002h,021h,0eah	; 864c  ..P..1..1..!..!.
	defb 006h,031h,0eah,002h,031h,0eah,006h,031h,0eah,002h,031h,0eah,006h,051h,0eah,002h	; 865c  .1..1..1..1..Q..
	defb 051h,0eah,006h,051h,0eah,002h,051h,0eah,006h,05bh,0eah,002h,053h,0fdh,01ch,086h	; 866c  Q..Q..Q..[..S...

; ----------------------------------------------------------------------
; DATOS partitura_867C: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x36 (tools/partituras.py); lo leen p06:B51E (31 bytes)
;   0x867c..0x869b  (31 bytes)
DATA_partitura_867C:
	defb 0feh,004h,0d0h,0e9h,005h,0f9h,0e2h,091h,0d1h,0a7h,0a7h,0a7h,0a7h,0a7h,0a7h,0a3h	; 867c  ................
	defb 0a3h,0a7h,0a7h,0a7h,0a3h,0a3h,0a7h,0a7h,0a7h,0a3h,0a3h,0a7h,0fdh,07ch,086h	; 868c  .............|.

; ----------------------------------------------------------------------
; DATOS partitura_869B: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x36 (tools/partituras.py); lo leen p06:B51E (44 bytes)
;   0x869b..0x86c7  (44 bytes)
DATA_partitura_869B:
	defb 0feh,004h,0d1h,0e9h,005h,0f9h,0f0h,091h,0feh,001h,0eah,00dh,0ebh,017h,0f5h,0d5h	; 869b  ................
	defb 0a7h,0d4h,057h,037h,057h,0d5h,077h,0a7h,0d4h,003h,003h,057h,027h,0d5h,0a7h,0d4h	; 86ab  ..W7W.w....W'...
	defb 033h,033h,047h,057h,027h,0d5h,0a3h,0a3h,0a7h,0fdh,09bh,086h	; 86bb  33GW'.......

; ----------------------------------------------------------------------
; DATOS partitura_86C7: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x36 (tools/partituras.py); lo leen p06:B51E (32 bytes)
;   0x86c7..0x86e7  (32 bytes)
DATA_partitura_86C7:
	defb 0feh,004h,0d0h,0e9h,005h,0f8h,028h,0f9h,0aah,091h,057h,057h,057h,057h,057h,057h	; 86c7  ......(...WWWWWW
	defb 053h,053h,057h,057h,057h,053h,053h,057h,057h,057h,053h,053h,057h,0fdh,0c7h,086h	; 86d7  SSWWWSSWWWSSW...

; ----------------------------------------------------------------------
; DATOS partitura_86E7: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x36 (tools/partituras.py); lo leen p06:B51E (84 bytes)
;   0x86e7..0x873b  (84 bytes)
DATA_partitura_86E7:
	defb 0feh,004h,0d0h,0f8h,005h,0e9h,005h,0f9h,0b8h,091h,0f8h,014h,0a7h,0a7h,0a7h,0a7h	; 86e7  ................
	defb 0a7h,0a7h,0a3h,0a3h,0a7h,0a7h,0a7h,0a3h,0a3h,0a7h,0feh,001h,0f8h,013h,0d2h,0eah	; 86f7  ................
	defb 006h,0a0h,0eah,002h,0a0h,0eah,006h,0a1h,0eah,002h,0a1h,0d1h,0eah,006h,000h,0eah	; 8707  ................
	defb 002h,000h,0d2h,0eah,006h,0a0h,0eah,002h,0a0h,0eah,006h,090h,0eah,002h,090h,0eah	; 8717  ................
	defb 006h,070h,0eah,002h,070h,0eah,006h,050h,0eah,002h,050h,0eah,006h,02bh,0eah,002h	; 8727  .p..p..P..P..+..
	defb 023h,0fdh,0e7h,086h	; 8737

; ----------------------------------------------------------------------
; DATOS partitura_873B: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x36 (tools/partituras.py); lo leen p06:B51E (234 bytes)
;   0x873b..0x8825  (234 bytes)
DATA_partitura_873B:
	defb 0feh,004h,0d0h,0e9h,005h,0f8h,014h,0f9h,0f0h,091h,0feh,001h,0f8h,013h,0eah,007h	; 873b  ................
	defb 0d1h,020h,0eah,003h,020h,0eah,007h,001h,0eah,003h,001h,0eah,007h,000h,0eah,003h	; 874b  . .. ...........
	defb 000h,0d2h,0eah,007h,0a1h,0eah,003h,0a1h,0eah,007h,051h,0eah,003h,051h,0eah,007h	; 875b  ..........Q..Q..
	defb 030h,0eah,003h,030h,0eah,007h,051h,0eah,003h,051h,0eah,007h,070h,0eah,003h,070h	; 876b  0..0..Q..Q..p..p
	defb 0eah,007h,055h,0eah,003h,051h,0eah,007h,070h,0eah,003h,070h,0eah,007h,071h,0eah	; 877b  ..U..Q..p..p..q.
	defb 003h,071h,0eah,007h,090h,0eah,003h,090h,0eah,007h,0a1h,0eah,003h,0a1h,0d1h,0eah	; 878b  .q..............
	defb 007h,001h,0eah,003h,001h,0eah,007h,000h,0eah,003h,000h,0eah,007h,001h,0eah,003h	; 879b  ................
	defb 001h,0eah,007h,020h,0eah,003h,020h,0eah,007h,005h,0eah,003h,001h,0eah,007h,0d1h	; 87ab  ... .. .........
	defb 020h,0eah,003h,020h,0eah,007h,021h,0eah,003h,021h,0eah,007h,000h,0eah,003h,000h	; 87bb   .. ..!..!......
	defb 0d2h,0eah,007h,0a1h,0eah,003h,0a1h,0d1h,0eah,007h,021h,0eah,003h,021h,0eah,007h	; 87cb  ..........!..!..
	defb 030h,0eah,003h,030h,0eah,007h,031h,0eah,003h,031h,0eah,007h,030h,0eah,003h,030h	; 87db  0..0..1..1..0..0
	defb 0eah,007h,045h,0eah,003h,041h,0eah,007h,050h,0eah,003h,050h,0eah,007h,051h,0eah	; 87eb  ..E..A..P..P..Q.
	defb 003h,051h,0eah,007h,070h,0eah,003h,070h,0eah,007h,050h,0eah,003h,050h,0eah,007h	; 87fb  .Q..p..p..P..P..
	defb 030h,0eah,003h,030h,0eah,007h,020h,0eah,003h,020h,0eah,007h,000h,0eah,003h,000h	; 880b  0..0.. .. ......
	defb 0d2h,0eah,007h,0abh,0eah,003h,0a3h,0fdh,03bh,087h	; 881b  ..........

; ----------------------------------------------------------------------
; DATOS partitura_8825: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x36 (tools/partituras.py); lo leen p06:B51E (227 bytes)
;   0x8825..0x8908  (227 bytes)
DATA_partitura_8825:
	defb 0feh,001h,0e9h,005h,0cfh,0cfh,0cfh,0cfh,0f8h,013h,0eah,006h,0d2h,0a0h,0eah,002h	; 8825  ................
	defb 0a0h,0eah,006h,091h,0eah,002h,091h,0eah,006h,090h,0eah,002h,090h,0eah,006h,051h	; 8835  ...............Q
	defb 0eah,002h,051h,0eah,006h,021h,0eah,002h,021h,0eah,006h,000h,0eah,002h,000h,0eah	; 8845  ..Q..!..!.......
	defb 006h,021h,0eah,002h,021h,0eah,006h,030h,0eah,002h,030h,0eah,006h,025h,0eah,002h	; 8855  .!..!..0..0..%..
	defb 021h,0eah,006h,030h,0eah,002h,030h,0eah,006h,031h,0eah,002h,031h,0eah,006h,050h	; 8865  !..0..0..1..1..P
	defb 0eah,002h,050h,0eah,006h,071h,0eah,002h,071h,0eah,006h,091h,0eah,002h,091h,0eah	; 8875  ..P..q..q.......
	defb 006h,090h,0eah,002h,090h,0eah,006h,091h,0eah,002h,091h,0eah,006h,0a0h,0eah,002h	; 8885  ................
	defb 0a0h,0eah,006h,095h,0eah,002h,091h,0eah,006h,0d2h,0a0h,0eah,002h,0a0h,0eah,006h	; 8895  ................
	defb 0a1h,0eah,002h,0a1h,0eah,006h,090h,0eah,002h,090h,0eah,006h,051h,0eah,002h,051h	; 88a5  ............Q..Q
	defb 0eah,006h,0a1h,0eah,002h,0a1h,0d1h,0eah,006h,000h,0eah,002h,000h,0eah,006h,001h	; 88b5  ................
	defb 0eah,002h,001h,0eah,006h,000h,0eah,002h,000h,0eah,006h,015h,0eah,002h,011h,0eah	; 88c5  ................
	defb 006h,020h,0eah,002h,020h,0eah,006h,021h,0eah,002h,021h,0eah,006h,030h,0eah,002h	; 88d5  . .. ..!..!..0..
	defb 030h,0eah,006h,020h,0eah,002h,020h,0eah,006h,000h,0eah,002h,000h,0d2h,0eah,006h	; 88e5  0.. .. .........
	defb 0a0h,0eah,002h,0a0h,0eah,006h,090h,0eah,002h,090h,0eah,006h,05bh,0eah,002h,053h	; 88f5  ............[..S
	defb 0fdh,025h,088h	; 8905

; ----------------------------------------------------------------------
; DATOS partitura_8908: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3C (tools/partituras.py); lo leen p06:B51E (5 bytes)
;   0x8908..0x890d  (5 bytes)
DATA_partitura_8908:
	defb 0feh,002h,0f9h,02bh,082h	; 8908

; ----------------------------------------------------------------------
; DATOS partitura_890D: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x37, 0x3C (tools/partituras.py); lo leen p06:B51E (33 bytes)
;   0x890d..0x892e  (33 bytes)
DATA_partitura_890D:
	defb 0feh,004h,0d0h,0e9h,006h,093h,093h,097h,087h,0fbh,008h,015h,089h,083h,083h,087h	; 890d  ................
	defb 083h,083h,087h,087h,087h,083h,083h,087h,093h,093h,097h,093h,093h,097h,0fdh,015h	; 891d  ................
	defb 089h	; 892d

; ----------------------------------------------------------------------
; DATOS partitura_892E: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3C (tools/partituras.py); lo leen p06:B51E (5 bytes)
;   0x892e..0x8933  (5 bytes)
DATA_partitura_892E:
	defb 0feh,002h,0f9h,04eh,082h	; 892e

; ----------------------------------------------------------------------
; DATOS partitura_8933: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x37, 0x3C (tools/partituras.py); lo leen p06:B51E (49 bytes)
;   0x8933..0x8964  (49 bytes)
DATA_partitura_8933:
	defb 0feh,004h,0d0h,0e9h,006h,083h,083h,087h,0feh,001h,0eah,00ch,0ebh,017h,0f5h,0d5h	; 8933  ................
	defb 087h,087h,087h,087h,087h,087h,057h,057h,0d4h,013h,013h,017h,003h,003h,007h,0d5h	; 8943  ......WW........
	defb 037h,077h,083h,083h,087h,0feh,004h,0d0h,083h,083h,087h,083h,083h,087h,0fdh,03bh	; 8953  7w..............
	defb 089h	; 8963

; ----------------------------------------------------------------------
; DATOS partitura_8964: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3C (tools/partituras.py); lo leen p06:B51E (5 bytes)
;   0x8964..0x8969  (5 bytes)
DATA_partitura_8964:
	defb 0feh,002h,0f9h,065h,082h	; 8964

; ----------------------------------------------------------------------
; DATOS partitura_8969: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x37, 0x3C (tools/partituras.py); lo leen p06:B51E (38 bytes)
;   0x8969..0x898f  (38 bytes)
DATA_partitura_8969:
	defb 0feh,004h,0d0h,0f8h,028h,0e9h,006h,063h,063h,067h,067h,067h,067h,067h,067h,067h	; 8969  ....(..ccggggggg
	defb 067h,067h,063h,063h,067h,063h,063h,067h,067h,067h,063h,063h,067h,063h,063h,067h	; 8979  ggccgccgggccgccg
	defb 063h,063h,067h,0fdh,073h,089h	; 8989

; ----------------------------------------------------------------------
; DATOS partitura_898F: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3C (tools/partituras.py); lo leen p06:B51E (5 bytes)
;   0x898f..0x8994  (5 bytes)
DATA_partitura_898F:
	defb 0feh,002h,0f9h,07eh,082h	; 898f

; ----------------------------------------------------------------------
; DATOS partitura_8994: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x37, 0x3C (tools/partituras.py); lo leen p06:B51E (39 bytes)
;   0x8994..0x89bb  (39 bytes)
DATA_partitura_8994:
	defb 0feh,004h,0d0h,0f8h,005h,0e9h,006h,063h,063h,067h,0f8h,014h,0a7h,0fbh,008h,0a0h	; 8994  .......ccg......
	defb 089h,0a3h,0a3h,0a7h,0a3h,0a3h,0a7h,0a7h,0a7h,0a3h,0a3h,0a7h,0f8h,005h,063h,063h	; 89a4  ..............cc
	defb 067h,063h,063h,067h,0fdh,09eh,089h	; 89b4

; ----------------------------------------------------------------------
; DATOS partitura_89BB: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3C (tools/partituras.py); lo leen p06:B51E (5 bytes)
;   0x89bb..0x89c0  (5 bytes)
DATA_partitura_89BB:
	defb 0feh,002h,0f9h,0d5h,082h	; 89bb

; ----------------------------------------------------------------------
; DATOS partitura_89C0: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x37, 0x3C (tools/partituras.py); lo leen p06:B51E (182 bytes)
;   0x89c0..0x8a76  (182 bytes)
DATA_partitura_89C0:
	defb 0feh,004h,0d0h,0e9h,006h,0f8h,014h,0a3h,0a3h,0a7h,0feh,001h,0f8h,013h,0eah,005h	; 89c0  ................
	defb 0d2h,035h,0eah,002h,031h,0eah,005h,081h,0eah,002h,081h,0eah,005h,081h,0eah,002h	; 89d0  .5..1...........
	defb 080h,0eah,005h,0a0h,0d1h,007h,0eah,002h,003h,0eah,005h,001h,0eah,002h,000h,0eah	; 89e0  ................
	defb 005h,010h,031h,0eah,002h,031h,0eah,005h,031h,0eah,002h,031h,0eah,005h,011h,0eah	; 89f0  ..1..1..1..1....
	defb 002h,011h,0eah,005h,001h,0eah,002h,001h,0d2h,0eah,005h,057h,0eah,002h,053h,0eah	; 8a00  ...........W..S.
	defb 005h,0a1h,0eah,002h,0a0h,0d1h,0eah,005h,000h,0eah,005h,0d1h,011h,0eah,002h,011h	; 8a10  ................
	defb 0eah,005h,011h,0eah,002h,011h,0eah,005h,011h,0eah,002h,011h,0d2h,0eah,005h,081h	; 8a20  ................
	defb 0eah,002h,080h,0eah,005h,0a0h,0d1h,001h,0eah,002h,001h,0eah,005h,001h,0eah,002h	; 8a30  ................
	defb 001h,0eah,005h,003h,0eah,002h,003h,0d2h,0eah,005h,031h,0eah,002h,031h,0eah,005h	; 8a40  ..........1..1..
	defb 0a1h,0eah,002h,0a0h,0eah,005h,080h,071h,0eah,002h,071h,0eah,005h,051h,0eah,002h	; 8a50  .......q..q..Q..
	defb 050h,0eah,005h,070h,08bh,0eah,002h,083h,0feh,004h,0d0h,0f8h,014h,0a3h,0a3h,0a7h	; 8a60  P..p............
	defb 0a3h,0a3h,0a7h,0fdh,0cah,089h	; 8a70

; ----------------------------------------------------------------------
; DATOS partitura_8A76: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3C (tools/partituras.py); lo leen p06:B51E (5 bytes)
;   0x8a76..0x8a7b  (5 bytes)
DATA_partitura_8A76:
	defb 0feh,002h,0f9h,02ch,083h	; 8a76

; ----------------------------------------------------------------------
; DATOS partitura_8A7B: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x37, 0x3C (tools/partituras.py); lo leen p06:B51E (157 bytes)
;   0x8a7b..0x8b18  (157 bytes)
DATA_partitura_8A7B:
	defb 0feh,001h,0e9h,006h,0cfh,0eah,004h,0d2h,005h,0eah,002h,001h,0eah,004h,031h,0eah	; 8a7b  ..............1.
	defb 002h,031h,0eah,004h,031h,0eah,002h,030h,0eah,004h,070h,087h,0eah,002h,083h,0eah	; 8a8b  .1..1..0..p.....
	defb 004h,081h,0eah,002h,080h,0eah,004h,0a0h,0d1h,001h,0eah,002h,001h,0eah,004h,001h	; 8a9b  ................
	defb 0eah,002h,001h,0d2h,0eah,004h,0a1h,0eah,002h,0a1h,0eah,004h,081h,0eah,002h,081h	; 8aab  ................
	defb 0eah,004h,017h,0eah,002h,013h,0eah,004h,071h,0eah,002h,070h,080h,0eah,004h,0d2h	; 8abb  ........q..p....
	defb 0a1h,0eah,002h,0a1h,0eah,004h,0a1h,0eah,002h,0a1h,0eah,004h,0a1h,0eah,002h,0a1h	; 8acb  ................
	defb 0eah,004h,051h,0eah,002h,050h,0eah,004h,070h,081h,0eah,002h,081h,0eah,004h,081h	; 8adb  ..Q..P..p.......
	defb 0eah,002h,081h,0eah,004h,083h,0eah,002h,083h,0eah,004h,001h,0eah,002h,001h,0eah	; 8aeb  ................
	defb 004h,071h,0eah,002h,070h,0eah,004h,050h,031h,0eah,002h,031h,0eah,004h,011h,0eah	; 8afb  .q..p..P1..1....
	defb 002h,011h,0eah,004h,03bh,0eah,002h,033h,0cfh,0cfh,0fdh,080h,08ah	; 8b0b  .......3.....

; ----------------------------------------------------------------------
; DATOS partitura_8B18: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x38 (tools/partituras.py); lo leen p06:B51E (19 bytes)
;   0x8b18..0x8b2b  (19 bytes)
DATA_partitura_8B18:
	defb 0feh,004h,0d0h,0e9h,006h,0f9h,0e2h,091h,087h,087h,087h,087h,087h,087h,087h,087h	; 8b18  ................
	defb 0fdh,018h,08bh	; 8b28

; ----------------------------------------------------------------------
; DATOS partitura_8B2B: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x38 (tools/partituras.py); lo leen p06:B51E (29 bytes)
;   0x8b2b..0x8b48  (29 bytes)
DATA_partitura_8B2B:
	defb 0feh,004h,0d0h,0e9h,006h,0f9h,0d4h,091h,0feh,001h,0eah,00ch,0ebh,017h,0f5h,0d5h	; 8b2b  ................
	defb 0a7h,057h,0a7h,057h,0a7h,0d4h,057h,037h,0d5h,0a7h,0fdh,02bh,08bh	; 8b3b  .W.W..W7...+.

; ----------------------------------------------------------------------
; DATOS partitura_8B48: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x38 (tools/partituras.py); lo leen p06:B51E (21 bytes)
;   0x8b48..0x8b5d  (21 bytes)
DATA_partitura_8B48:
	defb 0feh,004h,0d0h,0e9h,006h,0f8h,028h,0f9h,0b8h,091h,067h,067h,067h,067h,067h,067h	; 8b48  ......(...gggggg
	defb 067h,067h,0fdh,048h,08bh	; 8b58

; ----------------------------------------------------------------------
; DATOS partitura_8B5D: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x38 (tools/partituras.py); lo leen p06:B51E (66 bytes)
;   0x8b5d..0x8b9f  (66 bytes)
DATA_partitura_8B5D:
	defb 0feh,004h,0d0h,0f8h,005h,0e9h,006h,0f9h,0b8h,091h,0f8h,014h,0a7h,0a7h,0a7h,0a7h	; 8b5d  ................
	defb 0a7h,0a7h,0feh,001h,0f8h,013h,0e9h,004h,0d2h,0eah,005h,091h,0eah,002h,091h,0eah	; 8b6d  ................
	defb 005h,090h,0eah,002h,090h,0eah,005h,090h,0eah,002h,090h,0eah,005h,070h,0eah,002h	; 8b7d  .............p..
	defb 070h,0eah,005h,050h,0eah,002h,050h,0e9h,006h,0eah,005h,025h,0eah,002h,021h,0fdh	; 8b8d  p..P..P....%..!.
	defb 05dh,08bh	; 8b9d

; ----------------------------------------------------------------------
; DATOS partitura_8B9F: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x38 (tools/partituras.py); lo leen p06:B51E (157 bytes)
;   0x8b9f..0x8c3c  (157 bytes)
DATA_partitura_8B9F:
	defb 0feh,004h,0d0h,0e9h,006h,0f8h,014h,0f9h,0f0h,091h,0feh,001h,0f8h,013h,0eah,006h	; 8b9f  ................
	defb 0d2h,051h,0eah,002h,051h,0eah,006h,0a1h,0eah,002h,0a1h,0d1h,0eah,006h,053h,0eah	; 8baf  .Q..Q.........S.
	defb 002h,051h,0eah,006h,050h,0eah,002h,050h,0e9h,004h,0eah,006h,031h,0eah,002h,031h	; 8bbf  .Q..P..P....1..1
	defb 0eah,006h,030h,0eah,002h,030h,0eah,006h,030h,0eah,002h,030h,0eah,006h,020h,0eah	; 8bcf  ..0..0..0..0.. .
	defb 002h,020h,0eah,006h,000h,0eah,002h,000h,0e9h,006h,0eah,006h,021h,0eah,002h,021h	; 8bdf  . ..........!..!
	defb 0d2h,0eah,006h,0a1h,0eah,002h,0a1h,0eah,006h,0d2h,051h,0eah,002h,051h,0eah,006h	; 8bef  ..........Q..Q..
	defb 0a1h,0eah,002h,0a1h,0d1h,0eah,006h,053h,0eah,002h,051h,0eah,006h,050h,0eah,002h	; 8bff  .......S..Q..P..
	defb 050h,0e9h,004h,0eah,006h,031h,0eah,002h,031h,0eah,006h,030h,0eah,002h,030h,0eah	; 8c0f  P....1..1..0..0.
	defb 006h,030h,0eah,002h,030h,0eah,006h,020h,0eah,002h,020h,0eah,006h,000h,0eah,002h	; 8c1f  .0..0.. .. .....
	defb 000h,0e9h,006h,0d2h,0eah,006h,0a5h,0eah,002h,0a1h,0fdh,09fh,08bh	; 8c2f  .............

; ----------------------------------------------------------------------
; DATOS partitura_8C3C: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x38 (tools/partituras.py); lo leen p06:B51E (151 bytes)
;   0x8c3c..0x8cd3  (151 bytes)
DATA_partitura_8C3C:
	defb 0feh,001h,0e9h,006h,0cfh,0cfh,0cfh,0cfh,0eah,005h,0d2h,021h,0eah,002h,021h,0eah	; 8c3c  ...........!..!.
	defb 005h,051h,0eah,002h,051h,0d1h,0eah,005h,023h,0eah,002h,021h,0eah,005h,020h,0eah	; 8c4c  .Q..Q...#..!.. .
	defb 002h,020h,0e9h,004h,0eah,005h,001h,0eah,002h,001h,0eah,005h,000h,0eah,002h,000h	; 8c5c  . ..............
	defb 0eah,005h,000h,0eah,002h,000h,0d2h,0eah,005h,0a0h,0eah,002h,0a0h,0eah,005h,090h	; 8c6c  ................
	defb 0eah,002h,090h,0e9h,006h,0eah,005h,0a1h,0eah,002h,0a1h,0eah,005h,051h,0eah,002h	; 8c7c  .............Q..
	defb 051h,0eah,005h,0d2h,021h,0eah,002h,021h,0eah,005h,051h,0eah,002h,051h,0d1h,0eah	; 8c8c  Q...!..!..Q..Q..
	defb 005h,023h,0eah,002h,021h,0eah,005h,020h,0eah,002h,020h,0e9h,004h,0eah,005h,001h	; 8c9c  .#..!.. .. .....
	defb 0eah,002h,001h,0eah,005h,000h,0eah,002h,000h,0eah,005h,000h,0eah,002h,000h,0d2h	; 8cac  ................
	defb 0eah,005h,0a0h,0eah,002h,0a0h,0eah,005h,090h,0eah,002h,090h,0e9h,006h,0eah,005h	; 8cbc  ................
	defb 055h,0eah,002h,051h,0fdh,03ch,08ch	; 8ccc

; ----------------------------------------------------------------------
; DATOS partitura_8CD3: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x39 (tools/partituras.py); lo leen p06:B51E (19 bytes)
;   0x8cd3..0x8ce6  (19 bytes)
DATA_partitura_8CD3:
	defb 0feh,004h,0d0h,0e9h,005h,0f9h,0e2h,091h,077h,0fbh,00eh,0dbh,08ch,073h,073h,077h	; 8cd3  ........w....ssw
	defb 0fdh,0d3h,08ch	; 8ce3

; ----------------------------------------------------------------------
; DATOS partitura_8CE6: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x39 (tools/partituras.py); lo leen p06:B51E (42 bytes)
;   0x8ce6..0x8d10  (42 bytes)
DATA_partitura_8CE6:
	defb 0feh,004h,0d0h,0e9h,005h,0f9h,0c6h,091h,0feh,001h,0eah,00dh,0ebh,017h,0f5h,0d5h	; 8ce6  ................
	defb 057h,057h,027h,0a7h,047h,0d4h,007h,0d5h,057h,097h,0a7h,0d4h,027h,0d5h,097h,0d4h	; 8cf6  WW'.G...W...'...
	defb 007h,0d5h,027h,047h,053h,053h,057h,0fdh,0e6h,08ch	; 8d06  ..'GSSW...

; ----------------------------------------------------------------------
; DATOS partitura_8D10: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x39 (tools/partituras.py); lo leen p06:B51E (21 bytes)
;   0x8d10..0x8d25  (21 bytes)
DATA_partitura_8D10:
	defb 0feh,004h,0d0h,0e9h,005h,0f8h,028h,0f9h,0aah,091h,057h,0fbh,00eh,01ah,08dh,053h	; 8d10  ......(...W....S
	defb 053h,057h,0fdh,010h,08dh	; 8d20

; ----------------------------------------------------------------------
; DATOS partitura_8D25: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x39 (tools/partituras.py); lo leen p06:B51E (59 bytes)
;   0x8d25..0x8d60  (59 bytes)
DATA_partitura_8D25:
	defb 0feh,004h,0d0h,0f8h,005h,0e9h,005h,0f9h,0b8h,091h,0f8h,014h,0a7h,0fbh,00ch,031h	; 8d25  ...............1
	defb 08dh,0feh,001h,0f8h,013h,0d3h,0eah,006h,051h,0eah,002h,051h,0d2h,0eah,006h,001h	; 8d35  ........Q..Q....
	defb 0eah,002h,000h,0d3h,0eah,006h,0a0h,071h,0eah,002h,071h,0eah,006h,051h,0eah,002h	; 8d45  .......q..q..Q..
	defb 050h,0eah,006h,070h,09bh,0eah,002h,093h,0fdh,025h,08dh	; 8d55  P..p.....%.

; ----------------------------------------------------------------------
; DATOS partitura_8D60: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x39 (tools/partituras.py); lo leen p06:B51E (223 bytes)
;   0x8d60..0x8e3f  (223 bytes)
DATA_partitura_8D60:
	defb 0feh,004h,0d0h,0e9h,005h,0f8h,014h,0f9h,0f0h,091h,0feh,001h,0f8h,013h,0eah,007h	; 8d60  ................
	defb 0d2h,090h,0eah,003h,090h,0eah,007h,091h,0eah,003h,091h,0eah,007h,070h,0eah,003h	; 8d70  .............p..
	defb 070h,0eah,007h,090h,0eah,003h,090h,0eah,007h,070h,0eah,003h,070h,0eah,007h,050h	; 8d80  p........p..p..P
	defb 0eah,003h,050h,0eah,007h,000h,0eah,003h,000h,0eah,007h,020h,0eah,003h,020h,0eah	; 8d90  ..P........ .. .
	defb 007h,021h,0eah,003h,021h,0eah,007h,050h,0eah,003h,050h,0eah,007h,0a3h,0eah,003h	; 8da0  .!..!..P..P.....
	defb 0a3h,0eah,007h,040h,0eah,003h,040h,0eah,007h,041h,0eah,003h,041h,0eah,007h,070h	; 8db0  ...@..@..A..A..p
	defb 0eah,003h,070h,0d1h,0eah,007h,003h,0eah,003h,003h,0d2h,0eah,007h,050h,0eah,003h	; 8dc0  ..p..........P..
	defb 050h,0eah,007h,051h,0eah,003h,051h,0eah,007h,070h,0eah,003h,070h,0eah,007h,093h	; 8dd0  P..Q..Q..p..p...
	defb 0eah,003h,093h,0eah,007h,0d2h,0a1h,0eah,003h,0a1h,0eah,007h,051h,0eah,003h,050h	; 8de0  ............Q..P
	defb 0eah,007h,0a0h,0d1h,021h,0eah,003h,021h,0eah,007h,021h,0eah,003h,021h,0d2h,0eah	; 8df0  ....!..!..!..!..
	defb 007h,091h,0eah,003h,091h,0eah,007h,051h,0eah,003h,050h,0eah,007h,090h,0d1h,0eah	; 8e00  .......Q..P.....
	defb 007h,001h,0eah,003h,001h,0eah,007h,001h,0eah,003h,001h,0d2h,0eah,007h,021h,0eah	; 8e10  ..............!.
	defb 003h,021h,0eah,007h,071h,0eah,003h,070h,0eah,007h,050h,041h,0eah,003h,041h,0eah	; 8e20  .!..q..p..PA..A.
	defb 007h,021h,0eah,003h,020h,0eah,007h,040h,05bh,0eah,003h,053h,0fdh,060h,08dh	; 8e30  .!.. ..@[..S.`.

; ----------------------------------------------------------------------
; DATOS partitura_8E3F: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x39 (tools/partituras.py); lo leen p06:B51E (217 bytes)
;   0x8e3f..0x8f18  (217 bytes)
DATA_partitura_8E3F:
	defb 0feh,001h,0e9h,005h,0cfh,0cfh,0cfh,0cfh,0eah,006h,0d2h,050h,0eah,002h,050h,0eah	; 8e3f  ...........P..P.
	defb 006h,051h,0eah,002h,051h,0eah,006h,040h,0eah,002h,040h,0eah,006h,050h,0eah,002h	; 8e4f  .Q..Q..@..@..P..
	defb 050h,0eah,006h,040h,0eah,002h,040h,0eah,006h,020h,0eah,002h,020h,0d3h,0eah,006h	; 8e5f  P..@..@.. .. ...
	defb 090h,0eah,002h,090h,0eah,006h,0a0h,0eah,002h,0a0h,0eah,006h,0a1h,0eah,002h,0a1h	; 8e6f  ................
	defb 0d2h,0eah,006h,020h,0eah,002h,020h,0eah,006h,073h,0eah,002h,073h,0eah,006h,000h	; 8e7f  ... .. ..s..s...
	defb 0eah,002h,000h,0eah,006h,001h,0eah,002h,001h,0eah,006h,040h,0eah,002h,040h,0eah	; 8e8f  ...........@..@.
	defb 006h,093h,0eah,002h,093h,0eah,006h,000h,0eah,002h,000h,0eah,006h,001h,0eah,002h	; 8e9f  ................
	defb 001h,0eah,006h,040h,0eah,002h,040h,0eah,006h,053h,0eah,002h,053h,0eah,006h,0d2h	; 8eaf  ...@..@..S..S...
	defb 071h,0eah,002h,071h,0eah,006h,021h,0eah,002h,020h,0eah,006h,070h,0a1h,0eah,002h	; 8ebf  q..q..!.. ..p...
	defb 0a1h,0eah,006h,0a1h,0eah,002h,0a1h,0d2h,0eah,006h,051h,0eah,002h,051h,0eah,006h	; 8ecf  ..........Q..Q..
	defb 021h,0eah,002h,020h,0eah,006h,050h,0eah,007h,091h,0eah,002h,091h,0eah,006h,091h	; 8edf  !.. ..P.........
	defb 0eah,002h,091h,0d3h,0eah,006h,0a1h,0eah,002h,0a1h,0d2h,0eah,006h,041h,0eah,002h	; 8eef  .............A..
	defb 040h,0eah,006h,020h,001h,0eah,002h,001h,0d3h,0eah,006h,0a1h,0eah,002h,0a1h,0d2h	; 8eff  @.. ............
	defb 0eah,006h,00bh,0eah,002h,003h,0fdh,03fh,08eh	; 8f0f  .......?.

; ----------------------------------------------------------------------
; DATOS partitura_8F18: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3A (tools/partituras.py); lo leen p06:B51E (36 bytes)
;   0x8f18..0x8f3c  (36 bytes)
DATA_partitura_8F18:
	defb 0feh,004h,0d0h,0e9h,005h,093h,093h,097h,093h,093h,097h,0d1h,0a7h,0a7h,0a3h,0a3h	; 8f18  ................
	defb 0a7h,0a7h,0a7h,0a3h,0a3h,0a7h,0a7h,0a3h,0a3h,0a7h,0a3h,0a3h,0a7h,0a7h,0a3h,0a3h	; 8f28  ................
	defb 0a7h,0fdh,018h,08fh	; 8f38

; ----------------------------------------------------------------------
; DATOS partitura_8F3C: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3A (tools/partituras.py); lo leen p06:B51E (47 bytes)
;   0x8f3c..0x8f6b  (47 bytes)
DATA_partitura_8F3C:
	defb 0feh,004h,0d1h,0e9h,005h,0a3h,0a3h,0a7h,0a3h,0a3h,0a7h,0feh,001h,0eah,00dh,0ebh	; 8f3c  ................
	defb 017h,0f5h,0d5h,057h,007h,0a3h,0a3h,0a7h,047h,007h,093h,093h,097h,057h,0d4h,003h	; 8f4c  ...W....G....W..
	defb 003h,0d5h,0a7h,0d4h,053h,053h,007h,0d5h,047h,053h,053h,057h,0fdh,03ch,08fh	; 8f5c  ....SS..GSSW.<.

; ----------------------------------------------------------------------
; DATOS partitura_8F6B: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3A (tools/partituras.py); lo leen p06:B51E (37 bytes)
;   0x8f6b..0x8f90  (37 bytes)
DATA_partitura_8F6B:
	defb 0feh,004h,0d0h,0f8h,028h,0e9h,005h,053h,053h,057h,053h,053h,057h,057h,057h,053h	; 8f6b  ....(..SSWSSWWWS
	defb 053h,057h,057h,057h,053h,053h,057h,057h,053h,053h,057h,053h,053h,057h,057h,053h	; 8f7b  SWWWSSWWSSWSSWWS
	defb 053h,057h,0fdh,06bh,08fh	; 8f8b

; ----------------------------------------------------------------------
; DATOS partitura_8F90: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3A (tools/partituras.py); lo leen p06:B51E (71 bytes)
;   0x8f90..0x8fd7  (71 bytes)
DATA_partitura_8F90:
	defb 0feh,004h,0d0h,0e9h,005h,0f8h,005h,063h,063h,067h,063h,063h,067h,0f8h,014h,0a7h	; 8f90  .......ccgccg...
	defb 0a7h,0a3h,0a3h,0a7h,0a7h,0a7h,0a3h,0a3h,0a7h,0a7h,0a3h,0a3h,0a7h,0a3h,0a3h,0feh	; 8fa0  ................
	defb 001h,0f8h,013h,0d2h,0eah,006h,051h,0eah,002h,050h,0eah,006h,070h,051h,0eah,002h	; 8fb0  ......Q..P..pQ..
	defb 050h,0eah,006h,070h,051h,0eah,002h,051h,0eah,006h,071h,0eah,002h,071h,0eah,006h	; 8fc0  P..pQ..Q..q..q..
	defb 09bh,0eah,002h,093h,0fdh,090h,08fh	; 8fd0

; ----------------------------------------------------------------------
; DATOS partitura_8FD7: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3A (tools/partituras.py); lo leen p06:B51E (241 bytes)
;   0x8fd7..0x90c8  (241 bytes)
DATA_partitura_8FD7:
	defb 0feh,004h,0d0h,0e9h,005h,0f8h,014h,0a3h,0a3h,0a7h,0a3h,0a3h,0a7h,0feh,001h,0f8h	; 8fd7  ................
	defb 013h,0eah,007h,0d2h,051h,0eah,002h,051h,0eah,007h,051h,0eah,002h,051h,0eah,007h	; 8fe7  ....Q..Q..Q..Q..
	defb 050h,0eah,002h,050h,0eah,007h,090h,0eah,002h,090h,0d1h,0eah,007h,020h,0eah,002h	; 8ff7  P..P......... ..
	defb 020h,0eah,007h,000h,0eah,002h,000h,0eah,007h,000h,0eah,002h,000h,0d2h,0eah,007h	; 9007   ...............
	defb 0a1h,0eah,002h,0a1h,0eah,007h,090h,0eah,002h,090h,0eah,007h,0a5h,0eah,002h,0a1h	; 9017  ................
	defb 0eah,007h,041h,0eah,002h,041h,0eah,007h,041h,0eah,002h,041h,0eah,007h,040h,0eah	; 9027  ..A..A..A..A..@.
	defb 002h,040h,0eah,007h,070h,0eah,002h,070h,0d1h,0eah,007h,000h,0eah,002h,000h,0d2h	; 9037  .@..p..p........
	defb 0eah,007h,0a0h,0eah,002h,0a0h,0eah,007h,0a0h,0eah,002h,0a0h,0eah,007h,091h,0eah	; 9047  ................
	defb 002h,091h,0eah,007h,070h,0eah,002h,070h,0eah,007h,095h,0eah,002h,091h,0eah,007h	; 9057  ....p..p........
	defb 0d2h,051h,0eah,002h,051h,0eah,007h,091h,0eah,002h,091h,0d1h,0eah,007h,000h,0eah	; 9067  .Q..Q...........
	defb 002h,000h,0eah,007h,000h,0eah,002h,000h,0eah,007h,001h,0eah,002h,001h,0d2h,0eah	; 9077  ................
	defb 007h,0a1h,0eah,002h,0a1h,0d1h,0eah,007h,021h,0eah,002h,021h,0eah,007h,050h,0eah	; 9087  ........!..!..P.
	defb 002h,050h,0eah,007h,050h,0eah,002h,050h,0eah,007h,051h,0eah,002h,051h,0eah,007h	; 9097  .P..P..P..Q..Q..
	defb 001h,0eah,002h,000h,0eah,007h,020h,001h,0eah,002h,000h,0eah,007h,020h,001h,0eah	; 90a7  ...... ...... ..
	defb 002h,001h,0eah,007h,041h,0eah,002h,041h,0eah,007h,05bh,0eah,002h,053h,0fdh,0d7h	; 90b7  ....A..A..[..S..
	defb 08fh	; 90c7

; ----------------------------------------------------------------------
; DATOS partitura_90C8: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x36, 0x38, 0x39, 0x3A (tools/partituras.py); lo leen p06:B51E (310 bytes)
;   0x90c8..0x91fe  (310 bytes)
DATA_partitura_90C8:
	defb 0feh,001h,0e9h,005h,0cfh,0cfh,0eah,006h,0d2h,001h,0eah,002h,001h,0eah,006h,001h	; 90c8  ................
	defb 0eah,002h,001h,0eah,006h,000h,0eah,002h,000h,0eah,006h,050h,0eah,002h,050h,0eah	; 90d8  ...........P..P.
	defb 006h,0a0h,0eah,002h,0a0h,0eah,006h,090h,0eah,002h,090h,0eah,006h,090h,0eah,002h	; 90e8  ................
	defb 090h,0eah,006h,071h,0eah,002h,071h,0eah,006h,050h,0eah,002h,050h,0eah,006h,075h	; 90f8  ...q..q..P..P..u
	defb 0eah,002h,071h,0eah,006h,001h,0eah,002h,001h,0eah,006h,001h,0eah,002h,001h,0eah	; 9108  ..q.............
	defb 006h,000h,0eah,002h,000h,0eah,006h,040h,0eah,002h,040h,0eah,006h,090h,0eah,002h	; 9118  .......@..@.....
	defb 090h,0eah,006h,070h,0eah,002h,070h,0eah,006h,070h,0eah,002h,070h,0eah,006h,051h	; 9128  ...p..p..p..p..Q
	defb 0eah,002h,051h,0eah,006h,040h,0eah,002h,040h,0eah,006h,055h,0eah,002h,051h,0eah	; 9138  ..Q..@..@..U..Q.
	defb 006h,0d2h,001h,0eah,002h,001h,0eah,006h,051h,0eah,002h,051h,0eah,006h,090h,0eah	; 9148  ........Q..Q....
	defb 002h,090h,0eah,006h,090h,0eah,002h,090h,0eah,006h,091h,0eah,002h,091h,0eah,006h	; 9158  ................
	defb 071h,0eah,002h,071h,0eah,006h,0a1h,0eah,002h,0a1h,0d1h,0eah,006h,020h,0eah,002h	; 9168  q..q......... ..
	defb 020h,0eah,006h,020h,0eah,002h,020h,0eah,006h,021h,0eah,002h,021h,0d2h,0eah,006h	; 9178   .. .. ..!..!...
	defb 091h,0eah,002h,090h,0eah,006h,0a0h,091h,0eah,002h,090h,0eah,006h,0a0h,091h,0eah	; 9188  ................
	defb 002h,091h,0d1h,0eah,006h,001h,0eah,002h,001h,0eah,006h,00bh,0eah,002h,003h,0fdh	; 9198  ................
	defb 0c8h,090h,053h,053h,057h,053h,053h,057h,053h,053h,053h,053h,053h,053h,057h,0fah	; 91a8  ..SSWSSWSSSSSSW.
	defb 063h,063h,067h,063h,063h,067h,063h,063h,063h,063h,063h,063h,067h,0fah,073h,073h	; 91b8  ccgccgccccccg.ss
	defb 077h,073h,073h,077h,073h,073h,073h,073h,073h,073h,077h,0fah,083h,083h,087h,083h	; 91c8  wsswssssssw.....
	defb 083h,087h,083h,083h,083h,083h,083h,083h,087h,0fah,093h,093h,097h,093h,093h,097h	; 91d8  ................
	defb 093h,093h,093h,093h,093h,093h,097h,0fah,0a3h,0a3h,0a7h,0a3h,0a3h,0a7h,0a3h,0a3h	; 91e8  ................
	defb 0a3h,0a3h,0a3h,0a3h,0a7h,0fah	; 91f8

; ----------------------------------------------------------------------
; DATOS partitura_91FE: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3D (tools/partituras.py); lo leen p06:B51E (30 bytes)
;   0x91fe..0x921c  (30 bytes)
DATA_partitura_91FE:
	defb 0feh,004h,0d1h,0e9h,004h,0bfh,0feh,001h,0c7h,0feh,004h,0b3h,0b3h,0fbh,002h,003h	; 91fe  ................
	defb 092h,0bbh,0b3h,0bbh,0b3h,0b7h,0b7h,0b1h,0fbh,00ch,015h,092h,0bfh,0ffh	; 920e  ..............

; ----------------------------------------------------------------------
; DATOS partitura_921C: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3D (tools/partituras.py); lo leen p06:B51E (31 bytes)
;   0x921c..0x923b  (31 bytes)
DATA_partitura_921C:
	defb 0feh,001h,0e9h,004h,0eah,00dh,0ebh,017h,0f5h,0d4h,00fh,0c7h,003h,003h,0fbh,002h	; 921c  ................
	defb 026h,092h,00bh,003h,00bh,003h,007h,007h,001h,0fbh,00ch,034h,092h,00fh,0ffh	; 922c  &..........4...

; ----------------------------------------------------------------------
; DATOS partitura_923B: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3D (tools/partituras.py); lo leen p06:B51E (32 bytes)
;   0x923b..0x925b  (32 bytes)
DATA_partitura_923B:
	defb 0feh,004h,0d0h,0f8h,028h,0e9h,004h,05fh,0feh,001h,0c7h,0feh,004h,053h,053h,0fbh	; 923b  ....(.._.....SS.
	defb 002h,042h,092h,05bh,053h,05bh,053h,057h,057h,051h,0fbh,00ch,054h,092h,05fh,0ffh	; 924b  .B.[S[SWWQ..T._.

; ----------------------------------------------------------------------
; DATOS partitura_925B: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3D (tools/partituras.py); lo leen p06:B51E (65 bytes)
;   0x925b..0x929c  (65 bytes)
DATA_partitura_925B:
	defb 0feh,004h,0d0h,0f8h,014h,0e9h,004h,0afh,0feh,001h,0c7h,0feh,004h,0d0h,0a3h,0a3h	; 925b  ................
	defb 0fbh,002h,062h,092h,0abh,0a3h,0abh,0a3h,0feh,001h,0f8h,013h,0eah,008h,0d1h,040h	; 926b  ..b............@
	defb 0eah,004h,041h,0eah,005h,020h,0eah,008h,041h,0eah,004h,041h,0fbh,002h,077h,092h	; 927b  ..A.. ..A..A..w.
	defb 0eah,008h,040h,0eah,004h,041h,0eah,005h,020h,0eah,008h,04fh,0eah,002h,043h,0cfh	; 928b  ..@..A.. ..O..C.
	defb 0ffh	; 929b

; ----------------------------------------------------------------------
; DATOS partitura_929C: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3D (tools/partituras.py); lo leen p06:B51E (119 bytes)
;   0x929c..0x9313  (119 bytes)
DATA_partitura_929C:
	defb 0feh,001h,0f8h,013h,0e9h,004h,0eah,007h,0d1h,001h,0eah,004h,001h,0d2h,0eah,007h	; 929c  ................
	defb 0a1h,0eah,004h,0a1h,0eah,007h,071h,0eah,004h,071h,0eah,007h,070h,0eah,004h,071h	; 92ac  ......q..q..p..q
	defb 0eah,007h,0a0h,0d1h,000h,0eah,004h,001h,0d2h,0eah,007h,0a0h,0d1h,009h,0eah,004h	; 92bc  ................
	defb 001h,0fbh,002h,0a2h,092h,0eah,008h,0d1h,001h,0eah,004h,001h,0d2h,0eah,008h,0a1h	; 92cc  ................
	defb 0eah,004h,0a1h,0eah,008h,075h,0eah,004h,071h,0fbh,002h,0d1h,092h,0eah,008h,0d1h	; 92dc  .....u..q.......
	defb 000h,0eah,004h,001h,0d2h,0eah,005h,0a0h,0d1h,0eah,009h,001h,0eah,004h,001h,0fbh	; 92ec  ................
	defb 002h,0e9h,092h,0eah,008h,0d1h,000h,0eah,004h,001h,0d2h,0eah,005h,0a0h,0d1h,0eah	; 92fc  ................
	defb 008h,00fh,0eah,002h,003h,0cfh,0ffh	; 930c

; ----------------------------------------------------------------------
; DATOS partitura_9313: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3D (tools/partituras.py); lo leen p06:B51E (106 bytes)
;   0x9313..0x937d  (106 bytes)
DATA_partitura_9313:
	defb 0feh,001h,0e9h,004h,0eah,008h,0d2h,071h,0eah,002h,071h,0eah,007h,051h,0eah,003h	; 9313  .......q..q..Q..
	defb 051h,0eah,007h,021h,0eah,003h,021h,0eah,007h,020h,0eah,003h,021h,0eah,007h,050h	; 9323  Q..!..!.. ..!..P
	defb 070h,0eah,003h,071h,0eah,007h,050h,079h,0eah,003h,071h,0fbh,002h,017h,093h,0eah	; 9333  p..q..Py..q.....
	defb 007h,0d2h,071h,0eah,003h,071h,0eah,007h,051h,0eah,003h,051h,0eah,007h,025h,0eah	; 9343  ..q..q..Q..Q..%.
	defb 003h,021h,0fbh,002h,042h,093h,0eah,008h,070h,0eah,004h,071h,0eah,005h,050h,0eah	; 9353  .!..B...p..q..P.
	defb 008h,071h,0eah,004h,071h,0fbh,002h,059h,093h,0eah,008h,070h,0eah,004h,071h,0eah	; 9363  .q..q..Y...p..q.
	defb 005h,050h,0eah,008h,07fh,0eah,002h,073h,0cfh,0ffh	; 9373  .P.....s..

; ----------------------------------------------------------------------
; DATOS partitura_937D: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3E (tools/partituras.py); lo leen p06:B51E (20 bytes)
;   0x937d..0x9391  (20 bytes)
DATA_partitura_937D:
	defb 0feh,004h,0d1h,0e9h,004h,0b7h,0b3h,0b3h,0fbh,003h,082h,093h,0b7h,0b1h,0fbh,00bh	; 937d  ................
	defb 08ah,093h,0bfh,0ffh	; 938d

; ----------------------------------------------------------------------
; DATOS partitura_9391: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3E (tools/partituras.py); lo leen p06:B51E (33 bytes)
;   0x9391..0x93b2  (33 bytes)
DATA_partitura_9391:
	defb 0feh,001h,0e9h,004h,0eah,00dh,0ebh,017h,0f5h,0d5h,0a7h,0a3h,0a3h,0d4h,027h,0d5h	; 9391  ..............'.
	defb 053h,053h,0a7h,0a3h,0a3h,0d4h,027h,0d5h,0a1h,0fbh,00bh,0a9h,093h,0eah,007h,0afh	; 93a1  SS....'.........
	defb 0ffh	; 93b1

; ----------------------------------------------------------------------
; DATOS partitura_93B2: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3E (tools/partituras.py); lo leen p06:B51E (22 bytes)
;   0x93b2..0x93c8  (22 bytes)
DATA_partitura_93B2:
	defb 0feh,004h,0d0h,0f8h,028h,0e9h,004h,057h,053h,053h,0fbh,003h,0b9h,093h,057h,051h	; 93b2  ....(..WSS....WQ
	defb 0fbh,00bh,0c1h,093h,05fh,0ffh	; 93c2

; ----------------------------------------------------------------------
; DATOS partitura_93C8: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3E (tools/partituras.py); lo leen p06:B51E (64 bytes)
;   0x93c8..0x9408  (64 bytes)
DATA_partitura_93C8:
	defb 0feh,004h,0d0h,0f8h,014h,0e9h,004h,0a7h,0a3h,0a3h,0fbh,003h,0cfh,093h,0feh,001h	; 93c8  ................
	defb 0f8h,013h,0f2h,004h,0f1h,043h,0e9h,003h,0d1h,0eah,004h,051h,0eah,003h,050h,040h	; 93d8  .....C.....Q..P@
	defb 0eah,001h,040h,0eah,004h,051h,0eah,003h,050h,040h,0eah,001h,040h,0eah,004h,052h	; 93e8  ..@..Q..P@..@..R
	defb 0eah,003h,051h,0e9h,005h,0eah,004h,0afh,0eah,002h,0a3h,0feh,002h,0e0h,027h,0ffh	; 93f8  ..Q...........'.

; ----------------------------------------------------------------------
; DATOS partitura_9408: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3E (tools/partituras.py); lo leen p06:B51E (191 bytes)
;   0x9408..0x94c7  (191 bytes)
DATA_partitura_9408:
	defb 0feh,001h,0f8h,013h,0f2h,004h,0f1h,041h,0e9h,001h,0eah,008h,0d2h,0a7h,0eah,004h	; 9408  .......A........
	defb 0a2h,0eah,008h,0a2h,0eah,004h,0a2h,0eah,008h,057h,0eah,004h,052h,0eah,008h,052h	; 9418  .........W..R..R
	defb 0eah,004h,052h,0eah,008h,0a5h,0eah,004h,0a2h,0eah,008h,0a2h,0eah,004h,0a2h,0eah	; 9428  ..R.............
	defb 008h,0a9h,0eah,004h,0a5h,0d1h,0eah,008h,025h,0eah,004h,022h,0eah,008h,002h,0eah	; 9438  ........%.."....
	defb 004h,002h,0eah,008h,025h,0eah,004h,022h,0eah,008h,002h,0eah,004h,002h,0d2h,0eah	; 9448  ....%.."........
	defb 008h,057h,0eah,004h,052h,0eah,008h,052h,0eah,004h,052h,0eah,008h,0a9h,0eah,004h	; 9458  .W..R..R..R.....
	defb 0a3h,0eah,008h,0d2h,0a7h,0eah,004h,0a2h,0eah,008h,0a2h,0eah,004h,0a2h,0eah,008h	; 9468  ................
	defb 057h,0eah,004h,052h,0eah,008h,052h,0eah,004h,052h,0eah,008h,0a5h,0eah,004h,0a2h	; 9478  W..R..R..R......
	defb 0eah,008h,0a2h,0eah,004h,0a2h,0eah,008h,0a9h,0eah,004h,0a5h,0d1h,0eah,008h,025h	; 9488  ...............%
	defb 0eah,004h,022h,0eah,008h,002h,0eah,004h,002h,0eah,008h,025h,0eah,004h,022h,0eah	; 9498  .."........%..".
	defb 008h,002h,0eah,004h,002h,0d2h,0eah,008h,057h,0eah,004h,052h,0eah,008h,052h,0eah	; 94a8  ........W..R..R.
	defb 004h,052h,0e9h,005h,0eah,008h,0afh,0eah,003h,0a3h,0feh,002h,0e0h,026h,0ffh	; 94b8  .R...........&.

; ----------------------------------------------------------------------
; DATOS partitura_94C7: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3E (tools/partituras.py); lo leen p06:B51E (187 bytes)
;   0x94c7..0x9582  (187 bytes)
DATA_partitura_94C7:
	defb 0feh,001h,0f8h,013h,0f2h,004h,0f1h,041h,0e9h,001h,0eah,007h,0d2h,057h,0eah,004h	; 94c7  .......A.....W..
	defb 052h,0eah,007h,052h,0eah,004h,052h,0eah,007h,027h,0eah,004h,022h,0eah,007h,022h	; 94d7  R..R..R..'..".."
	defb 0eah,004h,022h,0eah,007h,055h,0eah,004h,052h,0eah,007h,052h,0eah,004h,052h,0eah	; 94e7  .."..U..R..R..R.
	defb 007h,059h,0eah,004h,055h,0eah,007h,0a5h,0eah,004h,0a2h,0eah,007h,092h,0eah,004h	; 94f7  .Y..U...........
	defb 092h,0eah,007h,0a5h,0eah,004h,0a2h,0eah,007h,092h,0eah,004h,092h,0eah,007h,027h	; 9507  ...............'
	defb 0eah,004h,022h,0eah,007h,022h,0eah,004h,022h,0eah,007h,059h,0eah,004h,053h,0eah	; 9517  .."..".."..Y..S.
	defb 007h,0d2h,057h,0eah,004h,052h,0eah,007h,052h,0eah,004h,052h,0eah,007h,027h,0eah	; 9527  ..W..R..R..R..'.
	defb 004h,022h,0eah,007h,022h,0eah,004h,022h,0eah,007h,055h,0eah,004h,052h,0eah,007h	; 9537  ."..".."..U..R..
	defb 052h,0eah,004h,052h,0eah,007h,059h,0eah,004h,055h,0eah,007h,0a5h,0eah,004h,0a2h	; 9547  R..R..Y..U......
	defb 0eah,007h,092h,0eah,004h,092h,0eah,007h,0a5h,0eah,004h,0a2h,0eah,007h,092h,0eah	; 9557  ................
	defb 004h,092h,0eah,007h,027h,0eah,004h,022h,0eah,007h,022h,0eah,004h,022h,0e9h,005h	; 9567  ....'.."..".."..
	defb 0eah,007h,05fh,0eah,002h,053h,0feh,002h,0e0h,026h,0ffh	; 9577  .._..S...&.

; ----------------------------------------------------------------------
; DATOS partitura_9582: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3F (tools/partituras.py); lo leen p06:B51E (182 bytes)
;   0x9582..0x9638  (182 bytes)
DATA_partitura_9582:
	defb 0feh,002h,0f9h,088h,097h,0e9h,006h,0eah,00dh,0d1h,003h,0eah,007h,001h,0e9h,003h	; 9582  ................
	defb 0eah,00dh,000h,0eah,007h,000h,0eah,00dh,000h,0eah,006h,000h,0fbh,002h,087h,095h	; 9592  ................
	defb 0e9h,003h,0eah,00fh,000h,0eah,004h,000h,0eah,009h,000h,0eah,002h,000h,0d2h,0eah	; 95a2  ................
	defb 00dh,090h,0eah,004h,090h,0eah,009h,090h,0eah,002h,090h,0eah,00dh,050h,0eah,004h	; 95b2  .............P..
	defb 050h,0eah,009h,050h,0eah,002h,050h,0eah,00dh,090h,0eah,004h,090h,0eah,009h,090h	; 95c2  P..P..P.........
	defb 0eah,002h,090h,0d1h,0eah,00dh,000h,0eah,004h,000h,0eah,009h,000h,0eah,002h,000h	; 95d2  ................
	defb 0d2h,0eah,00dh,090h,0eah,004h,090h,0eah,009h,090h,0eah,002h,090h,0d1h,0eah,00dh	; 95e2  ................
	defb 000h,0eah,004h,000h,0eah,009h,000h,0eah,002h,000h,0eah,00dh,050h,0eah,004h,050h	; 95f2  ............P..P
	defb 0eah,009h,050h,0eah,002h,050h,0fbh,002h,0a4h,095h,0eah,00dh,0d1h,000h,0eah,004h	; 9602  ..P..P..........
	defb 000h,0eah,007h,000h,0eah,003h,000h,0eah,00dh,000h,0eah,005h,000h,0eah,00dh,000h	; 9612  ................
	defb 0eah,005h,000h,0fbh,004h,00ch,096h,0e9h,006h,0eah,00dh,00bh,0eah,003h,003h,0feh	; 9622  ................
	defb 002h,0e0h,080h,0e0h,0b8h,0ffh	; 9632

; ----------------------------------------------------------------------
; DATOS partitura_9638: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3F (tools/partituras.py); lo leen p06:B51E (180 bytes)
;   0x9638..0x96ec  (180 bytes)
DATA_partitura_9638:
	defb 0feh,002h,0f9h,088h,097h,0e9h,006h,0eah,009h,0d2h,093h,0eah,005h,091h,0e9h,003h	; 9638  ................
	defb 0eah,009h,090h,0eah,005h,090h,0eah,009h,090h,0eah,005h,090h,0fbh,002h,03dh,096h	; 9648  ..............=.
	defb 0e9h,003h,0d2h,0eah,00ch,090h,0eah,003h,090h,0eah,007h,090h,0eah,002h,090h,0eah	; 9658  ................
	defb 009h,050h,0eah,003h,050h,0eah,007h,050h,0eah,002h,050h,0eah,009h,000h,0eah,003h	; 9668  .P..P..P..P.....
	defb 000h,0eah,007h,000h,0eah,002h,000h,0eah,009h,050h,0eah,003h,050h,0eah,007h,050h	; 9678  .........P..P..P
	defb 0eah,002h,050h,0eah,009h,090h,0eah,003h,090h,0eah,007h,090h,0eah,002h,090h,0eah	; 9688  ..P.............
	defb 009h,050h,0eah,003h,050h,0eah,007h,050h,0eah,002h,050h,0eah,009h,090h,0eah,003h	; 9698  .P..P..P..P.....
	defb 090h,0eah,007h,090h,0eah,002h,090h,0d1h,0eah,009h,000h,0eah,003h,000h,0eah,007h	; 96a8  ................
	defb 000h,0eah,002h,000h,0fbh,002h,05ah,096h,0eah,008h,0d2h,090h,0eah,001h,090h,0eah	; 96b8  ......Z.........
	defb 004h,090h,0eah,001h,090h,0eah,008h,090h,0eah,002h,090h,0eah,008h,090h,0eah,002h	; 96c8  ................
	defb 090h,0fbh,004h,0c0h,096h,0e9h,006h,0eah,008h,09bh,0eah,002h,093h,0feh,002h,0e0h	; 96d8  ................
	defb 080h,0e0h,0b8h,0ffh	; 96e8

; ----------------------------------------------------------------------
; DATOS partitura_96EC: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3F (tools/partituras.py); lo leen p06:B51E (167 bytes)
;   0x96ec..0x9793  (167 bytes)
DATA_partitura_96EC:
	defb 0feh,002h,0f9h,088h,097h,0eeh,001h,0e9h,006h,0c2h,0e9h,006h,0eah,005h,0d1h,003h	; 96ec  ................
	defb 0eah,002h,001h,0e9h,003h,0eah,005h,000h,0eah,002h,000h,0eah,005h,000h,0eah,002h	; 96fc  ................
	defb 000h,0fbh,002h,0f6h,096h,0e9h,003h,0eah,005h,000h,0eah,002h,000h,000h,000h,0d2h	; 970c  ................
	defb 0eah,005h,090h,0eah,002h,090h,090h,090h,0eah,005h,050h,0eah,002h,050h,050h,050h	; 971c  ..........P..PPP
	defb 0eah,005h,090h,0eah,002h,090h,090h,090h,0d1h,0eah,005h,000h,0eah,002h,000h,000h	; 972c  ................
	defb 000h,0d2h,0eah,005h,090h,0eah,002h,090h,0eah,005h,090h,0eah,002h,090h,0d1h,0eah	; 973c  ................
	defb 005h,000h,0eah,002h,000h,000h,000h,0eah,005h,050h,0eah,002h,050h,050h,050h,0fbh	; 974c  .........P..PPP.
	defb 002h,013h,097h,0eah,006h,0d1h,000h,0eah,002h,000h,0eah,004h,000h,0eah,002h,000h	; 975c  ................
	defb 0eah,006h,000h,0eah,002h,000h,0eah,006h,000h,0eah,002h,000h,0fbh,004h,05fh,097h	; 976c  .............._.
	defb 0e9h,006h,0eah,006h,00ah,0feh,002h,0e0h,080h,0e0h,0c4h,0ffh,0e0h,030h,0feh,001h	; 977c  .............0..
	defb 0f8h,00dh,0f2h,00bh,0f1h,041h,0fah	; 978c

; ----------------------------------------------------------------------
; DATOS partitura_9793: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x40 (tools/partituras.py); lo leen p06:B51E (49 bytes)
;   0x9793..0x97c4  (49 bytes)
DATA_partitura_9793:
	defb 0feh,002h,0f9h,089h,098h,0eah,007h,0d1h,041h,0eah,004h,041h,0eah,007h,000h,0eah	; 9793  ........A..A....
	defb 004h,000h,0eah,007h,000h,0eah,004h,000h,0eah,007h,011h,0eah,004h,011h,0eah,007h	; 97a3  ................
	defb 001h,0eah,004h,005h,0eah,007h,021h,0eah,004h,021h,0eah,007h,042h,0eah,004h,043h	; 97b3  ......!..!..B..C
	defb 0ffh	; 97c3

; ----------------------------------------------------------------------
; DATOS partitura_97C4: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x40 (tools/partituras.py); lo leen p06:B51E (18 bytes)
;   0x97c4..0x97d6  (18 bytes)
DATA_partitura_97C4:
	defb 0feh,002h,0f9h,089h,098h,0eah,00dh,0ebh,017h,0f5h,0d4h,00fh,0c3h,0d5h,073h,0d4h	; 97c4  ..............s.
	defb 005h,0ffh	; 97d4

; ----------------------------------------------------------------------
; DATOS partitura_97D6: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x40 (tools/partituras.py); lo leen p06:B51E (20 bytes)
;   0x97d6..0x97ea  (20 bytes)
DATA_partitura_97D6:
	defb 0feh,002h,0f9h,089h,098h,0feh,004h,0d0h,0f8h,028h,05fh,0feh,001h,0c3h,0feh,004h	; 97d6  .........(_.....
	defb 0d0h,053h,05fh,0ffh	; 97e6

; ----------------------------------------------------------------------
; DATOS partitura_97EA: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x40 (tools/partituras.py); lo leen p06:B51E (57 bytes)
;   0x97ea..0x9823  (57 bytes)
DATA_partitura_97EA:
	defb 0feh,002h,0f9h,089h,098h,0f8h,013h,0f2h,004h,0f1h,041h,0eah,005h,0d0h,001h,0eah	; 97ea  ..........A.....
	defb 002h,001h,0d1h,0eah,005h,070h,0eah,002h,070h,0eah,005h,070h,0eah,002h,070h,0eah	; 97fa  .....p..p..p..p.
	defb 005h,081h,0eah,002h,081h,0eah,005h,071h,0eah,001h,075h,0eah,005h,0b1h,0eah,002h	; 980a  .......q..u.....
	defb 0b1h,0d0h,0eah,005h,002h,0eah,002h,003h,0ffh	; 981a  .........

; ----------------------------------------------------------------------
; DATOS partitura_9823: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x40 (tools/partituras.py); lo leen p06:B51E (53 bytes)
;   0x9823..0x9858  (53 bytes)
DATA_partitura_9823:
	defb 0feh,002h,0f9h,089h,098h,0f8h,013h,0eah,009h,0d1h,001h,0eah,004h,001h,0d2h,0eah	; 9823  ................
	defb 009h,070h,0eah,004h,070h,0eah,009h,070h,0eah,004h,070h,0eah,009h,081h,0eah,004h	; 9833  .p..p..p..p.....
	defb 081h,0eah,009h,071h,0eah,003h,075h,0eah,009h,0b1h,0eah,004h,0b1h,0d1h,0eah,009h	; 9843  ...q..u.........
	defb 002h,0eah,002h,003h,0ffh	; 9853

; ----------------------------------------------------------------------
; DATOS partitura_9858: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x40 (tools/partituras.py); lo leen p06:B51E (56 bytes)
;   0x9858..0x9890  (56 bytes)
DATA_partitura_9858:
	defb 0feh,002h,0f9h,089h,098h,0eah,008h,0d2h,071h,0eah,004h,071h,0eah,008h,040h,0eah	; 9858  ........q..q..@.
	defb 004h,040h,0eah,008h,040h,0eah,004h,040h,0eah,008h,051h,0eah,004h,051h,0eah,008h	; 9868  .@..@..@..Q..Q..
	defb 041h,0eah,003h,045h,0eah,008h,071h,0eah,004h,071h,0eah,008h,072h,0eah,002h,073h	; 9878  A..E..q..q..r..s
	defb 0ffh,0e0h,002h,0feh,001h,0e9h,005h,0fah	; 9888  ........

; ----------------------------------------------------------------------
; DATOS partitura_9890: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x41 (tools/partituras.py); lo leen p06:B51E (59 bytes)
;   0x9890..0x98cb  (59 bytes)
DATA_partitura_9890:
	defb 0feh,002h,0e0h,020h,0feh,001h,0e9h,007h,0ebh,017h,0f5h,0eah,00ch,0d3h,041h,040h	; 9890  ... ..........A@
	defb 032h,012h,0d4h,0b2h,0b0h,0a0h,0b0h,0d3h,000h,010h,020h,040h,0c1h,0ech,0eah,00bh	; 98a0  2......... @....
	defb 0d3h,040h,0eah,009h,040h,0eah,008h,040h,0eah,007h,040h,0eah,006h,040h,0eah,005h	; 98b0  .@..@..@..@..@..
	defb 040h,0eah,004h,040h,0eah,003h,040h,0eah,002h,040h,0ffh	; 98c0  @..@..@..@.

; ----------------------------------------------------------------------
; DATOS partitura_98CB: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x41 (tools/partituras.py); lo leen p06:B51E (59 bytes)
;   0x98cb..0x9906  (59 bytes)
DATA_partitura_98CB:
	defb 0feh,002h,0e0h,020h,0feh,001h,0e9h,007h,0ebh,017h,0f5h,0eah,00ch,0d4h,041h,040h	; 98cb  ... ..........A@
	defb 032h,012h,0d5h,0b2h,0b0h,0a0h,0b0h,0d4h,000h,010h,020h,040h,0c1h,0ech,0eah,00bh	; 98db  2......... @....
	defb 0d4h,040h,0eah,009h,040h,0eah,008h,040h,0eah,007h,040h,0eah,006h,040h,0eah,005h	; 98eb  .@..@..@..@..@..
	defb 040h,0eah,004h,040h,0eah,003h,040h,0eah,002h,040h,0ffh	; 98fb  @..@..@..@.

; ----------------------------------------------------------------------
; DATOS partitura_9906: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x41 (tools/partituras.py); lo leen p06:B51E (130 bytes)
;   0x9906..0x9988  (130 bytes)
DATA_partitura_9906:
	defb 0feh,002h,0e0h,020h,0feh,001h,0e9h,001h,0f8h,013h,0eah,007h,0d3h,071h,084h,0e9h	; 9906  ... .........q..
	defb 007h,0eah,002h,080h,0e9h,001h,0eah,007h,083h,0eah,002h,082h,0e9h,007h,0eah,007h	; 9916  ................
	defb 080h,0eah,002h,081h,0eah,007h,0b0h,0eah,002h,0b0h,0eah,007h,0e9h,001h,093h,0eah	; 9926  ................
	defb 002h,092h,0e9h,007h,0eah,007h,080h,0eah,002h,080h,0e9h,001h,0eah,007h,063h,0eah	; 9936  ..............c.
	defb 002h,082h,0eah,007h,043h,0eah,002h,042h,0eah,007h,033h,0eah,002h,032h,0eah,007h	; 9946  ....C..B..3..2..
	defb 043h,0eah,002h,042h,0eah,007h,053h,0eah,002h,052h,0eah,007h,063h,0eah,002h,062h	; 9956  C..B..S..R..c..b
	defb 0eah,007h,073h,0eah,002h,072h,0eah,007h,083h,0eah,002h,082h,0e9h,007h,0eah,003h	; 9966  ..s..r..........
	defb 081h,0eah,007h,0d3h,040h,0eah,004h,040h,0eah,003h,040h,0eah,002h,040h,0eah,001h	; 9976  ....@..@..@..@..
	defb 041h,0ffh	; 9986

; ----------------------------------------------------------------------
; DATOS partitura_9988: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x41 (tools/partituras.py); lo leen p06:B51E (18 bytes)
;   0x9988..0x999a  (18 bytes)
DATA_partitura_9988:
	defb 0feh,002h,0e0h,020h,0feh,004h,0e9h,007h,0f8h,028h,0d0h,055h,055h,052h,052h,052h	; 9988  ... .....(.UURRR
	defb 05bh,0ffh	; 9998

; ----------------------------------------------------------------------
; DATOS partitura_999A: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x41 (tools/partituras.py); lo leen p06:B51E (149 bytes)
;   0x999a..0x9a2f  (149 bytes)
DATA_partitura_999A:
	defb 0feh,002h,0e0h,020h,0feh,001h,0e9h,001h,0f8h,013h,0eah,00ah,0d2h,031h,044h,0e9h	; 999a  ... .........1D.
	defb 007h,0eah,003h,040h,0eah,00ah,0e9h,001h,043h,0eah,003h,042h,0eah,00ah,0e9h,007h	; 99aa  ...@....C..B....
	defb 040h,0eah,003h,041h,0eah,00ah,080h,0eah,003h,080h,0e9h,001h,0eah,00ah,063h,0eah	; 99ba  @..A..........c.
	defb 003h,062h,0e9h,007h,0eah,00ah,040h,0eah,003h,040h,0e9h,001h,0eah,00ah,033h,0eah	; 99ca  .b....@..@....3.
	defb 003h,032h,0eah,00ah,0d3h,0b3h,0eah,003h,0b2h,0eah,00ah,0a3h,0eah,003h,0a2h,0eah	; 99da  .2..............
	defb 00ah,0b3h,0eah,003h,0b2h,0eah,00ah,0d2h,003h,0eah,003h,002h,0eah,00ah,013h,0eah	; 99ea  ................
	defb 003h,012h,0eah,00ah,023h,0eah,003h,022h,0eah,00ah,043h,0eah,003h,042h,0e9h,007h	; 99fa  ....#.."..C..B..
	defb 0eah,002h,041h,0eah,009h,0d2h,0e9h,001h,000h,010h,020h,030h,0e9h,007h,040h,0eah	; 9a0a  ..A....... 0..@.
	defb 005h,040h,0eah,004h,040h,0eah,003h,040h,0eah,002h,040h,0eah,001h,040h,0eah,000h	; 9a1a  .@..@..@..@..@..
	defb 042h,0e9h,001h,0c2h,0ffh	; 9a2a

; ----------------------------------------------------------------------
; DATOS partitura_9A2F: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x41 (tools/partituras.py); lo leen p06:B51E (142 bytes)
;   0x9a2f..0x9abd  (142 bytes)
DATA_partitura_9A2F:
	defb 0feh,002h,0e0h,020h,0feh,001h,0e9h,001h,0eah,007h,0d1h,031h,044h,0eeh,001h,0e9h	; 9a2f  ... .......1D...
	defb 007h,0eah,002h,040h,0eah,007h,0e9h,001h,043h,0eah,002h,042h,0eah,007h,0e9h,007h	; 9a3f  ...@....C..B....
	defb 040h,0eah,002h,041h,0eah,007h,080h,0eah,002h,080h,0e9h,001h,0eah,007h,063h,0eah	; 9a4f  @..A..........c.
	defb 002h,062h,0e9h,007h,0eah,007h,040h,0eah,002h,040h,0e9h,001h,0eah,007h,033h,0eah	; 9a5f  .b....@..@....3.
	defb 002h,032h,0eah,007h,0d2h,0b3h,0eah,002h,0b2h,0eah,007h,0a3h,0eah,002h,0a2h,0eah	; 9a6f  .2..............
	defb 007h,0b3h,0eah,002h,0b2h,0eah,007h,0d1h,003h,0eah,002h,002h,0eah,007h,013h,0eah	; 9a7f  ................
	defb 002h,012h,0eah,007h,023h,0eah,002h,022h,0eah,007h,043h,0eah,002h,042h,0e9h,007h	; 9a8f  ....#.."..C..B..
	defb 0eah,001h,041h,0efh,0d0h,0eah,003h,0e9h,001h,000h,010h,020h,030h,0ech,0e9h,007h	; 9a9f  ..A........ 0...
	defb 040h,0eah,003h,040h,0eah,002h,040h,0eah,001h,041h,0e9h,001h,0cfh,0ffh	; 9aaf  @..@..@..A....

; ----------------------------------------------------------------------
; DATOS partitura_9ABD: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x42 (tools/partituras.py); lo leen p06:B51E (29 bytes)
;   0x9abd..0x9ada  (29 bytes)
DATA_partitura_9ABD:
	defb 0feh,002h,0e0h,01eh,0feh,004h,0d1h,0e9h,004h,0b0h,0feh,001h,0e9h,002h,0c0h,0fbh	; 9abd  ................
	defb 014h,0c1h,09ah,0feh,004h,0e9h,006h,0b7h,0feh,002h,0e0h,01ch,0ffh	; 9acd  .............

; ----------------------------------------------------------------------
; DATOS partitura_9ADA: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x42 (tools/partituras.py); lo leen p06:B51E (20 bytes)
;   0x9ada..0x9aee  (20 bytes)
DATA_partitura_9ADA:
	defb 0feh,002h,0e0h,02ah,0feh,004h,0d0h,0e9h,004h,093h,0fbh,007h,0e3h,09ah,09fh,0feh	; 9ada  ...*............
	defb 002h,0e0h,008h,0ffh	; 9aea

; ----------------------------------------------------------------------
; DATOS partitura_9AEE: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x42 (tools/partituras.py); lo leen p06:B51E (18 bytes)
;   0x9aee..0x9b00  (18 bytes)
DATA_partitura_9AEE:
	defb 0feh,002h,0e0h,02ah,0feh,004h,0d0h,0f8h,025h,0e9h,004h,061h,0fbh,00fh,0f9h,09ah	; 9aee  ...*....%..a....
	defb 06fh,0ffh	; 9afe

; ----------------------------------------------------------------------
; DATOS partitura_9B00: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x42 (tools/partituras.py); lo leen p06:B51E (18 bytes)
;   0x9b00..0x9b12  (18 bytes)
DATA_partitura_9B00:
	defb 0feh,002h,0e0h,02ah,0feh,004h,0d0h,0f8h,014h,0e9h,004h,0a1h,0fbh,00fh,00bh,09bh	; 9b00  ...*............
	defb 0afh,0ffh	; 9b10

; ----------------------------------------------------------------------
; DATOS partitura_9B12: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x42 (tools/partituras.py); lo leen p06:B51E (28 bytes)
;   0x9b12..0x9b2e  (28 bytes)
DATA_partitura_9B12:
	defb 0feh,001h,0e9h,006h,0c6h,0f8h,013h,0f2h,00ah,0f1h,054h,0ebh,081h,013h,0c2h,0d2h	; 9b12  ..........T.....
	defb 0eah,002h,079h,0ech,0eah,000h,07fh,0feh,002h,0e0h,00ah,0ffh	; 9b22  ..y.........

; ----------------------------------------------------------------------
; DATOS partitura_9B2E: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x42 (tools/partituras.py); lo leen p06:B51E (26 bytes)
;   0x9b2e..0x9b48  (26 bytes)
DATA_partitura_9B2E:
	defb 0feh,001h,0e9h,006h,0c6h,0f2h,00ah,0f1h,053h,0ebh,081h,013h,0c3h,0d2h,0eah,002h	; 9b2e  ........S.......
	defb 079h,0ech,0eah,000h,07fh,0feh,002h,0e0h,004h,0ffh	; 9b3e  y.........

; ----------------------------------------------------------------------
; DATOS partitura_9B48: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x43 (tools/partituras.py); lo leen p06:B51E (17 bytes)
;   0x9b48..0x9b59  (17 bytes)
DATA_partitura_9B48:
	defb 0feh,002h,0e0h,006h,0feh,004h,0d1h,0e9h,004h,0bfh,0bfh,0bfh,0feh,002h,0e0h,00eh	; 9b48  ................
	defb 0ffh	; 9b58

; ----------------------------------------------------------------------
; DATOS partitura_9B59: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x43 (tools/partituras.py); lo leen p06:B51E (16 bytes)
;   0x9b59..0x9b69  (16 bytes)
DATA_partitura_9B59:
	defb 0feh,002h,0e0h,00ch,0feh,004h,0d0h,0e9h,005h,093h,0fbh,006h,062h,09bh,09fh,0ffh	; 9b59  ............b...

; ----------------------------------------------------------------------
; DATOS partitura_9B69: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x43 (tools/partituras.py); lo leen p06:B51E (18 bytes)
;   0x9b69..0x9b7b  (18 bytes)
DATA_partitura_9B69:
	defb 0feh,002h,0e0h,00ch,0feh,004h,0d0h,0f8h,025h,0e9h,005h,061h,0fbh,00ch,074h,09bh	; 9b69  ........%..a..t.
	defb 06fh,0ffh	; 9b79

; ----------------------------------------------------------------------
; DATOS partitura_9B7B: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x43 (tools/partituras.py); lo leen p06:B51E (18 bytes)
;   0x9b7b..0x9b8d  (18 bytes)
DATA_partitura_9B7B:
	defb 0feh,002h,0e0h,00ch,0feh,004h,0d0h,0f8h,014h,0e9h,005h,0a1h,0fbh,00ch,086h,09bh	; 9b7b  ................
	defb 0afh,0ffh	; 9b8b

; ----------------------------------------------------------------------
; DATOS partitura_9B8D: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x43 (tools/partituras.py); lo leen p06:B51E (28 bytes)
;   0x9b8d..0x9ba9  (28 bytes)
DATA_partitura_9B8D:
	defb 0feh,001h,0e9h,006h,0c1h,0f8h,013h,0f2h,00ah,0f1h,054h,0ebh,081h,013h,0c2h,0d2h	; 9b8d  ..........T.....
	defb 0eah,002h,079h,0ech,0eah,000h,07dh,0feh,002h,0e0h,026h,0ffh	; 9b9d  ..y...}...&.

; ----------------------------------------------------------------------
; DATOS partitura_9BA9: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x43 (tools/partituras.py); lo leen p06:B51E (27 bytes)
;   0x9ba9..0x9bc4  (27 bytes)
DATA_partitura_9BA9:
	defb 0feh,001h,0e9h,006h,0c1h,0f2h,00ah,0f1h,053h,0ebh,081h,013h,0c3h,0d2h,0eah,002h	; 9ba9  ........S.......
	defb 079h,0ech,0eah,000h,07dh,0c2h,0feh,002h,0e0h,00eh,0ffh	; 9bb9  y...}......

; ----------------------------------------------------------------------
; DATOS partitura_9BC4: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x44 (tools/partituras.py); lo leen p06:B51E (20 bytes)
;   0x9bc4..0x9bd8  (20 bytes)
DATA_partitura_9BC4:
	defb 0feh,002h,0e0h,00ch,0feh,004h,0d1h,0e9h,004h,0b1h,0fbh,008h,0cdh,09bh,0b3h,0b7h	; 9bc4  ................
	defb 0b7h,0b7h,0bdh,0ffh	; 9bd4

; ----------------------------------------------------------------------
; DATOS partitura_9BD8: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x44 (tools/partituras.py); lo leen p06:B51E (20 bytes)
;   0x9bd8..0x9bec  (20 bytes)
DATA_partitura_9BD8:
	defb 0feh,002h,0e0h,00ch,0feh,004h,0d0h,0e9h,005h,093h,0fbh,008h,0e1h,09bh,09bh,0feh	; 9bd8  ................
	defb 002h,0e0h,00ch,0ffh	; 9be8

; ----------------------------------------------------------------------
; DATOS partitura_9BEC: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x44 (tools/partituras.py); lo leen p06:B51E (21 bytes)
;   0x9bec..0x9c01  (21 bytes)
DATA_partitura_9BEC:
	defb 0feh,002h,0e0h,00ch,0feh,004h,0d0h,0f8h,028h,0e9h,004h,061h,0fbh,00ch,0f7h,09bh	; 9bec  ........(..a....
	defb 065h,065h,065h,06fh,0ffh	; 9bfc

; ----------------------------------------------------------------------
; DATOS partitura_9C01: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x44 (tools/partituras.py); lo leen p06:B51E (21 bytes)
;   0x9c01..0x9c16  (21 bytes)
DATA_partitura_9C01:
	defb 0feh,002h,0e0h,00ch,0feh,004h,0d0h,0f8h,014h,0e9h,004h,0a1h,0fbh,00ch,00ch,09ch	; 9c01  ................
	defb 0a5h,0a5h,0a5h,0afh,0ffh	; 9c11

; ----------------------------------------------------------------------
; DATOS partitura_9C16: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x44 (tools/partituras.py); lo leen p06:B51E (31 bytes)
;   0x9c16..0x9c35  (31 bytes)
DATA_partitura_9C16:
	defb 0feh,001h,0e9h,006h,0c1h,0f8h,013h,0f2h,003h,0f1h,043h,0e9h,00ah,0ebh,081h,013h	; 9c16  ..........C.....
	defb 0edh,001h,0d1h,0eah,005h,05fh,0ech,0eah,000h,055h,0feh,002h,0e0h,00ch,0ffh	; 9c26  ....._...U.....

; ----------------------------------------------------------------------
; DATOS partitura_9C35: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x44 (tools/partituras.py); lo leen p06:B51E (29 bytes)
;   0x9c35..0x9c52  (29 bytes)
DATA_partitura_9C35:
	defb 0feh,001h,0e9h,006h,0c1h,0f2h,003h,0f1h,043h,0e9h,00ah,0ebh,081h,013h,0edh,001h	; 9c35  ........C.......
	defb 0d1h,0eah,005h,00fh,0ech,0eah,000h,005h,0feh,002h,0e0h,00ch,0ffh	; 9c45  .............

; ----------------------------------------------------------------------
; DATOS partitura_9C52: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x45 (tools/partituras.py); lo leen p06:B51E (20 bytes)
;   0x9c52..0x9c66  (20 bytes)
DATA_partitura_9C52:
	defb 0feh,002h,0e0h,018h,0feh,004h,0d1h,0e9h,004h,0b1h,0fbh,008h,05bh,09ch,0b3h,0b7h	; 9c52  ............[...
	defb 0b7h,0b7h,0bdh,0ffh	; 9c62

; ----------------------------------------------------------------------
; DATOS partitura_9C66: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x45 (tools/partituras.py); lo leen p06:B51E (24 bytes)
;   0x9c66..0x9c7e  (24 bytes)
DATA_partitura_9C66:
	defb 0feh,002h,0e0h,018h,0feh,004h,0d0h,0e9h,005h,093h,0fbh,004h,06fh,09ch,093h,093h	; 9c66  ............o...
	defb 093h,093h,09dh,0feh,002h,0e0h,002h,0ffh	; 9c76  ........

; ----------------------------------------------------------------------
; DATOS partitura_9C7E: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x45 (tools/partituras.py); lo leen p06:B51E (21 bytes)
;   0x9c7e..0x9c93  (21 bytes)
DATA_partitura_9C7E:
	defb 0feh,002h,0e0h,018h,0feh,004h,0d0h,0f8h,025h,0e9h,004h,061h,0fbh,00ch,089h,09ch	; 9c7e  ........%..a....
	defb 065h,065h,065h,06fh,0ffh	; 9c8e

; ----------------------------------------------------------------------
; DATOS partitura_9C93: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x45 (tools/partituras.py); lo leen p06:B51E (21 bytes)
;   0x9c93..0x9ca8  (21 bytes)
DATA_partitura_9C93:
	defb 0feh,002h,0e0h,018h,0feh,004h,0d0h,0f8h,014h,0e9h,004h,0a1h,0fbh,00ch,09eh,09ch	; 9c93  ................
	defb 0a5h,0a5h,0a5h,0afh,0ffh	; 9ca3

; ----------------------------------------------------------------------
; DATOS partitura_9CA8: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x45 (tools/partituras.py); lo leen p06:B51E (31 bytes)
;   0x9ca8..0x9cc7  (31 bytes)
DATA_partitura_9CA8:
	defb 0feh,001h,0e9h,006h,0c3h,0f8h,013h,0f2h,003h,0f1h,043h,0e9h,00ah,0ebh,081h,013h	; 9ca8  ..........C.....
	defb 0edh,001h,0d1h,0eah,005h,05fh,0ech,0eah,000h,055h,0feh,002h,0e0h,00ch,0ffh	; 9cb8  ....._...U.....

; ----------------------------------------------------------------------
; DATOS partitura_9CC7: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x45 (tools/partituras.py); lo leen p06:B51E (28 bytes)
;   0x9cc7..0x9ce3  (28 bytes)
DATA_partitura_9CC7:
	defb 0feh,001h,0e9h,006h,0c3h,0f2h,003h,0f1h,043h,0e9h,00ah,0ebh,081h,013h,0edh,001h	; 9cc7  ........C.......
	defb 0d1h,0eah,005h,00fh,0ech,0eah,000h,005h,0feh,002h,0e0h,00ch	; 9cd7  ............

; ----------------------------------------------------------------------
; DATOS partitura_9CE3: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x45, 0x46 (tools/partituras.py); lo leen p06:B51E (1 bytes)
;   0x9ce3..0x9ce4  (1 bytes)
DATA_partitura_9CE3:
	defb 0ffh	; 9ce3

; ----------------------------------------------------------------------
; DATOS partitura_9CE4: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x02 (tools/partituras.py); lo leen p06:B51E (65 bytes)
;   0x9ce4..0x9d25  (65 bytes)
DATA_partitura_9CE4:
	defb 0feh,002h,0e2h,001h,085h,000h,0e3h,001h,0e4h,002h,096h,000h,0e1h,001h,0e4h,002h	; 9ce4  ................
	defb 005h,0e4h,006h,007h,0e4h,008h,00ah,0e4h,00ah,00ch,007h,0e4h,010h,007h,0e4h,012h	; 9cf4  ................
	defb 008h,0e4h,008h,009h,0e4h,003h,00ah,009h,0e4h,002h,003h,0e4h,004h,003h,0e4h,006h	; 9d04  ................
	defb 005h,0e4h,007h,006h,007h,0e4h,004h,005h,0e4h,007h,004h,0e4h,005h,004h,0e4h,003h	; 9d14  ................
	defb 004h	; 9d24

; ----------------------------------------------------------------------
; DATOS partitura_9D25: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C y
;   60 mas (tools/partituras.py); lo leen p06:B51E (1 bytes)
;   0x9d25..0x9d26  (1 bytes)
DATA_partitura_9D25:
	defb 0ffh	; 9d25

; ----------------------------------------------------------------------
; DATOS partitura_9D26: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x02 (tools/partituras.py); lo leen p06:B51E (44 bytes)
;   0x9d26..0x9d52  (44 bytes)
DATA_partitura_9D26:
	defb 0feh,002h,0f8h,028h,0e2h,001h,065h,000h,076h,000h,0f8h,005h,020h,030h,020h,02eh	; 9d26  ...(..e.v... 0 .
	defb 0f8h,028h,067h,000h,0f8h,014h,043h,000h,044h,000h,0f8h,028h,030h,02ch,030h,02ah	; 9d36  .(g...C.D..(0,0*
	defb 0f8h,004h,035h,000h,0f5h,036h,017h,018h,019h,0e0h,007h,0ffh	; 9d46  ..5..6......

; ----------------------------------------------------------------------
; DATOS partitura_9D52: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x03 (tools/partituras.py); lo leen p06:B51E (86 bytes)
;   0x9d52..0x9da8  (86 bytes)
DATA_partitura_9D52:
	defb 0feh,002h,0e1h,001h,0e4h,002h,005h,0e4h,004h,006h,0e4h,002h,009h,0e4h,007h,00bh	; 9d52  ................
	defb 008h,0e4h,009h,007h,0e4h,007h,008h,0e4h,005h,009h,0e4h,003h,00ah,000h,000h,0e4h	; 9d62  ................
	defb 002h,008h,0e4h,004h,008h,0e4h,002h,007h,0e4h,007h,007h,006h,0e4h,004h,006h,0e4h	; 9d72  ................
	defb 007h,006h,0e4h,005h,005h,0e4h,003h,005h,000h,000h,0e4h,002h,006h,0e4h,004h,006h	; 9d82  ................
	defb 0e4h,002h,005h,0e4h,007h,005h,006h,0e4h,004h,004h,0e4h,007h,004h,0e4h,005h,003h	; 9d92  ................
	defb 0e4h,003h,003h,0e0h,001h,0ffh	; 9da2

; ----------------------------------------------------------------------
; DATOS partitura_9DA8: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x03 (tools/partituras.py); lo leen p06:B51E (64 bytes)
;   0x9da8..0x9de8  (64 bytes)
DATA_partitura_9DA8:
	defb 0feh,002h,0f8h,002h,0e2h,001h,020h,030h,020h,02eh,030h,02ch,030h,02ah,040h,028h	; 9da8  ...... 0 .0,0*@(
	defb 050h,026h,060h,024h,070h,022h,080h,024h,080h,026h,070h,028h,070h,02ah,060h,02ch	; 9db8  P&`$p".$.&p(p*`,
	defb 060h,02eh,010h,030h,010h,02eh,020h,02ch,020h,02ah,030h,028h,030h,026h,020h,024h	; 9dc8  `..0.. , *0(0& $
	defb 020h,022h,010h,020h,000h,030h,0f4h,02eh,02ch,02ah,028h,026h,024h,022h,020h,0ffh	; 9dd8   ". .0..,*(&$" .

; ----------------------------------------------------------------------
; DATOS partitura_9DE8: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x04 (tools/partituras.py); lo leen p06:B51E (96 bytes)
;   0x9de8..0x9e48  (96 bytes)
DATA_partitura_9DE8:
	defb 0feh,002h,0e3h,002h,0e4h,000h,050h,00ah,0e4h,002h,070h,00ah,0e4h,000h,0a0h,00ah	; 9de8  ......P...p.....
	defb 0e4h,005h,0b0h,00ah,090h,00ah,0e4h,007h,060h,00ah,0e4h,005h,070h,00ah,0e4h,003h	; 9df8  ........`...p...
	defb 080h,00ah,0e4h,001h,090h,00ah,0e1h,001h,0e4h,013h,004h,0e4h,012h,004h,0e4h,005h	; 9e08  ................
	defb 006h,006h,007h,0e4h,012h,006h,0e4h,004h,006h,0e4h,004h,006h,0e4h,002h,006h,000h	; 9e18  ................
	defb 0e4h,013h,005h,0e4h,012h,005h,0e4h,005h,005h,005h,004h,0e4h,012h,004h,000h,000h	; 9e28  ................
	defb 000h,0e4h,013h,003h,0e4h,012h,003h,0e4h,005h,003h,003h,002h,0e4h,012h,002h,0ffh	; 9e38  ................

; ----------------------------------------------------------------------
; DATOS partitura_9E48: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x04 (tools/partituras.py); lo leen p06:B51E (61 bytes)
;   0x9e48..0x9e85  (61 bytes)
DATA_partitura_9E48:
	defb 0feh,002h,0f8h,01dh,0e2h,002h,040h,024h,0f4h,026h,028h,024h,036h,0f6h,050h,038h	; 9e48  ......@$.&($6.P8
	defb 050h,03ah,060h,03ch,070h,03eh,080h,040h,090h,042h,090h,044h,090h,046h,030h,046h	; 9e58  P:`<p>.@.B.D.F0F
	defb 0e2h,001h,010h,038h,0f4h,036h,034h,032h,030h,02eh,02ch,028h,0f6h,000h,028h,0f4h	; 9e68  ...8.6420.,(..(.
	defb 028h,028h,036h,034h,030h,028h,026h,022h,020h,01eh,0e0h,002h,0ffh	; 9e78  ((640(&" ....

; ----------------------------------------------------------------------
; DATOS partitura_9E85: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x05 (tools/partituras.py); lo leen p06:B51E (71 bytes)
;   0x9e85..0x9ecc  (71 bytes)
DATA_partitura_9E85:
	defb 0feh,002h,0e3h,001h,0e4h,010h,060h,004h,0e4h,012h,080h,004h,0e4h,010h,0b0h,004h	; 9e85  ......`.........
	defb 0e4h,015h,0c0h,004h,0a0h,004h,0e4h,017h,070h,004h,0e4h,015h,080h,004h,0e4h,013h	; 9e95  ........p.......
	defb 080h,004h,0e4h,011h,070h,004h,0e1h,001h,0e4h,013h,009h,0e4h,012h,008h,0e4h,015h	; 9ea5  ....p...........
	defb 007h,0e4h,010h,007h,0e4h,00dh,007h,0e4h,006h,007h,0e1h,004h,0e4h,004h,007h,0e4h	; 9eb5  ................
	defb 003h,006h,0e4h,002h,006h,005h,0ffh	; 9ec5

; ----------------------------------------------------------------------
; DATOS partitura_9ECC: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x05 (tools/partituras.py); lo leen p06:B51E (46 bytes)
;   0x9ecc..0x9efa  (46 bytes)
DATA_partitura_9ECC:
	defb 0feh,002h,0f8h,013h,0e2h,001h,020h,036h,030h,028h,0f4h,026h,024h,022h,020h,01eh	; 9ecc  ...... 60(.&$" .
	defb 01ch,018h,0f8h,00dh,0f6h,040h,018h,0f4h,018h,018h,026h,024h,020h,018h,016h,0f6h	; 9edc  .....@....&$ ...
	defb 030h,018h,0f4h,026h,024h,020h,018h,016h,012h,010h,00eh,0e0h,005h,0ffh	; 9eec  0..&$ ........

; ----------------------------------------------------------------------
; DATOS partitura_9EFA: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x06 (tools/partituras.py); lo leen p06:B51E (6 bytes)
;   0x9efa..0x9f00  (6 bytes)
DATA_partitura_9EFA:
	defb 0feh,002h,0f9h,006h,09fh,0ffh	; 9efa

; ----------------------------------------------------------------------
; DATOS partitura_9F00: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x06, 0x0D, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18
;   (tools/partituras.py); lo leen p06:B51E (256 bytes)
;   0x9f00..0xa000  (256 bytes)
DATA_partitura_9F00:
	defb 0feh,002h,0f9h,026h,09fh,0ffh,0e2h,001h,0c6h,000h,0e3h,001h,0e4h,01ch,082h,070h	; 9f00  ...&...........p
	defb 0e4h,000h,094h,080h,0e1h,001h,0e4h,001h,006h,0e4h,003h,007h,0e4h,005h,008h,0e4h	; 9f10  ................
	defb 007h,00ah,0e4h,008h,004h,0fah,0f8h,004h,0e2h,001h,0c2h,070h,0c4h,080h,000h,000h	; 9f20  ...........p....
	defb 000h,000h,072h,070h,084h,080h,0e0h,002h,0fah,0e2h,001h,0c8h,000h,0e3h,001h,0e4h	; 9f30  ..rp............
	defb 01ch,083h,070h,0e4h,000h,0b5h,080h,0e1h,001h,0e4h,01fh,006h,0e4h,008h,005h,0e4h	; 9f40  ..p.............
	defb 007h,006h,0e4h,009h,007h,0e4h,008h,004h,000h,000h,000h,0e4h,01fh,002h,0e4h,008h	; 9f50  ................
	defb 002h,0e4h,015h,003h,0e4h,007h,004h,0e4h,008h,002h,001h,0fah,0f8h,028h,0e2h,001h	; 9f60  .............(..
	defb 0c7h,000h,0f8h,014h,098h,000h,0f8h,004h,052h,070h,054h,080h,066h,000h,078h,000h	; 9f70  ........RpT.f.x.
	defb 0c2h,000h,0c2h,060h,0c2h,0a0h,0c3h,070h,0c4h,067h,0f8h,005h,062h,000h,062h,060h	; 9f80  ...`...p.g..b.b`
	defb 062h,0a0h,063h,070h,064h,067h,0fah,0e2h,001h,0c8h,000h,0e1h,001h,0e4h,01ah,007h	; 9f90  b.cpdg..........
	defb 000h,000h,0e4h,01fh,0e3h,001h,0e5h,009h,005h,000h,0c8h,0c0h,0e4h,001h,081h,04ah	; 9fa0  ...............J
	defb 0e4h,01ah,0a3h,05ah,0e1h,001h,0e4h,018h,007h,0e1h,002h,0e4h,01fh,0e8h,002h,009h	; 9fb0  ...Z............
	defb 0e4h,017h,007h,006h,0e4h,01ah,005h,004h,0e4h,018h,003h,002h,0e4h,014h,001h,000h	; 9fc0  ................
	defb 0fah,0f8h,028h,0e2h,001h,0c4h,030h,014h,060h,0e0h,002h,0e2h,001h,0f8h,014h,0c4h	; 9fd0  ..(...0.`.......
	defb 000h,034h,000h,000h,000h,0f8h,004h,052h,000h,0c1h,070h,0c2h,050h,0c3h,060h,0c3h	; 9fe0  .4.....R..p.P.`.
	defb 0e0h,0c4h,065h,0c4h,020h,0c5h,040h,0c5h,0f0h,0c6h,060h,0c7h,020h,0c8h,000h,0c8h	; 9ff0  ..e. .@...`. ...
