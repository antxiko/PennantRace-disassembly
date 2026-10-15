; ==========================================================================
; THE PRO YAKYUU GEKITOTSU PENNANT RACE - Konami (1988) - MSX2 - MegaROM RC-757 de 128 KB (Konami SCC) - banco 03 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS partida_A000: los 2 ultimos bytes de la instruccion de p02:9FFF (11 04
;   00), que empieza en el banco 2; lo leen p02:9FFF (2 bytes)
;   0xa000..0xa002  (2 bytes)
DATA_partida_A000:
	defb 004h,000h	; a000

; ======================================================================
; CODIGO 0xa002..0xa2bc  (698 bytes)
; ======================================================================


L_A002:
	ld b,004h		;a002
L_A004:
	ld (hl),000h		;a004
	add hl,de			;a006
	djnz L_A004		;a007
	jp 05b1fh		;a009
L_A00C:
	ld a,b			;a00c
	and 020h		;a00d
	jr z,L_A023		;a00f
	call L_A4F6		;a011
	ld bc,0090ah		;a014
	call L_A0C6		;a017
	ld hl,0e304h		;a01a
	inc (hl)			;a01d
	ld a,027h		;a01e
	jp 057ffh		;a020   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_A023:
	ld a,(0e19ch)		;a023
	ld b,0ffh		;a026
	rra			;a028
	jr c,L_A02F		;a029
	ld b,001h		;a02b
	rra			;a02d
	ret nc			;a02e
L_A02F:
	ld hl,0e30dh		;a02f
	ld a,b			;a032
	add a,(hl)			;a033
	cp 0ffh		;a034
	ld b,008h		;a036
	jr z,L_A041		;a038
	cp 009h		;a03a
	ld b,000h		;a03c
	jr z,L_A041		;a03e
	ld b,a			;a040
L_A041:
	ld (hl),b			;a041
	ld a,026h		;a042
	jp 057ffh		;a044   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_A047:
	ld a,(0e19ch)		;a047
	and 020h		;a04a
	jp z,L_A09D		;a04c
	ld bc,00a09h		;a04f
	call L_A0C6		;a052
	ld a,027h		;a055
	call 057ffh		;a057   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	ld a,(0e30dh)		;a05a
	call L_A20F		;a05d
	ld d,018h		;a060
	ld a,(0e30bh)		;a062
	ld hl,0d38bh		;a065
	ld bc,0ec50h		;a068
	call L_A218		;a06b
	ld a,(0e30bh)		;a06e
	call L_A20F		;a071
	ld d,018h		;a074
	ld a,(0e30dh)		;a076
	ld hl,0d38bh		;a079
	ld bc,0ec50h		;a07c
	call L_A218		;a07f
	ld a,(0e30bh)		;a082
	ld hl,0ec50h		;a085
	ld d,h			;a088
	ld e,l			;a089
	call 04216h		;a08a   ; hl_mas_a: HL = HL + A
	ld b,(hl)			;a08d
	ld a,(0e30dh)		;a08e
	call 0421bh		;a091   ; de_mas_a: DE = DE + A
	ld a,(de)			;a094
	ld (hl),a			;a095
	ld a,b			;a096
	ld (de),a			;a097
	xor a			;a098
	ld (0e304h),a		;a099
	ret			;a09c
L_A09D:
	ld a,(0e19ch)		;a09d
	ld hl,0e30bh		;a0a0
	rra			;a0a3
	ld c,0ffh		;a0a4
	jr c,L_A0AC		;a0a6
	rra			;a0a8
	ld c,001h		;a0a9
	ret nc			;a0ab
L_A0AC:
	ld a,c			;a0ac
	add a,(hl)			;a0ad
	ld b,00ch		;a0ae
	inc a			;a0b0
	jr z,L_A0BC		;a0b1
	dec a			;a0b3
	ld c,00dh		;a0b4
	cp c			;a0b6
	ld b,a			;a0b7
	jr c,L_A0BC		;a0b8
	sub c			;a0ba
	ld b,a			;a0bb
L_A0BC:
	ld (hl),b			;a0bc
	ld a,b			;a0bd
	ld d,018h		;a0be
	ld bc,0e100h		;a0c0   ; apunta a los atributos de sprite (32 fichas de 4 bytes [y][x][dibujo][color])
	jp L_A1CA		;a0c3
L_A0C6:
	ld a,b			;a0c6
	ld (0e10fh),a		;a0c7
	ld a,c			;a0ca
	ld (0e103h),a		;a0cb
	ld (0e107h),a		;a0ce
	ld (0e10bh),a		;a0d1
	jp 05b1fh		;a0d4
L_A0D7:
	ld a,(0e30ah)		;a0d7
	and 002h		;a0da
	ret nz			;a0dc
	ld d,001h		;a0dd
	call L_A298		;a0df
	ld a,(0e305h)		;a0e2
	dec a			;a0e5
	jr z,L_A14E		;a0e6
	ld a,(0e19eh)		;a0e8
	ld b,a			;a0eb
	and 010h		;a0ec
	jr z,L_A113		;a0ee
	ld de,0ec62h		;a0f0
	call L_A1F6		;a0f3
	jp c,L_A4C4		;a0f6
	ld a,027h		;a0f9
	call 057ffh		;a0fb   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	ld a,002h		;a0fe
	ld hl,0e30ah		;a100
	or (hl)			;a103
	ld (hl),a			;a104
	ld a,002h		;a105
	ld de,08828h		;a107
	call L_A452		;a10a
	ld hl,0e113h		;a10d
	jp 09fffh		;a110
L_A113:
	ld a,b			;a113
	and 020h		;a114
	jr z,L_A12A		;a116
	call L_A501		;a118
	ld bc,0090ah		;a11b
	call L_A1E5		;a11e
	ld hl,0e305h		;a121
	inc (hl)			;a124
	ld a,027h		;a125
	jp 057ffh		;a127   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_A12A:
	ld a,(0e19eh)		;a12a
	ld b,0ffh		;a12d
	rra			;a12f
	jr c,L_A136		;a130
	ld b,001h		;a132
	rra			;a134
	ret nc			;a135
L_A136:
	ld hl,0e30eh		;a136
	ld a,b			;a139
	add a,(hl)			;a13a
	cp 0ffh		;a13b
	ld b,008h		;a13d
	jr z,L_A148		;a13f
	cp 009h		;a141
	ld b,000h		;a143
	jr z,L_A148		;a145
	ld b,a			;a147
L_A148:
	ld (hl),b			;a148
	ld a,026h		;a149
	jp 057ffh		;a14b   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_A14E:
	ld a,(0e19eh)		;a14e
	and 020h		;a151
	jp z,L_A1A4		;a153
	ld bc,00a09h		;a156
	call L_A1E5		;a159
	ld a,027h		;a15c
	call 057ffh		;a15e   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	ld a,(0e30eh)		;a161
	call L_A20F		;a164
	ld d,090h		;a167
	ld a,(0e30ch)		;a169
	ld hl,0d48ah		;a16c
	ld bc,0ec62h		;a16f
	call L_A218		;a172
	ld a,(0e30ch)		;a175
	call L_A20F		;a178
	ld d,090h		;a17b
	ld a,(0e30eh)		;a17d
	ld hl,0d48ah		;a180
	ld bc,0ec62h		;a183
	call L_A218		;a186
	ld a,(0e30ch)		;a189
	ld hl,0ec62h		;a18c
	ld d,h			;a18f
	ld e,l			;a190
	call 04216h		;a191   ; hl_mas_a: HL = HL + A
	ld b,(hl)			;a194
	ld a,(0e30eh)		;a195
	call 0421bh		;a198   ; de_mas_a: DE = DE + A
	ld a,(de)			;a19b
	ld (hl),a			;a19c
	ld a,b			;a19d
	ld (de),a			;a19e
	xor a			;a19f
	ld (0e305h),a		;a1a0
	ret			;a1a3
L_A1A4:
	ld a,(0e19eh)		;a1a4
	ld hl,0e30ch		;a1a7
	rra			;a1aa
	ld c,0ffh		;a1ab
	jr c,L_A1B3		;a1ad
	rra			;a1af
	ld c,001h		;a1b0
	ret nc			;a1b2
L_A1B3:
	ld a,c			;a1b3
	add a,(hl)			;a1b4
	ld b,00ch		;a1b5
	inc a			;a1b7
	jr z,L_A1C3		;a1b8
	dec a			;a1ba
	ld c,00dh		;a1bb
	cp c			;a1bd
	ld b,a			;a1be
	jr c,L_A1C3		;a1bf
	sub c			;a1c1
	ld b,a			;a1c2
L_A1C3:
	ld (hl),b			;a1c3
	ld a,b			;a1c4
	ld d,090h		;a1c5
	ld bc,0e110h		;a1c7
L_A1CA:
	ld hl,0a2dch		;a1ca
	call 04216h		;a1cd   ; hl_mas_a: HL = HL + A
	ld e,(hl)			;a1d0
	ld a,d			;a1d1
	ld h,b			;a1d2
	ld l,c			;a1d3
	ld b,003h		;a1d4
L_A1D6:
	ld (hl),e			;a1d6
	inc hl			;a1d7
	ld (hl),a			;a1d8
	inc hl			;a1d9
	inc hl			;a1da
	inc hl			;a1db
	add a,010h		;a1dc
	djnz L_A1D6		;a1de
	ld a,026h		;a1e0
	jp 057ffh		;a1e2   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_A1E5:
	ld a,b			;a1e5
	ld (0e11fh),a		;a1e6
	ld a,c			;a1e9
	ld (0e113h),a		;a1ea
	ld (0e117h),a		;a1ed
	ld (0e11bh),a		;a1f0
	jp 05b1fh		;a1f3
L_A1F6:
	ld b,009h		;a1f6
	xor a			;a1f8
	ld hl,0e340h		;a1f9
	ld (hl),a			;a1fc
L_A1FD:
	ld a,(de)			;a1fd
	or a			;a1fe
	jr z,L_A20D		;a1ff
	cp 00dh		;a201
	jr c,L_A206		;a203
	inc (hl)			;a205
L_A206:
	inc de			;a206
	djnz L_A1FD		;a207
	ld a,(hl)			;a209
	or a			;a20a
	dec a			;a20b
	ret z			;a20c
L_A20D:
	scf			;a20d
	ret			;a20e
L_A20F:
	ld hl,0a2dch		;a20f
	call 04216h		;a212   ; hl_mas_a: HL = HL + A
	ld e,(hl)			;a215
	inc e			;a216
	ret			;a217
L_A218:
	push de			;a218
	ld d,b			;a219
	ld e,c			;a21a
	call 0421bh		;a21b   ; de_mas_a: DE = DE + A
	ld a,(de)			;a21e
	pop de			;a21f
L_A220:
	or a			;a220
	jr nz,L_A228		;a221
	call L_A27A		;a223
	scf			;a226
	ret			;a227
L_A228:
	dec a			;a228
	ld b,a			;a229
	sub 00ch		;a22a
	jr nc,L_A242		;a22c
	ld a,b			;a22e
	add a,a			;a22f
	ld b,a			;a230
	add a,a			;a231
	ld c,a			;a232
	add a,a			;a233
	add a,b			;a234
	add a,c			;a235
	call L_A284		;a236
	ld b,000h		;a239
	ld c,a			;a23b
	add hl,bc			;a23c
	ld c,001h		;a23d
	jp L_A3EC		;a23f
L_A242:
	call L_A264		;a242
	ld a,e			;a245
	cp 0a7h		;a246
	jr nc,L_A275		;a248
	push de			;a24a
	call L_A439		;a24b
	pop de			;a24e
	ld a,d			;a24f
	add a,034h		;a250
	ld d,a			;a252
	ld a,090h		;a253
	call 04f1ch		;a255   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld a,d			;a258
	add a,004h		;a259
	ld d,a			;a25b
	ld hl,07eb6h		;a25c
	ld c,0ffh		;a25f
	jp 04eb5h		;a261   ; texto_en_de: pinta el texto HL en la posicion DE (sin [x y] delante)
L_A264:
	ld b,a			;a264
	add a,a			;a265
	ld c,a			;a266
	add a,a			;a267
	add a,a			;a268
	add a,a			;a269
	add a,b			;a26a
	add a,c			;a26b
	add a,0a8h		;a26c
	ld b,000h		;a26e
	ld c,a			;a270
	add hl,bc			;a271
	ld b,006h		;a272
	ret			;a274
L_A275:
	ld c,001h		;a275
	jp L_A3B4		;a277
L_A27A:
	ex de,hl			;a27a
	ld bc,06808h		;a27b
	xor a			;a27e
	ld d,000h		;a27f
	jp 04d2ah		;a281   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
L_A284:
	push hl			;a284
	push de			;a285
	push bc			;a286
	push af			;a287
	ex de,hl			;a288
	ld bc,03008h		;a289
	ld a,000h		;a28c
	ld d,000h		;a28e
	call 04d2ah		;a290   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
	pop af			;a293
	pop bc			;a294
	pop de			;a295
	pop hl			;a296
	ret			;a297
L_A298:
	ld a,d			;a298
	or a			;a299
	jr nz,L_A2A6		;a29a
	ld d,010h		;a29c
	ld hl,0e30dh		;a29e
	ld bc,0e10ch		;a2a1
	jr L_A2AE		;a2a4
L_A2A6:
	ld d,088h		;a2a6
	ld hl,0e30eh		;a2a8
	ld bc,0e11ch		;a2ab
L_A2AE:
	ld a,(hl)			;a2ae
	ld hl,0a2dch		;a2af
	call 04216h		;a2b2   ; hl_mas_a: HL = HL + A
	ld e,(hl)			;a2b5
	ld a,e			;a2b6
	ld (bc),a			;a2b7
	inc bc			;a2b8
	ld a,d			;a2b9
	ld (bc),a			;a2ba
	ret			;a2bb

