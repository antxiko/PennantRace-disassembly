; ==========================================================================
; THE PRO YAKYUU GEKITOTSU PENNANT RACE - Konami (1988) - MSX2 - MegaROM RC-757 de 128 KB (Konami SCC) - banco 14 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ======================================================================
; CODIGO 0x8000..0x8132  (306 bytes)
; ======================================================================


L_8000:
	ld a,(0d68ah)		;8000
	cp 041h		;8003
	jr z,L_800A		;8005
	jp 06eafh		;8007
L_800A:
	ld a,(0dd8fh)		;800a
	sub 002h		;800d
	jp z,07143h		;800f
	di			;8012
	ld a,(0fd9fh)		;8013
	ld (0d2a9h),a		;8016
	ld a,0c9h		;8019
	ld (0fd9fh),a		;801b
	ld (0d2a7h),sp		;801e
	call L_8334		;8022
	ld hl,0d680h		;8025
	ld de,0d280h		;8028   ; apunta a la ficha de 0xD280 (nombre de 5 letras, 8 ceros y 4 bytes; p13:71B8)
	call L_82D2		;802b
	call L_8241		;802e
	call L_82A7		;8031
	call L_8046		;8034
	call L_8263		;8037
	di			;803a
	call L_8368		;803b
	ld a,(0d2a9h)		;803e
	ld (0fd9fh),a		;8041
	ei			;8044
	ret			;8045
L_8046:
	ld de,0d380h		;8046
	ld c,01ah		;8049
	call 0f37dh		;804b
	ld hl,000ffh		;804e
	jp L_8324		;8051
L_8054:
	ld a,(0d74ah)		;8054
	cp 041h		;8057
	jr z,L_805E		;8059
	jp 06eb7h		;805b
L_805E:
	ld a,(0dd8fh)		;805e
	sub 002h		;8061
	jp z,07168h		;8063
	di			;8066
	ld a,(0fd9fh)		;8067
	ld (0d2a9h),a		;806a
	ld a,0c9h		;806d
	ld (0fd9fh),a		;806f
	ld (0d2a7h),sp		;8072
	call L_8334		;8076
	ld hl,0d740h		;8079
	ld de,0d280h		;807c   ; apunta a la ficha de 0xD280 (nombre de 5 letras, 8 ceros y 4 bytes; p13:71B8)
	call L_82D2		;807f
	call L_8241		;8082
	call L_82A7		;8085
	call L_809A		;8088
	call L_8263		;808b
	di			;808e
	call L_8368		;808f
	ld a,(0d2a9h)		;8092
	ld (0fd9fh),a		;8095
	ei			;8098
	ret			;8099
L_809A:
	ld de,0d47fh		;809a
	ld c,01ah		;809d
	call 0f37dh		;809f
	ld hl,000ffh		;80a2
	jp L_8324		;80a5
L_80A8:
	ld a,(0dd8fh)		;80a8
	or a			;80ab
	ret z			;80ac
	sub 002h		;80ad
	jp z,0718dh		;80af
	di			;80b2
	ld a,(0fd9fh)		;80b3
	ld (0d2a9h),a		;80b6
	ld a,0c9h		;80b9
	ld (0fd9fh),a		;80bb
	ld (0d2a7h),sp		;80be
	call L_8334		;80c2
	ld hl,08132h		;80c5
	ld de,0d280h		;80c8   ; apunta a la ficha de 0xD280 (nombre de 5 letras, 8 ceros y 4 bytes; p13:71B8)
	call L_82D2		;80cb
	call L_8241		;80ce
	call L_82A7		;80d1
	call L_80E6		;80d4
	call L_8263		;80d7
	di			;80da
	call L_8368		;80db
	ld a,(0d2a9h)		;80de
	ld (0fd9fh),a		;80e1
	ei			;80e4
	ret			;80e5
L_80E6:
	ld de,0d680h		;80e6
	ld c,01ah		;80e9
	call 0f37dh		;80eb
	ld hl,000cbh		;80ee
	jp L_8324		;80f1
L_80F4:
	ld a,(0dd8fh)		;80f4
	or a			;80f7
	ret z			;80f8
	sub 002h		;80f9
	jp z,0711dh		;80fb
	di			;80fe
	ld a,(0fd9fh)		;80ff
	ld (0d2a9h),a		;8102
	ld a,0c9h		;8105
	ld (0fd9fh),a		;8107
	ld (0d2a7h),sp		;810a
	call L_8334		;810e
	ld hl,08132h		;8111
	ld de,0d280h		;8114   ; apunta a la ficha de 0xD280 (nombre de 5 letras, 8 ceros y 4 bytes; p13:71B8)
	call L_82D2		;8117
	call L_8251		;811a
	call L_82A7		;811d
	call L_813D		;8120
	call L_8263		;8123
	di			;8126
	call L_8368		;8127
	ld a,(0d2a9h)		;812a
	ld (0fd9fh),a		;812d
	ei			;8130
	ret			;8131

; ----------------------------------------------------------------------
; DATOS resto_8132: lo apuntan con el banco puesto p14:80C5 (0x8132), p14:8111
;   (0x8132); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p14:80C5, p14:8111 (11 bytes)
;   0x8132..0x813d  (11 bytes)
DATA_resto_8132:
	defb 04ch,045h,041h,047h,05fh,044h,041h,054h,041h,024h,042h	; 8132  LEAG_DATA$B

; ======================================================================
; CODIGO 0x813d..0x8434  (759 bytes)
; ======================================================================


L_813D:
	ld de,0d680h		;813d
	ld c,01ah		;8140
	call 0f37dh		;8142
	ld hl,000cbh		;8145
	jp L_8314		;8148
L_814B:
	ld a,(0dd8fh)		;814b
	or a			;814e
	jp z,L_81AF		;814f
	sub 002h		;8152
	jp z,070f1h		;8154
	call L_8208		;8157
	ld a,(0d2b2h)		;815a
	cp 036h		;815d
	jr c,L_8167		;815f
	ld a,002h		;8161
	ld (0d2b1h),a		;8163
	ret			;8166
L_8167:
	di			;8167
	ld a,(0fd9fh)		;8168
	ld (0d2a9h),a		;816b
	ld a,0c9h		;816e
	ld (0fd9fh),a		;8170
	ld (0d2a7h),sp		;8173
	call L_8334		;8177
	ld hl,0d380h		;817a
	ld de,0d280h		;817d   ; apunta a la ficha de 0xD280 (nombre de 5 letras, 8 ceros y 4 bytes; p13:71B8)
	call L_82E6		;8180
	call L_83A5		;8183
	call L_83C1		;8186
	call L_8251		;8189
	call L_82A7		;818c
	call L_81A1		;818f
	call L_8263		;8192
	di			;8195
	call L_8368		;8196
	ld a,(0d2a9h)		;8199
	ld (0fd9fh),a		;819c
	ei			;819f
	ret			;81a0
L_81A1:
	ld de,0d380h		;81a1
	ld c,01ah		;81a4
	call 0f37dh		;81a6
	ld hl,000ffh		;81a9
	jp L_8314		;81ac
L_81AF:
	ld hl,0dde0h		;81af
	ld a,(hl)			;81b2
	cp 002h		;81b3
	jr c,L_81BC		;81b5
	ld a,(0d74fh)		;81b7
	jr L_81BF		;81ba
L_81BC:
	inc (hl)			;81bc
	ld a,(hl)			;81bd
	dec a			;81be
L_81BF:
	and 001h		;81bf
	ld hl,0d780h		;81c1
	ld d,a			;81c4
	ld e,000h		;81c5
	add hl,de			;81c7
	ex de,hl			;81c8
	ld hl,0d380h		;81c9
	ld bc,000ffh		;81cc
	ldir		;81cf
	ld a,001h		;81d1
	ld (0d2b1h),a		;81d3
	ret			;81d6
L_81D7:
	ld b,00bh		;81d7
L_81D9:
	ld a,(hl)			;81d9
	inc hl			;81da
	or a			;81db
	jr z,L_81F7		;81dc
	cp 020h		;81de
	jr z,L_81F2		;81e0
	cp 024h		;81e2
	jr z,L_81F2		;81e4
	cp 05fh		;81e6
	jr z,L_81F2		;81e8
	cp 00bh		;81ea
	jr nc,L_81F5		;81ec
	add a,02fh		;81ee
	jr L_81F7		;81f0
L_81F2:
	xor a			;81f2
	jr L_81F7		;81f3
L_81F5:
	add a,032h		;81f5
L_81F7:
	ld (de),a			;81f7
	inc de			;81f8
	djnz L_81D9		;81f9
	ret			;81fb
L_81FC:
	ld a,(0dd8fh)		;81fc
	or a			;81ff
	jp z,L_8273		;8200
	dec a			;8203
	dec a			;8204
	jp z,0727ah		;8205
L_8208:
	di			;8208
	ld a,(0fd9fh)		;8209
	ld (0d2a9h),a		;820c
	ld a,0c9h		;820f
	ld (0fd9fh),a		;8211
	ld (0d2a7h),sp		;8214
	call L_8334		;8218
	ld hl,085c5h		;821b
	ld (0f323h),hl		;821e
	call L_843F		;8221
	call L_82C4		;8224
	ld a,006h		;8227
	ld (0d2b2h),a		;8229
	call L_83D7		;822c
	di			;822f
	ld hl,(0d2e2h)		;8230
	ld (0f323h),hl		;8233
	call L_8368		;8236
	ld a,(0d2a9h)		;8239
	ld (0fd9fh),a		;823c
	ei			;823f
	ret			;8240
L_8241:
	ld de,(0d2a5h)		;8241
	ld c,00fh		;8245
	call 0f37dh		;8247
	ld c,000h		;824a
	inc a			;824c
	jp z,L_8506		;824d
	ret			;8250
L_8251:
	ld de,(0d2a5h)		;8251
	di			;8255
	ld c,016h		;8256
	call 0f37dh		;8258
	ei			;825b
	ld c,003h		;825c
	inc a			;825e
	jp z,L_8506		;825f
	ret			;8262
L_8263:
	ld de,(0d2a5h)		;8263
	ld c,010h		;8267
	call 0f37dh		;8269
	ld c,002h		;826c
	inc a			;826e
	jp z,L_8506		;826f
	ret			;8272
L_8273:
	ld a,(0dde0h)		;8273
	or a			;8276
	ret z			;8277
	ld hl,0d780h		;8278
	call L_81D7		;827b
	ld hl,0d2b2h		;827e
	inc (hl)			;8281
	ld a,(0dde0h)		;8282
	dec a			;8285
	jr z,L_8292		;8286
	ld hl,0d880h		;8288
	call L_81D7		;828b
	ld hl,0d2b2h		;828e
	inc (hl)			;8291
L_8292:
	ld a,024h		;8292
	ld (de),a			;8294
	ret			;8295
L_8296:
	ld hl,0d280h		;8296   ; apunta a la ficha de 0xD280 (nombre de 5 letras, 8 ceros y 4 bytes; p13:71B8)
	ld de,0d281h		;8299
	ld (hl),000h		;829c
	ld bc,00024h		;829e
	ldir		;82a1
	ret			;82a3
L_82A4:
	ld (0d2a5h),hl		;82a4
L_82A7:
	ld hl,(0d2a5h)		;82a7
	ld bc,0000ch		;82aa
	add hl,bc			;82ad
	ld (hl),b			;82ae
	inc hl			;82af
	ld (hl),b			;82b0
	inc hl			;82b1
	ld bc,00001h		;82b2
	ld (hl),c			;82b5
	inc hl			;82b6
	ld (hl),b			;82b7
	ld bc,00011h		;82b8
	add hl,bc			;82bb
	ld b,005h		;82bc
	xor a			;82be
L_82BF:
	ld (hl),a			;82bf
	inc hl			;82c0
	djnz L_82BF		;82c1
	ret			;82c3
L_82C4:
	ld hl,0daf1h		;82c4
	ld de,0daf2h		;82c7
	ld (hl),000h		;82ca
	ld bc,00040h		;82cc
	ldir		;82cf
	ret			;82d1
L_82D2:
	ld (0d2a5h),de		;82d2
	xor a			;82d6
	ld (de),a			;82d7
	inc de			;82d8
	ld bc,0000bh		;82d9
	ldir		;82dc
	xor a			;82de
	ld b,019h		;82df
L_82E1:
	ld (de),a			;82e1
	inc de			;82e2
	djnz L_82E1		;82e3
	ret			;82e5
L_82E6:
	ld (0d2a5h),de		;82e6
	xor a			;82ea
	ld (de),a			;82eb
	inc de			;82ec
	push de			;82ed
	push hl			;82ee
	ld h,d			;82ef
	ld l,e			;82f0
	inc de			;82f1
	ld (hl),000h		;82f2
	ld bc,0000bh		;82f4
	ldir		;82f7
	pop hl			;82f9
	pop de			;82fa
	ld b,00bh		;82fb
L_82FD:
	ld a,(hl)			;82fd
	or a			;82fe
	jr nz,L_8304		;82ff
	inc hl			;8301
	djnz L_82FD		;8302
L_8304:
	ld c,b			;8304
	ld b,000h		;8305
	ldir		;8307
	ld de,0d28ch		;8309
	xor a			;830c
	ld b,019h		;830d
	ld (de),a			;830f
	inc de			;8310
	djnz L_82E1		;8311
	ret			;8313
L_8314:
	ld de,(0d2a5h)		;8314
	ld c,026h		;8318
	call 0f37dh		;831a
	ld c,004h		;831d
	or a			;831f
	jp nz,L_8506		;8320
	ret			;8323
L_8324:
	ld de,(0d2a5h)		;8324
	ld c,027h		;8328
	call 0f37dh		;832a
	ld c,003h		;832d
	or a			;832f
	jp nz,L_8506		;8330
	ret			;8333
L_8334:
	ld hl,0f100h		;8334
	ld de,0d780h		;8337
	ld bc,00280h		;833a
	ldir		;833d
	ld de,0f0ffh		;833f
	ld hl,0d0ffh		;8342
	exx			;8345
	ld de,0f37fh		;8346
	ld bc,01100h		;8349
L_834C:
	exx			;834c
	ld b,(hl)			;834d
	ld a,(de)			;834e
	dec de			;834f
	ld (hl),a			;8350
	dec hl			;8351
	ld a,b			;8352
	exx			;8353
	ld (de),a			;8354
	dec de			;8355
	dec bc			;8356
	ld a,b			;8357
	or c			;8358
	jr nz,L_834C		;8359
	ld hl,00000h		;835b
	ld (0f1c0h),hl		;835e
	ld hl,084d4h		;8361
	ld (0f323h),hl		;8364
	ret			;8367
L_8368:
	call L_8394		;8368
	ld de,0e000h		;836b
	ld hl,0c000h		;836e
	exx			;8371
	ld de,0e280h		;8372
	ld bc,01100h		;8375
L_8378:
	exx			;8378
	ld a,(hl)			;8379
	ld (de),a			;837a
	inc de			;837b
	exx			;837c
	ld a,(de)			;837d
	inc de			;837e
	exx			;837f
	ld (hl),a			;8380
	inc hl			;8381
	exx			;8382
	dec bc			;8383
	ld a,b			;8384
	or c			;8385
	jr nz,L_8378		;8386
	ld de,0f100h		;8388
	ld hl,0d780h		;838b
	ld bc,00280h		;838e
	ldir		;8391
	ret			;8393
L_8394:
	ld b,000h		;8394
L_8396:
	push bc			;8396
	call 0d2abh		;8397
	pop bc			;839a
	djnz L_8396		;839b
	ret			;839d
L_839E:
	ld hl,0d280h		;839e   ; apunta a la ficha de 0xD280 (nombre de 5 letras, 8 ceros y 4 bytes; p13:71B8)
	ld b,005h		;83a1
	jr L_83AA		;83a3
L_83A5:
	ld hl,0d281h		;83a5
	ld b,00ah		;83a8
L_83AA:
	ld a,(hl)			;83aa
	and a			;83ab
	jr z,L_83BB		;83ac
	cp 00bh		;83ae
	jr nc,L_83B6		;83b0
	add a,02fh		;83b2
	jr L_83B8		;83b4
L_83B6:
	add a,032h		;83b6
L_83B8:
	ld (hl),a			;83b8
	jr L_83BD		;83b9
L_83BB:
	ld (hl),020h		;83bb
