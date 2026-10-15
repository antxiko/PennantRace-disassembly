; ==========================================================================
; THE PRO YAKYUU GEKITOTSU PENNANT RACE - Konami (1988) - MSX2 - MegaROM RC-757 de 128 KB (Konami SCC) - banco 02 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; DATOS partida_8000: los 2 ultimos bytes de la instruccion de p01:7FFF (CA BE
;   7B), que empieza en el banco 1; lo leen p01:7FFF (2 bytes)
;   0x8000..0x8002  (2 bytes)
DATA_partida_8000:
	defb 0beh,07bh	; 8000

; ======================================================================
; CODIGO 0x8002..0x81b8  (438 bytes)
; ======================================================================


L_8002:
	ld a,(0ed0ah)		;8002
	cp 002h		;8005
	jr z,L_801A		;8007
	or 010h		;8009
	ld (0e19fh),a		;800b
	ret			;800e
L_800F:
	ld a,(0e1d0h)		;800f
	or a			;8012
	jr nz,L_801A		;8013
	ld a,(0e33ch)		;8015
	or a			;8018
	ret z			;8019
L_801A:
	xor a			;801a
	ld (0ed0ah),a		;801b
	jp 07f56h		;801e
L_8021:
	ld a,(0e220h)		;8021
	dec a			;8024
	jr nz,L_800F		;8025
	ld hl,0ed00h		;8027
	dec (hl)			;802a
	ret nz			;802b
	ld a,(0ed0ah)		;802c
	or 010h		;802f
	ld (0e19fh),a		;8031
	ret			;8034
L_8035:
	call 07bbeh		;8035
	ld a,(0e220h)		;8038
	cp 007h		;803b
	ret c			;803d
	cp 007h		;803e
	jr z,L_804C		;8040
	cp 008h		;8042
	jr nz,L_8063		;8044
L_8046:
	ld a,001h		;8046
	ld (0ed6eh),a		;8048
	ret			;804b
L_804C:
	ld a,(0ed6eh)		;804c
	cp 008h		;804f
	jr z,L_8046		;8051
	cp 002h		;8053
	ret nz			;8055
	ld a,(0e1a6h)		;8056
	or a			;8059
	jr z,L_805D		;805a
	ret			;805c
L_805D:
	ld a,004h		;805d
	ld (0ed6eh),a		;805f
	ret			;8062
L_8063:
	ld a,(0ed6eh)		;8063
	cp 004h		;8066
	jr z,L_8046		;8068
	cp 002h		;806a
	ret nz			;806c
	ld a,(0e1a6h)		;806d
	cp 002h		;8070
	jr z,L_8075		;8072
	ret			;8074
L_8075:
	ld a,008h		;8075
	ld (0ed6eh),a		;8077
	ret			;807a
L_807B:
	ld ix,(0ed0bh)		;807b
	jr L_808A		;807f
L_8081:
	ld e,a			;8081
	ld d,000h		;8082
	ld ix,0e271h		;8084
	add ix,de		;8088
L_808A:
	ld hl,(0e218h)		;808a
	ld c,(ix+007h)		;808d
	ld b,(ix+008h)		;8090
	call L_80B1		;8093
	ex de,hl			;8096
	ld hl,(0e213h)		;8097
	ld c,(ix+002h)		;809a
	ld b,(ix+003h)		;809d
	call L_80B1		;80a0
	ld b,h			;80a3
	ld c,l			;80a4
	or a			;80a5
	sbc hl,de		;80a6
	rl h		;80a8
	jr nc,L_80AE		;80aa
	ex de,hl			;80ac
	ret			;80ad
L_80AE:
	ld h,b			;80ae
	ld l,c			;80af
	ret			;80b0
L_80B1:
	or a			;80b1
	sbc hl,bc		;80b2
	ld a,h			;80b4
	rla			;80b5
	jp c,05f71h		;80b6
	ret			;80b9
L_80BA:
	ld a,(0ed40h)		;80ba
	cp 0ffh		;80bd
	jr z,L_80D6		;80bf
	ld (0e22bh),a		;80c1
	cp 070h		;80c4
	ret z			;80c6
	ld hl,(0ece7h)		;80c7
	ld de,(0ece9h)		;80ca
	call L_81F8		;80ce
	ld a,(0ed43h)		;80d1
	or a			;80d4
	ret z			;80d5
L_80D6:
	ld a,(0ed41h)		;80d6
	ld (0e22bh),a		;80d9
	ld hl,(0ece7h)		;80dc
	ld de,(0ece9h)		;80df
	call L_832B		;80e3
	ld a,(0ecffh)		;80e6
	or a			;80e9
	ret z			;80ea
	ld a,(0ed42h)		;80eb
	ld (0e22bh),a		;80ee
	ret			;80f1
L_80F2:
	ld de,(0e215h)		;80f2
	ld hl,(0e21ah)		;80f6
	bit 7,d		;80f9
	call nz,05f79h		;80fb
	bit 7,h		;80fe
	jr nz,L_810A		;8100
	add hl,hl			;8102
	call 00020h		;8103   ; BIOS DCOMPR - Compares HL with DE
	jr c,L_8130		;8106
	jr L_812B		;8108
L_810A:
	call 05f71h		;810a
	add hl,hl			;810d
	call 00020h		;810e   ; BIOS DCOMPR - Compares HL with DE
	jr c,L_8130		;8111
	jr L_8140		;8113
L_8115:
	ld de,(0e213h)		;8115
	ld hl,(0e218h)		;8119
	ld a,h			;811c
	or a			;811d
	jr z,L_8136		;811e
	dec a			;8120
	jr z,L_8146		;8121
L_8123:
	add hl,hl			;8123
	add hl,de			;8124
	ld de,0fc08h		;8125
	add hl,de			;8128
	jr nc,L_8130		;8129
L_812B:
	xor a			;812b
	ld (0ed42h),a		;812c
	ret			;812f
L_8130:
	ld a,010h		;8130
	ld (0ed42h),a		;8132
	ret			;8135
L_8136:
	add hl,hl			;8136
	ld bc,000e8h		;8137
	add hl,bc			;813a
	call 00020h		;813b   ; BIOS DCOMPR - Compares HL with DE
	jr c,L_8130		;813e
L_8140:
	ld a,020h		;8140
	ld (0ed42h),a		;8142
	ret			;8145
L_8146:
	ld a,l			;8146
	cp 038h		;8147
	jr c,L_8136		;8149
	jr L_8123		;814b
L_814D:
	ld a,(0ed9dh)		;814d
	cp 007h		;8150
	jr nc,L_8186		;8152
	cp 005h		;8154
	jr nc,L_8199		;8156
	call L_81BC		;8158
	ld a,c			;815b
	cp 001h		;815c
	jr z,L_8169		;815e
	cp 004h		;8160
	jr z,L_8169		;8162
	call L_81AA		;8164
	jr L_8173		;8167
L_8169:
	ld b,0ffh		;8169
	ld a,(0ed9dh)		;816b
	cp c			;816e
	jr z,L_8173		;816f
	ld b,080h		;8171
L_8173:
	ld a,b			;8173
	ld (0ed40h),a		;8174
	ld a,(0ed9dh)		;8177
	dec a			;817a
	ld hl,081b8h		;817b
	call 04216h		;817e
	ld a,(hl)			;8181
	ld (0ed41h),a		;8182
	ret			;8185
L_8186:
	ld a,070h		;8186
	ld (0ed40h),a		;8188
	ld a,(0e21bh)		;818b
	rla			;818e
	ld a,060h		;818f
	jr nc,L_8195		;8191
	ld a,040h		;8193
L_8195:
	ld (0ed41h),a		;8195
	ret			;8198
L_8199:
	cp 005h		;8199
	ld a,060h		;819b
	jr z,L_81A1		;819d
	ld a,040h		;819f
L_81A1:
	ld (0ed41h),a		;81a1
	ld a,080h		;81a4
	ld (0ed40h),a		;81a6
	ret			;81a9
L_81AA:
	ld b,080h		;81aa
	ld a,(0ed9dh)		;81ac
	cp 002h		;81af
	ret z			;81b1
	cp 003h		;81b2
	ret z			;81b4
	ld b,0ffh		;81b5
	ret			;81b7

; ----------------------------------------------------------------------
; DATOS sin identificar  0x81b8..0x81bc  (4 bytes)
DATA_81B8:
	defb 060h,050h,030h,040h	; 81b8

; ======================================================================
; CODIGO 0x81bc..0x8669  (1197 bytes)
; ======================================================================


L_81BC:
	ld bc,00400h		;81bc
	ld de,00010h		;81bf
	ld hl,0eca3h		;81c2
L_81C5:
	call L_81CC		;81c5
	add hl,de			;81c8
	djnz L_81C5		;81c9
	ret			;81cb
L_81CC:
	ld a,(hl)			;81cc
	and 00fh		;81cd
	cp 002h		;81cf
	jr nz,L_81D5		;81d1
	set 0,c		;81d3
L_81D5:
	cp 003h		;81d5
	jr nz,L_81DB		;81d7
	set 1,c		;81d9
L_81DB:
	cp 004h		;81db
	ret nz			;81dd
	set 2,c		;81de
	ret			;81e0
L_81E1:
	ld a,070h		;81e1
	ld (0ed40h),a		;81e3
	ld a,(0e2eeh)		;81e6
	or a			;81e9
	ret z			;81ea
	ld a,080h		;81eb
	ld (0ed40h),a		;81ed
	ret			;81f0
L_81F1:
	ld hl,(0e213h)		;81f1
	ld de,(0e218h)		;81f4
L_81F8:
	ld a,d			;81f8
	or a			;81f9
	jr z,L_8212		;81fa
	dec a			;81fc
	jr z,L_821E		;81fd
L_81FF:
	ex de,hl			;81ff
	ld bc,00018h		;8200
	add hl,bc			;8203
	ex de,hl			;8204
	or a			;8205
	sbc hl,de		;8206
	rl h		;8208
	jr nc,L_8219		;820a
L_820C:
	ld a,001h		;820c
	ld (0ed43h),a		;820e
	ret			;8211
L_8212:
	add hl,de			;8212
	ld de,0fd90h		;8213
	add hl,de			;8216
	jr nc,L_820C		;8217
L_8219:
	xor a			;8219
	ld (0ed43h),a		;821a
	ret			;821d
L_821E:
	ld a,e			;821e
	cp 038h		;821f
	jr nc,L_81FF		;8221
	jr L_8212		;8223
L_8225:
	call L_823B		;8225
	ld (0ed6eh),a		;8228
	ret			;822b
L_822C:
	dec c			;822c
	ld a,008h		;822d
	ret z			;822f
	dec c			;8230
	ld a,001h		;8231
	ret z			;8233
	dec c			;8234
	ld a,004h		;8235
	ret z			;8237
	ld a,002h		;8238
	ret			;823a
L_823B:
	call L_824A		;823b
	ld a,c			;823e
	or a			;823f
	jr nz,L_822C		;8240
	ld a,001h		;8242
	ld (0edd5h),a		;8244
	jp L_8278		;8247
L_824A:
	ld ix,0e231h		;824a
	ld iy,0ec98h		;824e
	ld bc,00400h		;8252
	ld de,00010h		;8255
L_8258:
	ld a,(ix+00bh)		;8258
	and 00fh		;825b
	jr z,L_8271		;825d
	bit 6,(ix+00dh)		;825f
	jr nz,L_8271		;8263
	ld a,(iy+00bh)		;8265
	and 00fh		;8268
	jr z,L_8271		;826a
	dec a			;826c
	cp c			;826d
	jr c,L_8271		;826e
	ld c,a			;8270
L_8271:
	add ix,de		;8271
	add iy,de		;8273
	djnz L_8258		;8275
	ret			;8277
L_8278:
	call L_82A7		;8278
	ld a,(0e19ah)		;827b
	cp 002h		;827e
	jr nc,L_8293		;8280
	ld a,(0edc8h)		;8282
	cp 004h		;8285
	jr nz,L_8293		;8287
	ld ix,(0edcch)		;8289
	bit 7,(ix+00bh)		;828d
	jr z,L_829F		;8291
L_8293:
	ld a,(0edc9h)		;8293
	or a			;8296
	jr nz,L_829F		;8297
	ld a,(0edc8h)		;8299
	or a			;829c
	jr z,L_82A3		;829d
L_829F:
	ld c,a			;829f
	call L_822C		;82a0
L_82A3:
	ld (0ed6eh),a		;82a3
	ret			;82a6
L_82A7:
	ld hl,00000h		;82a7
	ld (0ed0bh),hl		;82aa
	ld (0edcch),hl		;82ad
	ld hl,0edc7h		;82b0
	xor a			;82b3
	ld (hl),a			;82b4
	inc hl			;82b5
	ld (hl),a			;82b6
	inc hl			;82b7
	ld (hl),a			;82b8
	inc hl			;82b9
	ld (hl),0ffh		;82ba
	ld ix,0e231h		;82bc
	ld b,004h		;82c0
	ld de,00010h		;82c2
L_82C5:
	ld a,(ix+00bh)		;82c5
	and 00fh		;82c8
	jr z,L_82D0		;82ca
	ld c,a			;82cc
	call L_82D5		;82cd
L_82D0:
	add ix,de		;82d0
	djnz L_82C5		;82d2
	ret			;82d4
L_82D5:
	ld hl,0edc7h		;82d5
	call L_8300		;82d8
	inc hl			;82db
	bit 6,(ix+00bh)		;82dc
	call z,L_82F7		;82e0
	inc hl			;82e3
	ld a,(ix+00dh)		;82e4
	bit 5,a		;82e7
	call nz,L_82F2		;82e9
	inc hl			;82ec
	ld a,(hl)			;82ed
	cp c			;82ee
	ret c			;82ef
	ld (hl),c			;82f0
	ret			;82f1
L_82F2:
	ld a,(hl)			;82f2
	cp c			;82f3
	ret nc			;82f4
	ld (hl),c			;82f5
	ret			;82f6
L_82F7:
	ld a,(hl)			;82f7
	cp c			;82f8
	ret nc			;82f9
	ld (hl),c			;82fa
	ld (0edcch),ix		;82fb
	ret			;82ff
L_8300:
	ld a,(hl)			;8300
	cp c			;8301
	ret nc			;8302
	ld (hl),c			;8303
	ld (0ed0bh),ix		;8304
	ret			;8308
L_8309:
	ld a,(0edc8h)		;8309
	inc a			;830c
	jr L_8312		;830d
L_830F:
	ld a,(0edc8h)		;830f
L_8312:
	or 040h		;8312
	ld c,a			;8314
	jp 0b06eh		;8315
L_8318:
	call L_82A7		;8318
	ld a,(0edc8h)		;831b
	ld c,a			;831e
	or a			;831f
	call nz,L_822C		;8320
	ret			;8323
L_8324:
	ld hl,(0e213h)		;8324
	ld de,(0e218h)		;8327
L_832B:
	ld a,d			;832b
	or a			;832c
	jr z,L_8347		;832d
	dec a			;832f
	jr z,L_8357		;8330
L_8332:
	ex de,hl			;8332
	srl h		;8333
	rr l		;8335
	ld bc,0003ch		;8337
	add hl,bc			;833a
	ex de,hl			;833b
	call 00020h		;833c   ; BIOS DCOMPR - Compares HL with DE
	jr nc,L_8352		;833f
L_8341:
	ld a,001h		;8341
	ld (0ecffh),a		;8343
	ret			;8346
L_8347:
	srl d		;8347
	rr e		;8349
	add hl,de			;834b
	ld de,0fe8ch		;834c
	add hl,de			;834f
	jr nc,L_8341		;8350
L_8352:
	xor a			;8352
	ld (0ecffh),a		;8353
	ret			;8356
L_8357:
	ld a,e			;8357
	cp 038h		;8358
	jr nc,L_8332		;835a
	jr L_8347		;835c
L_835E:
	ld hl,(0e213h)		;835e
	ld de,(0e218h)		;8361
	ld a,d			;8365
	or a			;8366
	jr z,L_837A		;8367
	dec a			;8369
	jr z,L_8385		;836a
L_836C:
	ld bc,0000ch		;836c
	add hl,bc			;836f
	srl d		;8370
	rr e		;8372
	or a			;8374
	sbc hl,de		;8375
	rl h		;8377
	ret			;8379
L_837A:
	srl d		;837a
	rr e		;837c
	add hl,de			;837e
	ld de,0fed4h		;837f
	add hl,de			;8382
	ccf			;8383
	ret			;8384
L_8385:
	ld a,e			;8385
	cp 038h		;8386
	jr nc,L_836C		;8388
	jr L_837A		;838a
L_838C:
	xor a			;838c
	ld (0ed73h),a		;838d
	call L_83B7		;8390
	ld a,b			;8393
	or a			;8394
	ret z			;8395
	dec a			;8396
	jr z,L_83A8		;8397
	ld de,0ed5ah		;8399
	ld b,001h		;839c
	call L_84B0		;839e
	ret c			;83a1
	ld a,021h		;83a2
	ld (0ed85h),a		;83a4
	ret			;83a7
L_83A8:
	ld de,0ed58h		;83a8
	ld b,001h		;83ab
	call L_84B0		;83ad
	ret c			;83b0
	ld a,011h		;83b1
	ld (0ed84h),a		;83b3
	ret			;83b6
L_83B7:
	ld b,000h		;83b7
	ld a,(0de02h)		;83b9
	bit 5,a		;83bc
	ret nz			;83be
	bit 4,a		;83bf
	jr nz,L_83C9		;83c1
	bit 3,a		;83c3
	jr nz,L_83DE		;83c5
	jr L_83CF		;83c7
L_83C9:
	ld a,(0d6dch)		;83c9
	rra			;83cc
	jr c,L_83D7		;83cd
L_83CF:
	ld a,(0e19bh)		;83cf
	rra			;83d2
	ret c			;83d3
	ld b,002h		;83d4
	ret			;83d6
L_83D7:
	ld a,(0e19bh)		;83d7
	rra			;83da
	ret nc			;83db
	inc b			;83dc
	ret			;83dd
L_83DE:
	inc b			;83de
	ld a,(0e19bh)		;83df
	rra			;83e2
	ret c			;83e3
	inc b			;83e4
	ret			;83e5