; ----------------------------------------------------------------------
; DATOS resto_A2BC: lo apuntan con el banco puesto p03:A2FC (0xA2BC), p03:A1CA
;   (0xA2DC), p03:A20F (0xA2DC), p03:A2AF (0xA2DC); el tamano es lo que hay
;   hasta lo siguiente, no sale de recorrerlo; lo leen p03:A2FC, p03:A1CA,
;   p03:A20F, p03:A2AF (49 bytes)
;   0xa2bc..0xa2ed  (49 bytes)
DATA_resto_A2BC:
	defb 027h,018h,000h,009h,027h,028h,004h,009h,027h,038h,008h,009h,027h,010h,00ch,00ah	; a2bc  '...'(..'8..'...
	defb 027h,090h,000h,009h,027h,0a0h,004h,009h,027h,0b0h,008h,009h,027h,088h,00ch,00ah	; a2cc  '...'...'...'...
	defb 027h,02fh,037h,03fh,047h,04fh,057h,05fh,067h,077h,07fh,087h,08fh,0a7h,0afh,0b7h	; a2dc  '/7?GOW_gw......
	defb 0bfh	; a2ec

; ======================================================================
; CODIGO 0xa2ed..0xa52b  (574 bytes)
; ======================================================================


L_A2ED:
	call 04ba2h		;a2ed
	call 04bd2h		;a2f0   ; esconde_sprites: escribe 0xD8 (Y = 216: no se pinta ninguno) en la VRAM 0xF600, el primer atributo de sprite
	call 052b5h		;a2f3
	call 05202h		;a2f6
	call 05c7dh		;a2f9   ; esconde_atributos: pone las 32 fichas de sprite de 0xE100 fuera de la pantalla
	ld hl,0a2bch		;a2fc
	ld de,0e100h		;a2ff   ; apunta a los atributos de sprite (32 fichas de 4 bytes [y][x][dibujo][color])
	ld bc,00020h		;a302
	ldir		;a305
	call 05b1fh		;a307
	ld hl,00e18h		;a30a
	ld de,07385h		;a30d
	ld c,00dh		;a310
	call 04cfeh		;a312   ; marco: un marco de lineas: HL la esquina, DE el tamano
	ld hl,08618h		;a315
	ld de,07385h		;a318
	ld c,00dh		;a31b
	call 04cfeh		;a31d   ; marco: un marco de lineas: HL la esquina, DE el tamano
	ld hl,07e86h		;a320
	call 04ea6h		;a323   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld a,002h		;a326
	ld de,01028h		;a328
	call L_A452		;a32b
	ld a,002h		;a32e
	ld de,08828h		;a330
	call L_A452		;a333
	ld hl,0d380h		;a336
	ld de,02014h		;a339
	call 05be4h		;a33c
	ld hl,0d47fh		;a33f
	ld de,09814h		;a342
	call 05be4h		;a345
	ld hl,0d38bh		;a348
	ld de,01828h		;a34b
	call L_A3EA		;a34e
	ld de,01868h		;a351
	ld a,(0ec58h)		;a354
	ld hl,0d38bh		;a357
	call L_A220		;a35a
	ld hl,0d48ah		;a35d
	ld de,09028h		;a360
	call L_A3EA		;a363
	ld de,09068h		;a366
	ld a,(0ec6ah)		;a369
	ld hl,0d48ah		;a36c
	call L_A220		;a36f
	xor a			;a372
	ld (0e1d1h),a		;a373   ; guarda la marca de 'acabado' que dejan las rutinas de cada paso
	ld (0de0dh),a		;a376
	ld (0de0eh),a		;a379
	ld (0e304h),a		;a37c
	ld (0e305h),a		;a37f
	ld (0e302h),a		;a382
	ld (0ed03h),a		;a385
	ld (0ed81h),a		;a388
	ld hl,0e308h		;a38b
	ld d,008h		;a38e
	ld (hl),d			;a390
	inc hl			;a391
	ld (hl),d			;a392
	inc hl			;a393
	ld (hl),a			;a394
	inc hl			;a395
	ld (hl),a			;a396
	inc hl			;a397
	ld (hl),a			;a398
	ld a,(0de02h)		;a399
	ld b,000h		;a39c
	bit 5,a		;a39e
	jr nz,L_A3AD		;a3a0
	bit 4,a		;a3a2
	jr z,L_A3AD		;a3a4
	ld a,(0d6dch)		;a3a6
	rra			;a3a9
	jr nc,L_A3AD		;a3aa
	inc b			;a3ac
L_A3AD:
	ld a,b			;a3ad
	ld (0edd0h),a		;a3ae
	ret			;a3b1
L_A3B2:
	ld c,004h		;a3b2
L_A3B4:
	ld b,006h		;a3b4
	push de			;a3b6
	push de			;a3b7
	call L_A422		;a3b8
	inc hl			;a3bb
	inc hl			;a3bc
	inc hl			;a3bd
	inc hl			;a3be
	inc hl			;a3bf
	pop de			;a3c0
	ld a,d			;a3c1
	add a,03ch		;a3c2
	ld d,a			;a3c4
	ld a,090h		;a3c5
	call 04f1ch		;a3c7   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld a,d			;a3ca
	sub 008h		;a3cb
	ld d,a			;a3cd
	ld b,001h		;a3ce
	call 05be6h		;a3d0
	ld a,d			;a3d3
	add a,004h		;a3d4
	ld d,a			;a3d6
	ld b,002h		;a3d7
	call 05be6h		;a3d9
	inc hl			;a3dc
	inc hl			;a3dd
	inc hl			;a3de
	inc hl			;a3df
	inc hl			;a3e0
	pop de			;a3e1
	ld a,e			;a3e2
	add a,008h		;a3e3
	ld e,a			;a3e5
	dec c			;a3e6
	jr nz,L_A3B4		;a3e7
	ret			;a3e9
L_A3EA:
	ld c,00ch		;a3ea
L_A3EC:
	ld b,006h		;a3ec
	push de			;a3ee
	push de			;a3ef
	call L_A425		;a3f0
	inc hl			;a3f3
	pop de			;a3f4
	ld a,d			;a3f5
	add a,034h		;a3f6
	ld d,a			;a3f8
	ld a,090h		;a3f9
	call 04f1ch		;a3fb   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld a,d			;a3fe
	add a,004h		;a3ff
	ld d,a			;a401
	ld b,003h		;a402
	call 05be6h		;a404
	call 04f6fh		;a407   ; siguiente_columna: D += 8; si da la vuelta, E += 8
	ld b,002h		;a40a
	call 05be6h		;a40c
	inc hl			;a40f
	inc hl			;a410
	ld a,c			;a411
	cp 005h		;a412
	ld b,018h		;a414
	jr z,L_A41A		;a416
	ld b,008h		;a418
L_A41A:
	pop de			;a41a
	ld a,e			;a41b
	add a,b			;a41c
	ld e,a			;a41d
	dec c			;a41e
	jr nz,L_A3EC		;a41f
	ret			;a421
L_A422:
	call L_A284		;a422
L_A425:
	ld a,(hl)			;a425
	inc hl			;a426
	push af			;a427
	call 04f1ch		;a428   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	pop af			;a42b
	cp 00ch		;a42c
	ld a,004h		;a42e
	jr z,L_A434		;a430
	ld a,008h		;a432
L_A434:
	add a,d			;a434
	ld d,a			;a435
	djnz L_A425		;a436
	ret			;a438
L_A439:
	call L_A284		;a439
L_A43C:
	ld a,(hl)			;a43c
	inc hl			;a43d
	push af			;a43e
	add a,0a0h		;a43f
	call 04f1ch		;a441   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	pop af			;a444
	cp 00ch		;a445
	ld a,004h		;a447
	jr z,L_A44D		;a449
	ld a,008h		;a44b
L_A44D:
	add a,d			;a44d
	ld d,a			;a44e
	djnz L_A43C		;a44f
	ret			;a451
L_A452:
	push af			;a452
	call 04f1ch		;a453   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	pop af			;a456
	inc a			;a457
	cp 00bh		;a458
	ret z			;a45a
	ld c,a			;a45b
	ld a,e			;a45c
	add a,008h		;a45d
	ld e,a			;a45f
	ld a,c			;a460
	jr L_A452		;a461
L_A463:
	ld a,(0de02h)		;a463
	bit 3,a		;a466
	ret nz			;a468
	ld hl,(0de06h)		;a469   ; lee los botones recien pulsados del mando 1 / cursores y el byte siguiente (16 bits)
	ld de,(0de08h)		;a46c   ; lee los botones recien pulsados (segundo mando) y el byte siguiente (16 bits)
	bit 4,a		;a470
	jr nz,L_A47F		;a472
L_A474:
	ld (0e19ch),hl		;a474
	bit 5,a		;a477
	ret z			;a479
	ld (0e19eh),de		;a47a
	ret			;a47e
L_A47F:
	bit 5,a		;a47f
	jr nz,L_A474		;a481
	ld a,(0d6dch)		;a483
	rra			;a486
	jr nc,L_A48A		;a487
	ex de,hl			;a489
L_A48A:
	ld (0e19ch),hl		;a48a
	ld (0e19eh),de		;a48d
	ret			;a491
L_A492:
	ld hl,0ed7dh		;a492
	ld a,(hl)			;a495
	or a			;a496
	ret nz			;a497
	ld (hl),001h		;a498
	ld hl,014a8h		;a49a
	ld de,01450h		;a49d
	ld bc,06a20h		;a4a0
	ld a,004h		;a4a3
	call 04d66h		;a4a5   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
	ld hl,014a8h		;a4a8
	ld bc,0681ch		;a4ab
	xor a			;a4ae
	ld d,a			;a4af
	call 04d2ah		;a4b0   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
	ld hl,014a8h		;a4b3
	ld de,0681ch		;a4b6
	ld c,00dh		;a4b9
	call 04cfeh		;a4bb   ; marco: un marco de lineas: HL la esquina, DE el tamano
	ld hl,07d62h		;a4be
	jp 04ea6h		;a4c1   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
L_A4C4:
	ld hl,0ed7eh		;a4c4
	ld a,(hl)			;a4c7
	or a			;a4c8
	ret nz			;a4c9
	ld (hl),001h		;a4ca
	ld hl,08ca8h		;a4cc
	ld de,08c50h		;a4cf
	ld bc,06a20h		;a4d2
	ld a,004h		;a4d5
	call 04d66h		;a4d7   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
	ld hl,08ca8h		;a4da
	ld bc,0681ch		;a4dd
	xor a			;a4e0
	ld d,a			;a4e1
	call 04d2ah		;a4e2   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
	ld hl,08ca8h		;a4e5
	ld de,0681ch		;a4e8
	ld c,00dh		;a4eb
	call 04cfeh		;a4ed   ; marco: un marco de lineas: HL la esquina, DE el tamano
	ld hl,07b48h		;a4f0
	jp 04ea6h		;a4f3   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
L_A4F6:
	ld hl,0ed7dh		;a4f6
	ld de,014a8h		;a4f9
	ld bc,01450h		;a4fc
	jr L_A50A		;a4ff
L_A501:
	ld hl,0ed7eh		;a501
	ld de,08ca8h		;a504
	ld bc,08c50h		;a507
L_A50A:
	ld a,(hl)			;a50a
	or a			;a50b
	ret z			;a50c
	ld (hl),000h		;a50d
	ld h,b			;a50f
	ld l,c			;a510
	ld bc,06a20h		;a511
	ld a,001h		;a514
	jp 04d66h		;a516   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
L_A519:
	call 095bah		;a519
	call 09566h		;a51c
	call L_A876		;a51f
	call 08636h		;a522
	ld a,(0e1d1h)		;a525   ; lee la marca de 'acabado' que dejan las rutinas de cada paso
	call 04220h		;a528   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_A52B: 7 destinos del despachador p00:4220 (call en p03:A528, el
;   indice en A): A539, A57E, A597, A5F2, A68E, A7DB, A7EF; lo leen p03:A528
;   (14 bytes)
;   0xa52b..0xa539  (14 bytes)
DATA_tabla_A52B:
	defw 0a539h,0a57eh,0a597h,0a5f2h,0a68eh,0a7dbh,0a7efh	; a52b

; ======================================================================
; CODIGO 0xa539..0xa83f  (774 bytes)
; ======================================================================


L_A539:
	ld a,(0e1e1h)		;a539
	ld b,a			;a53c
	ld a,(0e1e5h)		;a53d
	ld c,a			;a540
	push bc			;a541
	ld hl,0e1d6h		;a542
	ld de,0e1d7h		;a545
	ld bc,00014h		;a548
	ld (hl),000h		;a54b
	ldir		;a54d
	pop bc			;a54f
	ld a,b			;a550
	ld (0e1e1h),a		;a551
	ld a,c			;a554
	ld (0e1e5h),a		;a555
	call L_AA02		;a558
	ld hl,0e231h		;a55b
	ld de,0ec98h		;a55e
	ld bc,00040h		;a561
	ldir		;a564
	ld hl,0e194h		;a566   ; apunta a las carreras del visitante (BCD; 0x99 acaba el partido)
	ld de,0ecdch		;a569
	ld bc,00004h		;a56c
	ldir		;a56f
	ld hl,0e311h		;a571
	ld de,0eda2h		;a574
	ld bc,00020h		;a577
	ldir		;a57a
	jr L_A592		;a57c
L_A57E:
	call L_A844		;a57e
	ld a,(0e19fh)		;a581
	and 010h		;a584
	ret z			;a586
	call L_AC38		;a587
	call L_AAE1		;a58a
	ld a,001h		;a58d
	ld (0e337h),a		;a58f
L_A592:
	ld hl,0e1d1h		;a592   ; apunta a la marca de 'acabado' que dejan las rutinas de cada paso
	inc (hl)			;a595
	ret			;a596
L_A597:
	ld hl,0e1d2h		;a597
	dec (hl)			;a59a
	ret nz			;a59b
	ld a,(0e19fh)		;a59c
	ld (0e1e6h),a		;a59f
	call L_A830		;a5a2
	ld hl,0e1d3h		;a5a5
	dec (hl)			;a5a8
	push hl			;a5a9
	call 058deh		;a5aa
	pop hl			;a5ad
	ld a,(hl)			;a5ae
	dec a			;a5af
	ret nz			;a5b0
	call L_A8A4		;a5b1
	call L_A8BE		;a5b4
	call L_A8EA		;a5b7
	call L_A806		;a5ba
	ld ix,0e1d9h		;a5bd
	ld (ix+000h),a		;a5c1
	ld (0ed11h),a		;a5c4
	ld (ix+004h),001h		;a5c7
	call L_A825		;a5cb
	ld (ix+006h),a		;a5ce
	ld hl,0e152h		;a5d1
	ld (hl),0a4h		;a5d4
	inc hl			;a5d6
	ld (hl),00dh		;a5d7
	inc hl			;a5d9
	inc hl			;a5da
	inc hl			;a5db
	ld (hl),0ach		;a5dc
	inc hl			;a5de
	ld (hl),00fh		;a5df
	ld a,(0e225h)		;a5e1
	call 057ffh		;a5e4   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	ld a,0e0h		;a5e7
	ld (0e150h),a		;a5e9
	ld (0e154h),a		;a5ec
	jp L_A592		;a5ef
L_A5F2:
	ld hl,0e1e8h		;a5f2
	inc (hl)			;a5f5
	ld hl,0e1d2h		;a5f6
	ld a,(hl)			;a5f9
	or a			;a5fa
	jr z,L_A607		;a5fb
	dec (hl)			;a5fd
	jr nz,L_A607		;a5fe
	xor a			;a600
	ld (0e1d3h),a		;a601
	call 058deh		;a604
L_A607:
	ld hl,(0e1d4h)		;a607
	ld bc,(0e1d6h)		;a60a
	add hl,bc			;a60e
	ld (0e1d4h),hl		;a60f
	ld a,(0ed2eh)		;a612
	or a			;a615
	jp nz,L_A732		;a616
	call L_A8F5		;a619
	call L_A9BA		;a61c
	call L_A9A3		;a61f
L_A622:
	ld hl,0e154h		;a622
	ld de,0e1d5h		;a625
	ld a,(de)			;a628
	ld (hl),a			;a629
	ld b,a			;a62a
	inc hl			;a62b
	inc de			;a62c
	inc de			;a62d
	inc de			;a62e
	inc de			;a62f
	ld a,(de)			;a630
	ld (hl),a			;a631
	ld c,a			;a632
	ld a,(0e1dfh)		;a633
	cp 080h		;a636
	jr c,L_A63F		;a638
	neg		;a63a
	ld (0e1d0h),a		;a63c
L_A63F:
	ld d,a			;a63f
	ld a,b			;a640
	sub d			;a641
	ld hl,0e150h		;a642
	ld (hl),a			;a645
	inc hl			;a646
	ld (hl),c			;a647
	ld a,(0e1d5h)		;a648
	cp 0ach		;a64b
	jr c,L_A65A		;a64d
	ld hl,0e1ddh		;a64f
	ld a,(hl)			;a652
	or a			;a653
	jr z,L_A65A		;a654
	dec (hl)			;a656
	call L_A767		;a657
L_A65A:
	ld a,(0ed2eh)		;a65a
	or a			;a65d
	call z,L_A792		;a65e
	ld hl,0e154h		;a661
	ld a,(hl)			;a664
	ld b,0c8h		;a665
	cp b			;a667
	ret c			;a668
	ld b,0d7h		;a669
	ld (hl),b			;a66b
	dec hl			;a66c
	dec hl			;a66d
	dec hl			;a66e
	dec hl			;a66f
	ld (hl),b			;a670
	ld hl,00000h		;a671
	ld (0e1d6h),hl		;a674
	ld (0e1dah),hl		;a677
	ld a,(0e1f3h)		;a67a
	or a			;a67d
	jp z,L_A592		;a67e
	cp 004h		;a681
	jp z,L_A592		;a683
	ld a,(0e1f7h)		;a686
	or a			;a689
	ret z			;a68a
	jp L_A592		;a68b
L_A68E:
	call L_A592		;a68e
	call L_A6E9		;a691
	ld a,(0e198h)		;a694
	cp 003h		;a697
	jr c,L_A6AC		;a699
	ld hl,0ed19h		;a69b
	ld a,(0e19bh)		;a69e   ; lee la media entrada (bit 0: 0 la alta, 1 la baja; 0x11 = la baja de la 9.a)
	rra			;a6a1
	jr nc,L_A6A5		;a6a2
	inc hl			;a6a4
L_A6A5:
	ld a,(hl)			;a6a5
	add a,001h		;a6a6
	daa			;a6a8
	ld (hl),a			;a6a9
	jr L_A6AC		;a6aa
L_A6AC:
	call L_A76C		;a6ac
	call 06124h		;a6af
	call 064b3h		;a6b2
	ld a,040h		;a6b5
	ld (0e1d2h),a		;a6b7
	ld a,001h		;a6ba
	ld (0edddh),a		;a6bc
L_A6BF:
	ld a,(0ed2eh)		;a6bf
	dec a			;a6c2
	jr nz,L_A6D0		;a6c3
	xor a			;a6c5
	ld (0ed2eh),a		;a6c6
	ld a,(0eddch)		;a6c9
	or a			;a6cc
	call nz,06267h		;a6cd
L_A6D0:
	xor a			;a6d0
	ld (0e337h),a		;a6d1
	ld a,(0ecebh)		;a6d4
	or a			;a6d7
	ret z			;a6d8
	ld a,(0e19ah)		;a6d9
	cp 003h		;a6dc
	ret nc			;a6de
	ld a,001h		;a6df
	ld (0eddfh),a		;a6e1
	ld hl,0e1a1h		;a6e4
	inc (hl)			;a6e7
	ret			;a6e8
L_A6E9:
	ld a,(0e338h)		;a6e9
	dec a			;a6ec
	jr z,L_A70D		;a6ed
	dec a			;a6ef
	jr z,L_A6F6		;a6f0
	pop hl			;a6f2
	jp L_A789		;a6f3
L_A6F6:
	ld hl,0e199h		;a6f6
	inc (hl)			;a6f9
	ld a,(hl)			;a6fa
	cp 004h		;a6fb
	ret nc			;a6fd
	ld b,015h		;a6fe
	ld a,(0e1f0h)		;a700
	cp 028h		;a703
	jr c,L_A709		;a705
	ld b,016h		;a707
L_A709:
	ld a,b			;a709
	jp 057ffh		;a70a   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_A70D:
	ld a,(0eddch)		;a70d
	or a			;a710
	jr nz,L_A724		;a711
	ld hl,0e198h		;a713
	inc (hl)			;a716
	ld b,013h		;a717
	ld a,(0e1f0h)		;a719
	cp 028h		;a71c
	jr c,L_A709		;a71e
	ld b,014h		;a720
	jr L_A709		;a722
L_A724:
	ld b,01bh		;a724
	call L_A709		;a726
	ld hl,0e198h		;a729
	ld a,(hl)			;a72c
	cp 002h		;a72d
	ret nc			;a72f
	inc (hl)			;a730
	ret			;a731
L_A732:
	ld de,(0e1dah)		;a732
	call L_A748		;a736
	ld hl,(0e1d8h)		;a739
	add hl,de			;a73c
	ld (0e1d8h),hl		;a73d
	ld a,001h		;a740
	ld (0e338h),a		;a742
	jp L_A622		;a745
L_A748:
	ld a,d			;a748
	or a			;a749
	ret z			;a74a
	inc a			;a74b
	ret z			;a74c
	ld a,(0ed2eh)		;a74d
	dec a			;a750
	ret nz			;a751
	ld a,001h		;a752
	ld (0eddch),a		;a754
	ld (0eddeh),a		;a757
	ret			;a75a
L_A75B:
	ld de,0aca4h		;a75b
L_A75E:
	ld a,d			;a75e
	ld (0e156h),a		;a75f
	ld a,e			;a762
	ld (0e152h),a		;a763
	ret			;a766
L_A767:
	ld de,0a8a0h		;a767
	jr L_A75E		;a76a
L_A76C:
	ld a,(0eddch)		;a76c
	or a			;a76f
	jp nz,06508h		;a770
	ld a,(0e338h)		;a773
	cp 003h		;a776
	ret nc			;a778
	cp 002h		;a779
	jp z,05193h		;a77b
	ld a,(0e198h)		;a77e
	cp 003h		;a781
	jp nc,051a1h		;a783
	jp 05185h		;a786
L_A789:
	ld hl,0e1d1h		;a789   ; apunta a la marca de 'acabado' que dejan las rutinas de cada paso
	ld (hl),006h		;a78c
	inc hl			;a78e
	ld (hl),0c0h		;a78f
	ret			;a791
L_A792:
	call L_A7A6		;a792
	call L_A7B2		;a795
	call 08a71h		;a798
	ld a,(0e338h)		;a79b
	or a			;a79e
	ret nz			;a79f
	ld hl,0e338h		;a7a0
	ld (hl),002h		;a7a3
	ret			;a7a5
L_A7A6:
	ld a,(0e1f3h)		;a7a6
	cp 004h		;a7a9
	ret nc			;a7ab
L_A7AC:
	ld hl,0e338h		;a7ac
	ld (hl),001h		;a7af
	ret			;a7b1
L_A7B2:
	ld a,(0ec75h)		;a7b2
	or a			;a7b5
	ret nz			;a7b6
	ld a,(0e1d5h)		;a7b7
	cp 0a8h		;a7ba
	ret c			;a7bc
	ld a,001h		;a7bd
	ld (0ec75h),a		;a7bf
	ld a,(0e1d0h)		;a7c2
	or a			;a7c5
	ret nz			;a7c6
	ld a,(0e1d9h)		;a7c7
	cp 06bh		;a7ca
	ret c			;a7cc
	cp 086h		;a7cd
	ret nc			;a7cf
	ld a,(0e1dfh)		;a7d0
	cp 00eh		;a7d3
	ret c			;a7d5
	cp 022h		;a7d6
	ret nc			;a7d8
	jr L_A7AC		;a7d9
L_A7DB:
	ld hl,0e1d2h		;a7db
	dec (hl)			;a7de
	ret nz			;a7df
	call L_A7E6		;a7e0
	jp 064fah		;a7e3
L_A7E6:
	dec hl			;a7e6
	xor a			;a7e7
	ld (hl),a			;a7e8
	ld (0ed3eh),a		;a7e9
	jp 057b9h		;a7ec
L_A7EF:
	ld hl,0e1d2h		;a7ef
	dec (hl)			;a7f2
	ret nz			;a7f3
	call L_A7E6		;a7f4
	call 061c7h		;a7f7
	jp L_A6BF		;a7fa
L_A7FD:
	ld hl,0e1d4h		;a7fd
	ld (hl),000h		;a800
	inc hl			;a802
	ld (hl),064h		;a803
	ret			;a805
L_A806:
	ld a,(0e1ebh)		;a806
	rra			;a809
	rra			;a80a
	jr c,L_A819		;a80b
	rra			;a80d
	ld b,008h		;a80e
	jr c,L_A814		;a810
	ld b,0f8h		;a812
L_A814:
	ld a,(0e1e1h)		;a814
	add a,b			;a817
	ret			;a818
L_A819:
	rra			;a819
	ld b,00ch		;a81a
	jr c,L_A820		;a81c
	ld b,0f4h		;a81e
L_A820:
	ld a,(0e1e1h)		;a820
	add a,b			;a823
	ret			;a824
L_A825:
	ld a,(0e1ebh)		;a825
	and 002h		;a828
	ld a,018h		;a82a
	ret z			;a82c
	ld a,00ch		;a82d
	ret			;a82f
L_A830:
	ld a,(0e1d3h)		;a830
	dec a			;a833
	ld hl,0a83fh		;a834
	call 04216h		;a837   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;a83a
	ld (0e1d2h),a		;a83b
	ret			;a83e

; ----------------------------------------------------------------------
; DATOS resto_A83F: lo apuntan con el banco puesto p03:A834 (0xA83F); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:A834 (5 bytes)
;   0xa83f..0xa844  (5 bytes)
DATA_resto_A83F:
	defb 008h,018h,014h,010h,010h	; a83f

; ======================================================================
; CODIGO 0xa844..0xad5c  (1304 bytes)
; ======================================================================


L_A844:
	call L_A857		;a844
	ld a,(0e1e1h)		;a847
	ld b,004h		;a84a
	ld hl,0e159h		;a84c
L_A84F:
	ld (hl),a			;a84f
	inc hl			;a850
	inc hl			;a851
	inc hl			;a852
	inc hl			;a853
	djnz L_A84F		;a854
	ret			;a856
L_A857:
	ld a,(0e19fh)		;a857
	and 00ch		;a85a
	ret z			;a85c
	cp 00ch		;a85d
	ret z			;a85f
	ld a,(0e19fh)		;a860
	rra			;a863
	rra			;a864
	rra			;a865
	ld hl,0e1e1h		;a866
	ld a,(hl)			;a869
	jr c,L_A871		;a86a
	cp 07fh		;a86c
	ret nc			;a86e
	inc (hl)			;a86f
	ret			;a870
L_A871:
	cp 071h		;a871
	ret c			;a873
	dec (hl)			;a874
	ret			;a875
L_A876:
	ld a,(0de02h)		;a876
	bit 5,a		;a879
	ret nz			;a87b
	bit 3,a		;a87c
	jr nz,L_A89E		;a87e
	bit 4,a		;a880
	jr z,L_A894		;a882
	ld a,(0d6dch)		;a884
	rra			;a887
	jr nc,L_A894		;a888
	ld a,(0e19bh)		;a88a   ; lee la media entrada (bit 0: 0 la alta, 1 la baja; 0x11 = la baja de la 9.a)
	rra			;a88d
	jp nc,0777ah		;a88e
	jp 075d5h		;a891
L_A894:
	ld a,(0e19bh)		;a894   ; lee la media entrada (bit 0: 0 la alta, 1 la baja; 0x11 = la baja de la 9.a)
	rra			;a897
	jp c,0777ah		;a898
	jp 075d5h		;a89b
L_A89E:
	call 075d5h		;a89e
	jp 0777ah		;a8a1
L_A8A4:
	call L_A8AC		;a8a4
	ld a,b			;a8a7
	ld (0e1e6h),a		;a8a8
	ret			;a8ab
L_A8AC:
	ld b,000h		;a8ac
	ld a,(0e1e6h)		;a8ae
	and 003h		;a8b1
	ret z			;a8b3
	cp 003h		;a8b4
	ret z			;a8b6
	ld b,001h		;a8b7
	rra			;a8b9
	ret c			;a8ba
	ld b,002h		;a8bb
	ret			;a8bd
L_A8BE:
	call L_A8CA		;a8be
	ld a,r		;a8c1
	and 008h		;a8c3
	add a,b			;a8c5
	ld (0ed37h),a		;a8c6
	ret			;a8c9
L_A8CA:
	ld a,(0e1ebh)		;a8ca
	bit 1,a		;a8cd
	ld a,(0e1e6h)		;a8cf
	jr z,L_A8DF		;a8d2
	ld b,06ch		;a8d4
	rra			;a8d6
	ret c			;a8d7
	ld b,012h		;a8d8
	rra			;a8da
	ret c			;a8db
	ld b,029h		;a8dc
	ret			;a8de
L_A8DF:
	ld b,03fh		;a8df
	rra			;a8e1
	ret c			;a8e2
	ld b,03fh		;a8e3
	rra			;a8e5
	ret c			;a8e6
	ld b,004h		;a8e7
	ret			;a8e9
L_A8EA:
	ld a,(0e1e6h)		;a8ea
	cp 001h		;a8ed
	ret nz			;a8ef
	xor a			;a8f0
	ld (0e1e0h),a		;a8f1
	ret			;a8f4
L_A8F5:
	call L_A943		;a8f5
	call L_A92B		;a8f8
	ld a,(0ed11h)		;a8fb
	ld h,a			;a8fe
	ld l,000h		;a8ff
	add hl,de			;a901
	push hl			;a902
	ld a,(0ed70h)		;a903
	ld e,a			;a906
	ld a,(0e1d5h)		;a907
	sub 064h		;a90a
	call 05fa4h		;a90c   ; multiplica: HL = A x E (8 x 8 bits)
	ld a,(0e1ebh)		;a90f
	bit 2,a		;a912
	call nz,05f71h		;a914
	pop de			;a917
	add hl,de			;a918
	ld (0e1d8h),hl		;a919
	ld a,h			;a91c
	cp 0f0h		;a91d
	jr nc,L_A924		;a91f
	cp 010h		;a921
	ret nc			;a923
L_A924:
	ld hl,00000h		;a924
	ld (0e1dah),hl		;a927
	ret			;a92a
L_A92B:
	ld a,(0de03h)		;a92b   ; lee el contador de cuadros del juego (sube uno por cuadro)
	rra			;a92e
	ret z			;a92f
	ld a,(0e19fh)		;a930
	and 00ch		;a933
	ret z			;a935
	cp 00ch		;a936
	ret z			;a938
	ld hl,0ed70h		;a939
	dec (hl)			;a93c
	cp 004h		;a93d
	ret z			;a93f
	inc (hl)			;a940
	inc (hl)			;a941
	ret			;a942
L_A943:
	call L_A94F		;a943
	ld hl,(0e1dah)		;a946
	add hl,de			;a949
	ld (0e1dah),hl		;a94a
	ex de,hl			;a94d
	ret			;a94e
L_A94F:
	call L_AAD3		;a94f
	ld a,(0e1e9h)		;a952
	or a			;a955
	jr z,L_A966		;a956
	ld b,a			;a958
	ld a,(0e19fh)		;a959
	cp b			;a95c
	ld a,b			;a95d
	jr nz,L_A979		;a95e
	ld hl,0ed12h		;a960
	inc (hl)			;a963
	jr L_A979		;a964
L_A966:
	ld de,00000h		;a966
	ld a,(0e19fh)		;a969
	and 00ch		;a96c
	ret z			;a96e
	cp 00ch		;a96f
	ret z			;a971
	ld (0e1e9h),a		;a972
	ld hl,0ed12h		;a975
	inc (hl)			;a978
L_A979:
	cp 004h		;a979
	jr nz,L_A98B		;a97b
	ld (0e1e9h),a		;a97d
	ld b,(ix+011h)		;a980
	sla b		;a983
	call L_A993		;a985
	jp 05f79h		;a988
L_A98B:
	ld (0e1e9h),a		;a98b
	ld b,(ix+010h)		;a98e
	sla b		;a991
L_A993:
	ld a,(0ed36h)		;a993
	add a,b			;a996
	ld e,a			;a997
	ld (0ed94h),a		;a998
	ld a,(0ed12h)		;a99b
	call 05fa4h		;a99e   ; multiplica: HL = A x E (8 x 8 bits)
	ex de,hl			;a9a1
	ret			;a9a2
L_A9A3:
	ld a,(0e1e9h)		;a9a3
	or a			;a9a6
	ret nz			;a9a7
	ld a,(0e1d5h)		;a9a8
	cp 096h		;a9ab
	ret c			;a9ad
	ld hl,0e1e0h		;a9ae
	ld a,(hl)			;a9b1
	or a			;a9b2
	ret z			;a9b3
	dec (hl)			;a9b4
	dec hl			;a9b5
	dec (hl)			;a9b6
	dec (hl)			;a9b7
	dec (hl)			;a9b8
	ret			;a9b9
L_A9BA:
	ld a,(0ed37h)		;a9ba
	ld e,a			;a9bd
	ld a,(0e1d5h)		;a9be
	sub 064h		;a9c1
	call 05fa4h		;a9c3   ; multiplica: HL = A x E (8 x 8 bits)
	ex de,hl			;a9c6
	ld a,(0e1ebh)		;a9c7
	bit 1,a		;a9ca
	ld a,(0e1e6h)		;a9cc
	jr z,L_A9DE		;a9cf
	cp 002h		;a9d1
	call z,05f79h		;a9d3
	ld hl,00c00h		;a9d6
L_A9D9:
	add hl,de			;a9d9
	ld (0e1deh),hl		;a9da
	ret			;a9dd
L_A9DE:
	cp 001h		;a9de
	call nz,05f79h		;a9e0
	ld hl,01800h		;a9e3
	jr L_A9D9		;a9e6
L_A9E8:
	ld hl,0e1ebh		;a9e8
	res 0,(hl)		;a9eb
	call 05b0dh		;a9ed
	ret nz			;a9f0
	set 0,(hl)		;a9f1
	ret			;a9f3
L_A9F4:
	call L_AA74		;a9f4
	call L_AC59		;a9f7
	call L_AC6B		;a9fa
	ld a,078h		;a9fd
	ld (0e1e1h),a		;a9ff
L_AA02:
	call L_AA74		;aa02
	call L_A9E8		;aa05
	call L_ABAA		;aa08
	ld hl,0e1d2h		;aa0b
	ld (hl),001h		;aa0e
	inc hl			;aa10
	ld (hl),005h		;aa11
	xor a			;aa13
	ld (0edddh),a		;aa14
	ld (0eddch),a		;aa17
	ld (0eddeh),a		;aa1a
	ld (0ece0h),a		;aa1d
	ld (0ed79h),a		;aa20
	ld (0ec75h),a		;aa23
	ld (0e338h),a		;aa26
	ld (0e1d0h),a		;aa29
	ld (0eddfh),a		;aa2c
	ld (0e19fh),a		;aa2f
	ld (0eceeh),a		;aa32
	ld (0ecffh),a		;aa35
	ld (0ed0ah),a		;aa38
	ld (0ed12h),a		;aa3b
	ld (0ed94h),a		;aa3e
	ld (0e1eeh),a		;aa41
	ld (0e1e8h),a		;aa44
	ld (0e1e9h),a		;aa47
	call L_A7FD		;aa4a
	call L_AA59		;aa4d
	call 058deh		;aa50
	call 056c4h		;aa53
	jp 056b1h		;aa56
L_AA59:
	ld b,017h		;aa59
	ld a,(0e1ebh)		;aa5b
	bit 1,a		;aa5e
	jr z,L_AA64		;aa60
	ld b,026h		;aa62
L_AA64:
	ld a,r		;aa64
	and 00fh		;aa66
	add a,b			;aa68
	ld (0ed70h),a		;aa69
	ld a,r		;aa6c
	and 003h		;aa6e
	ld (0ed36h),a		;aa70
	ret			;aa73
L_AA74:
	call L_AA7B		;aa74
	call L_AAB5		;aa77
	ret			;aa7a
L_AA7B:
	ld hl,0ec50h		;aa7b
	ld de,0d433h		;aa7e
	ld bc,0ed58h		;aa81
	call L_AAA0		;aa84
	call L_AAA9		;aa87
	ld (0ed88h),hl		;aa8a
	ld hl,0ec62h		;aa8d
	ld de,0d532h		;aa90
	ld bc,0ed5ah		;aa93
	call L_AAA0		;aa96
	call L_AAA9		;aa99
	ld (0ed8ah),hl		;aa9c
	ret			;aa9f
L_AAA0:
	ld a,(hl)			;aaa0
	inc hl			;aaa1
	cp 00dh		;aaa2
	jr c,L_AAA0		;aaa4
	ld (bc),a			;aaa6
	ex de,hl			;aaa7
	ret			;aaa8
L_AAA9:
	sub 00dh		;aaa9
	ld c,a			;aaab
	xor a			;aaac
	ld b,013h		;aaad
L_AAAF:
	add a,c			;aaaf
	djnz L_AAAF		;aab0
	jp 04216h		;aab2   ; hl_mas_a: HL = HL + A
L_AAB5:
	call L_AAD3		;aab5
	ld a,(ix+006h)		;aab8
	ld b,004h		;aabb
	cp 01ah		;aabd
	jr z,L_AAC3		;aabf
	ld b,000h		;aac1
L_AAC3:
	ld a,(ix+007h)		;aac3
	cp 012h		;aac6
	ld a,002h		;aac8
	jr z,L_AACE		;aaca
	ld a,000h		;aacc
L_AACE:
	or b			;aace
	ld (0e1ebh),a		;aacf
	ret			;aad2
L_AAD3:
	ld ix,(0ed8ah)		;aad3
	ld a,(0e19bh)		;aad7   ; lee la media entrada (bit 0: 0 la alta, 1 la baja; 0x11 = la baja de la 9.a)
	rra			;aada
	ret nc			;aadb
	ld ix,(0ed88h)		;aadc
	ret			;aae0
L_AAE1:
	call L_AAD3		;aae1
	ld a,(ix+008h)		;aae4
	cp 003h		;aae7
	jr nc,L_AB13		;aae9
	ld d,000h		;aaeb
	ld a,(ix+008h)		;aaed
	cp 002h		;aaf0
	jr c,L_AAF6		;aaf2
	ld d,064h		;aaf4
L_AAF6:
	ld a,(ix+009h)		;aaf6
	or a			;aaf9
	jr z,L_AB04		;aafa
	ld b,a			;aafc
	ld a,0f6h		;aafd
	ld c,00ah		;aaff
L_AB01:
	add a,c			;ab01
	djnz L_AB01		;ab02
L_AB04:
	add a,d			;ab04
	ld d,a			;ab05
	ld a,(ix+00ah)		;ab06
	or a			;ab09
	jr z,L_AB0D		;ab0a
	dec a			;ab0c
L_AB0D:
	add a,d			;ab0d
	ld d,a			;ab0e
	sub 050h		;ab0f
	jr nc,L_AB15		;ab11
L_AB13:
	ld d,050h		;ab13
L_AB15:
	ld a,d			;ab15
	ld (0e1efh),a		;ab16
	sub 050h		;ab19
	jr nc,L_AB1E		;ab1b
	xor a			;ab1d
L_AB1E:
	ld b,a			;ab1e
	call L_AB32		;ab1f
	ld a,b			;ab22
	srl a		;ab23
	ld (0e1f0h),a		;ab25
	call 05bcch		;ab28
	ld (0e1d6h),hl		;ab2b
	ld (0e1eah),a		;ab2e
	ret			;ab31
L_AB32:
	xor a			;ab32
	ld (0e1e0h),a		;ab33
	inc a			;ab36
	ld (0e1edh),a		;ab37
	ld a,003h		;ab3a
	ld (0e225h),a		;ab3c
	ld a,(0e19fh)		;ab3f
	and 003h		;ab42
	ret z			;ab44
	cp 003h		;ab45
	ret z			;ab47
	rra			;ab48
	jr c,L_AB5D		;ab49
	ld a,b			;ab4b
	srl a		;ab4c
	srl a		;ab4e
	add a,b			;ab50
	ld b,a			;ab51
	ld a,002h		;ab52
	ld (0e225h),a		;ab54
	ld a,004h		;ab57
	ld (0e1edh),a		;ab59
	ret			;ab5c
L_AB5D:
	ld a,b			;ab5d
	srl a		;ab5e
	srl a		;ab60
	ld c,a			;ab62
	ld a,b			;ab63
	sub c			;ab64
	ld b,a			;ab65
	ld a,004h		;ab66
	ld (0e225h),a		;ab68
	ld a,002h		;ab6b
	ld (0e1edh),a		;ab6d
	ld a,(ix+012h)		;ab70
	ld (0e1e0h),a		;ab73
	ret			;ab76
L_AB77:
	ld ix,(0ed88h)		;ab77
	ld hl,0ed90h		;ab7b
	ld de,0ed91h		;ab7e
	call L_AB8E		;ab81
	ld ix,(0ed8ah)		;ab84
	ld hl,0ed92h		;ab88
	ld de,0ed93h		;ab8b
L_AB8E:
	call L_ABA5		;ab8e
	ex de,hl			;ab91
	jr L_ABA5		;ab92
L_AB94:
	call L_AB9F		;ab94
L_AB97:
	call L_AAD3		;ab97
	call L_AC20		;ab9a
	jr L_ABA5		;ab9d
L_AB9F:
	call L_AAD3		;ab9f
	call L_AC2C		;aba2
L_ABA5:
	ld a,(ix+00eh)		;aba5
	ld (hl),a			;aba8
	ret			;aba9
L_ABAA:
	call L_AAD3		;abaa
	call L_AC2C		;abad
	ld a,(0e1edh)		;abb0
	ld b,a			;abb3
	ld a,(hl)			;abb4
	sub b			;abb5
	ld (hl),a			;abb6
	jr nc,L_ABBF		;abb7
	call L_AB9F		;abb9
	call L_ABE2		;abbc
L_ABBF:
	call L_AC20		;abbf
	dec (hl)			;abc2
	ret nz			;abc3
	call L_AB97		;abc4
	ld a,(ix+010h)		;abc7
	or a			;abca
	jr z,L_ABD0		;abcb
	dec (ix+010h)		;abcd
L_ABD0:
	ld a,(ix+011h)		;abd0
	or a			;abd3
	jr z,L_ABD9		;abd4
	dec (ix+011h)		;abd6
L_ABD9:
	ld a,(ix+012h)		;abd9
	or a			;abdc
	ret z			;abdd
	dec (ix+012h)		;abde
	ret			;abe1
L_ABE2:
	ld a,r		;abe2
	and 003h		;abe4
	add a,004h		;abe6
	ld c,a			;abe8
	ld a,(0e1efh)		;abe9
	sub c			;abec
	cp 050h		;abed
	jr c,L_AC13		;abef
	ld a,(ix+00ah)		;abf1
	dec a			;abf4
	sub c			;abf5
	jr c,L_ABFD		;abf6
	inc a			;abf8
	ld (ix+00ah),a		;abf9
	ret			;abfc
L_ABFD:
	sub 0f5h		;abfd
	ld (ix+00ah),a		;abff
	dec (ix+009h)		;ac02
	ld a,(ix+009h)		;ac05
	or a			;ac08
	ret nz			;ac09
	ld (ix+009h),00ah		;ac0a
	ld (ix+008h),000h		;ac0e
	ret			;ac12
L_AC13:
	ld (ix+008h),000h		;ac13
	ld (ix+009h),009h		;ac17
	ld (ix+00ah),001h		;ac1b
	ret			;ac1f
L_AC20:
	ld hl,0ed93h		;ac20
	ld a,(0e19bh)		;ac23   ; lee la media entrada (bit 0: 0 la alta, 1 la baja; 0x11 = la baja de la 9.a)
	rra			;ac26
	ret nc			;ac27
	ld hl,0ed91h		;ac28
	ret			;ac2b
L_AC2C:
	ld hl,0ed92h		;ac2c
	ld a,(0e19bh)		;ac2f   ; lee la media entrada (bit 0: 0 la alta, 1 la baja; 0x11 = la baja de la 9.a)
	rra			;ac32
	ret nc			;ac33
	ld hl,0ed90h		;ac34
	ret			;ac37
L_AC38:
	call L_AC59		;ac38
	call L_AC4F		;ac3b
	call L_AC59		;ac3e
	ld b,(hl)			;ac41
L_AC42:
	ld a,(de)			;ac42
	cp b			;ac43
	jr z,L_AC4A		;ac44
	inc de			;ac46
	inc de			;ac47
	jr L_AC42		;ac48
L_AC4A:
	inc hl			;ac4a
	inc de			;ac4b
	ld a,(hl)			;ac4c
	ld (de),a			;ac4d
	ret			;ac4e
L_AC4F:
	inc hl			;ac4f
	ld a,(hl)			;ac50
	ld (0e1eeh),a		;ac51
	cp 0ffh		;ac54
	ret z			;ac56
	inc (hl)			;ac57
	ret			;ac58
L_AC59:
	ld hl,0ed5ah		;ac59
	ld de,0ed64h		;ac5c
	ld a,(0e19bh)		;ac5f   ; lee la media entrada (bit 0: 0 la alta, 1 la baja; 0x11 = la baja de la 9.a)
	rra			;ac62
	ret nc			;ac63
	ld hl,0ed58h		;ac64
	ld de,0ed5ch		;ac67
	ret			;ac6a
L_AC6B:
	ld b,(hl)			;ac6b
L_AC6C:
	ld a,(de)			;ac6c
	or a			;ac6d
	jr z,L_AC76		;ac6e
	cp b			;ac70
	ret z			;ac71
	inc de			;ac72
	inc de			;ac73
	jr L_AC6C		;ac74
L_AC76:
	ld a,b			;ac76
	ld (de),a			;ac77
	inc hl			;ac78
	ld (hl),000h		;ac79
	ret			;ac7b
L_AC7C:
	ld a,(0ed3fh)		;ac7c
	or a			;ac7f
	jr nz,L_AC91		;ac80
	ld a,(0ecebh)		;ac82
	or a			;ac85
	jr nz,L_AC91		;ac86
	ld a,(0eddeh)		;ac88
	or a			;ac8b
	jr nz,L_AC91		;ac8c
	call 06194h		;ac8e
L_AC91:
	xor a			;ac91
	ld hl,0e1d1h		;ac92   ; apunta a la marca de 'acabado' que dejan las rutinas de cada paso
	ld de,0e1d2h		;ac95
	ld bc,0005eh		;ac98
	ld (hl),a			;ac9b
	ldir		;ac9c
	ld hl,0e23eh		;ac9e
	ld de,00010h		;aca1
	ld b,004h		;aca4
L_ACA6:
	res 6,(hl)		;aca6
	add hl,de			;aca8
	djnz L_ACA6		;aca9
	ld (0e337h),a		;acab
	ld (0e33ch),a		;acae
	ld (0ed3eh),a		;acb1
	ld (0ed3fh),a		;acb4
	ld (0e1b5h),a		;acb7
	call 04bc5h		;acba   ; apaga_pantalla: R#1 con el bit 6 (BL) a 0 (WRTVDP)
	ld a,001h		;acbd
	ld (0ed9fh),a		;acbf
	call 0547ah		;acc2
	call 0550eh		;acc5
	call 05576h		;acc8
	call 0537ch		;accb
	xor a			;acce
	ld (0e1a2h),a		;accf
	call 05c7dh		;acd2   ; esconde_atributos: pone las 32 fichas de sprite de 0xE100 fuera de la pantalla
	call 095adh		;acd5
	call L_AD26		;acd8
	call L_B449		;acdb
	call 08860h		;acde
	call 05677h		;ace1
	call 0583bh		;ace4
	call L_A9F4		;ace7
	call 056c4h		;acea
	call 056b1h		;aced
	call 05b1fh		;acf0
	call 04235h		;acf3
	call 05153h		;acf6
	call 06352h		;acf9
	call 06a64h		;acfc
	call 069e9h		;acff
	xor a			;ad02
	ld (0ed9fh),a		;ad03
	call 04bb8h		;ad06   ; enciende_pantalla: R#1 con el bit 6 (BL) a 1 (WRTVDP)
	xor a			;ad09
	ld (0eddbh),a		;ad0a
	ld hl,0e1cbh		;ad0d
	ld a,(hl)			;ad10
	or a			;ad11
	ld a,019h		;ad12
	jr nz,L_AD18		;ad14
	ld a,01ah		;ad16
L_AD18:
	ld (hl),000h		;ad18
	call 057ffh		;ad1a   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	call 054b3h		;ad1d
	call 0549bh		;ad20
	jp 057b9h		;ad23
L_AD26:
	ld hl,0e23ch		;ad26
	ld b,004h		;ad29
L_AD2B:
	push bc			;ad2b
	ld a,(hl)			;ad2c
	and 007h		;ad2d
	dec a			;ad2f
	dec a			;ad30
	call z,L_AD44		;ad31
	dec a			;ad34
	call z,L_AD4C		;ad35
	dec a			;ad38
	call z,L_AD54		;ad39
	ld de,00010h		;ad3c
	add hl,de			;ad3f
	pop bc			;ad40
	djnz L_AD2B		;ad41
	ret			;ad43
L_AD44:
	push af			;ad44
	push hl			;ad45
	call 05591h		;ad46
	pop hl			;ad49
	pop af			;ad4a
	ret			;ad4b
L_AD4C:
	push af			;ad4c
	push hl			;ad4d
	call 098a4h		;ad4e
	pop hl			;ad51
	pop af			;ad52
	ret			;ad53
L_AD54:
	push af			;ad54
	push hl			;ad55
	call 055afh		;ad56
	pop hl			;ad59
	pop af			;ad5a
	ret			;ad5b

; ----------------------------------------------------------------------
; DATOS datos_AD5C: 4 bytes detras de un ret (0x38 0x78 0x00 0x00): SIN LECTOR
;   A LA VISTA; lo leen nadie (4 bytes)
;   0xad5c..0xad60  (4 bytes)
DATA_datos_AD5C:
	defb 038h,078h,000h,000h	; ad5c

; ======================================================================
; CODIGO 0xad60..0xb30a  (1450 bytes)
; ======================================================================


L_AD60:
	call L_B087		;ad60
	ld a,(0e211h)		;ad63
	cp 003h		;ad66
	ret nc			;ad68
	ld a,(0e21eh)		;ad69
	or a			;ad6c
	ret nz			;ad6d
	ld a,(0e21dh)		;ad6e
	cp 008h		;ad71
	ret nc			;ad73
	ld ix,0e271h		;ad74
	ld b,009h		;ad78
L_AD7A:
	push bc			;ad7a
	ld a,(ix+00bh)		;ad7b
	or a			;ad7e
	jr nz,L_ADAC		;ad7f
	ld hl,(0e213h)		;ad81
	ld e,(ix+002h)		;ad84
	ld d,(ix+003h)		;ad87
	call L_AEBD		;ad8a
	ld a,h			;ad8d
	or a			;ad8e
	jr nz,L_ADAC		;ad8f
	ld a,l			;ad91
	cp 00ah		;ad92
	jr nc,L_ADAC		;ad94
	ld hl,(0e218h)		;ad96
	ld e,(ix+007h)		;ad99
	ld d,(ix+008h)		;ad9c
	call L_AEBD		;ad9f
	ld b,a			;ada2
	ld a,h			;ada3
	or a			;ada4
	jr nz,L_ADAC		;ada5
	ld a,l			;ada7
	cp 00ah		;ada8
	jr c,L_ADB5		;adaa
L_ADAC:
	ld bc,00010h		;adac
	add ix,bc		;adaf
	pop bc			;adb1
	djnz L_AD7A		;adb2
	ret			;adb4
L_ADB5:
	ld a,(ix+00dh)		;adb5
	or a			;adb8
	jr nz,L_ADC3		;adb9
	ld a,(0e19fh)		;adbb
	and 00ch		;adbe
	call nz,051dfh		;adc0
L_ADC3:
	ld a,(ix+000h)		;adc3
	pop bc			;adc6
	xor a			;adc7
	ld (0eff4h),a		;adc8
	inc a			;adcb
	ld (0e33ch),a		;adcc
	ld (0ed2ah),a		;adcf
	ld a,006h		;add2
	call 057ffh		;add4   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	ld a,001h		;add7
	ld (0eddfh),a		;add9
	ld a,(0e1d0h)		;addc
	or a			;addf
	jr nz,L_AE5D		;ade0
	ld a,(0ed02h)		;ade2
	or a			;ade5
	jr nz,L_AE5D		;ade6
	ld a,(0eddeh)		;ade8
	or a			;adeb
	jp nz,L_AEA9		;adec
	ld a,(0ed3fh)		;adef
	or a			;adf2
	jr nz,L_AE5D		;adf3
	ld a,(0ecebh)		;adf5
	or a			;adf8
	jr nz,L_AE5D		;adf9
	push ix		;adfb
	ld ix,0e231h		;adfd
	ld de,00010h		;ae01
	ld bc,00405h		;ae04
	ld h,001h		;ae07
L_AE09:
	ld a,(ix+00bh)		;ae09
	and 00fh		;ae0c
	jr z,L_AE23		;ae0e
	dec a			;ae10
	jr z,L_AE37		;ae11
	cp c			;ae13
	jr nz,L_AE1E		;ae14
	bit 6,(ix+00bh)		;ae16
	jr nz,L_AE21		;ae1a
	jr L_AE23		;ae1c
L_AE1E:
	cp c			;ae1e
	jr nc,L_AE23		;ae1f
L_AE21:
	ld c,a			;ae21
	ld h,b			;ae22
L_AE23:
	add ix,de		;ae23
	djnz L_AE09		;ae25
	ld a,004h		;ae27
	sub h			;ae29
	add a,a			;ae2a
	add a,a			;ae2b
	add a,a			;ae2c
	add a,a			;ae2d
	ld e,a			;ae2e
	ld d,000h		;ae2f
	ld ix,0e231h		;ae31
	add ix,de		;ae35
L_AE37:
	ld a,(0ecebh)		;ae37
	or a			;ae3a
	jr nz,L_AE46		;ae3b
	ld a,(0ed3fh)		;ae3d
	or a			;ae40
	jr nz,L_AE46		;ae41
	call 062f7h		;ae43
L_AE46:
	ld (ix+00bh),000h		;ae46
	ld (ix+000h),000h		;ae4a
	pop ix		;ae4e
	ld a,001h		;ae50
	ld (0ed02h),a		;ae52
	call L_B123		;ae55
	ld a,045h		;ae58
	call 057ffh		;ae5a   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_AE5D:
	ld hl,0ed08h		;ae5d
	ld a,(hl)			;ae60
	or a			;ae61
	jr nz,L_AE66		;ae62
	ld (hl),001h		;ae64
L_AE66:
	ld a,(ix+000h)		;ae66
	and 00fh		;ae69
	ld (0e220h),a		;ae6b
	ld a,(0e21dh)		;ae6e
	cp 006h		;ae71
	ld c,040h		;ae73
	ld b,008h		;ae75
	jr c,L_AE8B		;ae77
	ld hl,0e21ah		;ae79
	ld e,(hl)			;ae7c
	inc hl			;ae7d
	ld d,(hl)			;ae7e
	ld a,048h		;ae7f
	ld b,00ah		;ae81
	rl d		;ae83
	jr nc,L_AE8B		;ae85
	ld c,050h		;ae87
	ld b,009h		;ae89
L_AE8B:
	ld a,(ix+00ch)		;ae8b
	cp 0f8h		;ae8e
	jr z,L_AE95		;ae90
	ld (ix+00ch),c		;ae92
L_AE95:
	ld a,(0e220h)		;ae95
	cp 002h		;ae98
	jr nz,L_AEA0		;ae9a
	ld a,b			;ae9c
	call 05716h		;ae9d
L_AEA0:
	call L_AF50		;aea0
	call L_B0B7		;aea3
	call L_AED0		;aea6
L_AEA9:
	xor a			;aea9
	ld (0e302h),a		;aeaa
	ld (0ed39h),a		;aead
	ld (0e21ch),a		;aeb0
	ld (0e21dh),a		;aeb3
	ld a,003h		;aeb6
	ld (0e211h),a		;aeb8
	pop hl			;aebb
	ret			;aebc
L_AEBD:
	ld a,l			;aebd
	sub e			;aebe
	ld l,a			;aebf
	ld a,h			;aec0
	sbc a,d			;aec1
	ld h,a			;aec2
	ld a,000h		;aec3
	ret nc			;aec5
	ld a,h			;aec6
	cpl			;aec7
	ld h,a			;aec8
	ld a,l			;aec9
	cpl			;aeca
	ld l,a			;aecb
	inc hl			;aecc
	ld a,001h		;aecd
	ret			;aecf
L_AED0:
	ld a,(0ed02h)		;aed0
	or a			;aed3
	ret z			;aed4
	ld a,(ix+00dh)		;aed5
	ld b,a			;aed8
	and 002h		;aed9
	ret z			;aedb
	ld a,(0e220h)		;aedc
	ld c,a			;aedf
	ld a,(ix+000h)		;aee0
	and 00fh		;aee3
	cp c			;aee5
	ret nz			;aee6
	ld a,b			;aee7
	rra			;aee8
	rra			;aee9
	rra			;aeea
	rra			;aeeb
	and 00fh		;aeec
	ld c,a			;aeee
	xor a			;aeef
	ld (0e340h),a		;aef0
	ld hl,0eca3h		;aef3
	call L_AF01		;aef6
	ld a,001h		;aef9
	ld (0e340h),a		;aefb
	ld hl,0e23ch		;aefe
L_AF01:
	ld iy,0e231h		;af01
	ld de,00010h		;af05
	ld b,004h		;af08
L_AF0A:
	bit 6,(iy+00dh)		;af0a
	jr nz,L_AF17		;af0e
	ld a,(hl)			;af10
	and 00fh		;af11
	cp c			;af13
	call z,L_AF1D		;af14
L_AF17:
	add hl,de			;af17
	add iy,de		;af18
	djnz L_AF0A		;af1a
	ret			;af1c
L_AF1D:
	push af			;af1d
	push bc			;af1e
	push de			;af1f
	push hl			;af20
	call L_AF29		;af21
	pop hl			;af24
	pop de			;af25
	pop bc			;af26
	pop af			;af27
	ret			;af28
L_AF29:
	ld a,(0e340h)		;af29
	or a			;af2c
	jr nz,L_AF3C		;af2d
	ld c,(hl)			;af2f
	ld de,0f599h		;af30
	add hl,de			;af33
	ld a,(hl)			;af34
	and 047h		;af35
	ret z			;af37
	cp c			;af38
	jr nz,L_AF47		;af39
	ret			;af3b
L_AF3C:
	ld a,040h		;af3c
	or c			;af3e
	ld c,a			;af3f
	ld a,(iy+00bh)		;af40
	and 047h		;af43
	cp c			;af45
	ret nz			;af46
L_AF47:
	ld a,c			;af47
	ld (0ed0dh),a		;af48
	ld (0ed82h),a		;af4b
	jr L_AFBC		;af4e
L_AF50:
	ld a,(0eddeh)		;af50
	or a			;af53
	ret nz			;af54
	ld a,(0ed02h)		;af55
	or a			;af58
	ret nz			;af59
	ld a,(ix+00dh)		;af5a
	ld b,a			;af5d
	and 002h		;af5e
	ret z			;af60
	ld a,(0e220h)		;af61
	ld c,a			;af64
	ld a,(ix+000h)		;af65
	and 00fh		;af68
	cp c			;af6a
	ret nz			;af6b
	ld a,b			;af6c
	rra			;af6d
	rra			;af6e
	rra			;af6f
	rra			;af70
	and 00fh		;af71
	call L_AFF7		;af73
	ret c			;af76
	call L_B03A		;af77
	dec a			;af7a
	jr nz,L_AF81		;af7b
	inc a			;af7d
	ld (0edd7h),a		;af7e
L_AF81:
	ld a,(0e19ah)		;af81
	cp 002h		;af84
	jr nz,L_AFA0		;af86
	call 062f7h		;af88
	jr L_AFA9		;af8b
L_AF8D:
	ld a,(0e340h)		;af8d
	and 00fh		;af90
	ld (0e340h),a		;af92
	cp 002h		;af95
	call z,062f7h		;af97
	ld a,(0e340h)		;af9a
	ld b,a			;af9d
	jr L_AFB0		;af9e
L_AFA0:
	ld a,(0e340h)		;afa0
	and 00fh		;afa3
	dec a			;afa5
	call z,062f7h		;afa6
L_AFA9:
	ld a,(0e340h)		;afa9
	ld b,a			;afac
	and 00fh		;afad
	inc a			;afaf
L_AFB0:
	or 040h		;afb0
	ld (0ed0dh),a		;afb2
	ld (0ed82h),a		;afb5
	ld c,b			;afb8
	call L_B06E		;afb9
L_AFBC:
	ld (hl),000h		;afbc
	ld de,0fff5h		;afbe
	add hl,de			;afc1
	ld (hl),000h		;afc2
	jp L_B123		;afc4
L_AFC7:
	ret			;afc7
L_AFC8:
	push hl			;afc8
	ld hl,0e23ch		;afc9
	ld b,004h		;afcc
L_AFCE:
	ld a,(hl)			;afce
	or a			;afcf
	jr z,L_AFEF		;afd0
	and 00fh		;afd2
	cp 001h		;afd4
	jr z,L_AFE1		;afd6
	push hl			;afd8
	push bc			;afd9
	call L_AFF7		;afda
	pop bc			;afdd
	pop hl			;afde
	jr c,L_AFE9		;afdf
L_AFE1:
	inc hl			;afe1
	inc hl			;afe2
	set 5,(hl)		;afe3
	dec hl			;afe5
	dec hl			;afe6
	jr L_AFEF		;afe7
L_AFE9:
	inc hl			;afe9
	inc hl			;afea
	res 5,(hl)		;afeb
	dec hl			;afed
	dec hl			;afee
L_AFEF:
	ld de,00010h		;afef
	add hl,de			;aff2
	djnz L_AFCE		;aff3
	pop hl			;aff5
	ret			;aff6
L_AFF7:
	push ix		;aff7
	ld ix,0e344h		;aff9
	ld b,004h		;affd
L_AFFF:
	ld (ix+000h),000h		;afff
	dec ix		;b003
	djnz L_AFFF		;b005
	ld (ix+000h),a		;b007
	inc ix		;b00a
	ld c,a			;b00c
	ld b,004h		;b00d
	ld hl,0e23ch		;b00f
	ld d,000h		;b012
L_B014:
	ld a,(hl)			;b014
	ld (ix+000h),a		;b015
	inc ix		;b018
	ld e,a			;b01a
	and 00fh		;b01b
	jr z,L_B023		;b01d
	cp c			;b01f
	jr nc,L_B023		;b020
	inc d			;b022
L_B023:
	push de			;b023
	ld de,00010h		;b024
	add hl,de			;b027
	pop de			;b028
	djnz L_B014		;b029
	ld a,c			;b02b
	sub 002h		;b02c
	cp d			;b02e
	ld a,(0e340h)		;b02f
	pop ix		;b032
	jr c,L_B038		;b034
	scf			;b036
	ret			;b037
L_B038:
	ccf			;b038
	ret			;b039
L_B03A:
	ld hl,0e340h		;b03a
	ld a,(hl)			;b03d
	inc hl			;b03e
	ld d,a			;b03f
	ld e,040h		;b040
	ld bc,00400h		;b042
L_B045:
	ld a,(hl)			;b045
	and 00fh		;b046
	jr z,L_B04E		;b048
	cp d			;b04a
	call c,L_B058		;b04b
L_B04E:
	inc hl			;b04e
	djnz L_B045		;b04f
	ld a,e			;b051
	and 04fh		;b052
	ld (0e340h),a		;b054
	ret			;b057
L_B058:
	cp c			;b058
	jr z,L_B05E		;b059
	ret c			;b05b
	jr L_B061		;b05c
L_B05E:
	bit 6,e		;b05e
	ret z			;b060
L_B061:
	ld a,(hl)			;b061
	ld e,a			;b062
	and 00fh		;b063
	ld c,a			;b065
	ret			;b066
L_B067:
	ld e,04fh		;b067
	ld hl,0eca3h		;b069
	jr L_B077		;b06c
L_B06E:
	ld e,04fh		;b06e
	jr L_B074		;b070
L_B072:
	ld e,00fh		;b072
L_B074:
	ld hl,0e23ch		;b074
L_B077:
	ld b,004h		;b077
L_B079:
	ld a,(hl)			;b079
	and e			;b07a
	cp c			;b07b
	ret z			;b07c
	push de			;b07d
	ld de,00010h		;b07e
	add hl,de			;b081
	pop de			;b082
	djnz L_B079		;b083
	scf			;b085
	ret			;b086
L_B087:
	ld a,(0e220h)		;b087
	and 007h		;b08a
	add a,a			;b08c
	add a,a			;b08d
	add a,a			;b08e
	add a,a			;b08f
	neg		;b090
	ld e,a			;b092
	ld d,0ffh		;b093
	ld hl,0e301h		;b095
	add hl,de			;b098
	push hl			;b099
	pop iy		;b09a
	ld d,(iy+002h)		;b09c
	ld e,(iy+003h)		;b09f
	ld h,(iy+007h)		;b0a2
	ld l,(iy+008h)		;b0a5
	ld (0e340h),de		;b0a8
	ld (0e342h),hl		;b0ac
	push ix		;b0af
	call 06f90h		;b0b1
	pop ix		;b0b4
	ret			;b0b6
L_B0B7:
	ld a,(0e220h)		;b0b7
	ld c,a			;b0ba
	ld a,(ix+000h)		;b0bb
	and 00fh		;b0be
	cp c			;b0c0
	ret nz			;b0c1
	ld a,(ix+00dh)		;b0c2
	ld b,a			;b0c5
	and 002h		;b0c6
	ret z			;b0c8
	ld a,b			;b0c9
	rrca			;b0ca
	rrca			;b0cb
	rrca			;b0cc
	rrca			;b0cd
	and 00fh		;b0ce
	or 040h		;b0d0
	ld c,a			;b0d2
	ld hl,0e23ch		;b0d3
	ld de,00010h		;b0d6
	ld b,004h		;b0d9
L_B0DB:
	ld a,(hl)			;b0db
	and 04fh		;b0dc
	cp c			;b0de
	jr z,L_B0E5		;b0df
	add hl,de			;b0e1
	djnz L_B0DB		;b0e2
	ret			;b0e4
L_B0E5:
	bit 4,(hl)		;b0e5
	ret nz			;b0e7
	set 4,(hl)		;b0e8
	ld a,(0ed02h)		;b0ea
	or a			;b0ed
	jr z,L_B0F5		;b0ee
	inc hl			;b0f0
	inc hl			;b0f1
	bit 6,(hl)		;b0f2
	ret z			;b0f4
L_B0F5:
	and 00fh		;b0f5
	or 080h		;b0f7
	ld (0ed0dh),a		;b0f9
	ld a,001h		;b0fc
	ld (0ecech),a		;b0fe
	ld hl,07e71h		;b101
	call 04ea6h		;b104   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld a,012h		;b107
	jp 057ffh		;b109   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_B10C:
	ld a,(0e220h)		;b10c
	ld l,a			;b10f
	ld a,009h		;b110
	sub l			;b112
	ld l,a			;b113
	ld h,000h		;b114
	add hl,hl			;b116
	add hl,hl			;b117
	add hl,hl			;b118
	add hl,hl			;b119
	ld de,0e273h		;b11a
	add hl,de			;b11d
	ret			;b11e
L_B11F:
	ld c,0ffh		;b11f
	jr L_B125		;b121
L_B123:
	ld c,000h		;b123
L_B125:
	ld a,(0e1a1h)		;b125
	dec a			;b128
	ld hl,07e69h		;b129
	push bc			;b12c
	call nz,04ea6h		;b12d   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	pop bc			;b130
	ld a,042h		;b131
	call 057ffh		;b133   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	ld hl,0e19ah		;b136
	inc (hl)			;b139
	ld a,(hl)			;b13a
	cp 003h		;b13b
	jr nc,L_B159		;b13d
	ld a,(0ed02h)		;b13f
	or a			;b142
	jr z,L_B150		;b143
	ld a,(0e220h)		;b145
	cp 002h		;b148
	jr nz,L_B150		;b14a
	ld a,010h		;b14c
	jr L_B163		;b14e
L_B150:
	ld a,00dh		;b150
	inc c			;b152
	jr nz,L_B163		;b153
	ld a,00fh		;b155
	jr L_B163		;b157
L_B159:
	ld a,(0e30fh)		;b159
	or a			;b15c
	ld a,010h		;b15d
	jr nz,L_B163		;b15f
	ld a,00eh		;b161
L_B163:
	jp 057ffh		;b163   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_B166:
	xor a			;b166
	ld (0e1a5h),a		;b167
	call L_B270		;b16a
	xor a			;b16d
	ld (0ec46h),a		;b16e
	dec a			;b171
	ld (0e1a4h),a		;b172
	ld b,008h		;b175
L_B177:
	push bc			;b177
	xor a			;b178
	ld (0ec40h),a		;b179
	call L_B317		;b17c
	ld (0ec43h),hl		;b17f
	call 05b76h		;b182
	ld hl,0ec42h		;b185
	ld e,(hl)			;b188
	ld a,e			;b189
	add a,020h		;b18a
	ld (hl),a			;b18c
	ld d,000h		;b18d
	ld hl,0de10h		;b18f
	ld bc,02004h		;b192
	ld a,001h		;b195
	ld (0ed9fh),a		;b197
	call L_B1A5		;b19a
	xor a			;b19d
	ld (0ed9fh),a		;b19e
	pop bc			;b1a1
	djnz L_B177		;b1a2
	ret			;b1a4
L_B1A5:
	ld a,(0e1a6h)		;b1a5
	dec a			;b1a8
	jr z,L_B1B2		;b1a9
	dec a			;b1ab
	jp z,05636h		;b1ac
	jp 05613h		;b1af
L_B1B2:
	ld a,(0e1b2h)		;b1b2
	cp 070h		;b1b5
	jp nc,05613h		;b1b7
	jp 055cdh		;b1ba
L_B1BD:
	call L_B23B		;b1bd
	jp nc,L_B24F		;b1c0
	ld a,(0e1b6h)		;b1c3
	ld hl,(0e1a2h)		;b1c6
	ld (0e1b6h),hl		;b1c9
	xor l			;b1cc
	bit 3,a		;b1cd
	ret z			;b1cf
L_B1D0:
	ld a,001h		;b1d0
	ld (0edcbh),a		;b1d2
	ld bc,01001h		;b1d5
L_B1D8:
	ld (0e1afh),bc		;b1d8
	ld a,l			;b1dc
	and 0f8h		;b1dd
	ld (0ec45h),a		;b1df
	call L_B273		;b1e2
	call L_B219		;b1e5
	ld a,(0ec46h)		;b1e8
	ld hl,0de10h		;b1eb
	call 04216h		;b1ee   ; hl_mas_a: HL = HL + A
	ld d,000h		;b1f1
L_B1F3:
	ld b,000h		;b1f3
	ld a,(0e1a5h)		;b1f5
	cp 0ffh		;b1f8
	jr nz,L_B1FE		;b1fa
	ld b,0e0h		;b1fc
L_B1FE:
	ld a,(0ec45h)		;b1fe
	add a,b			;b201
	ld e,a			;b202
	ld bc,(0e1afh)		;b203
	ld a,001h		;b207
	ld (0ed9fh),a		;b209
	call L_B1A5		;b20c
	xor a			;b20f
	ld (0ed9fh),a		;b210
	ret			;b213
L_B214:
	ld bc,02001h		;b214
	jr L_B1D8		;b217
L_B219:
	ld a,(0e1a4h)		;b219
	ld b,a			;b21c
	ld a,(0e1b2h)		;b21d
	cp b			;b220
	ld (0e1a4h),a		;b221
	ret z			;b224
	xor a			;b225
	ld (0ec40h),a		;b226
	call L_B317		;b229
	ld (0ec43h),hl		;b22c
	jp 05b76h		;b22f
L_B232:
	ld a,(0e1c9h)		;b232
	cp 080h		;b235
	ret c			;b237
	neg		;b238
	ret			;b23a
L_B23B:
	call L_B232		;b23b
	cp 009h		;b23e
	ret c			;b240
	ld a,(0e1a2h)		;b241
	ld b,a			;b244
	ld a,(0e1b6h)		;b245
	xor b			;b248
	bit 3,a		;b249
	scf			;b24b
	ret nz			;b24c
	or a			;b24d
	ret			;b24e
L_B24F:
	call L_B25F		;b24f
	call L_B214		;b252
	ld hl,(0e1a2h)		;b255
	ld (0e1b6h),hl		;b258
	call L_B1D0		;b25b
	ret			;b25e
L_B25F:
	ld hl,(0e1b6h)		;b25f
	ld a,(0e1c9h)		;b262
	ld e,a			;b265
	ld d,000h		;b266
	rla			;b268
	jr nc,L_B26C		;b269
	dec d			;b26b
L_B26C:
	sra e		;b26c
	add hl,de			;b26e
	ret			;b26f
L_B270:
	ld hl,(0e1a2h)		;b270
L_B273:
	ld a,l			;b273
	rlca			;b274
	rlca			;b275
	and 060h		;b276
	ld (0ec46h),a		;b278
	ld a,l			;b27b
	and 0e0h		;b27c
	ld (0ec42h),a		;b27e
	srl h		;b281
	rra			;b283
	rra			;b284
	ld (0ec41h),a		;b285
	ld (0e1b2h),a		;b288
	ld b,a			;b28b
	ld a,(0e1a5h)		;b28c
	cp 0ffh		;b28f
	ret nz			;b291
	ld a,038h		;b292
	add a,b			;b294
	ld (0ec41h),a		;b295
	ld (0e1b2h),a		;b298
	ret			;b29b
L_B29C:
	call L_B2A3		;b29c
	call L_B440		;b29f
	ret			;b2a2
L_B2A3:
	ld hl,0edcbh		;b2a3
	ld a,(hl)			;b2a6
	dec a			;b2a7
	ret nz			;b2a8
	ld (hl),000h		;b2a9
	ld a,(0ec46h)		;b2ab
	add a,010h		;b2ae
	ld hl,0de10h		;b2b0
	call 04216h		;b2b3   ; hl_mas_a: HL = HL + A
	ld d,080h		;b2b6
	call L_B1F3		;b2b8
	ld a,(0e1a3h)		;b2bb
	or a			;b2be
	ret nz			;b2bf
	ld a,(0e1a6h)		;b2c0
	dec a			;b2c3
	ret nz			;b2c4
	ld c,0ffh		;b2c5
	ld a,(0ec45h)		;b2c7
	cp 018h		;b2ca
	jr z,L_B2F6		;b2cc
	cp 028h		;b2ce
	jr z,L_B2EB		;b2d0
	cp 008h		;b2d2
	jp z,05da9h		;b2d4
	cp 020h		;b2d7
	ret nz			;b2d9
L_B2DA:
	ld de,04020h		;b2da
	ld a,(0d380h)		;b2dd
	ld hl,0e311h		;b2e0
L_B2E3:
	call 04f1ch		;b2e3   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld d,050h		;b2e6
	jp 04eb5h		;b2e8   ; texto_en_de: pinta el texto HL en la posicion DE (sin [x y] delante)
L_B2EB:
	ld de,0402ch		;b2eb
	ld a,(0d47fh)		;b2ee
	ld hl,0e321h		;b2f1
	jr L_B2E3		;b2f4
L_B2F6:
	ld b,00dh		;b2f6
	ld hl,0b30ah		;b2f8
	ld de,05018h		;b2fb
L_B2FE:
	ld a,(hl)			;b2fe
	inc hl			;b2ff
	call 04f30h		;b300
	ld a,d			;b303
	add a,008h		;b304
	ld d,a			;b306
	djnz L_B2FE		;b307
	ret			;b309

; ----------------------------------------------------------------------
; DATOS resto_B30A: lo apuntan con el banco puesto p03:B2F8 (0xB30A); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:B2F8 (13 bytes)
;   0xb30a..0xb317  (13 bytes)
DATA_resto_B30A:
	defb 002h,003h,004h,005h,006h,007h,00eh,00fh,010h,011h,000h,000h,012h	; b30a  .............

; ======================================================================
; CODIGO 0xb317..0xb69a  (899 bytes)
; ======================================================================


L_B317:
	ld a,(0e1a6h)		;b317
	ld hl,09b28h		;b31a
	or a			;b31d
	ret z			;b31e
	ld hl,0a088h		;b31f
	dec a			;b322
	ret nz			;b323
	ld hl,095b8h		;b324
	ld a,(0ec41h)		;b327
	cp 070h		;b32a
	ret c			;b32c
	ld hl,09a58h		;b32d
	ret			;b330
L_B331:
	ld a,(0e1b1h)		;b331
	or a			;b334
	ret nz			;b335
	ld a,(0e33ch)		;b336
	or a			;b339
	ret z			;b33a
	ld hl,(0e213h)		;b33b
	ld de,0fed0h		;b33e
	add hl,de			;b341
	ret nc			;b342
	ld a,001h		;b343
	ld (0e1b1h),a		;b345
	ret			;b348
L_B349:
	call L_B331		;b349
	ld bc,00040h		;b34c
	ld a,(0e1b1h)		;b34f
	or a			;b352
	ret z			;b353
	ld bc,0001ch		;b354
	ret			;b357
L_B358:
	xor a			;b358
	ld (0e1b5h),a		;b359
	call L_B349		;b35c
	ld hl,(0e1a2h)		;b35f
	ld d,h			;b362
	ld e,l			;b363
	add hl,bc			;b364
	ld (0ec4ah),hl		;b365
	ld (0ec4ch),hl		;b368
	ld h,d			;b36b
	ld l,e			;b36c
	ld bc,0ff20h		;b36d
	add hl,bc			;b370
	ret nc			;b371
	ld h,d			;b372
	ld l,e			;b373
	ld bc,000a8h		;b374
	add hl,bc			;b377
	ld (0ec4ch),hl		;b378
	ex de,hl			;b37b
	ld hl,(0e213h)		;b37c
	ld bc,0fe78h		;b37f
	add hl,bc			;b382
	ret nc			;b383
	ld (0ec4ah),de		;b384
	ld a,001h		;b388
	ld (0e1b5h),a		;b38a
	ret			;b38d
L_B38E:
	ld hl,(0e21dh)		;b38e
	srl h		;b391
	rr l		;b393
	ld d,h			;b395
	ld e,l			;b396
	ld bc,0ff90h		;b397
	add hl,bc			;b39a
	ret nc			;b39b
	ld de,00070h		;b39c
	ret			;b39f
L_B3A0:
	call L_B3A7		;b3a0
	ld (0e1a5h),a		;b3a3
	ret			;b3a6
L_B3A7:
	call L_B3B6		;b3a7
	xor a			;b3aa
	sbc hl,bc		;b3ab
	ret z			;b3ad
	rl h		;b3ae
	ld a,001h		;b3b0
	ret c			;b3b2
	ld a,0ffh		;b3b3
	ret			;b3b5
L_B3B6:
	ld bc,(0e1b3h)		;b3b6
	ld hl,(0e213h)		;b3ba
	ld (0e1b3h),hl		;b3bd
	push hl			;b3c0
	push bc			;b3c1
	call L_B38E		;b3c2
	ld bc,(0e1a7h)		;b3c5
	ld hl,(0e213h)		;b3c9
	or a			;b3cc
	sbc hl,de		;b3cd
	ld (0e1a7h),hl		;b3cf
	ld a,(0e1b5h)		;b3d2
	or a			;b3d5
	jr nz,L_B3DB		;b3d6
	pop de			;b3d8
	pop de			;b3d9
	ret			;b3da
L_B3DB:
	pop bc			;b3db
	pop hl			;b3dc
	ret			;b3dd
L_B3DE:
	call L_B358		;b3de
	call L_B3A0		;b3e1
	ld a,(0e1a5h)		;b3e4
	or a			;b3e7
	ret z			;b3e8
	ld hl,(0e213h)		;b3e9
	ld a,(0e1b5h)		;b3ec
	or a			;b3ef
	jr nz,L_B3F5		;b3f0
	ld hl,(0e1a7h)		;b3f2
L_B3F5:
	ld d,h			;b3f5
	ld e,l			;b3f6
	ld bc,0fe30h		;b3f7
	add hl,bc			;b3fa
	ret c			;b3fb
	ld h,d			;b3fc
	ld l,e			;b3fd
	ld bc,0ffc0h		;b3fe
	ld a,(0e1b1h)		;b401
	or a			;b404
	jr z,L_B40A		;b405
	ld bc,0ffe4h		;b407
L_B40A:
	add hl,bc			;b40a
	ret nc			;b40b
	ld h,d			;b40c
	ld l,e			;b40d
	or a			;b40e
	ld a,(0e1a5h)		;b40f
	inc a			;b412
	jr z,L_B420		;b413
	ld de,(0ec4ah)		;b415
	sbc hl,de		;b419
	rl h		;b41b
	jr c,L_B42A		;b41d
	ret			;b41f
L_B420:
	ld de,(0ec4ch)		;b420
	sbc hl,de		;b424
	ret z			;b426
	rl h		;b427
	ret c			;b429
L_B42A:
	ld a,l			;b42a
	ld (0e1c9h),a		;b42b
	ld c,a			;b42e
	ld hl,(0e1a2h)		;b42f
	rla			;b432
	ld b,000h		;b433
	jr nc,L_B438		;b435
	dec b			;b437
L_B438:
	add hl,bc			;b438
	ld (0e1a2h),hl		;b439
	call L_B1BD		;b43c
	ret			;b43f
L_B440:
	ld a,(0e1a2h)		;b440
L_B443:
	ld c,017h		;b443
	ld b,a			;b445
	jp 00047h		;b446   ; BIOS WRTVDP - Writes data in the VDP-register
L_B449:
	xor a			;b449
	ld (0e1a2h),a		;b44a
	jr L_B443		;b44d
L_B44F:
	xor a			;b44f
	ld (0e1d1h),a		;b450   ; guarda la marca de 'acabado' que dejan las rutinas de cada paso
	ld hl,0e331h		;b453
	ld (hl),080h		;b456
	ld a,(0e1a6h)		;b458
	dec a			;b45b
	jr nz,L_B46F		;b45c
	ld hl,0e1a2h		;b45e
	ld de,0fffch		;b461
	add hl,de			;b464
	jr c,L_B46F		;b465
	ld hl,00000h		;b467
	ld (0e1a2h),hl		;b46a
	jr L_B498		;b46d
L_B46F:
	ld hl,00000h		;b46f
	call L_B47E		;b472
	call L_B4AD		;b475
	jp 04bb8h		;b478   ; enciende_pantalla: R#1 con el bit 6 (BL) a 1 (WRTVDP)
L_B47B:
	ld hl,000e0h		;b47b
L_B47E:
	ld (0e1a2h),hl		;b47e
	ld (0e1b6h),hl		;b481
	call 04bc5h		;b484   ; apaga_pantalla: R#1 con el bit 6 (BL) a 0 (WRTVDP)
	call L_B440		;b487
	inc a			;b48a
	ld (0e1a6h),a		;b48b
	call 054efh		;b48e
L_B491:
	xor a			;b491
	ld (0edcbh),a		;b492
	call L_B166		;b495
L_B498:
	call 05c7dh		;b498   ; esconde_atributos: pone las 32 fichas de sprite de 0xE100 fuera de la pantalla
	call 05b1fh		;b49b
	call 05c73h		;b49e
	jp 051beh		;b4a1
L_B4A4:
	call 04bc5h		;b4a4   ; apaga_pantalla: R#1 con el bit 6 (BL) a 0 (WRTVDP)
	call L_B491		;b4a7
	jp 04bb8h		;b4aa   ; enciende_pantalla: R#1 con el bit 6 (BL) a 1 (WRTVDP)
L_B4AD:
	ld c,0ffh		;b4ad
	call L_B2EB		;b4af
	ld c,0ffh		;b4b2
	call L_B2DA		;b4b4
	ld c,0ffh		;b4b7
	call L_B2F6		;b4b9
	ld c,0ffh		;b4bc
	jp 05da9h		;b4be
L_B4C1:
	ld a,(0ed23h)		;b4c1
	ld b,a			;b4c4
	djnz L_B4D2		;b4c5
	ld a,(0ed21h)		;b4c7
	or a			;b4ca
	jp nz,06974h		;b4cb
	ld (0ed23h),a		;b4ce
	ret			;b4d1
L_B4D2:
	xor a			;b4d2
	ld (0ed21h),a		;b4d3
	ld c,043h		;b4d6
	call L_B067		;b4d8
	call nc,L_B508		;b4db
	ld c,044h		;b4de
	call L_B067		;b4e0
	call nc,L_B508		;b4e3
	ld a,060h		;b4e6
	ld (0ed22h),a		;b4e8
	ld hl,0e231h		;b4eb
	ld de,0e232h		;b4ee
	ld bc,0003fh		;b4f1
	ld (hl),000h		;b4f4
	ldir		;b4f6
	call L_B518		;b4f8
	ld c,042h		;b4fb
	call L_B067		;b4fd
	call nc,L_B510		;b500
	ld hl,0ed23h		;b503
	inc (hl)			;b506
	ret			;b507
L_B508:
	call 066ebh		;b508
	ld hl,0ed21h		;b50b
	inc (hl)			;b50e
	ret			;b50f
L_B510:
	ld hl,0b24fh		;b510
	ld de,0e241h		;b513
	jr L_B51E		;b516
L_B518:
	ld hl,0b23fh		;b518
	ld de,0e231h		;b51b
L_B51E:
	ld bc,00010h		;b51e
	jp 05da1h		;b521
L_B524:
	call L_B607		;b524
	ld (0ece7h),hl		;b527
	call L_B629		;b52a
	ld (0ece9h),hl		;b52d
	ret			;b530
L_B531:
	call L_B5E8		;b531
	xor a			;b534
	ld (0e1b8h),a		;b535
	call L_B5BE		;b538
	call L_B5A3		;b53b
	call L_B588		;b53e
	ret nc			;b541
	ld a,001h		;b542
	ld (0e1b8h),a		;b544
	call L_B558		;b547
	call L_B5BE		;b54a
	call L_B57B		;b54d
	call L_B588		;b550
	ret nc			;b553
	ld hl,0e1b8h		;b554
	inc (hl)			;b557
L_B558:
	ld hl,(0ece9h)		;b558
	ld de,(0e1bfh)		;b55b
	call L_B573		;b55f
	ld (0ece9h),hl		;b562
	ld hl,(0ece7h)		;b565
	ld de,(0e1c1h)		;b568
	call L_B573		;b56c
	ld (0ece7h),hl		;b56f
	ret			;b572
L_B573:
	add hl,de			;b573
	bit 7,h		;b574
	ret z			;b576
	ld hl,00000h		;b577
	ret			;b57a
L_B57B:
	ld hl,0e1b9h		;b57b
	ld a,(hl)			;b57e
	add a,00ch		;b57f
	ld (hl),a			;b581
	inc hl			;b582
	ld a,(hl)			;b583
	add a,009h		;b584
	ld (hl),a			;b586
	ret			;b587
L_B588:
	ld de,(0e1bbh)		;b588
	ld a,(0e1b9h)		;b58c
	ld l,a			;b58f
	ld h,000h		;b590
	call 00020h		;b592   ; BIOS DCOMPR - Compares HL with DE
	ret c			;b595
	ld de,(0e1bdh)		;b596
	ld a,(0e1bah)		;b59a
	ld l,a			;b59d
	ld h,000h		;b59e
	jp 00020h		;b5a0   ; BIOS DCOMPR - Compares HL with DE
L_B5A3:
	ld hl,(0e226h)		;b5a3
	push hl			;b5a6
	add hl,hl			;b5a7
	add hl,hl			;b5a8
	push hl			;b5a9
	add hl,hl			;b5aa
	pop de			;b5ab
	push hl			;b5ac
	add hl,de			;b5ad
	ld a,h			;b5ae
	add a,006h		;b5af
	ld (0e1b9h),a		;b5b1
	pop hl			;b5b4
	pop de			;b5b5
	add hl,de			;b5b6
	ld a,h			;b5b7
	add a,007h		;b5b8
	ld (0e1bah),a		;b5ba
	ret			;b5bd
L_B5BE:
	ld l,(ix+002h)		;b5be
	ld h,(ix+003h)		;b5c1
	ld de,(0ece7h)		;b5c4
	call L_B5DF		;b5c8
	ld (0e1bdh),hl		;b5cb
	ld l,(ix+007h)		;b5ce
	ld h,(ix+008h)		;b5d1
	ld de,(0ece9h)		;b5d4
	call L_B5DF		;b5d8
	ld (0e1bbh),hl		;b5db
	ret			;b5de
L_B5DF:
	or a			;b5df
	sbc hl,de		;b5e0
	bit 7,h		;b5e2
	call nz,05f71h		;b5e4
	ret			;b5e7
L_B5E8:
	ld hl,(0e21ah)		;b5e8
	call L_B5FB		;b5eb
	ld (0e1bfh),hl		;b5ee
	ld hl,(0e215h)		;b5f1
	call L_B5FB		;b5f4
	ld (0e1c1h),hl		;b5f7
	ret			;b5fa
L_B5FB:
	add hl,hl			;b5fb
	add hl,hl			;b5fc
	add hl,hl			;b5fd
	add hl,hl			;b5fe
	ld l,h			;b5ff
	bit 7,h		;b600
	ld h,000h		;b602
	ret z			;b604
	dec h			;b605
	ret			;b606
L_B607:
	ld hl,(0e215h)		;b607
	ld a,h			;b60a
	rla			;b60b
	jr c,L_B616		;b60c
	call L_B643		;b60e
	ld de,00184h		;b611
	add hl,de			;b614
	ret			;b615
L_B616:
	call 05f71h		;b616
	call L_B643		;b619
	ld de,00184h		;b61c
L_B61F:
	ex de,hl			;b61f
	sbc hl,de		;b620
	ld a,h			;b622
	rla			;b623
	ret nc			;b624
	ld hl,00000h		;b625
	ret			;b628
L_B629:
	ld hl,(0e21ah)		;b629
	ld a,h			;b62c
	rla			;b62d
	jr c,L_B638		;b62e
	call L_B643		;b630
	ld de,00138h		;b633
	add hl,de			;b636
	ret			;b637
L_B638:
	call 05f71h		;b638
	call L_B643		;b63b
	ld de,00138h		;b63e
	jr L_B61F		;b641
L_B643:
	srl h		;b643
	rr l		;b645
	srl h		;b647
	rr l		;b649
	ld e,l			;b64b
	ld d,000h		;b64c
	ld hl,(0e226h)		;b64e
	srl h		;b651
	rr l		;b653
	srl h		;b655
	rr l		;b657
	ld a,h			;b659
	ld c,l			;b65a
	ld hl,00000h		;b65b
	or a			;b65e
L_B65F:
	jr z,L_B665		;b65f
	add hl,de			;b661
	dec a			;b662
	jr L_B65F		;b663
L_B665:
	push hl			;b665
	ld a,c			;b666
	call 05fa4h		;b667   ; multiplica: HL = A x E (8 x 8 bits)
	ld e,h			;b66a
	ld d,000h		;b66b
	pop hl			;b66d
	add hl,de			;b66e
	ret			;b66f
L_B670:
	call 04bc5h		;b670   ; apaga_pantalla: R#1 con el bit 6 (BL) a 0 (WRTVDP)
	call 04c25h		;b673
	ld hl,02870h		;b676
	ld bc,0a830h		;b679
	xor a			;b67c
	ld d,001h		;b67d
	call 04d2ah		;b67f   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
	call 057c6h		;b682
	call 04bb8h		;b685   ; enciende_pantalla: R#1 con el bit 6 (BL) a 1 (WRTVDP)
	ld hl,0de0dh		;b688
	ld (hl),03ch		;b68b
	inc hl			;b68d
	ld (hl),031h		;b68e
	inc hl			;b690
	ld (hl),000h		;b691
	ret			;b693
L_B694:
	ld a,(0e1a1h)		;b694
	call 04220h		;b697   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_B69A: 6 destinos del despachador p00:4220 (call en p03:B697, el
;   indice en A): BC22, B6A6, B967, B995, B9B2, B9BA; lo leen p03:B697 (12
;   bytes)
;   0xb69a..0xb6a6  (12 bytes)
DATA_tabla_B69A:
	defw 0bc22h,0b6a6h,0b967h,0b995h,0b9b2h,0b9bah	; b69a

; ======================================================================
; CODIGO 0xb6a6..0xbaaf  (1033 bytes)
; ======================================================================


L_B6A6:
	call L_BB73		;b6a6
	ld hl,0e1aah		;b6a9
	bit 5,(hl)		;b6ac
	jr nz,L_B712		;b6ae
	ld de,07c62h		;b6b0
	ld hl,0d389h		;b6b3
	ld b,00ah		;b6b6
L_B6B8:
	ld a,(hl)			;b6b8
	dec hl			;b6b9
	or a			;b6ba
	jr nz,L_B6C1		;b6bb
	djnz L_B6B8		;b6bd
	jr L_B6EB		;b6bf
L_B6C1:
	ld de,07c33h		;b6c1
	ld hl,0e206h		;b6c4
	ld a,(hl)			;b6c7
	inc hl			;b6c8
	or (hl)			;b6c9
	jr nz,L_B6EB		;b6ca
	ld hl,0e1fch		;b6cc
	ld b,004h		;b6cf
L_B6D1:
	ld a,(hl)			;b6d1
	inc hl			;b6d2
	add a,(hl)			;b6d3
	inc hl			;b6d4
	jr z,L_B6EB		;b6d5
	djnz L_B6D1		;b6d7
	ld de,07c4bh		;b6d9
	ld b,00ch		;b6dc
	ld hl,0e1b4h		;b6de
L_B6E1:
	ld a,(hl)			;b6e1
	inc hl			;b6e2
	add a,(hl)			;b6e3
	jr z,L_B6EB		;b6e4
	inc hl			;b6e6
	djnz L_B6E1		;b6e7
	jr L_B6FA		;b6e9
L_B6EB:
	ex de,hl			;b6eb
	push hl			;b6ec
	call L_BDD4		;b6ed
	pop hl			;b6f0
	call 04ea6h		;b6f1   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld a,005h		;b6f4
	ld (0e1a1h),a		;b6f6
	ret			;b6f9
L_B6FA:
	call 04bd2h		;b6fa   ; esconde_sprites: escribe 0xD8 (Y = 216: no se pinta ninguno) en la VRAM 0xF600, el primer atributo de sprite
	call L_BDD4		;b6fd
	ld hl,07b99h		;b700
	call 04ea6h		;b703   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	xor a			;b706
	ld (0dd0ch),a		;b707
	call L_BCE5		;b70a
	ld hl,0e1a1h		;b70d
	inc (hl)			;b710
	ret			;b711
L_B712:
	call 05b1fh		;b712
	call 05c73h		;b715
	xor a			;b718
	ld (0e1afh),a		;b719
	call L_B805		;b71c
	call L_B8BD		;b71f
	call L_B76F		;b722
	ret z			;b725
	ld a,(0e1a2h)		;b726
	or a			;b729
	jr z,L_B747		;b72a
	cp 00dh		;b72c
	jr c,L_B752		;b72e
	sub 00ch		;b730
	ld b,a			;b732
	ld a,0edh		;b733
	ld d,013h		;b735
L_B737:
	add a,d			;b737
	djnz L_B737		;b738
	ld d,a			;b73a
	ld a,(0e1b3h)		;b73b
	add a,d			;b73e
	ld hl,0d433h		;b73f
	call 04216h		;b742   ; hl_mas_a: HL = HL + A
	jr L_B765		;b745
L_B747:
	ld a,(0e1b3h)		;b747
	ld hl,0d380h		;b74a
	call 04216h		;b74d   ; hl_mas_a: HL = HL + A
	jr L_B765		;b750
L_B752:
	ld b,a			;b752
	ld a,0f2h		;b753
	ld d,00eh		;b755
L_B757:
	add a,d			;b757
	djnz L_B757		;b758
	ld d,a			;b75a
	ld a,(0e1b3h)		;b75b
	add a,d			;b75e
	ld hl,0d38bh		;b75f
	call 04216h		;b762   ; hl_mas_a: HL = HL + A
L_B765:
	ld a,(0e1afh)		;b765
	cp 09fh		;b768
	jr nz,L_B76D		;b76a
	xor a			;b76c
L_B76D:
	ld (hl),a			;b76d
	ret			;b76e
L_B76F:
	ld hl,0e1a3h		;b76f
	ld a,(hl)			;b772
	ld (0e1b3h),a		;b773
	dec hl			;b776
	ld a,(hl)			;b777
	inc hl			;b778
	or a			;b779
	jr z,L_B7A5		;b77a
	cp 00dh		;b77c
	jr c,L_B78D		;b77e
	ld a,(hl)			;b780
	cp 006h		;b781
	jr c,L_B7C3		;b783
	jr z,L_B7B9		;b785
	cp 007h		;b787
	jr z,L_B7BE		;b789
	jr L_B796		;b78b
L_B78D:
	ld a,(hl)			;b78d
	cp 006h		;b78e
	jr c,L_B7C3		;b790
	cp 007h		;b792
	jr c,L_B7B9		;b794
L_B796:
	call L_B8CC		;b796
	ld a,(0e1afh)		;b799
	or a			;b79c
	ret z			;b79d
	call 05d35h		;b79e
	jr nc,L_B7C6		;b7a1
	xor a			;b7a3
	ret			;b7a4
L_B7A5:
	call L_B7E7		;b7a5
	jr z,L_B7B4		;b7a8
	call L_B8CC		;b7aa
	ld a,(0e1afh)		;b7ad
	or a			;b7b0
	ret z			;b7b1
	jr L_B7C6		;b7b2
L_B7B4:
	call L_B90A		;b7b4
	jr L_B7C6		;b7b7
L_B7B9:
	call L_B93E		;b7b9
	jr L_B7C6		;b7bc
L_B7BE:
	call L_B951		;b7be
	jr L_B7C6		;b7c1
L_B7C3:
	call L_B87B		;b7c3
L_B7C6:
	ld a,(0e1afh)		;b7c6
	or a			;b7c9
	ret z			;b7ca
	cp 09fh		;b7cb
	ld de,(0e100h)		;b7cd   ; lee los atributos de sprite (32 fichas de 4 bytes [y][x][dibujo][color]) y el byte siguiente (16 bits)
	jr nz,L_B7D4		;b7d1
	xor a			;b7d3
L_B7D4:
	inc e			;b7d4
	call 04f1ch		;b7d5   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld a,008h		;b7d8
	ld hl,0e1a2h		;b7da
	ld c,(hl)			;b7dd
	inc hl			;b7de
	ld b,(hl)			;b7df
	ld a,001h		;b7e0
	ld (0e1b1h),a		;b7e2
	jr L_B821		;b7e5
L_B7E7:
	ld a,(0e1a4h)		;b7e7
	cp 0ffh		;b7ea
	ret nz			;b7ec
	ld a,(0e1a5h)		;b7ed
	and 003h		;b7f0
	cp 003h		;b7f2
	ret nz			;b7f4
	ld a,(0e1adh)		;b7f5
	and 0f8h		;b7f8
	cp 0f8h		;b7fa
	ret nz			;b7fc
	ld a,(0e1aeh)		;b7fd
	and 01fh		;b800
	cp 01fh		;b802
	ret			;b804
L_B805:
	ld a,(0de07h)		;b805   ; lee los botones pulsados del mando 1 / cursores
	and 00fh		;b808
	ret z			;b80a
	ld hl,0e1b1h		;b80b
	dec (hl)			;b80e
	ret nz			;b80f
	ld (hl),008h		;b810
	ld hl,0e1a2h		;b812
	ld c,(hl)			;b815
	inc hl			;b816
	ld b,(hl)			;b817
	rra			;b818
	jr c,L_B859		;b819
	rra			;b81b
	jr c,L_B850		;b81c
	rra			;b81e
	jr c,L_B837		;b81f
L_B821:
	ld a,c			;b821
	ld c,00ah		;b822
	or a			;b824
	jr z,L_B82F		;b825
	ld c,00eh		;b827
	cp 00dh		;b829
	jr c,L_B82F		;b82b
	ld c,013h		;b82d
L_B82F:
	ld a,b			;b82f
	inc a			;b830
	cp c			;b831
	jr c,L_B84C		;b832
	jp L_BBF3		;b834
L_B837:
	ld a,c			;b837
	ld c,009h		;b838
	or a			;b83a
	jr z,L_B845		;b83b
	ld c,00dh		;b83d
	cp 00dh		;b83f
	jr c,L_B845		;b841
	ld c,012h		;b843
L_B845:
	ld a,b			;b845
	dec a			;b846
	cp 0ffh		;b847
	jr c,L_B84C		;b849
	ld a,c			;b84b
L_B84C:
	ld (hl),a			;b84c
	jp L_BBF3		;b84d
L_B850:
	ld a,c			;b850
	inc a			;b851
	cp 011h		;b852
	jr c,L_B861		;b854
	xor a			;b856
	jr L_B861		;b857
L_B859:
	ld a,c			;b859
	dec a			;b85a
	cp 0ffh		;b85b
	jr c,L_B861		;b85d
	ld a,010h		;b85f
L_B861:
	dec hl			;b861
	ld (hl),a			;b862
	ld c,009h		;b863
	or a			;b865
	jr z,L_B870		;b866
	ld c,00dh		;b868
	cp 00bh		;b86a
	jr c,L_B870		;b86c
	ld c,012h		;b86e
L_B870:
	ld a,b			;b870
	cp c			;b871
	jp c,L_BBF3		;b872
	ld a,c			;b875
	inc hl			;b876
	ld (hl),a			;b877
	jp L_BBF3		;b878
L_B87B:
	ld a,(0e1ach)		;b87b
	rra			;b87e
	jr c,L_B885		;b87f
	ld a,09fh		;b881
	jr L_B8B3		;b883
L_B885:
	ld a,(0fcadh)		;b885
	or a			;b888
	ld hl,0bab3h		;b889
	jr z,L_B891		;b88c
	ld hl,0bb13h		;b88e
L_B891:
	ld de,0e1a4h		;b891
	ld c,006h		;b894
L_B896:
	ld b,008h		;b896
	ld a,(de)			;b898
	inc de			;b899
L_B89A:
	rra			;b89a
	jr nc,L_B8A6		;b89b
	inc hl			;b89d
	djnz L_B89A		;b89e
	dec c			;b8a0
	jr nz,L_B896		;b8a1
	xor a			;b8a3
	jr L_B8B3		;b8a4
L_B8A6:
	ld a,(0e1aah)		;b8a6
	and 001h		;b8a9
	jr nz,L_B8B2		;b8ab
	ld a,030h		;b8ad
	call 04216h		;b8af   ; hl_mas_a: HL = HL + A
L_B8B2:
	ld a,(hl)			;b8b2
L_B8B3:
	ld hl,0e1b0h		;b8b3
	cp (hl)			;b8b6
	ret z			;b8b7
	ld (hl),a			;b8b8
L_B8B9:
	ld (0e1afh),a		;b8b9
	ret			;b8bc
L_B8BD:
	ld hl,0e1aeh		;b8bd
	ld b,00bh		;b8c0
L_B8C2:
	ld a,b			;b8c2
	dec a			;b8c3
	call 00141h		;b8c4   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	ld (hl),a			;b8c7
	dec hl			;b8c8
	djnz L_B8C2		;b8c9
	ret			;b8cb
L_B8CC:
	ld a,(0e1a4h)		;b8cc
	ld bc,00801h		;b8cf
L_B8D2:
	rra			;b8d2
	jr nc,L_B901		;b8d3
	inc c			;b8d5
	djnz L_B8D2		;b8d6
	ld a,(0e1a5h)		;b8d8
	ld b,002h		;b8db
L_B8DD:
	rra			;b8dd
	jr nc,L_B901		;b8de
	inc c			;b8e0
	djnz L_B8DD		;b8e1
	ld a,(0e1adh)		;b8e3
	ld b,005h		;b8e6
	ld c,001h		;b8e8
	rra			;b8ea
	rra			;b8eb
	rra			;b8ec
L_B8ED:
	rra			;b8ed
	jr nc,L_B901		;b8ee
	inc c			;b8f0
	djnz L_B8ED		;b8f1
	ld a,(0e1aeh)		;b8f3
	ld b,005h		;b8f6
L_B8F8:
	rra			;b8f8
	jr nc,L_B901		;b8f9
	inc c			;b8fb
	djnz L_B8F8		;b8fc
	xor a			;b8fe
	jr L_B8B3		;b8ff
L_B901:
	ld a,c			;b901
	ld hl,0e1b0h		;b902
	cp (hl)			;b905
	ret z			;b906
	ld (hl),a			;b907
	jr L_B8B9		;b908
L_B90A:
	ld a,(0e1ach)		;b90a
	rra			;b90d
	jr c,L_B915		;b90e
	ld a,09fh		;b910
	jp L_B8B3		;b912
L_B915:
	ld a,(0e1a6h)		;b915
	ld d,010h		;b918
	rla			;b91a
	jr nc,L_B93A		;b91b
	ld d,00fh		;b91d
	rla			;b91f
	jr nc,L_B93A		;b920
	ld hl,0e1a7h		;b922
	ld d,011h		;b925
	ld c,003h		;b927
L_B929:
	ld b,008h		;b929
	ld a,(hl)			;b92b
L_B92C:
	rra			;b92c
	jr nc,L_B93A		;b92d
	inc d			;b92f
	djnz L_B92C		;b930
	inc hl			;b932
	dec c			;b933
	jr nz,L_B929		;b934
	xor a			;b936
	jp L_B8B3		;b937
L_B93A:
	ld a,d			;b93a
	jp L_B8B3		;b93b
L_B93E:
	ld a,(0e1a8h)		;b93e
	rla			;b941
	ld d,020h		;b942
	jr nc,L_B93A		;b944
	rra			;b946
	rra			;b947
	rra			;b948
	ld d,01ah		;b949
	jr nc,L_B93A		;b94b
	xor a			;b94d
	jp L_B8B3		;b94e
L_B951:
	ld a,(0e1a9h)		;b951
	ld d,023h		;b954
	bit 2,a		;b956
	jr z,L_B93A		;b958
	ld a,(0e1a7h)		;b95a
	ld d,012h		;b95d
	bit 1,a		;b95f
	jr z,L_B93A		;b961
	xor a			;b963
	jp L_B8B3		;b964
L_B967:
	ld a,(0de06h)		;b967   ; lee los botones recien pulsados del mando 1 / cursores
	and 013h		;b96a
	ret z			;b96c
	bit 4,a		;b96d
	jp z,L_BCDE		;b96f
	ld a,(0dd0ch)		;b972
	or a			;b975
	jr z,L_B986		;b976
	call L_BDF4		;b978
	ld hl,0e1aah		;b97b
	set 5,(hl)		;b97e
	ld a,001h		;b980
	ld (0e1a1h),a		;b982
	ret			;b985
L_B986:
	xor a			;b986
	ld (0d2b0h),a		;b987
	ld (0dd0ch),a		;b98a
	call L_BCE5		;b98d
L_B990:
	ld hl,0e1a1h		;b990
	inc (hl)			;b993
	ret			;b994
L_B995:
	call 05832h		;b995
	ld a,(0d2b1h)		;b998
	or a			;b99b
	ret z			;b99c
	sub 002h		;b99d
	jr z,L_B9AA		;b99f
	call L_BDE6		;b9a1
	ld hl,07c22h		;b9a4
	call 04ea6h		;b9a7   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
L_B9AA:
	ld a,0b4h		;b9aa
	ld (0d2e1h),a		;b9ac
	jp L_B990		;b9af
L_B9B2:
	ld hl,0d2e1h		;b9b2
	dec (hl)			;b9b5
	ret nz			;b9b6
	jp 0451dh		;b9b7
L_B9BA:
	call L_B8BD		;b9ba
	ld hl,0e1aah		;b9bd
	set 5,(hl)		;b9c0
	ld hl,0e1a4h		;b9c2
	ld b,00ah		;b9c5
	ld c,000h		;b9c7
L_B9C9:
	ld a,(hl)			;b9c9
	inc hl			;b9ca
	cp 0ffh		;b9cb
	jr nz,L_B9D2		;b9cd
	djnz L_B9C9		;b9cf
	ret			;b9d1
L_B9D2:
	ld a,001h		;b9d2
	ld (0e1a1h),a		;b9d4
	jp L_BDF4		;b9d7
L_B9DA:
	call 04b9fh		;b9da   ; borra_pantalla: esconde los sprites, apaga la pantalla, rellena la VRAM de 0, R#23 = 0 y la enciende
	call L_BE18		;b9dd
	xor a			;b9e0
	ld (0ede6h),a		;b9e1
	ld (0dd0ch),a		;b9e4
	ld (0e1a2h),a		;b9e7
	call 05c7dh		;b9ea   ; esconde_atributos: pone las 32 fichas de sprite de 0xE100 fuera de la pantalla
	call 05202h		;b9ed
	call 052b5h		;b9f0
	xor a			;b9f3
	ld de,02202h		;b9f4
	call 04bf0h		;b9f7   ; pon_color: el color A de la paleta a D (rojo-azul) y E (verde), por R#16, y su copia en 0xDDC0 + 2 x A
	call L_BA8B		;b9fa
	ld hl,0baafh		;b9fd
	ld de,0e100h		;ba00   ; apunta a los atributos de sprite (32 fichas de 4 bytes [y][x][dibujo][color])
	ld bc,00004h		;ba03
	ldir		;ba06
	ld de,0d381h		;ba08
	ld hl,0d380h		;ba0b
	ld bc,000ffh		;ba0e
	ld (hl),000h		;ba11
	ldir		;ba13
	ld hl,0d391h		;ba15
	ld b,00ch		;ba18
L_BA1A:
	ld (hl),020h		;ba1a
	inc hl			;ba1c
	push bc			;ba1d
	ld d,h			;ba1e
	ld e,l			;ba1f
	inc de			;ba20
	ld (hl),001h		;ba21
	ld bc,00006h		;ba23
	ldir		;ba26
	pop bc			;ba28
	ld de,00007h		;ba29
	add hl,de			;ba2c
	djnz L_BA1A		;ba2d
	ld hl,0d392h		;ba2f
	ld de,0000dh		;ba32
	ld b,00ch		;ba35
L_BA37:
	ld (hl),002h		;ba37
	inc hl			;ba39
	ld (hl),006h		;ba3a
	add hl,de			;ba3c
	djnz L_BA37		;ba3d
	ld hl,0d439h		;ba3f
	ld b,004h		;ba42
L_BA44:
	ld (hl),020h		;ba44
	inc hl			;ba46
	ld (hl),023h		;ba47
	inc hl			;ba49
	ld d,h			;ba4a
	ld e,l			;ba4b
	inc de			;ba4c
	ld (hl),001h		;ba4d
	push bc			;ba4f
	ld bc,0000ah		;ba50
	ldir		;ba53
	pop bc			;ba55
	ld de,00007h		;ba56
	add hl,de			;ba59
	djnz L_BA44		;ba5a
	ld de,0e1a2h		;ba5c
	ld hl,0e1a1h		;ba5f
	ld bc,000ffh		;ba62
	ld (hl),000h		;ba65
	ldir		;ba67
	ld hl,0e1b4h		;ba69
	ld b,00ch		;ba6c
L_BA6E:
	ld (hl),050h		;ba6e
	inc hl			;ba70
	ld (hl),001h		;ba71
	inc hl			;ba73
	djnz L_BA6E		;ba74
	ld hl,00480h		;ba76
	ld (0e206h),hl		;ba79
	ld hl,0e1b1h		;ba7c
	ld (hl),00ch		;ba7f
	inc hl			;ba81
	ld (hl),00ch		;ba82
	call L_B8BD		;ba84
	call L_BDC1		;ba87
	ret			;ba8a
L_BA8B:
	ld hl,07ec6h		;ba8b
	call 04ea6h		;ba8e   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld hl,07815h		;ba91
	ld bc,0500dh		;ba94
	call 04c91h		;ba97   ; linea: orden LINE (0x70) del VDP desde HL
	ld hl,0288ah		;ba9a
	ld bc,0d00dh		;ba9d
	call 04c91h		;baa0   ; linea: orden LINE (0x70) del VDP desde HL
	ld hl,028c5h		;baa3
	ld bc,0d00dh		;baa6
	call 04c91h		;baa9   ; linea: orden LINE (0x70) del VDP desde HL
	jp 05d98h		;baac

; ----------------------------------------------------------------------
; DATOS resto_BAAF: lo apuntan con el banco puesto p03:B9FD (0xBAAF), p03:B889
;   (0xBAB3), p03:B88E (0xBB13); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p03:B9FD, p03:B889, p03:B88E (196 bytes)
;   0xbaaf..0xbb73  (196 bytes)
DATA_resto_BAAF:
	defb 00bh,078h,00ch,00ah,041h,029h,02ah,02bh,02ch,02dh,03dh,03eh,03fh,040h,04fh,050h	; baaf  .x..A)*+,-=>?@OP
	defb 051h,052h,053h,04bh,00ch,00dh,04eh,054h,055h,056h,033h,03ch,03ah,035h,030h,036h	; babf  QRSK..NTUV3<:506
	defb 037h,047h,044h,048h,049h,04ah,04dh,04ch,045h,046h,02eh,031h,034h,032h,043h,03bh	; bacf  7GDHIJMLEF.142C.
	defb 02fh,039h,042h,038h,000h,057h,058h,059h,05ah,05bh,000h,000h,000h,000h,00eh,000h	; badf  /9B8.WXYZ[......
	defb 000h,000h,000h,000h,00eh,000h,05eh,000h,000h,000h,000h,000h,05fh,000h,000h,000h	; baef  ......^....._...
	defb 000h,000h,000h,000h,000h,000h,05dh,05ch,000h,000h,000h,000h,000h,000h,000h,000h	; baff  ......]\........
	defb 000h,000h,000h,000h,054h,03fh,044h,029h,02bh,02ch,02dh,04ch,04dh,04eh,046h,045h	; bb0f  ....T?D)+,-LMNFE
	defb 00eh,00ch,00dh,052h,031h,049h,040h,051h,04ah,053h,039h,032h,037h,034h,02ah,042h	; bb1f  ...R1I@QJS9274*B
	defb 02fh,030h,03eh,047h,041h,050h,04bh,048h,04fh,036h,038h,035h,03ch,02eh,03dh,043h	; bb2f  /0>GAPKHO685<.=C
	defb 03bh,033h,056h,03ah,000h,000h,000h,057h,059h,05ah,05bh,05ch,05dh,05eh,00eh,000h	; bb3f  .3V:...WYZ[\]^..
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,058h,000h	; bb4f  ..............X.
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; bb5f  ................
	defb 000h,000h,000h,05fh	; bb6f

