; ==========================================================================
; THE PRO YAKYUU GEKITOTSU PENNANT RACE - Konami (1988) - MSX2 - MegaROM RC-757 de 128 KB (Konami SCC) - banco 13 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ======================================================================
; CODIGO 0x6000..0x604d  (77 bytes)
; ======================================================================


L_6000:
	ld a,(0d74ch)		;6000
	cp 008h		;6003
	jr nz,L_604A		;6005
	ld a,(0dd8eh)		;6007
	and 003h		;600a
	jr z,L_6041		;600c
	call L_6FFE		;600e
	ld a,(0d2b1h)		;6011
	or a			;6014
	ret z			;6015
	dec a			;6016
	jr nz,$+111		;6017
	ld (0e1d1h),a		;6019
	ld a,(0dd8fh)		;601c
	or a			;601f
	jr z,L_6041		;6020
	ld a,(0d73fh)		;6022
	ld (0de02h),a		;6025
	ld hl,062d7h		;6028
	ld de,0daaeh		;602b
	ld bc,00042h		;602e
	ldir		;6031
	ld a,024h		;6033
	ld (de),a			;6035
	ld a,006h		;6036
	ld (0d2b2h),a		;6038
	call 081fch		;603b
	jp L_64DF		;603e
L_6041:
	ld a,(0dd90h)		;6041
	or a			;6044
	jr z,$+38		;6045
	jp L_64DF		;6047
L_604A:
	call 04220h		;604a

; ----------------------------------------------------------------------
; DATOS tabla_604D: 15 destinos del despachador p00:4220 (call en p13:604A, el
;   indice en A): 60D8, 6148, 61B3, 6319, 6383, 63F4, 6487, 63BB, 6FFE, 64DF,
;   6606, 662A, 6650, 64DF, 6081; lo leen p13:604A (30 bytes)
;   0x604d..0x606b  (30 bytes)
DATA_tabla_604D:
	defw 060d8h,06148h,061b3h,06319h,06383h,063f4h,06487h,063bbh	; 604d
	defw 06ffeh,064dfh,06606h,0662ah,06650h,064dfh,06081h	; 605d

; ======================================================================
; CODIGO 0x606b..0x6096  (43 bytes)
; ======================================================================


L_606B:
	ld hl,0d74ch		;606b
	ld (hl),00eh		;606e
	inc hl			;6070
	ld (hl),000h		;6071
	ld hl,0d2e1h		;6073
	ld (hl),080h		;6076
	call 0ba82h		;6078
	ld hl,07d19h		;607b
	jp 04ea6h		;607e
L_6081:
	ld hl,0d2e1h		;6081
	dec (hl)			;6084
	ret nz			;6085
L_6086:
	xor a			;6086
	ld (0d74ch),a		;6087
	ld (0de00h),a		;608a
	ld (0de01h),a		;608d
	ld a,020h		;6090
	ld (0de04h),a		;6092
	ret			;6095

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6096..0x60a1  (11 bytes)
DATA_6096:
	defb 021h,04ch,0d7h,035h,023h,036h,000h,0c9h,0cdh,0a7h,060h	; 6096  !L.5#6....`

; ======================================================================
; CODIGO 0x60a1..0x6115  (116 bytes)
; ======================================================================


L_60A1:
	call L_60A7		;60a1
L_60A4:
	call L_60A7		;60a4
L_60A7:
	ld hl,0d74ch		;60a7
	inc (hl)			;60aa
	inc hl			;60ab
	ld (hl),000h		;60ac
	ret			;60ae
L_60AF:
	ld hl,0d74dh		;60af
	inc (hl)			;60b2
	ret			;60b3
L_60B4:
	call L_6BFB		;60b4
	jr L_60BE		;60b7
L_60B9:
	push bc			;60b9
	call L_6B93		;60ba
	pop bc			;60bd
L_60BE:
	ld a,(0d759h)		;60be
	add a,003h		;60c1
	ld (0d74ch),a		;60c3
	xor a			;60c6
	ld (0d74dh),a		;60c7
	ret			;60ca
L_60CB:
	ld a,(0d759h)		;60cb
	add a,00ah		;60ce
	ld (0d74ch),a		;60d0
	xor a			;60d3
	ld (0d74dh),a		;60d4
	ret			;60d7
L_60D8:
	call 04b9fh		;60d8
	xor a			;60db
	ld hl,0d74ch		;60dc
	ld de,0d74dh		;60df
	ld (hl),a			;60e2
	ld bc,0000fh		;60e3
	ldir		;60e6
	ld (0da6bh),a		;60e8
	ld (0d759h),a		;60eb
	ld a,(0dd8fh)		;60ee
	or a			;60f1
	jr nz,L_6102		;60f2
	ld a,(0dd90h)		;60f4
	or a			;60f7
	jr nz,L_6102		;60f8
	ld c,001h		;60fa
	call L_60A7		;60fc
	jp L_6157		;60ff
L_6102:
	ld hl,06115h		;6102
	call 04ea6h		;6105
	xor a			;6108
	ld (0dd91h),a		;6109
	ld (0dd92h),a		;610c
	ld (0dd93h),a		;610f
	jp L_60A7		;6112

; ----------------------------------------------------------------------
; DATOS texto_6115: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; se solapan 4 bloques: (texto_6125 6125-6148) (texto_6130
;   6130-6148) (texto_613D 613D-6148); lo leen p13:6105, p13:615E, p13:6164,
;   p13:616A, p13:6205 (51 bytes)
;   0x6115..0x6148  (51 bytes)
DATA_texto_6115:
	defb 050h,038h,01eh,01ah,013h,00fh,021h,013h,000h,021h,013h,01ah,013h,011h,022h,0feh	; 6115  P8....!..!....".
	defb 060h,060h,011h,01dh,01ch,022h,017h,01ch,023h,013h,0feh,060h,070h,01ch,013h,025h	; 6125  ``..."..#..`p..%
	defb 000h,021h,013h,00fh,021h,01dh,01ch,0feh,062h,010h,066h,00dh,067h,068h,069h,06ah	; 6135  .!..!...b.f.ghij
	defb 00eh,06bh,0ffh	; 6145

; ======================================================================
; CODIGO 0x6148..0x6193  (75 bytes)
; ======================================================================


L_6148:
	ld de,06050h		;6148
	call 0aae1h		;614b
	ld a,(0dd91h)		;614e
	or a			;6151
	ret z			;6152
	ld a,(0dd93h)		;6153
	ld c,a			;6156
L_6157:
	ld a,c			;6157
	ld (0d750h),a		;6158
	ld hl,06115h		;615b
	call 04eabh		;615e
	ld hl,06125h		;6161
	call 04eabh		;6164
	ld hl,06130h		;6167
	call 04eabh		;616a
	call 04bd2h		;616d
	call L_6187		;6170
	ld a,(0d750h)		;6173
	or a			;6176
	jp nz,L_60A7		;6177
	xor a			;617a
	ld (0d2b0h),a		;617b
	call L_60A1		;617e
	call L_60A4		;6181
	jp L_60A4		;6184
L_6187:
	ld de,0f800h		;6187
	ld hl,06193h		;618a
	ld bc,00020h		;618d
	jp 04ab7h		;6190

; ----------------------------------------------------------------------
; DATOS copia_6193: 32 bytes que p00:4AB7 copia tal cual a la VRAM 0xF800; lo
;   leen p13:6190 (32 bytes)
;   0x6193..0x61b3  (32 bytes)
DATA_copia_6193:
	defb 000h,03eh,05dh,06bh,06bh,06bh,05dh,03eh,000h,000h,000h,000h,000h,000h,000h,000h	; 6193  .>]kkk]>........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 61a3  ................

; ======================================================================
; CODIGO 0x61b3..0x61b9  (6 bytes)
; ======================================================================


L_61B3:
	ld a,(0d74dh)		;61b3
	call 04220h		;61b6

; ----------------------------------------------------------------------
; DATOS tabla_61B9: 2 destinos del despachador p00:4220 (call en p13:61B6, el
;   indice en A): 61BD, 6214; lo leen p13:61B6 (4 bytes)
;   0x61b9..0x61bd  (4 bytes)
DATA_tabla_61B9:
	defw 061bdh,06214h	; 61b9  -> L_61BD L_6214

; ======================================================================
; CODIGO 0x61bd..0x6291  (212 bytes)
; ======================================================================


L_61BD:
	ld hl,0d6e1h		;61bd
	ld (hl),001h		;61c0
	ld hl,00050h		;61c2
	ld c,00dh		;61c5
	ld b,000h		;61c7
	call 04c91h		;61c9
	ld hl,008c6h		;61cc
	ld c,00dh		;61cf
	ld de,0f20ch		;61d1
	call 04cfeh		;61d4
	ld hl,03ec6h		;61d7
	ld c,00dh		;61da
	ld b,00ch		;61dc
	call 04cc7h		;61de
	ld hl,076c6h		;61e1
	ld c,00dh		;61e4
	ld b,00ch		;61e6
	call 04cc7h		;61e8
	ld hl,0a6c6h		;61eb
	ld c,00dh		;61ee
	ld b,00ch		;61f0
	call 04cc7h		;61f2
	ld hl,0ccc6h		;61f5
	ld c,00dh		;61f8
	ld b,00ch		;61fa
	call 04cc7h		;61fc
	call 059b6h		;61ff
	ld hl,0613dh		;6202
	call 04eabh		;6205
	ld hl,06294h		;6208
	call 04ea6h		;620b
	call L_6C9D		;620e
	jp L_60AF		;6211
L_6214:
	ld hl,062d7h		;6214
	ld de,0daaeh		;6217
	ld bc,00042h		;621a
	ldir		;621d
	ld a,024h		;621f
	ld (de),a			;6221
	ld a,006h		;6222
	ld (0d2b2h),a		;6224
	call 081fch		;6227
	ld a,02eh		;622a
	call 057ffh		;622c
	ld hl,00101h		;622f
	ld (0d753h),hl		;6232
	ld de,0dd81h		;6235
	ld hl,0dd80h		;6238
	ld (hl),0ffh		;623b
	ld bc,00005h		;623d
	ldir		;6240
	ld de,0d6e4h		;6242
	ld hl,0d6e3h		;6245
	ld (hl),000h		;6248
	ld bc,00023h		;624a
	ldir		;624d
	ld hl,0d70ah		;624f
	ld (hl),0ffh		;6252
	ld de,0d70bh		;6254
	ld bc,00005h		;6257
	ldir		;625a
	call L_6A0D		;625c
	ld hl,0da6ch		;625f
	ld (hl),020h		;6262
	ld de,0da6dh		;6264
	ld bc,00041h		;6267
	ldir		;626a
L_626C:
	call L_6272		;626c
	jp L_60A7		;626f
L_6272:
	ld de,0f600h		;6272
	ld hl,06291h		;6275
	ld bc,00003h		;6278
	call 04ab7h		;627b
	ld hl,0f604h		;627e
	ld a,0d8h		;6281
	call 04ae3h		;6283
	ld hl,0f400h		;6286
	ld a,007h		;6289
	ld bc,00010h		;628b
	jp 04acah		;628e

; ----------------------------------------------------------------------
; DATOS copia_6291: 3 bytes que p00:4AB7 copia tal cual a la VRAM 0xF600; lo
;   leen p13:627B (3 bytes)
;   0x6291..0x6294  (3 bytes)
DATA_copia_6291:
	defb 0e0h,000h,000h	; 6291

; ----------------------------------------------------------------------
; DATOS texto_6294: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; se solapan 2 bloques: (texto_62D1 62D1-62D7); lo leen
;   p13:620B, p13:64AD (67 bytes)
;   0x6294..0x62d7  (67 bytes)
DATA_texto_6294:
	defb 040h,000h,01ah,013h,00fh,015h,023h,013h,000h,021h,013h,01ah,013h,011h,022h,017h	; 6294  @.....#..!....".
	defb 01dh,01ch,0feh,068h,054h,022h,013h,00fh,01bh,021h,0feh,00ah,0c8h,01eh,01ah,00fh	; 62a4  ...hT"...!......
	defb 027h,013h,020h,0feh,042h,0c8h,021h,013h,01ah,013h,011h,022h,0feh,0d0h,0c8h,011h	; 62b4  '. .B.!...."....
	defb 01ah,013h,00fh,020h,0feh,07ah,0c8h,011h,01dh,023h,01ch,022h,0feh,0aeh,0c8h,013h	; 62c4  ... .z...#."....
	defb 01ch,012h,0ffh	; 62d4

; ----------------------------------------------------------------------
; DATOS sin identificar  0x62d7..0x6319  (66 bytes)
DATA_62D7:
	defb 046h,04ch,059h,045h,052h,053h,020h,020h,020h,020h,020h,052h,049h,044h,045h,052h	; 62d7  FLYERS     RIDER
	defb 053h,020h,020h,020h,020h,020h,04bh,04fh,042h,045h,020h,04ch,049h,04eh,045h,053h	; 62e7  S     KOBE LINES
	defb 020h,042h,052h,045h,04eh,044h,053h,020h,020h,020h,020h,020h,050h,052h,04fh,047h	; 62f7   BRENDS     PROG
	defb 052h,041h,04dh,053h,020h,020h,020h,044h,041h,052h,04bh,053h,020h,020h,020h,020h	; 6307  RAMS   DARKS
	defb 020h,020h	; 6317

; ======================================================================
; CODIGO 0x6319..0x631f  (6 bytes)
; ======================================================================


L_6319:
	ld a,(0d74dh)		;6319
	call 04220h		;631c

; ----------------------------------------------------------------------
; DATOS tabla_631F: 2 destinos del despachador p00:4220 (call en p13:631C, el
;   indice en A): 6323, 633A; lo leen p13:631C (4 bytes)
;   0x631f..0x6323  (4 bytes)
DATA_tabla_631F:
	defw 06323h,0633ah	; 631f  -> L_6323 L_633A

; ======================================================================
; CODIGO 0x6323..0x63c1  (158 bytes)
; ======================================================================


L_6323:
	call L_6BFB		;6323
	call L_6B66		;6326
	ld hl,07cefh		;6329
	call 04ea6h		;632c
	call L_6B50		;632f
	ld hl,0d2e1h		;6332
	ld (hl),008h		;6335
	jp L_60AF		;6337
L_633A:
	call L_6C85		;633a
	call L_6C81		;633d
	ld a,(0d759h)		;6340
	or a			;6343
	jp nz,L_60B9		;6344
	ld a,(0de06h)		;6347
	and 003h		;634a
	jr nz,L_6359		;634c
	ld a,(0de07h)		;634e
	and 003h		;6351
	ret z			;6353
	ld hl,0d2e1h		;6354
	dec (hl)			;6357
	ret nz			;6358
L_6359:
	ld hl,0d2e1h		;6359
	ld (hl),008h		;635c
	rra			;635e
	jr c,L_636C		;635f
	ld hl,0d6e1h		;6361
	ld a,(hl)			;6364
	dec a			;6365
	jr nz,L_6377		;6366
	ld a,006h		;6368
	jr L_6377		;636a
L_636C:
	ld hl,0d6e1h		;636c
	ld a,(hl)			;636f
	inc a			;6370
	cp 007h		;6371
	jr c,L_6377		;6373
	ld a,001h		;6375
L_6377:
	ld (hl),a			;6377
	call L_6B50		;6378
	call L_6BFB		;637b
	ld a,026h		;637e
	jp 057ffh		;6380
L_6383:
	call L_6C85		;6383
	ld a,(0d759h)		;6386
	dec a			;6389
	jp nz,L_60BE		;638a
	call L_6938		;638d
	call L_6A0D		;6390
	call L_6B5B		;6393
	ld a,(0da6bh)		;6396
	cp b			;6399
	jp z,L_6C81		;639a
	ld a,(0de06h)		;639d
	and 010h		;63a0
	ret z			;63a2
	call L_6AB5		;63a3
	call L_6B17		;63a6
	call L_6B5B		;63a9
	ld a,(0da6bh)		;63ac
	cp b			;63af
	jr z,L_63B5		;63b0
	jp L_6922		;63b2
L_63B5:
	call L_6C81		;63b5
	jp L_6A0D		;63b8
L_63BB:
	ld a,(0d74dh)		;63bb
	call 04220h		;63be

; ----------------------------------------------------------------------
; DATOS tabla_63C1: 2 destinos del despachador p00:4220 (call en p13:63BE, el
;   indice en A): 63C5, 63D4; lo leen p13:63BE (4 bytes)
;   0x63c1..0x63c5  (4 bytes)
DATA_tabla_63C1:
	defw 063c5h,063d4h	; 63c1  -> L_63C5 L_63D4