L_83E6:
	xor a			;83e6
	ld (0eda0h),a		;83e7
	ld (0ed73h),a		;83ea
	call L_88DF		;83ed
	call L_8405		;83f0
	ld a,(0ed73h)		;83f3
	or a			;83f6
	ret z			;83f7
	ld a,(0e19bh)		;83f8
	rra			;83fb
	ld a,001h		;83fc
	jr nc,L_8401		;83fe
	inc a			;8400
L_8401:
	ld (0eda0h),a		;8401
	ret			;8404
L_8405:
	ld a,(0de02h)		;8405
	bit 5,a		;8408
	ret nz			;840a
	bit 4,a		;840b
	jr nz,L_8415		;840d
	bit 3,a		;840f
	jr nz,L_8429		;8411
	jr L_841B		;8413
L_8415:
	ld a,(0d6dch)		;8415
	rra			;8418
	jr c,L_8422		;8419
L_841B:
	ld a,(0e19bh)		;841b
	rra			;841e
	ret nc			;841f
	jr L_844C		;8420
L_8422:
	ld a,(0e19bh)		;8422
	rra			;8425
	ret c			;8426
	jr L_842F		;8427
L_8429:
	ld a,(0e19bh)		;8429
	rra			;842c
	jr c,L_844C		;842d
L_842F:
	ld a,(0ed44h)		;842f
	cp 00dh		;8432
	ret c			;8434
	ld de,0ed58h		;8435
L_8438:
	ld b,000h		;8438
	push de			;843a
	call L_84B0		;843b
	pop de			;843e
	ret c			;843f
	ld a,001h		;8440
	ld (0ed73h),a		;8442
	ld a,009h		;8445
	ld (0ed76h),a		;8447
	jr L_8487		;844a
L_844C:
	ld a,(0ed45h)		;844c
	cp 00dh		;844f
	ret c			;8451
	ld de,0ed5ah		;8452
	call L_8438		;8455
	ld hl,0ed73h		;8458
	ld a,(hl)			;845b
	or a			;845c
	ret z			;845d
	ld (hl),002h		;845e
	ret			;8460
L_8461:
	call L_83B7		;8461
	ld a,b			;8464
	or a			;8465
	ret z			;8466
	dec a			;8467
	jr z,L_8478		;8468
	ld a,(0ed85h)		;846a
	or a			;846d
	ret z			;846e
	ld a,002h		;846f
	ld (0ed73h),a		;8471
	call L_8482		;8474
	ret			;8477
L_8478:
	ld a,(0ed84h)		;8478
	or a			;847b
	ret z			;847c
	ld a,001h		;847d
	ld (0ed73h),a		;847f
L_8482:
	ld a,00dh		;8482
	ld (0ed76h),a		;8484
L_8487:
	xor a			;8487
	ld (0ed03h),a		;8488
	ld (0ed81h),a		;848b
	ld (0e19ch),a		;848e
	ld (0e19eh),a		;8491
	ret			;8494
L_8495:
	ld a,b			;8495
	or a			;8496
	ld a,(0e19bh)		;8497
	jr z,L_849D		;849a
	cpl			;849c
L_849D:
	rra			;849d
	ld a,(0e194h)		;849e
	ld b,a			;84a1
	ld a,(0e196h)		;84a2
	ld c,a			;84a5
	jr c,L_84AC		;84a6
	sub b			;84a8
	ld b,c			;84a9
	ld c,a			;84aa
	ret			;84ab
L_84AC:
	ld a,b			;84ac
	sub c			;84ad
	ld c,a			;84ae
	ret			;84af
L_84B0:
	ld a,(de)			;84b0
	cp 010h		;84b1
	ccf			;84b3
	ret c			;84b4
	cp 00dh		;84b5
	jr nz,L_84D0		;84b7
	call L_8495		;84b9
	ld a,b			;84bc
	cp 004h		;84bd
	ret nc			;84bf
	ld a,(0e19bh)		;84c0
	srl a		;84c3
	cp 006h		;84c5
	ret c			;84c7
	ld a,c			;84c8
	rla			;84c9
	ret nc			;84ca
	inc de			;84cb
	ld a,(de)			;84cc
	cp 030h		;84cd
	ret			;84cf
L_84D0:
	inc de			;84d0
	ld a,(de)			;84d1
	cp 010h		;84d2
	ret			;84d4
L_84D5:
	ld a,(0ed73h)		;84d5
	or a			;84d8
	ret z			;84d9
	ld b,a			;84da
	djnz L_84E2		;84db
	call L_84EF		;84dd
	jr L_84E5		;84e0
L_84E2:
	call L_8515		;84e2
L_84E5:
	ld a,(0e1d1h)		;84e5
	or a			;84e8
	ret z			;84e9
	xor a			;84ea
	ld (0ed73h),a		;84eb
	ret			;84ee
L_84EF:
	ld hl,0e340h		;84ef
	ld a,(0e19ch)		;84f2
	ld (hl),a			;84f5
	inc hl			;84f6
	ld a,(0e30bh)		;84f7
	ld (hl),a			;84fa
	inc hl			;84fb
	ld a,(0e30dh)		;84fc
	ld (hl),a			;84ff
	ld hl,0ec50h		;8500
	call L_853B		;8503
	ld a,(0e340h)		;8506
	ld (0e19ch),a		;8509
	cp 010h		;850c
	ret nz			;850e
	ld a,001h		;850f
	ld (0e1d1h),a		;8511
	ret			;8514
L_8515:
	ld hl,0e340h		;8515
	ld a,(0e19eh)		;8518
	ld (hl),a			;851b
	inc hl			;851c
	ld a,(0e30ch)		;851d
	ld (hl),a			;8520
	inc hl			;8521
	ld a,(0e30eh)		;8522
	ld (hl),a			;8525
	ld hl,0ec62h		;8526
	call L_853B		;8529
	ld a,(0e340h)		;852c
	ld (0e19eh),a		;852f
	cp 010h		;8532
	ret nz			;8534
	ld a,001h		;8535
	ld (0e1d1h),a		;8537
	ret			;853a
L_853B:
	xor a			;853b
	ld (0e340h),a		;853c
	ld a,(0ed03h)		;853f
	ld b,a			;8542
	djnz L_854C		;8543
L_8545:
	ld hl,0ed7fh		;8545
	dec (hl)			;8548
	ret nz			;8549
	jr L_85A3		;854a
L_854C:
	djnz L_8576		;854c
	ld a,(0e304h)		;854e
	dec a			;8551
	ld a,0c0h		;8552
	jr nz,L_85A3		;8554
	ld a,(0e341h)		;8556
	call 04216h		;8559
	ld a,(0ed76h)		;855c
	ld b,a			;855f
	ld a,(hl)			;8560
	cp b			;8561
	jr nc,L_8570		;8562
	ld a,(0de03h)		;8564
	and 00fh		;8567
	ret nz			;8569
	ld a,002h		;856a
	ld (0e340h),a		;856c
	ret			;856f
L_8570:
	ld a,020h		;8570
	ld (0e340h),a		;8572
	ret			;8575
L_8576:
	djnz L_857A		;8576
	jr L_8545		;8578
L_857A:
	djnz L_8582		;857a
	ld a,010h		;857c
	ld (0e340h),a		;857e
	ret			;8581
L_8582:
	ld a,(0e342h)		;8582
	cp 008h		;8585
	jr z,L_8595		;8587
	ld a,(0de03h)		;8589
	and 00fh		;858c
	ret nz			;858e
	ld a,002h		;858f
	ld (0e340h),a		;8591
	ret			;8594
L_8595:
	ld a,(0e304h)		;8595
	or a			;8598
	ld a,010h		;8599
	jr nz,L_85A3		;859b
	ld a,020h		;859d
	ld (0e340h),a		;859f
	ret			;85a2
L_85A3:
	ld (0ed7fh),a		;85a3
	ld hl,0ed03h		;85a6
	inc (hl)			;85a9
	ret			;85aa
L_85AB:
	ld a,(0de02h)		;85ab
	bit 5,a		;85ae
	ret nz			;85b0
	bit 3,a		;85b1
	jr nz,L_85C1		;85b3
	bit 4,a		;85b5
	jr z,L_85E5		;85b7
	ld a,(0d6dch)		;85b9
	rra			;85bc
	jr nc,L_85E5		;85bd
	jr L_85D9		;85bf
L_85C1:
	xor a			;85c1
	ld (0e19ch),a		;85c2
	ld (0e19eh),a		;85c5
	call L_85F1		;85c8
	ld a,(0ed81h)		;85cb
	or a			;85ce
	ret nz			;85cf
	ld a,010h		;85d0
	ld (0e19ch),a		;85d2
	ld (0e19eh),a		;85d5
	ret			;85d8
L_85D9:
	ld a,(0e19eh)		;85d9
	push af			;85dc
	call L_85C1		;85dd
	pop af			;85e0
	ld (0e19eh),a		;85e1
	ret			;85e4
L_85E5:
	ld a,(0e19ch)		;85e5
	push af			;85e8
	call L_85C1		;85e9
	pop af			;85ec
	ld (0e19ch),a		;85ed
	ret			;85f0
L_85F1:
	ld a,(0ed81h)		;85f1
	ld b,a			;85f4
	djnz L_8601		;85f5
	ld hl,0ed80h		;85f7
	dec (hl)			;85fa
	ret nz			;85fb
	xor a			;85fc
	ld (0ed81h),a		;85fd
	ret			;8600
L_8601:
	ld a,060h		;8601
	ld (0ed80h),a		;8603
	ld a,001h		;8606
	ld (0ed81h),a		;8608
	ret			;860b
L_860C:
	ld a,(0e337h)		;860c
	or a			;860f
	ret z			;8610
	ld c,043h		;8611
	call 0b06eh		;8613
	ret nc			;8616
	ld c,042h		;8617
	call 0b06eh		;8619
	ret c			;861c
	ld e,(ix+009h)		;861d
	ld d,(ix+00ah)		;8620
	ld hl,000f0h		;8623
	add hl,de			;8626
	ret c			;8627
	ld a,r		;8628
	and 007h		;862a
	ld a,0ffh		;862c
	jr nz,L_8632		;862e
	ld a,021h		;8630
L_8632:
	ld (0ed79h),a		;8632
	ret			;8635
L_8636:
	ld a,(0ed2eh)		;8636
	or a			;8639
	jr nz,L_864E		;863a
	call L_86D8		;863c
	ld a,(0e338h)		;863f
	cp 003h		;8642
	ret nc			;8644
	call L_8940		;8645
L_8648:
	call L_8663		;8648
	jp 0583bh		;864b
L_864E:
	call L_87FC		;864e
	ld a,(0ed2eh)		;8651
	dec a			;8654
	jr z,L_8648		;8655
	ld hl,0e201h		;8657
	inc (hl)			;865a
	ld a,(hl)			;865b
	cp 014h		;865c
	jp nc,L_87E4		;865e
	jr L_8648		;8661
L_8663:
	ld a,(0e1f1h)		;8663
	call 04220h		;8666

; ----------------------------------------------------------------------
; DATOS tabla_8669: 4 destinos del despachador p00:4220 (call en p02:8666, el
;   indice en A): 8671, 867C, 86B4, 86C8; lo leen p02:8666 (8 bytes)
;   0x8669..0x8671  (8 bytes)
DATA_tabla_8669:
	defw 08671h,0867ch,086b4h,086c8h	; 8669  -> L_8671 L_867C L_86B4 L_86C8

; ======================================================================
; CODIGO 0x8671..0x876d  (252 bytes)
; ======================================================================


L_8671:
	ld a,(0e19dh)		;8671
	ld (0ec76h),a		;8674
	and 010h		;8677
	ret z			;8679
	jr L_86AF		;867a
L_867C:
	ld a,(0e1f3h)		;867c
	cp 003h		;867f
	jr c,L_8689		;8681
	ld a,(0e19dh)		;8683
	ld (0ec76h),a		;8686
L_8689:
	ld a,(0e19dh)		;8689
	and 010h		;868c
	jr nz,L_8696		;868e
	ld hl,0e1f7h		;8690
	ld (hl),001h		;8693
	ret			;8695
L_8696:
	ld hl,0e1fah		;8696
	dec (hl)			;8699
	ld hl,0e1f2h		;869a
	dec (hl)			;869d
	ret nz			;869e
	ld (hl),002h		;869f
	inc hl			;86a1
	dec (hl)			;86a2
	ret nz			;86a3
	ld a,(0e1f7h)		;86a4
	or a			;86a7
	jr nz,L_86AF		;86a8
	ld a,009h		;86aa
	call 057ffh		;86ac
L_86AF:
	ld hl,0e1f1h		;86af
	inc (hl)			;86b2
	ret			;86b3
L_86B4:
	ld a,(0ed2eh)		;86b4
	cp 002h		;86b7
	ret z			;86b9
	ld a,(0e19dh)		;86ba
	and 010h		;86bd
	ret nz			;86bf
	ld hl,00001h		;86c0
	ld (0e1f2h),hl		;86c3
	jr L_86AF		;86c6
L_86C8:
	ld hl,0e1f2h		;86c8
	dec (hl)			;86cb
	ret nz			;86cc
	ld (hl),003h		;86cd
	inc hl			;86cf
	inc (hl)			;86d0
	ld a,(hl)			;86d1
	cp 004h		;86d2
	ret nz			;86d4
	jp L_887F		;86d5
L_86D8:
	ld a,(0e338h)		;86d8
	cp 003h		;86db
	ret nc			;86dd
	ld a,(0e1d1h)		;86de
	cp 003h		;86e1
	ret nz			;86e3
	ld a,(0e1fah)		;86e4
	or a			;86e7
	ret z			;86e8
	cp 007h		;86e9
	ret nc			;86eb
	call L_896E		;86ec
	ld a,(0ece0h)		;86ef
	or a			;86f2
	ret z			;86f3
	call 05a35h		;86f4
	ld a,(0e1f7h)		;86f7
	or a			;86fa
	jr z,L_870C		;86fb
	ld hl,04001h		;86fd
	ld a,(0e19dh)		;8700
	and 010h		;8703
	jr nz,L_870C		;8705
	ld a,001h		;8707
	ld (0ed7ch),a		;8709
L_870C:
	call L_87CD		;870c
	ld a,l			;870f
	ld (0e227h),a		;8710
	or a			;8713
	ld a,r		;8714
	jr nz,L_871A		;8716
	and 03fh		;8718
L_871A:
	ld (0e226h),a		;871a
	ld d,h			;871d
	call L_8817		;871e
	call L_87AF		;8721
	ld (0e215h),de		;8724
	ld (0e21ah),hl		;8728
	ld (0e1dah),hl		;872b
	call L_8788		;872e
	ld a,(0ed2eh)		;8731
	dec a			;8734
	ret z			;8735
	ld a,002h		;8736
	ld (0ed2eh),a		;8738
	ld de,(0e215h)		;873b
	sra d		;873f
	rr e		;8741
	ld (0e1d6h),de		;8743
	ld c,009h		;8747
	ld a,(0e1f6h)		;8749
	cp 005h		;874c
	jr z,L_8758		;874e
	ld c,012h		;8750
	cp 006h		;8752
	jr z,L_8758		;8754
	ld c,000h		;8756
L_8758:
	ld a,(0e227h)		;8758
	cp 009h		;875b
	jr c,L_8761		;875d
	ld a,008h		;875f
L_8761:
	add a,c			;8761
	ld hl,0876dh		;8762
	call 04216h		;8765
	ld a,(hl)			;8768
	ld (0ed49h),a		;8769
	ret			;876c

; ----------------------------------------------------------------------
; DATOS sin identificar  0x876d..0x8788  (27 bytes)
DATA_876D:
	defb 0ffh,0ffh,000h,001h,001h,002h,003h,004h,005h,0feh,0ffh,000h,000h,000h,001h,002h	; 876d  ................
	defb 003h,004h,000h,000h,000h,001h,001h,002h,003h,004h,005h	; 877d  ...........

; ======================================================================
; CODIGO 0x8788..0x8845  (189 bytes)
; ======================================================================


L_8788:
	ld a,(0e227h)		;8788
	cp 004h		;878b
	ret nc			;878d
	ld hl,(0e215h)		;878e
	bit 7,h		;8791
	ret nz			;8793
	ld de,(0e21ah)		;8794
	bit 7,d		;8798
	call nz,05f79h		;879a
	xor a			;879d
	sbc hl,de		;879e
	rl h		;87a0
	ret c			;87a2
	ld (0ed49h),a		;87a3
	inc a			;87a6
	ld (0ed2eh),a		;87a7
	ld a,029h		;87aa
	jp 057ffh		;87ac
L_87AF:
	ld a,(0e1eeh)		;87af
	ld b,a			;87b2
	ld a,018h		;87b3
	sub b			;87b5
	jr nc,L_87B9		;87b6
	xor a			;87b8
L_87B9:
	ld b,a			;87b9
	ld a,r		;87ba
	cp b			;87bc
	jp nc,05f79h		;87bd
	sra d		;87c0
	rr e		;87c2
	sra h		;87c4
	rr l		;87c6
	ld a,029h		;87c8
	jp 057ffh		;87ca
L_87CD:
	call L_87D4		;87cd
	ld a,b			;87d0
	jp 057ffh		;87d1
L_87D4:
	ld a,(0e1f7h)		;87d4
	or a			;87d7
	ld b,008h		;87d8
	ret nz			;87da
	ld a,h			;87db
	cp 080h		;87dc
	ld b,02bh		;87de
	ret nc			;87e0
	ld b,02ah		;87e1
	ret			;87e3
L_87E4:
	ld a,002h		;87e4
	ld (0e1a1h),a		;87e6
	xor a			;87e9
	ld (0ecebh),a		;87ea
	ld (0ed0ah),a		;87ed
	jp L_90B2		;87f0
L_87F3:
	ld a,(0e1d5h)		;87f3
	cp 0ach		;87f6
	ret nc			;87f8
	jp 0a75bh		;87f9
L_87FC:
	call L_87F3		;87fc
	ld hl,0ed49h		;87ff
	ld b,(hl)			;8802
	ld a,(0e1dfh)		;8803
	add a,b			;8806
	ld (0e1dfh),a		;8807
	cp 080h		;880a
	ret c			;880c
	neg		;880d
	ld (0e1dfh),a		;880f
	ld a,(hl)			;8812
	neg		;8813
	ld (hl),a			;8815
	ret			;8816