; ======================================================================
; CODIGO 0xbb73..0xbc28  (181 bytes)
; ======================================================================


L_BB73:
	ld a,007h		;bb73
	call 00141h		;bb75   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	ld hl,0edd1h		;bb78
	bit 7,a		;bb7b
	jr nz,L_BB85		;bb7d
	ld a,(hl)			;bb7f
	or a			;bb80
	jp z,L_BBE2		;bb81
	ret			;bb84
L_BB85:
	ld (hl),000h		;bb85
	ld hl,0e22fh		;bb87
	bit 3,a		;bb8a
	jr z,L_BB91		;bb8c
	ld (hl),000h		;bb8e
	ret			;bb90
L_BB91:
	ld a,(hl)			;bb91
	or a			;bb92
	ret nz			;bb93
	ld (hl),001h		;bb94
	ld hl,0e1a2h		;bb96
	ld a,(hl)			;bb99
	or a			;bb9a
	ret z			;bb9b
	cp 00dh		;bb9c
	inc hl			;bb9e
	ld a,(hl)			;bb9f
	jr nc,L_BBBA		;bba0
	ld b,006h		;bba2
	cp b			;bba4
	jr c,L_BBDF		;bba5
	ld b,007h		;bba7
	cp b			;bba9
	jr c,L_BBDF		;bbaa
	ld b,00ah		;bbac
	cp b			;bbae
	jr c,L_BBDF		;bbaf
	ld b,00ch		;bbb1
	cp b			;bbb3
	jr c,L_BBDF		;bbb4
	ld b,000h		;bbb6
	jr L_BBDF		;bbb8