; ======================================================================
; CODIGO 0x63c5..0x63fa  (53 bytes)
; ======================================================================


L_63C5:
	ld hl,0f600h		;63c5
	ld a,0e0h		;63c8
	call 04ae3h		;63ca
	xor a			;63cd
	ld (0d758h),a		;63ce
	jp L_60AF		;63d1
L_63D4:
	call L_6C85		;63d4
	ld a,(0d759h)		;63d7
	sub 004h		;63da
	jp nz,L_60B4		;63dc
	call L_6BDC		;63df
	call L_6C49		;63e2
	ld a,(0de06h)		;63e5
	and 010h		;63e8
	ret z			;63ea
	call L_6C6E		;63eb
	call L_6B17		;63ee
	jp L_6A0D		;63f1
L_63F4:
	ld a,(0d74dh)		;63f4
	call 04220h		;63f7

; ----------------------------------------------------------------------
; DATOS tabla_63FA: 2 destinos del despachador p00:4220 (call en p13:63F7, el
;   indice en A): 63FE, 641A; lo leen p13:63F7 (4 bytes)
;   0x63fa..0x63fe  (4 bytes)
DATA_tabla_63FA:
	defw 063feh,0641ah	; 63fa  -> L_63FE L_641A

; ======================================================================
; CODIGO 0x63fe..0x6412  (20 bytes)
; ======================================================================


L_63FE:
	call L_6B66		;63fe
	ld hl,06412h		;6401
	call 04ea6h		;6404
	call L_6462		;6407
	ld hl,0d2e1h		;640a
	ld (hl),008h		;640d
	jp L_60AF		;640f

; ----------------------------------------------------------------------
; DATOS texto_6412: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p13:6404 (8 bytes)
;   0x6412..0x641a  (8 bytes)
DATA_texto_6412:
	defb 064h,088h,082h,000h,083h,000h,081h,0ffh	; 6412  d.......

; ======================================================================
; CODIGO 0x641a..0x648d  (115 bytes)
; ======================================================================


L_641A:
	call L_6C85		;641a
	call L_6C81		;641d
	ld a,(0d759h)		;6420
	sub 002h		;6423
	jp nz,L_60B9		;6425
	ld a,(0de06h)		;6428
	and 003h		;642b
	jr nz,L_643A		;642d
	ld a,(0de07h)		;642f
	and 003h		;6432
	ret z			;6434
	ld hl,0d2e1h		;6435
	dec (hl)			;6438
	ret nz			;6439
L_643A:
	ld hl,0d2e1h		;643a
	ld (hl),008h		;643d
	rra			;643f
	ld a,(0d753h)		;6440
	jr c,L_644E		;6443
	cp 001h		;6445
	jr nz,L_644B		;6447
	ld a,01bh		;6449
L_644B:
	dec a			;644b
	jr L_6454		;644c
L_644E:
	cp 01ah		;644e
	jr nz,L_6453		;6450
	xor a			;6452
L_6453:
	inc a			;6453
L_6454:
	ld hl,0d753h		;6454
	ld (hl),a			;6457
	inc hl			;6458
	call L_646D		;6459
	ld (hl),a			;645c
	ld a,026h		;645d
	call 057ffh		;645f
L_6462:
	ld hl,0d754h		;6462
	ld de,07098h		;6465
	ld b,001h		;6468
	jp 05bf1h		;646a
L_646D:
	push bc			;646d
	ld b,00ah		;646e
	ld c,000h		;6470
L_6472:
	inc c			;6472
	sub b			;6473
	jr z,L_647C		;6474
	jp p,L_6472		;6476
	dec c			;6479
	add a,00ah		;647a
L_647C:
	sla c		;647c
	sla c		;647e
	sla c		;6480
	sla c		;6482
	add a,c			;6484
	pop bc			;6485
	ret			;6486
L_6487:
	ld a,(0d74dh)		;6487
	call 04220h		;648a

; ----------------------------------------------------------------------
; DATOS tabla_648D: 2 destinos del despachador p00:4220 (call en p13:648A, el
;   indice en A): 6491, 64B4; lo leen p13:648A (4 bytes)
;   0x648d..0x6491  (4 bytes)
DATA_tabla_648D:
	defw 06491h,064b4h	; 648d  -> L_6491 L_64B4

; ======================================================================
; CODIGO 0x6491..0x64b3  (34 bytes)
; ======================================================================


L_6491:
	call L_6C85		;6491
	ld a,(0d759h)		;6494
	sub 003h		;6497
	jp nz,L_60BE		;6499
	ld a,(0de06h)		;649c
	and 010h		;649f
	ret z			;64a1
	call L_6B5B		;64a2
	ld a,(0da6bh)		;64a5
	cp b			;64a8
	ret nz			;64a9
	ld hl,062d1h		;64aa
	call 04ea6h		;64ad
	jp L_60AF		;64b0

; ----------------------------------------------------------------------
; DATOS sin identificar  0x64b3..0x64b4  (1 bytes)
DATA_64B3:
	defb 0c9h	; 64b3

; ======================================================================
; CODIGO 0x64b4..0x6594  (224 bytes)
; ======================================================================


L_64B4:
	call L_6BA1		;64b4
	ld de,0d72ah		;64b7
	ld hl,0d70ah		;64ba
	ld bc,00006h		;64bd
	ldir		;64c0
	ld hl,0de02h		;64c2
	set 5,(hl)		;64c5
	ld a,(0d6e1h)		;64c7
	dec a			;64ca
	jr nz,L_64D9		;64cb
	res 5,(hl)		;64cd
	ld a,001h		;64cf
	ld (0e1d1h),a		;64d1
	xor a			;64d4
	ld (0d6dch),a		;64d5
	ret			;64d8
L_64D9:
	ld a,00dh		;64d9
	ld (0d74ch),a		;64db
	ret			;64de
L_64DF:
	call 04b9fh		;64df
	ld a,(0d6e1h)		;64e2
	dec a			;64e5
	jp nz,L_64EF		;64e6
	ld a,001h		;64e9
	ld (0e1d1h),a		;64eb
	ret			;64ee
L_64EF:
	xor a			;64ef
	ld hl,0d74ch		;64f0
	ld de,0d74dh		;64f3
	ld (hl),a			;64f6
	ld bc,0000fh		;64f7
	ldir		;64fa
	ld (0da6bh),a		;64fc
	ld (0d759h),a		;64ff
	ld a,009h		;6502
	ld (0d74ch),a		;6504
	ld de,0e340h		;6507
	ld hl,0d70ah		;650a
	ld bc,00006h		;650d
	ldir		;6510
	ld de,0d70bh		;6512
	ld hl,0d70ah		;6515
	ld (hl),0ffh		;6518
	ld bc,00005h		;651a
	ldir		;651d
	ld de,0d719h		;651f
	ld hl,0d718h		;6522
	ld (hl),0ffh		;6525
	ld bc,00011h		;6527
	ldir		;652a
	call L_65BE		;652c
	call L_6B5B		;652f
	ld c,002h		;6532
	ld de,04c6ch		;6534
L_6537:
	ld a,c			;6537
	call 04f1ch		;6538
	ld a,e			;653b
	add a,00ch		;653c
	ld e,a			;653e
	inc c			;653f
	djnz L_6537		;6540
	call L_6187		;6542
	ld hl,0a710h		;6545
	call 04ea6h		;6548
	ld hl,00050h		;654b
	ld c,00dh		;654e
	ld b,000h		;6550
	call 04c91h		;6552
	ld hl,008c6h		;6555
	ld c,00dh		;6558
	ld de,0f20ch		;655a
	call 04cfeh		;655d
	ld hl,04ec6h		;6560
	ld c,00dh		;6563
	ld b,00ch		;6565
	call 04cc7h		;6567
	ld hl,07ec6h		;656a
	ld c,00dh		;656d
	ld b,00ch		;656f
	call 04cc7h		;6571
	ld hl,0aec6h		;6574
	ld c,00dh		;6577
	ld b,00ch		;6579
	call 04cc7h		;657b
	ld hl,0dec6h		;657e
	ld c,00dh		;6581
	ld b,00ch		;6583
	call 04cc7h		;6585
	ld hl,06594h		;6588
	call 04ea6h		;658b
	call L_6811		;658e
	jp L_626C		;6591

; ----------------------------------------------------------------------
; DATOS texto_6594: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; se solapan 2 bloques: (texto_65B8 65B8-65BE); lo leen
;   p13:658B, p13:6814, p13:667D (42 bytes)
;   0x6594..0x65be  (42 bytes)
DATA_texto_6594:
	defb 030h,020h,024h,017h,021h,017h,022h,01dh,020h,021h,0feh,030h,038h,016h,01dh,01bh	; 6594  0 $.!.". !.08...
	defb 013h,0feh,00ah,0c8h,024h,017h,021h,017h,022h,01dh,020h,021h,0feh,052h,0c8h,016h	; 65a4  ....$.!.". !.R..
	defb 01dh,01bh,013h,0feh,082h,0c8h,013h,01ch,012h,0ffh	; 65b4  ..........

; ======================================================================
; CODIGO 0x65be..0x6656  (152 bytes)
; ======================================================================


L_65BE:
	ld hl,0e340h		;65be
	ld de,0d718h		;65c1
	call L_6B5B		;65c4
L_65C7:
	ld a,(hl)			;65c7
	ld c,a			;65c8
	exx			;65c9
	call L_65FB		;65ca
	ld l,c			;65cd
	ld h,000h		;65ce
	add hl,hl			;65d0
	ld d,h			;65d1
	ld e,l			;65d2
	add hl,hl			;65d3
	add hl,de			;65d4
	ld de,0d6e3h		;65d5
	add hl,de			;65d8
	call L_6B5B		;65d9
	ld e,000h		;65dc
L_65DE:
	ld a,(0d6deh)		;65de
	dec a			;65e1
	cp (hl)			;65e2
	jr c,L_65E9		;65e3
	ld a,e			;65e5
	cp c			;65e6
	jr nz,L_65F5		;65e7
L_65E9:
	inc hl			;65e9
	inc e			;65ea
	djnz L_65DE		;65eb
	exx			;65ed
	ld a,c			;65ee
	ld (de),a			;65ef
L_65F0:
	inc hl			;65f0
	inc de			;65f1
	djnz L_65C7		;65f2
	ret			;65f4
L_65F5:
	exx			;65f5
	ld a,0ffh		;65f6
	ld (de),a			;65f8
	jr L_65F0		;65f9
L_65FB:
	ld c,000h		;65fb
	ld hl,0d72ah		;65fd
L_6600:
	cp (hl)			;6600
	ret z			;6601
	inc hl			;6602
	inc c			;6603
	jr L_6600		;6604
L_6606:
	call L_67FA		;6606
	ld a,(0d759h)		;6609
	or a			;660c
	jp nz,L_60CB		;660d
	call L_6846		;6610
	xor a			;6613
	call L_68A8		;6614
	ld a,(0de06h)		;6617
	and 010h		;661a
	ret z			;661c
	call L_66C4		;661d
	call L_6737		;6620
	xor a			;6623
	call L_68A8		;6624
	jp L_60CB		;6627
L_662A:
	call L_67FA		;662a
	ld a,(0d759h)		;662d
	dec a			;6630
	jp nz,L_60CB		;6631
	call L_6846		;6634
	ld a,001h		;6637
	call L_68A8		;6639
	ld a,(0de06h)		;663c
	and 010h		;663f
	ret z			;6641
	call L_66F6		;6642
	call L_6737		;6645
	ld a,001h		;6648
	call L_68A8		;664a
	jp L_60CB		;664d
L_6650:
	ld a,(0d74dh)		;6650
	call 04220h		;6653

; ----------------------------------------------------------------------
; DATOS tabla_6656: 2 destinos del despachador p00:4220 (call en p13:6653, el
;   indice en A): 665A, 6677; lo leen p13:6653 (4 bytes)
;   0x6656..0x665a  (4 bytes)
DATA_tabla_6656:
	defw 0665ah,06677h	; 6656  -> L_665A L_6677

; ======================================================================
; CODIGO 0x665a..0x6828  (462 bytes)
; ======================================================================


L_665A:
	call L_67FA		;665a
	ld a,(0d759h)		;665d
	sub 002h		;6660
	jp nz,L_60CB		;6662
	ld a,(0de06h)		;6665
	and 010h		;6668
	ret z			;666a
	ld hl,(0d70ah)		;666b
	ld a,h			;666e
	inc a			;666f
	ret z			;6670
	ld a,l			;6671
	inc a			;6672
	ret z			;6673
	jp L_60AF		;6674
L_6677:
	call L_6761		;6677
	ld hl,065b8h		;667a
	call 04ea6h		;667d
	ld a,001h		;6680
	ld (0e1d1h),a		;6682
	ret			;6685
L_6686:
	ld a,(0d74fh)		;6686
	ld c,a			;6689
	ld b,000h		;668a
	ld hl,0d72ah		;668c
	add hl,bc			;668f
	ld a,(hl)			;6690
	exx			;6691
	ld b,a			;6692
	exx			;6693
	ret			;6694
L_6695:
	call L_65FB		;6695
	ld l,c			;6698
	ld h,000h		;6699
	add hl,hl			;669b
	ld b,h			;669c
	ld c,l			;669d
	add hl,hl			;669e
	add hl,bc			;669f
	ld bc,0d6e3h		;66a0
	add hl,bc			;66a3
	ld b,006h		;66a4
L_66A6:
	ld a,(0d6deh)		;66a6
	dec a			;66a9
	cp (hl)			;66aa
	jr c,L_66B5		;66ab
	ld a,0ffh		;66ad
	ld (de),a			;66af
L_66B0:
	inc hl			;66b0
	inc de			;66b1
	djnz L_66A6		;66b2
	ret			;66b4
L_66B5:
	push hl			;66b5
	ld a,006h		;66b6
	sub b			;66b8
	ld hl,0d72ah		;66b9
	call 04216h		;66bc
	ld a,(hl)			;66bf
	pop hl			;66c0
	ld (de),a			;66c1
	jr L_66B0		;66c2
L_66C4:
	call L_6686		;66c4
	ld bc,(0d70ah)		;66c7
	cp b			;66cb
	ret z			;66cc
	cp c			;66cd
	ret z			;66ce
	push af			;66cf
	ld hl,0d718h		;66d0
	ld a,(0d70bh)		;66d3
	inc a			;66d6
	jr z,L_66DC		;66d7
	ld hl,0d724h		;66d9
L_66DC:
	pop af			;66dc
	ld b,006h		;66dd
L_66DF:
	cp (hl)			;66df
	inc hl			;66e0
	ret z			;66e1
	djnz L_66DF		;66e2
	ld hl,0d70ah		;66e4
	ld (hl),a			;66e7
	ld de,0d71eh		;66e8
	call L_6695		;66eb
	ld de,0da6ch		;66ee
	exx			;66f1
	ld a,b			;66f2
	exx			;66f3
	jr L_6726		;66f4
L_66F6:
	call L_6686		;66f6
	ld bc,(0d70ah)		;66f9
	cp b			;66fd
	ret z			;66fe
	cp c			;66ff
	ret z			;6700
	push af			;6701
	ld hl,0d718h		;6702
	ld a,(0d70ah)		;6705
	inc a			;6708
	jr z,L_670E		;6709
	ld hl,0d71eh		;670b
L_670E:
	pop af			;670e
	ld b,006h		;670f
L_6711:
	cp (hl)			;6711
	inc hl			;6712
	ret z			;6713
	djnz L_6711		;6714
	ld hl,0d70bh		;6716
	ld (hl),a			;6719
	ld de,0d724h		;671a
	call L_6695		;671d
	ld de,0da77h		;6720
	exx			;6723
	ld a,b			;6724
	exx			;6725
L_6726:
	call L_6AFD		;6726
	ld bc,0daaeh		;6729
	add hl,bc			;672c
	ld bc,0000bh		;672d
	ldir		;6730
	ld a,027h		;6732
	jp 057ffh		;6734
L_6737:
	ld hl,0da6ch		;6737
	ld de,08020h		;673a
	ld a,(0d70ah)		;673d
	inc a			;6740
	jr nz,L_6746		;6741
	ld hl,06aabh		;6743
L_6746:
	call 0a651h		;6746
	ld hl,0da77h		;6749
	ld de,08038h		;674c
	ld a,(0d70bh)		;674f
	inc a			;6752
	jr nz,L_6758		;6753
	ld hl,06aabh		;6755
L_6758:
	call 0a651h		;6758
	call L_6874		;675b
	jp L_6800		;675e
L_6761:
	call L_6B5B		;6761
	dec b			;6764
	dec b			;6765
	jr z,L_6783		;6766
	ld de,0d70ch		;6768
	ld hl,0e340h		;676b