L_8817:
	ld a,(0e1fah)		;8817
	dec a			;881a
	ld b,a			;881b
	ld a,(0e1feh)		;881c
	or a			;881f
	ld a,b			;8820
	jr nz,L_8826		;8821
	ld a,005h		;8823
	sub b			;8825
L_8826:
	ld hl,08845h		;8826
	call 0556dh		;8829
	ld a,r		;882c
	and l			;882e
	add a,h			;882f
	cp 040h		;8830
	jr c,L_8837		;8832
	cpl			;8834
	and 03fh		;8835
L_8837:
	ld c,d			;8837
	ld b,a			;8838
	push af			;8839
	call 05f81h		;883a
	call L_8851		;883d
	pop af			;8840
	jp nc,05f71h		;8841
	ret			;8844

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8845..0x8851  (12 bytes)
DATA_8845:
	defb 00fh,000h,017h,010h,01fh,020h,01fh,040h,017h,058h,00fh,070h	; 8845  ..... .@.X.p

; ======================================================================
; CODIGO 0x8851..0x8a41  (496 bytes)
; ======================================================================


L_8851:
	push hl			;8851
	ex de,hl			;8852
	call L_8858		;8853
	ex de,hl			;8856
	pop hl			;8857
L_8858:
	xor a			;8858
	add hl,hl			;8859
	rla			;885a
	add hl,hl			;885b
	rla			;885c
	ld l,h			;885d
	ld h,a			;885e
	ret			;885f
L_8860:
	call 057b9h		;8860
	call L_88B7		;8863
	call L_88FA		;8866
	call 059d3h		;8869
	call 05677h		;886c
	ld a,004h		;886f
	ld (0e1f6h),a		;8871
	call 05761h		;8874
	call 0583bh		;8877
	ld hl,0e1f9h		;887a
	ld (hl),07ch		;887d
L_887F:
	xor a			;887f
	ld hl,0e1f1h		;8880
	ld (hl),a			;8883
	inc hl			;8884
	ld (hl),001h		;8885
	inc hl			;8887
	ld (hl),004h		;8888
	ld (0e1f7h),a		;888a
	ld (0e201h),a		;888d
	ld (0e1fdh),a		;8890
	ld (0ece0h),a		;8893
	ld (0e19dh),a		;8896
	ld (0ed7ch),a		;8899
	ld (0ed2eh),a		;889c
	dec a			;889f
	ld (0e1f6h),a		;88a0
	ld a,007h		;88a3
	ld (0e1fah),a		;88a5
	ret			;88a8
L_88A9:
	ld ix,(0ed8ch)		;88a9
	ld a,(0e19bh)		;88ad
	rra			;88b0
	ret nc			;88b1
	ld ix,(0ed8eh)		;88b2
	ret			;88b6
L_88B7:
	call L_88DF		;88b7
	ld hl,0d38bh		;88ba
	ld de,0ed44h		;88bd
	call L_88D3		;88c0
	ld (0ed8ch),hl		;88c3
	ld hl,0d48ah		;88c6
	ld de,0ed45h		;88c9
	call L_88D3		;88cc
	ld (0ed8eh),hl		;88cf
	ret			;88d2
L_88D3:
	ld a,(de)			;88d3
	dec a			;88d4
	ld c,a			;88d5
	xor a			;88d6
	ld b,00eh		;88d7
L_88D9:
	add a,c			;88d9
	djnz L_88D9		;88da
	jp 04216h		;88dc
L_88DF:
	ld a,(0ec4fh)		;88df
	ld hl,0ec50h		;88e2
	call 04216h		;88e5
	ld a,(hl)			;88e8
	ld (0ed44h),a		;88e9
	ld a,(0ec61h)		;88ec
	ld hl,0ec62h		;88ef
	call 04216h		;88f2
	ld a,(hl)			;88f5
	ld (0ed45h),a		;88f6
	ret			;88f9
L_88FA:
	ld a,(0e19bh)		;88fa
	rra			;88fd
	ld a,(0ed44h)		;88fe
	jr nc,L_8906		;8901
	ld a,(0ed45h)		;8903
L_8906:
	cp 00dh		;8906
	jr nc,L_8930		;8908
	call L_88A9		;890a
L_890D:
	ld de,04c94h		;890d
	ld a,(0e1cbh)		;8910
	or a			;8913
	jr z,L_8919		;8914
	ld de,040a0h		;8916
L_8919:
	ld a,(ix+006h)		;8919
	ld b,000h		;891c
	cp 020h		;891e
	jr z,L_8924		;8920
	ld b,001h		;8922
L_8924:
	ld a,b			;8924
	ld (0e1feh),a		;8925
	ld hl,0e1f5h		;8928
	ld (hl),d			;892b
	or a			;892c
	ret z			;892d
	ld (hl),e			;892e
	ret			;892f
L_8930:
	ld ix,(0ed88h)		;8930
	ld a,(0e19bh)		;8934
	rra			;8937
	jr nc,L_890D		;8938
	ld ix,(0ed8ah)		;893a
	jr L_890D		;893e
L_8940:
	ld a,(0e1f1h)		;8940
	cp 004h		;8943
	ret z			;8945
	ld a,(0e19dh)		;8946
	and 00ch		;8949
	ret z			;894b
	cp 00ch		;894c
	ret z			;894e
	ld d,a			;894f
	ld a,(0e1feh)		;8950
	or a			;8953
	ld bc,04050h		;8954
	jr z,L_895C		;8957
	ld bc,090a0h		;8959
L_895C:
	ld a,d			;895c
	rra			;895d
	rra			;895e
	rra			;895f
	ld hl,0e1f5h		;8960
	ld a,(hl)			;8963
	jr nc,L_896A		;8964
	cp b			;8966
	ret c			;8967
	dec (hl)			;8968
	ret			;8969
L_896A:
	cp c			;896a
	ret nc			;896b
	inc (hl)			;896c
	ret			;896d
L_896E:
	call L_89B2		;896e
	ld a,(0e1fbh)		;8971
	cp 009h		;8974
	ret nc			;8976
	or a			;8977
	ret z			;8978
	call L_8A1B		;8979
	ret nc			;897c
	ld a,(0e1f6h)		;897d
	cp 005h		;8980
	jr z,L_8997		;8982
	cp 006h		;8984
	jr z,L_89A6		;8986
	ld a,(0e1dfh)		;8988
	cp 00eh		;898b
	ret c			;898d
	cp 022h		;898e
	ret nc			;8990
	ld a,001h		;8991
	ld (0ece0h),a		;8993
	ret			;8996
L_8997:
	ld a,(0e1dfh)		;8997
	cp 00eh		;899a
	ret c			;899c
	cp 030h		;899d
	ret nc			;899f
	ld a,002h		;89a0
	ld (0ece0h),a		;89a2
	ret			;89a5
L_89A6:
	ld a,(0e1dfh)		;89a6
	cp 022h		;89a9
	ret nc			;89ab
	ld a,003h		;89ac
	ld (0ece0h),a		;89ae
	ret			;89b1
L_89B2:
	ld a,(0e1feh)		;89b2
	or a			;89b5
	jp nz,L_89E1		;89b6
	ld hl,08a41h		;89b9
	call L_8A02		;89bc
	cp b			;89bf
	jr c,L_89DD		;89c0
	ld a,c			;89c2
	ld hl,08a4dh		;89c3
	call 0556dh		;89c6
	ex de,hl			;89c9
	ld h,b			;89ca
	ld l,000h		;89cb
	ld b,008h		;89cd
	ld a,(0e340h)		;89cf
L_89D2:
	add hl,de			;89d2
	cp h			;89d3
	jr c,L_89D8		;89d4
	djnz L_89D2		;89d6
L_89D8:
	ld hl,0e1fbh		;89d8
	ld (hl),b			;89db
	ret			;89dc
L_89DD:
	ld b,009h		;89dd
	jr L_89D8		;89df
L_89E1:
	ld hl,08a47h		;89e1
	call L_8A02		;89e4
	cp b			;89e7
	jr nc,L_89DD		;89e8
	ld a,c			;89ea
	ld hl,08a59h		;89eb
	call 0556dh		;89ee
	ex de,hl			;89f1
	ld h,b			;89f2
	ld l,000h		;89f3
	ld b,008h		;89f5
	ld a,(0e340h)		;89f7
L_89FA:
	add hl,de			;89fa
	cp h			;89fb
	jr nc,L_89D8		;89fc
	djnz L_89FA		;89fe
	jr L_89D8		;8a00
L_8A02:
	ld a,(0e1fah)		;8a02
	dec a			;8a05
	ld c,a			;8a06
	call 04216h		;8a07
	ld a,(hl)			;8a0a
	ld hl,0e1f5h		;8a0b
	add a,(hl)			;8a0e
	ld b,a			;8a0f
	ld a,(0e1d9h)		;8a10
	add a,008h		;8a13
	ld (0e340h),a		;8a15
	ret			;8a18
L_8A19:
	or a			;8a19
	ret			;8a1a
L_8A1B:
	ld a,(0e1fah)		;8a1b
	dec a			;8a1e
	ld hl,08a65h		;8a1f
	call 0556dh		;8a22
	ex de,hl			;8a25
	ld h,0b0h		;8a26
	ld l,000h		;8a28
	ld a,(0e1fbh)		;8a2a
	ld b,a			;8a2d
	ld a,009h		;8a2e
	sub b			;8a30
	ld b,a			;8a31
L_8A32:
	add hl,de			;8a32
	djnz L_8A32		;8a33
	ld a,(0e1d5h)		;8a35
	add a,00bh		;8a38
	cp h			;8a3a
	jr c,L_8A19		;8a3b
	sub 007h		;8a3d
	cp h			;8a3f
	ret			;8a40

; ----------------------------------------------------------------------
; DATOS sin identificar  0x8a41..0x8a71  (48 bytes)
DATA_8A41:
	defb 022h,028h,02ch,02ch,028h,022h,0feh,0f8h,0f4h,0f4h,0f8h,0feh,000h,002h,080h,002h	; 8a41  "(,,("..........
	defb 000h,003h,000h,003h,080h,002h,000h,002h,000h,0feh,080h,0fdh,000h,0fdh,000h,0fdh	; 8a51  ................
	defb 080h,0fdh,000h,0feh,040h,0feh,000h,0ffh,000h,000h,000h,000h,000h,001h,0c0h,001h	; 8a61  ....@...........

; ======================================================================
; CODIGO 0x8a71..0x8bbe  (333 bytes)
; ======================================================================


L_8A71:
	ld a,(0e338h)		;8a71
	rra			;8a74
	ret c			;8a75
	ld a,(0e1feh)		;8a76
	dec a			;8a79
	jr z,L_8AB5		;8a7a
	ld a,(0e1d9h)		;8a7c
	ld d,a			;8a7f
	ld a,(0e1f5h)		;8a80
	cp d			;8a83
	ret nc			;8a84
	add a,010h		;8a85
	cp d			;8a87
	ret c			;8a88
L_8A89:
	ld a,(0e1d5h)		;8a89
	cp 0ach		;8a8c
	ret c			;8a8e
	cp 0b8h		;8a8f
	ret nc			;8a91
	ld a,(0e1dfh)		;8a92
	cp 038h		;8a95
	ret nc			;8a97
	ld a,001h		;8a98
	ld (0ec75h),a		;8a9a
	ld a,003h		;8a9d
	ld (0e338h),a		;8a9f
	ld a,007h		;8aa2
	call 057ffh		;8aa4
	ld a,043h		;8aa7
	call 057ffh		;8aa9
	call 058c5h		;8aac
	ld hl,07e05h		;8aaf
	jp 04ea6h		;8ab2
L_8AB5:
	ld a,(0e1d9h)		;8ab5
	ld d,a			;8ab8
	ld a,(0e1f5h)		;8ab9
	cp d			;8abc
	ret nc			;8abd
	add a,010h		;8abe
	cp d			;8ac0
	jr nc,L_8A89		;8ac1
	ret			;8ac3
L_8AC4:
	ld a,(0e1d1h)		;8ac4
	or a			;8ac7
	ret z			;8ac8
	ld a,(0ecdbh)		;8ac9
	or a			;8acc
	ret nz			;8acd
	ld a,(0ecebh)		;8ace
	or a			;8ad1
	jr nz,L_8AD4		;8ad2
L_8AD4:
	ld a,(0de03h)		;8ad4
	rra			;8ad7
	ret c			;8ad8
	ld hl,0e23ch		;8ad9
	ld de,00010h		;8adc
	ld b,004h		;8adf
L_8AE1:
	ld a,(hl)			;8ae1
	or a			;8ae2
	jr nz,L_8B17		;8ae3
	add hl,de			;8ae5
	djnz L_8AE1		;8ae6
	ret			;8ae8
L_8AE9:
	ld a,(0de02h)		;8ae9
	bit 5,a		;8aec
	ret nz			;8aee
	bit 3,a		;8aef
	jp nz,078f2h		;8af1
	bit 4,a		;8af4
	jr z,L_8AFE		;8af6
	ld a,(0d6dch)		;8af8
	rra			;8afb
	jr c,L_8B06		;8afc
L_8AFE:
	ld a,(0e19bh)		;8afe
	rra			;8b01
	jp c,078f2h		;8b02
	ret			;8b05
L_8B06:
	ld a,(0e19bh)		;8b06
	rra			;8b09
	jp nc,078f2h		;8b0a
	ret			;8b0d
L_8B0E:
	call L_8AE9		;8b0e
	call L_8B88		;8b11
	call L_8B5F		;8b14
L_8B17:
	ld a,(0e19dh)		;8b17
	bit 5,a		;8b1a
	jr z,L_8B20		;8b1c
	res 4,a		;8b1e
L_8B20:
	ld (0ede1h),a		;8b20
	ld ix,0e231h		;8b23
	ld a,004h		;8b27
	ld (0e301h),a		;8b29
L_8B2C:
	ld a,(ix+000h)		;8b2c
	ld c,a			;8b2f
	and 0f0h		;8b30
	jr z,L_8B37		;8b32
	call L_8BB8		;8b34
L_8B37:
	ld a,(ix+000h)		;8b37
	cp 0f0h		;8b3a
	call z,L_8FB2		;8b3c
	ld de,00010h		;8b3f
	add ix,de		;8b42
	ld hl,0e301h		;8b44
	dec (hl)			;8b47
	jr nz,L_8B2C		;8b48
	ld a,(0e1a1h)		;8b4a
	ld (0e1cfh),a		;8b4d
	dec a			;8b50
	ret z			;8b51
	ld a,0ffh		;8b52
	ld (0e1ceh),a		;8b54
	ld bc,00400h		;8b57
	ld ix,0e231h		;8b5a
	ret			;8b5e
L_8B5F:
	ld hl,0e23ch		;8b5f
	ld de,00010h		;8b62
	ld b,004h		;8b65
L_8B67:
	bit 6,(hl)		;8b67
	jr nz,L_8B6F		;8b69
	add hl,de			;8b6b
	djnz L_8B67		;8b6c
	ret			;8b6e
L_8B6F:
	ld a,(hl)			;8b6f
	and 04fh		;8b70
	ld c,a			;8b72
L_8B73:
	add hl,de			;8b73
	ld a,(hl)			;8b74
	and 04fh		;8b75
	cp c			;8b77
	jr z,L_8B7D		;8b78
	djnz L_8B73		;8b7a
	ret			;8b7c
L_8B7D:
	ld (hl),000h		;8b7d
	ld de,0fff5h		;8b7f
	add hl,de			;8b82
	ld (hl),000h		;8b83
	jp 0b11fh		;8b85
L_8B88:
	ld a,(0ed02h)		;8b88
	or a			;8b8b
	ret z			;8b8c
	ld ix,0e231h		;8b8d
	ld hl,0eca3h		;8b91
	ld b,004h		;8b94
L_8B96:
	ld a,(ix+00bh)		;8b96
	or a			;8b99
	jr z,L_8BAF		;8b9a
	bit 6,(ix+00dh)		;8b9c
	jr nz,L_8BAF		;8ba0
	and 04fh		;8ba2
	ld c,a			;8ba4
	ld a,(hl)			;8ba5
	and 04fh		;8ba6
	cp c			;8ba8
	jr nz,L_8BAF		;8ba9
	set 6,(ix+00dh)		;8bab
L_8BAF:
	ld de,00010h		;8baf
	add ix,de		;8bb2
	add hl,de			;8bb4
	djnz L_8B96		;8bb5
	ret			;8bb7
L_8BB8:
	ld a,c			;8bb8
	and 00fh		;8bb9
	call 04220h		;8bbb

; ----------------------------------------------------------------------
; DATOS tabla_8BBE: 3 destinos del despachador p00:4220 (call en p02:8BBB, el
;   indice en A): 8BC4, 8EDC, 8F3C; lo leen p02:8BBB (6 bytes)
;   0x8bbe..0x8bc4  (6 bytes)
DATA_tabla_8BBE:
	defw 08bc4h,08edch,08f3ch	; 8bbe  -> L_8BC4 L_8EDC L_8F3C

; ======================================================================
; CODIGO 0x8bc4..0x908a  (1222 bytes)
; ======================================================================


L_8BC4:
	bit 7,(ix+00dh)		;8bc4
	jr z,L_8BE3		;8bc8
	call L_8DFF		;8bca
	ld a,(ix+00bh)		;8bcd
	bit 7,a		;8bd0
	jr nz,L_8BD5		;8bd2
	inc a			;8bd4
L_8BD5:
	and 00fh		;8bd5
	or 040h		;8bd7
	ld c,a			;8bd9
	call 0b06eh		;8bda
	ret nc			;8bdd
	res 7,(ix+00dh)		;8bde
	ret			;8be2
L_8BE3:
	call L_8DFF		;8be3
	ld e,(ix+004h)		;8be6
	ld d,(ix+005h)		;8be9
	ld (0e340h),de		;8bec
	ld a,d			;8bf0
	or e			;8bf1
	jp z,L_8CA0		;8bf2
	ld l,(ix+001h)		;8bf5
	ld a,(ix+002h)		;8bf8
	ld h,a			;8bfb
	add hl,de			;8bfc
	ld (ix+001h),l		;8bfd
	ld (ix+002h),h		;8c00
	call 074a1h		;8c03
	ld a,(0e33bh)		;8c06
	or a			;8c09
	jp nz,L_8C82		;8c0a
	ld a,(ix+00bh)		;8c0d
	bit 5,a		;8c10
	jp nz,L_8C82		;8c12
	bit 7,a		;8c15
	ld hl,09139h		;8c17
	jr z,L_8C1F		;8c1a
	ld hl,09141h		;8c1c