L_BBBA:
	ld b,006h		;bbba
	cp b			;bbbc
	jr c,L_BBDF		;bbbd
	ld b,008h		;bbbf
	cp b			;bbc1
	jr c,L_BBDF		;bbc2
	ld b,00bh		;bbc4
	cp b			;bbc6
	jr c,L_BBDF		;bbc7
	ld b,00eh		;bbc9
	cp b			;bbcb
	jr c,L_BBDF		;bbcc
	ld b,010h		;bbce
	cp b			;bbd0
	jr c,L_BBDF		;bbd1
	ld b,011h		;bbd3
	cp b			;bbd5
	jr c,L_BBDF		;bbd6
	ld b,012h		;bbd8
	cp b			;bbda
	jr c,L_BBDF		;bbdb
	ld b,000h		;bbdd
L_BBDF:
	ld (hl),b			;bbdf
	jr L_BBF3		;bbe0
L_BBE2:
	ld (hl),001h		;bbe2
	ld hl,0e1a2h		;bbe4
	ld a,(hl)			;bbe7
	inc a			;bbe8
	cp 011h		;bbe9
	jr c,L_BBEE		;bbeb
	xor a			;bbed
L_BBEE:
	ld (hl),a			;bbee
	xor a			;bbef
	ld (0e1a3h),a		;bbf0