L_676E:
	ld a,(0d70ah)		;676e
	cp (hl)			;6771
	jr z,L_677A		;6772
	ld a,(0d70bh)		;6774
	cp (hl)			;6777
	jr nz,L_677D		;6778
L_677A:
	inc hl			;677a
	jr L_676E		;677b
L_677D:
	ld c,00fh		;677d
	ldi		;677f
	djnz L_676E		;6781
L_6783:
	ld de,0d70ah		;6783
	ld hl,0e340h		;6786
	call L_6B5B		;6789
	exx			;678c
	ld c,000h		;678d
	exx			;678f
L_6790:
	push hl			;6790
	push bc			;6791
	ld a,(de)			;6792
	cp (hl)			;6793
	jr z,L_67A7		;6794
	ld c,000h		;6796
L_6798:
	inc c			;6798
	inc hl			;6799
	cp (hl)			;679a
	jr nz,L_6798		;679b
	ld a,c			;679d
	exx			;679e
	ld b,a			;679f
	exx			;67a0
	call L_67BC		;67a1
	call L_67D5		;67a4
L_67A7:
	pop bc			;67a7
	pop hl			;67a8
	inc hl			;67a9
	inc de			;67aa
	exx			;67ab
	inc c			;67ac
	exx			;67ad
	djnz L_6790		;67ae
	ld hl,0da77h		;67b0
	ld de,0d740h		;67b3
	ld bc,0000bh		;67b6
	ldir		;67b9
	ret			;67bb
L_67BC:
	exx			;67bc
	ld a,c			;67bd
	add a,b			;67be
	ld b,a			;67bf
	push bc			;67c0
	ld hl,0e340h		;67c1
	ld d,h			;67c4
	ld e,l			;67c5
	call 04216h		;67c6
	ld a,c			;67c9
	call 0421bh		;67ca
	ld a,(de)			;67cd
	ld b,(hl)			;67ce
	ld (hl),a			;67cf
	ld a,b			;67d0
	ld (de),a			;67d1
	pop bc			;67d2
	exx			;67d3
	ret			;67d4
L_67D5:
	exx			;67d5
	push bc			;67d6
	ld a,b			;67d7
	call L_6B0A		;67d8
	ld bc,0d680h		;67db
	add hl,bc			;67de
	ex de,hl			;67df
	pop bc			;67e0
	push bc			;67e1
	ld a,c			;67e2
	call L_6B0A		;67e3
	ld bc,0d680h		;67e6
	add hl,bc			;67e9
	pop bc			;67ea
	ld b,00fh		;67eb
L_67ED:
	push bc			;67ed
	ld a,(de)			;67ee
	ld b,(hl)			;67ef
	ld (hl),a			;67f0
	ld a,b			;67f1
	ld (de),a			;67f2
	inc hl			;67f3
	inc de			;67f4
	pop bc			;67f5
	djnz L_67ED		;67f6
	exx			;67f8
	ret			;67f9
L_67FA:
	ld a,(0de06h)		;67fa
	and 020h		;67fd
	ret z			;67ff
L_6800:
	ld a,(0d759h)		;6800
	inc a			;6803
	cp 003h		;6804
	jr nz,L_6809		;6806
	xor a			;6808
L_6809:
	ld (0d759h),a		;6809
	ld a,026h		;680c
	call 057ffh		;680e
L_6811:
	ld hl,06594h		;6811
	call 04ea6h		;6814
	ld a,(0d759h)		;6817
	ld hl,06828h		;681a
	add a,a			;681d
	call 04216h		;681e
	ld e,(hl)			;6821
	inc hl			;6822
	ld d,(hl)			;6823
	ex de,hl			;6824
	jp 04ea6h		;6825

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6828..0x6846  (30 bytes)
DATA_6828:
	defb 02eh,068h,039h,068h,040h,068h,00ah,0c8h,0c4h,0b7h,0c1h,0b7h,0c2h,0bdh,0c0h,0c1h	; 6828  .h9h@h..........
	defb 0ffh,052h,0c8h,0b6h,0bdh,0bbh,0b3h,0ffh,082h,0c8h,0b3h,0bch,0b2h,0ffh	; 6838  .R............

; ======================================================================
; CODIGO 0x6846..0x689c  (86 bytes)
; ======================================================================


L_6846:
	ld a,(0de06h)		;6846
	and 010h		;6849
	ret nz			;684b
	ld hl,0d74fh		;684c
	ld a,(0de06h)		;684f
	rra			;6852
	jr c,L_6868		;6853
	rra			;6855
	jr nc,L_6882		;6856
	call L_6B5B		;6858
	ld a,b			;685b
	dec a			;685c
	cp (hl)			;685d
	jr z,L_6882		;685e
	inc (hl)			;6860
	ld a,026h		;6861
	call 057ffh		;6863
	jr L_6882		;6866
L_6868:
	ld a,(hl)			;6868
	or a			;6869
	jr z,L_6882		;686a
	dec (hl)			;686c
	ld a,026h		;686d
	call 057ffh		;686f
	jr L_6882		;6872
L_6874:
	call L_6B5B		;6874
	ld a,(0d74fh)		;6877
	inc a			;687a
	cp b			;687b
	jr c,L_687F		;687c
	xor a			;687e
L_687F:
	ld (0d74fh),a		;687f
L_6882:
	ld a,(0d74fh)		;6882
	ld hl,0689ch		;6885
	add a,a			;6888
	call 04216h		;6889
	ld a,(hl)			;688c
	inc hl			;688d
	ld e,(hl)			;688e
	ld hl,0f600h		;688f
	call 04ae3h		;6892
	ld a,e			;6895
	ld hl,0f601h		;6896
	jp 04ae3h		;6899

; ----------------------------------------------------------------------
; DATOS sin identificar  0x689c..0x68a8  (12 bytes)
DATA_689C:
	defb 06ch,040h,078h,040h,084h,040h,090h,040h,09ch,040h,0a8h,040h	; 689c  l@x@.@.@.@.@

; ======================================================================
; CODIGO 0x68a8..0x69ed  (325 bytes)
; ======================================================================


L_68A8:
	or a			;68a8
	jr nz,L_68B9		;68a9
	ld hl,0d718h		;68ab
	ld a,(0d70bh)		;68ae
	inc a			;68b1
	jr z,L_68C5		;68b2
	ld hl,0d724h		;68b4
	jr L_68C5		;68b7
L_68B9:
	ld hl,0d718h		;68b9
	ld a,(0d70ah)		;68bc
	inc a			;68bf
	jr z,L_68C5		;68c0
	ld hl,0d71eh		;68c2
L_68C5:
	ld (0e350h),hl		;68c5
	ld de,05c6ch		;68c8
	call L_6B5B		;68cb
	ld c,000h		;68ce
L_68D0:
	push de			;68d0
	push bc			;68d1
	ld hl,0d72ah		;68d2
	ld b,000h		;68d5
	add hl,bc			;68d7
	ld a,(hl)			;68d8
	call L_6AFD		;68d9
	ld bc,0daaeh		;68dc
	add hl,bc			;68df
	pop bc			;68e0
	push bc			;68e1
	call L_68EF		;68e2
	pop bc			;68e5
	inc c			;68e6
	pop de			;68e7
	ld a,e			;68e8
	add a,00ch		;68e9
	ld e,a			;68eb
	djnz L_68D0		;68ec
	ret			;68ee
L_68EF:
	exx			;68ef
	ld c,0a0h		;68f0
	ld hl,0d70ah		;68f2
	cp (hl)			;68f5
	jr z,L_6909		;68f6
	inc hl			;68f8
	cp (hl)			;68f9
	jr z,L_6909		;68fa
	ld hl,(0e350h)		;68fc
	ld b,006h		;68ff
L_6901:
	cp (hl)			;6901
	jr z,L_6909		;6902
	inc hl			;6904
	djnz L_6901		;6905
	ld c,000h		;6907
L_6909:
	ld a,c			;6909
	exx			;690a
	ld c,a			;690b
	ld b,00ah		;690c
L_690E:
	push bc			;690e
	call 09834h		;690f
	or a			;6912
	jr z,L_6916		;6913
	add a,c			;6915
L_6916:
	call 04f1ch		;6916
	ld a,d			;6919
	add a,008h		;691a
	ld d,a			;691c
	inc hl			;691d
	pop bc			;691e
	djnz L_690E		;691f
	ret			;6921
L_6922:
	ld hl,0d74fh		;6922
	ld a,(0d2b2h)		;6925
	dec a			;6928
	cp (hl)			;6929
	jr nz,L_6935		;692a
	xor a			;692c
	ld (0d751h),a		;692d
	ld (0d74fh),a		;6930
	jr L_69A3		;6933
L_6935:
	inc (hl)			;6935
	jr L_69A3		;6936
L_6938:
	ld a,(0d2b2h)		;6938
	ld (0e360h),a		;693b
	jr L_6948		;693e
L_6940:
	ld a,(0d2b2h)		;6940
	sub 006h		;6943
	ld (0e360h),a		;6945
L_6948:
	ld a,(0de06h)		;6948
	and 010h		;694b
	ret nz			;694d
	ld hl,0d74fh		;694e
	ld a,(0de06h)		;6951
	rra			;6954
	jr c,L_6993		;6955
	rra			;6957
	jr c,L_697F		;6958
	rra			;695a
	jr c,L_6973		;695b
	rra			;695d
	jr nc,L_69A3		;695e
	ld a,(hl)			;6960
	rra			;6961
	jr c,L_69A3		;6962
	ld a,(0e360h)		;6964
	dec a			;6967
	cp (hl)			;6968
	jr z,L_69A3		;6969
	inc (hl)			;696b
	ld a,026h		;696c
	call 057ffh		;696e
	jr L_69A3		;6971
L_6973:
	ld a,(hl)			;6973
	rra			;6974
	jr nc,L_69A3		;6975
	dec (hl)			;6977
	ld a,026h		;6978
	call 057ffh		;697a
	jr L_69A3		;697d
L_697F:
	ld a,(0e360h)		;697f
	dec a			;6982
	sub (hl)			;6983
	jr c,L_69A3		;6984
	cp 002h		;6986
	jr c,L_69A3		;6988
	inc (hl)			;698a
	inc (hl)			;698b
	ld a,026h		;698c
	call 057ffh		;698e
	jr L_69A3		;6991
L_6993:
	dec (hl)			;6993
	dec (hl)			;6994
	ld a,(hl)			;6995
	inc (hl)			;6996
	inc (hl)			;6997
	bit 7,a		;6998
	jr nz,L_69A3		;699a
	dec (hl)			;699c
	dec (hl)			;699d
	ld a,026h		;699e
	call 057ffh		;69a0
L_69A3:
	ld hl,0d751h		;69a3
	ld a,(0d74fh)		;69a6
	cp (hl)			;69a9
	jr nc,L_69B3		;69aa
	ld hl,0d751h		;69ac
	dec (hl)			;69af
	dec (hl)			;69b0
	jr L_69C3		;69b1
L_69B3:
	ld a,(0d751h)		;69b3
	ld hl,0d74fh		;69b6
	add a,00fh		;69b9
	cp (hl)			;69bb
	jr nc,L_69C3		;69bc
	ld hl,0d751h		;69be
	inc (hl)			;69c1
	inc (hl)			;69c2
L_69C3:
	ld a,(0d74fh)		;69c3
	ld hl,0d751h		;69c6
	sub (hl)			;69c9
	ld hl,069edh		;69ca
	add a,a			;69cd
	call 04216h		;69ce
	ld e,030h		;69d1
	ld a,(0e190h)		;69d3
	cp 003h		;69d6
	jr z,L_69DC		;69d8
	ld e,000h		;69da
L_69DC:
	ld a,(hl)			;69dc
	sub e			;69dd
	inc hl			;69de
	ld e,(hl)			;69df
L_69E0:
	ld hl,0f600h		;69e0
	call 04ae3h		;69e3
	ld a,e			;69e6
	ld hl,0f601h		;69e7
	jp 04ae3h		;69ea

; ----------------------------------------------------------------------
; DATOS sin identificar  0x69ed..0x6a0d  (32 bytes)
DATA_69ED:
	defb 060h,01ch,060h,084h,06ch,01ch,06ch,084h,078h,01ch,078h,084h,084h,01ch,084h,084h	; 69ed  `.`.l.l.x.x.....
	defb 090h,01ch,090h,084h,09ch,01ch,09ch,084h,0a8h,01ch,0a8h,084h,0b4h,01ch,0b4h,084h	; 69fd  ................

; ======================================================================
; CODIGO 0x6a0d..0x6aab  (158 bytes)
; ======================================================================


L_6A0D:
	ld bc,0daaeh		;6a0d
	push bc			;6a10
	jr L_6A17		;6a11
L_6A13:
	ld bc,0daf0h		;6a13
	push bc			;6a16
L_6A17:
	ld a,(0d751h)		;6a17
	ld (0d752h),a		;6a1a
	call L_6AFD		;6a1d
	pop bc			;6a20
	add hl,bc			;6a21
	ld de,02860h		;6a22
	ld a,(0e190h)		;6a25
	cp 003h		;6a28
	jr nz,L_6A2E		;6a2a
	ld e,030h		;6a2c
L_6A2E:
	ld b,008h		;6a2e
L_6A30:
	push bc			;6a30
	push de			;6a31
	push de			;6a32
	call L_6A5E		;6a33
	pop de			;6a36
	ld a,(hl)			;6a37
	cp 024h		;6a38
	jr z,L_6A51		;6a3a
	ld a,d			;6a3c
	add a,068h		;6a3d
	ld d,a			;6a3f
	call L_6A5E		;6a40
	pop de			;6a43
	ld a,(hl)			;6a44
	cp 024h		;6a45
	jr z,L_6A5C		;6a47
	ld a,e			;6a49
	add a,00ch		;6a4a
	ld e,a			;6a4c
	pop bc			;6a4d
	djnz L_6A30		;6a4e
	ret			;6a50
L_6A51:
	ld a,d			;6a51
	add a,068h		;6a52
	ld d,a			;6a54
	ld hl,06aabh		;6a55
	call L_6A5E		;6a58
	pop de			;6a5b
L_6A5C:
	pop bc			;6a5c
	ret			;6a5d
L_6A5E:
	ld (0e340h),hl		;6a5e
	xor a			;6a61
	ld (0e342h),a		;6a62
	ld hl,0d70ah		;6a65
	ld b,006h		;6a68
	ld a,(0d2b2h)		;6a6a
	cp 006h		;6a6d
	jr z,L_6A72		;6a6f
	sub b			;6a71
L_6A72:
	ld a,(0d752h)		;6a72
L_6A75:
	cp (hl)			;6a75
	jr nz,L_6A7E		;6a76
	ld hl,0e342h		;6a78
	inc (hl)			;6a7b
	jr L_6A81		;6a7c
L_6A7E:
	inc hl			;6a7e
	djnz L_6A75		;6a7f
L_6A81:
	ld hl,(0e340h)		;6a81
	ld b,00ah		;6a84
L_6A86:
	push bc			;6a86
	call 09834h		;6a87
	or a			;6a8a
	jr z,L_6A97		;6a8b
	ld c,a			;6a8d
	ld a,(0e342h)		;6a8e
	or a			;6a91
	ld a,c			;6a92
	jr z,L_6A97		;6a93
	add a,0a0h		;6a95
L_6A97:
	call 04f1ch		;6a97
	ld a,d			;6a9a
	add a,008h		;6a9b
	ld d,a			;6a9d
	inc hl			;6a9e
	pop bc			;6a9f
	djnz L_6A86		;6aa0
	inc hl			;6aa2
	ld a,(0d752h)		;6aa3
	inc a			;6aa6
	ld (0d752h),a		;6aa7
	ret			;6aaa

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6aab..0x6ab5  (10 bytes)
DATA_6AAB:
	defb 020h,020h,020h,020h,020h,020h,020h,020h,020h,020h	; 6aab

; ======================================================================
; CODIGO 0x6ab5..0x6bd8  (291 bytes)
; ======================================================================


L_6AB5:
	call L_6B5B		;6ab5
	ld hl,0d70ah		;6ab8
	ld a,(0d74fh)		;6abb
	push bc			;6abe
L_6ABF:
	cp (hl)			;6abf
	jr z,L_6AEA		;6ac0
	inc hl			;6ac2
	djnz L_6ABF		;6ac3
	pop bc			;6ac5
	ld c,a			;6ac6
	ld hl,0d70ah		;6ac7
	ld e,000h		;6aca