L_83BD:
	inc hl			;83bd
	djnz L_83AA		;83be
	ret			;83c0
L_83C1:
	ld hl,0d289h		;83c1
	ld a,(hl)			;83c4
	cp 020h		;83c5
	jr nz,L_83CB		;83c7
	ld (hl),024h		;83c9
L_83CB:
	inc hl			;83cb
	ld a,(hl)			;83cc
	cp 020h		;83cd
	jr nz,L_83D3		;83cf
	ld (hl),024h		;83d1
L_83D3:
	inc hl			;83d3
	ld (hl),041h		;83d4
	ret			;83d6
L_83D7:
	ld de,0d2b3h		;83d7
	ld c,01ah		;83da
	call 0f37dh		;83dc
	ld de,0d280h		;83df   ; apunta a la ficha de 0xD280 (nombre de 5 letras, 8 ceros y 4 bytes; p13:71B8)
	ld c,011h		;83e2
	call 0f37dh		;83e4
	inc a			;83e7
	ret z			;83e8
L_83E9:
	ld hl,0d2b2h		;83e9
	inc (hl)			;83ec
	push hl			;83ed
	call L_8412		;83ee
	pop hl			;83f1
	ld a,(hl)			;83f2
	cp 006h		;83f3
	jr z,L_8406		;83f5
	cp 036h		;83f7
	jr z,L_8406		;83f9
	ld de,0d280h		;83fb   ; apunta a la ficha de 0xD280 (nombre de 5 letras, 8 ceros y 4 bytes; p13:71B8)
	ld c,012h		;83fe
	call 0f37dh		;8400
	inc a			;8403
	jr nz,L_83E9		;8404
L_8406:
	ld a,(0d2b2h)		;8406
	push af			;8409
	call L_8423		;840a
	ld (hl),024h		;840d
	pop af			;840f
	or a			;8410
	ret			;8411
L_8412:
	ld de,0d2b4h		;8412
	ld a,(0d2b2h)		;8415
	dec a			;8418
	call L_8423		;8419
	ex de,hl			;841c
	ld bc,0000bh		;841d
	ldir		;8420
	ret			;8422
L_8423:
	ld l,a			;8423
	ld h,000h		;8424
	ld b,h			;8426
	ld c,l			;8427
	add hl,hl			;8428
	add hl,bc			;8429
	add hl,hl			;842a
	add hl,hl			;842b
	and a			;842c
	sbc hl,bc		;842d
	ld bc,0daaeh		;842f
	add hl,bc			;8432
	ret			;8433

; ----------------------------------------------------------------------
; DATOS resto_8434: lo apuntan con el banco puesto p14:844F (0x8434); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p14:844F (11 bytes)
;   0x8434..0x843f  (11 bytes)
DATA_resto_8434:
	defb 03fh,03fh,03fh,03fh,03fh,03fh,03fh,03fh,03fh,03fh,041h	; 8434  ??????????A

; ======================================================================
; CODIGO 0x843f..0x8498  (89 bytes)
; ======================================================================


L_843F:
	ld hl,0d2b3h		;843f
	ld de,0d2b4h		;8442
	ld (hl),000h		;8445
	ld bc,00021h		;8447
	ldir		;844a
	call L_8296		;844c
	ld hl,08434h		;844f
	ld de,0d281h		;8452
	ld bc,0000bh		;8455
	ldir		;8458
	ret			;845a
L_845B:
	call 0ba66h		;845b
	jr L_8463		;845e
L_8460:
	call 0ba52h		;8460
L_8463:
	ld hl,07d7dh		;8463
	call 04ea6h		;8466   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld de,0684ch		;8469
	ld a,(0dd8eh)		;846c
	or a			;846f
	jr z,L_8490		;8470
	rra			;8472
	jr nc,L_8485		;8473
	push af			;8475
	ld hl,08498h		;8476
	ld c,0ffh		;8479
	push de			;847b
	call 04eb5h		;847c   ; texto_en_de: pinta el texto HL en la posicion DE (sin [x y] delante)
	pop de			;847f
	ld a,e			;8480
	add a,00ch		;8481
	ld e,a			;8483
	pop af			;8484
L_8485:
	rra			;8485
	ret nc			;8486
	ld hl,0849dh		;8487
	ld c,0ffh		;848a
	call 04eb5h		;848c   ; texto_en_de: pinta el texto HL en la posicion DE (sin [x y] delante)
	ret			;848f
L_8490:
	ld hl,084a2h		;8490
	ld c,0ffh		;8493
	jp 04eb5h		;8495   ; texto_en_de: pinta el texto HL en la posicion DE (sin [x y] delante)

; ----------------------------------------------------------------------
; DATOS texto_8498: texto (p00:4EB5, con 13-14-15 puesto por p00:439C):
;   caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es medio
;   espacio; lo leen p14:847C (5 bytes)
;   0x8498..0x849d  (5 bytes)
DATA_texto_8498:
	defb 012h,017h,021h,019h,0ffh	; 8498

; ----------------------------------------------------------------------
; DATOS texto_849D: texto (p00:4EB5, con 13-14-15 puesto por p00:439C):
;   caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es medio
;   espacio; lo leen p14:848C (5 bytes)
;   0x849d..0x84a2  (5 bytes)
DATA_texto_849D:
	defb 021h,020h,00fh,01bh,0ffh	; 849d

; ----------------------------------------------------------------------
; DATOS texto_84A2: texto (p00:4EB5, con 13-14-15 puesto por p00:439C):
;   caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es medio
;   espacio; lo leen p14:8495 (4 bytes)
;   0x84a2..0x84a6  (4 bytes)
DATA_texto_84A2:
	defb 020h,00fh,01bh,0ffh	; 84a2

; ======================================================================
; CODIGO 0x84a6..0x84d4  (46 bytes)
; ======================================================================


L_84A6:
	ld a,(0de06h)		;84a6   ; lee los botones recien pulsados del mando 1 / cursores
	and 013h		;84a9
	ret z			;84ab
	jp 05d7dh		;84ac
L_84AF:
	ld b,000h		;84af
	ld a,(0ffa7h)		;84b1
	cp 0c9h		;84b4
	jr z,L_84B9		;84b6
	inc b			;84b8
L_84B9:
	push bc			;84b9
	call 0709ah		;84ba
	pop bc			;84bd
	ld a,(0dd0eh)		;84be
	inc a			;84c1
	jr z,L_84C6		;84c2
	set 1,b		;84c4
L_84C6:
	ld a,b			;84c6
	ld (0dd8eh),a		;84c7
	cp 003h		;84ca
	jr nz,L_84D0		;84cc
	ld a,002h		;84ce
L_84D0:
	ld (0dd8fh),a		;84d0
	ret			;84d3

; ----------------------------------------------------------------------
; DATOS resto_84D4: lo apuntan con el banco puesto p14:8361 (0x84D4); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p14:8361 (50 bytes)
;   0x84d4..0x8506  (50 bytes)
DATA_resto_84D4:
	defb 0d6h,084h,0c5h,0cdh,068h,083h,03eh,001h,032h,0e0h,0d2h,03ah,0aah,0d2h,026h,040h	; 84d4  ....h.>.2..:..&@
	defb 0cdh,024h,000h,0c1h,079h,0e6h,00eh,00fh,0feh,002h,038h,006h,0feh,006h,038h,00bh	; 84e4  .$..y.....8...8.
	defb 018h,005h,00eh,004h,00fh,030h,006h,00eh,003h,018h,002h,00eh,000h,0c3h,00bh,085h	; 84f4  .....0..........
	defb 00eh,006h	; 8504

; ======================================================================
; CODIGO 0x8506..0x8539  (51 bytes)
; ======================================================================


L_8506:
	push bc			;8506
	call L_8368		;8507
	pop bc			;850a
	ld b,000h		;850b
	ld a,c			;850d
	add a,a			;850e
	ld c,a			;850f
	ld hl,08539h		;8510
	add hl,bc			;8513
	ld a,(hl)			;8514
	inc hl			;8515
	ld h,(hl)			;8516
	ld l,a			;8517
	push hl			;8518
	call 06b6eh		;8519
	pop hl			;851c
	call 04ea6h		;851d   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld hl,08547h		;8520
	call 04ea6h		;8523   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	call L_8394		;8526
	ld a,(0d2a9h)		;8529
	ld (0fd9fh),a		;852c
	ld a,002h		;852f
	ld (0d2b1h),a		;8531
	ld sp,(0d2a7h)		;8534
	ret			;8538

; ----------------------------------------------------------------------
; DATOS resto_8539: lo apuntan con el banco puesto p14:8510 (0x8539); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p14:8510 (14 bytes)
;   0x8539..0x8547  (14 bytes)
DATA_resto_8539:
	defb 054h,085h,064h,085h,075h,085h,081h,085h,092h,085h,0a2h,085h,0b3h,085h	; 8539  T.d.u.........

; ----------------------------------------------------------------------
; DATOS texto_8547: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p14:8523 (13 bytes)
;   0x8547..0x8554  (13 bytes)
DATA_texto_8547:
	defb 050h,08ch,012h,017h,021h,019h,000h,013h,020h,020h,01dh,020h,0ffh	; 8547  P...!...  . .