L_BBF3:
	ld a,(0e1a2h)		;bbf3
	ld b,a			;bbf6
	ld de,05fb5h		;bbf7
	call 0421bh		;bbfa   ; de_mas_a: DE = DE + A
	ld a,(de)			;bbfd
	ld c,a			;bbfe
	ld a,b			;bbff
	ld hl,05fc6h		;bc00
	or a			;bc03
	jr z,L_BC10		;bc04
	ld hl,05fd0h		;bc06
	cp 00dh		;bc09
	jr c,L_BC10		;bc0b
	ld hl,05fdeh		;bc0d
L_BC10:
	ld a,(0e1a3h)		;bc10
	call 04216h		;bc13   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;bc16
	ld hl,0e100h		;bc17   ; apunta a los atributos de sprite (32 fichas de 4 bytes [y][x][dibujo][color])
	ld (hl),c			;bc1a
	inc hl			;bc1b
	ld (hl),a			;bc1c
	ld a,026h		;bc1d
	jp 057ffh		;bc1f   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_BC22:
	ld a,(0d47fh)		;bc22
	call 04220h		;bc25   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_BC28: 7 destinos del despachador p00:4220 (call en p03:BC25, el
;   indice en A): BC36, BC8D, BCA0, BD04, BD56, BD7C, BD8E; lo leen p03:BC25
;   (14 bytes)
;   0xbc28..0xbc36  (14 bytes)
DATA_tabla_BC28:
	defw 0bc36h,0bc8dh,0bca0h,0bd04h,0bd56h,0bd7ch,0bd8eh	; bc28