L_8C1F:
	and 00fh		;8c1f
	ld b,a			;8c21
	dec a			;8c22
	add a,a			;8c23
	call 04216h		;8c24
	ld e,(hl)			;8c27
	inc hl			;8c28
	ld d,(hl)			;8c29
	ld l,(ix+002h)		;8c2a
	ld h,(ix+003h)		;8c2d
	bit 7,(ix+005h)		;8c30
	jr nz,L_8C3F		;8c34
	or a			;8c36
	sbc hl,de		;8c37
	rl h		;8c39
	jr c,L_8C82		;8c3b
	jr L_8C46		;8c3d
L_8C3F:
	or a			;8c3f
	sbc hl,de		;8c40
	rl h		;8c42
	jr nc,L_8C82		;8c44
L_8C46:
	ld a,(ix+00bh)		;8c46
	bit 7,a		;8c49
	jr nz,L_8C4E		;8c4b
	inc a			;8c4d
L_8C4E:
	and 00fh		;8c4e
	or 040h		;8c50
	ld c,a			;8c52
	call 0b06eh		;8c53
	jr c,L_8C5D		;8c56
	set 7,(ix+00dh)		;8c58
	ret			;8c5c
L_8C5D:
	ld a,(ix+00bh)		;8c5d
	and 00fh		;8c60
	ld b,a			;8c62
	sub 002h		;8c63
	jr c,L_8C82		;8c65
	ld a,(ix+00bh)		;8c67
	and 080h		;8c6a
	jr nz,L_8C82		;8c6c
	ld a,b			;8c6e
	sub 002h		;8c6f
	add a,a			;8c71
	add a,a			;8c72
	add a,a			;8c73
	add a,0e0h		;8c74
	ld (ix+00ch),a		;8c76
	set 5,(ix+00bh)		;8c79
	ld a,00ah		;8c7d
	call 057ffh		;8c7f
L_8C82:
	ld a,(ix+002h)		;8c82
	ld e,(ix+00eh)		;8c85
	bit 7,(ix+005h)		;8c88
	jr nz,L_8C93		;8c8c
	cp e			;8c8e
	jr c,L_8CA0		;8c8f
	jr L_8C96		;8c91
L_8C93:
	cp e			;8c93
	jr nc,L_8CA0		;8c94
L_8C96:
	ld (ix+002h),e		;8c96
	xor a			;8c99
	ld (ix+004h),a		;8c9a
	ld (ix+005h),a		;8c9d
L_8CA0:
	ld e,(ix+009h)		;8ca0
	ld d,(ix+00ah)		;8ca3
	ld a,d			;8ca6
	or e			;8ca7
	jp z,L_8DA5		;8ca8
	ld a,e			;8cab
	add a,(ix+006h)		;8cac
	ld (ix+006h),a		;8caf
	ld a,d			;8cb2
	adc a,(ix+007h)		;8cb3
	ld (ix+007h),a		;8cb6
	push af			;8cb9
	rl d		;8cba
	ld d,000h		;8cbc
	jr nc,L_8CC2		;8cbe
	ld d,0ffh		;8cc0
L_8CC2:
	pop af			;8cc2
	ld a,d			;8cc3
	adc a,(ix+008h)		;8cc4
	ld (ix+008h),a		;8cc7
	ld l,(ix+007h)		;8cca
	ld h,(ix+008h)		;8ccd
	ld e,(ix+00fh)		;8cd0
	ld a,(ix+00bh)		;8cd3
	and 08fh		;8cd6
	cp 003h		;8cd8
	ld d,000h		;8cda
	jr z,L_8CE4		;8cdc
	cp 084h		;8cde
	jr z,L_8CE4		;8ce0
	ld d,001h		;8ce2
L_8CE4:
	bit 7,(ix+00ah)		;8ce4
	jr nz,L_8CF2		;8ce8
	or a			;8cea
	sbc hl,de		;8ceb
	rl h		;8ced
	ret c			;8cef
	jr L_8CF8		;8cf0
L_8CF2:
	or a			;8cf2
	sbc hl,de		;8cf3
	rl h		;8cf5
	ret nc			;8cf7
L_8CF8:
	ld (ix+007h),e		;8cf8
	xor a			;8cfb
	ld (ix+009h),a		;8cfc
	ld (ix+00ah),a		;8cff
	ld a,(ix+00bh)		;8d02
	rla			;8d05
	ld a,080h		;8d06
	ld c,001h		;8d08
	jr c,L_8D2A		;8d0a
	ld a,(0eddeh)		;8d0c
	or a			;8d0f
	jr nz,L_8D26		;8d10
	ld a,(ix+00bh)		;8d12
	and 00fh		;8d15
	dec a			;8d17
	jr nz,L_8D26		;8d18
	ld a,001h		;8d1a
	ld (0edc6h),a		;8d1c
	ld a,(0e1d0h)		;8d1f
	or a			;8d22
	call nz,062f7h		;8d23
L_8D26:
	ld a,001h		;8d26
	ld c,000h		;8d28
L_8D2A:
	add a,(ix+00bh)		;8d2a
	ld (ix+00bh),a		;8d2d
	ld b,a			;8d30
	ld a,c			;8d31
	ld (0ed83h),a		;8d32
	ld a,(0eddeh)		;8d35
	or a			;8d38
	jr nz,L_8D5B		;8d39
	call 0b10ch		;8d3b
	ld de,0000bh		;8d3e
	add hl,de			;8d41
	ld a,(hl)			;8d42
	ld c,a			;8d43
	and 00fh		;8d44
	cp 002h		;8d46
	jr nz,L_8D5B		;8d48
	ld a,c			;8d4a
	rra			;8d4b
	rra			;8d4c
	rra			;8d4d
	rra			;8d4e
	and 00fh		;8d4f
	ld c,a			;8d51
	ld a,(ix+00bh)		;8d52
	and 007h		;8d55
	cp c			;8d57
	jp z,L_8FDB		;8d58
L_8D5B:
	ld a,b			;8d5b
	and 007h		;8d5c
	cp 005h		;8d5e
	jp z,L_8DA8		;8d60
	ld a,(ix+00bh)		;8d63
	and 00fh		;8d66
	cp 005h		;8d68
	jr nz,L_8D7A		;8d6a
	ld a,(ix+00eh)		;8d6c
	ld (ix+002h),a		;8d6f
	ld a,(ix+00fh)		;8d72
	ld (ix+007h),a		;8d75
	jr L_8D9D		;8d78
L_8D7A:
	add a,a			;8d7a
	add a,a			;8d7b
	ld hl,0909eh		;8d7c
	call 04216h		;8d7f
	ld e,(hl)			;8d82
	inc hl			;8d83
	ld d,(hl)			;8d84
	inc hl			;8d85
	ld (ix+001h),000h		;8d86
	ld (ix+002h),e		;8d8a
	ld (ix+003h),d		;8d8d
	ld e,(hl)			;8d90
	inc hl			;8d91
	ld d,(hl)			;8d92
	ld (ix+006h),000h		;8d93
	ld (ix+007h),e		;8d97
	ld (ix+008h),d		;8d9a
L_8D9D:
	ld a,(ix+00bh)		;8d9d
	and 007h		;8da0
	call L_8FEC		;8da2
L_8DA5:
	jp L_8FB2		;8da5
L_8DA8:
	ld (ix+000h),0f2h		;8da8
	ld a,040h		;8dac
	or (ix+00bh)		;8dae
	ld (ix+00bh),a		;8db1
	ret			;8db4
L_8DB5:
	ld a,b			;8db5
	and 020h		;8db6
	ret z			;8db8
	ld a,(ix+00bh)		;8db9
	ld c,a			;8dbc
	and 080h		;8dbd
	ret z			;8dbf
	ld a,c			;8dc0
	and 007h		;8dc1
	ld c,a			;8dc3
	dec a			;8dc4
	ret z			;8dc5
	ld a,c			;8dc6
	and 007h		;8dc7
	dec a			;8dc9
	ld c,001h		;8dca
	dec a			;8dcc
	jr z,L_8DD6		;8dcd
	ld c,004h		;8dcf
	dec a			;8dd1
	jr z,L_8DD6		;8dd2
	ld c,002h		;8dd4
L_8DD6:
	ld a,b			;8dd6
	and c			;8dd7
	ret z			;8dd8
	ld a,(ix+00bh)		;8dd9
	and 007h		;8ddc
	dec a			;8dde
	ret z			;8ddf
	ld hl,0908ch		;8de0
	res 7,(ix+00bh)		;8de3
	ld b,a			;8de7
	xor a			;8de8
	ld (0e340h),a		;8de9
	ld a,b			;8dec
	dec a			;8ded
	ld e,a			;8dee
	ld c,001h		;8def
	jp z,L_8E8D		;8df1
	dec a			;8df4
	ld c,004h		;8df5
	jp z,L_8E8D		;8df7
	ld c,002h		;8dfa
	jp L_8E8D		;8dfc
L_8DFF:
	ld a,(0e33bh)		;8dff
	or a			;8e02
	ret nz			;8e03
	ld a,(0e1a1h)		;8e04
	dec a			;8e07
	ret z			;8e08
	ld a,(0e1a1h)		;8e09
	cp 003h		;8e0c
	ret c			;8e0e
	ld a,(ix+00bh)		;8e0f
	bit 6,a		;8e12
	ret nz			;8e14
	bit 5,a		;8e15
	ret nz			;8e17
	ld a,(0ede1h)		;8e18
	ld b,a			;8e1b
	and 010h		;8e1c
	jr z,L_8DB5		;8e1e
	ld a,(ix+00bh)		;8e20
	ld c,a			;8e23
	and 080h		;8e24
	ret nz			;8e26
	ld a,c			;8e27
	and 00fh		;8e28
	dec a			;8e2a
	add a,a			;8e2b
	ld hl,09141h		;8e2c
	call 04216h		;8e2f
	ld e,(hl)			;8e32
	inc hl			;8e33
	ld d,(hl)			;8e34
	ld l,(ix+002h)		;8e35
	ld h,(ix+003h)		;8e38
	bit 7,(ix+005h)		;8e3b
	jr nz,L_8E49		;8e3f
	or a			;8e41
	sbc hl,de		;8e42
	rl h		;8e44
	ret c			;8e46
	jr L_8E4F		;8e47
L_8E49:
	or a			;8e49
	sbc hl,de		;8e4a
	rl h		;8e4c
	ret nc			;8e4e
L_8E4F:
	ld a,c			;8e4f
	and 007h		;8e50
	dec a			;8e52
	jr z,L_8E61		;8e53
	ld c,008h		;8e55
	dec a			;8e57
	jr z,L_8E61		;8e58
	ld c,001h		;8e5a
	dec a			;8e5c
	jr z,L_8E61		;8e5d
	ld c,004h		;8e5f
L_8E61:
	ld a,b			;8e61
	and c			;8e62
	ret z			;8e63
	ld (0ede1h),a		;8e64
	ld a,(ix+00bh)		;8e67
	and 007h		;8e6a
	dec a			;8e6c
	ret z			;8e6d
	ld b,a			;8e6e
	ld a,001h		;8e6f
	ld (0e340h),a		;8e71
	ld a,b			;8e74
	res 7,(ix+00dh)		;8e75
	ld hl,09092h		;8e79
	set 7,(ix+00bh)		;8e7c
	dec a			;8e80
	ld e,a			;8e81
	ld c,008h		;8e82
	jr z,L_8E8D		;8e84
	dec a			;8e86
	ld c,001h		;8e87
	jr z,L_8E8D		;8e89
	ld c,004h		;8e8b
L_8E8D:
	ld a,(0ede1h)		;8e8d
	and c			;8e90
	ret z			;8e91
	ld a,e			;8e92
	add a,a			;8e93
	push af			;8e94
	call 04216h		;8e95
	ld c,(hl)			;8e98
	inc hl			;8e99
	ld b,(hl)			;8e9a
	ld a,(ix+00dh)		;8e9b
	and 00fh		;8e9e
	jr z,L_8EA5		;8ea0
	dec a			;8ea2
	add a,a			;8ea3
	add a,a			;8ea4
L_8EA5:
	call 05c94h		;8ea5
	inc hl			;8ea8
	inc c			;8ea9
	call z,L_9127		;8eaa
	ld (ix+004h),e		;8ead
	ld (ix+005h),d		;8eb0
	call 05ca3h		;8eb3
	inc b			;8eb6
	call z,L_9127		;8eb7
	ld (ix+009h),e		;8eba
	ld (ix+00ah),d		;8ebd
	ld hl,0909eh		;8ec0
	ld a,(0e340h)		;8ec3
	or a			;8ec6
	jr nz,L_8ECC		;8ec7
	ld hl,09098h		;8ec9
L_8ECC:
	pop af			;8ecc
	call 04216h		;8ecd
	ld a,(hl)			;8ed0
	inc hl			;8ed1
	ld (ix+00eh),a		;8ed2
	ld a,(hl)			;8ed5
	inc hl			;8ed6
	ld (ix+00fh),a		;8ed7
	ret			;8eda
L_8EDB:
	ret			;8edb
L_8EDC:
	ld a,(0ecebh)		;8edc
	or a			;8edf
	jr nz,L_8F15		;8ee0
	ld a,(0ed3fh)		;8ee2
	or a			;8ee5
	jr nz,L_8F15		;8ee6
	ld a,(0e33bh)		;8ee8
	or a			;8eeb
	jr nz,L_8F05		;8eec
	ld a,(0e1a1h)		;8eee
	ld b,a			;8ef1
	ld a,(0e1cfh)		;8ef2
	ld c,a			;8ef5
	or a			;8ef6
	jr z,L_8EDB		;8ef7
	dec a			;8ef9
	jr z,L_8EDB		;8efa
	dec a			;8efc
	dec a			;8efd
	jr z,L_8F05		;8efe
	ld a,b			;8f00
	cp 003h		;8f01
	jr z,L_8F33		;8f03
L_8F05:
	ld a,(ix+00bh)		;8f05
	ld b,a			;8f08
	and 040h		;8f09
	jr z,L_8F15		;8f0b
	ld a,b			;8f0d
	and 00fh		;8f0e
	ld c,a			;8f10
	call 0b06eh		;8f11
	ret nc			;8f14
L_8F15:
	ld a,(ix+00bh)		;8f15
	and 007h		;8f18
	sub 002h		;8f1a
	ld c,001h		;8f1c
	jr z,L_8F27		;8f1e
	dec a			;8f20
	ld c,004h		;8f21
	jr z,L_8F27		;8f23
	ld c,002h		;8f25
L_8F27:
	ld a,(0ede1h)		;8f27
	ld d,a			;8f2a
	and c			;8f2b
	jr z,L_8EDB		;8f2c
	ld a,d			;8f2e
	and 020h		;8f2f
	jr z,L_8EDB		;8f31
L_8F33:
	res 6,(ix+00bh)		;8f33
	ld (ix+000h),0f0h		;8f37
	ret			;8f3b
L_8F3C:
	ld a,(0ecebh)		;8f3c
	or a			;8f3f
	jr z,L_8F49		;8f40
	ld a,(0ed2eh)		;8f42
	cp 002h		;8f45
	jr nz,L_8F5A		;8f47
L_8F49:
	ld a,(0ed3fh)		;8f49
	or a			;8f4c
	jr nz,L_8F6B		;8f4d
	ld a,(0ed02h)		;8f4f
	or a			;8f52
	jr nz,L_8F5A		;8f53
	ld a,(0e1d0h)		;8f55
	or a			;8f58
	ret z			;8f59
L_8F5A:
	ld a,(0e19ah)		;8f5a
	cp 003h		;8f5d
	jr c,L_8F66		;8f5f
	ld a,(0edd7h)		;8f61
	or a			;8f64
	ret nz			;8f65
L_8F66:
	ld a,(0eddeh)		;8f66
	or a			;8f69
	ret nz			;8f6a
L_8F6B:
	ld a,(0e338h)		;8f6b
	cp 003h		;8f6e
	ret z			;8f70
	ld iy,0e231h		;8f71
	ld de,00010h		;8f75
	ld b,004h		;8f78
	ld a,(0ed02h)		;8f7a
	or a			;8f7d
	jr nz,L_8FAB		;8f7e
	ld h,a			;8f80
L_8F81:
	ld a,h			;8f81
	or a			;8f82
	jr z,L_8F8B		;8f83
	bit 6,(iy+00dh)		;8f85
	jr z,L_8F92		;8f89
L_8F8B:
	ld a,(iy+00bh)		;8f8b
	and 007h		;8f8e
	dec a			;8f90
	ret z			;8f91
L_8F92:
	add iy,de		;8f92
	djnz L_8F81		;8f94
L_8F96:
	ld (ix+000h),000h		;8f96
	ld (ix+00bh),000h		;8f9a
	ld a,01ch		;8f9e
	call 057ffh		;8fa0
	ld a,044h		;8fa3
	call 057ffh		;8fa5
	jp 066ebh		;8fa8
L_8FAB:
	bit 6,(ix+00dh)		;8fab
	jr nz,L_8F96		;8faf
	ret			;8fb1
L_8FB2:
	bit 7,(ix+00dh)		;8fb2
	ret nz			;8fb6
	ld a,(ix+00bh)		;8fb7
	bit 5,a		;8fba
	ret nz			;8fbc
	ld b,a			;8fbd
	rl b		;8fbe
	ld b,000h		;8fc0
	jr nc,L_8FC6		;8fc2
	ld b,002h		;8fc4
L_8FC6:
	add a,b			;8fc6
	dec a			;8fc7
	and 003h		;8fc8
	add a,a			;8fca
	add a,a			;8fcb
	add a,a			;8fcc
	add a,a			;8fcd
	ld c,a			;8fce
	ld a,(0ed0eh)		;8fcf
	and 008h		;8fd2
	or c			;8fd4
	add a,070h		;8fd5
	ld (ix+00ch),a		;8fd7
	ret			;8fda
L_8FDB:
	ld hl,07e69h		;8fdb
	call 04ea6h		;8fde
	ld (ix+000h),000h		;8fe1
	ld (ix+00bh),000h		;8fe5
	jp 0b11fh		;8fe9