; ----------------------------------------------------------------------
; DATOS resto_8554: lo apuntan con el banco puesto p14:821B (0x85C5); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p14:821B (140 bytes)
;   0x8554..0x85e0  (140 bytes)
DATA_resto_8554:
	defb 048h,09ch,012h,017h,021h,019h,000h,017h,01dh,000h,013h,020h,020h,01dh,020h,0ffh	; 8554  H...!......  . .
	defb 048h,09ch,014h,017h,01ah,013h,000h,01ch,01dh,022h,000h,014h,01dh,023h,01ch,012h	; 8564  H........"...#..
	defb 0ffh,058h,09ch,012h,017h,021h,019h,000h,014h,023h,01ah,01ah,0ffh,040h,09ch,012h	; 8574  .X...!...#...@..
	defb 017h,021h,019h,000h,01ch,01dh,022h,000h,020h,013h,00fh,012h,027h,0ffh,048h,09ch	; 8584  .!....". ...'.H.
	defb 025h,020h,017h,022h,013h,000h,01eh,020h,01dh,022h,013h,011h,022h,0ffh,048h,09ch	; 8594  % ."... ."..".H.
	defb 022h,01dh,01dh,000h,01bh,00fh,01ch,027h,000h,014h,017h,01ah,013h,021h,0ffh,048h	; 85a4  "......'.....!.H
	defb 09ch,012h,00fh,022h,00fh,000h,022h,027h,01eh,013h,000h,013h,020h,020h,01dh,020h	; 85b4  ...".."'....  .
	defb 0ffh,0c7h,085h,0cdh,068h,083h,03ah,0aah,0d2h,026h,040h,0cdh,024h,000h,0cdh,094h	; 85c4  ....h.:..&@.$...
	defb 083h,03ah,0a9h,0d2h,032h,09fh,0fdh,0edh,07bh,0a7h,0d2h,0c9h	; 85d4  .:..2...{...

; ======================================================================
; CODIGO 0x85e0..0x86e8  (264 bytes)
; ======================================================================


L_85E0:
	call L_85EA		;85e0
	call L_85F4		;85e3
	call L_861C		;85e6
	ret			;85e9
L_85EA:
	ld de,0780ch		;85ea
	ld hl,0d380h		;85ed
	ld b,00ah		;85f0
	jr L_8646		;85f2
L_85F4:
	ld hl,0d38bh		;85f4
	ld (0e340h),hl		;85f7
	ld e,029h		;85fa
	ld c,00ch		;85fc
L_85FE:
	ld b,00eh		;85fe
	ld hl,05fd0h		;8600
L_8603:
	ld d,(hl)			;8603
	inc hl			;8604
	push hl			;8605
	ld hl,(0e340h)		;8606
	ld a,(hl)			;8609
	inc hl			;860a
	ld (0e340h),hl		;860b
	pop hl			;860e
	call 04f1ch		;860f   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	djnz L_8603		;8612
	ld a,e			;8614
	add a,008h		;8615
	ld e,a			;8617
	dec c			;8618
	jr nz,L_85FE		;8619
	ret			;861b
L_861C:
	ld hl,0d433h		;861c
	ld (0e340h),hl		;861f
	ld e,0a4h		;8622
	ld c,004h		;8624
L_8626:
	ld b,013h		;8626
	ld hl,05fdeh		;8628
L_862B:
	ld d,(hl)			;862b
	inc hl			;862c
	push hl			;862d
	ld hl,(0e340h)		;862e
	ld a,(hl)			;8631
	inc hl			;8632
	ld (0e340h),hl		;8633
	pop hl			;8636
	push af			;8637
	call 04f1ch		;8638   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	pop af			;863b
	djnz L_862B		;863c
	ld a,e			;863e
	add a,008h		;863f
	ld e,a			;8641
	dec c			;8642
	jr nz,L_8626		;8643
	ret			;8645
L_8646:
	ld a,(hl)			;8646
	inc hl			;8647
	push af			;8648
	call 04f1ch		;8649   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	pop af			;864c
	ld a,d			;864d
	add a,008h		;864e
	ld d,a			;8650
	djnz L_8646		;8651
	ret			;8653
L_8654:
	ld a,090h		;8654
	ld d,085h		;8656
	call L_871E		;8658
	ld de,02025h		;865b
	call L_8720		;865e
	ld de,020a1h		;8661
	call L_871A		;8664
	ld a,002h		;8667
	ld d,088h		;8669
	call L_871E		;866b
	ld a,006h		;866e
	ld d,090h		;8670
	call L_871E		;8672
	ld a,001h		;8675
	ld d,098h		;8677
	call L_871E		;8679
	ld d,0b8h		;867c
	call L_871E		;867e
	ld d,0dch		;8681
	call L_871E		;8683
	ld d,084h		;8686
	call L_8718		;8688
	ld d,090h		;868b
	call L_8718		;868d
	ld d,098h		;8690
	call L_8718		;8692
	ld d,0a0h		;8695
	call L_8718		;8697
	ld d,0b8h		;869a
	call L_8718		;869c
	ld d,0d0h		;869f
	call L_8718		;86a1
	ld d,0e0h		;86a4
	call L_8718		;86a6
	ld d,0f0h		;86a9
	call L_8718		;86ab
	ld a,020h		;86ae
	ld d,064h		;86b0
	call L_871E		;86b2
	ld a,020h		;86b5
	ld d,060h		;86b7
	call L_8718		;86b9
	ld a,023h		;86bc
	ld d,068h		;86be
	call L_8718		;86c0
	ld de,0f880h		;86c3
	ld hl,086f8h		;86c6
	ld bc,00020h		;86c9
	call 04ab7h		;86cc   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	ld de,0e104h		;86cf
	ld hl,086e8h		;86d2
	ld bc,00010h		;86d5
	ldir		;86d8
	ld de,0e001h		;86da
	ld hl,0e000h		;86dd
	ld (hl),00dh		;86e0
	ld bc,00020h		;86e2
	ldir		;86e5
	ret			;86e7

; ----------------------------------------------------------------------
; DATOS resto_86E8: lo apuntan con el banco puesto p14:86D2 (0x86E8); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p14:86D2 (16 bytes)
;   0x86e8..0x86f8  (16 bytes)
DATA_resto_86E8:
	defb 0a4h,094h,010h,00dh,0ach,094h,010h,00dh,0b4h,094h,010h,00dh,0bch,094h,010h,00dh	; 86e8  ................

; ----------------------------------------------------------------------
; DATOS copia_86F8: 32 bytes que p00:4AB7 copia tal cual a la VRAM 0xF880; lo
;   leen p14:86CC (32 bytes)
;   0x86f8..0x8718  (32 bytes)
DATA_copia_86F8:
	defb 000h,000h,000h,000h,000h,000h,018h,018h,000h,000h,000h,000h,000h,000h,000h,000h	; 86f8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8708  ................

; ======================================================================
; CODIGO 0x8718..0x8751  (57 bytes)
; ======================================================================


L_8718:
	ld e,0a4h		;8718
L_871A:
	ld b,004h		;871a
	jr L_8722		;871c
L_871E:
	ld e,029h		;871e
L_8720:
	ld b,00ch		;8720
L_8722:
	push af			;8722
	call 04f1ch		;8723   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld a,008h		;8726
	add a,e			;8728
	ld e,a			;8729
	pop af			;872a
	djnz L_8722		;872b
	ret			;872d
L_872E:
	ld hl,0de0dh		;872e
	dec (hl)			;8731
	ld a,(hl)			;8732
	and 001h		;8733
	ret nz			;8735
	inc hl			;8736
	dec (hl)			;8737
	jr nz,L_8740		;8738
	ld a,001h		;873a
	ld (0de0fh),a		;873c
	ret			;873f
L_8740:
	ld a,031h		;8740
	sub (hl)			;8742
	ld c,a			;8743
	ld b,0a8h		;8744
	ld hl,02870h		;8746
	ld de,02840h		;8749
	ld a,001h		;874c
	jp 04d66h		;874e   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'

; ----------------------------------------------------------------------
; DATOS copia_8751: 512 bytes que p00:4AB7 copia tal cual a la VRAM 0xF800; lo
;   leen p00:5354 (512 bytes)
;   0x8751..0x8951  (512 bytes)
DATA_copia_8751:
	defb 01fh,011h,011h,00bh,00bh,00bh,00bh,00bh,00bh,00bh,00bh,00bh,011h,011h,01fh,00fh	; 8751  ................
	defb 0c0h,0c0h,0c0h,080h,080h,080h,080h,080h,080h,080h,080h,080h,0c0h,0c0h,0c0h,0c0h	; 8761  ................
	defb 000h,00eh,00eh,005h,004h,004h,004h,004h,004h,004h,004h,004h,00eh,00eh,000h,00fh	; 8771  ................
	defb 000h,000h,000h,080h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0c0h	; 8781  ................
	defb 03fh,026h,026h,016h,016h,016h,016h,010h,016h,016h,016h,016h,026h,026h,03fh,01fh	; 8791  ?&&.........&&?.
	defb 0f0h,070h,070h,0f0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,070h,070h,0f0h,0f0h	; 87a1  .pp.........pp..
	defb 004h,01dh,01dh,00dh,00dh,00dh,00dh,00fh,009h,00dh,00dh,00dh,01dh,01dh,004h,01fh	; 87b1  ................
	defb 000h,080h,080h,070h,000h,000h,000h,000h,000h,000h,000h,000h,080h,080h,000h,0f0h	; 87c1  ...p............
	defb 003h,005h,005h,005h,008h,008h,008h,008h,008h,008h,008h,005h,005h,005h,007h,003h	; 87d1  ................
	defb 080h,0c0h,0c0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0c0h,0c0h,080h	; 87e1  ................
	defb 000h,002h,002h,002h,007h,007h,007h,007h,007h,007h,007h,002h,002h,002h,004h,003h	; 87f1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,020h,020h,000h,040h,080h	; 8801  ...........  .@.
	defb 007h,009h,008h,016h,016h,016h,016h,016h,016h,016h,016h,016h,018h,009h,00fh,007h	; 8811  ................
	defb 080h,0e0h,0e0h,0f0h,070h,070h,070h,070h,070h,070h,070h,0f0h,0e0h,0e0h,0c0h,080h	; 8821  ....ppppppp.....
	defb 000h,006h,007h,00dh,00dh,00dh,00dh,00dh,00dh,00dh,00dh,00dh,017h,006h,008h,007h	; 8831  ................
	defb 000h,000h,000h,000h,080h,080h,080h,080h,080h,080h,080h,010h,000h,020h,040h,080h	; 8841  ............. @.
	defb 01fh,012h,012h,00ah,00ah,00ah,008h,008h,008h,008h,008h,008h,015h,015h,01fh,00fh	; 8851  ................
	defb 0f0h,070h,070h,0f0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,070h,070h,0f0h,0f0h	; 8861  .pp.........pp..
	defb 000h,00dh,00dh,005h,005h,005h,007h,007h,007h,007h,007h,007h,00ah,00ah,000h,00fh	; 8871  ................
	defb 000h,080h,080h,0f0h,000h,000h,000h,000h,000h,000h,000h,000h,080h,080h,000h,0f0h	; 8881  ................
	defb 07eh,047h,047h,027h,022h,022h,022h,020h,028h,028h,028h,02dh,04dh,04dh,07fh,03fh	; 8891  ~GG'""" (((-MM.?
	defb 0fch,01ch,01ch,03ch,038h,038h,038h,038h,0b8h,0b8h,0b8h,0b8h,09ch,09ch,0fch,0fch	; 88a1  ...<8888........
	defb 000h,038h,038h,018h,01dh,01dh,01dh,01fh,01fh,01fh,01fh,01fh,03fh,03fh,00eh,03fh	; 88b1  .88.........??.?
	defb 000h,0e0h,0e0h,0dch,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0c0h,0e0h,0e0h,0c0h,0fch	; 88c1  ................
	defb 003h,002h,002h,001h,001h,001h,001h,001h,001h,001h,001h,001h,002h,002h,003h,001h	; 88d1  ................
	defb 0f8h,038h,038h,038h,038h,078h,030h,030h,030h,070h,038h,038h,038h,038h,0f8h,0f8h	; 88e1  .8888x000p8888..
	defb 000h,001h,001h,000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,001h,000h,001h	; 88f1  ................
	defb 000h,0c0h,0c0h,0c0h,0c0h,0f8h,0c0h,0c0h,0c0h,0f0h,0c0h,0c0h,0c0h,0c0h,000h,0f8h	; 8901  ................
	defb 007h,004h,004h,002h,002h,002h,002h,002h,002h,002h,002h,002h,004h,004h,007h,003h	; 8911  ................
	defb 0fch,01ch,01ch,0dch,0dch,0fch,0b0h,030h,0b0h,0fch,0dch,0dch,01ch,01ch,0fch,0fch	; 8921  .......0........
	defb 000h,003h,003h,001h,001h,001h,001h,001h,001h,001h,001h,001h,003h,003h,000h,003h	; 8931  ................
	defb 000h,0e0h,0e0h,020h,060h,03ch,040h,0c0h,070h,000h,060h,020h,0e0h,0e0h,000h,0fch	; 8941  ... `<@.p.` ....

; ----------------------------------------------------------------------
; DATOS copia_8951: 384 bytes que p00:4AB7 copia tal cual a la VRAM 0xFA00; lo
;   leen p00:5342 (384 bytes)
;   0x8951..0x8ad1  (384 bytes)
DATA_copia_8951:
	defb 03eh,027h,023h,013h,013h,013h,013h,017h,017h,013h,013h,011h,025h,025h,03fh,01fh	; 8951  >'#.........%%?.
	defb 000h,000h,080h,080h,080h,080h,080h,000h,000h,080h,080h,0c0h,0c0h,0c0h,0c0h,0c0h	; 8961  ................
	defb 000h,018h,01ch,00ch,00ch,00ch,00ch,00fh,008h,00ch,00ch,00eh,01ah,01ah,004h,01fh	; 8971  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0c0h	; 8981  ................
	defb 07fh,041h,040h,02ch,02eh,02eh,02eh,021h,02dh,02eh,02eh,02eh,046h,046h,07fh,03fh	; 8991  .A@,...!-...FF.?
	defb 080h,0c0h,0e0h,0e0h,0e0h,0e0h,0e0h,0c0h,0c0h,0e0h,0e0h,070h,070h,070h,0f0h,0f0h	; 89a1  ...........ppp..
	defb 000h,03eh,03fh,013h,015h,015h,011h,01eh,012h,015h,015h,015h,039h,039h,000h,03fh	; 89b1  .>?.........99.?
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,080h,080h,080h,000h,0f0h	; 89c1  ................
	defb 01fh,011h,011h,00bh,00bh,00bh,00bh,00bh,00bh,00bh,00bh,00bh,00bh,00bh,007h,007h	; 89d1  ................
	defb 0c0h,0c0h,0c0h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,000h,000h	; 89e1  ................
	defb 000h,00eh,00eh,005h,004h,004h,004h,004h,004h,004h,004h,004h,004h,004h,000h,007h	; 89f1  ................
	defb 000h,000h,000h,080h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8a01  ................
	defb 03fh,026h,026h,016h,016h,016h,016h,016h,016h,016h,016h,016h,019h,009h,00fh,007h	; 8a11  ?&&.............
	defb 0f0h,070h,070h,0f0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0c0h,080h	; 8a21  .pp.............
	defb 004h,01dh,01dh,00dh,00dh,00dh,00dh,00dh,00dh,00dh,00dh,00dh,016h,006h,008h,007h	; 8a31  ................
	defb 000h,080h,080h,070h,000h,000h,000h,000h,000h,000h,000h,000h,020h,020h,040h,080h	; 8a41  ...p........  @.
	defb 01fh,011h,011h,00bh,00bh,00bh,00bh,00bh,00bh,00bh,00bh,00bh,013h,013h,01fh,00fh	; 8a51  ................
	defb 0c0h,0c0h,0c0h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h	; 8a61  ................
	defb 000h,00eh,00eh,005h,004h,004h,004h,004h,004h,004h,004h,004h,00ch,00ch,000h,00fh	; 8a71  ................
	defb 000h,000h,000h,080h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,080h	; 8a81  ................
	defb 03fh,026h,026h,016h,012h,012h,012h,014h,014h,014h,016h,016h,026h,026h,03fh,01fh	; 8a91  ?&&.........&&?.
	defb 0f0h,070h,070h,0f0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h	; 8aa1  .pp.............
	defb 004h,019h,019h,009h,00dh,00dh,00dh,00bh,00bh,00bh,00dh,00dh,01dh,01dh,004h,01fh	; 8ab1  ................
	defb 000h,080h,080h,070h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0e0h	; 8ac1  ...p............

; ----------------------------------------------------------------------
; DATOS copia_8AD1: 1280 bytes que p00:4AB7 copia tal cual a la VRAM 0xF800;
;   lo leen p00:5330 (1280 bytes)
;   0x8ad1..0x8fd1  (1280 bytes)
DATA_copia_8AD1:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8ad1  ................
	defb 000h,003h,007h,007h,01fh,03fh,007h,007h,00fh,007h,007h,003h,001h,001h,003h,002h	; 8ae1  .....?..........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8af1  ................
	defb 000h,003h,007h,007h,01fh,03fh,004h,005h,009h,004h,004h,002h,001h,001h,003h,003h	; 8b01  .....?..........
	defb 0f8h,0feh,0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0c1h,000h,000h,000h	; 8b11  ................
	defb 018h,03ch,03ch,07ch,078h,078h,0f0h,0f0h,0f0h,0e0h,0e0h,0c0h,040h,0a0h,0a0h,070h	; 8b21  .<<|xx......@..p
	defb 0f8h,0feh,0feh,0ffh,0ffh,0ffh,01fh,01fh,00fh,00fh,01fh,03fh,0ffh,0ffh,0ffh,0ffh	; 8b31  ...........?....
	defb 018h,024h,024h,044h,048h,048h,090h,090h,090h,020h,020h,0c0h,0c0h,0e0h,0e0h,0f0h	; 8b41  .$$DHH...  .....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8b51  ................
	defb 002h,007h,007h,003h,000h,000h,000h,001h,002h,002h,003h,001h,000h,001h,003h,003h	; 8b61  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8b71  ................
	defb 003h,007h,007h,003h,000h,000h,000h,001h,003h,003h,003h,001h,000h,001h,003h,003h	; 8b81  ................
	defb 020h,040h,0cfh,03fh,030h,040h,080h,001h,046h,038h,019h,0f7h,09ah,0fbh,0ffh,0ffh	; 8b91   @.?0@..F8......
	defb 070h,020h,0e0h,0e0h,020h,020h,020h,040h,080h,080h,0c0h,0e0h,0f0h,0f0h,0f0h,0c0h	; 8ba1  p ..   @........
	defb 0ffh,0ffh,0ffh,03fh,03fh,07fh,0ffh,0ffh,0ffh,0ffh,0ffh,0f7h,0fbh,0fbh,0ffh,0ffh	; 8bb1  ...??...........
	defb 0f0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0c0h,080h,080h,0c0h,0e0h,0f0h,0f0h,0f0h,0c0h	; 8bc1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8bd1  ................
	defb 003h,00fh,01fh,01fh,07fh,0ffh,01fh,01fh,03fh,01fh,01fh,00fh,007h,00ch,018h,01ch	; 8be1  ........?.......
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8bf1  ................
	defb 003h,00fh,01fh,01fh,07fh,0ffh,010h,014h,024h,010h,010h,008h,007h,00fh,01fh,01fh	; 8c01  ........$.......
	defb 0e0h,0f8h,0f8h,0fch,0fch,0fch,0fch,0fch,0fch,0fch,0f8h,0ffh,004h,002h,002h,001h	; 8c11  ................
	defb 000h,000h,00ch,01eh,01eh,03ch,03ch,078h,078h,0f0h,0f0h,0e0h,0e0h,040h,0e0h,0e0h	; 8c21  .....<<xx....@..
	defb 0e0h,0f8h,0f8h,0fch,0fch,0fch,07ch,07ch,03ch,03ch,078h,0ffh,0ffh,0ffh,0ffh,0ffh	; 8c31  ......||<<x.....
	defb 000h,000h,00ch,012h,012h,024h,024h,048h,048h,090h,090h,020h,0e0h,0c0h,0e0h,0e0h	; 8c41  .....$$HH.. ....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8c51  ................
	defb 01fh,00dh,001h,000h,000h,003h,004h,008h,009h,010h,010h,01fh,013h,03fh,07fh,07fh	; 8c61  .............?..
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8c71  ................
	defb 01fh,00dh,001h,000h,000h,003h,007h,00fh,00fh,01fh,01fh,01fh,01fh,03fh,07fh,07fh	; 8c81  .............?..
	defb 081h,000h,03fh,0ffh,0c0h,000h,000h,005h,03bh,0e1h,093h,00dh,007h,007h,00fh,00fh	; 8c91  ..?.............
	defb 0c0h,080h,080h,080h,080h,080h,080h,000h,000h,000h,080h,0c0h,0e0h,0e0h,0c0h,080h	; 8ca1  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,09fh,00fh,007h,007h,00fh,00fh	; 8cb1  ................
	defb 0c0h,080h,080h,080h,080h,080h,080h,000h,000h,000h,080h,0c0h,0e0h,0e0h,0c0h,080h	; 8cc1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,001h,003h,003h,003h,003h,001h,003h,003h	; 8cd1  ................
	defb 001h,007h,00fh,00fh,03fh,07fh,00fh,00fh,09fh,0cfh,0cfh,0c7h,0c3h,084h,088h,0f0h	; 8ce1  ....?...........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,001h,002h,002h,002h,002h,001h,002h,002h	; 8cf1  ................
	defb 001h,007h,00fh,00fh,03fh,07fh,008h,00ah,092h,048h,048h,044h,043h,087h,08fh,07fh	; 8d01  ....?....HHDC...
	defb 0f0h,0fch,0fch,0feh,0feh,0feh,0feh,0feh,0feh,0feh,0fch,0fch,084h,002h,002h,002h	; 8d11  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8d21  ................
	defb 0f0h,0fch,0fch,0feh,0feh,0feh,03eh,03eh,01eh,01eh,03ch,07ch,0fch,0feh,0feh,0feh	; 8d31  ......>>..<|....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8d41  ................
	defb 003h,003h,001h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8d51  ................
	defb 0f9h,0feh,09dh,001h,006h,008h,010h,020h,022h,021h,01fh,017h,013h,03fh,07fh,07fh	; 8d61  ....... "!...?..
	defb 003h,002h,001h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8d71  ................
	defb 0ffh,07fh,09dh,001h,007h,00fh,01fh,03fh,03fh,03fh,01fh,01fh,01fh,03fh,07fh,07fh	; 8d81  .......???...?..
	defb 002h,002h,07eh,0feh,002h,002h,006h,00ch,034h,0c2h,027h,01fh,00dh,007h,00fh,00fh	; 8d91  ..~.....4.'.....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,080h,0c0h,0c0h,0c0h,080h	; 8da1  ................
	defb 0feh,0feh,0feh,0feh,0feh,0feh,0feh,0fch,0fch,0feh,03fh,01fh,00fh,007h,00fh,00fh	; 8db1  ..........?.....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,080h,0c0h,0c0h,0c0h,080h	; 8dc1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,020h,070h,0f8h,0fch,07fh,03fh,00fh	; 8dd1  ......... p...?.
	defb 003h,00fh,01fh,01fh,07fh,0ffh,01fh,01fh,03fh,01fh,01fh,03fh,0cfh,0f8h,0f0h,0f8h	; 8de1  ........?..?....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,020h,050h,088h,084h,047h,033h,00eh	; 8df1  ......... P..G3.
	defb 003h,00fh,01fh,01fh,07fh,0ffh,010h,014h,024h,010h,010h,038h,0ffh,0ffh,0ffh,0ffh	; 8e01  ........$..8....
	defb 0e0h,0f8h,0f8h,0fch,0fch,0fch,0fch,0fch,0fch,0fch,0f8h,0f8h,0c4h,004h,004h,004h	; 8e11  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8e21  ................
	defb 0e0h,0f8h,0f8h,0fch,0fch,0fch,07ch,07ch,03ch,03ch,078h,0f8h,0fch,0fch,0fch,0fch	; 8e31  ......||<<x.....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8e41  ................
	defb 007h,003h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8e51  ................
	defb 0f9h,0feh,003h,003h,00ch,030h,020h,040h,048h,047h,03eh,017h,013h,03fh,07fh,07fh	; 8e61  .....0 @HG>..?..
	defb 004h,003h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8e71  ................
	defb 0ffh,0ffh,003h,003h,00fh,03fh,03fh,07fh,07fh,07fh,03eh,01fh,01fh,03fh,07fh,07fh	; 8e81  .....??...>..?..
	defb 004h,004h,0fch,0fch,004h,004h,004h,018h,0ech,086h,04fh,03bh,01dh,007h,00fh,00fh	; 8e91  ..........O.....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,080h,0c0h,0c0h,0c0h,080h,080h	; 8ea1  ................
	defb 0fch,0fch,0fch,0fch,0fch,0fch,0fch,0f8h,0fch,0feh,07fh,03fh,01fh,007h,00fh,00fh	; 8eb1  ...........?....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,080h,0c0h,0c0h,0c0h,080h,080h	; 8ec1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8ed1  ................
	defb 000h,001h,003h,003h,00fh,01fh,003h,003h,007h,003h,003h,007h,008h,00bh,00bh,007h	; 8ee1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8ef1  ................
	defb 000h,001h,003h,003h,00fh,01fh,002h,002h,004h,002h,002h,007h,00fh,00fh,00eh,006h	; 8f01  ................
	defb 07ch,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0f1h,0ffh,0ffh,0ffh	; 8f11  |...............
	defb 000h,000h,000h,080h,080h,080h,080h,080h,080h,080h,000h,000h,07eh,0ffh,0ffh,0ffh	; 8f21  ............~...
	defb 07ch,0ffh,0ffh,0ffh,0ffh,0ffh,00fh,08fh,087h,007h,00fh,01fh,0ffh,09fh,090h,07fh	; 8f31  |...............
	defb 000h,000h,000h,080h,080h,080h,080h,080h,080h,080h,000h,000h,07eh,083h,001h,083h	; 8f41  ............~...
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8f51  ................
	defb 003h,003h,001h,001h,006h,008h,010h,020h,022h,021h,01fh,017h,013h,03fh,07fh,07fh	; 8f61  ....... "!...?..
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8f71  ................
	defb 003h,003h,001h,001h,007h,00fh,01fh,03fh,03fh,03fh,01fh,01fh,01fh,03fh,07fh,07fh	; 8f81  .......???...?..
	defb 0f9h,07dh,03eh,0feh,002h,002h,006h,00ch,034h,0c2h,027h,01fh,00dh,007h,00fh,00fh	; 8f91  .}>.....4.'.....
	defb 0feh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,080h,0c0h,0c0h,0c0h,080h	; 8fa1  ................
	defb 09fh,0ffh,0feh,0feh,0feh,0feh,0feh,0fch,0fch,0feh,03fh,01fh,00fh,007h,00fh,00fh	; 8fb1  ..........?.....
	defb 0feh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,080h,0c0h,0c0h,0c0h,080h	; 8fc1  ................