; ======================================================================
; CODIGO 0xbc36..0xbe24  (494 bytes)
; ======================================================================


L_BC36:
	ld a,(0de06h)		;bc36   ; lee los botones recien pulsados del mando 1 / cursores
	and 013h		;bc39
	ret z			;bc3b
	bit 4,a		;bc3c
	jp z,L_BCDE		;bc3e
	ld a,(0dd0ch)		;bc41
	or a			;bc44
	jp nz,L_BDB9		;bc45
	ld a,020h		;bc48
	ld (0d481h),a		;bc4a
	ld a,(0dd8eh)		;bc4d
	cp 003h		;bc50
	jr z,L_BC67		;bc52
	or a			;bc54
	jr nz,L_BC62		;bc55
	ld a,(0dde0h)		;bc57
	or a			;bc5a
	jr z,L_BC79		;bc5b
	ld a,001h		;bc5d
	ld (0ede6h),a		;bc5f
L_BC62:
	call L_BCD9		;bc62
	jr L_BCD9		;bc65
L_BC67:
	call L_BDE6		;bc67
	ld hl,0be42h		;bc6a
	call 04ebah		;bc6d
	xor a			;bc70
	ld (0dd0ch),a		;bc71
	call L_BCE5		;bc74
	jr L_BCD9		;bc77