L_6ACC:
	ld a,(hl)			;6acc
	inc a			;6acd
	jr z,L_6AD5		;6ace
	inc e			;6ad0
	inc hl			;6ad1
	djnz L_6ACC		;6ad2
	ret			;6ad4
L_6AD5:
	ld (hl),c			;6ad5
	ld a,e			;6ad6
	call L_6AFD		;6ad7
	ld bc,0da6ch		;6ada
	add hl,bc			;6add
	ex de,hl			;6ade
	ld a,(0d74fh)		;6adf
	call L_6AEC		;6ae2
	ld hl,0da6bh		;6ae5
	inc (hl)			;6ae8
	ret			;6ae9
L_6AEA:
	pop bc			;6aea
	ret			;6aeb
L_6AEC:
	call L_6AFD		;6aec
	ld bc,0daaeh		;6aef
	add hl,bc			;6af2
	ld bc,0000bh		;6af3
	ldir		;6af6
	ld a,027h		;6af8
	jp 057ffh		;6afa
L_6AFD:
	ld l,a			;6afd
	ld h,000h		;6afe
	ld b,h			;6b00
	ld c,l			;6b01
	add hl,hl			;6b02
	add hl,bc			;6b03
	add hl,hl			;6b04
	add hl,hl			;6b05
	and a			;6b06
	sbc hl,bc		;6b07
	ret			;6b09
L_6B0A:
	ld l,a			;6b0a
	ld h,000h		;6b0b
	ld b,h			;6b0d
	ld c,l			;6b0e
	add hl,hl			;6b0f
	add hl,hl			;6b10
	add hl,hl			;6b11
	add hl,hl			;6b12
	and a			;6b13
	sbc hl,bc		;6b14
	ret			;6b16
L_6B17:
	ld ix,0d70ah		;6b17
	ld hl,0da6ch		;6b1b
	ld de,05810h		;6b1e
	ld b,006h		;6b21
L_6B23:
	push bc			;6b23
	push de			;6b24
	push hl			;6b25
	ld a,(ix+000h)		;6b26
	inc ix		;6b29
	inc a			;6b2b
	jr nz,L_6B31		;6b2c
	ld hl,06aabh		;6b2e
L_6B31:
	ld b,00ah		;6b31
L_6B33:
	push bc			;6b33
	call 09834h		;6b34
	call 04f1ch		;6b37
	ld a,d			;6b3a
	add a,008h		;6b3b
	ld d,a			;6b3d
	inc hl			;6b3e
	pop bc			;6b3f
	djnz L_6B33		;6b40
	pop hl			;6b42
	ld de,0000bh		;6b43
	add hl,de			;6b46
	pop de			;6b47
	ld a,e			;6b48
	add a,00ah		;6b49
	ld e,a			;6b4b
	pop bc			;6b4c
	djnz L_6B23		;6b4d
	ret			;6b4f
L_6B50:
	ld hl,0d6e1h		;6b50
	ld b,001h		;6b53
	ld de,07898h		;6b55
	jp 05bf1h		;6b58
L_6B5B:
	ld a,(0d6e1h)		;6b5b
	cp 001h		;6b5e
	jr nz,L_6B64		;6b60
	ld a,006h		;6b62
L_6B64:
	ld b,a			;6b64
	ret			;6b65
L_6B66:
	ld hl,0f600h		;6b66
	ld a,0e0h		;6b69
	call 04ae3h		;6b6b
L_6B6E:
	ld hl,02480h		;6b6e
	ld de,02480h		;6b71
	ld bc,0b030h		;6b74
	ld a,004h		;6b77
	call 04d66h		;6b79
	ld hl,02480h		;6b7c
	ld bc,0b030h		;6b7f
	xor a			;6b82
	ld d,000h		;6b83
	call 04d2ah		;6b85
	ld hl,02480h		;6b88
	ld c,00dh		;6b8b
	ld de,0ae2eh		;6b8d
	jp 04cfeh		;6b90
L_6B93:
	ld hl,02480h		;6b93
	ld de,02480h		;6b96
	ld bc,0b030h		;6b99
	ld a,001h		;6b9c
	jp 04d66h		;6b9e
L_6BA1:
	ld bc,00004h		;6ba1
	ld de,0e194h		;6ba4
	ld hl,06bd8h		;6ba7
	ldir		;6baa
	ld hl,0d680h		;6bac
	ld de,0d681h		;6baf
	ld (hl),000h		;6bb2
	ld bc,00059h		;6bb4
	ldir		;6bb7
	ld a,(0d753h)		;6bb9
	ld (0d6deh),a		;6bbc
	ld de,0d680h		;6bbf
	ld hl,0da6ch		;6bc2
	call L_6B5B		;6bc5
L_6BC8:
	push bc			;6bc8
	ld bc,0000bh		;6bc9
	ldir		;6bcc
	ex de,hl			;6bce
	ld bc,00004h		;6bcf
	add hl,bc			;6bd2
	ex de,hl			;6bd3
	pop bc			;6bd4
	djnz L_6BC8		;6bd5
	ret			;6bd7

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6bd8..0x6bdc  (4 bytes)
DATA_6BD8:
	defb 000h,001h,000h,002h	; 6bd8

; ======================================================================
; CODIGO 0x6bdc..0x6c31  (85 bytes)
; ======================================================================


L_6BDC:
	ld a,(0de06h)		;6bdc
	and 010h		;6bdf
	ret nz			;6be1
	call L_6B5B		;6be2
	dec b			;6be5
	ld hl,0d758h		;6be6
	ld a,(0de06h)		;6be9
	rra			;6bec
	jr c,L_6BF7		;6bed
	rra			;6bef
	ret nc			;6bf0
	ld a,(hl)			;6bf1
	cp b			;6bf2
	ret z			;6bf3
	inc (hl)			;6bf4
	jr L_6BFB		;6bf5
L_6BF7:
	ld a,(hl)			;6bf7
	and a			;6bf8
	ret z			;6bf9
	dec (hl)			;6bfa
L_6BFB:
	call L_6B5B		;6bfb
	push bc			;6bfe
	ld a,b			;6bff
	cp 006h		;6c00
	jr z,L_6C15		;6c02
	ld a,006h		;6c04
	sub b			;6c06
	ld c,b			;6c07
	ld b,a			;6c08
L_6C09:
	push bc			;6c09
	ld a,c			;6c0a
	call L_6C71		;6c0b
	pop bc			;6c0e
	inc c			;6c0f
	djnz L_6C09		;6c10
	call L_6B17		;6c12
L_6C15:
	ld hl,06c31h		;6c15
	call 04ea6h		;6c18
	pop bc			;6c1b
	ld de,04810h		;6c1c
	ld c,002h		;6c1f
L_6C21:
	ld a,c			;6c21
	push bc			;6c22
	push de			;6c23
	call 04f1ch		;6c24
	pop de			;6c27
	ld a,e			;6c28
	add a,00ah		;6c29
	ld e,a			;6c2b
	pop bc			;6c2c
	inc c			;6c2d
	djnz L_6C21		;6c2e
	ret			;6c30

; ----------------------------------------------------------------------
; DATOS texto_6C31: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p13:6C18 (24 bytes)
;   0x6c31..0x6c49  (24 bytes)
DATA_texto_6C31:
	defb 048h,010h,000h,0feh,048h,01ah,000h,0feh,048h,024h,000h,0feh,048h,02eh,000h,0feh	; 6c31  H...H...H$..H...
	defb 048h,038h,000h,0feh,048h,042h,000h,0ffh	; 6c41  H8..HB..

; ======================================================================
; CODIGO 0x6c49..0x6c68  (31 bytes)
; ======================================================================


L_6C49:
	ld a,(0d758h)		;6c49
	ld hl,06c68h		;6c4c
	call 04216h		;6c4f
	ld d,048h		;6c52
	ld e,(hl)			;6c54
	ld a,(0d758h)		;6c55
	inc a			;6c58
	add a,001h		;6c59
	ld c,a			;6c5b
	ld a,(0de03h)		;6c5c
	and 004h		;6c5f
	jr nz,L_6C64		;6c61
	ld c,a			;6c63
L_6C64:
	ld a,c			;6c64
	jp 04f1ch		;6c65

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6c68..0x6c6e  (6 bytes)
DATA_6C68:
	defb 010h,01ah,024h,02eh,038h,042h	; 6c68

; ======================================================================
; CODIGO 0x6c6e..0x6cb4  (70 bytes)
; ======================================================================


L_6C6E:
	ld a,(0d758h)		;6c6e
L_6C71:
	ld hl,0d70ah		;6c71
	call 04216h		;6c74
	ld a,(hl)			;6c77
	inc a			;6c78
	ret z			;6c79
	ld (hl),0ffh		;6c7a
	ld hl,0da6bh		;6c7c
	dec (hl)			;6c7f
	ret			;6c80
L_6C81:
	ld e,010h		;6c81
	jr L_6C87		;6c83
L_6C85:
	ld e,020h		;6c85
L_6C87:
	ld a,(0de06h)		;6c87
	and e			;6c8a
	ret z			;6c8b
	ld a,(0d759h)		;6c8c
	inc a			;6c8f
	cp 005h		;6c90
	jr nz,L_6C95		;6c92
	xor a			;6c94
L_6C95:
	ld (0d759h),a		;6c95
	ld a,026h		;6c98
	call 057ffh		;6c9a
L_6C9D:
	ld hl,06ce6h		;6c9d
	call 04ea6h		;6ca0
	ld a,(0d759h)		;6ca3
	ld hl,06cb4h		;6ca6
	add a,a			;6ca9
	call 04216h		;6caa
	ld e,(hl)			;6cad
	inc hl			;6cae
	ld d,(hl)			;6caf
	ex de,hl			;6cb0
	jp 04ea6h		;6cb1

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6cb4..0x6ce6  (50 bytes)
DATA_6CB4:
	defb 0beh,06ch,0c7h,06ch,0d8h,06ch,0e0h,06ch,0d0h,06ch,00ah,0c8h,0beh,0bah,0afh,0c7h	; 6cb4  .l.l.l.l.l......
	defb 0b3h,0c0h,0ffh,042h,0c8h,0c1h,0b3h,0bah,0b3h,0b1h,0c2h,0ffh,0d0h,0c8h,0b1h,0bah	; 6cc4  ...B............
	defb 0b3h,0afh,0c0h,0ffh,07ah,0c8h,0b1h,0bdh,0c3h,0bch,0c2h,0ffh,0aeh,0c8h,0b3h,0bch	; 6cd4  ....z...........
	defb 0b2h,0ffh	; 6ce4

; ----------------------------------------------------------------------
; DATOS texto_6CE6: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p13:6CA0 (40 bytes)
;   0x6ce6..0x6d0e  (40 bytes)
DATA_texto_6CE6:
	defb 00ah,0c8h,01eh,01ah,00fh,027h,013h,020h,0feh,042h,0c8h,021h,013h,01ah,013h,011h	; 6ce6  .....'. .B.!....
	defb 022h,0feh,0d0h,0c8h,011h,01ah,013h,00fh,020h,0feh,07ah,0c8h,011h,01dh,023h,01ch	; 6cf6  "....... .z...#.
	defb 022h,0feh,0aeh,0c8h,013h,01ch,012h,0ffh	; 6d06  ".......

; ======================================================================
; CODIGO 0x6d0e..0x6d14  (6 bytes)
; ======================================================================


L_6D0E:
	ld a,(0d2b0h)		;6d0e
	call 04220h		;6d11

; ----------------------------------------------------------------------
; DATOS tabla_6D14: 5 destinos del despachador p00:4220 (call en p13:6D11, el
;   indice en A): 6D1E, 6D41, 6D66, 6DAA, 6DEC; lo leen p13:6D11 (10 bytes)
;   0x6d14..0x6d1e  (10 bytes)
DATA_tabla_6D14:
	defw 06d1eh,06d41h,06d66h,06daah,06dech	; 6d14

; ======================================================================
; CODIGO 0x6d1e..0x6dfd  (223 bytes)
; ======================================================================


L_6D1E:
	ld a,(0dd8eh)		;6d1e
	cp 003h		;6d21
	jr z,L_6D31		;6d23
	ld (0dd8fh),a		;6d25
	xor a			;6d28
	ld (0d2b1h),a		;6d29
	call L_6D61		;6d2c
	jr L_6D53		;6d2f
L_6D31:
	call 0845bh		;6d31
	xor a			;6d34
	ld (0d2b1h),a		;6d35
	inc a			;6d38
	ld (0dd0ch),a		;6d39
	call 05d7dh		;6d3c
	jr L_6D61		;6d3f
L_6D41:
	ld a,(0de06h)		;6d41
	and 013h		;6d44
	ret z			;6d46
	bit 4,a		;6d47
	jp z,05d7dh		;6d49
	ld a,(0dd0ch)		;6d4c
	inc a			;6d4f
	ld (0dd8fh),a		;6d50
L_6D53:
	ld a,001h		;6d53
	call 057ffh		;6d55
	call 0ba66h		;6d58
	ld hl,07bddh		;6d5b
	call 04ea6h		;6d5e
L_6D61:
	ld hl,0d2b0h		;6d61
	inc (hl)			;6d64
	ret			;6d65
L_6D66:
	call 0814bh		;6d66
	ld a,(0d2b1h)		;6d69
	cp 002h		;6d6c
	jr z,L_6D88		;6d6e
	call 0ba66h		;6d70
	ld hl,07c22h		;6d73
	call 04ea6h		;6d76
	ld a,080h		;6d79
	ld (0d2e1h),a		;6d7b
	ld a,001h		;6d7e
	ld (0d2b1h),a		;6d80
	call L_6D61		;6d83
	jr L_6D61		;6d86
L_6D88:
	call L_6D8D		;6d88
	jr L_6D61		;6d8b
L_6D8D:
	call 0ba66h		;6d8d
	ld a,(0dd8fh)		;6d90
	dec a			;6d93
	ld hl,07beah		;6d94
	jr z,L_6D9C		;6d97
	ld hl,07c06h		;6d99
L_6D9C:
	call 04ea6h		;6d9c
	xor a			;6d9f
	ld (0d2b1h),a		;6da0
	inc a			;6da3
	ld (0dd0ch),a		;6da4
	jp 05d7dh		;6da7
L_6DAA:
	ld a,(0de06h)		;6daa
	and 013h		;6dad
	ret z			;6daf
	bit 4,a		;6db0
	jp z,05d7dh		;6db2
	ld a,(0dd8fh)		;6db5
	dec a			;6db8
	call z,L_6B93		;6db9
	ld a,(0dd0ch)		;6dbc
	dec a			;6dbf
	jr nz,L_6DC7		;6dc0
	call L_6DD6		;6dc2
	jr L_6D61		;6dc5
L_6DC7:
	xor a			;6dc7
	ld (0d2b1h),a		;6dc8
	ld a,002h		;6dcb
	ld (0d2b0h),a		;6dcd
	ld hl,07bddh		;6dd0
	jp 04ea6h		;6dd3
L_6DD6:
	ld a,(0dd8fh)		;6dd6
	dec a			;6dd9
	call z,L_6B93		;6dda
	call 0ba66h		;6ddd
	ld hl,07cfah		;6de0
	call 04ea6h		;6de3
	ld a,040h		;6de6
	ld (0d2e1h),a		;6de8
	ret			;6deb
L_6DEC:
	ld hl,0d2e1h		;6dec
	dec (hl)			;6def
	ret nz			;6df0
	ld a,001h		;6df1
	ld (0d2b1h),a		;6df3
	ret			;6df6
L_6DF7:
	ld a,(0d2b0h)		;6df7
	call 04220h		;6dfa

; ----------------------------------------------------------------------
; DATOS tabla_6DFD: 5 destinos del despachador p00:4220 (call en p13:6DFA, el
;   indice en A): 6E07, 6E20, 6E32, 6E75, 6EA4; lo leen p13:6DFA (10 bytes)
;   0x6dfd..0x6e07  (10 bytes)
DATA_tabla_6DFD:
	defw 06e07h,06e20h,06e32h,06e75h,06ea4h	; 6dfd

; ======================================================================
; CODIGO 0x6e07..0x6f7f  (376 bytes)
; ======================================================================


L_6E07:
	xor a			;6e07
	ld (0d2b1h),a		;6e08
	ld a,(0d68ah)		;6e0b
	cp 041h		;6e0e
	jr z,L_6E19		;6e10
	ld a,(0d74ah)		;6e12
	cp 041h		;6e15
	jr nz,L_6E1E		;6e17
L_6E19:
	ld a,001h		;6e19
	call 057ffh		;6e1b
L_6E1E:
	jr L_6E70		;6e1e