; ----------------------------------------------------------------------
; DATOS copia_8FD1: 256 bytes que p00:4AB7 copia tal cual a la VRAM 0xFF00; lo
;   leen p00:531B (256 bytes)
;   0x8fd1..0x90d1  (256 bytes)
DATA_copia_8FD1:
	defb 000h,000h,000h,000h,000h,000h,001h,003h,001h,000h,000h,000h,000h,000h,000h,000h	; 8fd1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,080h,000h,000h,000h,000h,000h,000h,000h,000h	; 8fe1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,002h,001h,000h,000h,000h,000h,000h,000h	; 8ff1  ................
	defb 000h,000h,000h,000h,000h,000h,080h,040h,0c0h,080h,000h,000h,000h,000h,000h,000h	; 9001  .......@........
	defb 000h,000h,000h,000h,000h,001h,003h,007h,003h,001h,000h,000h,000h,000h,000h,000h	; 9011  ................
	defb 000h,000h,000h,000h,000h,080h,080h,0c0h,080h,000h,080h,000h,000h,000h,000h,000h	; 9021  ................
	defb 000h,000h,000h,000h,000h,002h,005h,002h,006h,007h,003h,000h,000h,000h,000h,000h	; 9031  ................
	defb 000h,000h,000h,000h,000h,0c0h,060h,020h,060h,0e0h,0c0h,000h,000h,000h,000h,000h	; 9041  ......` `.......
	defb 000h,000h,000h,000h,000h,003h,007h,007h,00fh,003h,001h,001h,000h,000h,000h,000h	; 9051  ................
	defb 000h,000h,000h,000h,080h,080h,0c0h,0c0h,0c0h,0e0h,000h,000h,000h,000h,000h,000h	; 9061  ................
	defb 000h,000h,000h,000h,003h,005h,009h,009h,00ch,00eh,007h,003h,000h,000h,000h,000h	; 9071  ................
	defb 000h,000h,000h,000h,0c0h,060h,030h,030h,0b0h,070h,0e0h,0c0h,000h,000h,000h,000h	; 9081  .....`00.p......
	defb 000h,000h,000h,002h,003h,007h,00fh,00fh,01fh,007h,003h,000h,000h,000h,000h,000h	; 9091  ................
	defb 000h,000h,000h,000h,080h,0f0h,0e0h,0e0h,0e0h,0c0h,080h,080h,040h,000h,000h,000h	; 90a1  ............@...
	defb 000h,000h,000h,003h,00eh,00ah,014h,015h,019h,019h,00dh,00fh,003h,000h,000h,000h	; 90b1  ................
	defb 000h,000h,000h,0c0h,070h,070h,098h,018h,018h,038h,070h,0f0h,0c0h,000h,000h,000h	; 90c1  ....pp...8p.....

; ----------------------------------------------------------------------
; DATOS paletas_90D1: 2 punteros a los colores de cada paleta (p00:556D desde
;   p00:4FB0), para la lista 0x90DB; lo leen p00:5324 (4 bytes)
;   0x90d1..0x90d5  (4 bytes)
DATA_paletas_90D1:
	defw 090d5h,090d9h	; 90d1  -> DATA_colores_90D5 DATA_colores_90D9

; ----------------------------------------------------------------------
; DATOS colores_90D5: 4 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 0 de la lista 0x90DB; lo leen p00:5324
;   (4 bytes)
;   0x90d5..0x90d9  (4 bytes)
DATA_colores_90D5:
	defb 000h,00bh,00dh,00fh	; 90d5

; ----------------------------------------------------------------------
; DATOS colores_90D9: 2 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 1 de la lista 0x90DB; lo leen p00:5324
;   (2 bytes)
;   0x90d9..0x90db  (2 bytes)
DATA_colores_90D9:
	defb 000h,001h	; 90d9

; ----------------------------------------------------------------------
; DATOS lista_90DB: 6 fichas de dibujo de 6 bytes [paleta-tipo][VRAM lo
;   hi][caracteres][puntero] detras del numero (p00:4FA3, paletas en 0x90D1);
;   lo leen p00:5324 (37 bytes)
;   0x90db..0x9100  (37 bytes)
DATA_lista_90DB:
	defb 006h,002h,000h,088h,008h,000h	; 90db
	defb 091h,010h,020h,088h,001h,0c0h	; 90e1
	defb 092h,002h,024h,088h,006h,080h	; 90e7
	defb 091h,002h,000h,08ch,008h,0e0h	; 90ed
	defb 091h,010h,020h,08ch,001h,0c0h	; 90f3
	defb 092h,002h,024h,08ch,006h,060h	; 90f9
	defb 092h	; 90ff

; ----------------------------------------------------------------------
; DATOS dibujo_9100: 8 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0x90DB (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:5324 (128 bytes)
;   0x9100..0x9180  (128 bytes)
DATA_dibujo_9100:
	defb 0ffh,002h,087h,07ah,087h,07ah,04eh,036h,04ch,034h,04ch,034h,04fh,030h,040h,03fh	; 9100  ...z.zN6L4L4O0@?
	defb 0fch,004h,00ch,0f4h,00ch,0f4h,09ch,06ch,098h,068h,098h,068h,098h,068h,018h,0e8h	; 9110  .......l.h.h.h..
	defb 007h,000h,018h,007h,023h,01ch,027h,01bh,046h,03ah,046h,03ah,046h,03ah,046h,03ah	; 9120  ....#.'.F:F:F:F:
	defb 0e0h,060h,070h,090h,018h,0e8h,098h,068h,08ch,074h,08ch,074h,08ch,074h,08ch,074h	; 9130  .`p....h.t.t.t.t
	defb 0fch,004h,086h,07ah,086h,07ah,043h,03dh,043h,03dh,041h,03eh,051h,02eh,050h,02fh	; 9140  ...z.zC=C=A>Q.P/
	defb 03fh,001h,043h,03dh,043h,03dh,087h,07bh,086h,07ah,006h,0fah,016h,0eah,016h,0eah	; 9150  ?.C=C=.{.z......
	defb 01fh,000h,010h,00fh,010h,00fh,009h,006h,009h,006h,009h,006h,009h,006h,008h,007h	; 9160  ................
	defb 0ffh,001h,003h,0fdh,003h,0fdh,0f3h,00dh,0fbh,0f5h,0ffh,081h,0dfh,02fh,018h,0e8h	; 9170  ............./..

; ----------------------------------------------------------------------
; DATOS dibujo_9180: 6 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0x90DB (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:5324 (96 bytes)
;   0x9180..0x91e0  (96 bytes)
DATA_dibujo_9180:
	defb 0ffh,000h,080h,07fh,080h,07fh,04fh,030h,04fh,037h,04ch,034h,04fh,030h,040h,03fh	; 9180  ......O0O7L4O0@?
	defb 0e0h,020h,030h,0d0h,030h,0d0h,018h,0e8h,098h,068h,098h,068h,098h,068h,030h,0d0h	; 9190  . 0.0....h.h.h0.
	defb 0ffh,002h,087h,07ah,087h,07ah,04eh,036h,04ch,034h,04ch,034h,04ch,034h,04ch,034h	; 91a0  ...z.zN6L4L4L4L4
	defb 0fch,004h,00ch,0f4h,00ch,0f4h,09ch,06ch,098h,068h,098h,068h,098h,068h,098h,068h	; 91b0  .......l.h.h.h.h
	defb 0fch,004h,086h,07ah,086h,07ah,043h,03dh,043h,03dh,041h,03eh,051h,02eh,050h,02fh	; 91c0  ...z.zC=C=A>Q.P/
	defb 0fch,004h,08ch,074h,08ch,074h,05ch,02ch,058h,028h,0d8h,0a8h,0d8h,0a8h,0d8h,028h	; 91d0  ...t.t\,X(.....(

; ----------------------------------------------------------------------
; DATOS dibujo_91E0: 8 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 3 de la lista 0x90DB (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:5324 (128 bytes)
;   0x91e0..0x9260  (128 bytes)
DATA_dibujo_91E0:
	defb 04fh,030h,04fh,037h,04ch,034h,04ch,034h,087h,07ah,087h,07ah,0ffh,002h,07fh,07fh	; 91e0  O0O7L4L4.z.z....
	defb 098h,068h,098h,068h,098h,068h,098h,068h,00ch,0f4h,00ch,0f4h,0fch,004h,0fch,0fch	; 91f0  .h.h.h.h........
	defb 046h,03ah,046h,03ah,046h,03ah,066h,05ah,023h,01ch,038h,027h,01fh,018h,007h,007h	; 9200  F:F:F:fZ#.8'....
	defb 08ch,074h,08ch,074h,08ch,074h,098h,068h,018h,0e8h,070h,090h,0e0h,060h,080h,080h	; 9210  .t.t.t.h..p..`..
	defb 058h,027h,058h,027h,05ch,02bh,05ch,02bh,08eh,075h,08eh,075h,0ffh,006h,07dh,07dh	; 9220  X'X'\+\+.u.u..}}
	defb 036h,0cah,036h,0cah,076h,0aah,076h,0aah,0e3h,05dh,0e3h,05dh,0bfh,081h,0bfh,0bfh	; 9230  6.6.v.v..].]....
	defb 009h,006h,009h,006h,009h,006h,009h,006h,010h,00fh,010h,00fh,01fh,000h,00fh,00fh	; 9240  ................
	defb 0d8h,028h,0ffh,081h,0fbh,0f5h,0f3h,00dh,003h,0fdh,003h,0fdh,0ffh,001h,0ffh,0ffh	; 9250  .(..............

; ----------------------------------------------------------------------
; DATOS dibujo_9260: 6 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 5 de la lista 0x90DB (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:5324 (96 bytes)
;   0x9260..0x92c0  (96 bytes)
DATA_dibujo_9260:
	defb 04fh,030h,04fh,037h,04ch,034h,04ch,034h,086h,07ah,086h,07ah,0feh,002h,07eh,07eh	; 9260  O0O7L4L4.z.z..~~
	defb 030h,0d0h,098h,068h,098h,068h,08ch,074h,08ch,074h,08ch,074h,07ch,004h,03ch,03ch	; 9270  0..h.h.t.t.t|.<<
	defb 04ch,034h,04ch,034h,04ch,034h,067h,058h,020h,01fh,038h,027h,01fh,018h,007h,007h	; 9280  L4L4L4gX .8'....
	defb 098h,068h,098h,068h,098h,068h,030h,0d0h,030h,0d0h,0e0h,020h,0c0h,0c0h,000h,000h	; 9290  .h.h.h0.0.. ....
	defb 058h,027h,058h,027h,05ch,02bh,05ch,02bh,08eh,075h,08eh,075h,0ffh,006h,07dh,07dh	; 92a0  X'X'\+\+.u.u..}}
	defb 0d8h,028h,058h,0a8h,058h,0a8h,018h,0e8h,018h,0e8h,018h,0e8h,0f8h,008h,0f8h,0f8h	; 92b0  .(X.X...........

; ----------------------------------------------------------------------
; DATOS dibujo_92C0: 1 caracteres de 8x8 a 1 bit por punto (8 bytes cada uno),
;   ficha 1 de la lista 0x90DB (p00:4FA3, tipo 0 en p00:4FDD); lo leen
;   p00:5324 (8 bytes)
;   0x92c0..0x92c8  (8 bytes)
DATA_dibujo_92C0:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 92c0  ........

; ----------------------------------------------------------------------
; DATOS datos_92C8: 128 bytes (pares 0x00/0x0F y 0xFF: parecen mascaras) que
;   no apunta nadie: SIN LECTOR A LA VISTA; lo leen nadie (128 bytes)
;   0x92c8..0x9348  (128 bytes)
DATA_datos_92C8:
	defb 000h,000h,0ffh,0ffh,000h,00fh,0ffh,0ffh,000h,00fh,0ffh,0ffh,000h,00fh,07fh,0ffh	; 92c8  ................
	defb 000h,007h,077h,077h,000h,007h,077h,0f7h,000h,000h,077h,077h,000h,008h,0f7h,077h	; 92d8  ..ww..w...ww...w
	defb 0ffh,0f0h,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,07fh,000h,000h	; 92e8  ................
	defb 077h,077h,000h,000h,0f7h,077h,000h,000h,077h,070h,000h,000h,077h,0f8h,000h,000h	; 92f8  ww...w..wp..w...
	defb 000h,088h,08fh,0ffh,000h,08fh,0f8h,08fh,000h,0ffh,0f8h,08fh,000h,0f7h,07fh,0ffh	; 9308  ................
	defb 000h,007h,078h,088h,000h,0f8h,088h,000h,00fh,0ffh,0ffh,000h,00fh,0ffh,0ffh,000h	; 9318  ..x.............
	defb 0ffh,088h,080h,000h,088h,0ffh,080h,000h,08fh,0ffh,0f0h,000h,0ffh,0f7h,0ffh,000h	; 9328  ................
	defb 08fh,0ffh,0ffh,000h,008h,0ffh,0f0h,000h,00fh,0ffh,0ffh,000h,00fh,0ffh,0ffh,000h	; 9338  ................

; ======================================================================
; CODIGO 0x9348..0x9701  (953 bytes)
; ======================================================================


L_9348:
	ld a,(0e33ch)		;9348
	rra			;934b
	ret c			;934c
	ld de,00008h		;934d
	ld hl,(0e218h)		;9350
	add hl,de			;9353
	ld (0e223h),hl		;9354
	ld hl,(0e213h)		;9357
	add hl,de			;935a
	ld (0e221h),hl		;935b
	ld a,(0eddfh)		;935e
	rra			;9361
	jp c,L_943A		;9362
	xor a			;9365
	ld (0ec73h),a		;9366
	ld (0eddfh),a		;9369
	call L_94AC		;936c
	call L_94E7		;936f
	ld a,(0eddfh)		;9372
	ld (0ed72h),a		;9375
	ld b,a			;9378
	or a			;9379
	ret z			;937a
	ld a,(0e33ch)		;937b
	or a			;937e
	jr nz,L_9391		;937f
	ld a,(0e1d0h)		;9381
	or a			;9384
	jr z,L_93A1		;9385
	ld a,b			;9387
	and 002h		;9388
	jr z,L_9391		;938a
	call L_9528		;938c
	jr L_93E4		;938f
L_9391:
	call L_949A		;9391
	ld a,001h		;9394
	ld (0eddfh),a		;9396
	ld a,(0edc6h)		;9399
	or a			;939c
	jp nz,040aeh		;939d
	ret			;93a0
L_93A1:
	ld hl,(0e221h)		;93a1
	ld a,h			;93a4
	or a			;93a5
	jr z,L_93B1		;93a6
	cp 002h		;93a8
	jr z,L_93DC		;93aa
	ld a,l			;93ac
	cp 018h		;93ad
	jr nc,L_93DC		;93af
L_93B1:
	call L_949A		;93b1
	ret nz			;93b4
	ld a,(0eddfh)		;93b5
	and 002h		;93b8
	jr nz,L_93E4		;93ba
	xor a			;93bc
	ld (0eff4h),a		;93bd
	ld (0ed39h),a		;93c0
	inc a			;93c3
	ld (0e33bh),a		;93c4
	ld (0eddfh),a		;93c7
	ret			;93ca
L_93CB:
	ld a,(0e1a2h)		;93cb
	add a,050h		;93ce
	cp 0f0h		;93d0
	jr c,L_93D6		;93d2
	ld a,0f0h		;93d4
L_93D6:
	ld e,a			;93d6
	ld c,0ffh		;93d7
	jp 04eb5h		;93d9   ; texto_en_de: pinta el texto HL en la posicion DE (sin [x y] delante)
L_93DC:
	call L_9528		;93dc
	ld a,(0ec73h)		;93df
	or a			;93e2
	ret z			;93e3
L_93E4:
	xor a			;93e4
	ld (0eff4h),a		;93e5
	ld (0ed39h),a		;93e8
	inc a			;93eb
	ld (0eddfh),a		;93ec
	ld (0eddeh),a		;93ef
	call L_9401		;93f2
	ret c			;93f5
	ld a,01bh		;93f6
	call 057ffh		;93f8   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	ld hl,07e5ah		;93fb
	jp 04ea6h		;93fe   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
L_9401:
	ld hl,0e198h		;9401
	ld a,(hl)			;9404
	cp 002h		;9405
	jr z,L_940C		;9407
	inc (hl)			;9409
	or a			;940a
	ret			;940b
L_940C:
	ld a,(0ed7ch)		;940c
	or a			;940f
	ret z			;9410
	call 040c0h		;9411
	ld a,(0ecedh)		;9414
	ld l,a			;9417
	ld h,000h		;9418
	add hl,hl			;941a
	add hl,hl			;941b
	add hl,hl			;941c
	add hl,hl			;941d
	ld de,0e231h		;941e
	add hl,de			;9421
	ld (hl),000h		;9422
	ld de,0000bh		;9424
	add hl,de			;9427
	ld (hl),000h		;9428
	call 040c9h		;942a
	call 040aeh		;942d
	ld a,07fh		;9430
	ld (0ed0dh),a		;9432
	ld (0ed2ah),a		;9435
	scf			;9438
	ret			;9439
L_943A:
	ld a,(0ec73h)		;943a
	cp 002h		;943d
	jr z,L_947C		;943f
	ld hl,(0e221h)		;9441
	ld a,h			;9444
	or a			;9445
	jr z,L_9453		;9446
	cp 002h		;9448
	jp nc,L_9528		;944a
	ld a,l			;944d
	cp 018h		;944e
	jp nc,L_9528		;9450
L_9453:
	call L_949A		;9453
	ret nz			;9456
	ld a,(0eddeh)		;9457
	rra			;945a
	ret c			;945b
	ld a,002h		;945c
	ld (0e33bh),a		;945e
	xor a			;9461
	ld (0ed39h),a		;9462
	ld d,060h		;9465
	ld hl,07e61h		;9467
	call L_93CB		;946a
	ld a,01eh		;946d
	call 057ffh		;946f   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	ld a,(0e19bh)		;9472   ; lee la media entrada (bit 0: 0 la alta, 1 la baja; 0x11 = la baja de la 9.a)
	rra			;9475
	jp nc,0003dh		;9476
	jp 0003eh		;9479   ; BIOS INIFNK - Initialises the contents of the function keys
L_947C:
	ld a,(0e33bh)		;947c
	or a			;947f
	ret z			;9480
	ld a,(0ec73h)		;9481
	push af			;9484
	call L_960F		;9485
	ld a,(0ec73h)		;9488
	ld b,a			;948b
	pop af			;948c
	ld (0ec73h),a		;948d
	dec b			;9490
	ret nz			;9491
	xor a			;9492
	ld (0e302h),a		;9493
	ld (0ed39h),a		;9496
	ret			;9499
L_949A:
	call L_95AA		;949a
	ld a,(0ec73h)		;949d
	cp 002h		;94a0
	ret nz			;94a2
	call L_960F		;94a3
	ld a,(0ec73h)		;94a6
	cp 002h		;94a9
	ret			;94ab
L_94AC:
	ld hl,(0e221h)		;94ac
	ld bc,(0e223h)		;94af
	ld a,b			;94b3
	or a			;94b4
	jr z,L_94DB		;94b5
	dec a			;94b7
	jr nz,L_94BF		;94b8
	ld a,c			;94ba
	cp 040h		;94bb
	jr c,L_94DB		;94bd
L_94BF:
	srl b		;94bf
	rr c		;94c1
	add hl,bc			;94c3
	ld de,00230h		;94c4
L_94C7:
	or a			;94c7
	sbc hl,de		;94c8
	rl h		;94ca
	jp c,L_94D5		;94cc
	ld hl,0eddfh		;94cf
	set 1,(hl)		;94d2
	ret			;94d4
L_94D5:
	ld hl,0eddfh		;94d5
	res 1,(hl)		;94d8
	ret			;94da
L_94DB:
	srl b		;94db
	rr c		;94dd
	or a			;94df
	sbc hl,bc		;94e0
	ld de,000f0h		;94e2
	jr L_94C7		;94e5
L_94E7:
	ld hl,(0e221h)		;94e7
	ld bc,(0e223h)		;94ea
	ld a,b			;94ee
	or a			;94ef
	jr z,L_950C		;94f0
	dec a			;94f2
	jr z,L_9521		;94f3
L_94F5:
	srl b		;94f5
	rr c		;94f7
	or a			;94f9
	sbc hl,bc		;94fa
	ld bc,00080h		;94fc
	or a			;94ff
	sbc hl,bc		;9500
	rl h		;9502
	jr nc,L_951B		;9504
L_9506:
	ld hl,0eddfh		;9506
	set 2,(hl)		;9509
	ret			;950b
L_950C:
	srl b		;950c
	rr c		;950e
	add hl,bc			;9510
	ld bc,001c0h		;9511
	or a			;9514
	sbc hl,bc		;9515
	rl h		;9517
	jr c,L_9506		;9519
L_951B:
	ld hl,0eddfh		;951b
	res 2,(hl)		;951e
	ret			;9520
L_9521:
	ld a,c			;9521
	cp 040h		;9522
	jr nc,L_94F5		;9524
	jr L_950C		;9526
L_9528:
	ld hl,(0e221h)		;9528
	ld de,(0e223h)		;952b
	call L_9557		;952f
	ret c			;9532
	call L_954D		;9533
	ld hl,(0e21dh)		;9536
	ld a,h			;9539
	or a			;953a
	jr nz,L_9547		;953b
	ld a,l			;953d
	cp b			;953e
	jr nc,L_9547		;953f
	ld a,001h		;9541
	ld (0ec73h),a		;9543
	ret			;9546
L_9547:
	ld a,002h		;9547
	ld (0ec73h),a		;9549
	ret			;954c
L_954D:
	ld b,010h		;954d
	ld a,(0e1a6h)		;954f
	dec a			;9552
	ret nz			;9553
	ld b,040h		;9554
	ret			;9556
L_9557:
	ld a,d			;9557
	or a			;9558
	jr z,L_9570		;9559
	dec a			;955b
	jr z,L_9584		;955c
	ld a,e			;955e
	cp 028h		;955f
	jr c,L_9589		;9561
	sla e		;9563
	rl d		;9565
	add hl,de			;9567
	ld de,005e0h		;9568
	sbc hl,de		;956b
L_956D:
	rl h		;956d
	ret			;956f
L_9570:
	ld a,e			;9570
	cp 058h		;9571
	jr c,L_959C		;9573
	srl d		;9575
	rr e		;9577
	or a			;9579
	sbc hl,de		;957a
	ld de,00164h		;957c
	or a			;957f
	sbc hl,de		;9580
	jr L_956D		;9582
L_9584:
	ld a,e			;9584
	cp 080h		;9585
	jr c,L_9595		;9587
L_9589:
	srl d		;9589
	rr e		;958b
	add hl,de			;958d
	ld de,002a4h		;958e
	sbc hl,de		;9591
	jr L_956D		;9593
L_9595:
	ld de,001e3h		;9595
	sbc hl,de		;9598
	jr L_956D		;959a
L_959C:
	sla e		;959c
	rl d		;959e
	sbc hl,de		;95a0
	or a			;95a2
	ld de,000e0h		;95a3
	sbc hl,de		;95a6
	jr L_956D		;95a8
L_95AA:
	ld hl,(0e221h)		;95aa
	ld de,(0e223h)		;95ad
	call L_95BB		;95b1
	ret nc			;95b4
	ld a,002h		;95b5
	ld (0ec73h),a		;95b7
	ret			;95ba
L_95BB:
	ld a,d			;95bb
	dec a			;95bc
	jr z,L_95D2		;95bd
	dec a			;95bf
	jr z,L_95DB		;95c0
	ld a,e			;95c2
	cp 0bch		;95c3
	jr c,L_95E3		;95c5
	cp 0f8h		;95c7
	jr c,L_95EC		;95c9
L_95CB:
	ld a,h			;95cb
	or a			;95cc
	ret nz			;95cd
	ld a,l			;95ce
	cp 06ah		;95cf
	ret			;95d1
L_95D2:
	ld a,e			;95d2
	cp 088h		;95d3
	jr c,L_95CB		;95d5
	cp 0c4h		;95d7
	jr c,L_95FC		;95d9
L_95DB:
	sbc hl,de		;95db
	ld de,0014ch		;95dd
	add hl,de			;95e0
	jr L_95E9		;95e1
L_95E3:
	add hl,de			;95e3
	ld de,00134h		;95e4
	sbc hl,de		;95e7
L_95E9:
	rl h		;95e9
	ret			;95eb
L_95EC:
	srl d		;95ec
	rr e		;95ee
	srl d		;95f0
	rr e		;95f2
	add hl,de			;95f4
	ld de,000a8h		;95f5
	sbc hl,de		;95f8
	jr L_95E9		;95fa
L_95FC:
	srl d		;95fc
	rr e		;95fe
	srl d		;9600
	rr e		;9602
	or a			;9604
	sbc hl,de		;9605
	or a			;9607
	ld de,00008h		;9608
	sbc hl,de		;960b
	jr L_95E9		;960d
L_960F:
	ld hl,(0e221h)		;960f
	or a			;9612
	ld de,(0e21dh)		;9613
	sbc hl,de		;9617
	ld a,h			;9619
	rla			;961a
	jp c,L_9651		;961b
	ld de,(0e223h)		;961e
	ld a,d			;9622
	dec a			;9623
	jr z,L_963E		;9624
	dec a			;9626
	jr z,L_9647		;9627
	ld a,e			;9629
	cp 0b0h		;962a
	jr c,L_9657		;962c
	cp 0f0h		;962e
	jr c,L_965F		;9630
L_9632:
	ld a,l			;9632
	cp 05ch		;9633
	jp c,L_9651		;9635
L_9638:
	ld a,001h		;9638
	ld (0ec73h),a		;963a
	ret			;963d
L_963E:
	ld a,e			;963e
	cp 090h		;963f
	jr c,L_9632		;9641
	cp 0d0h		;9643
	jr c,L_9673		;9645
L_9647:
	sbc hl,de		;9647
	ld de,00168h		;9649
	add hl,de			;964c
L_964D:
	rl h		;964d
	jr nc,L_9638		;964f
L_9651:
	ld a,002h		;9651
	ld (0ec73h),a		;9653
	ret			;9656
L_9657:
	add hl,de			;9657
	ld de,00118h		;9658
	sbc hl,de		;965b
	jr L_964D		;965d
L_965F:
	srl d		;965f
	rr e		;9661
	srl d		;9663
	rr e		;9665
	srl d		;9667
	rr e		;9669
	add hl,de			;966b
	ld de,0007ah		;966c
	sbc hl,de		;966f
	jr L_964D		;9671
L_9673:
	srl d		;9673
	rr e		;9675
	srl d		;9677
	rr e		;9679
	srl d		;967b
	rr e		;967d
	or a			;967f
	sbc hl,de		;9680
	or a			;9682
	ld de,0002ah		;9683
	sbc hl,de		;9686
	jr L_964D		;9688
L_968A:
	ld a,(0de02h)		;968a
	bit 4,a		;968d
	jr z,L_9694		;968f
	call L_971A		;9691
L_9694:
	jp L_9787		;9694
L_9697:
	ld hl,0e195h		;9697
	ld (hl),001h		;969a
	inc hl			;969c
	inc hl			;969d
	ld (hl),002h		;969e
	ld a,(0d6e1h)		;96a0
	dec a			;96a3
	ret nz			;96a4
	push hl			;96a5
	ld hl,0d6dch		;96a6
	ld a,(hl)			;96a9
	cp 005h		;96aa
	jr c,L_96B4		;96ac
L_96AE:
	sub 005h		;96ae
	cp 005h		;96b0
	jr nc,L_96AE		;96b2
L_96B4:
	pop hl			;96b4
	push af			;96b5
	ld (hl),a			;96b6
	ld l,a			;96b7
	ld h,000h		;96b8
	ld b,h			;96ba
	ld c,l			;96bb
	add hl,hl			;96bc
	add hl,hl			;96bd
	add hl,hl			;96be
	add hl,hl			;96bf
	and a			;96c0
	sbc hl,bc		;96c1
	ld bc,0d68fh		;96c3
	add hl,bc			;96c6
	ld de,0d740h		;96c7
	ld bc,0000bh		;96ca
	ldir		;96cd
	pop af			;96cf
	ld b,a			;96d0
	add a,a			;96d1
	add a,a			;96d2
	add a,b			;96d3
	ld hl,09701h		;96d4
	call 04216h		;96d7   ; hl_mas_a: HL = HL + A
	ld de,0e197h		;96da
	ld a,(hl)			;96dd
	ld (de),a			;96de
	inc hl			;96df
	ld de,0d711h		;96e0
	ld bc,00004h		;96e3
L_96E6:
	ldi		;96e6
	inc de			;96e8
	ld a,c			;96e9
	or a			;96ea
	jr nz,L_96E6		;96eb
	ld a,(0d6dch)		;96ed
	rra			;96f0
	ret nc			;96f1
	ld a,(0e195h)		;96f2
	ld b,a			;96f5
	ld a,(0e197h)		;96f6
	ld (0e195h),a		;96f9
	ld a,b			;96fc
	ld (0e197h),a		;96fd
	ret			;9700

; ----------------------------------------------------------------------
; DATOS resto_9701: lo apuntan con el banco puesto p14:96D4 (0x9701); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p14:96D4 (25 bytes)
;   0x9701..0x971a  (25 bytes)
DATA_resto_9701:
	defb 002h,003h,004h,005h,006h,003h,002h,006h,004h,005h,004h,002h,005h,003h,006h,005h	; 9701  ................
	defb 002h,003h,004h,006h,006h,002h,004h,003h,005h	; 9711  .........

; ======================================================================
; CODIGO 0x971a..0x97f5  (219 bytes)
; ======================================================================


L_971A:
	sub a			;971a
	ld hl,0e340h		;971b
	ld (hl),a			;971e
	inc (hl)			;971f
	ld (hl),a			;9720
	ld a,(0d6e1h)		;9721
	dec a			;9724
	jr nz,L_973D		;9725
	ld a,(0d6dch)		;9727
	inc a			;972a
L_972B:
	ld hl,0e340h		;972b
	call 0adach		;972e
	ld de,06c0ch		;9731
	call 05c56h		;9734
	ld hl,07d35h		;9737
	jp 04ea6h		;973a   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
L_973D:
	ld d,000h		;973d
	ld a,(0e195h)		;973f
	dec a			;9742
	ld e,a			;9743
	ld hl,0d70ah		;9744
	add hl,de			;9747
	ld b,(hl)			;9748
	ld a,(0e197h)		;9749
	dec a			;974c
	ld e,a			;974d
	ld hl,0d70ah		;974e
	add hl,de			;9751
	ld l,(hl)			;9752
	ld h,b			;9753
	push hl			;9754
	ld a,l			;9755
	call 065fbh		;9756
	ld l,c			;9759
	ld h,000h		;975a
	add hl,hl			;975c
	ld d,h			;975d
	ld e,l			;975e
	add hl,hl			;975f
	add hl,de			;9760
	ld bc,0d6e3h		;9761
	add hl,bc			;9764
	pop de			;9765
	ld a,d			;9766
	push hl			;9767
	call 065fbh		;9768
	pop hl			;976b
	ld b,000h		;976c
	add hl,bc			;976e
	ld a,(hl)			;976f
	inc a			;9770
	jr L_972B		;9771
L_9773:
	ld hl,097f5h		;9773
	call 04ea6h		;9776   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld hl,09826h		;9779
	call 04ea6h		;977c   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld hl,0982dh		;977f
	call 04ea6h		;9782   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	jr L_97B1		;9785
L_9787:
	ld a,(0de02h)		;9787
	bit 3,a		;978a
	jr nz,L_9773		;978c
	ld a,(0e190h)		;978e   ; lee el modo de juego (0 1PLAYER, 1 2PLAYERS, 2 PENNANT, 3 TEAM EDIT, 4 WATCH, 5 MEDIA SELECT)
	cp 002h		;9791
	jr z,L_97D3		;9793
	ld hl,097fah		;9795
	call 04ea6h		;9798   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld a,(0de02h)		;979b
	bit 5,a		;979e
	ld hl,09804h		;97a0
	jr nz,L_97A8		;97a3
	ld hl,0980eh		;97a5
L_97A8:
	call 04ea6h		;97a8   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld hl,097f5h		;97ab
	call 04ea6h		;97ae   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
L_97B1:
	ld de,01834h		;97b1
	ld hl,09034h		;97b4
	ld a,(0de02h)		;97b7
	bit 5,a		;97ba
	jr nz,L_97C5		;97bc
	ld a,(0d6dch)		;97be
	rra			;97c1
	jr nc,L_97C5		;97c2
	ex de,hl			;97c4
L_97C5:
	push hl			;97c5
	ld hl,0d680h		;97c6
	call L_97E1		;97c9
	pop de			;97cc
	ld hl,0d740h		;97cd
	jp L_97E1		;97d0
L_97D3:
	ld hl,09814h		;97d3
	call 04ea6h		;97d6   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld hl,097f5h		;97d9
	call 04ea6h		;97dc   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	jr L_97B1		;97df
L_97E1:
	ld b,00ah		;97e1
L_97E3:
	push bc			;97e3
	call L_9834		;97e4
	add a,0a0h		;97e7
	call 04f1ch		;97e9   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld a,d			;97ec
	add a,008h		;97ed
	ld d,a			;97ef
	inc hl			;97f0
	pop bc			;97f1
	djnz L_97E3		;97f2
	ret			;97f4

; ----------------------------------------------------------------------
; DATOS texto_97F5: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p14:9776, p14:97AE, p14:97DC (5 bytes)
;   0x97f5..0x97fa  (5 bytes)
DATA_texto_97F5:
	defb 078h,034h,024h,021h,0ffh	; 97f5

; ----------------------------------------------------------------------
; DATOS texto_97FA: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p14:9798 (10 bytes)
;   0x97fa..0x9804  (10 bytes)
DATA_texto_97FA:
	defb 024h,020h,01eh,01ah,00fh,027h,013h,020h,002h,0ffh	; 97fa  $ ...'. ..

; ----------------------------------------------------------------------
; DATOS resto_9804: lo apuntan con el banco puesto p14:97A0 (0x9804); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p14:97A0 (10 bytes)
;   0x9804..0x980e  (10 bytes)
DATA_resto_9804:
	defb 09ch,020h,01eh,01ah,00fh,027h,013h,020h,003h,0ffh	; 9804  . ...'. ..

; ----------------------------------------------------------------------
; DATOS texto_980E: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p14:97A8 (6 bytes)
;   0x980e..0x9814  (6 bytes)
DATA_texto_980E:
	defb 0a8h,020h,011h,01eh,023h,0ffh	; 980e

; ----------------------------------------------------------------------
; DATOS texto_9814: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p14:97D6 (18 bytes)
;   0x9814..0x9826  (18 bytes)
DATA_texto_9814:
	defb 024h,020h,024h,017h,021h,017h,022h,01dh,020h,021h,0feh,09ch,020h,016h,01dh,01bh	; 9814  $ $.!.". !.. ...
	defb 013h,0ffh	; 9824

; ----------------------------------------------------------------------
; DATOS texto_9826: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p14:977C (7 bytes)
;   0x9826..0x982d  (7 bytes)
DATA_texto_9826:
	defb 038h,020h,011h,01eh,023h,002h,0ffh	; 9826

; ----------------------------------------------------------------------
; DATOS texto_982D: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p14:9782 (7 bytes)
;   0x982d..0x9834  (7 bytes)
DATA_texto_982D:
	defb 0a8h,020h,011h,01eh,023h,003h,0ffh	; 982d

; ======================================================================
; CODIGO 0x9834..0x9868  (52 bytes)
; ======================================================================


L_9834:
	ld a,(hl)			;9834
	or a			;9835
	ret z			;9836
	cp 020h		;9837
	jr z,L_984E		;9839
	cp 024h		;983b
	jr z,L_984E		;983d
	cp 05fh		;983f
	jr z,L_984E		;9841
	cp 030h		;9843
	jr c,L_9850		;9845
	cp 03ah		;9847
	jr nc,L_9850		;9849
	sub 02fh		;984b
	ret			;984d
L_984E:
	xor a			;984e
	ret			;984f
L_9850:
	sub 032h		;9850
	ret			;9852
L_9853:
	call 05c73h		;9853
	call L_9DD4		;9856
	call 04039h		;9859
	call L_9B57		;985c
	call L_99B5		;985f
	ld a,(0e304h)		;9862
	call 04220h		;9865   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_9868: 3 destinos del despachador p00:4220 (call en p14:9865, el
;   indice en A): 986E, 98AA, 99A4; lo leen p14:9865 (6 bytes)
;   0x9868..0x986e  (6 bytes)
DATA_tabla_9868:
	defw 0986eh,098aah,099a4h	; 9868  -> L_986E L_98AA L_99A4

; ======================================================================
; CODIGO 0x986e..0x9a3e  (464 bytes)
; ======================================================================


L_986E:
	ld a,(0e19ch)		;986e
	ld hl,0e30dh		;9871
L_9874:
	ld b,a			;9874
	and 020h		;9875
	jr z,L_9886		;9877
	ld a,027h		;9879
	call 057ffh		;987b   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	call L_9B6C		;987e
	ld hl,0e304h		;9881
	inc (hl)			;9884
	ret			;9885
L_9886:
	ld a,(0edd9h)		;9886
	or a			;9889
	ret nz			;988a
	ld a,b			;988b
	ld b,0ffh		;988c
	rra			;988e
	jr c,L_9895		;988f
	ld b,001h		;9891
	rra			;9893
	ret nc			;9894
L_9895:
	ld a,b			;9895
	add a,(hl)			;9896
	cp 0ffh		;9897
	ld b,008h		;9899
	jr z,L_98A4		;989b
	cp 009h		;989d
	ld b,000h		;989f
	jr z,L_98A4		;98a1
	ld b,a			;98a3
L_98A4:
	ld (hl),b			;98a4
	ld a,026h		;98a5
	jp 057ffh		;98a7   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_98AA:
	ld a,(0e19ch)		;98aa
	and 020h		;98ad
	jp z,L_994D		;98af
	ld a,(0ed84h)		;98b2
	or a			;98b5
	jr z,L_98CA		;98b6
	ld a,(0ede3h)		;98b8
	ld b,a			;98bb
	ld a,(0e19bh)		;98bc   ; lee la media entrada (bit 0: 0 la alta, 1 la baja; 0x11 = la baja de la 9.a)
	cp b			;98bf
	jr z,L_98CA		;98c0
	ld a,(0e30bh)		;98c2
	cp 00dh		;98c5
	jp c,L_994D		;98c7
L_98CA:
	call L_9B67		;98ca
	ld a,(0e30dh)		;98cd
	ld hl,0ec50h		;98d0
	call 04216h		;98d3   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;98d6
	cp 00dh		;98d7
	jr c,L_98EA		;98d9
	ld hl,0ec5dh		;98db
	ld b,004h		;98de
L_98E0:
	ld a,(hl)			;98e0
	or a			;98e1
	jr nz,L_98EA		;98e2
	inc hl			;98e4
	djnz L_98E0		;98e5
	jp L_9D7D		;98e7
L_98EA:
	ld a,(0e30dh)		;98ea
	call L_9B4E		;98ed
	ld d,050h		;98f0
	ld a,(0e30bh)		;98f2
	ld hl,0d38bh		;98f5
	ld bc,0ec50h		;98f8
	call 04054h		;98fb
	ld a,(0e30bh)		;98fe
	call L_9B4E		;9901
	ld d,050h		;9904
	call 04030h		;9906
	ld a,(0e30bh)		;9909
	ld hl,0ec50h		;990c
	ld d,h			;990f
	ld e,l			;9910
	call 04216h		;9911   ; hl_mas_a: HL = HL + A
	ld b,(hl)			;9914
	ld a,(0e30dh)		;9915
	call 0421bh		;9918   ; de_mas_a: DE = DE + A
	ld a,(de)			;991b
	ld (hl),000h		;991c
	ld a,b			;991e
	ld (de),a			;991f
	xor a			;9920
	ld (0e304h),a		;9921
	ld hl,0e30bh		;9924
	ld de,0ec50h		;9927
	call L_9B80		;992a
	ld a,027h		;992d
	call 057ffh		;992f   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	call L_9938		;9932
	jp L_9D98		;9935
L_9938:
	ld hl,0ec59h		;9938
L_993B:
	ld b,008h		;993b
L_993D:
	ld a,(hl)			;993d
	or a			;993e
	ret nz			;993f
	inc hl			;9940
	djnz L_993D		;9941
	ld a,(0edd9h)		;9943
	or a			;9946
	jp nz,L_9D7D		;9947
	jp L_9D6D		;994a
L_994D:
	ld a,(0e19ch)		;994d
	rra			;9950
	ld d,0ffh		;9951
	jr c,L_9959		;9953
	rra			;9955
	ld d,001h		;9956
	ret nc			;9958
L_9959:
	ld a,(0edd8h)		;9959
	ld l,a			;995c
	add a,003h		;995d
	ld h,a			;995f
	ld a,(0e30bh)		;9960
	add a,d			;9963
	ld b,h			;9964
	ld c,l			;9965
	dec c			;9966
	cp c			;9967
	jr z,L_9971		;9968
	ld b,a			;996a
	ld c,h			;996b
	inc c			;996c
	cp c			;996d
	jr c,L_9971		;996e
	ld b,l			;9970
L_9971:
	ld c,b			;9971
	ld b,008h		;9972
L_9974:
	push hl			;9974
	ld a,c			;9975
	ld hl,0ec50h		;9976
	call 04216h		;9979   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;997c
	pop hl			;997d
	or a			;997e
	jr nz,L_9997		;997f
	ld a,c			;9981
	add a,d			;9982
	ld c,a			;9983
	ld e,l			;9984
	dec e			;9985
	cp e			;9986
	jr z,L_9991		;9987
	ld e,h			;9989
	inc e			;998a
	cp e			;998b
	jr nz,L_9992		;998c
	ld c,l			;998e
	jr L_9992		;998f
L_9991:
	ld c,h			;9991
L_9992:
	djnz L_9974		;9992
	jp L_9D6D		;9994
L_9997:
	ld hl,0e30bh		;9997
	ld (hl),c			;999a
	ld a,c			;999b
	ld d,050h		;999c
	ld bc,0e100h		;999e   ; apunta a los atributos de sprite (32 fichas de 4 bytes [y][x][dibujo][color])
	jp L_9B31		;99a1
L_99A4:
	ld hl,0e308h		;99a4
	dec (hl)			;99a7
	ret nz			;99a8
	ld a,001h		;99a9
	ld (0e1d1h),a		;99ab   ; guarda la marca de 'acabado' que dejan las rutinas de cada paso
	call 0406fh		;99ae
	call 0404bh		;99b1
	ret			;99b4
L_99B5:
	ld a,(0e304h)		;99b5
	cp 002h		;99b8
	ret z			;99ba
	ld a,(0e19ch)		;99bb
	and 010h		;99be
	ret z			;99c0
L_99C1:
	ld de,0ec50h		;99c1
	call 04042h		;99c4
	ld a,000h		;99c7
	jr nc,L_99D3		;99c9
	ld a,(0e19bh)		;99cb   ; lee la media entrada (bit 0: 0 la alta, 1 la baja; 0x11 = la baja de la 9.a)
	ld (0ede3h),a		;99ce
	ld a,001h		;99d1
L_99D3:
	ld (0ed84h),a		;99d3
	ld b,a			;99d6
	xor a			;99d7
	or b			;99d8
	jr z,L_9A07		;99d9
	ld a,(0e19bh)		;99db   ; lee la media entrada (bit 0: 0 la alta, 1 la baja; 0x11 = la baja de la 9.a)
	rra			;99de
	ret c			;99df
	jr L_9A07		;99e0
L_99E2:
	ld a,(0e19eh)		;99e2
	and 010h		;99e5
	ret z			;99e7
L_99E8:
	ld de,0ec62h		;99e8
	call 04042h		;99eb
	ld a,000h		;99ee
	jr nc,L_99FA		;99f0
	ld a,(0e19bh)		;99f2   ; lee la media entrada (bit 0: 0 la alta, 1 la baja; 0x11 = la baja de la 9.a)
	ld (0ede4h),a		;99f5
	ld a,001h		;99f8
L_99FA:
	ld (0ed85h),a		;99fa
	ld b,a			;99fd
	xor a			;99fe
	or b			;99ff
	jr z,L_9A07		;9a00
	ld a,(0e19bh)		;9a02   ; lee la media entrada (bit 0: 0 la alta, 1 la baja; 0x11 = la baja de la 9.a)
	rra			;9a05
	ret nc			;9a06
L_9A07:
	ld a,048h		;9a07
	call 057ffh		;9a09   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	ld a,060h		;9a0c
	ld (0e308h),a		;9a0e
	ld a,002h		;9a11
	ld (0e304h),a		;9a13
	ld hl,0e103h		;9a16
	ld de,00004h		;9a19
	ld b,004h		;9a1c
L_9A1E:
	ld (hl),000h		;9a1e
	add hl,de			;9a20
	djnz L_9A1E		;9a21
	jp 040dbh		;9a23
L_9A26:
	call 05c73h		;9a26
	call L_9DD4		;9a29
	call 04039h		;9a2c
	ld hl,0e30eh		;9a2f
	call L_9B5A		;9a32
	call L_99E2		;9a35
	ld a,(0e304h)		;9a38
	call 04220h		;9a3b   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_9A3E: 3 destinos del despachador p00:4220 (call en p14:9A3B, el
;   indice en A): 9A44, 9A4D, 99A4; lo leen p14:9A3B (6 bytes)
;   0x9a3e..0x9a44  (6 bytes)
DATA_tabla_9A3E:
	defw 09a44h,09a4dh,099a4h	; 9a3e  -> L_9A44 L_9A4D L_99A4

; ======================================================================
; CODIGO 0x9a44..0x9bab  (359 bytes)
; ======================================================================


L_9A44:
	ld a,(0e19eh)		;9a44
	ld hl,0e30eh		;9a47
	jp L_9874		;9a4a
L_9A4D:
	ld a,(0e19eh)		;9a4d
	and 020h		;9a50
	jp z,L_9ADD		;9a52
	ld a,(0ed85h)		;9a55
	or a			;9a58
	jr z,L_9A6C		;9a59
	ld a,(0ede4h)		;9a5b
	ld b,a			;9a5e
	ld a,(0e19bh)		;9a5f   ; lee la media entrada (bit 0: 0 la alta, 1 la baja; 0x11 = la baja de la 9.a)
	cp b			;9a62
	jr z,L_9A6C		;9a63
	ld a,(0e30ch)		;9a65
	cp 00dh		;9a68
	jr c,L_9ADD		;9a6a
L_9A6C:
	call L_9B67		;9a6c
	ld a,(0e30eh)		;9a6f
	ld hl,0ec62h		;9a72
	call 04216h		;9a75   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;9a78
	cp 00dh		;9a79
	jr c,L_9A8C		;9a7b
	ld hl,0ec6fh		;9a7d
	ld b,004h		;9a80
L_9A82:
	ld a,(hl)			;9a82
	or a			;9a83
	jr nz,L_9A8C		;9a84
	inc hl			;9a86
	djnz L_9A82		;9a87
	jp L_9D7D		;9a89
L_9A8C:
	ld a,(0e30eh)		;9a8c
	call L_9B4E		;9a8f
	ld d,050h		;9a92
	ld a,(0e30ch)		;9a94
	ld hl,0d48ah		;9a97
	ld bc,0ec62h		;9a9a
	call 04054h		;9a9d
	ld a,(0e30ch)		;9aa0
	call L_9B4E		;9aa3
	ld d,050h		;9aa6
	call 04030h		;9aa8
	ld a,(0e30ch)		;9aab
	ld hl,0ec62h		;9aae
	ld d,h			;9ab1
	ld e,l			;9ab2
	call 04216h		;9ab3   ; hl_mas_a: HL = HL + A
	ld b,(hl)			;9ab6
	ld a,(0e30eh)		;9ab7
	call 0421bh		;9aba   ; de_mas_a: DE = DE + A
	ld a,(de)			;9abd
	ld (hl),000h		;9abe
	ld a,b			;9ac0
	ld (de),a			;9ac1
	xor a			;9ac2
	ld (0e304h),a		;9ac3
	ld hl,0e30ch		;9ac6
	ld de,0ec62h		;9ac9
	call L_9B80		;9acc
	ld a,027h		;9acf
	call 057ffh		;9ad1   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	ld hl,0ec6bh		;9ad4
	call L_993B		;9ad7
	jp L_9D98		;9ada
L_9ADD:
	ld a,(0e19eh)		;9add
	rra			;9ae0
	ld d,0ffh		;9ae1
	jr c,L_9AE9		;9ae3
	rra			;9ae5
	ld d,001h		;9ae6
	ret nc			;9ae8
L_9AE9:
	ld a,(0edd8h)		;9ae9
	ld l,a			;9aec
	add a,003h		;9aed
	ld h,a			;9aef
	ld a,(0e30ch)		;9af0
	add a,d			;9af3
	ld b,h			;9af4
	ld c,l			;9af5
	dec c			;9af6
	cp c			;9af7
	jr z,L_9B01		;9af8
	ld b,a			;9afa
	ld c,h			;9afb
	inc c			;9afc
	cp c			;9afd
	jr c,L_9B01		;9afe
	ld b,l			;9b00
L_9B01:
	ld c,b			;9b01
	ld b,008h		;9b02
L_9B04:
	push hl			;9b04
	ld a,c			;9b05
	ld hl,0ec62h		;9b06
	call 04216h		;9b09   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;9b0c
	pop hl			;9b0d
	or a			;9b0e
	jr nz,L_9B27		;9b0f
	ld a,c			;9b11
	add a,d			;9b12
	ld c,a			;9b13
	ld e,l			;9b14
	dec e			;9b15
	cp e			;9b16
	jr z,L_9B21		;9b17
	ld e,h			;9b19
	inc e			;9b1a
	cp e			;9b1b
	jr nz,L_9B22		;9b1c
	ld c,l			;9b1e
	jr L_9B22		;9b1f
L_9B21:
	ld c,h			;9b21
L_9B22:
	djnz L_9B04		;9b22
	jp L_9D6D		;9b24
L_9B27:
	ld hl,0e30ch		;9b27
	ld (hl),c			;9b2a
	ld a,c			;9b2b
	ld d,050h		;9b2c
	ld bc,0e100h		;9b2e   ; apunta a los atributos de sprite (32 fichas de 4 bytes [y][x][dibujo][color])
L_9B31:
	ld hl,09bbbh		;9b31
	call 04216h		;9b34   ; hl_mas_a: HL = HL + A
	ld e,(hl)			;9b37
	ld a,d			;9b38
	ld h,b			;9b39
	ld l,c			;9b3a
	ld b,003h		;9b3b
L_9B3D:
	ld (hl),e			;9b3d
	inc hl			;9b3e
	ld (hl),a			;9b3f
	inc hl			;9b40
	inc hl			;9b41
	inc hl			;9b42
	add a,010h		;9b43
	djnz L_9B3D		;9b45
	ld a,026h		;9b47
	jp 057ffh		;9b49   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_9B4C:
	scf			;9b4c
	ret			;9b4d
L_9B4E:
	ld hl,09bbbh		;9b4e
	call 04216h		;9b51   ; hl_mas_a: HL = HL + A
	ld e,(hl)			;9b54
	inc e			;9b55
	ret			;9b56
L_9B57:
	ld hl,0e30dh		;9b57
L_9B5A:
	ld bc,0e10ch		;9b5a
	ld a,(hl)			;9b5d
	ld hl,09bbbh		;9b5e
	call 04216h		;9b61   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;9b64
	ld (bc),a			;9b65
	ret			;9b66
L_9B67:
	ld bc,00a09h		;9b67
	jr L_9B6F		;9b6a
L_9B6C:
	ld bc,0090ah		;9b6c
L_9B6F:
	ld a,b			;9b6f
	ld (0e10fh),a		;9b70
	ld a,c			;9b73
	ld (0e103h),a		;9b74
	ld (0e107h),a		;9b77
	ld (0e10bh),a		;9b7a
	jp 040dbh		;9b7d
L_9B80:
	ld a,(0edd8h)		;9b80
	add a,004h		;9b83
	ld c,a			;9b85
	ld b,004h		;9b86
L_9B88:
	inc (hl)			;9b88
	ld a,(hl)			;9b89
	cp c			;9b8a
	jr c,L_9B91		;9b8b
	ld a,c			;9b8d
	sub 004h		;9b8e
	ld (hl),a			;9b90
L_9B91:
	push de			;9b91
	call 0421bh		;9b92   ; de_mas_a: DE = DE + A
	ld a,(de)			;9b95
	pop de			;9b96
	or a			;9b97
	jr nz,L_9BA7		;9b98
	djnz L_9B88		;9b9a
	ld a,(0edd8h)		;9b9c
	cp 009h		;9b9f
	jp nz,L_9D7D		;9ba1
	jp L_9D6D		;9ba4
L_9BA7:
	ld a,(hl)			;9ba7
	jp L_9DC0		;9ba8

; ----------------------------------------------------------------------
; DATOS resto_9BAB: lo apuntan con el banco puesto p14:9D0D (0x9BAB), p14:9B31
;   (0x9BBB), p14:9B4E (0x9BBB), p14:9B5E (0x9BBB), p14:9C37 (0x9BBB),
;   p14:9CCC (0x9BBB); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p14:9D0D, p14:9B31, p14:9B4E, p14:9B5E, p14:9C37,
;   p14:9CCC (33 bytes)
;   0x9bab..0x9bcc  (33 bytes)
DATA_resto_9BAB:
	defb 077h,050h,000h,009h,077h,060h,004h,009h,077h,070h,008h,009h,077h,048h,00ch,00ah	; 9bab  wP..w`..wp..wH..
	defb 027h,02fh,037h,03fh,047h,04fh,057h,05fh,067h,077h,07fh,087h,08fh,0a7h,0afh,0b7h	; 9bbb  '/7?GOW_gw......
	defb 0bfh	; 9bcb

; ======================================================================
; CODIGO 0x9bcc..0x9d9e  (466 bytes)
; ======================================================================


L_9BCC:
	call L_9CF6		;9bcc
	ld a,(0e19bh)		;9bcf   ; lee la media entrada (bit 0: 0 la alta, 1 la baja; 0x11 = la baja de la 9.a)
	rra			;9bd2
	ld a,009h		;9bd3
	jr nc,L_9BD9		;9bd5
	ld a,00dh		;9bd7
L_9BD9:
	ld (0edd8h),a		;9bd9
	ld (0e30bh),a		;9bdc
	ld hl,0e30bh		;9bdf
	ld de,0ec50h		;9be2
	call L_9D59		;9be5
	ld a,(0e30bh)		;9be8
	call L_9DC0		;9beb
	ld hl,0ec50h		;9bee
	ld de,0e30dh		;9bf1
	xor a			;9bf4
	ld (de),a			;9bf5
	ld (0edd9h),a		;9bf6
	ld a,(0e19bh)		;9bf9   ; lee la media entrada (bit 0: 0 la alta, 1 la baja; 0x11 = la baja de la 9.a)
	rra			;9bfc
	jr nc,L_9C02		;9bfd
	call L_9D42		;9bff
L_9C02:
	ld hl,0d380h		;9c02
	ld de,06000h		;9c05
	call 05be4h		;9c08
	ld a,002h		;9c0b
	ld de,04828h		;9c0d
	call 0405dh		;9c10
	ld b,011h		;9c13
	ld de,05028h		;9c15
	ld hl,0ec50h		;9c18
L_9C1B:
	ld a,(hl)			;9c1b
	inc hl			;9c1c
	call L_9C54		;9c1d
	ld a,b			;9c20
	ld c,010h		;9c21
	cp 009h		;9c23
	jr z,L_9C2F		;9c25
	ld c,018h		;9c27
	cp 005h		;9c29
	jr z,L_9C2F		;9c2b
	ld c,008h		;9c2d
L_9C2F:
	ld a,e			;9c2f
	add a,c			;9c30
	ld e,a			;9c31
	djnz L_9C1B		;9c32
	ld a,(0ec4fh)		;9c34
	ld hl,09bbbh		;9c37
	call 04216h		;9c3a   ; hl_mas_a: HL = HL + A
	ld e,(hl)			;9c3d
	ld d,03ch		;9c3e
	ld a,09ah		;9c40
	call 04f1ch		;9c42   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld a,(0edd8h)		;9c45
	ld e,a			;9c48
	ld d,000h		;9c49
	ld hl,0ec50h		;9c4b
	add hl,de			;9c4e
	ld b,004h		;9c4f
	jp L_993D		;9c51
L_9C54:
	push hl			;9c54
	push de			;9c55
	push bc			;9c56
	ld hl,0d38bh		;9c57
	call 04066h		;9c5a
	pop bc			;9c5d
	pop de			;9c5e
	pop hl			;9c5f
	ret			;9c60
L_9C61:
	call L_9CF6		;9c61
	ld a,(0e19bh)		;9c64   ; lee la media entrada (bit 0: 0 la alta, 1 la baja; 0x11 = la baja de la 9.a)
	rra			;9c67
	ld a,009h		;9c68
	jr c,L_9C6E		;9c6a
	ld a,00dh		;9c6c
L_9C6E:
	ld (0edd8h),a		;9c6e
	ld (0e30ch),a		;9c71
	ld hl,0e30ch		;9c74
	ld de,0ec62h		;9c77
	call L_9D59		;9c7a
	ld a,(0e30ch)		;9c7d
	call L_9DC0		;9c80
	ld hl,0ec62h		;9c83
	ld de,0e30eh		;9c86
	xor a			;9c89
	ld (de),a			;9c8a
	ld (0edd9h),a		;9c8b
	ld a,(0e19bh)		;9c8e   ; lee la media entrada (bit 0: 0 la alta, 1 la baja; 0x11 = la baja de la 9.a)
	rra			;9c91
	jr c,L_9C97		;9c92
	call L_9D42		;9c94
L_9C97:
	ld hl,0d47fh		;9c97
	ld de,06000h		;9c9a
	call 05be4h		;9c9d
	ld a,002h		;9ca0
	ld de,04828h		;9ca2
	call 0405dh		;9ca5
	ld b,011h		;9ca8
	ld de,05028h		;9caa
	ld hl,0ec62h		;9cad
L_9CB0:
	ld a,(hl)			;9cb0
	inc hl			;9cb1
	call L_9CE9		;9cb2
	ld a,b			;9cb5
	ld c,010h		;9cb6
	cp 009h		;9cb8
	jr z,L_9CC4		;9cba
	ld c,018h		;9cbc
	cp 005h		;9cbe
	jr z,L_9CC4		;9cc0
	ld c,008h		;9cc2
L_9CC4:
	ld a,e			;9cc4
	add a,c			;9cc5
	ld e,a			;9cc6
	djnz L_9CB0		;9cc7
	ld a,(0ec61h)		;9cc9
	ld hl,09bbbh		;9ccc
	call 04216h		;9ccf   ; hl_mas_a: HL = HL + A
	ld e,(hl)			;9cd2
	ld d,03ch		;9cd3
	ld a,09ah		;9cd5
	call 04f1ch		;9cd7   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld a,(0edd8h)		;9cda
	ld e,a			;9cdd
	ld d,000h		;9cde
	ld hl,0ec62h		;9ce0
	add hl,de			;9ce3
	ld b,004h		;9ce4
	jp L_993D		;9ce6
L_9CE9:
	push hl			;9ce9
	push de			;9cea
	push bc			;9ceb
	ld hl,0d48ah		;9cec
	call 04066h		;9cef
	pop bc			;9cf2
	pop de			;9cf3
	pop hl			;9cf4
	ret			;9cf5
L_9CF6:
	call 04b9fh		;9cf6   ; borra_pantalla: esconde los sprites, apaga la pantalla, rellena la VRAM de 0, R#23 = 0 y la enciende
	call 05c7dh		;9cf9   ; esconde_atributos: pone las 32 fichas de sprite de 0xE100 fuera de la pantalla
	call 059b6h		;9cfc
	ld a,004h		;9cff
	ld de,07003h		;9d01
	call 04bf0h		;9d04   ; pon_color: el color A de la paleta a D (rojo-azul) y E (verde), por R#16, y su copia en 0xDDC0 + 2 x A
	call 051fch		;9d07
	call 05c7dh		;9d0a   ; esconde_atributos: pone las 32 fichas de sprite de 0xE100 fuera de la pantalla
	ld hl,09babh		;9d0d
	ld de,0e100h		;9d10   ; apunta a los atributos de sprite (32 fichas de 4 bytes [y][x][dibujo][color])
	ld bc,00010h		;9d13
	ldir		;9d16
	call 040dbh		;9d18
	ld hl,07b63h		;9d1b
	call 04ea6h		;9d1e   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	xor a			;9d21
	ld (0e1d1h),a		;9d22   ; guarda la marca de 'acabado' que dejan las rutinas de cada paso
	ld (0de0dh),a		;9d25
	ld (0de0eh),a		;9d28
	ld (0e304h),a		;9d2b
	ld (0e302h),a		;9d2e
	ld (0ed03h),a		;9d31
	ld (0ed81h),a		;9d34
	ld hl,0e308h		;9d37
	ld d,008h		;9d3a
	ld (hl),d			;9d3c
	inc hl			;9d3d
	ld (hl),d			;9d3e
	inc hl			;9d3f
	ld (hl),a			;9d40
	ret			;9d41
L_9D42:
	ld bc,00901h		;9d42
L_9D45:
	ld a,(hl)			;9d45
	cp 00dh		;9d46
	jr nc,L_9D50		;9d48
	inc hl			;9d4a
	djnz L_9D45		;9d4b
	dec c			;9d4d
	jr L_9D54		;9d4e
L_9D50:
	ld a,009h		;9d50
	sub b			;9d52
	ld (de),a			;9d53
L_9D54:
	ld a,c			;9d54
	ld (0edd9h),a		;9d55
	ret			;9d58
L_9D59:
	ld b,004h		;9d59
	ld a,(0edd8h)		;9d5b
	ld c,a			;9d5e
	call 0421bh		;9d5f   ; de_mas_a: DE = DE + A
L_9D62:
	ld a,(de)			;9d62
	or a			;9d63
	jr z,L_9D68		;9d64
	ld (hl),c			;9d66
	ret			;9d67
L_9D68:
	inc de			;9d68
	inc c			;9d69
	djnz L_9D62		;9d6a
	ret			;9d6c
L_9D6D:
	ld hl,0487ch		;9d6d
	ld de,07010h		;9d70
	ld c,00dh		;9d73
	call 04cfeh		;9d75   ; marco: un marco de lineas: HL la esquina, DE el tamano
	ld hl,09d9eh		;9d78
	jr L_9D8B		;9d7b
L_9D7D:
	ld hl,048b4h		;9d7d
	ld de,07810h		;9d80
	ld c,00dh		;9d83
	call 04cfeh		;9d85   ; marco: un marco de lineas: HL la esquina, DE el tamano
	ld hl,09daeh		;9d88
L_9D8B:
	call 04ea6h		;9d8b   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
L_9D8E:
	ld a,(0de01h)		;9d8e   ; lee el paso dentro del estado
	dec a			;9d91
	jp z,L_99C1		;9d92
	jp L_99E8		;9d95
L_9D98:
	ld hl,0e304h		;9d98
	inc (hl)			;9d9b
	jr L_9D8E		;9d9c

; ----------------------------------------------------------------------
; DATOS resto_9D9E: lo apuntan con el banco puesto p14:9D78 (0x9D9E), p14:9D88
;   (0x9DAE); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p14:9D78, p14:9D88 (34 bytes)
;   0x9d9e..0x9dc0  (34 bytes)
DATA_resto_9D9E:
	defb 04ch,080h,043h,02eh,02ch,036h,056h,034h,05dh,02eh,00ch,02ah,047h,036h,056h,0ffh	; 9d9e  L.C.,6V4]..*G6V.
	defb 04ch,0b8h,043h,02eh,02ch,062h,00dh,063h,064h,065h,00eh,02eh,00ch,02ah,047h,036h	; 9dae  L.C.,b.cde...*G6
	defb 056h,0ffh	; 9dbe

; ======================================================================
; CODIGO 0x9dc0..0x9e38  (120 bytes)
; ======================================================================


L_9DC0:
	ld hl,09bbbh		;9dc0
	call 04216h		;9dc3   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;9dc6
	ld hl,0e100h		;9dc7   ; apunta a los atributos de sprite (32 fichas de 4 bytes [y][x][dibujo][color])
	ld b,003h		;9dca
L_9DCC:
	ld (hl),a			;9dcc
	inc hl			;9dcd
	inc hl			;9dce
	inc hl			;9dcf
	inc hl			;9dd0
	djnz L_9DCC		;9dd1
	ret			;9dd3
L_9DD4:
	ld a,(0de02h)		;9dd4
	bit 3,a		;9dd7
	ret nz			;9dd9
	bit 4,a		;9dda
	jr nz,L_9DF1		;9ddc
L_9DDE:
	ld hl,(0de06h)		;9dde   ; lee los botones recien pulsados del mando 1 / cursores y el byte siguiente (16 bits)
	ld (0e19ch),hl		;9de1
	ld hl,0de02h		;9de4
	bit 5,(hl)		;9de7
	ret z			;9de9
	ld hl,(0de08h)		;9dea   ; lee los botones recien pulsados (segundo mando) y el byte siguiente (16 bits)
	ld (0e19eh),hl		;9ded
	ret			;9df0
L_9DF1:
	bit 5,a		;9df1
	jr nz,L_9DDE		;9df3
	ld a,(0d6dch)		;9df5
	rra			;9df8
	jr nc,L_9DDE		;9df9
	ld hl,(0de06h)		;9dfb   ; lee los botones recien pulsados del mando 1 / cursores y el byte siguiente (16 bits)
	ld (0e19eh),hl		;9dfe
	ld hl,0de02h		;9e01
	bit 5,(hl)		;9e04
	ret z			;9e06
	ld hl,(0de08h)		;9e07   ; lee los botones recien pulsados (segundo mando) y el byte siguiente (16 bits)
	ld (0e19ch),hl		;9e0a
	ret			;9e0d
L_9E0E:
	call L_9F52		;9e0e
	call 05c7dh		;9e11   ; esconde_atributos: pone las 32 fichas de sprite de 0xE100 fuera de la pantalla
	ld de,0e100h		;9e14   ; apunta a los atributos de sprite (32 fichas de 4 bytes [y][x][dibujo][color])
	ld hl,0a38bh		;9e17
	ld bc,00050h		;9e1a
	ldir		;9e1d
	call 040dbh		;9e1f
	ld a,080h		;9e22
	ld (0de04h),a		;9e24   ; guarda la cuenta atras del estado
	ld a,003h		;9e27
	ld (0ecf0h),a		;9e29
	jp 05c7dh		;9e2c   ; esconde_atributos: pone las 32 fichas de sprite de 0xE100 fuera de la pantalla
L_9E2F:
	call 05c73h		;9e2f
	ld a,(0ecefh)		;9e32
	call 04220h		;9e35   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_9E38: 6 destinos del despachador p00:4220 (call en p14:9E35, el
;   indice en A): 9E44, 9E7C, 9E90, 9EAD, A063, A0A0; lo leen p14:9E35 (12
;   bytes)
;   0x9e38..0x9e44  (12 bytes)
DATA_tabla_9E38:
	defw 09e44h,09e7ch,09e90h,09eadh,0a063h,0a0a0h	; 9e38

; ======================================================================
; CODIGO 0x9e44..0x9f1a  (214 bytes)
; ======================================================================


L_9E44:
	ld hl,0de04h		;9e44   ; apunta a la cuenta atras del estado
	dec (hl)			;9e47
	ret nz			;9e48
	ld (hl),040h		;9e49
	ld hl,0ecf0h		;9e4b
	dec (hl)			;9e4e
	jr z,L_9E66		;9e4f
	ld a,(hl)			;9e51
	dec a			;9e52
	add a,a			;9e53
	add a,a			;9e54
	add a,a			;9e55
	add a,a			;9e56
	add a,a			;9e57
	ld h,a			;9e58
	ld l,080h		;9e59
	ld de,04858h		;9e5b
	ld bc,02020h		;9e5e
	ld a,001h		;9e61
	jp 04d66h		;9e63   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
L_9E66:
	ld hl,09f1ah		;9e66
	ld de,0e100h		;9e69   ; apunta a los atributos de sprite (32 fichas de 4 bytes [y][x][dibujo][color])
	ld bc,00008h		;9e6c
	ldir		;9e6f
	call 040dbh		;9e71
	ld a,030h		;9e74
	ld (0de04h),a		;9e76   ; guarda la cuenta atras del estado
	jp L_9FFA		;9e79
L_9E7C:
	ld hl,0de04h		;9e7c   ; apunta a la cuenta atras del estado
	dec (hl)			;9e7f
	ret nz			;9e80
	ld (hl),010h		;9e81
	ld a,008h		;9e83
	ld (0e102h),a		;9e85
	ld a,00ch		;9e88
	ld (0e106h),a		;9e8a
	jp L_9FFA		;9e8d
L_9E90:
	ld a,(0de03h)		;9e90   ; lee el contador de cuadros del juego (sube uno por cuadro)
	and 00fh		;9e93
	ret nz			;9e95
	ld hl,0e100h		;9e96   ; apunta a los atributos de sprite (32 fichas de 4 bytes [y][x][dibujo][color])
	inc (hl)			;9e99
	inc hl			;9e9a
	inc hl			;9e9b
	inc hl			;9e9c
	inc hl			;9e9d
	inc (hl)			;9e9e
	ld hl,0de04h		;9e9f   ; apunta a la cuenta atras del estado
	dec (hl)			;9ea2
	ret nz			;9ea3
	call 05c7dh		;9ea4   ; esconde_atributos: pone las 32 fichas de sprite de 0xE100 fuera de la pantalla
	call 0a1beh		;9ea7
	jp L_9FFA		;9eaa
L_9EAD:
	ld hl,0de04h		;9ead   ; apunta a la cuenta atras del estado
	dec (hl)			;9eb0
	ret nz			;9eb1
	xor a			;9eb2
	ld (hl),a			;9eb3
	ld (0dd86h),a		;9eb4
	call L_9FFA		;9eb7
	ld hl,0dd80h		;9eba
	ld (0dd88h),hl		;9ebd
	call 0a20eh		;9ec0
	ld hl,(0dd88h)		;9ec3
	ld a,(hl)			;9ec6
	call 0ad7dh		;9ec7
	ld de,05040h		;9eca
	call 0a241h		;9ecd
	ld hl,(0dd88h)		;9ed0
	ld a,(hl)			;9ed3
	call 0ad75h		;9ed4
	push hl			;9ed7
	ld de,03078h		;9ed8
	call 0a1cch		;9edb
	pop hl			;9ede
	inc hl			;9edf
	inc hl			;9ee0
	ld de,06078h		;9ee1
	call 0a1cch		;9ee4
	ld hl,0a339h		;9ee7
	call 0a22dh		;9eea
	ld hl,00040h		;9eed
	ld de,008d4h		;9ef0
	ld a,001h		;9ef3
	call 0a171h		;9ef5
	call L_9F03		;9ef8
	ld a,078h		;9efb
	ld (0e370h),a		;9efd
	jp 0a28bh		;9f00
L_9F03:
	ld hl,(0dd88h)		;9f03
	ld a,(hl)			;9f06
	call 0ad75h		;9f07
	push hl			;9f0a
	call 0add0h		;9f0b
	ld e,a			;9f0e
	pop hl			;9f0f
	inc hl			;9f10
	inc hl			;9f11
	call 0add0h		;9f12
	add a,e			;9f15
	ld (0e365h),a		;9f16
	ret			;9f19

; ----------------------------------------------------------------------
; DATOS resto_9F1A: lo apuntan con el banco puesto p14:9E66 (0x9F1A); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p14:9E66 (8 bytes)
;   0x9f1a..0x9f22  (8 bytes)
DATA_resto_9F1A:
	defb 067h,070h,000h,009h,067h,070h,004h,00dh	; 9f1a  gp..gp..

; ======================================================================
; CODIGO 0x9f22..0x9f7f  (93 bytes)
; ======================================================================


L_9F22:
	call L_9F52		;9f22
	call 05c7dh		;9f25   ; esconde_atributos: pone las 32 fichas de sprite de 0xE100 fuera de la pantalla
	call 0a1b3h		;9f28
	ld de,0e100h		;9f2b   ; apunta a los atributos de sprite (32 fichas de 4 bytes [y][x][dibujo][color])
	ld hl,0a38bh		;9f2e
	ld bc,00050h		;9f31
	ldir		;9f34
	call 040dbh		;9f36
	ld hl,0fe00h		;9f39
	ld (0ecf2h),hl		;9f3c
	ld hl,05000h		;9f3f
	ld (0ecf0h),hl		;9f42
	ld a,020h		;9f45
	ld (0de04h),a		;9f47   ; guarda la cuenta atras del estado
	xor a			;9f4a
	ld (0ecefh),a		;9f4b
	ld (0dd8ah),a		;9f4e
	ret			;9f51
L_9F52:
	ld a,(0dd80h)		;9f52
	dec a			;9f55
	ld e,a			;9f56
	ld d,000h		;9f57
	ld hl,0d70ah		;9f59
	add hl,de			;9f5c
	ld a,(hl)			;9f5d
	and 00fh		;9f5e
	ld hl,0a41bh		;9f60
	add a,a			;9f63
	call 04216h		;9f64   ; hl_mas_a: HL = HL + A
	ld d,(hl)			;9f67
	inc hl			;9f68
	ld e,(hl)			;9f69
	push de			;9f6a
	ld a,008h		;9f6b
	call 04bf0h		;9f6d   ; pon_color: el color A de la paleta a D (rojo-azul) y E (verde), por R#16, y su copia en 0xDDC0 + 2 x A
	pop de			;9f70
	ld a,00bh		;9f71
	jp 04bf0h		;9f73   ; pon_color: el color A de la paleta a D (rojo-azul) y E (verde), por R#16, y su copia en 0xDDC0 + 2 x A
L_9F76:
	call 05c73h		;9f76
	ld a,(0ecefh)		;9f79
	call 04220h		;9f7c   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_9F7F: 20 destinos del despachador p00:4220 (call en p14:9F7C, el
;   indice en A): 9FA7, 9FC7, 9FA7, 9FC7, 9FA7, 9FC7, 9FA7, 9FC7, 9FA7, 9FC7,
;   9FA7, 9FC7, 9FA7, 9FFF, A00F, A063, A0A0, A0E5, A0F2, A13D; lo leen
;   p14:9F7C (40 bytes)
;   0x9f7f..0x9fa7  (40 bytes)
DATA_tabla_9F7F:
	defw 09fa7h,09fc7h,09fa7h,09fc7h,09fa7h,09fc7h,09fa7h,09fc7h	; 9f7f
	defw 09fa7h,09fc7h,09fa7h,09fc7h,09fa7h,09fffh,0a00fh,0a063h	; 9f8f
	defw 0a0a0h,0a0e5h,0a0f2h,0a13dh	; 9f9f

; ======================================================================
; CODIGO 0x9fa7..0x9fff  (88 bytes)
; ======================================================================


L_9FA7:
	ld hl,0de04h		;9fa7   ; apunta a la cuenta atras del estado
	dec (hl)			;9faa
	ret nz			;9fab
	ld hl,0a3dbh		;9fac
	ld de,0e100h		;9faf   ; apunta a los atributos de sprite (32 fichas de 4 bytes [y][x][dibujo][color])
	ld bc,00040h		;9fb2
	ldir		;9fb5
	ld de,04048h		;9fb7
	ld hl,00080h		;9fba
	ld bc,08018h		;9fbd
	ld a,001h		;9fc0
	call 04d66h		;9fc2   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
	jr L_9FFA		;9fc5
L_9FC7:
	call 0a26bh		;9fc7
	ld a,(0e140h)		;9fca
	cp 060h		;9fcd
	ret c			;9fcf
	ld hl,0a38bh		;9fd0
	ld de,0e100h		;9fd3   ; apunta a los atributos de sprite (32 fichas de 4 bytes [y][x][dibujo][color])
	ld bc,00040h		;9fd6
	ldir		;9fd9
	ld de,04048h		;9fdb
	ld hl,08080h		;9fde
	ld bc,08018h		;9fe1
	ld a,001h		;9fe4
	call 04d66h		;9fe6   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
	ld hl,0fe00h		;9fe9
	ld (0ecf2h),hl		;9fec
	ld hl,05000h		;9fef
	ld (0ecf0h),hl		;9ff2
	ld a,020h		;9ff5
	ld (0de04h),a		;9ff7   ; guarda la cuenta atras del estado
L_9FFA:
	ld hl,0ecefh		;9ffa
	inc (hl)			;9ffd
	ret			;9ffe

; ----------------------------------------------------------------------
; DATOS partida_9FFF: los 1 primeros bytes de una instruccion de 3 (CD 6B A2)
;   que sigue en el banco 15: el trazador de un solo banco no puede verla
;   entera (tools/bancos.py); lo leen p14:9FFF (1 bytes)
;   0x9fff..0xa000  (1 bytes)
L_9FFF:
	defb 0cdh	; 9fff