L_BC79:
	call L_BDE6		;bc79
	ld hl,07d4eh		;bc7c
	call 04ea6h		;bc7f   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld a,040h		;bc82
	ld (0d2e1h),a		;bc84
	ld a,005h		;bc87
	ld (0d47fh),a		;bc89
	ret			;bc8c
L_BC8D:
	ld a,(0de06h)		;bc8d   ; lee los botones recien pulsados del mando 1 / cursores
	and 013h		;bc90
	ret z			;bc92
	bit 4,a		;bc93
	jr z,L_BCDE		;bc95
	ld a,(0dd0ch)		;bc97
	inc a			;bc9a
	ld (0dd8fh),a		;bc9b
	jr L_BCD9		;bc9e
L_BCA0:
	ld hl,0d481h		;bca0
	dec (hl)			;bca3
	ret nz			;bca4
	call L_BDF4		;bca5
	xor a			;bca8
	ld (0d74fh),a		;bca9
	ld (0d751h),a		;bcac
	ld (0d752h),a		;bcaf
	call 05d86h		;bcb2
	ld hl,0d482h		;bcb5
	ld de,0d70ah		;bcb8
	ld bc,00006h		;bcbb
	ldir		;bcbe
	call L_BE0D		;bcc0
	call 05d62h		;bcc3
	ld a,(0d2b2h)		;bcc6
	cp 006h		;bcc9
	jr nz,L_BCD9		;bccb
	ld a,002h		;bccd
	ld (0ede7h),a		;bccf
	ld a,040h		;bcd2
	ld (0d481h),a		;bcd4
	jr L_BD32		;bcd7