L_6E20:
	call 08000h		;6e20
	ld a,(0d2b1h)		;6e23
	cp 002h		;6e26
	jr nz,L_6E6C		;6e28
	call L_6D8D		;6e2a
	call L_6E70		;6e2d
	jr L_6E67		;6e30
L_6E32:
	call 08054h		;6e32
	ld a,(0d2b1h)		;6e35
	cp 002h		;6e38
	jr z,L_6E67		;6e3a
	ld a,001h		;6e3c
	ld (0d2b1h),a		;6e3e
	ld a,(0de02h)		;6e41
	bit 4,a		;6e44
	ret z			;6e46
	bit 5,a		;6e47
	ret nz			;6e49
	ld a,(0d6dch)		;6e4a
	rra			;6e4d
	ret nc			;6e4e
	ld hl,0d380h		;6e4f
	ld de,0d47fh		;6e52
	ld bc,000ffh		;6e55
L_6E58:
	push bc			;6e58
	ld c,(hl)			;6e59
	ld a,(de)			;6e5a
	ld (hl),a			;6e5b
	ld a,c			;6e5c
	ld (de),a			;6e5d
	inc hl			;6e5e
	inc de			;6e5f
	pop bc			;6e60
	dec bc			;6e61
	ld a,b			;6e62
	or c			;6e63
	jr nz,L_6E58		;6e64
	ret			;6e66
L_6E67:
	ld a,080h		;6e67
	ld (0d2e1h),a		;6e69
L_6E6C:
	xor a			;6e6c
	ld (0d2b1h),a		;6e6d
L_6E70:
	ld hl,0d2b0h		;6e70
	inc (hl)			;6e73
	ret			;6e74
L_6E75:
	ld a,(0de06h)		;6e75
	and 013h		;6e78
	ret z			;6e7a
	bit 4,a		;6e7b
	jp z,05d7dh		;6e7d
	call L_6B93		;6e80
	ld a,(0dd0ch)		;6e83
	dec a			;6e86
	jr nz,L_6E99		;6e87
	call 0ba66h		;6e89
	ld hl,07cfah		;6e8c
	call 04ea6h		;6e8f
	ld a,040h		;6e92
	ld (0d2e1h),a		;6e94
	jr L_6E70		;6e97
L_6E99:
	xor a			;6e99
	ld (0d2b1h),a		;6e9a
	ld a,(0e340h)		;6e9d
	ld (0d2b0h),a		;6ea0
	ret			;6ea3
L_6EA4:
	ld hl,0d2e1h		;6ea4
	dec (hl)			;6ea7
	ret nz			;6ea8
	ld a,002h		;6ea9
	ld (0d2b1h),a		;6eab
	ret			;6eae
L_6EAF:
	ld de,0d380h		;6eaf
	ld hl,0d680h		;6eb2
	jr L_6EBD		;6eb5
L_6EB7:
	ld de,0d47fh		;6eb7
	ld hl,0d740h		;6eba
L_6EBD:
	ld (0e340h),de		;6ebd
	ld c,000h		;6ec1
	push hl			;6ec3
	ld de,0daaeh		;6ec4
	ld b,00bh		;6ec7
L_6EC9:
	ld a,(de)			;6ec9
	cp (hl)			;6eca
	jr nz,L_6ED4		;6ecb
	inc hl			;6ecd
	inc de			;6ece
	djnz L_6EC9		;6ecf
	pop hl			;6ed1
	jr L_6F31		;6ed2
L_6ED4:
	pop hl			;6ed4
	push hl			;6ed5
	inc c			;6ed6
	ld de,0dab9h		;6ed7
	ld b,00bh		;6eda
L_6EDC:
	ld a,(de)			;6edc
	cp (hl)			;6edd
	jr nz,L_6EE7		;6ede
	inc hl			;6ee0
	inc de			;6ee1
	djnz L_6EDC		;6ee2
	pop hl			;6ee4
	jr L_6F31		;6ee5
L_6EE7:
	pop hl			;6ee7
	push hl			;6ee8
	inc c			;6ee9
	ld de,0dac4h		;6eea
	ld b,00bh		;6eed
L_6EEF:
	ld a,(de)			;6eef
	cp (hl)			;6ef0
	jr nz,L_6EFA		;6ef1
	inc hl			;6ef3
	inc de			;6ef4
	djnz L_6EEF		;6ef5
	pop hl			;6ef7
	jr L_6F31		;6ef8
L_6EFA:
	pop hl			;6efa
	push hl			;6efb
	inc c			;6efc
	ld de,0dacfh		;6efd
	ld b,00bh		;6f00
L_6F02:
	ld a,(de)			;6f02
	cp (hl)			;6f03
	jr nz,L_6F0D		;6f04
	inc hl			;6f06
	inc de			;6f07
	djnz L_6F02		;6f08
	pop hl			;6f0a
	jr L_6F31		;6f0b
L_6F0D:
	pop hl			;6f0d
	push hl			;6f0e
	inc c			;6f0f
	ld de,0dadah		;6f10
	ld b,00bh		;6f13
L_6F15:
	ld a,(de)			;6f15
	cp (hl)			;6f16
	jr nz,L_6F20		;6f17
	inc hl			;6f19
	inc de			;6f1a
	djnz L_6F15		;6f1b
	pop hl			;6f1d
	jr L_6F31		;6f1e
L_6F20:
	pop hl			;6f20
	push hl			;6f21
	inc c			;6f22
	ld de,0dae5h		;6f23
	ld b,00bh		;6f26
L_6F28:
	ld a,(de)			;6f28
	cp (hl)			;6f29
	jr nz,L_6F47		;6f2a
	inc hl			;6f2c
	inc de			;6f2d
	djnz L_6F28		;6f2e
	pop hl			;6f30
L_6F31:
	ld a,c			;6f31
	ld hl,0731fh		;6f32
	add a,a			;6f35
	call 04216h		;6f36
	ld e,(hl)			;6f39
	inc hl			;6f3a
	ld d,(hl)			;6f3b
	ex de,hl			;6f3c
	ld de,(0e340h)		;6f3d
	ld bc,000ffh		;6f41
	ldir		;6f44
	ret			;6f46
L_6F47:
	pop hl			;6f47
	push hl			;6f48
	ld de,0daf0h		;6f49
	ld bc,00b00h		;6f4c
L_6F4F:
	ld a,(de)			;6f4f
	cp (hl)			;6f50
	jr nz,L_6F5A		;6f51
	inc hl			;6f53
	inc de			;6f54
	djnz L_6F4F		;6f55
	pop hl			;6f57
	jr L_6F68		;6f58
L_6F5A:
	pop hl			;6f5a
	ld de,0dafbh		;6f5b
	inc c			;6f5e
	ld b,00bh		;6f5f
L_6F61:
	ld a,(de)			;6f61
	cp (hl)			;6f62
	ret nz			;6f63
	inc hl			;6f64
	inc de			;6f65
	djnz L_6F61		;6f66
L_6F68:
	ld hl,0d780h		;6f68
	ld d,c			;6f6b
	ld e,000h		;6f6c
	add hl,de			;6f6e
	ld de,(0e340h)		;6f6f
	ld bc,000ffh		;6f73
	ldir		;6f76
	ret			;6f78
L_6F79:
	ld a,(0d2b0h)		;6f79
	call 04220h		;6f7c

; ----------------------------------------------------------------------
; DATOS tabla_6F7F: 5 destinos del despachador p00:4220 (call en p13:6F7C, el
;   indice en A): 6F89, 6F97, 6FBE, 6FE8, 6FF3; lo leen p13:6F7C (10 bytes)
;   0x6f7f..0x6f89  (10 bytes)
DATA_tabla_6F7F:
	defw 06f89h,06f97h,06fbeh,06fe8h,06ff3h	; 6f7f

; ======================================================================
; CODIGO 0x6f89..0x7004  (123 bytes)
; ======================================================================


L_6F89:
	xor a			;6f89
	ld (0d2b1h),a		;6f8a
	ld a,001h		;6f8d
	call 057ffh		;6f8f
L_6F92:
	ld hl,0d2b0h		;6f92
	inc (hl)			;6f95
	ret			;6f96
L_6F97:
	call 080f4h		;6f97
	ld a,(0d2b1h)		;6f9a
	cp 002h		;6f9d
	jr nz,L_6FA6		;6f9f
	call L_6D8D		;6fa1
	jr L_6F92		;6fa4
L_6FA6:
	xor a			;6fa6
	ld (0d2b1h),a		;6fa7
	ld a,004h		;6faa
	ld (0d2b0h),a		;6fac
	call 0ba66h		;6faf
	ld hl,07c22h		;6fb2
	call 04ea6h		;6fb5
	ld a,0a0h		;6fb8
	ld (0d2e1h),a		;6fba
	ret			;6fbd
L_6FBE:
	ld a,(0de06h)		;6fbe
	and 013h		;6fc1
	ret z			;6fc3
	bit 4,a		;6fc4
	jp z,05d7dh		;6fc6
	ld a,(0dd0ch)		;6fc9
	dec a			;6fcc
	jr nz,L_6FDC		;6fcd
	xor a			;6fcf
	ld (0d2b1h),a		;6fd0
	call L_6DD6		;6fd3
	ld a,004h		;6fd6
	ld (0d2b0h),a		;6fd8
	ret			;6fdb
L_6FDC:
	ld a,(0dd8fh)		;6fdc
	dec a			;6fdf
	call z,L_6B93		;6fe0
	xor a			;6fe3
	ld (0d2b0h),a		;6fe4
	ret			;6fe7
L_6FE8:
	ld hl,0d2e1h		;6fe8
	dec (hl)			;6feb
	ret nz			;6fec
	ld a,002h		;6fed
	ld (0d2b1h),a		;6fef
	ret			;6ff2
L_6FF3:
	ld hl,0d2e1h		;6ff3
	dec (hl)			;6ff6
	ret nz			;6ff7
	ld a,001h		;6ff8
	ld (0d2b1h),a		;6ffa
	ret			;6ffd
L_6FFE:
	ld a,(0d2b0h)		;6ffe
	call 04220h		;7001

; ----------------------------------------------------------------------
; DATOS tabla_7004: 5 destinos del despachador p00:4220 (call en p13:7001, el
;   indice en A): 700E, 7025, 704B, 707E, 7089; lo leen p13:7001 (10 bytes)
;   0x7004..0x700e  (10 bytes)
DATA_tabla_7004:
	defw 0700eh,07025h,0704bh,0707eh,07089h	; 7004

; ======================================================================
; CODIGO 0x700e..0x713e  (304 bytes)
; ======================================================================


L_700E:
	xor a			;700e
	ld (0d2b1h),a		;700f
	ld a,001h		;7012
	call 057ffh		;7014
	call 0ba66h		;7017
	ld hl,07d41h		;701a
	call 04ea6h		;701d
L_7020:
	ld hl,0d2b0h		;7020
	inc (hl)			;7023
	ret			;7024
L_7025:
	call 080a8h		;7025
	ld a,(0d2b1h)		;7028
	cp 002h		;702b
	jr nz,L_7034		;702d
	call L_6D8D		;702f
	jr L_7020		;7032
L_7034:
	ld a,080h		;7034
	ld (0d2e1h),a		;7036
	xor a			;7039
	ld (0d2b1h),a		;703a
	ld a,003h		;703d
	ld (0d2b0h),a		;703f
	call 0ba66h		;7042
	ld hl,07d09h		;7045
	jp 04ea6h		;7048
L_704B:
	ld a,(0de06h)		;704b
	and 013h		;704e
	ret z			;7050
	bit 4,a		;7051
	jp z,05d7dh		;7053
	ld a,(0dd0ch)		;7056
	or a			;7059
	jr z,L_7072		;705a
	ld a,001h		;705c
	call 057ffh		;705e
	xor a			;7061
	ld (0d2b1h),a		;7062
	ld a,080h		;7065
	ld (0d2e1h),a		;7067
	ld a,004h		;706a
	ld (0d2b0h),a		;706c
	jp L_6DD6		;706f
L_7072:
	ld a,(0dd8fh)		;7072
	dec a			;7075
	call z,L_6B93		;7076
	xor a			;7079
	ld (0d2b0h),a		;707a
	ret			;707d
L_707E:
	ld hl,0d2e1h		;707e
	dec (hl)			;7081
	ret nz			;7082
	ld a,001h		;7083
	ld (0d2b1h),a		;7085
	ret			;7088
L_7089:
	ld hl,0d2e1h		;7089
	dec (hl)			;708c
	ret nz			;708d
	ld hl,00000h		;708e
	ld (0d74ch),hl		;7091
	ld a,002h		;7094
	ld (0d2b1h),a		;7096
	ret			;7099
L_709A:
	ld bc,00400h		;709a
	ld hl,0fcc1h		;709d
L_70A0:
	push bc			;70a0
	push hl			;70a1
	ld a,(hl)			;70a2
	bit 7,a		;70a3
	jr nz,L_70AD		;70a5
	ld a,c			;70a7
	call L_70CD		;70a8
	jr L_70B0		;70ab
L_70AD:
	call L_70BD		;70ad
L_70B0:
	pop hl			;70b0
	pop bc			;70b1
	ret c			;70b2
	inc hl			;70b3
	inc c			;70b4
	djnz L_70A0		;70b5
	ld a,0ffh		;70b7
	ld (0dd0eh),a		;70b9
	ret			;70bc
L_70BD:
	and 080h		;70bd
	or c			;70bf
	ld b,004h		;70c0
L_70C2:
	push bc			;70c2
	call L_70CD		;70c3
	pop bc			;70c6
	ret c			;70c7
	add a,004h		;70c8
	djnz L_70C2		;70ca
	ret			;70cc
L_70CD:
	ld (0dd0eh),a		;70cd
	ld hl,04010h		;70d0
	call 0000ch		;70d3   ; BIOS RDSLT - Reads the value of an address in another slot
	cp 059h		;70d6
	jr nz,L_70EC		;70d8
	ld hl,04011h		;70da
	ld a,(0dd0eh)		;70dd
	call 0000ch		;70e0   ; BIOS RDSLT - Reads the value of an address in another slot
	cp 05ah		;70e3
	jr nz,L_70EC		;70e5
	ld a,(0dd0eh)		;70e7
	scf			;70ea
	ret			;70eb
L_70EC:
	ld a,(0dd0eh)		;70ec
	and a			;70ef
	ret			;70f0
L_70F1:
	ld a,(0fd9ah)		;70f1
	ld (0d2a9h),a		;70f4
	ld a,0c9h		;70f7
	ld (0fd9ah),a		;70f9
	call L_727A		;70fc
	ld a,(0d2b2h)		;70ff
	cp 022h		;7102
	jp nc,L_7274		;7104
	ld bc,07164h		;7107
	ld hl,0d380h		;710a
	call L_71D4		;710d
	call 0839eh		;7110
	call L_721D		;7113
	ld a,(0d2a9h)		;7116
	ld (0fd9ah),a		;7119
	ret			;711c
L_711D:
	ld a,(0fd9ah)		;711d
	ld (0d2a9h),a		;7120
	ld a,0c9h		;7123
	ld (0fd9ah),a		;7125
	ld bc,07219h		;7128
	ld hl,0713eh		;712b
	ld de,0d280h		;712e
	call L_71B8		;7131
	call L_721D		;7134
	ld a,(0d2a9h)		;7137
	ld (0fd9ah),a		;713a
	ret			;713d

; ----------------------------------------------------------------------
; DATOS sin identificar  0x713e..0x7143  (5 bytes)
DATA_713E:
	defb 050h,045h,04eh,041h,04eh	; 713e

; ======================================================================
; CODIGO 0x7143..0x7164  (33 bytes)
; ======================================================================


L_7143:
	ld a,(0fd9ah)		;7143
	ld (0d2a9h),a		;7146
	ld a,0c9h		;7149
	ld (0fd9ah),a		;714b
	ld bc,07164h		;714e
	ld hl,0d680h		;7151
	ld de,0d280h		;7154
	call L_71B8		;7157
	call L_724C		;715a
	ld a,(0d2a9h)		;715d
	ld (0fd9ah),a		;7160
	ret			;7163

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7164..0x7168  (4 bytes)
DATA_7164:
	defb 080h,0d3h,0ffh,000h	; 7164

; ======================================================================
; CODIGO 0x7168..0x7189  (33 bytes)
; ======================================================================


L_7168:
	ld a,(0fd9ah)		;7168
	ld (0d2a9h),a		;716b
	ld a,0c9h		;716e
	ld (0fd9ah),a		;7170
	ld bc,07189h		;7173
	ld hl,0d740h		;7176
	ld de,0d280h		;7179
	call L_71B8		;717c
	call L_724C		;717f
	ld a,(0d2a9h)		;7182
	ld (0fd9ah),a		;7185
	ret			;7188

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7189..0x718d  (4 bytes)
DATA_7189:
	defb 07fh,0d4h,0ffh,000h	; 7189