L_8FEC:
	dec a			;8fec
	dec a			;8fed
	add a,a			;8fee
	push af			;8fef
	ld hl,0908ch		;8ff0
	call 04216h		;8ff3
	ld c,(hl)			;8ff6
	inc hl			;8ff7
	ld b,(hl)			;8ff8
	ld a,(ix+00dh)		;8ff9
	and 00fh		;8ffc
	jr z,L_9001		;8ffe
	dec a			;9000
L_9001:
	add a,a			;9001
	add a,a			;9002
	call 05c94h		;9003
	inc hl			;9006
	inc c			;9007
	call z,L_9127		;9008
	ld (ix+004h),e		;900b
	ld (ix+005h),d		;900e
	call 05ca3h		;9011
	inc b			;9014
	call z,L_9127		;9015
	ld (ix+009h),e		;9018
	ld (ix+00ah),d		;901b
	pop af			;901e
	ld hl,09098h		;901f
	call 04216h		;9022
	ld a,(hl)			;9025
	inc hl			;9026
	ld (ix+00eh),a		;9027
	ld a,(hl)			;902a
	inc hl			;902b
	ld (ix+00fh),a		;902c
	xor a			;902f
	ld (ix+001h),a		;9030
	ld (ix+006h),a		;9033
	res 5,(ix+00bh)		;9036
	set 6,(ix+00bh)		;903a
	ld b,(ix+00bh)		;903e
	inc (ix+000h)		;9041
	ld a,(0eddeh)		;9044
	or a			;9047
	ret nz			;9048
	ld a,(0ed82h)		;9049
	and 040h		;904c
	ret nz			;904e
	ld a,(0ed83h)		;904f
	or a			;9052
	ret nz			;9053
	ld a,b			;9054
	and 00fh		;9055
	cp 003h		;9057
	jr nc,L_9070		;9059
	ld a,(0e1d0h)		;905b
	or a			;905e
	ret z			;905f
	ld hl,0ed15h		;9060
	ld a,(0e19bh)		;9063
	rra			;9066
	jr nc,L_906A		;9067
	inc hl			;9069
L_906A:
	ld a,(hl)			;906a
	add a,001h		;906b
	daa			;906d
	ld (hl),a			;906e
	ret			;906f
L_9070:
	ld a,(0e338h)		;9070
	cp 003h		;9073
	ret z			;9075
	ld hl,0ecdbh		;9076
	ld a,(hl)			;9079
	or a			;907a
	jr z,L_9080		;907b
	ld (hl),000h		;907d
	ret			;907f
L_9080:
	ld a,01eh		;9080
	call 057ffh		;9082
	ld a,044h		;9085
	jp 057ffh		;9087

; ----------------------------------------------------------------------
; DATOS sin identificar  0x908a..0x90b2  (40 bytes)
DATA_908A:
	defb 0ffh,000h,0ffh,0ffh,000h,0ffh,000h,000h,000h,000h,0ffh,000h,0ffh,0ffh,005h,044h	; 908a  ...............D
	defb 03dh,0cbh,07fh,030h,040h,0a8h,005h,02dh,03dh,0cbh,07fh,030h,03dh,001h,0a4h,001h	; 909a  =..0@..-=..0=...
	defb 003h,001h,031h,001h,044h,001h,0cbh,000h	; 90aa  ..1.D...

; ======================================================================
; CODIGO 0x90b2..0x912f  (125 bytes)
; ======================================================================


L_90B2:
	ld hl,0e231h		;90b2
	ld de,00010h		;90b5
	ld b,004h		;90b8
L_90BA:
	ld a,(hl)			;90ba
	or a			;90bb
	jr z,L_90C2		;90bc
	add hl,de			;90be
	djnz L_90BA		;90bf
	ret			;90c1
L_90C2:
	ld a,004h		;90c2
	sub b			;90c4
	ld (0ecedh),a		;90c5
	ld (hl),0f0h		;90c8
	push hl			;90ca
	pop ix		;90cb
	inc hl			;90cd
	inc hl			;90ce
	ex de,hl			;90cf
	ld hl,0912fh		;90d0
	ld bc,0000ah		;90d3
	ldir		;90d6
	ld a,(0e19bh)		;90d8
	rra			;90db
	ld de,0ec4fh		;90dc
	ld hl,0d397h		;90df
	jr nc,L_90EA		;90e2
	ld de,0ec61h		;90e4
	ld hl,0d496h		;90e7
L_90EA:
	call 06a40h		;90ea
	xor a			;90ed
	or d			;90ee
	ld a,(hl)			;90ef
	jr z,L_90F4		;90f0
	ld a,002h		;90f2
L_90F4:
	ld (ix+00dh),a		;90f4
	and 00fh		;90f7
	jr z,L_90FC		;90f9
	dec a			;90fb
L_90FC:
	add a,a			;90fc
	add a,a			;90fd
	call 05c94h		;90fe
	inc hl			;9101
	call L_9127		;9102
	ld (ix+004h),e		;9105
	ld (ix+005h),d		;9108
	call 05ca3h		;910b
	ld (ix+009h),e		;910e
	ld (ix+00ah),d		;9111
	ld (ix+00eh),040h		;9114
	ld (ix+00fh),0a8h		;9118
	xor a			;911c
	ld (0ed29h),a		;911d
	ld (0ed6ch),a		;9120
	ld (0ed32h),a		;9123
	ret			;9126
L_9127:
	ld a,e			;9127
	cpl			;9128
	ld e,a			;9129
	ld a,d			;912a
	cpl			;912b
	ld d,a			;912c
	inc de			;912d
	ret			;912e

; ----------------------------------------------------------------------
; DATOS sin identificar  0x912f..0x9149  (26 bytes)
DATA_912F:
	defb 088h,001h,000h,000h,000h,038h,001h,000h,000h,001h,050h,001h,00ch,001h,034h,001h	; 912f  .....8....P...4.
	defb 076h,001h,000h,000h,02ch,001h,012h,001h,050h,001h	; 913f  v...,...P.

; ======================================================================
; CODIGO 0x9149..0x9155  (12 bytes)
; ======================================================================


L_9149:
	call 04468h		;9149
	call L_94F7		;914c
	ld a,(0e1a1h)		;914f
	call 04220h		;9152

; ----------------------------------------------------------------------
; DATOS tabla_9155: 7 destinos del despachador p00:4220 (call en p02:9152, el
;   indice en A): 9163, 9181, 91E4, 9228, 93A6, 93B3, 940A; lo leen p02:9152
;   (14 bytes)
;   0x9155..0x9163  (14 bytes)
DATA_tabla_9155:
	defw 09163h,09181h,091e4h,09228h,093a6h,093b3h,0940ah	; 9155

; ======================================================================
; CODIGO 0x9163..0x95c0  (1117 bytes)
; ======================================================================


L_9163:
	call 0ac7ch		;9163
	call 04468h		;9166
	ld a,(0e19bh)		;9169
	sub 00ch		;916c
	jr z,L_9173		;916e
	dec a			;9170
	jr nz,L_917C		;9171
L_9173:
	ld hl,0ed2bh		;9173
	ld a,(hl)			;9176
	or a			;9177
	jr nz,L_917C		;9178
	ld (hl),001h		;917a
L_917C:
	ld hl,0e1a1h		;917c
	inc (hl)			;917f
	ret			;9180
L_9181:
	ld a,(0e19ah)		;9181
	cp 003h		;9184
	jp nc,L_9311		;9186
	ld a,(0e30fh)		;9189
	or a			;918c
	jr nz,L_91C3		;918d
	call 05b1fh		;918f
	call 05c73h		;9192
	call L_83E6		;9195
	call 0a519h		;9198
	call L_91D5		;919b
	call L_8AC4		;919e
	ld a,(0de02h)		;91a1
	bit 6,a		;91a4
	jr nz,L_91AB		;91a6
	bit 4,a		;91a8
	ret z			;91aa
L_91AB:
	ld a,(0e337h)		;91ab
	or a			;91ae
	ret nz			;91af
	call 06098h		;91b0
	ret nc			;91b3
	call 06491h		;91b4
	ld a,01dh		;91b7
	call 057ffh		;91b9
	ld hl,00006h		;91bc
	ld (0de00h),hl		;91bf
	ret			;91c2
L_91C3:
	ld hl,0e310h		;91c3
	dec (hl)			;91c6
	ret nz			;91c7
	xor a			;91c8
	ld (0e30fh),a		;91c9
	call 0632fh		;91cc
	call L_8860		;91cf
	jp 069e9h		;91d2
L_91D5:
	ld a,(0e1e2h)		;91d5
	ld b,a			;91d8
	ld a,(0e1d3h)		;91d9
	ld (0e1e2h),a		;91dc
	cp b			;91df
	ret z			;91e0
	jp 056b1h		;91e1
L_91E4:
	call 04bc5h		;91e4
	call 0539dh		;91e7
	call 053cch		;91ea
	call 0b47bh		;91ed
	call L_9CE6		;91f0
	call 05c7dh		;91f3
	call 05d1ah		;91f6
	call 04bb8h		;91f9
	ld a,040h		;91fc
	ld (0e339h),a		;91fe
	ld a,002h		;9201
	ld (0e1cfh),a		;9203
	ld a,00bh		;9206
	ld (0ece5h),a		;9208
	dec a			;920b
	ld (0ed04h),a		;920c
	xor a			;920f
	ld (0edd4h),a		;9210
	ld (0e33eh),a		;9213
	ld (0ed08h),a		;9216
	ld (0edc6h),a		;9219
	ld (0edd7h),a		;921c
	ld (0e19dh),a		;921f
	ld (0e19fh),a		;9222
	jp L_917C		;9225
L_9228:
	ld a,(0de03h)		;9228
	rra			;922b
	jr nc,L_923A		;922c
	call 0b3deh		;922e
	call L_8B0E		;9231
	call 0afc8h		;9234
	jp 06ac1h		;9237
L_923A:
	ld hl,0ed0eh		;923a
	inc (hl)			;923d
	call 05ff7h		;923e
	ld a,(0e19ah)		;9241
	cp 003h		;9244
	jp nc,L_9311		;9246
	call 05d11h		;9249
	ld a,(0eddeh)		;924c
	and 001h		;924f
	jr nz,L_9293		;9251
	ld hl,0e23ch		;9253
	ld de,00010h		;9256
	ld b,004h		;9259
L_925B:
	ld a,(hl)			;925b
	or a			;925c
	jr nz,L_9264		;925d
	add hl,de			;925f
	djnz L_925B		;9260
	jr L_9293		;9262
L_9264:
	ld hl,0e23ch		;9264
	ld de,00010h		;9267
	ld b,004h		;926a
L_926C:
	ld a,(hl)			;926c
	or a			;926d
	jr z,L_9274		;926e
	bit 6,a		;9270
	jr z,L_92E7		;9272
L_9274:
	add hl,de			;9274
	djnz L_926C		;9275
	ld a,(0e33ch)		;9277
	or a			;927a
	jr z,L_92E7		;927b
	ld hl,0e271h		;927d
	ld de,00010h		;9280
	ld bc,00930h		;9283
L_9286:
	ld a,(hl)			;9286
	and 0f0h		;9287
	cp c			;9289
	jr z,L_92E7		;928a
	dec a			;928c
	cp c			;928d
	jr z,L_92E7		;928e
	add hl,de			;9290
	djnz L_9286		;9291
L_9293:
	ld hl,0e339h		;9293
	dec (hl)			;9296
	jr nz,L_92EC		;9297
	ld a,(0ed02h)		;9299
	or a			;929c
	jr z,L_92BC		;929d
	ld b,004h		;929f
	ld ix,0e231h		;92a1
L_92A5:
	ld a,(ix+000h)		;92a5
	or a			;92a8
	jr z,L_92B5		;92a9
	ld a,(ix+00bh)		;92ab
	and 007h		;92ae
	cp 005h		;92b0
	call z,L_8F96		;92b2
L_92B5:
	ld de,00010h		;92b5
	add ix,de		;92b8
	djnz L_92A5		;92ba
L_92BC:
	call L_930B		;92bc
	ld a,(0eddeh)		;92bf
	and 001h		;92c2
	ret z			;92c4
	ld de,0e231h		;92c5
	ld hl,0ec98h		;92c8
	ld bc,00040h		;92cb
	ldir		;92ce
	ld de,0e194h		;92d0
	ld hl,0ecdch		;92d3
	ld bc,00004h		;92d6
	ldir		;92d9
	ld de,0e311h		;92db
	ld hl,0eda2h		;92de
	ld bc,00020h		;92e1
	ldir		;92e4
	ret			;92e6
L_92E7:
	ld hl,0e339h		;92e7
	ld (hl),040h		;92ea
L_92EC:
	ld a,(0e33bh)		;92ec
	and 003h		;92ef
	jr nz,L_931C		;92f1
	call 05c7dh		;92f3
	call L_98FC		;92f6
	call L_9744		;92f9
	call 05d08h		;92fc
	call 074f6h		;92ff
	call 05b1fh		;9302
	call 05c77h		;9305
	jp 0b29ch		;9308
L_930B:
	ld hl,0e1a1h		;930b
	ld (hl),000h		;930e
	ret			;9310
L_9311:
	ld hl,0de04h		;9311
	ld (hl),080h		;9314
	ld hl,0e1a1h		;9316
	ld (hl),006h		;9319
	ret			;931b
L_931C:
	push af			;931c
	call 062f7h		;931d
	pop af			;9320
	cp 002h		;9321
	jr z,L_9366		;9323
	ld hl,0ed17h		;9325
	ld de,0ed15h		;9328
	ld a,(0e19bh)		;932b
	rra			;932e
	jr nc,L_9333		;932f
	inc hl			;9331
	inc de			;9332
L_9333:
	ld a,(hl)			;9333
	add a,001h		;9334
	daa			;9336
	ld (hl),a			;9337
	ld a,(de)			;9338
	add a,001h		;9339
	daa			;933b
	ld (de),a			;933c
	xor a			;933d
	ld (0e339h),a		;933e
	ld (0ed22h),a		;9341
	ld a,004h		;9344
	ld (0e1a1h),a		;9346
	ld a,018h		;9349
	ld (0de04h),a		;934b
	call L_9386		;934e
	ld (0ed21h),a		;9351
	ld (0edc2h),a		;9354
	ld a,02ch		;9357
	call 057ffh		;9359
	ld a,01eh		;935c
	call 057ffh		;935e
	ld a,03fh		;9361
	jp 057ffh		;9363
L_9366:
	xor a			;9366
	ld (0ed23h),a		;9367
	ld a,005h		;936a
	ld (0e1a1h),a		;936c
	ld de,0e194h		;936f
	ld hl,0ecdch		;9372
	ld bc,00004h		;9375
	ldir		;9378
	ld de,0e311h		;937a
	ld hl,0eda2h		;937d
	ld bc,00020h		;9380
	ldir		;9383
	ret			;9385
L_9386:
	ld hl,0e231h		;9386
	ld de,00010h		;9389
	ld bc,00400h		;938c
L_938F:
	ld a,(hl)			;938f
	or a			;9390
	jr z,L_9394		;9391
	inc c			;9393
L_9394:
	add hl,de			;9394
	djnz L_938F		;9395
	ld a,c			;9397
	ld de,0e232h		;9398
	ld hl,0e231h		;939b
	ld (hl),000h		;939e
	ld bc,0003fh		;93a0
	ldir		;93a3
	ret			;93a5
L_93A6:
	call 06786h		;93a6
	ld a,(0e33bh)		;93a9
	or a			;93ac
	ret nz			;93ad
	xor a			;93ae
	ld (0e1a1h),a		;93af
	ret			;93b2
L_93B3:
	call 05c77h		;93b3
	call 05b1fh		;93b6
	call L_98FC		;93b9
	ld hl,(0e21dh)		;93bc
	ld a,h			;93bf
	or l			;93c0
	call z,L_93EB		;93c1
	ld a,(0ed7ah)		;93c4
	ld b,a			;93c7
	djnz L_93D9		;93c8
	ld hl,0de04h		;93ca
	dec (hl)			;93cd
	ret nz			;93ce
	xor a			;93cf
	ld (0e33bh),a		;93d0
	ld (0ed7ah),a		;93d3
	jp L_930B		;93d6
L_93D9:
	call 0b4c1h		;93d9
	ld a,(0ed21h)		;93dc
	or a			;93df
	ret nz			;93e0
	ld a,0c0h		;93e1
	ld (0de04h),a		;93e3
	ld hl,0ed7ah		;93e6
	inc (hl)			;93e9
	ret			;93ea
L_93EB:
	xor a			;93eb
	ld (0e302h),a		;93ec
	ret			;93ef
L_93F0:
	push de			;93f0
	push hl			;93f1
	ld de,0fff3h		;93f2
	add hl,de			;93f5
	ld (hl),000h		;93f6
	pop hl			;93f8
	pop de			;93f9
	ld hl,0e340h		;93fa
	inc (hl)			;93fd
	ret			;93fe
L_93FF:
	push de			;93ff
	push hl			;9400
	ld de,0fff5h		;9401
	add hl,de			;9404
	ld (hl),0f1h		;9405
	pop hl			;9407
	pop de			;9408
	ret			;9409
L_940A:
	ld hl,0de04h		;940a
	ld a,(hl)			;940d
	or a			;940e
	jr z,L_946E		;940f
	dec (hl)			;9411
	ret nz			;9412
	ld a,(0e19bh)		;9413
	rra			;9416
	jr nc,L_9428		;9417
	ld hl,0e194h		;9419
	ld a,(hl)			;941c
	inc hl			;941d
	inc hl			;941e
	sub (hl)			;941f
	jr nc,L_9424		;9420
	neg		;9422
L_9424:
	cp 010h		;9424
	jr nc,L_9445		;9426
L_9428:
	ld a,(0e19bh)		;9428
	ld b,a			;942b
	cp 010h		;942c
	jr c,L_944B		;942e
	ld a,b			;9430
	rra			;9431
	ld hl,0e194h		;9432
	ld a,(hl)			;9435
	inc hl			;9436
	inc hl			;9437
	jr c,L_9442		;9438
	cp (hl)			;943a
	jr nc,L_944B		;943b
	call 066e3h		;943d
	jr L_9445		;9440