L_BCD9:
	ld hl,0d47fh		;bcd9
	inc (hl)			;bcdc
	ret			;bcdd
L_BCDE:
	ld a,001h		;bcde
	ld hl,0dd0ch		;bce0
	xor (hl)			;bce3
	ld (hl),a			;bce4
L_BCE5:
	ld hl,0584ch		;bce5
	ld bc,00818h		;bce8
	xor a			;bceb
	ld d,a			;bcec
	call 04d2ah		;bced   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
	ld a,(0dd0ch)		;bcf0
	ld e,04ch		;bcf3
	or a			;bcf5
	jr z,L_BCFA		;bcf6
	ld e,058h		;bcf8
L_BCFA:
	ld d,058h		;bcfa
	ld hl,07df7h		;bcfc
	ld c,0ffh		;bcff
	jp 04eb5h		;bd01   ; texto_en_de: pinta el texto HL en la posicion DE (sin [x y] delante)
L_BD04:
	ld a,(0de06h)		;bd04   ; lee los botones recien pulsados del mando 1 / cursores
	and 010h		;bd07
	jr nz,L_BD11		;bd09
	call 05d3eh		;bd0b
	jp 05d47h		;bd0e
L_BD11:
	ld a,(0d74fh)		;bd11
	ld (0d70ah),a		;bd14
	call 05d47h		;bd17
	ld hl,0d70ah		;bd1a
	ld a,006h		;bd1d
	add a,(hl)			;bd1f
	ld (hl),a			;bd20
	ld de,0d680h		;bd21
	call 05d50h		;bd24
	ld a,(0dd8fh)		;bd27
	dec a			;bd2a
	ld a,001h		;bd2b
	call z,057ffh		;bd2d   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	jr L_BCD9		;bd30
L_BD32:
	call L_BDD4		;bd32
	ld hl,07beah		;bd35
	ld a,(0dd8fh)		;bd38
	dec a			;bd3b
	jr z,L_BD41		;bd3c
	ld hl,07c06h		;bd3e
L_BD41:
	call 04ea6h		;bd41   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	xor a			;bd44
	ld (0dd0ch),a		;bd45
	call L_BCE5		;bd48
	ld a,006h		;bd4b
	ld (0d47fh),a		;bd4d
	ld a,030h		;bd50
	ld (0d2e1h),a		;bd52
	ret			;bd55
L_BD56:
	call 05d59h		;bd56
	ld a,(0d2b1h)		;bd59
	cp 002h		;bd5c
	jr z,L_BD6E		;bd5e
	call L_BE0D		;bd60
	call L_BA8B		;bd63
	call 05d74h		;bd66
	call 05d6bh		;bd69
	jr L_BD84		;bd6c
L_BD6E:
	call 05db2h		;bd6e
	ld a,004h		;bd71
	ld (0ede7h),a		;bd73
	ld a,006h		;bd76
	ld (0d47fh),a		;bd78
	ret			;bd7b
L_BD7C:
	ld hl,0d2e1h		;bd7c
	dec (hl)			;bd7f
	ret nz			;bd80
	call L_BDF4		;bd81
L_BD84:
	ld a,02fh		;bd84
	call 057ffh		;bd86   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	ld hl,0e1a1h		;bd89
	inc (hl)			;bd8c
	ret			;bd8d
L_BD8E:
	ld a,(0de06h)		;bd8e   ; lee los botones recien pulsados del mando 1 / cursores
	and 013h		;bd91
	ret z			;bd93
	bit 4,a		;bd94
	jp z,L_BCDE		;bd96
	ld a,(0dd0ch)		;bd99
	or a			;bd9c
	jr nz,L_BDB9		;bd9d
	ld a,001h		;bd9f
	call 057ffh		;bda1   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	call 05d8fh		;bda4
	ld a,(0ede7h)		;bda7
	ld (0d47fh),a		;bdaa
	cp 004h		;bdad
	jr nz,L_BDB6		;bdaf
	call L_BDE6		;bdb1
	jr L_BDC4		;bdb4
L_BDB6:
	jp L_BDF4		;bdb6
L_BDB9:
	call L_BE0D		;bdb9
	call L_BA8B		;bdbc
	jr L_BD84		;bdbf
L_BDC1:
	call L_BDD4		;bdc1
L_BDC4:
	ld hl,0be24h		;bdc4
	call 04ebah		;bdc7
	xor a			;bdca
	ld (0d47fh),a		;bdcb
	ld (0dd0ch),a		;bdce
	jp L_BCE5		;bdd1
L_BDD4:
	ld hl,05230h		;bdd4
	ld de,04040h		;bdd7
	ld bc,05835h		;bdda
	ld a,004h		;bddd
	call 04d66h		;bddf   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
	call L_BDE6		;bde2
	ret			;bde5
L_BDE6:
	call L_BE02		;bde6
	ld hl,05230h		;bde9
	ld de,05734h		;bdec
	ld c,00dh		;bdef
	jp 04cfeh		;bdf1   ; marco: un marco de lineas: HL la esquina, DE el tamano
L_BDF4:
	ld de,05230h		;bdf4
	ld hl,04040h		;bdf7
	ld bc,05835h		;bdfa
	ld a,001h		;bdfd
	jp 04d66h		;bdff   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
L_BE02:
	ld hl,05230h		;be02
	ld bc,05835h		;be05
	xor a			;be08
	ld d,a			;be09
	jp 04d2ah		;be0a   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
L_BE0D:
	ld hl,0000ch		;be0d
	ld bc,000c8h		;be10
	xor a			;be13
	ld d,a			;be14
	jp 04d2ah		;be15   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
L_BE18:
	ld hl,02480h		;be18
	ld bc,0b030h		;be1b
	xor a			;be1e
	ld d,001h		;be1f
	jp 04d2ah		;be21   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'

; ----------------------------------------------------------------------
; DATOS resto_BE24: lo apuntan con el banco puesto p03:BDC4 (0xBE24), p03:BC6A
;   (0xBE42); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p03:BDC4, p03:BC6A (62 bytes)
;   0xbe24..0xbe62  (62 bytes)
DATA_resto_BE24:
	defb 058h,034h,071h,00ch,00eh,072h,055h,0feh,058h,040h,075h,00eh,069h,00ch,034h,047h	; be24  X4q..rU.X@u.i.4G
	defb 035h,02eh,0feh,068h,04ch,042h,02ah,0feh,068h,058h,02ah,02ah,02ch,0ffh,058h,034h	; be34  5..hLB*.hX**,.X4
	defb 03ch,00ch,032h,02eh,04fh,0feh,058h,040h,075h,00eh,069h,00ch,034h,047h,035h,02eh	; be44  <.2.O.X@u.i.4G5.
	defb 0feh,068h,04ch,012h,017h,021h,019h,0feh,068h,058h,021h,020h,00fh,01bh	; be54  .hL..!..hX! ..

; ----------------------------------------------------------------------
; DATOS relleno_ff: 414 bytes a 0xFF hasta el final del banco: relleno; lo
;   leen nadie (414 bytes)
;   0xbe62..0xc000  (414 bytes)
DATA_relleno_ff:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be62  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be72  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be82  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be92  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bea2  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; beb2  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bec2  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bed2  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bee2  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bef2  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf02  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf12  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf22  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf32  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf42  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf52  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf62  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf72  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf82  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf92  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfa2  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfb2  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfc2  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfd2  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfe2  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bff2  ..............