; ======================================================================
; CODIGO 0x718d..0x7219  (140 bytes)
; ======================================================================


L_718D:
	ld a,(0fd9ah)		;718d
	ld (0d2a9h),a		;7190
	ld a,0c9h		;7193
	ld (0fd9ah),a		;7195
	ld bc,07219h		;7198
	ld hl,0713eh		;719b
	ld de,0d280h		;719e
	call L_71B8		;71a1
	call L_724C		;71a4
	ld hl,0d2b1h		;71a7
	ld a,(hl)			;71aa
	cp 002h		;71ab
	jr z,L_71B1		;71ad
	ld (hl),001h		;71af
L_71B1:
	ld a,(0d2a9h)		;71b1
	ld (0fd9ah),a		;71b4
	ret			;71b7
L_71B8:
	push bc			;71b8
	ld (0d2a5h),de		;71b9
	ld bc,00005h		;71bd
	ldir		;71c0
	xor a			;71c2
	ld b,008h		;71c3
L_71C5:
	ld (de),a			;71c5
	inc de			;71c6
	djnz L_71C5		;71c7
	pop hl			;71c9
	ld bc,00004h		;71ca
	ldir		;71cd
	ld a,(0d2aah)		;71cf
	ld (de),a			;71d2
	ret			;71d3
L_71D4:
	push bc			;71d4
	ld de,0d280h		;71d5
	ld (0d2a5h),de		;71d8
	push de			;71dc
	push hl			;71dd
	ld h,d			;71de
	ld l,e			;71df
	inc de			;71e0
	ld (hl),000h		;71e1
	ld bc,00005h		;71e3
	ldir		;71e6
	pop hl			;71e8
	pop de			;71e9
	ld bc,00b00h		;71ea
L_71ED:
	ld a,(hl)			;71ed
	or a			;71ee
	jr nz,L_71F5		;71ef
	inc hl			;71f1
	inc c			;71f2
	djnz L_71ED		;71f3
L_71F5:
	ld a,c			;71f5
	ld c,005h		;71f6
	cp 006h		;71f8
	jr c,L_7200		;71fa
	ld a,00bh		;71fc
	sub c			;71fe
	ld c,a			;71ff
L_7200:
	ld b,000h		;7200
	ldir		;7202
	ld de,0d285h		;7204
	xor a			;7207
	ld b,008h		;7208
L_720A:
	ld (de),a			;720a
	inc de			;720b
	djnz L_720A		;720c
	pop hl			;720e
	ld bc,00004h		;720f
	ldir		;7212
	ld a,(0d2aah)		;7214
	ld (de),a			;7217
	ret			;7218

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7219..0x721d  (4 bytes)
DATA_7219:
	defb 080h,0d6h,0cbh,000h	; 7219

; ======================================================================
; CODIGO 0x721d..0x731f  (258 bytes)
; ======================================================================


L_721D:
	ld de,(0d2a5h)		;721d
	ld b,001h		;7221
	ld a,(0dd0eh)		;7223
	ld h,080h		;7226
	call 00024h		;7228   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;722b
	ld (08000h),a		;722d
	ld c,00ah		;7230
	ld de,(0d2a5h)		;7232
	call 08000h		;7236
	push af			;7239
	ld a,(0d2aah)		;723a
	ld h,080h		;723d
	call 00024h		;723f   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;7242
	or a			;7243
	jr nz,L_7274		;7244
	ld a,001h		;7246
	ld (0d2b1h),a		;7248
	ret			;724b
L_724C:
	ld de,(0d2a5h)		;724c
	ld a,(0dd0eh)		;7250
	ld h,080h		;7253
	call 00024h		;7255   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;7258
	ld (08000h),a		;725a
	ld c,00bh		;725d
	ld de,(0d2a5h)		;725f
	call 08000h		;7263
	push af			;7266
	ld a,(0d2aah)		;7267
	ld h,080h		;726a
	call 00024h		;726c   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;726f
	and a			;7270
	jr nz,L_7274		;7271
	ret			;7273
L_7274:
	ld a,002h		;7274
	ld (0d2b1h),a		;7276
	ret			;7279
L_727A:
	di			;727a
	ld a,(0fd9fh)		;727b
	ld (0d2a9h),a		;727e
	ld a,0c9h		;7281
	ld (0fd9fh),a		;7283
	call 0843fh		;7286
	ld de,0d2b4h		;7289
	ld hl,0d2b3h		;728c
	ld bc,000cch		;728f
	ld (hl),000h		;7292
	ldir		;7294
	ld hl,0d28dh		;7296
	ld bc,0d2b3h		;7299
	ld (hl),c			;729c
	inc hl			;729d
	ld (hl),b			;729e
	ld de,0d280h		;729f
	ld (0d2a5h),de		;72a2
	ld a,(0dd0eh)		;72a6
	ld h,080h		;72a9
	call 00024h		;72ab   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;72ae
	ld (08000h),a		;72b0
	ld c,005h		;72b3
	ld de,(0d2a5h)		;72b5
	call 08000h		;72b9
	push af			;72bc
	ld a,(0d2aah)		;72bd
	ld h,080h		;72c0
	call 00024h		;72c2   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;72c5
	ld a,(0d2a9h)		;72c6
	ld (0fd9fh),a		;72c9
	ei			;72cc
	ld a,006h		;72cd
	ld (0d2b2h),a		;72cf
	ld de,0d2b3h		;72d2
L_72D5:
	ld a,(de)			;72d5
	or a			;72d6
	jr z,L_7316		;72d7
	push hl			;72d9
	push de			;72da
	ld hl,00006h		;72db
	add hl,de			;72de
	ld a,(hl)			;72df
	inc a			;72e0
	inc hl			;72e1
	ld a,(hl)			;72e2
	pop de			;72e3
	pop hl			;72e4
	jr nz,L_72EA		;72e5
	or a			;72e7
	jr z,L_72F1		;72e8
L_72EA:
	ld a,008h		;72ea
	call 0421bh		;72ec
	jr L_72D5		;72ef
L_72F1:
	ld hl,0d2b2h		;72f1
	inc (hl)			;72f4
	ld a,(hl)			;72f5
	dec a			;72f6
	call 08423h		;72f7
	ex de,hl			;72fa
	ld bc,00005h		;72fb
	ldir		;72fe
	ex de,hl			;7300
	ld b,005h		;7301
L_7303:
	ld (hl),020h		;7303
	inc hl			;7305
	djnz L_7303		;7306
	ld (hl),041h		;7308
	ld a,(0d2b2h)		;730a
	cp 022h		;730d
	jr nc,L_7316		;730f
	inc de			;7311
	inc de			;7312
	inc de			;7313
	jr L_72D5		;7314
L_7316:
	ld a,(0d2b2h)		;7316
	call 08423h		;7319
	ld (hl),024h		;731c
	ret			;731e