L_9442:
	cp (hl)			;9442
	jr z,L_944B		;9443
L_9445:
	ld a,001h		;9445
	ld (0ed87h),a		;9447
	ret			;944a
L_944B:
	ld a,001h		;944b
	ld (0eddbh),a		;944d
	ld hl,0eca3h		;9450
	ld de,00010h		;9453
	ld b,004h		;9456
L_9458:
	ld a,(hl)			;9458
	or a			;9459
	jr nz,L_9466		;945a
	add hl,de			;945c
	djnz L_9458		;945d
	ld a,041h		;945f
	call 057ffh		;9461
	jr L_946B		;9464
L_9466:
	ld a,040h		;9466
	call 057ffh		;9468
L_946B:
	jp 0668fh		;946b
L_946E:
	call 066b3h		;946e
	ld a,(0e1d1h)		;9471
	rra			;9474
	ret nc			;9475
	ld c,001h		;9476
	call 0b072h		;9478
	call nc,062f7h		;947b
	ld hl,0e19bh		;947e
	inc (hl)			;9481
	ld a,(hl)			;9482
	cp 0c8h		;9483
	jr nz,L_9489		;9485
	xor a			;9487
	ld (hl),a			;9488
L_9489:
	ld a,001h		;9489
	ld (0eddah),a		;948b
	call L_838C		;948e
	ld a,(0e19bh)		;9491
	rra			;9494
	ld hl,0ed84h		;9495
	jr c,L_949B		;9498
	inc hl			;949a
L_949B:
	ld a,(hl)			;949b
	or a			;949c
	jr z,L_94A8		;949d
	ld a,008h		;949f
	ld (0de00h),a		;94a1
	xor a			;94a4
	ld (0e1a1h),a		;94a5
L_94A8:
	ld a,001h		;94a8
	ld (0e1cbh),a		;94aa
	xor a			;94ad
	ld hl,0e231h		;94ae
	ld de,0e232h		;94b1
	ld bc,00040h		;94b4
	ld (hl),a			;94b7
	ldir		;94b8
	ld hl,0e198h		;94ba
	ld (hl),a			;94bd
	inc hl			;94be
	ld (hl),a			;94bf
	inc hl			;94c0
	ld (hl),a			;94c1
	inc hl			;94c2
	ld hl,0e1a1h		;94c3
	ld (hl),a			;94c6
	ld a,(0e19bh)		;94c7
	rra			;94ca
	call nc,06754h		;94cb
	ld a,(0e19bh)		;94ce
	cp 00ch		;94d1
	jr z,L_94E3		;94d3
	cp 00dh		;94d5
	jr z,L_94ED		;94d7
	rra			;94d9
	ld a,033h		;94da
	jr nc,L_94E0		;94dc
	ld a,037h		;94de
L_94E0:
	jp 057ffh		;94e0
L_94E3:
	ld a,03bh		;94e3
	call 057ffh		;94e5
	ld a,021h		;94e8
	jp 057ffh		;94ea
L_94ED:
	ld a,03ch		;94ed
	call 057ffh		;94ef
	ld a,021h		;94f2
	jp 057ffh		;94f4
L_94F7:
	ld a,(0edd0h)		;94f7
	or a			;94fa
	jr nz,L_9541		;94fb
	ld a,(0de02h)		;94fd
	bit 3,a		;9500
	jr z,L_9512		;9502
	ld a,007h		;9504
	call 00141h		;9506   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	and 001h		;9509
	jr nz,L_9512		;950b
	ld a,001h		;950d
	ld (0eda1h),a		;950f
L_9512:
	ld a,(0de02h)		;9512
	bit 3,a		;9515
	ret nz			;9517
	ld hl,(0de06h)		;9518
	ld de,(0de08h)		;951b
	ld a,(0e19bh)		;951f
	rra			;9522
	jr c,L_9533		;9523
	ld (0e19ch),hl		;9525
	ld hl,0de02h		;9528
	bit 5,(hl)		;952b
	ret z			;952d
	ld (0e19eh),de		;952e
	ret			;9532
L_9533:
	ld (0e19eh),hl		;9533
	ld hl,0de02h		;9536
	bit 5,(hl)		;9539
	ret z			;953b
	ld (0e19ch),de		;953c
	ret			;9540
L_9541:
	ld hl,(0de06h)		;9541
	ld a,(0e19bh)		;9544
	rra			;9547
	jr c,L_954E		;9548
	ld (0e19eh),hl		;954a
	ret			;954d
L_954E:
	ld (0e19ch),hl		;954e
	ret			;9551
L_9552:
	ld hl,0e23ch		;9552
	ld de,00010h		;9555
	ld b,004h		;9558
L_955A:
	ld a,(hl)			;955a
	or a			;955b
	jr z,L_9561		;955c
	and 040h		;955e
	ret z			;9560
L_9561:
	add hl,de			;9561
	djnz L_955A		;9562
	scf			;9564
	ret			;9565
L_9566:
	ld a,(0e337h)		;9566
	or a			;9569
	ret nz			;956a
	ld a,(0e19fh)		;956b
	ld c,a			;956e
	and 020h		;956f
	ret z			;9571
	ld a,c			;9572
	and 003h		;9573
	ld hl,0e231h		;9575
	ld de,00010h		;9578
	ld b,004h		;957b
L_957D:
	ld a,(hl)			;957d
	or a			;957e
	jr nz,L_9585		;957f
	add hl,de			;9581
	djnz L_957D		;9582
	ret			;9584
L_9585:
	ld a,(0eddeh)		;9585
	or a			;9588
	ret nz			;9589
	ld a,001h		;958a
	ld (0ed3fh),a		;958c
	inc a			;958f
	ld (0e1a1h),a		;9590
	ret			;9593
L_9594:
	ld c,042h		;9594
	call 0b06eh		;9596
	call nc,L_988A		;9599
	ld c,043h		;959c
	call 0b06eh		;959e
	call nc,L_98A4		;95a1
	ld c,044h		;95a4
	call 0b06eh		;95a6
	ret c			;95a9
	jp L_9897		;95aa
L_95AD:
	ld hl,0e1cch		;95ad
	ld (hl),000h		;95b0
	inc hl			;95b2
	ld (hl),010h		;95b3
	xor a			;95b5
	ld (0ecebh),a		;95b6
	ret			;95b9
L_95BA:
	ld a,(0e1cch)		;95ba
	call 04220h		;95bd

; ----------------------------------------------------------------------
; DATOS tabla_95C0: 4 destinos del despachador p00:4220 (call en p02:95BD, el
;   indice en A): 95C8, 9625, 96A8, 9743; lo leen p02:95BD (8 bytes)
;   0x95c0..0x95c8  (8 bytes)
DATA_tabla_95C0:
	defw 095c8h,09625h,096a8h,09743h	; 95c0  -> L_95C8 L_9625 L_96A8 L_9743

; ======================================================================
; CODIGO 0x95c8..0x97e5  (541 bytes)
; ======================================================================


L_95C8:
	ld hl,0e1cdh		;95c8
	dec (hl)			;95cb
	jr nz,L_95D1		;95cc
	dec hl			;95ce
	inc (hl)			;95cf
	ret			;95d0
L_95D1:
	ld c,042h		;95d1
	call 0b06eh		;95d3
	call nc,L_9600		;95d6
	ld c,043h		;95d9
	call 0b06eh		;95db
	call nc,L_960D		;95de
	ld c,044h		;95e1
	call 0b06eh		;95e3
	ret c			;95e6
	ld a,(0de03h)		;95e7
	and 008h		;95ea
	ld c,a			;95ec
	ld hl,0e178h		;95ed
	ld b,002h		;95f0
L_95F2:
	inc (hl)			;95f2
	inc hl			;95f3
	inc (hl)			;95f4
	inc hl			;95f5
	ld a,(hl)			;95f6
	and 0f7h		;95f7
	or c			;95f9
	ld (hl),a			;95fa
	inc hl			;95fb
	inc hl			;95fc
	djnz L_95F2		;95fd
	ret			;95ff
L_9600:
	ld a,(0de03h)		;9600
	and 008h		;9603
	ld c,a			;9605
	ld b,002h		;9606
	ld hl,0e169h		;9608
	jr L_9618		;960b
L_960D:
	ld a,(0de03h)		;960d
	and 008h		;9610
	ld c,a			;9612
	ld b,002h		;9613
	ld hl,0e171h		;9615
L_9618:
	dec (hl)			;9618
	inc hl			;9619
	ld a,(hl)			;961a
	and 0f7h		;961b
	or c			;961d
	ld (hl),a			;961e
	inc hl			;961f
	inc hl			;9620
	inc hl			;9621
	djnz L_9618		;9622
	ret			;9624
L_9625:
	ld hl,0e231h		;9625
	ld de,00010h		;9628
	ld b,004h		;962b
L_962D:
	ld a,(hl)			;962d
	or a			;962e
	jr nz,L_9635		;962f
	add hl,de			;9631
	djnz L_962D		;9632
	ret			;9634
L_9635:
	ld a,(0eddeh)		;9635
	or a			;9638
	ret nz			;9639
	ld a,(0e19dh)		;963a
	ld b,a			;963d
	and 020h		;963e
	ret z			;9640
	ld a,b			;9641
	and 00fh		;9642
	ret z			;9644
	ld a,(0e1d1h)		;9645
	or a			;9648
	ret z			;9649
	ld a,025h		;964a
	call 057ffh		;964c
	ld a,001h		;964f
	ld (0ecebh),a		;9651
	call L_96A3		;9654
	ld hl,0e1cdh		;9657
	ld a,b			;965a
	ld b,001h		;965b
	rra			;965d
	push af			;965e
	push hl			;965f
	call c,L_9693		;9660
	pop hl			;9663
	pop af			;9664
	ld b,004h		;9665
	rra			;9667
	push af			;9668
	push hl			;9669
	call c,L_9683		;966a
	pop hl			;966d
	pop af			;966e
	rra			;966f
	ret nc			;9670
	ld b,002h		;9671
	ld a,b			;9673
	or (hl)			;9674
	ld (hl),a			;9675
	ld hl,0e172h		;9676
	ld (hl),0d0h		;9679
	ld hl,0e176h		;967b
	ld (hl),0d4h		;967e
	jp 053f4h		;9680
L_9683:
	ld a,b			;9683
	or (hl)			;9684
	ld (hl),a			;9685
	ld hl,0e17ah		;9686
	ld (hl),0e0h		;9689
	ld hl,0e17eh		;968b
	ld (hl),0e4h		;968e
	jp 05403h		;9690
L_9693:
	ld a,b			;9693
	or (hl)			;9694
	ld (hl),a			;9695
	ld hl,0e16ah		;9696
	ld (hl),0c0h		;9699
	ld hl,0e16eh		;969b
	ld (hl),0c4h		;969e
	jp 053e7h		;96a0
L_96A3:
	ld hl,0e1cch		;96a3
	inc (hl)			;96a6
	ret			;96a7
L_96A8:
	ld a,(0e1cdh)		;96a8
	or a			;96ab
	jr z,L_96A3		;96ac
	rra			;96ae
	push af			;96af
	call c,L_9708		;96b0
	pop af			;96b3
	rra			;96b4
	push af			;96b5
	call c,L_96E3		;96b6
	pop af			;96b9
	rra			;96ba
	ret nc			;96bb
	ld a,(0de03h)		;96bc
	and 008h		;96bf
	ld c,a			;96c1
	ld hl,0e178h		;96c2
	ld b,002h		;96c5
L_96C7:
	inc (hl)			;96c7
	inc hl			;96c8
	inc (hl)			;96c9
	inc hl			;96ca
	ld a,(hl)			;96cb
	and 0f7h		;96cc
	or c			;96ce
	ld (hl),a			;96cf
	inc hl			;96d0
	inc hl			;96d1
	djnz L_96C7		;96d2
	ld de,0e178h		;96d4
	ld a,(de)			;96d7
	cp 048h		;96d8
	ret c			;96da
	ld hl,0e1cch		;96db
	res 2,(hl)		;96de
	inc de			;96e0
	jr L_972B		;96e1
L_96E3:
	ld a,(0de03h)		;96e3
	and 008h		;96e6
	ld c,a			;96e8
	ld b,002h		;96e9
	ld hl,0e171h		;96eb
L_96EE:
	dec (hl)			;96ee
	inc hl			;96ef
	ld a,(hl)			;96f0
	and 0f7h		;96f1
	or c			;96f3
	ld (hl),a			;96f4
	inc hl			;96f5
	inc hl			;96f6
	inc hl			;96f7
	djnz L_96EE		;96f8
	ld de,0e171h		;96fa
	ld a,(de)			;96fd
	cp 040h		;96fe
	ret nc			;9700
	ld hl,0e1cch		;9701
	res 1,(hl)		;9704
	jr L_972B		;9706
L_9708:
	ld a,(0de03h)		;9708
	and 008h		;970b
	ld c,a			;970d
	ld b,002h		;970e
	ld hl,0e169h		;9710
L_9713:
	dec (hl)			;9713
	inc hl			;9714
	ld a,(hl)			;9715
	and 0f7h		;9716
	or c			;9718
	ld (hl),a			;9719
	inc hl			;971a
	inc hl			;971b
	inc hl			;971c
	djnz L_9713		;971d
	ld de,0e169h		;971f
	ld a,(de)			;9722
	cp 0b4h		;9723
	ret nc			;9725
	ld hl,0e1cch		;9726
	res 0,(hl)		;9729
L_972B:
	inc de			;972b
	inc de			;972c
	xor a			;972d
	ld (de),a			;972e
	inc de			;972f
	inc de			;9730
	inc de			;9731
	inc de			;9732
	ld (de),a			;9733
	ld a,(0e337h)		;9734
	or a			;9737
	ret nz			;9738
	ld a,(0eddeh)		;9739
	or a			;973c
	ret nz			;973d
	ld a,002h		;973e
	ld (0e1a1h),a		;9740
L_9743:
	ret			;9743
L_9744:
	ld hl,0e1a2h		;9744
	ld c,(hl)			;9747
	inc hl			;9748
	ld b,(hl)			;9749
	ld a,(0e1a6h)		;974a
	dec a			;974d
	jr nz,L_975D		;974e
	ld a,b			;9750
	or a			;9751
	ld a,c			;9752
	jr nz,L_975A		;9753
	cp 080h		;9755
	ret nc			;9757
	jr L_975D		;9758
L_975A:
	cp 020h		;975a
	ret c			;975c
L_975D:
	ld a,c			;975d
	add a,010h		;975e
	ld (0ed06h),a		;9760
	call L_97B8		;9763
	ld a,0ffh		;9766
	ld (0ed07h),a		;9768
	ld ix,0e231h		;976b
	ld b,004h		;976f
L_9771:
	ld a,(ix+00bh)		;9771
	bit 6,a		;9774
	jr z,L_977D		;9776
	call L_978A		;9778
	jr L_9782		;977b
L_977D:
	push bc			;977d
	call L_97DD		;977e
	pop bc			;9781
L_9782:
	ld de,00010h		;9782
	add ix,de		;9785
	djnz L_9771		;9787
	ret			;9789
L_978A:
	push bc			;978a
	and 00fh		;978b
	sub 002h		;978d
	add a,a			;978f
	ld de,098dch		;9790
	call 0421bh		;9793
	ld a,(de)			;9796
	cp 0d8h		;9797
	jr nz,L_979C		;9799
	inc a			;979b
L_979C:
	ld c,a			;979c
	inc de			;979d
	ld a,(de)			;979e
	ld b,a			;979f
	ld d,0dch		;97a0
	ld e,00ah		;97a2
	ld hl,0ed07h		;97a4
	inc (hl)			;97a7
	ld l,(hl)			;97a8
	ld h,000h		;97a9
	add hl,hl			;97ab
	add hl,hl			;97ac
	push bc			;97ad
	ld bc,0e158h		;97ae
	add hl,bc			;97b1
	pop bc			;97b2
	call L_9878		;97b3
	pop bc			;97b6
	ret			;97b7
L_97B8:
	ld hl,0e168h		;97b8
	ld de,098cah		;97bb
	ld b,006h		;97be
	ld a,(0ed06h)		;97c0
	ld c,a			;97c3
L_97C4:
	ld a,(de)			;97c4
	inc de			;97c5
	add a,c			;97c6
	cp 0d8h		;97c7
	jr nz,L_97CC		;97c9
	inc a			;97cb
L_97CC:
	ld (hl),a			;97cc
	inc hl			;97cd
	ld a,(de)			;97ce
	inc de			;97cf
	ld (hl),a			;97d0
	inc hl			;97d1
	ld a,(de)			;97d2
	inc de			;97d3
	ld (hl),a			;97d4
	inc hl			;97d5
	ld a,00dh		;97d6
	ld (hl),a			;97d8
	inc hl			;97d9
	djnz L_97C4		;97da
	ret			;97dc
L_97DD:
	ld a,(ix+00bh)		;97dd
	and 00fh		;97e0
	call 04220h		;97e2

; ----------------------------------------------------------------------
; DATOS tabla_97E5: 6 destinos del despachador p00:4220 (call en p02:97E2, el
;   indice en A): 97F1, 97F2, 9815, 9834, 9855, 97F1; lo leen p02:97E2 (12
;   bytes)
;   0x97e5..0x97f1  (12 bytes)
DATA_tabla_97E5:
	defw 097f1h,097f2h,09815h,09834h,09855h,097f1h	; 97e5

; ======================================================================
; CODIGO 0x97f1..0x98ca  (217 bytes)
; ======================================================================


L_97F1:
	ret			;97f1
L_97F2:
	ld a,(ix+002h)		;97f2
	sub 040h		;97f5
	ld b,00ch		;97f7
	ld c,000h		;97f9
	ld d,006h		;97fb
L_97FD:
	inc c			;97fd
	sub d			;97fe
	jr c,L_9803		;97ff
	djnz L_97FD		;9801
L_9803:
	ld a,c			;9803
	add a,a			;9804
	ld b,a			;9805
	ld a,c			;9806
	add a,008h		;9807
	ld c,a			;9809
	ld a,b			;980a
	neg		;980b
	add a,0f0h		;980d
	ld b,a			;980f
	ld hl,0e158h		;9810
	jr L_9874		;9813
L_9815:
	ld a,(ix+002h)		;9815
	ld b,00bh		;9818
	ld c,000h		;981a
	ld d,005h		;981c
L_981E:
	inc c			;981e
	sub d			;981f
	jr c,L_9824		;9820
	djnz L_981E		;9822
L_9824:
	ld a,c			;9824
	add a,a			;9825
	ld b,a			;9826
	ld a,c			;9827
	add a,0fbh		;9828
	ld c,a			;982a
	ld a,b			;982b
	add a,0d6h		;982c
	ld b,a			;982e
	ld hl,0e15ch		;982f
	jr L_9874		;9832
L_9834:
	ld a,(ix+002h)		;9834
	ld b,00bh		;9837
	ld c,000h		;9839
	ld d,005h		;983b
L_983D:
	inc c			;983d
	sub d			;983e
	jr c,L_9843		;983f
	djnz L_983D		;9841
L_9843:
	ld a,c			;9843
	add a,a			;9844
	ld b,a			;9845
	ld a,c			;9846
	add a,0fbh		;9847
	ld c,a			;9849
	ld a,b			;984a
	neg		;984b
	add a,0dch		;984d
	ld b,a			;984f
	ld hl,0e160h		;9850
	jr L_9874		;9853
L_9855:
	ld a,(ix+002h)		;9855
	sub 040h		;9858
	ld b,00bh		;985a
	ld c,000h		;985c
	ld d,006h		;985e
L_9860:
	inc c			;9860
	sub d			;9861
	jr c,L_9866		;9862
	djnz L_9860		;9864
L_9866:
	ld a,c			;9866
	add a,a			;9867
	ld b,a			;9868
	ld a,c			;9869
	add a,005h		;986a
	ld c,a			;986c
	ld a,b			;986d
	add a,0c0h		;986e
	ld b,a			;9870
	ld hl,0e164h		;9871
L_9874:
	ld d,0dch		;9874
	ld e,00ah		;9876
L_9878:
	ld a,(0ed06h)		;9878
	add a,c			;987b
	cp 0d8h		;987c
	jr nz,L_9881		;987e
	inc a			;9880
L_9881:
	ld (hl),a			;9881
	inc hl			;9882
	ld (hl),b			;9883
	inc hl			;9884
	ld (hl),d			;9885
	inc hl			;9886
	ld (hl),e			;9887
	inc hl			;9888
	ret			;9889
L_988A:
	ld de,0e168h		;988a
	ld hl,098ech		;988d
	ld bc,00007h		;9890
	ldir		;9893
	jr L_98AF		;9895
L_9897:
	ld de,0e178h		;9897
	ld hl,098f4h		;989a
	ld bc,00007h		;989d
	ldir		;98a0
	jr L_98AF		;98a2
L_98A4:
	ld de,0e170h		;98a4
	ld hl,098e4h		;98a7
	ld bc,00007h		;98aa
	ldir		;98ad
L_98AF:
	ld a,(0edd0h)		;98af
	or a			;98b2
	ld a,(0e19bh)		;98b3
	jr z,L_98C1		;98b6
	rra			;98b8
	ld a,01bh		;98b9
	jr c,L_98C8		;98bb
	ld a,018h		;98bd
	jr L_98C8		;98bf
L_98C1:
	rra			;98c1
	ld a,01bh		;98c2
	jr nc,L_98C8		;98c4
	ld a,018h		;98c6
L_98C8:
	ld (de),a			;98c8
	ret			;98c9

; ----------------------------------------------------------------------
; DATOS sin identificar  0x98ca..0x98fc  (50 bytes)
DATA_98CA:
	defb 000h,0c8h,0c4h,000h,0d8h,0c8h,000h,0e8h,0cch,010h,0c8h,0d0h,010h,0d8h,0d4h,010h	; 98ca  ................
	defb 0e8h,0d8h,007h,0ech,0fch,0d8h,007h,0c4h,011h,0d8h,048h,070h,0d0h,007h,048h,070h	; 98da  ..........Hp..Hp
	defb 0d4h,01bh,024h,0d8h,0c0h,007h,024h,0d8h,0c4h,01bh,024h,010h,0e0h,007h,024h,010h	; 98ea  ..$...$...$...$.
	defb 0e4h,01bh	; 98fa

; ======================================================================
; CODIGO 0x98fc..0x9918  (28 bytes)
; ======================================================================


L_98FC:
	call L_9912		;98fc
	call 05cedh		;98ff
	ld a,(0e33bh)		;9902
	or a			;9905
	call z,0ad60h		;9906
	call L_9A21		;9909
	call L_9A62		;990c
	jp L_9AF6		;990f
L_9912:
	ld a,(0e211h)		;9912
	call 04220h		;9915

; ----------------------------------------------------------------------
; DATOS tabla_9918: 4 destinos del despachador p00:4220 (call en p02:9915, el
;   indice en A): 9920, 9B9E, 9BA8, 9BA9; lo leen p02:9915 (8 bytes)
;   0x9918..0x9920  (8 bytes)
DATA_tabla_9918:
	defw 09920h,09b9eh,09ba8h,09ba9h	; 9918  -> L_9920 L_9B9E L_9BA8 L_9BA9

; ======================================================================
; CODIGO 0x9920..0x9ea5  (1413 bytes)
; ======================================================================


L_9920:
	call L_9C20		;9920
	ld hl,0e21fh		;9923
	ld a,(hl)			;9926
	cp 0ffh		;9927
	jr z,L_992C		;9929
	inc (hl)			;992b
L_992C:
	ld d,a			;992c
	ld e,000h		;992d
	ld b,003h		;992f
L_9931:
	srl d		;9931
	rr e		;9933
	djnz L_9931		;9935
	ld hl,(0e226h)		;9937
	ld a,h			;993a
	or l			;993b
	jr z,L_9959		;993c
	sbc hl,de		;993e
	sra h		;9940
	rr l		;9942
	call L_99C7		;9944
	bit 7,d		;9947
	call nz,L_9A16		;9949
	call L_9C9E		;994c
	ld (0e21ch),hl		;994f
	call L_99FA		;9952
	call L_99DF		;9955
	ret nz			;9958
L_9959:
	xor a			;9959
	ld (0eff4h),a		;995a
	ld a,(0e33bh)		;995d
	ld hl,0eddeh		;9960
	or (hl)			;9963
	ld a,00bh		;9964
	call z,057ffh		;9966
	ld a,(0ec73h)		;9969
	cp 002h		;996c
	jr nz,L_997A		;996e
	xor a			;9970
	ld (0e302h),a		;9971
	ld a,002h		;9974
	ld (0e211h),a		;9976
	ret			;9979
L_997A:
	ld a,001h		;997a
	ld (0e21fh),a		;997c
	call L_99E9		;997f
	call L_99BE		;9982
	ld a,(hl)			;9985
	dec a			;9986
	call z,L_9BE6		;9987
	ld hl,(0e226h)		;998a
	ld a,h			;998d
	or a			;998e
	jr z,L_99B5		;998f
	srl h		;9991
	rr l		;9993
	srl h		;9995
	rr l		;9997
	push hl			;9999
	srl h		;999a
	rr l		;999c
	pop de			;999e
	add hl,de			;999f
	ld (0e226h),hl		;99a0
	ret			;99a3
L_99A4:
	ld hl,00000h		;99a4
	ld (0e226h),hl		;99a7
	ld (0e21ch),hl		;99aa
	ld (0e21dh),hl		;99ad
	ld hl,0e211h		;99b0
	inc (hl)			;99b3
	ret			;99b4
L_99B5:
	ld a,l			;99b5
	sub 060h		;99b6
	jr c,L_99A4		;99b8
	ld (0e226h),a		;99ba
	ret			;99bd
L_99BE:
	ld hl,0e1d0h		;99be
	ld a,(hl)			;99c1
	cp 0ffh		;99c2
	ret z			;99c4
	inc (hl)			;99c5
	ret			;99c6
L_99C7:
	ld d,h			;99c7
	ld e,l			;99c8
	bit 7,h		;99c9
	jr nz,L_99D6		;99cb
	ld bc,0fa00h		;99cd
	add hl,bc			;99d0
	ret nc			;99d1
	ld de,00600h		;99d2
	ret			;99d5
L_99D6:
	ld bc,00600h		;99d6
	add hl,bc			;99d9
	ret c			;99da
	ld de,0fa00h		;99db
	ret			;99de
L_99DF:
	xor a			;99df
	ld hl,0e21ch		;99e0
	or (hl)			;99e3
	inc hl			;99e4
	or (hl)			;99e5
	inc hl			;99e6
	or (hl)			;99e7
	ret			;99e8
L_99E9:
	ld a,(0e33bh)		;99e9
	or a			;99ec
	ret nz			;99ed
	ld a,(0e214h)		;99ee
	cp 002h		;99f1
	ret nc			;99f3
	ld a,010h		;99f4
	ld (0e22ah),a		;99f6
	ret			;99f9
L_99FA:
	ld a,(0edd2h)		;99fa
	or a			;99fd
	ret nz			;99fe
	ld hl,(0e21dh)		;99ff
	ld de,00070h		;9a02
	or a			;9a05
	sbc hl,de		;9a06
	rl h		;9a08
	ret c			;9a0a
	ld a,022h		;9a0b
	call 057ffh		;9a0d
	ld a,001h		;9a10
	ld (0edd2h),a		;9a12
	ret			;9a15
L_9A16:
	ld a,(0eff4h)		;9a16
	or a			;9a19
	ret z			;9a1a
	ld a,002h		;9a1b
	ld (0eff4h),a		;9a1d
	ret			;9a20
L_9A21:
	ld a,(0e33ch)		;9a21
	or a			;9a24
	jr nz,L_9A58		;9a25
	ld hl,0ed7bh		;9a27
	ld a,(hl)			;9a2a
	or a			;9a2b
	jr z,L_9A34		;9a2c
	xor a			;9a2e
	ld (0ec73h),a		;9a2f
	dec (hl)			;9a32
	ret			;9a33
L_9A34:
	ld hl,0ec73h		;9a34
	ld a,(hl)			;9a37
	dec a			;9a38
	ret nz			;9a39
	call L_9CD5		;9a3a
	call L_99BE		;9a3d
	xor a			;9a40
	ld (0ec73h),a		;9a41
	inc a			;9a44
	ld (0ed32h),a		;9a45
	call L_9BBF		;9a48
	ld hl,0edceh		;9a4b
	ld a,(hl)			;9a4e
	or a			;9a4f
	ret nz			;9a50
	ld (hl),001h		;9a51
	ld a,00ch		;9a53
	jp 057ffh		;9a55
L_9A58:
	ld a,00ch		;9a58
	ld (0ed7bh),a		;9a5a
	xor a			;9a5d
	ld (0edceh),a		;9a5e
	ret			;9a61
L_9A62:
	ld hl,0e22ah		;9a62
	ld a,(hl)			;9a65
	or a			;9a66
	jr z,L_9A73		;9a67
	cp 010h		;9a69
	jr z,L_9A81		;9a6b
	dec (hl)			;9a6d
	ret nz			;9a6e
	xor a			;9a6f
	ld (0e10bh),a		;9a70
L_9A73:
	ld a,(0e1a2h)		;9a73
	add a,0d7h		;9a76
	cp 0d8h		;9a78
	jr nz,L_9A7D		;9a7a
	dec a			;9a7c
L_9A7D:
	ld (0e108h),a		;9a7d
	ret			;9a80
L_9A81:
	dec (hl)			;9a81
	ld hl,0e108h		;9a82
	ld a,(0e213h)		;9a85
	cp 0d8h		;9a88
	jr nz,L_9A8D		;9a8a
	dec a			;9a8c
L_9A8D:
	ld (hl),a			;9a8d
	inc hl			;9a8e
	ld a,(0e22ch)		;9a8f
	ld (hl),a			;9a92
	inc hl			;9a93
	ld (hl),0c0h		;9a94
	inc hl			;9a96
	ld (hl),00fh		;9a97
	ret			;9a99
L_9A9A:
	ld a,(0ed39h)		;9a9a
	ld c,a			;9a9d
	ld hl,(0e213h)		;9a9e
	call L_9AC5		;9aa1
	ld (0e107h),a		;9aa4
	ld a,(0e302h)		;9aa7
	ld c,a			;9aaa
	ld hl,(0e221h)		;9aab
	ld de,(0e21dh)		;9aae
	or a			;9ab2
	sbc hl,de		;9ab3
	ld a,h			;9ab5
	rla			;9ab6
	jr c,L_9AC0		;9ab7
	call L_9AC5		;9ab9
	ld (0e103h),a		;9abc
	ret			;9abf
L_9AC0:
	xor a			;9ac0
	ld (0e103h),a		;9ac1
	ret			;9ac4
L_9AC5:
	ld de,(0e1a2h)		;9ac5
	push hl			;9ac9
	or a			;9aca
	sbc hl,de		;9acb
	rl h		;9acd
	pop hl			;9acf
	jr c,L_9ADE		;9ad0
	ld a,0d4h		;9ad2
	call 0421bh		;9ad4
	or a			;9ad7
	sbc hl,de		;9ad8
	rl h		;9ada
	ld a,c			;9adc
	ret c			;9add
L_9ADE:
	xor a			;9ade
	ret			;9adf
L_9AE0:
	ld a,0bch		;9ae0
	ld (0e106h),a		;9ae2
	ld hl,(0e21dh)		;9ae5
	ld de,0ff80h		;9ae8
	add hl,de			;9aeb
	ld a,0b0h		;9aec
	jr c,L_9AF2		;9aee
	ld a,0b4h		;9af0
L_9AF2:
	ld (0e102h),a		;9af2
	ret			;9af5
L_9AF6:
	call L_9A9A		;9af6
	call L_9AE0		;9af9
	call 074e7h		;9afc
	ex de,hl			;9aff
	ld hl,(0e218h)		;9b00
	or a			;9b03
	sbc hl,de		;9b04
	ld a,l			;9b06
	ld (0e22ch),a		;9b07
	ld h,l			;9b0a
	ld a,(0e213h)		;9b0b
	ld l,a			;9b0e
	call L_9B99		;9b0f
	ld (0e104h),hl		;9b12
	ld a,(0e21dh)		;9b15
	ld b,a			;9b18
	ld a,l			;9b19
	sub b			;9b1a
	ld l,a			;9b1b
	call L_9B99		;9b1c
	ld (0e100h),hl		;9b1f
	call L_9B4B		;9b22
	ret c			;9b25
	ld a,(0eddeh)		;9b26
	rra			;9b29
	jr c,L_9B3A		;9b2a
	ld a,(0e33bh)		;9b2c
	and 003h		;9b2f
	jr nz,L_9B3A		;9b31
	ld a,b			;9b33
	ld (0e1a6h),a		;9b34
	jp 0b4a4h		;9b37
L_9B3A:
	ld hl,00000h		;9b3a
	ld (0e215h),hl		;9b3d
	ld (0e21ah),hl		;9b40
	xor a			;9b43
	ld (0e302h),a		;9b44
	ld (0ed39h),a		;9b47
	ret			;9b4a
L_9B4B:
	ld hl,(0e218h)		;9b4b
	ld b,001h		;9b4e
	ld a,(0e1a6h)		;9b50
	or a			;9b53
	jr z,L_9B77		;9b54
	dec a			;9b56
	jr z,L_9B5E		;9b57
	ld de,0fe7ch		;9b59
	add hl,de			;9b5c
	ret			;9b5d
L_9B5E:
	call L_9B7D		;9b5e
	ret nc			;9b61
	ld b,002h		;9b62
	ld hl,(0e218h)		;9b64
	ld de,0fe4ch		;9b67
	add hl,de			;9b6a
	ccf			;9b6b
	ret nc			;9b6c
	ld b,000h		;9b6d
	ld hl,(0e218h)		;9b6f
	ld de,0ff3ch		;9b72
	add hl,de			;9b75
	ret			;9b76
L_9B77:
	ld de,0ff0ch		;9b77
	add hl,de			;9b7a
	ccf			;9b7b
	ret			;9b7c
L_9B7D:
	ld b,000h		;9b7d
	ld de,0ff10h		;9b7f
	add hl,de			;9b82
	jr nc,L_9B90		;9b83
	ld b,002h		;9b85
	ld hl,(0e218h)		;9b87
	ld de,0fe78h		;9b8a
	add hl,de			;9b8d
	ccf			;9b8e
	ret c			;9b8f
L_9B90:
	ld hl,(0e21dh)		;9b90
	ld de,0ffd0h		;9b93
	add hl,de			;9b96
	ccf			;9b97
	ret			;9b98
L_9B99:
	cp 0d8h		;9b99
	ret nz			;9b9b
	dec l			;9b9c
	ret			;9b9d
L_9B9E:
	ld a,(0ed0eh)		;9b9e
	and 007h		;9ba1
	call z,L_9BE6		;9ba3
	jr L_9C20		;9ba6
L_9BA8:
	ret			;9ba8
L_9BA9:
	call 0b10ch		;9ba9
	ld e,(hl)			;9bac
	inc hl			;9bad
	ld d,(hl)			;9bae
	ld (0e213h),de		;9baf
	ld de,00004h		;9bb3
	add hl,de			;9bb6
	ld e,(hl)			;9bb7
	inc hl			;9bb8
	ld d,(hl)			;9bb9
	ld (0e218h),de		;9bba
	ret			;9bbe
L_9BBF:
	ld hl,(0e215h)		;9bbf
	call L_9BD3		;9bc2
	ld (0e215h),hl		;9bc5
	ld hl,(0e21ah)		;9bc8
	call L_9BD3		;9bcb
	ld (0e21ah),hl		;9bce
	jr L_9BF8		;9bd1
L_9BD3:
	sra h		;9bd3
	rr l		;9bd5
L_9BD7:
	sra h		;9bd7
	rr l		;9bd9
	sra h		;9bdb
	rr l		;9bdd
	sra h		;9bdf
	rr l		;9be1
	jp 05f71h		;9be3
L_9BE6:
	ld hl,(0e21ah)		;9be6
	call L_9C19		;9be9
	ld (0e21ah),hl		;9bec
	ld hl,(0e215h)		;9bef
	call L_9C19		;9bf2
	ld (0e215h),hl		;9bf5