; ----------------------------------------------------------------------
; DATOS sin identificar  0x731f..0x7b48  (2089 bytes)
DATA_731F:
	defb 027h,077h,02bh,073h,02ah,074h,028h,076h,029h,075h,026h,078h,020h,017h,012h,013h	; 731f  'w+s*t(v)u&x ...
	defb 020h,021h,000h,000h,000h,000h,000h,042h,050h,031h,00eh,056h,000h,020h,003h,009h	; 732f   !.....BP1.V. ..
	defb 008h,000h,006h,00ah,007h,02eh,038h,03dh,000h,000h,000h,01ah,004h,002h,001h,002h	; 733f  ......8=........
	defb 002h,00ah,002h,034h,05ch,03ch,00ch,02bh,000h,020h,004h,003h,007h,004h,009h,008h	; 734f  ...4\<.+. ......
	defb 009h,042h,029h,052h,02ah,000h,000h,01ah,004h,004h,004h,005h,006h,009h,003h,03ch	; 735f  .B)R*..........<
	defb 04fh,02ah,000h,000h,000h,020h,004h,003h,005h,004h,003h,004h,007h,034h,00ch,02ah	; 736f  O*... .......4.*
	defb 038h,000h,000h,01ah,003h,00ah,001h,003h,001h,007h,006h,03eh,056h,034h,00ch,05ch	; 737f  8..........>V4.\
	defb 000h,020h,004h,005h,009h,002h,005h,008h,003h,042h,00ch,000h,042h,000h,000h,01ah	; 738f  . .......B..B...
	defb 003h,006h,005h,000h,00ah,009h,005h,02ch,050h,048h,040h,00eh,038h,020h,003h,006h	; 739f  .......,PH@.8 ..
	defb 008h,002h,003h,006h,006h,02ah,056h,03ch,051h,00eh,038h,01ah,003h,008h,001h,000h	; 73af  .....*V<Q.8.....
	defb 007h,005h,003h,044h,057h,04fh,02dh,000h,000h,020h,003h,005h,007h,002h,001h,005h	; 73bf  ...DWO-.. ......
	defb 007h,050h,030h,02dh,02bh,000h,000h,01ah,004h,001h,002h,002h,009h,007h,003h,044h	; 73cf  .P0-+..........D
	defb 05ah,02ah,033h,00ch,00eh,020h,023h,002h,007h,002h,002h,005h,006h,006h,006h,009h	; 73df  Z*3.. #.........
	defb 009h,009h,042h,00dh,050h,038h,00ch,02eh,01ah,012h,002h,004h,001h,003h,001h,00ah	; 73ef  ..B.P8..........
	defb 009h,003h,003h,00ah,001h,046h,02bh,030h,000h,000h,000h,020h,023h,002h,005h,001h	; 73ff  .....F+0... #...
	defb 003h,003h,006h,005h,002h,006h,006h,006h,044h,00ch,053h,035h,000h,000h,01ah,023h	; 740f  ........D.S5...#
	defb 002h,005h,006h,004h,007h,001h,004h,005h,003h,00ah,001h,019h,01dh,010h,013h,000h	; 741f  ................
	defb 01ah,017h,01ch,013h,021h,000h,053h,05fh,032h,02bh,000h,000h,01ah,003h,004h,001h	; 742f  ....!.S_2+......
	defb 000h,006h,006h,004h,048h,02eh,031h,00ch,000h,000h,020h,003h,005h,004h,000h,007h	; 743f  ....H.1... .....
	defb 006h,001h,029h,034h,04ch,000h,000h,000h,020h,003h,009h,001h,000h,00ah,004h,002h	; 744f  ..)4L... .......
	defb 02dh,02eh,04bh,03ch,000h,000h,01ah,003h,00ah,009h,002h,003h,003h,004h,038h,02eh	; 745f  -.K<..........8.
	defb 03ch,050h,000h,000h,01ah,003h,001h,004h,000h,009h,004h,007h,03eh,034h,041h,048h	; 746f  <P..........>4AH
	defb 04ch,000h,020h,003h,003h,002h,000h,009h,005h,001h,046h,00dh,00eh,029h,02ah,000h	; 747f  L. .......F..)*.
	defb 020h,002h,006h,00ah,000h,006h,005h,003h,02ah,038h,04ch,03ch,00ch,000h,01ah,002h	; 748f   .......*8L<....
	defb 009h,009h,000h,008h,002h,001h,042h,03dh,030h,047h,000h,000h,01ah,002h,00ah,00ah	; 749f  ......B=0G......
	defb 000h,008h,000h,005h,038h,051h,048h,000h,000h,000h,020h,003h,001h,006h,000h,004h	; 74af  ....8QH... .....
	defb 002h,009h,02dh,02bh,034h,00ch,000h,000h,020h,002h,008h,007h,000h,005h,003h,006h	; 74bf  ..-+4... .......
	defb 044h,02eh,02ch,000h,000h,000h,01ah,003h,005h,004h,000h,002h,003h,002h,033h,056h	; 74cf  D.,...........3V
	defb 041h,048h,04ch,000h,020h,012h,002h,004h,001h,003h,001h,005h,00ah,002h,00ah,00ah	; 74df  AHL. ...........
	defb 001h,03dh,000h,038h,00ch,000h,000h,020h,023h,002h,006h,006h,003h,009h,003h,004h	; 74ef  .=.8... #.......
	defb 005h,006h,004h,002h,04bh,03ch,047h,039h,000h,000h,020h,023h,002h,005h,001h,002h	; 74ff  ....K<G9.. #....
	defb 006h,004h,006h,001h,006h,003h,001h,035h,000h,047h,000h,000h,000h,01ah,023h,002h	; 750f  .......5.G....#.
	defb 006h,001h,003h,003h,007h,002h,009h,004h,00ah,00ah,01eh,020h,01dh,015h,020h,00fh	; 751f  ........... .. .
	defb 01bh,021h,000h,000h,000h,03eh,00eh,04bh,03eh,05fh,030h,01ah,003h,006h,006h,003h	; 752f  .!...>.K>_0.....
	defb 002h,006h,006h,052h,034h,00ch,035h,038h,000h,020h,004h,001h,003h,002h,004h,00ah	; 753f  ...R4.58. ......
	defb 001h,033h,044h,00ch,051h,039h,056h,020h,003h,00ah,00ah,003h,001h,005h,002h,02dh	; 754f  .3D.Q9V .......-
	defb 02bh,02ch,035h,000h,000h,01ah,003h,007h,001h,004h,005h,003h,004h,050h,038h,00eh	; 755f  +,5..........P8.
	defb 056h,000h,000h,020h,003h,005h,007h,004h,001h,004h,007h,029h,036h,056h,044h,00ch	; 756f  V.. .......)6VD.
	defb 051h,01ah,003h,005h,001h,002h,008h,007h,006h,050h,056h,030h,000h,000h,000h,01ah	; 757f  Q........PV0....
	defb 003h,008h,007h,002h,008h,002h,004h,034h,044h,03ch,000h,000h,000h,020h,003h,005h	; 758f  .......4D<... ..
	defb 008h,000h,007h,003h,006h,053h,02bh,03ch,00ch,000h,000h,020h,003h,007h,008h,002h	; 759f  .....S+<... ....
	defb 006h,006h,003h,02ah,056h,030h,000h,000h,000h,020h,003h,004h,009h,000h,00ah,008h	; 75af  ...*V0... ......
	defb 009h,029h,056h,03ch,00ch,02dh,029h,01ah,003h,008h,003h,002h,002h,007h,004h,032h	; 75bf  .)V<.-)........2
	defb 00eh,051h,000h,000h,000h,020h,003h,006h,001h,000h,005h,003h,00ah,034h,00ch,05ch	; 75cf  .Q... .......4.\
	defb 056h,044h,00dh,020h,023h,002h,007h,001h,002h,007h,007h,007h,007h,008h,002h,002h	; 75df  VD. #...........
	defb 050h,035h,03ch,029h,000h,000h,01ah,012h,002h,004h,006h,002h,004h,008h,00ah,001h	; 75ef  P5<)............
	defb 002h,007h,006h,045h,05fh,030h,035h,000h,000h,01ah,023h,002h,004h,006h,003h,004h	; 75ff  ...E_05...#.....
	defb 009h,003h,00ah,003h,006h,008h,032h,056h,045h,00dh,029h,000h,020h,023h,002h,005h	; 760f  ......2VE.). #..
	defb 001h,004h,002h,006h,005h,003h,006h,001h,001h,010h,020h,013h,01ch,012h,021h,000h	; 761f  .......... ...!.
	defb 000h,000h,000h,000h,029h,04ah,050h,02eh,056h,000h,020h,003h,001h,009h,002h,006h	; 762f  ....)JP.V. .....
	defb 005h,002h,04bh,000h,02eh,000h,000h,000h,01ah,003h,006h,005h,003h,008h,004h,003h	; 763f  ..K.............
	defb 02fh,050h,047h,056h,000h,000h,01ah,004h,003h,001h,004h,002h,002h,006h,044h,00ch	; 764f  /PGV..........D.
	defb 051h,047h,056h,000h,020h,004h,001h,004h,004h,00ah,000h,009h,02ch,035h,044h,00dh	; 765f  QGV. .......,5D.
	defb 052h,037h,020h,003h,00ah,009h,003h,006h,005h,005h,044h,00ch,04fh,034h,00ch,051h	; 766f  R7 .......D.O4.Q
	defb 020h,003h,007h,008h,002h,009h,008h,003h,02fh,00ch,05eh,030h,053h,000h,01ah,003h	; 767f   ......./.^0S...
	defb 005h,005h,002h,002h,004h,004h,045h,00dh,032h,000h,000h,000h,01ah,003h,004h,006h	; 768f  ......E.2.......
	defb 000h,007h,009h,003h,03bh,05fh,02eh,056h,041h,056h,020h,003h,003h,003h,002h,003h	; 769f  ....._.VAV .....
	defb 003h,002h,038h,00ch,034h,00ch,050h,056h,01ah,003h,002h,002h,002h,006h,004h,007h	; 76af  ..8.4.PV........
	defb 029h,051h,030h,00ch,052h,02ah,020h,002h,00ah,009h,002h,001h,005h,003h,02bh,00eh	; 76bf  )Q0.R* .......+.
	defb 053h,056h,000h,000h,01ah,003h,004h,003h,000h,008h,008h,00ah,044h,00dh,00eh,029h	; 76cf  SV..........D..)
	defb 051h,000h,020h,023h,002h,006h,001h,003h,002h,005h,00ah,003h,00ah,004h,009h,033h	; 76df  Q. #...........3
	defb 056h,03ch,035h,000h,000h,01ah,023h,002h,007h,001h,002h,002h,008h,008h,002h,004h	; 76ef  V<5...#.........
	defb 00ah,005h,031h,00ch,056h,047h,02ah,000h,020h,023h,002h,005h,006h,003h,001h,003h	; 76ff  ..1.VG*. #......
	defb 005h,004h,008h,008h,008h,04ch,049h,039h,05ch,000h,000h,020h,012h,002h,005h,001h	; 770f  .....LI9\.. ....
	defb 003h,008h,002h,006h,007h,00ah,006h,001h,014h,01ah,027h,013h,020h,021h,000h,000h	; 771f  ..........'. !..
	defb 000h,000h,000h,044h,057h,056h,03ch,049h,000h,020h,003h,009h,008h,003h,005h,00ah	; 772f  ...DWV<I. ......
	defb 00ah,043h,02ch,056h,000h,000h,000h,020h,003h,00ah,001h,004h,003h,009h,003h,03ch	; 773f  .C,V... .......<
	defb 049h,02fh,05ch,05fh,03ch,01ah,004h,005h,003h,004h,008h,008h,006h,036h,00ch,053h	; 774f  I/\_<........6.S
	defb 000h,000h,000h,020h,004h,004h,008h,006h,001h,006h,001h,02ah,00eh,030h,00ch,051h	; 775f  ... .......*.0.Q
	defb 000h,01ah,004h,001h,008h,005h,005h,007h,003h,042h,050h,029h,00eh,000h,000h,020h	; 776f  .........BP)...
	defb 004h,002h,001h,004h,001h,005h,005h,038h,02ah,02eh,00ch,00eh,000h,020h,003h,009h	; 777f  .......8*.... ..
	defb 004h,003h,00ah,008h,003h,035h,02eh,02ah,046h,00eh,030h,01ah,003h,007h,002h,004h	; 778f  .....5.*F.0.....
	defb 004h,007h,006h,04bh,035h,02fh,00eh,03ch,000h,01ah,003h,009h,005h,006h,002h,009h	; 779f  ...K5/.<........
	defb 002h,04fh,02ah,03bh,00ch,056h,000h,020h,003h,008h,006h,003h,007h,00ah,004h,029h	; 77af  .O*..V. .......)
	defb 051h,042h,03ch,053h,035h,020h,003h,008h,005h,004h,004h,009h,007h,044h,02dh,031h	; 77bf  QB<S5 .......D-1
	defb 02bh,051h,044h,01ah,003h,005h,009h,004h,006h,008h,001h,034h,03bh,00ch,056h,02eh	; 77cf  +QD........4..V.
	defb 02ah,020h,023h,002h,007h,001h,002h,004h,003h,005h,004h,00ah,00ah,00ah,048h,04fh	; 77df  * #...........HO
	defb 00eh,034h,00ch,05dh,01ah,023h,002h,006h,001h,003h,008h,00ah,008h,006h,004h,009h	; 77ef  .4.].#..........
	defb 002h,044h,05bh,05fh,02eh,00eh,000h,01ah,012h,002h,005h,001h,003h,007h,002h,005h	; 77ff  .D[_............
	defb 001h,00ah,00ah,002h,034h,05dh,048h,05fh,03ch,000h,020h,023h,002h,005h,001h,003h	; 780f  ....4]H_<. #....
	defb 007h,001h,002h,00ah,00ah,001h,00ah,012h,00fh,020h,019h,021h,000h,000h,000h,000h	; 781f  ......... .!....
	defb 000h,000h,02ah,054h,033h,02fh,000h,000h,020h,004h,001h,001h,002h,002h,009h,001h	; 782f  ..*T3/.. .......
	defb 047h,03ah,02ah,000h,000h,000h,020h,003h,003h,001h,000h,009h,004h,009h,034h,05eh	; 783f  G:*... .......4^
	defb 02bh,02eh,00ch,02fh,020h,003h,001h,002h,004h,003h,002h,003h,04bh,029h,02ah,000h	; 784f  +../ .......K)*.
	defb 000h,000h,01ah,004h,006h,005h,006h,001h,000h,003h,03dh,02eh,00ch,02ch,000h,000h	; 785f  ..........=..,..
	defb 020h,003h,008h,001h,003h,002h,003h,002h,039h,029h,02fh,000h,000h,000h,01ah,003h	; 786f   .......9)/.....
	defb 003h,005h,000h,006h,007h,006h,044h,030h,02ah,000h,000h,000h,020h,002h,00ah,00ah	; 787f  ......D0*... ...
	defb 000h,009h,003h,005h,048h,04eh,034h,000h,000h,000h,01ah,003h,002h,001h,002h,001h	; 788f  ....HN4.........
	defb 000h,00ah,03dh,02eh,00ch,038h,000h,000h,020h,003h,001h,001h,002h,003h,004h,003h	; 789f  ..=..8.. .......
	defb 02eh,048h,02dh,000h,000h,000h,01ah,002h,008h,006h,000h,008h,008h,002h,042h,000h	; 78af  .H-...........B.
	defb 051h,000h,000h,000h,020h,003h,001h,006h,000h,00ah,003h,006h,02dh,00eh,038h,000h	; 78bf  Q... .......-.8.
	defb 000h,000h,020h,003h,002h,002h,000h,005h,004h,005h,02dh,00eh,03ah,02eh,000h,000h	; 78cf  .. .......-.:...
	defb 020h,023h,002h,005h,001h,003h,005h,006h,008h,004h,00ah,002h,002h,02bh,02ch,042h	; 78df   #...........+,B
	defb 04fh,000h,000h,01ah,023h,002h,004h,001h,003h,002h,00ah,004h,007h,008h,008h,003h	; 78ef  O...#...........
	defb 029h,02eh,038h,00ch,000h,000h,020h,012h,002h,004h,001h,003h,008h,002h,002h,003h	; 78ff  ).8... .........
	defb 005h,007h,004h,033h,02fh,00ch,033h,02eh,000h,020h,023h,002h,007h,001h,003h,001h	; 790f  ...3/.3.. #.....
	defb 008h,00ah,00ah,004h,001h,001h,003h,002h,02ah,03eh,00bh,038h,079h,002h,02ah,042h	; 791f  ........*>.8y.*B
	defb 00bh,0e8h,079h,002h,02ah,046h,00bh,098h,07ah,0ffh,000h,0ffh,000h,0ffh,000h,0fch	; 792f  ..y.*F..z.......
	defb 003h,0f0h,00fh,0f0h,00fh,0e0h,01fh,0e0h,01fh,0ffh,000h,0ffh,000h,080h,07fh,000h	; 793f  ................
	defb 0ffh,07eh,0ffh,033h,0ffh,033h,0ffh,033h,0ffh,0ffh,000h,0ffh,000h,000h,0ffh,000h	; 794f  .~.3.3.3........
	defb 0ffh,078h,0ffh,030h,0ffh,030h,0ffh,030h,0ffh,0ffh,000h,000h,0ffh,000h,0ffh,000h	; 795f  .x.0.0.0........
	defb 0ffh,01ch,0ffh,026h,0ffh,026h,0ffh,026h,0ffh,0ffh,000h,000h,0ffh,000h,0ffh,000h	; 796f  ...&.&.&........
	defb 0ffh,0e7h,0ffh,042h,0ffh,066h,0ffh,024h,0ffh,0ffh,000h,000h,0ffh,000h,0ffh,000h	; 797f  ...B.f.$........
	defb 0ffh,007h,0ffh,003h,0ffh,003h,0ffh,003h,0ffh,0ffh,000h,000h,0ffh,000h,0ffh,000h	; 798f  ................
	defb 0ffh,0e1h,0ffh,032h,0ffh,032h,0ffh,032h,0ffh,0ffh,000h,000h,0ffh,000h,0ffh,000h	; 799f  ...2.2.2........
	defb 0ffh,0c7h,0ffh,063h,0ffh,063h,0ffh,063h,0ffh,0ffh,000h,0ffh,000h,000h,0ffh,000h	; 79af  ...c.c.c........
	defb 0ffh,08fh,0ffh,006h,0ffh,006h,0ffh,006h,0ffh,0ffh,000h,0ffh,000h,001h,0feh,000h	; 79bf  ................
	defb 0ffh,00fh,0ffh,00fh,0ffh,00fh,0ffh,00eh,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,03fh	; 79cf  ...............?
	defb 0c0h,00fh,0f0h,00fh,0f0h,007h,0f8h,007h,0f8h,0e0h,01fh,0e0h,01fh,0e0h,01fh,0f0h	; 79df  ................
	defb 00fh,0f0h,00fh,0fch,003h,0ffh,000h,0ffh,000h,03eh,0ffh,030h,0ffh,030h,0ffh,030h	; 79ef  .........>.0.0.0
	defb 0ffh,078h,0ffh,000h,0ffh,080h,07fh,0ffh,000h,030h,0ffh,030h,0ffh,032h,0ffh,032h	; 79ff  .x.......0.0.2.2
	defb 0ffh,07eh,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,026h,0ffh,03eh,0ffh,026h,0ffh,026h	; 7a0f  .~.......&.>.&.&
	defb 0ffh,067h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,03ch,0ffh,018h,0ffh,018h,0ffh,018h	; 7a1f  .g.......<......
	defb 0ffh,03ch,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,003h,0ffh,003h,0ffh,003h,0ffh,003h	; 7a2f  .<..............
	defb 0ffh,007h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0e2h,0ffh,033h,0ffh,032h,0ffh,032h	; 7a3f  ...........3.2.2
	defb 0ffh,0e6h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,063h,0ffh,0e3h,0ffh,063h,0ffh,063h	; 7a4f  .........c...c.c
	defb 0ffh,077h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,006h,0ffh,006h,0ffh,026h,0ffh,026h	; 7a5f  .w...........&.&
	defb 0ffh,0efh,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,00eh,0ffh,00ch,0ffh,040h,0ffh,05ch	; 7a6f  .............@.\
	defb 0ffh,0dch,0ffh,000h,0ffh,001h,0feh,0ffh,000h,007h,0f8h,007h,0f8h,007h,0f8h,00fh	; 7a7f  ................
	defb 0f0h,00fh,0f0h,03fh,0c0h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 7a8f  ...?............
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 7a9f  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 7aaf  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 7abf  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 7acf  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 7adf  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 7aef  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 7aff  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 7b0f  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 7b1f  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 7b2f  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 7b3f  .........

; ----------------------------------------------------------------------
; DATOS texto_7B48: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p03:A4F3 (27 bytes)
;   0x7b48..0x7b63  (27 bytes)
DATA_texto_7B48:
	defb 090h,0ach,062h,00dh,063h,064h,065h,00eh,055h,043h,03ch,050h,038h,00ch,031h,0feh	; 7b48  ..b.cde.UC<P8.1.
	defb 090h,0b8h,02ah,052h,03bh,030h,038h,00ch,033h,02ah,0ffh	; 7b58  ..*R.08.3*.

; ----------------------------------------------------------------------
; DATOS texto_7B63: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p14:9D1E (49 bytes)
;   0x7b63..0x7b94  (49 bytes)
DATA_texto_7B63:
	defb 050h,00ch,01bh,013h,01bh,010h,013h,020h,000h,011h,016h,00fh,01ch,015h,013h,0feh	; 7b63  P...... ........
	defb 048h,01ch,010h,00fh,022h,022h,013h,020h,000h,000h,080h,000h,08fh,000h,016h,020h	; 7b73  H..."". .......
	defb 0feh,048h,0a0h,01eh,017h,022h,011h,016h,013h,020h,0feh,086h,0a0h,08dh,08eh,08fh	; 7b83  .H..."... ......
	defb 0ffh	; 7b93

; ----------------------------------------------------------------------
; DATOS texto_7B94: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p01:648E (5 bytes)
;   0x7b94..0x7b99  (5 bytes)
DATA_texto_7B94:
	defb 0c8h,078h,001h,001h,0ffh	; 7b94

; ----------------------------------------------------------------------
; DATOS texto_7B99: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p03:B703 (33 bytes)
;   0x7b99..0x7bba  (33 bytes)
DATA_texto_7B99:
	defb 058h,034h,022h,013h,00fh,01bh,000h,013h,012h,017h,022h,055h,0feh,058h,040h,02dh	; 7b99  X4"......."U.X@-
	defb 054h,050h,047h,035h,02eh,0feh,068h,04ch,042h,02ah,0feh,068h,058h,02ah,02ah,02ch	; 7ba9  TPG5..hLB*.hX**,
	defb 0ffh	; 7bb9

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7bba..0x7bdd  (35 bytes)
DATA_7BBA:
	defb 058h,034h,022h,013h,00fh,01bh,000h,012h,00fh,022h,00fh,055h,0feh,058h,040h,021h	; 7bba  X4"......".U.X@!
	defb 00fh,024h,013h,034h,047h,035h,02eh,0feh,068h,04ch,042h,02ah,0feh,068h,058h,02ah	; 7bca  .$.4G5..hLB*.hX*
	defb 02ah,02ch,0ffh	; 7bda

; ----------------------------------------------------------------------
; DATOS texto_7BDD: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p00:48EC, p13:6D5E, p13:6DD3 (13 bytes)
;   0x7bdd..0x7bea  (13 bytes)
DATA_texto_7BDD:
	defb 058h,034h,021h,00fh,024h,013h,039h,05dh,02bh,03bh,00ch,035h,0ffh	; 7bdd  X4!.$.9]+..5.

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7bea..0x7c06  (28 bytes)
DATA_7BEA:
	defb 058h,034h,012h,017h,021h,019h,000h,013h,020h,020h,01dh,020h,0feh,068h,04ch,04bh	; 7bea  X4..!...  . .hLK
	defb 02bh,02ah,039h,03ch,00ch,0feh,068h,058h,02dh,054h,051h,0ffh	; 7bfa  +*9<..hX-TQ.

; ----------------------------------------------------------------------
; DATOS texto_7C06: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p03:BD41, p13:6D9C (28 bytes)
;   0x7c06..0x7c22  (28 bytes)
DATA_texto_7C06:
	defb 058h,034h,021h,020h,00fh,01bh,000h,013h,020h,020h,01dh,020h,0feh,068h,04ch,04bh	; 7c06  X4! ....  . .hLK
	defb 02bh,02ah,039h,03ch,00ch,0feh,068h,058h,02dh,054h,051h,0ffh	; 7c16  +*9<..hX-TQ.

; ----------------------------------------------------------------------
; DATOS texto_7C22: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p03:B9A7, p13:6D76, p13:6FB5 (17 bytes)
;   0x7c22..0x7c33  (17 bytes)
DATA_texto_7C22:
	defb 058h,034h,021h,00fh,024h,013h,000h,0feh,058h,040h,034h,05dh,02bh,050h,05eh,02bh	; 7c22  X4!.$...X@4]+P^+
	defb 0ffh	; 7c32

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7c33..0x7c79  (70 bytes)
DATA_7C33:
	defb 058h,034h,08dh,08eh,08fh,055h,035h,045h,00ch,03bh,0feh,058h,040h,06eh,063h,069h	; 7c33  X4...U5E...X@nci
	defb 034h,03bh,030h,038h,00ch,033h,02ah,0ffh,058h,034h,080h,08fh,055h,035h,045h,00ch	; 7c43  4.08.3*.X4..U5E.
	defb 03bh,0feh,058h,040h,06eh,063h,069h,034h,03bh,030h,038h,00ch,033h,02ah,0ffh,058h	; 7c53  ..X@nci4.08.3*.X
	defb 034h,064h,00eh,06dh,079h,00eh,06dh,055h,0feh,058h,040h,06eh,063h,069h,034h,03bh	; 7c63  4d.my.mU.X@nci4.
	defb 030h,038h,00ch,033h,02ah,0ffh	; 7c73

; ----------------------------------------------------------------------
; DATOS texto_7C79: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p00:480C (17 bytes)
;   0x7c79..0x7c8a  (17 bytes)
DATA_texto_7C79:
	defb 048h,0b0h,01eh,023h,021h,016h,000h,021h,01eh,00fh,011h,013h,000h,019h,013h,027h	; 7c79  H..#!..!.......'
	defb 0ffh	; 7c89

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7c8a..0x7ca8  (30 bytes)
DATA_7C8A:
	defb 050h,0b8h,06eh,00eh,076h,00ch,034h,03bh,000h,02dh,054h,051h,0feh,050h,0c8h,066h	; 7c8a  P.n.v.4..-TQ.P.f
	defb 00dh,067h,068h,069h,06ah,00eh,06bh,055h,03ah,03ah,00ch,031h,051h,0ffh	; 7c9a  .ghij.kU::.1Q.

; ----------------------------------------------------------------------
; DATOS texto_7CA8: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p00:4848 (17 bytes)
;   0x7ca8..0x7cb9  (17 bytes)
DATA_texto_7CA8:
	defb 048h,0b8h,01eh,023h,021h,016h,000h,021h,01eh,00fh,011h,013h,000h,019h,013h,027h	; 7ca8  H..#!..!.......'
	defb 0ffh	; 7cb8

; ----------------------------------------------------------------------
; DATOS texto_7CB9: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p00:4863 (15 bytes)
;   0x7cb9..0x7cc8  (15 bytes)
DATA_texto_7CB9:
	defb 048h,0b8h,01eh,023h,021h,016h,000h,000h,014h,002h,000h,019h,013h,027h,0ffh	; 7cb9  H..#!........'.

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7cc8..0x7cd1  (9 bytes)
DATA_7CC8:
	defb 058h,0ach,02dh,054h,051h,0ffh,0ffh,0ffh,0ffh	; 7cc8  X.-TQ....

; ----------------------------------------------------------------------
; DATOS texto_7CD1: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p00:47EA (30 bytes)
;   0x7cd1..0x7cef  (30 bytes)
DATA_texto_7CD1:
	defb 018h,060h,080h,000h,081h,0feh,018h,06ch,082h,000h,080h,0feh,018h,078h,083h,084h	; 7cd1  .`.....l.....x..
	defb 080h,0feh,018h,084h,085h,000h,086h,0feh,018h,090h,087h,088h,089h,0ffh	; 7ce1  ..............

; ----------------------------------------------------------------------
; DATOS texto_7CEF: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p13:632C (11 bytes)
;   0x7cef..0x7cfa  (11 bytes)
DATA_texto_7CEF:
	defb 054h,088h,076h,00dh,06ah,077h,078h,00eh,000h,081h,0ffh	; 7cef  T.v.jwx....

; ----------------------------------------------------------------------
; DATOS texto_7CFA: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p13:6DE3, p13:6E8F (15 bytes)
;   0x7cfa..0x7d09  (15 bytes)
DATA_texto_7CFA:
	defb 058h,034h,034h,05dh,02bh,050h,05eh,02bh,0feh,058h,040h,034h,047h,035h,0ffh	; 7cfa  X44]+P^+.X@4G5.

; ----------------------------------------------------------------------
; DATOS texto_7D09: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p13:7048 (16 bytes)
;   0x7d09..0x7d19  (16 bytes)
DATA_texto_7D09:
	defb 058h,034h,01ah,01dh,00fh,012h,0feh,058h,040h,034h,05dh,02bh,050h,05eh,02bh,0ffh	; 7d09  X4.....X@4]+P^+.

; ----------------------------------------------------------------------
; DATOS texto_7D19: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p13:607E (28 bytes)
;   0x7d19..0x7d35  (28 bytes)
DATA_texto_7D19:
	defb 058h,034h,06fh,068h,071h,073h,070h,074h,00eh,041h,0feh,058h,040h,071h,00ch,00eh	; 7d19  X4ohqspt.A.X@q..
	defb 072h,02eh,00ch,0feh,058h,04ch,029h,050h,047h,036h,056h,0ffh	; 7d29  r...XL)PG6V.

; ----------------------------------------------------------------------
; DATOS texto_7D35: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p14:973A (12 bytes)
;   0x7d35..0x7d41  (12 bytes)
DATA_texto_7D35:
	defb 058h,00ch,093h,0feh,088h,00ch,097h,0feh,092h,00ch,07fh,0ffh	; 7d35  X...........

; ----------------------------------------------------------------------
; DATOS texto_7D41: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p13:701D (13 bytes)
;   0x7d41..0x7d4e  (13 bytes)
DATA_texto_7D41:
	defb 058h,034h,01ah,01dh,00fh,012h,039h,05dh,02bh,03bh,00ch,035h,0ffh	; 7d41  X4....9]+..5.

; ----------------------------------------------------------------------
; DATOS texto_7D4E: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p03:BC7F (20 bytes)
;   0x7d4e..0x7d62  (20 bytes)
DATA_texto_7D4E:
	defb 058h,034h,064h,00eh,06dh,071h,00ch,00eh,072h,02eh,00ch,0feh,058h,040h,029h,050h	; 7d4e  X4d.mq..r...X@)P
	defb 047h,036h,056h,0ffh	; 7d5e

; ----------------------------------------------------------------------
; DATOS texto_7D62: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p03:A4C1 (27 bytes)
;   0x7d62..0x7d7d  (27 bytes)
DATA_texto_7D62:
	defb 018h,0ach,062h,00dh,063h,064h,065h,00eh,055h,043h,03ch,050h,038h,00ch,031h,0feh	; 7d62  ..b.cde.UC<P8.1.
	defb 018h,0b8h,02ah,052h,03bh,030h,038h,00ch,033h,02ah,0ffh	; 7d72  ..*R.08.3*.

; ----------------------------------------------------------------------
; DATOS texto_7D7D: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p14:8466 (18 bytes)
;   0x7d7d..0x7d8f  (18 bytes)
DATA_texto_7D7D:
	defb 058h,034h,03ch,00ch,032h,03eh,0feh,058h,040h,06eh,00eh,076h,00ch,034h,047h,035h	; 7d7d  X4<.2>.X@n.v.4G5
	defb 02eh,0ffh	; 7d8d

; ----------------------------------------------------------------------
; DATOS texto_7D8F: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p01:6546 (26 bytes)
;   0x7d8f..0x7da9  (26 bytes)
DATA_texto_7D8F:
	defb 050h,050h,00bh,019h,01dh,01ch,00fh,01bh,017h,000h,000h,002h,00ah,009h,009h,0feh	; 7d8f  PP..............
	defb 028h,070h,002h,01eh,01ah,00fh,027h,013h,020h,0ffh	; 7d9f  (p....'. .

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7da9..0x7dd2  (41 bytes)
DATA_7DA9:
	defb 028h,080h,003h,01eh,01ah,00fh,027h,013h,020h,021h,0ffh,028h,090h,01eh,013h,01ch	; 7da9  (.....'. !.(....
	defb 01ch,00fh,01ch,022h,0ffh,028h,0a0h,022h,013h,00fh,01bh,000h,013h,012h,017h,022h	; 7db9  ...".(."......."
	defb 0ffh,028h,0b0h,025h,00fh,022h,011h,016h,0ffh	; 7dc9  .(.%."...

; ----------------------------------------------------------------------
; DATOS texto_7DD2: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p00:4577, p01:655E, p00:457A (15 bytes)
;   0x7dd2..0x7de1  (15 bytes)
DATA_texto_7DD2:
	defb 028h,0c0h,01bh,013h,012h,017h,00fh,000h,021h,013h,01ah,013h,011h,022h,0ffh	; 7dd2  (.......!....".

; ----------------------------------------------------------------------
; DATOS texto_7DE1: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p15:AA5D (22 bytes)
;   0x7de1..0x7df7  (22 bytes)
DATA_texto_7DE1:
	defb 038h,078h,01bh,013h,012h,017h,00fh,0feh,030h,090h,012h,017h,021h,019h,0feh,030h	; 7de1  8x......0...!..0
	defb 0a0h,021h,020h,00fh,01bh,0ffh	; 7df1

; ----------------------------------------------------------------------
; DATOS texto_7DF7: texto (p00:4EB5, con 13-14-15 puesto por p00:439C):
;   caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es medio
;   espacio; lo leen p01:65BB, p03:BD01, p15:AACC (2 bytes)
;   0x7df7..0x7df9  (2 bytes)
DATA_texto_7DF7:
	defb 09ah,0ffh	; 7df7

; ----------------------------------------------------------------------
; DATOS texto_7DF9: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p01:61AB (12 bytes)
;   0x7df9..0x7e05  (12 bytes)
DATA_texto_7DF9:
	defb 05ch,028h,014h,01dh,023h,020h,000h,010h,00fh,01ah,01ah,0ffh	; 7df9  \(..# ......

; ----------------------------------------------------------------------
; DATOS texto_7E05: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p02:8AB2 (12 bytes)
;   0x7e05..0x7e11  (12 bytes)
DATA_texto_7E05:
	defb 05ch,028h,012h,013h,00fh,012h,000h,010h,00fh,01ah,01ah,0ffh	; 7e05  \(..........

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7e11..0x7e1e  (13 bytes)
DATA_7E11:
	defb 058h,058h,015h,00fh,01bh,013h,000h,000h,01dh,024h,013h,020h,0ffh	; 7e11  XX.......$. .

; ----------------------------------------------------------------------
; DATOS texto_7E1E: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p01:63F9 (38 bytes)
;   0x7e1e..0x7e44  (38 bytes)
DATA_texto_7E1E:
	defb 010h,078h,021h,0feh,010h,080h,010h,0feh,010h,088h,01dh,0feh,0d8h,078h,097h,0feh	; 7e1e  .x!..........x..
	defb 0cch,0b0h,09bh,09ch,0feh,0cch,0b8h,080h,08fh,0feh,008h,0a8h,01eh,0feh,020h,0b0h	; 7e2e  .............. .
	defb 090h,0feh,028h,0b8h,092h,0ffh	; 7e3e

; ----------------------------------------------------------------------
; DATOS texto_7E44: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p01:64F7 (5 bytes)
;   0x7e44..0x7e49  (5 bytes)
DATA_texto_7E44:
	defb 084h,070h,095h,096h,0ffh	; 7e44

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7e49..0x7e4e  (5 bytes)
DATA_7E49:
	defb 0e0h,078h,098h,099h,0ffh	; 7e49

; ----------------------------------------------------------------------
; DATOS texto_7E4E: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p01:644E (5 bytes)
;   0x7e4e..0x7e53  (5 bytes)
DATA_texto_7E4E:
	defb 0e0h,078h,060h,061h,0ffh	; 7e4e

; ----------------------------------------------------------------------
; DATOS texto_7E53: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p01:650B (7 bytes)
;   0x7e53..0x7e5a  (7 bytes)
DATA_texto_7E53:
	defb 070h,088h,014h,01dh,023h,01ah,0ffh	; 7e53

; ----------------------------------------------------------------------
; DATOS texto_7E5A: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p14:93FE (7 bytes)
;   0x7e5a..0x7e61  (7 bytes)
DATA_texto_7E5A:
	defb 070h,0f0h,014h,01dh,023h,01ah,0ffh	; 7e5a

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7e61..0x7e69  (8 bytes)
DATA_7E61:
	defb 013h,01ch,022h,017h,022h,01ah,013h,0ffh	; 7e61  .."."...

; ----------------------------------------------------------------------
; DATOS texto_7E69: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p01:7014, p02:8FDE, p03:B12D (8 bytes)
;   0x7e69..0x7e71  (8 bytes)
DATA_texto_7E69:
	defb 070h,0f0h,0fdh,01dh,023h,022h,0fdh,0ffh	; 7e69  p...#"..

; ----------------------------------------------------------------------
; DATOS texto_7E71: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p03:B104 (7 bytes)
;   0x7e71..0x7e78  (7 bytes)
DATA_texto_7E71:
	defb 070h,0f0h,021h,00fh,014h,013h,0ffh	; 7e71

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7e78..0x7e86  (14 bytes)
DATA_7E78:
	defb 048h,008h,022h,013h,00fh,01bh,000h,021h,013h,01ah,013h,011h,022h,0ffh	; 7e78  H."....!....".

; ----------------------------------------------------------------------
; DATOS texto_7E86: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p03:A323 (37 bytes)
;   0x7e86..0x7eab  (37 bytes)
DATA_texto_7E86:
	defb 044h,008h,021h,022h,00fh,020h,022h,017h,01ch,015h,000h,01ah,017h,01ch,013h,00eh	; 7e86  D.!". ".........
	defb 023h,01eh,0feh,050h,020h,080h,000h,08fh,000h,016h,020h,0feh,0c8h,020h,080h,000h	; 7e96  #..P ..... .. ..
	defb 08fh,000h,016h,020h,0ffh	; 7ea6

; ----------------------------------------------------------------------
; DATOS texto_7EAB: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p01:6A21 (11 bytes)
;   0x7eab..0x7eb6  (11 bytes)
DATA_texto_7EAB:
	defb 0e0h,0b8h,002h,006h,001h,0feh,0e4h,0b0h,000h,001h,0ffh	; 7eab  ...........

; ----------------------------------------------------------------------
; DATOS texto_7EB6: texto (p00:4EB5, con 13-14-15 puesto por p00:439C):
;   caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es medio
;   espacio; lo leen p03:A261 (7 bytes)
;   0x7eb6..0x7ebd  (7 bytes)
DATA_texto_7EB6:
	defb 002h,006h,001h,000h,000h,001h,0ffh	; 7eb6

; ----------------------------------------------------------------------
; DATOS texto_7EBD: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p01:64A2 (9 bytes)
;   0x7ebd..0x7ec6  (9 bytes)
DATA_texto_7EBD:
	defb 06ch,070h,0fdh,022h,017h,01bh,013h,0fdh,0ffh	; 7ebd  lp.".....

; ----------------------------------------------------------------------
; DATOS texto_7EC6: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p03:BA8E (143 bytes)
;   0x7ec6..0x7f55  (143 bytes)
DATA_texto_7EC6:
	defb 05ch,000h,022h,013h,00fh,01bh,000h,013h,012h,017h,022h,0feh,024h,00ch,022h,013h	; 7ec6  \.".......".$.".
	defb 00fh,01bh,000h,01ch,00fh,01bh,013h,0feh,030h,020h,01ch,00fh,01bh,013h,000h,000h	; 7ed6  ........0 ......
	defb 01ah,020h,000h,000h,000h,080h,000h,08fh,000h,000h,016h,020h,000h,000h,020h,023h	; 7ee6  . ......... .. #
	defb 01ch,0feh,008h,028h,010h,00fh,0feh,008h,0a4h,01eh,017h,0feh,030h,09ch,01ch,00fh	; 7ef6  ...(........0...
	defb 01bh,013h,000h,000h,01ah,020h,0feh,074h,09ch,021h,01eh,012h,0feh,090h,09ch,08dh	; 7f06  ..... .t.!......
	defb 08eh,08fh,0feh,0ach,09ch,021h,022h,01bh,0feh,0d0h,09ch,011h,000h,021h,000h,014h	; 7f16  .....!"......!..
	defb 0feh,080h,08bh,002h,008h,001h,001h,0feh,0a8h,08bh,003h,001h,001h,0feh,0cch,08bh	; 7f26  ................
	defb 007h,001h,001h,0feh,074h,0c7h,006h,005h,001h,0feh,090h,0c7h,00ah,00ah,001h,0feh	; 7f36  ....t...........
	defb 0ach,0c7h,003h,001h,001h,0feh,0c8h,0c7h,003h,006h,003h,006h,003h,006h,0ffh	; 7f46  ...............

; ----------------------------------------------------------------------
; DATOS texto_7F55: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p02:9ECC (27 bytes)
;   0x7f55..0x7f70  (27 bytes)
DATA_texto_7F55:
	defb 058h,054h,036h,056h,042h,00dh,03ah,000h,062h,00dh,063h,064h,065h,00eh,0feh,04eh	; 7f55  XT6VB.:.b.cde..N
	defb 074h,08dh,08eh,08fh,0feh,0c6h,074h,08dh,08eh,08fh,0ffh	; 7f65  t.....t....

; ----------------------------------------------------------------------
; DATOS relleno_ff: 144 bytes a 0xFF hasta el final del banco: relleno; lo
;   leen nadie (144 bytes)
;   0x7f70..0x8000  (144 bytes)
DATA_relleno_ff:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 7f70  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 7f80  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 7f90  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 7fa0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 7fb0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 7fc0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 7fd0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 7fe0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 7ff0  ................