L_9BF8:
	ld hl,(0e215h)		;9bf8
	bit 7,h		;9bfb
	call nz,05f71h		;9bfd
	ld de,(0e21ah)		;9c00
	bit 7,d		;9c04
	call nz,05f79h		;9c06
	add hl,de			;9c09
	ld de,0ffe0h		;9c0a
	add hl,de			;9c0d
	ret c			;9c0e
	ld hl,00000h		;9c0f
	ld (0e215h),hl		;9c12
	ld (0e21ah),hl		;9c15
	ret			;9c18
L_9C19:
	push hl			;9c19
	call L_9BD7		;9c1a
	pop de			;9c1d
	add hl,de			;9c1e
	ret			;9c1f
L_9C20:
	call L_9CC0		;9c20
	ld hl,(0e218h)		;9c23
	ld a,h			;9c26
	or l			;9c27
	ret z			;9c28
	ld de,0fd81h		;9c29
	add hl,de			;9c2c
	ret c			;9c2d
	ld hl,(0e213h)		;9c2e
	ld a,h			;9c31
	cp 003h		;9c32
	ret nc			;9c34
	or l			;9c35
	ret z			;9c36
	call L_9C6D		;9c37
	ld (0e217h),hl		;9c3a
	call L_9C44		;9c3d
	ld (0e212h),hl		;9c40
	ret			;9c43
L_9C44:
	ld hl,(0e212h)		;9c44
	ld de,(0e215h)		;9c47
	bit 7,d		;9c4b
	jr nz,L_9C5C		;9c4d
	add hl,de			;9c4f
	ret nc			;9c50
	ld a,(0e214h)		;9c51
	cp 003h		;9c54
	ret nc			;9c56
	inc a			;9c57
	ld (0e214h),a		;9c58
	ret			;9c5b
L_9C5C:
	add hl,de			;9c5c
	ret c			;9c5d
	ld a,(0e214h)		;9c5e
	or a			;9c61
	jr z,L_9C69		;9c62
	dec a			;9c64
	ld (0e214h),a		;9c65
	ret			;9c68
L_9C69:
	ld hl,00000h		;9c69
	ret			;9c6c
L_9C6D:
	ld hl,(0e217h)		;9c6d
	ld de,(0e21ah)		;9c70
	bit 7,d		;9c74
	jr nz,L_9C8D		;9c76
	add hl,de			;9c78
	ld a,(0e219h)		;9c79
	jr nc,L_9C82		;9c7c
	inc a			;9c7e
	ld (0e219h),a		;9c7f
L_9C82:
	cp 002h		;9c82
	ret nz			;9c84
	ld a,h			;9c85
	cp 080h		;9c86
	ret c			;9c88
	ld hl,07f00h		;9c89
	ret			;9c8c
L_9C8D:
	add hl,de			;9c8d
	ret c			;9c8e
	ld a,(0e219h)		;9c8f
	or a			;9c92
	jr z,L_9C9A		;9c93
	dec a			;9c95
	ld (0e219h),a		;9c96
	ret			;9c99
L_9C9A:
	ld hl,00000h		;9c9a
	ret			;9c9d
L_9C9E:
	ld hl,(0e21ch)		;9c9e
	ld a,d			;9ca1
	rla			;9ca2
	jr c,L_9CAF		;9ca3
	add hl,de			;9ca5
	ret nc			;9ca6
	ld a,(0e21eh)		;9ca7
	inc a			;9caa
	ld (0e21eh),a		;9cab
	ret			;9cae
L_9CAF:
	add hl,de			;9caf
	ret c			;9cb0
	ld a,(0e21eh)		;9cb1
	or a			;9cb4
	jr z,L_9CBC		;9cb5
	dec a			;9cb7
	ld (0e21eh),a		;9cb8
	ret			;9cbb
L_9CBC:
	ld hl,00000h		;9cbc
	ret			;9cbf
L_9CC0:
	ld hl,0e212h		;9cc0
	ld de,0ed51h		;9cc3
	call L_9CCF		;9cc6
	ld hl,0e217h		;9cc9
	ld de,0ed54h		;9ccc
L_9CCF:
	ld bc,00003h		;9ccf
	ldir		;9cd2
	ret			;9cd4
L_9CD5:
	ld de,0e212h		;9cd5
	ld hl,0ed51h		;9cd8
	call L_9CCF		;9cdb
	ld de,0e217h		;9cde
	ld hl,0ed54h		;9ce1
	jr L_9CCF		;9ce4
L_9CE6:
	xor a			;9ce6
	ld (0e21fh),a		;9ce7
	ld (0e22fh),a		;9cea
	ld (0e230h),a		;9ced
	ld (0e211h),a		;9cf0
	ld (0e22ah),a		;9cf3
	ld (0e1d0h),a		;9cf6
	ld (0e33bh),a		;9cf9
	ld (0ec73h),a		;9cfc
	ld (0e19dh),a		;9cff
	ld (0e19fh),a		;9d02
	ld (0e1b1h),a		;9d05
	ld (0e1b5h),a		;9d08
	ld (0edceh),a		;9d0b
	ld (0edd2h),a		;9d0e
	ld hl,00184h		;9d11
	ld (0e213h),hl		;9d14
	ld (0e1a7h),hl		;9d17
	ld (0e1b3h),hl		;9d1a
	ld a,l			;9d1d
	ld (0e1c8h),a		;9d1e
	ld hl,00138h		;9d21
	ld (0e218h),hl		;9d24
	ld hl,00001h		;9d27
	ld (0e21dh),hl		;9d2a
	ld a,00dh		;9d2d
	ld (0e302h),a		;9d2f
	ld a,00fh		;9d32
	ld (0ed39h),a		;9d34
	ld a,(0ed2eh)		;9d37
	cp 002h		;9d3a
	ret c			;9d3c
	ld a,(0e227h)		;9d3d
	cp 002h		;9d40
	ret c			;9d42
	ld a,081h		;9d43
	ld (0eff4h),a		;9d45
	ret			;9d48
L_9D49:
	ld a,(0e304h)		;9d49
	dec a			;9d4c
	jr nz,L_9D5A		;9d4d
	ld hl,0e302h		;9d4f
	dec (hl)			;9d52
	ret nz			;9d53
	ld a,001h		;9d54
	ld (0e1d1h),a		;9d56
	ret			;9d59
L_9D5A:
	call 05c73h		;9d5a
	call 0a463h		;9d5d
	call L_85AB		;9d60
	call L_9D7A		;9d63
	call L_9E07		;9d66
	ld a,(0e30ah)		;9d69
	cp 003h		;9d6c
	ret nz			;9d6e
	ld a,001h		;9d6f
	ld (0e304h),a		;9d71
	ld a,030h		;9d74
	ld (0e302h),a		;9d76
	ret			;9d79
L_9D7A:
	ld a,(0e30ah)		;9d7a
	rra			;9d7d
	ret c			;9d7e
	ld a,(0e19ch)		;9d7f
	ld c,a			;9d82
	and 010h		;9d83
	jr nz,L_9DBF		;9d85
	ld hl,0ecech		;9d87
	ld a,c			;9d8a
	ld b,0ffh		;9d8b
	rra			;9d8d
	jr c,L_9D98		;9d8e
	ld b,001h		;9d90
	rra			;9d92
	jr c,L_9D98		;9d93
	ld (hl),000h		;9d95
	ret			;9d97
L_9D98:
	ld a,(hl)			;9d98
	ld (hl),c			;9d99
	ld hl,0e308h		;9d9a
	cp c			;9d9d
	jr nz,L_9DA2		;9d9e
	dec (hl)			;9da0
	ret nz			;9da1
L_9DA2:
	ld (hl),010h		;9da2
	ld hl,0e30dh		;9da4
	ld a,(hl)			;9da7
	add a,b			;9da8
	cp 0ffh		;9da9
	jr z,L_9DB4		;9dab
	cp 004h		;9dad
	jr c,L_9DB6		;9daf
	xor a			;9db1
	jr L_9DB6		;9db2
L_9DB4:
	ld a,003h		;9db4
L_9DB6:
	ld (hl),a			;9db6
	call L_9E90		;9db7
	ld a,026h		;9dba
	jp 057ffh		;9dbc
L_9DBF:
	ld a,(0e30dh)		;9dbf
	ld b,a			;9dc2
	add a,00dh		;9dc3
	ld (0ec58h),a		;9dc5
	ld a,b			;9dc8
	ld hl,0ec5dh		;9dc9
	call 04216h		;9dcc
	ld (hl),000h		;9dcf
	ld a,(0e30dh)		;9dd1
	ld hl,0d38bh		;9dd4
	call 0a264h		;9dd7
	ld a,(0e30dh)		;9dda
	ld de,09ea5h		;9ddd
	call 0421bh		;9de0
	ld a,(de)			;9de3
	inc a			;9de4
	ld e,a			;9de5
	ld d,018h		;9de6
	call 0a43ch		;9de8
	ld a,001h		;9deb
	ld hl,0e30ah		;9ded
	or (hl)			;9df0
	ld (hl),a			;9df1
	ld a,027h		;9df2
	call 057ffh		;9df4
	ld hl,0e103h		;9df7
L_9DFA:
	ld de,00004h		;9dfa
	ld b,003h		;9dfd
L_9DFF:
	ld (hl),000h		;9dff
	add hl,de			;9e01
	djnz L_9DFF		;9e02
	jp 05b1fh		;9e04
L_9E07:
	ld a,(0e30ah)		;9e07
	rra			;9e0a
	rra			;9e0b
	ret c			;9e0c
	ld a,(0e19eh)		;9e0d
	ld c,a			;9e10
	and 010h		;9e11
	jr nz,L_9E4D		;9e13
	ld hl,0ecedh		;9e15
	ld a,c			;9e18
	ld b,0ffh		;9e19
	rra			;9e1b
	jr c,L_9E26		;9e1c
	ld b,001h		;9e1e
	rra			;9e20
	jr c,L_9E26		;9e21
	ld (hl),000h		;9e23
	ret			;9e25
L_9E26:
	ld a,(hl)			;9e26
	ld (hl),c			;9e27
	ld hl,0e309h		;9e28
	cp c			;9e2b
	jr nz,L_9E30		;9e2c
	dec (hl)			;9e2e
	ret nz			;9e2f
L_9E30:
	ld (hl),010h		;9e30
	ld hl,0e30eh		;9e32
	ld a,(hl)			;9e35
	add a,b			;9e36
	cp 0ffh		;9e37
	jr z,L_9E42		;9e39
	cp 004h		;9e3b
	jr c,L_9E44		;9e3d
	xor a			;9e3f
	jr L_9E44		;9e40
L_9E42:
	ld a,003h		;9e42
L_9E44:
	ld (hl),a			;9e44
	call L_9E8B		;9e45
	ld a,026h		;9e48
	jp 057ffh		;9e4a
L_9E4D:
	ld a,(0e30eh)		;9e4d
	ld b,a			;9e50
	add a,00dh		;9e51
	ld (0ec6ah),a		;9e53
	ld a,b			;9e56
	ld hl,0ec6fh		;9e57
	call 04216h		;9e5a
	ld (hl),000h		;9e5d
	ld a,(0e30eh)		;9e5f
	ld hl,0d48ah		;9e62
	call 0a264h		;9e65
	ld a,(0e30eh)		;9e68
	ld de,09ea5h		;9e6b
	call 0421bh		;9e6e
	ld a,(de)			;9e71
	inc a			;9e72
	ld e,a			;9e73
	ld d,090h		;9e74
	call 0a43ch		;9e76
	ld a,002h		;9e79
	ld hl,0e30ah		;9e7b
	or (hl)			;9e7e
	ld (hl),a			;9e7f
	ld a,027h		;9e80
	call 057ffh		;9e82
	ld hl,0e10fh		;9e85
	jp L_9DFA		;9e88
L_9E8B:
	ld de,0e10ch		;9e8b
	jr L_9E93		;9e8e
L_9E90:
	ld de,0e100h		;9e90
L_9E93:
	ld hl,09ea5h		;9e93
	call 04216h		;9e96
	ld a,(hl)			;9e99
	inc hl			;9e9a
	ld b,003h		;9e9b
L_9E9D:
	ld (de),a			;9e9d
	inc de			;9e9e
	inc de			;9e9f
	inc de			;9ea0
	inc de			;9ea1
	djnz L_9E9D		;9ea2
	ret			;9ea4

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9ea5..0x9ea9  (4 bytes)
DATA_9EA5:
	defb 07fh,08fh,09fh,0afh	; 9ea5

; ======================================================================
; CODIGO 0x9ea9..0x9f58  (175 bytes)
; ======================================================================


L_9EA9:
	call 04ba2h		;9ea9
	call 04bd2h		;9eac
	call 052b5h		;9eaf
	call 05202h		;9eb2
	call 040e7h		;9eb5
	call 05c7dh		;9eb8
	ld hl,09f58h		;9ebb
	ld de,0e100h		;9ebe
	ld bc,00018h		;9ec1
	ldir		;9ec4
	call 05b1fh		;9ec6
	ld hl,07f55h		;9ec9
	call 04ea6h		;9ecc
	ld hl,0146ch		;9ecf
	ld de,05850h		;9ed2
	ld c,00dh		;9ed5
	call 04cfeh		;9ed7
	ld hl,08c6ch		;9eda
	ld de,05850h		;9edd
	ld c,00dh		;9ee0
	call 04cfeh		;9ee2
	ld hl,0d380h		;9ee5
	ld de,01868h		;9ee8
	call 05be4h		;9eeb
	ld hl,0d47fh		;9eee
	ld de,09068h		;9ef1
	call 05be4h		;9ef4
	ld hl,0d433h		;9ef7
	ld de,01880h		;9efa
	call L_9F20		;9efd
	ld hl,0d532h		;9f00
	ld de,09080h		;9f03
	call L_9F20		;9f06
	ld de,0ec50h		;9f09
	call L_9F70		;9f0c
	inc de			;9f0f
	call L_9F70		;9f10
	ld a,004h		;9f13
	ld (0e308h),a		;9f15
	xor a			;9f18
	ld (0de04h),a		;9f19
	ld (0e1d1h),a		;9f1c
	ret			;9f1f
L_9F20:
	ld c,004h		;9f20
L_9F22:
	ld b,006h		;9f22
	push de			;9f24
	push de			;9f25
	call 0a425h		;9f26
	inc hl			;9f29
	inc hl			;9f2a
	inc hl			;9f2b
	inc hl			;9f2c
	inc hl			;9f2d
	pop de			;9f2e
	ld a,d			;9f2f
	add a,03ch		;9f30
	ld d,a			;9f32
	ld a,090h		;9f33
	call 04f1ch		;9f35
	ld a,d			;9f38
	sub 008h		;9f39
	ld d,a			;9f3b
	ld b,001h		;9f3c
	call 05be6h		;9f3e
	ld a,d			;9f41
	add a,004h		;9f42
	ld d,a			;9f44
	ld b,002h		;9f45
	call 05be6h		;9f47
	inc hl			;9f4a
	inc hl			;9f4b
	inc hl			;9f4c
	inc hl			;9f4d
	inc hl			;9f4e
	pop de			;9f4f
	ld a,e			;9f50
	add a,010h		;9f51
	ld e,a			;9f53
	dec c			;9f54
	jr nz,L_9F22		;9f55
	ret			;9f57

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9f58..0x9f70  (24 bytes)
DATA_9F58:
	defb 07fh,017h,000h,00fh,07fh,027h,004h,00fh,07fh,037h,008h,00fh,07fh,08fh,000h,00fh	; 9f58  .....'...7......
	defb 07fh,09fh,004h,00fh,07fh,0afh,008h,00fh	; 9f68  ........

; ======================================================================
; CODIGO 0x9f70..0x9f79  (9 bytes)
; ======================================================================


L_9F70:
	ld hl,09f79h		;9f70
	ld bc,00011h		;9f73
	ldir		;9f76
	ret			;9f78

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9f79..0x9f8a  (17 bytes)
DATA_9F79:
	defb 001h,002h,003h,004h,005h,006h,007h,008h,000h,009h,00ah,00bh,00ch,00dh,00eh,00fh	; 9f79  ................
	defb 010h	; 9f89

; ======================================================================
; CODIGO 0x9f8a..0x9fff  (117 bytes)
; ======================================================================


L_9F8A:
	call 0a463h		;9f8a
	call L_85AB		;9f8d
	call 05c73h		;9f90
	ld a,(0e302h)		;9f93
	dec a			;9f96
	jr nz,L_9FAA		;9f97
	ld hl,0e308h		;9f99
	dec (hl)			;9f9c
	ret nz			;9f9d
	call 0aa74h		;9f9e
	call 0ab77h		;9fa1
	ld a,001h		;9fa4
	ld (0e1d1h),a		;9fa6
	ret			;9fa9
L_9FAA:
	call L_9FC5		;9faa
	call 0a0d7h		;9fad
	ld a,(0e30ah)		;9fb0
	cp 003h		;9fb3
	ret c			;9fb5
	ld a,060h		;9fb6
	ld (0e308h),a		;9fb8
	ld a,001h		;9fbb
	ld (0e302h),a		;9fbd
	ld a,024h		;9fc0
	jp 057ffh		;9fc2
L_9FC5:
	ld a,(0e30ah)		;9fc5
	and 001h		;9fc8
	ret nz			;9fca
	ld d,000h		;9fcb
	call 0a298h		;9fcd
	ld a,(0e304h)		;9fd0
	dec a			;9fd3
	jp z,0a047h		;9fd4
	ld a,(0e19ch)		;9fd7
	ld b,a			;9fda
	and 010h		;9fdb
	jr z,$+47		;9fdd
	ld de,0ec50h		;9fdf
	call 0a1f6h		;9fe2
	jp c,0a492h		;9fe5
	ld a,027h		;9fe8
	call 057ffh		;9fea
	ld a,001h		;9fed
	ld hl,0e30ah		;9fef
	or (hl)			;9ff2
	ld (hl),a			;9ff3
	ld a,002h		;9ff4
	ld de,01028h		;9ff6
	call 0a452h		;9ff9
	ld hl,0e103h		;9ffc

; ----------------------------------------------------------------------
; DATOS partida_9FFF: los 1 primeros bytes de una instruccion de 3 (11 04 00)
;   que sigue en el banco 3: el trazador de un solo banco no puede verla
;   entera (tools/bancos.py); lo leen p02:9FFF (1 bytes)
;   0x9fff..0xa000  (1 bytes)
L_9FFF:
	defb 011h	; 9fff
