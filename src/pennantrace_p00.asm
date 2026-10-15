; ==========================================================================
; THE PRO YAKYUU GEKITOTSU PENNANT RACE - Konami (1988) - MSX2 - MegaROM RC-757 de 128 KB (Konami SCC) - banco 00 (se ejecuta en 0x4000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x04000


; ----------------------------------------------------------------------
; Direcciones que solo aparecen como VALOR -en un `ld`, no en
; un salto-: son punteros que el codigo se pasa o numeros que
; casualmente coinciden con una direccion. No hay nada que
; trazar en ellas; el equ existe para que el listado ensamble.
; ----------------------------------------------------------------------
l5818h:	equ 0x05818

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4000..0x4030  (48 bytes)
DATA_4000:
	defb 041h,042h,0f0h,040h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 4000  AB.@............
	defb 045h,046h,007h,057h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 4010  EF.W............
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,081h,001h,001h,002h,080h,0f6h,0ffh,0ffh	; 4020  ................

; ======================================================================
; CODIGO 0x4030..0x4494  (1124 bytes)
; ======================================================================


L_4030:
	call L_438D		;4030
	call 0a27ah		;4033
	jp L_439F		;4036
L_4039:
	call L_438D		;4039
	call 084d5h		;403c
	jp L_439F		;403f
L_4042:
	call L_438D		;4042
	call 0a1f6h		;4045
	jp L_439F		;4048
L_404B:
	call L_438D		;404b
	call 0ab94h		;404e
	jp L_439F		;4051
L_4054:
	call L_438D		;4054
	call 0a218h		;4057
	jp L_439F		;405a
L_405D:
	call L_438D		;405d
	call 0a452h		;4060
	jp L_439F		;4063
L_4066:
	call L_438D		;4066
	call 0a220h		;4069
	jp L_439F		;406c
L_406F:
	call L_438D		;406f
	call 0aa74h		;4072
	jp L_439F		;4075
L_4078:
	call L_438D		;4078
	call L_5E80		;407b
	jp L_439F		;407e
L_4081:
	call L_438D		;4081
	call 09149h		;4084
	jp L_439F		;4087
L_408A:
	call L_438D		;408a
	call 06770h		;408d
	jp L_439F		;4090
L_4093:
	call L_438D		;4093
	call L_4448		;4096
	jp L_439F		;4099
L_409C:
	call L_438D		;409c
	call L_5FA4		;409f
	jp L_439F		;40a2
L_40A5:
	call L_438D		;40a5
	call L_51DF		;40a8
	jp L_439F		;40ab
L_40AE:
	call L_438D		;40ae
	call 062f7h		;40b1
	jp L_439F		;40b4
L_40B7:
	call L_438D		;40b7
	call L_5716		;40ba
	jp L_439F		;40bd
L_40C0:
	call L_438D		;40c0
	call 0b11fh		;40c3
	jp L_439F		;40c6
L_40C9:
	call L_438D		;40c9
	call 0619fh		;40cc
	jp L_439F		;40cf
L_40D2:
	call L_4392		;40d2
	call L_5E9F		;40d5
	jp L_439F		;40d8
L_40DB:
	call L_5B1F		;40db
	jp L_439F		;40de
L_40E1:
	call L_5991		;40e1
	jp L_439F		;40e4
L_40E7:
	call L_439F		;40e7
	call 0968ah		;40ea
	jp L_438D		;40ed
L_40F0:
	di			;40f0
	call L_440C		;40f1
	di			;40f4
	ld h,a			;40f5
	ld l,0f7h		;40f6
	ld (0fedah),hl		;40f8
	ld hl,L_4102		;40fb
	ld (0fedch),hl		;40fe
	ret			;4101
L_4102:
	di			;4102
	im 1		;4103
	ld sp,0d280h		;4105
	ld hl,084d4h		;4108
	ld (0f323h),hl		;410b
	ld hl,0e280h		;410e
	ld bc,01100h		;4111
	ld de,0c000h		;4114
	ldir		;4117
	ld hl,0f100h		;4119
	ld de,0d780h		;411c
	ld bc,00280h		;411f
	ldir		;4122
	ld hl,0fd9fh		;4124
	ld de,0d2abh		;4127
	ld bc,00005h		;412a
	ldir		;412d
	ld a,0c9h		;412f
	ld (0fd9fh),a		;4131
	call L_43EC		;4134
	call L_440C		;4137
	xor a			;413a
	ld (0dd90h),a		;413b
	ld hl,0d380h		;413e
	ld de,0d381h		;4141
	ld bc,003dah		;4144
	ld (hl),a			;4147
	ldir		;4148
	ld hl,0de00h		;414a
	ld de,0de01h		;414d
	ld bc,011fbh		;4150
	ld (hl),a			;4153
	ldir		;4154
	ld (0dde0h),a		;4156
	xor a			;4159
	ld hl,0ddf0h		;415a
	ld (05000h),a		;415d
	ld (hl),a			;4160
	inc hl			;4161
	inc a			;4162
	ld (07000h),a		;4163
	ld (hl),a			;4166
	inc hl			;4167
	inc a			;4168
	ld (09000h),a		;4169
	ld (hl),a			;416c
	inc hl			;416d
	inc a			;416e
	ld (hl),a			;416f
	ld (0b000h),a		;4170
	call 065beh		;4173
	di			;4176
	ld hl,0ed0fh		;4177
	ld (hl),000h		;417a
	ld a,0c3h		;417c
	ld (0fd9fh),a		;417e
	ld hl,L_418E		;4181
	ld (0fda0h),hl		;4184
	xor a			;4187
	ld (0f3dbh),a		;4188
	ei			;418b
L_418C:
	jr L_418C		;418c
L_418E:
	call 0013eh		;418e   ; BIOS RDVDP - Reads VDP status register
	ld a,(0de05h)		;4191
	or a			;4194
	jr nz,L_41B0		;4195
	ld a,002h		;4197
	call L_4C71		;4199
	rra			;419c
	jr c,L_41B0		;419d
	ld hl,0de05h		;419f
	set 2,(hl)		;41a2
	call L_422A		;41a4
	ld hl,0de05h		;41a7
	res 2,(hl)		;41aa
	ld hl,0ed0fh		;41ac
	inc (hl)			;41af
L_41B0:
	di			;41b0
	ld hl,0de05h		;41b1
	bit 1,(hl)		;41b4
	jp nz,L_420E		;41b6
	set 1,(hl)		;41b9
	di			;41bb
	ld a,004h		;41bc
	ld (07000h),a		;41be
	inc a			;41c1
	ld (09000h),a		;41c2
	inc a			;41c5
	ld (0b000h),a		;41c6
	call L_5DC4		;41c9
	call 06009h		;41cc
	ld hl,0de05h		;41cf
	res 1,(hl)		;41d2
	di			;41d4
	ld a,(0ddf1h)		;41d5
	ld (07000h),a		;41d8
	ld a,(0ddf2h)		;41db
	ld (09000h),a		;41de
	ld a,(0ddf3h)		;41e1
	ld (0b000h),a		;41e4
	ld hl,0de05h		;41e7
	ld a,(hl)			;41ea
	or a			;41eb
	jp nz,L_420E		;41ec
	inc (hl)			;41ef
	ei			;41f0
	ld hl,(0fda0h)		;41f1
	ld (0dd9eh),hl		;41f4
	ld hl,L_418E		;41f7
	ld (0fda0h),hl		;41fa
	call 065f0h		;41fd
	call L_4480		;4200
	ld hl,(0dd9eh)		;4203
	ld (0fda0h),hl		;4206
	ld hl,0de05h		;4209
	res 0,(hl)		;420c
L_420E:
	call L_4428		;420e
	call 0013eh		;4211   ; BIOS RDVDP - Reads VDP status register
	ei			;4214
	ret			;4215
L_4216:
	add a,l			;4216
	ld l,a			;4217
	ret nc			;4218
	inc h			;4219
	ret			;421a
L_421B:
	add a,e			;421b
	ld e,a			;421c
	ret nc			;421d
	inc d			;421e
	ret			;421f
L_4220:
	pop hl			;4220
	add a,a			;4221
	call L_4216		;4222
	ld e,(hl)			;4225
	inc hl			;4226
	ld d,(hl)			;4227
	ex de,hl			;4228
	jp (hl)			;4229
L_422A:
	ld hl,0ed09h		;422a
	ld a,(hl)			;422d
	or a			;422e
	ret z			;422f
	ld (hl),000h		;4230
	dec a			;4232
	jr nz,L_4245		;4233
L_4235:
	ld hl,0df00h		;4235
	ld de,0f400h		;4238
	ld bc,00280h		;423b
	call L_4AB7		;423e
	call L_4C67		;4241
	ret			;4244
L_4245:
	ld ix,0ed05h		;4245
	ld (ix+000h),000h		;4249
	ld de,0e341h		;424d
	ld hl,0e340h		;4250
	ld bc,0001fh		;4253
	ld (hl),000h		;4256
	ldir		;4258
	di			;425a
	ld hl,0df00h		;425b
	ld de,0f400h		;425e
	ld bc,00040h		;4261
	call L_4AB7		;4264
	ld hl,0e060h		;4267
	ld de,0f560h		;426a
	ld bc,000a0h		;426d
	call L_4AB7		;4270
	ld hl,0e100h		;4273
	ld de,0f600h		;4276
	ld bc,00010h		;4279
	call L_4AB7		;427c
	ld hl,0e158h		;427f
	ld de,0f658h		;4282
	ld bc,00028h		;4285
	call L_4AB7		;4288
	ld hl,0ece5h		;428b
	dec (hl)			;428e
	ld a,(hl)			;428f
	or a			;4290
	jr nz,L_42A1		;4291
	ld a,(0e1a2h)		;4293
	cp 078h		;4296
	ld a,009h		;4298
	jr c,L_429D		;429a
	inc a			;429c
L_429D:
	ld (0ed04h),a		;429d
	ld (hl),a			;42a0
L_42A1:
	ld a,(0ed04h)		;42a1
	ld e,a			;42a4
	ld a,(0ece5h)		;42a5
	dec a			;42a8
	ld d,a			;42a9
	neg		;42aa
	add a,e			;42ac
	ld l,a			;42ad
	ld h,000h		;42ae
	add hl,hl			;42b0
	add hl,hl			;42b1
	add hl,hl			;42b2
	ld b,h			;42b3
	ld c,l			;42b4
	ld l,d			;42b5
	ld h,000h		;42b6
	add hl,hl			;42b8
	add hl,hl			;42b9
	add hl,hl			;42ba
	ld de,0e110h		;42bb
	add hl,de			;42be
	ld de,0f610h		;42bf
	ld (0e340h),a		;42c2
	ld (0e341h),bc		;42c5
	ld (0e343h),de		;42c9
	ld (0e345h),hl		;42cd
	call L_4AB7		;42d0
	ld a,(0ece5h)		;42d3
	dec a			;42d6
	jr z,L_4309		;42d7
	ld d,a			;42d9
	ld l,a			;42da
	ld h,000h		;42db
	add hl,hl			;42dd
	add hl,hl			;42de
	add hl,hl			;42df
	ld b,h			;42e0
	ld c,l			;42e1
	ld a,(0ed04h)		;42e2
	ld e,a			;42e5
	ld a,d			;42e6
	neg		;42e7
	add a,e			;42e9
	ld l,a			;42ea
	ld h,000h		;42eb
	add hl,hl			;42ed
	add hl,hl			;42ee
	add hl,hl			;42ef
	ld de,0f610h		;42f0
	add hl,de			;42f3
	ex de,hl			;42f4
	ld hl,0e110h		;42f5
	ld (0e348h),a		;42f8
	ld (0e349h),bc		;42fb
	ld (0e34bh),de		;42ff
	ld (0e34dh),hl		;4303
	call L_4AB7		;4306
L_4309:
	ld a,(0ed04h)		;4309
	ld e,a			;430c
	ld a,(0ece5h)		;430d
	dec a			;4310
	ld d,a			;4311
	neg		;4312
	add a,e			;4314
	ld l,a			;4315
	ld h,000h		;4316
	add hl,hl			;4318
	add hl,hl			;4319
	add hl,hl			;431a
	add hl,hl			;431b
	add hl,hl			;431c
	ld b,h			;431d
	ld c,l			;431e
	ld l,d			;431f
	ld h,000h		;4320
	add hl,hl			;4322
	add hl,hl			;4323
	add hl,hl			;4324
	add hl,hl			;4325
	add hl,hl			;4326
	ld de,0df40h		;4327
	add hl,de			;432a
	ld de,0f440h		;432b
	ld (0e350h),a		;432e
	ld (0e351h),bc		;4331
	ld (0e353h),de		;4335
	ld (0e355h),hl		;4339
	call L_4AB7		;433c
	ld a,(0ece5h)		;433f
	dec a			;4342
	jr z,L_4379		;4343
	ld d,a			;4345
	ld l,a			;4346
	ld h,000h		;4347
	add hl,hl			;4349
	add hl,hl			;434a
	add hl,hl			;434b
	add hl,hl			;434c
	add hl,hl			;434d
	ld b,h			;434e
	ld c,l			;434f
	ld a,(0ed04h)		;4350
	ld e,a			;4353
	ld a,d			;4354
	neg		;4355
	add a,e			;4357
	ld l,a			;4358
	ld h,000h		;4359
	add hl,hl			;435b
	add hl,hl			;435c
	add hl,hl			;435d
	add hl,hl			;435e
	add hl,hl			;435f
	ld de,0f440h		;4360
	add hl,de			;4363
	ex de,hl			;4364
	ld hl,0df40h		;4365
	ld (0e358h),a		;4368
	ld (0e359h),bc		;436b
	ld (0e35bh),de		;436f
	ld (0e35dh),hl		;4373
	call L_4384		;4376
L_4379:
	ld a,(ix+000h)		;4379
	ld a,(0ece5h)		;437c
	ld (0e347h),a		;437f
	ei			;4382
	ret			;4383
L_4384:
	ld a,(0ece5h)		;4384
	inc (ix+000h)		;4387
	jp L_4AB7		;438a
L_438D:
	push af			;438d
	ld a,001h		;438e
	jr L_43A2		;4390
L_4392:
	push af			;4392
	ld a,007h		;4393
	jr L_43A2		;4395
L_4397:
	push af			;4397
	ld a,00ah		;4398
	jr L_43A2		;439a
L_439C:
	call L_43D9		;439c
L_439F:
	push af			;439f
	ld a,00dh		;43a0
L_43A2:
	di			;43a2
	push hl			;43a3
	ld hl,0ddf1h		;43a4
	ld (07000h),a		;43a7
	ld (hl),a			;43aa
	inc a			;43ab
	inc l			;43ac
	ld (09000h),a		;43ad
	ld (hl),a			;43b0
	inc a			;43b1
	inc l			;43b2
	ld (0b000h),a		;43b3
	ld (hl),a			;43b6
	pop hl			;43b7
	pop af			;43b8
	ei			;43b9
	ret			;43ba
L_43BB:
	di			;43bb
	ld a,(0ed46h)		;43bc
	ld (07000h),a		;43bf
	ld (0ddf1h),a		;43c2
	ld a,(0ed47h)		;43c5
	ld (09000h),a		;43c8
	ld (0ddf2h),a		;43cb
	ld a,(0ed48h)		;43ce
	ld (0b000h),a		;43d1
	ld (0ddf3h),a		;43d4
	ei			;43d7
	ret			;43d8
L_43D9:
	ld a,(0ddf1h)		;43d9
	ld (0ed46h),a		;43dc
	ld a,(0ddf2h)		;43df
	ld (0ed47h),a		;43e2
	ld a,(0ddf3h)		;43e5
	ld (0ed48h),a		;43e8
	ret			;43eb
L_43EC:
	call 00138h		;43ec   ; BIOS RSLREG - Reads the primary slot register
	rrca			;43ef
	rrca			;43f0
	and 003h		;43f1
	ld c,a			;43f3
	ld b,000h		;43f4
	ld hl,0fcc1h		;43f6
	add hl,bc			;43f9
	ld a,(hl)			;43fa
	and 080h		;43fb
	or c			;43fd
	ld c,a			;43fe
	inc hl			;43ff
	inc hl			;4400
	inc hl			;4401
	inc hl			;4402
	ld a,(hl)			;4403
	and 00ch		;4404
	or c			;4406
	ld h,080h		;4407
	jp 00024h		;4409   ; BIOS ENASLT - Switches to specified slot and page definitively
L_440C:
	call 00138h		;440c   ; BIOS RSLREG - Reads the primary slot register
	rrca			;440f
	rrca			;4410
	and 003h		;4411
	ld c,a			;4413
	ld b,000h		;4414
	ld hl,0fcc1h		;4416
	add hl,bc			;4419
	or (hl)			;441a
	ld c,a			;441b
	inc hl			;441c
	inc hl			;441d
	inc hl			;441e
	inc hl			;441f
	ld a,(hl)			;4420
	and 00ch		;4421
	or c			;4423
	ld (0d2aah),a		;4424
	ret			;4427
L_4428:
	ld hl,0ed4ah		;4428
	call L_4455		;442b
	ret c			;442e
	inc hl			;442f
	call L_4455		;4430
	ret c			;4433
	call L_445E		;4434
	ret c			;4437
	inc hl			;4438
	inc (hl)			;4439
	ld a,(hl)			;443a
	cp 006h		;443b
	ret c			;443d
	ld (hl),000h		;443e
	call L_445E		;4440
	ret c			;4443
	call L_445E		;4444
	ret c			;4447
L_4448:
	ld hl,00000h		;4448
	ld (0ed4ah),hl		;444b
	ld (0ed4ch),hl		;444e
	ld (0ed4eh),hl		;4451
	ret			;4454
L_4455:
	inc (hl)			;4455
	ld a,(hl)			;4456
	cp 03ch		;4457
	ret c			;4459
	ld (hl),000h		;445a
	or a			;445c
	ret			;445d
L_445E:
	inc hl			;445e
	inc (hl)			;445f
	ld a,(hl)			;4460
	cp 00ah		;4461
	ret c			;4463
	ld (hl),000h		;4464
	or a			;4466
	ret			;4467
L_4468:
	ld hl,0f680h		;4468
	ld de,0dda0h		;446b
	ld bc,00020h		;446e
	call L_4A9C		;4471
	ld a,(0dda0h)		;4474
	or a			;4477
	jr nz,L_447F		;4478
	ld a,(0dda1h)		;447a
	or a			;447d
	ret z			;447e
L_447F:
	ret			;447f
L_4480:
	ld hl,0de03h		;4480
	inc (hl)			;4483
	ld bc,(0de00h)		;4484
	ld a,c			;4488
	cp 003h		;4489
	jr nc,L_4491		;448b
	ld hl,04a42h		;448d
	push hl			;4490
L_4491:
	call L_4220		;4491

; ----------------------------------------------------------------------
; DATOS tabla_4494: 10 destinos del despachador p00:4220 (call en p00:4491, el
;   indice en A): 44A8, 44FA, 4508, 4548, 45D2, 4611, 472A, 47B8, 4A16, 4A2D;
;   lo leen p00:4491 (20 bytes)
;   0x4494..0x44a8  (20 bytes)
DATA_tabla_4494:
	defw 044a8h,044fah,04508h,04548h,045d2h,04611h,0472ah,047b8h	; 4494
	defw 04a16h,04a2dh	; 44a4  -> L_4A16 L_4A2D

; ======================================================================
; CODIGO 0x44a8..0x4a42  (1434 bytes)
; ======================================================================


L_44A8:
	djnz L_44C0		;44a8
	call L_439F		;44aa
	call 0872eh		;44ad
	call L_438D		;44b0
	ld a,(0de0fh)		;44b3
	or a			;44b6
	ret z			;44b7
	ld a,078h		;44b8
	ld (0de04h),a		;44ba
	jp L_4543		;44bd
L_44C0:
	djnz L_44CD		;44c0
	ld hl,0de04h		;44c2
	dec (hl)			;44c5
	ret nz			;44c6
	xor a			;44c7
	ld (0ecefh),a		;44c8
	jr L_4543		;44cb
L_44CD:
	djnz L_44E6		;44cd
	call L_439F		;44cf
	call 0bb87h		;44d2
	call L_438D		;44d5
	ld a,(0e1d1h)		;44d8
	or a			;44db
	ret z			;44dc
	ld a,02dh		;44dd
	call L_57FF		;44df
	xor a			;44e2
	jp L_45FA		;44e3
L_44E6:
	ld a,001h		;44e6
	call L_57FF		;44e8
	xor a			;44eb
	ld (0eff4h),a		;44ec
	call L_4B9F		;44ef
	call L_5991		;44f2
	call 0b670h		;44f5
	jr L_4543		;44f8
L_44FA:
	ld hl,0de04h		;44fa
	dec (hl)			;44fd
	jp nz,06561h		;44fe
	xor a			;4501
	ld (0e190h),a		;4502
	jp L_45F8		;4505
L_4508:
	djnz L_452F		;4508
	call L_439F		;450a
	call 0ab40h		;450d
	call L_438D		;4510
	ld a,(0e1a0h)		;4513
	or a			;4516
	ret nz			;4517
	ld a,001h		;4518
	call L_5E80		;451a
L_451D:
	call 0650eh		;451d
	xor a			;4520
	ld (0d74ch),a		;4521
	ld (0de00h),a		;4524
	ld a,020h		;4527
	ld (0de04h),a		;4529
	jp L_4601		;452c
L_452F:
	call L_4B9F		;452f
	call L_52B5		;4532
	call L_439F		;4535
	call 0ab1dh		;4538
	call L_438D		;453b
	ld a,020h		;453e
L_4540:
	ld (0de04h),a		;4540
L_4543:
	ld hl,0de01h		;4543
	inc (hl)			;4546
	ret			;4547
L_4548:
	djnz L_457D		;4548
	ld hl,0de04h		;454a
	dec (hl)			;454d
	jr z,L_4543		;454e
	ld a,(0e190h)		;4550
	ld de,07d9fh		;4553
	or a			;4556
	jr z,L_4574		;4557
	ld de,07da9h		;4559
	dec a			;455c
	jr z,L_4574		;455d
	ld de,07db4h		;455f
	dec a			;4562
	jr z,L_4574		;4563
	ld de,07dbeh		;4565
	dec a			;4568
	jr z,L_4574		;4569
	ld de,07dcah		;456b
	dec a			;456e
	jr z,L_4574		;456f
	ld de,07dd2h		;4571
L_4574:
	bit 2,(hl)		;4574
	ex de,hl			;4576
	jp z,L_4EA6		;4577
	jp L_4EAB		;457a
L_457D:
	djnz L_459D		;457d
	ld a,(0e190h)		;457f
	cp 005h		;4582
	jr z,L_458B		;4584
	call 0650eh		;4586
	jr L_45F8		;4589
L_458B:
	xor a			;458b
	ld (0dd92h),a		;458c
	ld (0dd91h),a		;458f
	ld (0dd93h),a		;4592
	ld de,018c0h		;4595
	call L_4F1C		;4598
	jr L_4543		;459b
L_459D:
	djnz L_45B0		;459d
	call L_439F		;459f
	call 0aa3bh		;45a2
	call L_438D		;45a5
	ld a,(0dd91h)		;45a8
	or a			;45ab
	ret z			;45ac
	jp L_451D		;45ad
L_45B0:
	ld a,007h		;45b0
	call 00141h		;45b2   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	bit 1,a		;45b5
	ld a,001h		;45b7
	jr z,L_45BC		;45b9
	dec a			;45bb
L_45BC:
	ld (0effah),a		;45bc
	xor a			;45bf
	ld (0ed99h),a		;45c0
	ld a,080h		;45c3
	call L_57FF		;45c5
	ld a,023h		;45c8
	call L_57FF		;45ca
	ld a,0a0h		;45cd
	jp L_4540		;45cf
L_45D2:
	djnz L_4606		;45d2
	call L_5FF1		;45d4
	call L_5991		;45d7
	call L_59AD		;45da
	call L_52B5		;45dd
	call L_52D9		;45e0
	ld a,007h		;45e3
	ld de,07777h		;45e5
	call L_4BF0		;45e8
	ld a,(0e190h)		;45eb
	cp 003h		;45ee
	call z,0b9dah		;45f0
	ld hl,0e1a0h		;45f3
	ld (hl),001h		;45f6
L_45F8:
	ld a,020h		;45f8
L_45FA:
	ld (0de04h),a		;45fa
	ld hl,0de00h		;45fd
	inc (hl)			;4600
L_4601:
	xor a			;4601
L_4602:
	ld (0de01h),a		;4602
	ret			;4605
L_4606:
	call L_4B9F		;4606
	ld a,078h		;4609
	ld (0de04h),a		;460b
	jp L_4543		;460e
L_4611:
	djnz L_464D		;4611
	ld hl,0de04h		;4613
	ld a,(hl)			;4616
	or a			;4617
	jr z,L_461B		;4618
	dec (hl)			;461a
L_461B:
	jr z,L_4645		;461b
	ld a,(0d2b1h)		;461d
	dec a			;4620
	ret z			;4621
L_4622:
	call L_439F		;4622
	call 06df7h		;4625
	call L_438D		;4628
	ld a,(0d2b1h)		;462b
	cp 002h		;462e
	jp z,L_451D		;4630
	or a			;4633
	ret z			;4634
	ld a,(0de04h)		;4635
	or a			;4638
	ret nz			;4639
L_463A:
	ld a,02fh		;463a
	call L_57FF		;463c
	call 09ea9h		;463f
	jp L_4543		;4642
L_4645:
	ld a,(0d2b1h)		;4645
	dec a			;4648
	jr nz,L_4622		;4649
	jr L_463A		;464b
L_464D:
	djnz L_465D		;464d
	call 09d49h		;464f
	ld a,(0e1d1h)		;4652
	or a			;4655
	ret z			;4656
	call 0a2edh		;4657
	jp L_4543		;465a
L_465D:
	djnz L_468A		;465d
	call 09f8ah		;465f
	ld a,(0e1d1h)		;4662
	or a			;4665
	ret z			;4666
	call L_4448		;4667
	ld a,(0effah)		;466a
	or a			;466d
	ld a,032h		;466e
	jr z,L_4674		;4670
	ld a,001h		;4672
L_4674:
	call L_5E80		;4674
	ld a,001h		;4677
	ld hl,0ed13h		;4679
	ld (hl),a			;467c
	inc hl			;467d
	ld (hl),a			;467e
	call 06770h		;467f
	ld a,001h		;4682
	ld (0e1cbh),a		;4684
	jp L_4543		;4687
L_468A:
	djnz L_46FB		;468a
	call 09149h		;468c
	ld a,(0eda0h)		;468f
	or a			;4692
	jr z,L_46A1		;4693
	ld hl,0de00h		;4695
	ld (hl),006h		;4698
	dec a			;469a
	jp z,L_4790		;469b
	jp L_479E		;469e
L_46A1:
	ld a,(0ed87h)		;46a1
	or a			;46a4
	jr nz,L_46EE		;46a5
	ld a,(0eda1h)		;46a7
	or a			;46aa
	jp nz,L_451D		;46ab
	ld a,(0e194h)		;46ae
	cp 099h		;46b1
	jr z,L_46EE		;46b3
	ld a,(0e196h)		;46b5
	cp 099h		;46b8
	jr z,L_46EE		;46ba
	ld hl,0eddah		;46bc
	ld a,(hl)			;46bf
	ld (hl),000h		;46c0
	or a			;46c2
	ret nz			;46c3
	ld a,(0e19bh)		;46c4
	ld b,a			;46c7
	rra			;46c8
	ret nc			;46c9
	ld hl,0e194h		;46ca
	ld a,(hl)			;46cd
	inc hl			;46ce
	inc hl			;46cf
	sub (hl)			;46d0
	ld c,000h		;46d1
	jr nc,L_46D8		;46d3
	inc c			;46d5
	neg		;46d6
L_46D8:
	ld d,a			;46d8
	ld a,c			;46d9
	or a			;46da
	jr z,L_46E2		;46db
	ld a,d			;46dd
	cp 010h		;46de
	jr nc,L_46EE		;46e0
L_46E2:
	ld a,b			;46e2
	cp 011h		;46e3
	ret c			;46e5
	ld hl,0e194h		;46e6
	ld a,(hl)			;46e9
	inc hl			;46ea
	inc hl			;46eb
	cp (hl)			;46ec
	ret nc			;46ed
L_46EE:
	ld a,009h		;46ee
	ld (0de00h),a		;46f0
	ld a,080h		;46f3
	ld (0de04h),a		;46f5
	jp L_4601		;46f8
L_46FB:
	ld a,(0e190h)		;46fb
	cp 003h		;46fe
	jp z,0b694h		;4700
	call L_596F		;4703
	ld a,(0e1d1h)		;4706
	or a			;4709
	ret z			;470a
	ld a,(0de02h)		;470b
	bit 4,a		;470e
	jr z,L_471B		;4710
	call L_439F		;4712
	call 09697h		;4715
	call L_438D		;4718
L_471B:
	ld a,03ch		;471b
	ld (0de04h),a		;471d
	xor a			;4720
	ld (0d2b0h),a		;4721
	ld (0d2b1h),a		;4724
	jp L_4543		;4727
L_472A:
	djnz L_4737		;472a
	call L_439F		;472c
	call 09853h		;472f
	call L_438D		;4732
	jr L_4742		;4735
L_4737:
	djnz L_4754		;4737
	call L_439F		;4739
	call 09a26h		;473c
	call L_438D		;473f
L_4742:
	ld a,(0e1d1h)		;4742
	or a			;4745
	ret z			;4746
	ld a,(0ed9bh)		;4747
	or a			;474a
	call z,0ac91h		;474b
	xor a			;474e
	ld (0ed9bh),a		;474f
	jr L_47AF		;4752
L_4754:
	call 06098h		;4754
	jr c,L_47AC		;4757
	ld a,(0de02h)		;4759
	ld b,a			;475c
	and 008h		;475d
	ret nz			;475f
	bit 4,b		;4760
	jr nz,L_476A		;4762
	bit 5,b		;4764
	jr z,L_478A		;4766
	jr L_4783		;4768
L_476A:
	bit 5,b		;476a
	jr nz,L_4783		;476c
	ld a,(0d6dch)		;476e
	rra			;4771
	jr nc,L_4783		;4772
	ld a,(0de09h)		;4774
	and 010h		;4777
	jr nz,L_4790		;4779
	ld a,(0de07h)		;477b
	and 010h		;477e
	ret z			;4780
	jr L_479E		;4781
L_4783:
	ld a,(0de09h)		;4783
	and 010h		;4786
	jr nz,L_479E		;4788
L_478A:
	ld a,(0de07h)		;478a
	and 010h		;478d
	ret z			;478f
L_4790:
	call L_439F		;4790
	call 09bcch		;4793
	call L_438D		;4796
	ld a,001h		;4799
	jp L_4602		;479b
L_479E:
	call L_439F		;479e
	call 09c61h		;47a1
	call L_438D		;47a4
	ld a,002h		;47a7
	jp L_4602		;47a9
L_47AC:
	call 064a5h		;47ac
L_47AF:
	ld a,005h		;47af
	ld (0de00h),a		;47b1
	dec a			;47b4
	jp L_4602		;47b5
L_47B8:
	dec b			;47b8
	jp nz,L_4818		;47b9
	ld a,(0de03h)		;47bc
	and 01fh		;47bf
	ret nz			;47c1
	call L_49D7		;47c2
	ld hl,0e400h		;47c5
	call L_4C59		;47c8
	ld hl,0e401h		;47cb
	ld b,00dh		;47ce
	xor a			;47d0
L_47D1:
	or (hl)			;47d1
	inc hl			;47d2
	or (hl)			;47d3
	or a			;47d4
	ret nz			;47d5
	inc hl			;47d6
	inc hl			;47d7
	djnz L_47D1		;47d8
	call 06991h		;47da
	xor a			;47dd
	ld de,00703h		;47de
	call L_4BF0		;47e1
	call L_52B5		;47e4
	ld hl,07cd1h		;47e7
	call L_4EA6		;47ea
	ld hl,0d380h		;47ed
	ld de,04850h		;47f0
	call L_5BE4		;47f3
	ld hl,0d47fh		;47f6
	ld de,0a850h		;47f9
	call L_5BE4		;47fc
	call 060ach		;47ff
	ld a,(0de02h)		;4802
	and 010h		;4805
	jr z,L_4812		;4807
	ld hl,07c79h		;4809
	call L_4EA6		;480c
	jp L_4543		;480f
L_4812:
	ld a,005h		;4812
	ld (0de01h),a		;4814
	ret			;4817
L_4818:
	djnz L_486C		;4818
	ld a,(0de02h)		;481a
	and 010h		;481d
	jr z,L_4812		;481f
	ld a,(0de07h)		;4821
	and 010h		;4824
	ret z			;4826
	call L_52C7		;4827
	call L_439F		;482a
	call 0ac1ah		;482d
	call 0a792h		;4830
	call L_438D		;4833
	ld a,(0dd9dh)		;4836
	or a			;4839
	jr nz,L_4860		;483a
	ld hl,07c8ah		;483c
	ld a,(0dd8eh)		;483f
	or a			;4842
	jr nz,L_4848		;4843
	ld hl,07ca8h		;4845
L_4848:
	call L_4EA6		;4848
	xor a			;484b
	ld (0dd91h),a		;484c
	ld (0dd92h),a		;484f
	ld (0dd93h),a		;4852
	ld a,007h		;4855
	ld de,07707h		;4857
	call L_4BF0		;485a
	jp L_4543		;485d
L_4860:
	ld hl,07cb9h		;4860
	call L_4EA6		;4863
	ld a,009h		;4866
	ld (0de01h),a		;4868
	ret			;486b
L_486C:
	jr L_48AD		;486c
L_486E:
	ld a,(0de06h)		;486e
	and 010h		;4871
	ret z			;4873
L_4874:
	call L_4BC5		;4874
	call L_4B9F		;4877
	ld de,0e195h		;487a
	ld hl,0e194h		;487d
	ld bc,00c53h		;4880
	ld (hl),000h		;4883
	ldir		;4885
	call 06770h		;4887
	call L_550E		;488a
	ld a,00fh		;488d
	ld de,07000h		;488f
	call L_4BF0		;4892
	call L_59AD		;4895
	call L_4BB8		;4898
	ld a,009h		;489b
	ld (0d74ch),a		;489d
	call L_4601		;48a0
	ld a,005h		;48a3
	ld (0de00h),a		;48a5
	ld a,001h		;48a8
	jp L_57FF		;48aa
L_48AD:
	djnz L_48FB		;48ad
	ld a,(0dd8eh)		;48af
	or a			;48b2
	jr z,L_486E		;48b3
	call L_439F		;48b5
	ld de,0b840h		;48b8
	call 0aae1h		;48bb
	call L_438D		;48be
	ld a,(0dd91h)		;48c1
	or a			;48c4
	ret z			;48c5
	ld a,(0dd93h)		;48c6
	or a			;48c9
	jr nz,L_4874		;48ca
	ld a,(0de02h)		;48cc
	ld (0d73fh),a		;48cf
	ld a,001h		;48d2
	ld (0dd90h),a		;48d4
	ld a,(0dd0eh)		;48d7
	cp 0ffh		;48da
	jr nz,L_48E6		;48dc
	ld a,(0ffa7h)		;48de
	cp 0c9h		;48e1
	jp z,L_4967		;48e3
L_48E6:
	call 0bdd4h		;48e6
	ld hl,07bddh		;48e9
	call L_4EA6		;48ec
	xor a			;48ef
	ld (0d2b0h),a		;48f0
	call L_4543		;48f3
	ld a,001h		;48f6
	jp L_57FF		;48f8
L_48FB:
	djnz L_490E		;48fb
	call L_439F		;48fd
	call 06f79h		;4900
	call L_438D		;4903
	ld a,(0d2b1h)		;4906
	or a			;4909
	ret z			;490a
	jp L_451D		;490b
L_490E:
	djnz L_493F		;490e
	ld a,(0de07h)		;4910
	and 030h		;4913
	jr nz,L_491D		;4915
	ld a,(0de09h)		;4917
	and 030h		;491a
	ret z			;491c
L_491D:
	ld a,(0de02h)		;491d
	and 010h		;4920
	jp z,L_451D		;4922
	ld a,031h		;4925
	call L_57FF		;4927
	call L_4B9F		;492a
	call L_526E		;492d
	call L_439F		;4930
	call 09e0eh		;4933
	call L_438D		;4936
	ld a,006h		;4939
	ld (0de01h),a		;493b
	ret			;493e
L_493F:
	djnz L_4958		;493f
	call L_439F		;4941
	call 09e2fh		;4944
	call L_438D		;4947
	ld a,(0ed2fh)		;494a
	or a			;494d
	ret z			;494e
	ld hl,00000h		;494f
	ld (0d74ch),hl		;4952
	jp L_4543		;4955
L_4958:
	djnz L_4976		;4958
	ld a,(0de07h)		;495a
	and 030h		;495d
	jr nz,L_4967		;495f
	ld a,(0de09h)		;4961
	and 030h		;4964
	ret z			;4966
L_4967:
	ld a,001h		;4967
	call L_5E80		;4969
	ld hl,0de02h		;496c
	ld a,(hl)			;496f
	and 0bfh		;4970
	ld (hl),a			;4972
	jp L_451D		;4973
L_4976:
	djnz L_4992		;4976
	call L_439F		;4978
	call 09f76h		;497b
	call L_438D		;497e
	ld a,(0ed2fh)		;4981
	or a			;4984
	ret z			;4985
	ld hl,00000h		;4986
	ld (0d74ch),hl		;4989
	ld a,007h		;498c
	ld (0de01h),a		;498e
	ret			;4991
L_4992:
	djnz L_49C0		;4992
	ld a,006h		;4994
	call 00141h		;4996   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	and 020h		;4999
	ret nz			;499b
	ld a,(0dd9dh)		;499c
	dec a			;499f
	jr z,L_49A6		;49a0
	dec a			;49a2
	jp z,L_491D		;49a3
L_49A6:
	ld a,031h		;49a6
	call L_57FF		;49a8
	call L_4B9F		;49ab
	call L_5222		;49ae
	call L_439F		;49b1
	call 09f22h		;49b4
	call L_438D		;49b7
	ld a,008h		;49ba
	ld (0de01h),a		;49bc
	ret			;49bf
L_49C0:
	call 066b3h		;49c0
	ld a,(0e1d1h)		;49c3
	rla			;49c6
	ret nc			;49c7
	ld hl,06003h		;49c8
	ld de,0e400h		;49cb
	ld bc,0002dh		;49ce
	call L_535A		;49d1
	jp L_4540		;49d4
L_49D7:
	ld hl,0e401h		;49d7
	ld b,00dh		;49da
L_49DC:
	ld e,(hl)			;49dc
	inc hl			;49dd
	ld d,(hl)			;49de
	rr e		;49df
	rra			;49e1
	rr e		;49e2
	rra			;49e4
	rr e		;49e5
	rra			;49e7
	rr e		;49e8
	rra			;49ea
	and 0f0h		;49eb
	jr z,L_49F1		;49ed
	sub 010h		;49ef
L_49F1:
	ld c,a			;49f1
	ld a,e			;49f2
	and 00fh		;49f3
	jr z,L_49F8		;49f5
	dec a			;49f7
L_49F8:
	ld e,a			;49f8
	ld a,c			;49f9
	rla			;49fa
	rl e		;49fb
	rla			;49fd
	rl e		;49fe
	rla			;4a00
	rl e		;4a01
	rla			;4a03
	rl e		;4a04
	ld a,d			;4a06
	and 00fh		;4a07
	jr z,L_4A0C		;4a09
	dec a			;4a0b
L_4A0C:
	ld d,a			;4a0c
	dec hl			;4a0d
	ld (hl),e			;4a0e
	inc hl			;4a0f
	ld (hl),d			;4a10
	inc hl			;4a11
	inc hl			;4a12
	djnz L_49DC		;4a13
	ret			;4a15
L_4A16:
	ld a,001h		;4a16
	ld (0ed9bh),a		;4a18
	ld a,006h		;4a1b
	ld (0de00h),a		;4a1d
	call 08461h		;4a20
	ld a,(0e19bh)		;4a23
	rra			;4a26
	jp c,L_4790		;4a27
	jp L_479E		;4a2a
L_4A2D:
	ld hl,0de04h		;4a2d
	dec (hl)			;4a30
	ret nz			;4a31
	ld a,030h		;4a32
	call L_57FF		;4a34
	call 0668fh		;4a37
	ld a,007h		;4a3a
	ld (0de00h),a		;4a3c
	jp L_4601		;4a3f

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4a42..0x4a9c  (90 bytes)
DATA_4A42:
	defb 0cdh,008h,066h,021h,033h,0e3h,0cdh,0f6h,065h,07bh,0b2h,0c8h,021h,004h,0deh,036h	; 4a42  ..f!3...e{..!..6
	defb 000h,06eh,011h,091h,0e1h,046h,010h,029h,0e6h,030h,028h,039h,03ah,090h,0e1h,0b7h	; 4a52  .n...F.).0(9:...
	defb 006h,040h,028h,00ch,03dh,006h,060h,028h,007h,03dh,006h,010h,028h,002h,006h,008h	; 4a62  .@(.=.`(.=..(...
	defb 078h,032h,002h,0deh,036h,003h,023h,0afh,04fh,032h,032h,0e3h,071h,00dh,0c3h,077h	; 4a72  x2..6.#.O22.q..w
	defb 065h,036h,001h,03eh,001h,0cdh,0ffh,057h,0afh,032h,0f4h,0efh,032h,090h,0e1h,032h	; 4a82  e6.>...W.2..2..2
	defb 032h,0e3h,0c3h,01ch,065h,01ah,0eeh,001h,012h,0c9h	; 4a92  2...e.....

; ======================================================================
; CODIGO 0x4a9c..0x4c39  (413 bytes)
; ======================================================================


L_4A9C:
	call L_4B10		;4a9c
	call L_4AAF		;4a9f
	ex af,af'			;4aa2
	ld a,(00006h)		;4aa3
	ld c,a			;4aa6
	ex af,af'			;4aa7
L_4AA8:
	inir		;4aa8
	dec a			;4aaa
	jr nz,L_4AA8		;4aab
	ex de,hl			;4aad
	ret			;4aae
L_4AAF:
	ex de,hl			;4aaf
	ld a,c			;4ab0
	or a			;4ab1
	ld a,b			;4ab2
	ld b,c			;4ab3
	ret z			;4ab4
	inc a			;4ab5
	ret			;4ab6
L_4AB7:
	ex de,hl			;4ab7
	call L_4AF1		;4ab8
	call L_4AAF		;4abb
	ex af,af'			;4abe
	ld a,(00007h)		;4abf
	ld c,a			;4ac2
	ex af,af'			;4ac3
L_4AC4:
	otir		;4ac4
	dec a			;4ac6
	jr nz,L_4AC4		;4ac7
	ret			;4ac9
L_4ACA:
	push de			;4aca
	push af			;4acb
	call L_4AF1		;4acc
	ld d,c			;4acf
	ld a,c			;4ad0
	or a			;4ad1
	jr z,L_4AD5		;4ad2
	inc b			;4ad4
L_4AD5:
	ld a,(00007h)		;4ad5
	ld c,a			;4ad8
	pop af			;4ad9
L_4ADA:
	out (c),a		;4ada
	dec d			;4adc
	jr nz,L_4ADA		;4add
	djnz L_4ADA		;4adf
	pop de			;4ae1
	ret			;4ae2
L_4AE3:
	push bc			;4ae3
	push af			;4ae4
	call L_4AF1		;4ae5
	ld a,(00007h)		;4ae8
	ld c,a			;4aeb
	pop af			;4aec
	out (c),a		;4aed
	pop bc			;4aef
	ret			;4af0
L_4AF1:
	push bc			;4af1
	ld a,(00007h)		;4af2
	inc a			;4af5
	ld c,a			;4af6
	ld a,h			;4af7
	rlca			;4af8
	rlca			;4af9
	and 003h		;4afa
	di			;4afc
	out (c),a		;4afd
	ld a,08eh		;4aff
	out (c),a		;4b01
	ld a,l			;4b03
	out (c),a		;4b04
	ld a,h			;4b06
	and 03fh		;4b07
	or 040h		;4b09
	out (c),a		;4b0b
	pop bc			;4b0d
	ei			;4b0e
	ret			;4b0f
L_4B10:
	push bc			;4b10
	ld a,(00007h)		;4b11
	inc a			;4b14
	ld c,a			;4b15
	ld a,h			;4b16
	rlca			;4b17
	rlca			;4b18
	and 003h		;4b19
	di			;4b1b
	out (c),a		;4b1c
	ld a,08eh		;4b1e
	out (c),a		;4b20
	ld a,l			;4b22
	out (c),a		;4b23
	ld a,h			;4b25
	and 03fh		;4b26
	out (c),a		;4b28
	pop bc			;4b2a
	ei			;4b2b
	ret			;4b2c
L_4B2D:
	ld c,000h		;4b2d
	ex de,hl			;4b2f
	ld e,(hl)			;4b30
	inc hl			;4b31
	ld d,(hl)			;4b32
	inc hl			;4b33
	ex de,hl			;4b34
L_4B35:
	call L_4AF1		;4b35
	exx			;4b38
	ld a,(00007h)		;4b39
	ld c,a			;4b3c
	exx			;4b3d
L_4B3E:
	ld a,(de)			;4b3e
	and a			;4b3f
	ret z			;4b40
	inc de			;4b41
	ld b,a			;4b42
	and 07fh		;4b43
	cp b			;4b45
	jr z,L_4B57		;4b46
	and a			;4b48
	jr z,L_4B2D		;4b49
	ld b,a			;4b4b
L_4B4C:
	call L_4B8F		;4b4c
	exx			;4b4f
	out (c),a		;4b50
	exx			;4b52
	djnz L_4B4C		;4b53
	jr L_4B3E		;4b55
L_4B57:
	call L_4B8F		;4b57
L_4B5A:
	exx			;4b5a
	out (c),a		;4b5b
	exx			;4b5d
	djnz L_4B5A		;4b5e
	jr L_4B3E		;4b60
L_4B62:
	ld c,000h		;4b62
	jr L_4B35		;4b64
L_4B66:
	call L_4B72		;4b66
	ld a,020h		;4b69
	call L_421B		;4b6b
	dec c			;4b6e
	jr nz,L_4B66		;4b6f
	ret			;4b71
L_4B72:
	push de			;4b72
L_4B73:
	ld b,010h		;4b73
L_4B75:
	ld a,(hl)			;4b75
	call L_4B94		;4b76
	ex de,hl			;4b79
	call L_4AE3		;4b7a
	ex de,hl			;4b7d
	inc de			;4b7e
	inc hl			;4b7f
	djnz L_4B75		;4b80
	ld a,e			;4b82
	sub 020h		;4b83
	ld e,a			;4b85
	jr nc,L_4B89		;4b86
	dec d			;4b88
L_4B89:
	bit 4,e		;4b89
	jr z,L_4B73		;4b8b
	pop de			;4b8d
	ret			;4b8e
L_4B8F:
	ld a,(de)			;4b8f
	inc de			;4b90
	bit 0,c		;4b91
	ret z			;4b93
L_4B94:
	push bc			;4b94
	ld c,a			;4b95
	ld b,008h		;4b96
L_4B98:
	rr c		;4b98
	rla			;4b9a
	djnz L_4B98		;4b9b
	pop bc			;4b9d
	ret			;4b9e
L_4B9F:
	call L_4BD2		;4b9f
L_4BA2:
	call L_4BC5		;4ba2
	ld hl,00000h		;4ba5
	ld bc,00000h		;4ba8
	xor a			;4bab
	ld d,000h		;4bac
	call L_4D2A		;4bae
	ld b,000h		;4bb1
	ld c,017h		;4bb3
	call 00047h		;4bb5   ; BIOS WRTVDP - Writes data in the VDP-register
L_4BB8:
	ld a,(0f3e0h)		;4bb8
	or 040h		;4bbb
	ld b,a			;4bbd
	ld c,001h		;4bbe
	call 00047h		;4bc0   ; BIOS WRTVDP - Writes data in the VDP-register
	jr L_4BE5		;4bc3
L_4BC5:
	ld a,(0f3e0h)		;4bc5
	and 0bfh		;4bc8
	ld b,a			;4bca
	ld c,001h		;4bcb
	call 00047h		;4bcd   ; BIOS WRTVDP - Writes data in the VDP-register
	jr L_4BDA		;4bd0
L_4BD2:
	ld hl,0f600h		;4bd2
	ld a,0d8h		;4bd5
	jp L_4AE3		;4bd7
L_4BDA:
	ld a,(0ffe7h)		;4bda
	or 002h		;4bdd
	ld b,a			;4bdf
	ld c,008h		;4be0
	jp 00047h		;4be2   ; BIOS WRTVDP - Writes data in the VDP-register
L_4BE5:
	ld a,(0ffe7h)		;4be5
	and 0fdh		;4be8
	ld b,a			;4bea
	ld c,008h		;4beb
	jp 00047h		;4bed   ; BIOS WRTVDP - Writes data in the VDP-register
L_4BF0:
	push bc			;4bf0
	push hl			;4bf1
	ld b,a			;4bf2
	ld a,(00007h)		;4bf3
	inc a			;4bf6
	ld c,a			;4bf7
	di			;4bf8
	out (c),b		;4bf9
	ld a,090h		;4bfb
	out (c),a		;4bfd
	inc c			;4bff
	out (c),d		;4c00
	push af			;4c02
	pop af			;4c03
	out (c),e		;4c04
	ld hl,0ddc0h		;4c06
	ld a,b			;4c09
	add a,a			;4c0a
	call L_4216		;4c0b
	ld (hl),d			;4c0e
	inc hl			;4c0f
	ld (hl),e			;4c10
	dec c			;4c11
	ld hl,0f680h		;4c12
	ld a,b			;4c15
	add a,a			;4c16
	add a,l			;4c17
	ld l,a			;4c18
	call L_4AF1		;4c19
	dec c			;4c1c
	out (c),d		;4c1d
	out (c),e		;4c1f
L_4C21:
	pop hl			;4c21
	pop bc			;4c22
	ei			;4c23
	ret			;4c24
L_4C25:
	ld hl,04c39h		;4c25
	ld b,010h		;4c28
	ld a,000h		;4c2a
L_4C2C:
	ld d,(hl)			;4c2c
	inc hl			;4c2d
	ld e,(hl)			;4c2e
	inc hl			;4c2f
	push af			;4c30
	call L_4BF0		;4c31
	pop af			;4c34
	inc a			;4c35
	djnz L_4C2C		;4c36
	ret			;4c38

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4c39..0x4c59  (32 bytes)
DATA_4C39:
	defb 000h,000h,000h,000h,011h,006h,033h,007h,017h,001h,027h,003h,051h,001h,027h,006h	; 4c39  ......3...'.Q.'.
	defb 071h,001h,073h,003h,061h,006h,064h,006h,011h,004h,065h,002h,055h,005h,077h,007h	; 4c49  q.s.a.d...e.U.w.

; ======================================================================
; CODIGO 0x4c59..0x51b2  (1369 bytes)
; ======================================================================


L_4C59:
	ld a,(hl)			;4c59
	inc hl			;4c5a
	inc a			;4c5b
	ret z			;4c5c
	dec a			;4c5d
	ld d,(hl)			;4c5e
	inc hl			;4c5f
	ld e,(hl)			;4c60
	inc hl			;4c61
	call L_4BF0		;4c62
	jr L_4C59		;4c65
L_4C67:
	ld a,002h		;4c67
	call L_4C71		;4c69
	rra			;4c6c
	jp c,L_4C67		;4c6d
	ret			;4c70
L_4C71:
	push bc			;4c71
	push hl			;4c72
	ld hl,(00006h)		;4c73
	inc h			;4c76
	inc l			;4c77
	ld c,h			;4c78
	di			;4c79
	out (c),a		;4c7a
	ld a,08fh		;4c7c
	out (c),a		;4c7e
	ld c,l			;4c80
	in a,(c)		;4c81
	push af			;4c83
	xor a			;4c84
	ld c,h			;4c85
	out (c),a		;4c86
	ld a,08fh		;4c88
	out (c),a		;4c8a
	pop af			;4c8c
	pop hl			;4c8d
	pop bc			;4c8e
	ei			;4c8f
	ret			;4c90
L_4C91:
	call L_4C67		;4c91
	push bc			;4c94
	ld a,(00007h)		;4c95
	inc a			;4c98
	ld c,a			;4c99
	ld a,024h		;4c9a
	di			;4c9c
	out (c),a		;4c9d
	ld a,091h		;4c9f
	out (c),a		;4ca1
	inc c			;4ca3
	inc c			;4ca4
	out (c),h		;4ca5
	xor a			;4ca7
	out (c),a		;4ca8
	out (c),l		;4caa
	out (c),a		;4cac
	pop hl			;4cae
	out (c),h		;4caf
	xor a			;4cb1
	cp h			;4cb2
	jr nz,L_4CB6		;4cb3
	inc a			;4cb5
L_4CB6:
	out (c),a		;4cb6
	xor a			;4cb8
	out (c),a		;4cb9
	out (c),a		;4cbb
	out (c),l		;4cbd
	out (c),a		;4cbf
	ld a,070h		;4cc1
	out (c),a		;4cc3
	ei			;4cc5
	ret			;4cc6
L_4CC7:
	call L_4C67		;4cc7
	push bc			;4cca
	ld a,(00007h)		;4ccb
	inc a			;4cce
	ld c,a			;4ccf
	ld a,024h		;4cd0
	di			;4cd2
	out (c),a		;4cd3
	ld a,091h		;4cd5
	out (c),a		;4cd7
	inc c			;4cd9
	inc c			;4cda
	out (c),h		;4cdb
	xor a			;4cdd
	out (c),a		;4cde
	out (c),l		;4ce0
	out (c),a		;4ce2
	pop hl			;4ce4
	out (c),h		;4ce5
	xor a			;4ce7
	cp h			;4ce8
	jr nz,L_4CEC		;4ce9
	inc a			;4ceb
L_4CEC:
	out (c),a		;4cec
	xor a			;4cee
	out (c),a		;4cef
	out (c),a		;4cf1
	out (c),l		;4cf3
	inc a			;4cf5
	out (c),a		;4cf6
	ld a,070h		;4cf8
	out (c),a		;4cfa
	ei			;4cfc
	ret			;4cfd
L_4CFE:
	ld b,e			;4cfe
	call L_4D16		;4cff
	ld b,d			;4d02
	call L_4D20		;4d03
	push hl			;4d06
	ld a,l			;4d07
	add a,e			;4d08
	ld l,a			;4d09
	ld b,d			;4d0a
	call L_4D20		;4d0b
	pop hl			;4d0e
	ld a,h			;4d0f
	add a,d			;4d10
	ld h,a			;4d11
	ld b,e			;4d12
	jp L_4D16		;4d13
L_4D16:
	push hl			;4d16
	push de			;4d17
	push bc			;4d18
	call L_4CC7		;4d19
	pop bc			;4d1c
	pop de			;4d1d
	pop hl			;4d1e
	ret			;4d1f
L_4D20:
	push hl			;4d20
	push de			;4d21
	push bc			;4d22
	call L_4C91		;4d23
	pop bc			;4d26
	pop de			;4d27
	pop hl			;4d28
	ret			;4d29
L_4D2A:
	ex af,af'			;4d2a
	call L_4C67		;4d2b
	push bc			;4d2e
	ld a,(00007h)		;4d2f
	inc a			;4d32
	ld c,a			;4d33
	ld a,024h		;4d34
	di			;4d36
	out (c),a		;4d37
	ld a,091h		;4d39
	out (c),a		;4d3b
	inc c			;4d3d
	inc c			;4d3e
	out (c),h		;4d3f
	xor a			;4d41
	out (c),a		;4d42
	out (c),l		;4d44
	out (c),d		;4d46
	pop hl			;4d48
	out (c),h		;4d49
	cp h			;4d4b
	jr nz,L_4D4F		;4d4c
	inc a			;4d4e
L_4D4F:
	out (c),a		;4d4f
	xor a			;4d51
	out (c),l		;4d52
	cp l			;4d54
	jr nz,L_4D58		;4d55
	inc a			;4d57
L_4D58:
	out (c),a		;4d58
	ex af,af'			;4d5a
	out (c),a		;4d5b
	xor a			;4d5d
	out (c),a		;4d5e
	ld a,0c0h		;4d60
	out (c),a		;4d62
	ei			;4d64
	ret			;4d65
L_4D66:
	ex af,af'			;4d66
	call L_4C67		;4d67
	push bc			;4d6a
	ld a,(00007h)		;4d6b
	inc a			;4d6e
	ld c,a			;4d6f
	ld a,020h		;4d70
	di			;4d72
	out (c),a		;4d73
	ld a,091h		;4d75
	out (c),a		;4d77
	inc c			;4d79
	inc c			;4d7a
	out (c),h		;4d7b
	xor a			;4d7d
	out (c),a		;4d7e
	out (c),l		;4d80
	ex af,af'			;4d82
	ld l,a			;4d83
	and 003h		;4d84
	out (c),a		;4d86
	out (c),d		;4d88
	xor a			;4d8a
	out (c),a		;4d8b
	out (c),e		;4d8d
	ld a,l			;4d8f
	rra			;4d90
	rra			;4d91
	and 003h		;4d92
	out (c),a		;4d94
	pop hl			;4d96
	out (c),h		;4d97
	xor a			;4d99
	out (c),a		;4d9a
	out (c),l		;4d9c
	out (c),a		;4d9e
	out (c),a		;4da0
	out (c),a		;4da2
	ld a,0d0h		;4da4
	out (c),a		;4da6
	ei			;4da8
	ret			;4da9
L_4DAA:
	ex af,af'			;4daa
	call L_4C67		;4dab
	push bc			;4dae
	ld a,(00007h)		;4daf
	inc a			;4db2
	ld c,a			;4db3
	ld a,024h		;4db4
	di			;4db6
	out (c),a		;4db7
	ld a,091h		;4db9
	out (c),a		;4dbb
	inc c			;4dbd
	inc c			;4dbe
	out (c),d		;4dbf
	xor a			;4dc1
	out (c),a		;4dc2
	out (c),e		;4dc4
	ex af,af'			;4dc6
	out (c),a		;4dc7
	pop de			;4dc9
	out (c),d		;4dca
	xor a			;4dcc
	out (c),a		;4dcd
	out (c),e		;4dcf
	out (c),a		;4dd1
	ld a,(hl)			;4dd3
	inc hl			;4dd4
	out (c),a		;4dd5
	xor a			;4dd7
	out (c),a		;4dd8
	ld a,0f0h		;4dda
	out (c),a		;4ddc
	dec c			;4dde
	dec c			;4ddf
	ld a,0ach		;4de0
	out (c),a		;4de2
	ld a,091h		;4de4
	out (c),a		;4de6
	inc c			;4de8
	inc c			;4de9
L_4DEA:
	ld a,002h		;4dea
	call L_4C71		;4dec
	rra			;4def
	ret nc			;4df0
	add a,a			;4df1
	add a,a			;4df2
	jr nc,L_4DEA		;4df3
	ld a,(hl)			;4df5
	inc hl			;4df6
	out (c),a		;4df7
	jr L_4DEA		;4df9
L_4DFB:
	ex af,af'			;4dfb
	call L_4C67		;4dfc
	push bc			;4dff
	ld a,(00007h)		;4e00
	inc a			;4e03
	ld c,a			;4e04
	ld a,020h		;4e05
	di			;4e07
	out (c),a		;4e08
	ld a,091h		;4e0a
	out (c),a		;4e0c
	inc c			;4e0e
	inc c			;4e0f
	out (c),h		;4e10
	xor a			;4e12
	out (c),a		;4e13
	out (c),l		;4e15
	ex af,af'			;4e17
	rlca			;4e18
	rlca			;4e19
	ld l,a			;4e1a
	and 003h		;4e1b
	out (c),a		;4e1d
	out (c),d		;4e1f
	xor a			;4e21
	out (c),a		;4e22
	out (c),e		;4e24
	ld a,l			;4e26
	ld e,a			;4e27
	rlca			;4e28
	rlca			;4e29
	and 003h		;4e2a
	out (c),a		;4e2c
	pop hl			;4e2e
	out (c),h		;4e2f
	xor a			;4e31
	out (c),a		;4e32
	out (c),l		;4e34
	out (c),a		;4e36
	out (c),a		;4e38
	out (c),a		;4e3a
	ld a,e			;4e3c
	rra			;4e3d
	rra			;4e3e
	and 00fh		;4e3f
	or 090h		;4e41
	out (c),a		;4e43
	ei			;4e45
	ret			;4e46
L_4E47:
	call L_4E76		;4e47
	call L_4F6F		;4e4a
	djnz L_4E47		;4e4d
	ret			;4e4f
L_4E50:
	ld b,008h		;4e50
	ld de,0de10h		;4e52
L_4E55:
	push bc			;4e55
	push hl			;4e56
	ex de,hl			;4e57
	ld a,(de)			;4e58
	ld d,a			;4e59
	ld b,004h		;4e5a
L_4E5C:
	ld a,c			;4e5c
	rl d		;4e5d
	jr c,L_4E62		;4e5f
	xor a			;4e61
L_4E62:
	rld		;4e62
	ld a,c			;4e64
	rl d		;4e65
	jr c,L_4E6A		;4e67
	xor a			;4e69
L_4E6A:
	rld		;4e6a
	inc hl			;4e6c
	djnz L_4E5C		;4e6d
	ex de,hl			;4e6f
	pop hl			;4e70
	inc hl			;4e71
	pop bc			;4e72
	djnz L_4E55		;4e73
	ret			;4e75
L_4E76:
	push bc			;4e76
	push de			;4e77
	push hl			;4e78
	push de			;4e79
	call L_4E50		;4e7a
	pop de			;4e7d
	ld b,d			;4e7e
	ld d,e			;4e7f
	ld e,b			;4e80
	srl d		;4e81
	rr e		;4e83
	ld a,d			;4e85
	add a,080h		;4e86
	ld d,a			;4e88
	ld hl,0de10h		;4e89
	ld b,008h		;4e8c
L_4E8E:
	push bc			;4e8e
	ld bc,00004h		;4e8f
	call L_4AB7		;4e92
	ex de,hl			;4e95
	ld bc,00080h		;4e96
	add hl,bc			;4e99
	ex de,hl			;4e9a
	pop bc			;4e9b
	djnz L_4E8E		;4e9c
	pop hl			;4e9e
	ld bc,00008h		;4e9f
	add hl,bc			;4ea2
	pop de			;4ea3
	pop bc			;4ea4
	ret			;4ea5
L_4EA6:
	call L_439C		;4ea6
	jr L_4EBA		;4ea9
L_4EAB:
	call L_439C		;4eab
	jr L_4EBE		;4eae
L_4EB0:
	call L_439C		;4eb0
	jr L_4EC0		;4eb3
L_4EB5:
	call L_439C		;4eb5
	jr L_4EC4		;4eb8
L_4EBA:
	ld c,0ffh		;4eba
	jr L_4EC0		;4ebc
L_4EBE:
	ld c,000h		;4ebe
L_4EC0:
	ld d,(hl)			;4ec0
	inc hl			;4ec1
	ld e,(hl)			;4ec2
	inc hl			;4ec3
L_4EC4:
	ld a,(hl)			;4ec4
	inc hl			;4ec5
	ld b,a			;4ec6
	inc b			;4ec7
	jp z,L_43BB		;4ec8
	inc b			;4ecb
	jr z,L_4EBA		;4ecc
	cp 0fdh		;4ece
	jr z,L_4EE6		;4ed0
	and c			;4ed2
	push af			;4ed3
	call L_4F1C		;4ed4
	pop af			;4ed7
	cp 00ch		;4ed8
	jr z,L_4EF6		;4eda
	cp 00dh		;4edc
	jr z,L_4EF6		;4ede
	ld a,d			;4ee0
	add a,008h		;4ee1
	ld d,a			;4ee3
	jr L_4EC4		;4ee4
L_4EE6:
	push hl			;4ee6
	push de			;4ee7
	push bc			;4ee8
	ld bc,00408h		;4ee9
	ex de,hl			;4eec
	xor a			;4eed
	ld d,000h		;4eee
	call L_4D2A		;4ef0
	pop bc			;4ef3
	pop de			;4ef4
	pop hl			;4ef5
L_4EF6:
	ld a,d			;4ef6
	add a,004h		;4ef7
	ld d,a			;4ef9
	jr L_4EC4		;4efa
L_4EFC:
	push de			;4efc
L_4EFD:
	ld a,(hl)			;4efd
	inc hl			;4efe
	ld c,a			;4eff
	inc a			;4f00
	jr z,L_4F1A		;4f01
	inc a			;4f03
	jr nz,L_4F11		;4f04
	pop de			;4f06
	ld a,(hl)			;4f07
	inc hl			;4f08
	add a,d			;4f09
	ld d,a			;4f0a
	ld a,008h		;4f0b
	add a,e			;4f0d
	ld e,a			;4f0e
	jr L_4EFC		;4f0f
L_4F11:
	ld a,c			;4f11
	call L_4F44		;4f12
	call L_4F6F		;4f15
	jr L_4EFD		;4f18
L_4F1A:
	pop de			;4f1a
	ret			;4f1b
L_4F1C:
	push bc			;4f1c
	ld c,000h		;4f1d
L_4F1F:
	push hl			;4f1f
	push de			;4f20
	call L_4F60		;4f21
	ld bc,00808h		;4f24
	ld a,001h		;4f27
	call L_4D66		;4f29
	pop de			;4f2c
	pop hl			;4f2d
	pop bc			;4f2e
	ret			;4f2f
L_4F30:
	push bc			;4f30
	ld c,028h		;4f31
	jr L_4F1F		;4f33
L_4F35:
	push bc			;4f35
	ld c,030h		;4f36
	jr L_4F1F		;4f38
L_4F3A:
	push bc			;4f3a
	ld c,068h		;4f3b
	jr L_4F1F		;4f3d
L_4F3F:
	push bc			;4f3f
	ld c,0a8h		;4f40
	jr L_4F1F		;4f42
L_4F44:
	push bc			;4f44
	push hl			;4f45
	push de			;4f46
	call L_4F56		;4f47
	ld bc,00808h		;4f4a
	ld a,005h		;4f4d
	call L_4D66		;4f4f
	pop de			;4f52
	pop hl			;4f53
	pop bc			;4f54
	ret			;4f55
L_4F56:
	ld c,038h		;4f56
	jr L_4F60		;4f58
L_4F5A:
	ld c,068h		;4f5a
	jr L_4F60		;4f5c
L_4F5E:
	ld c,000h		;4f5e
L_4F60:
	ld b,a			;4f60
	and 01fh		;4f61
	add a,a			;4f63
	add a,a			;4f64
	add a,a			;4f65
	ld h,a			;4f66
	ld a,b			;4f67
	and 0e0h		;4f68
	rrca			;4f6a
	rrca			;4f6b
	add a,c			;4f6c
	ld l,a			;4f6d
	ret			;4f6e
L_4F6F:
	ld a,d			;4f6f
	add a,008h		;4f70
	ld d,a			;4f72
	ret nz			;4f73
	ld a,e			;4f74
	add a,008h		;4f75
	ld e,a			;4f77
	ret			;4f78
L_4F79:
	push bc			;4f79
	call L_4F8E		;4f7a
	ld a,004h		;4f7d
	add a,e			;4f7f
	cp 080h		;4f80
	jr nz,L_4F89		;4f82
	ld a,004h		;4f84
	add a,d			;4f86
	ld d,a			;4f87
	xor a			;4f88
L_4F89:
	ld e,a			;4f89
	pop bc			;4f8a
	djnz L_4F79		;4f8b
	ret			;4f8d
L_4F8E:
	push de			;4f8e
	ld b,008h		;4f8f
L_4F91:
	push bc			;4f91
	ld bc,00004h		;4f92
	call L_4AB7		;4f95
	ex de,hl			;4f98
	ld bc,00080h		;4f99
	add hl,bc			;4f9c
	ex de,hl			;4f9d
	pop bc			;4f9e
	djnz L_4F91		;4f9f
	pop de			;4fa1
	ret			;4fa2
L_4FA3:
	ld b,(hl)			;4fa3
	inc hl			;4fa4
L_4FA5:
	push bc			;4fa5
	push de			;4fa6
	ld a,(hl)			;4fa7
	ld c,a			;4fa8
	ex de,hl			;4fa9
	and 0f0h		;4faa
	rrca			;4fac
	rrca			;4fad
	rrca			;4fae
	rrca			;4faf
	call L_556D		;4fb0
	push de			;4fb3
	push bc			;4fb4
	ld a,c			;4fb5
	and 006h		;4fb6
	add a,a			;4fb8
	jr nz,L_4FBD		;4fb9
	ld a,002h		;4fbb
L_4FBD:
	ld c,a			;4fbd
	ld b,000h		;4fbe
	ld de,0ec00h		;4fc0
	ldir		;4fc3
	pop bc			;4fc5
	pop hl			;4fc6
	inc hl			;4fc7
	ld e,(hl)			;4fc8
	inc hl			;4fc9
	ld d,(hl)			;4fca
	inc hl			;4fcb
	ld b,(hl)			;4fcc
	inc hl			;4fcd
	ld a,(hl)			;4fce
	inc hl			;4fcf
	push hl			;4fd0
	ld h,(hl)			;4fd1
	ld l,a			;4fd2
	call L_4FDD		;4fd3
	pop hl			;4fd6
	pop de			;4fd7
	inc hl			;4fd8
	pop bc			;4fd9
	djnz L_4FA5		;4fda
	ret			;4fdc
L_4FDD:
	ld a,c			;4fdd
	and 00fh		;4fde
	jr z,L_4FF2		;4fe0
	dec a			;4fe2
	jr z,L_5008		;4fe3
	dec a			;4fe5
	jr z,L_504B		;4fe6
	dec a			;4fe8
	jr z,L_5061		;4fe9
	dec a			;4feb
	jp z,L_50AC		;4fec
	jp L_50C2		;4fef
L_4FF2:
	push bc			;4ff2
	push de			;4ff3
	exx			;4ff4
	ld hl,0e400h		;4ff5
	exx			;4ff8
L_4FF9:
	push bc			;4ff9
	call L_501E		;4ffa
	pop bc			;4ffd
	djnz L_4FF9		;4ffe
	pop de			;5000
	pop bc			;5001
	ld hl,0e400h		;5002
	jp L_4F79		;5005
L_5008:
	push bc			;5008
	push de			;5009
	exx			;500a
	ld hl,0e400h		;500b
	exx			;500e
L_500F:
	push bc			;500f
	call L_501E		;5010
	pop bc			;5013
	djnz L_500F		;5014
	pop de			;5016
	pop bc			;5017
	ld hl,0e400h		;5018
	jp L_513B		;501b
L_501E:
	ld b,008h		;501e
L_5020:
	ld e,(hl)			;5020
	inc hl			;5021
	push bc			;5022
	call L_502A		;5023
	pop bc			;5026
	djnz L_5020		;5027
	ret			;5029
L_502A:
	ld b,004h		;502a
L_502C:
	xor a			;502c
	rl e		;502d
	rla			;502f
	exx			;5030
	ld e,a			;5031
	ld d,0ech		;5032
	ld a,(de)			;5034
	add a,a			;5035
	add a,a			;5036
	add a,a			;5037
	add a,a			;5038
	ld c,a			;5039
	exx			;503a
	xor a			;503b
	rl e		;503c
	rla			;503e
	exx			;503f
	ld e,a			;5040
	ld d,0ech		;5041
	ld a,(de)			;5043
	or c			;5044
	ld (hl),a			;5045
	inc hl			;5046
	exx			;5047
	djnz L_502C		;5048
	ret			;504a
L_504B:
	push bc			;504b
	push de			;504c
	exx			;504d
	ld hl,0e400h		;504e
	exx			;5051
L_5052:
	push bc			;5052
	call L_5077		;5053
	pop bc			;5056
	djnz L_5052		;5057
	pop de			;5059
	pop bc			;505a
	ld hl,0e400h		;505b
	jp L_4F79		;505e
L_5061:
	push bc			;5061
	push de			;5062
	exx			;5063
	ld hl,0e400h		;5064
	exx			;5067
L_5068:
	push bc			;5068
	call L_5077		;5069
	pop bc			;506c
	djnz L_5068		;506d
	pop de			;506f
	pop bc			;5070
	ld hl,0e400h		;5071
	jp L_513B		;5074
L_5077:
	ld b,008h		;5077
L_5079:
	push bc			;5079
	call L_5081		;507a
	pop bc			;507d
	djnz L_5079		;507e
	ret			;5080
L_5081:
	ld b,004h		;5081
	ld e,(hl)			;5083
	inc hl			;5084
	ld d,(hl)			;5085
	inc hl			;5086
L_5087:
	xor a			;5087
	rl d		;5088
	rla			;508a
	rl e		;508b
	rla			;508d
	exx			;508e
	ld e,a			;508f
	ld d,0ech		;5090
	ld a,(de)			;5092
	add a,a			;5093
	add a,a			;5094
	add a,a			;5095
	add a,a			;5096
	ld c,a			;5097
	exx			;5098
	xor a			;5099
	rl d		;509a
	rla			;509c
	rl e		;509d
	rla			;509f
	exx			;50a0
	ld e,a			;50a1
	ld d,0ech		;50a2
	ld a,(de)			;50a4
	or c			;50a5
	ld (hl),a			;50a6
	inc hl			;50a7
	exx			;50a8
	djnz L_5087		;50a9
	ret			;50ab
L_50AC:
	push bc			;50ac
	push de			;50ad
	exx			;50ae
	ld hl,0e400h		;50af
	exx			;50b2
L_50B3:
	push bc			;50b3
	call L_50D8		;50b4
	pop bc			;50b7
	djnz L_50B3		;50b8
	pop de			;50ba
	pop bc			;50bb
	ld hl,0e400h		;50bc
	jp L_4F79		;50bf
L_50C2:
	push bc			;50c2
	push de			;50c3
	exx			;50c4
	ld hl,0e400h		;50c5
	exx			;50c8
L_50C9:
	push bc			;50c9
	call L_50D8		;50ca
	pop bc			;50cd
	djnz L_50C9		;50ce
	pop de			;50d0
	pop bc			;50d1
	ld hl,0e400h		;50d2
	jp L_513B		;50d5
L_50D8:
	ld b,008h		;50d8
L_50DA:
	push bc			;50da
	call L_50E2		;50db
	pop bc			;50de
	djnz L_50DA		;50df
	ret			;50e1
L_50E2:
	ld b,004h		;50e2
	ld e,(hl)			;50e4
	inc hl			;50e5
	ld d,(hl)			;50e6
	inc hl			;50e7
	ld c,(hl)			;50e8
	inc hl			;50e9
L_50EA:
	xor a			;50ea
	rl c		;50eb
	rla			;50ed
	rl d		;50ee
	rla			;50f0
	rl e		;50f1
	rla			;50f3
	exx			;50f4
	ld e,a			;50f5
	ld d,0ech		;50f6
	ld a,(de)			;50f8
	add a,a			;50f9
	add a,a			;50fa
	add a,a			;50fb
	add a,a			;50fc
	ld c,a			;50fd
	exx			;50fe
	xor a			;50ff
	rl c		;5100
	rla			;5102
	rl d		;5103
	rla			;5105
	rl e		;5106
	rla			;5108
	exx			;5109
	ld e,a			;510a
	ld d,0ech		;510b
	ld a,(de)			;510d
	or c			;510e
	ld (hl),a			;510f
	inc hl			;5110
	exx			;5111
	djnz L_50EA		;5112
	ret			;5114
L_5115:
	push de			;5115
	ld a,(00007h)		;5116
	ld c,a			;5119
	ld b,008h		;511a
L_511C:
	push bc			;511c
	ex de,hl			;511d
	call L_4AF1		;511e
	ex de,hl			;5121
	ld b,004h		;5122
L_5124:
	ld a,(hl)			;5124
	dec hl			;5125
	rrca			;5126
	rrca			;5127
	rrca			;5128
	rrca			;5129
	out (c),a		;512a
	djnz L_5124		;512c
	ld c,008h		;512e
	add hl,bc			;5130
	ex de,hl			;5131
	ld c,080h		;5132
	add hl,bc			;5134
	ex de,hl			;5135
	pop bc			;5136
	djnz L_511C		;5137
	pop de			;5139
	ret			;513a
L_513B:
	inc hl			;513b
	inc hl			;513c
	inc hl			;513d
L_513E:
	push bc			;513e
	call L_5115		;513f
	ld a,004h		;5142
	add a,e			;5144
	cp 080h		;5145
	jr nz,L_514E		;5147
	ld a,004h		;5149
	add a,d			;514b
	ld d,a			;514c
	xor a			;514d
L_514E:
	ld e,a			;514e
	pop bc			;514f
	djnz L_513E		;5150
	ret			;5152
L_5153:
	ld a,(0e1cbh)		;5153
	or a			;5156
	jr z,L_5168		;5157
	ld a,(0e19bh)		;5159
	rra			;515c
	and 07fh		;515d
	cp 006h		;515f
	jr z,L_5180		;5161
	ld hl,07925h		;5163
	jr L_5174		;5166
L_5168:
	ld hl,0ba9bh		;5168
	ld a,(0e1feh)		;516b
	or a			;516e
	jr z,L_5174		;516f
	ld hl,0ba8eh		;5171
L_5174:
	call L_439F		;5174
L_5177:
	ld de,051b2h		;5177
	call L_4FA3		;517a
	jp L_438D		;517d
L_5180:
	ld hl,096eeh		;5180
	jr L_51AD		;5183
L_5185:
	ld hl,094bbh		;5185
	ld a,(0e1feh)		;5188
	or a			;518b
	jr z,L_51AD		;518c
	ld hl,094aeh		;518e
	jr L_51AD		;5191
L_5193:
	ld hl,09401h		;5193
	ld a,(0e1feh)		;5196
	or a			;5199
	jr z,L_51AD		;519a
	ld hl,093f4h		;519c
	jr L_51AD		;519f
L_51A1:
	ld hl,095a8h		;51a1
	ld a,(0e1feh)		;51a4
	or a			;51a7
	jr z,L_51AD		;51a8
	ld hl,095bbh		;51aa
L_51AD:
	call L_4397		;51ad
	jr L_5177		;51b0

; ----------------------------------------------------------------------
; DATOS paletas_51B2: 1 punteros a los colores de cada paleta (p00:556D desde
;   p00:4FB0), para la lista 0x7925; se solapan 2 bloques: (paletas_51B2
;   51B2-51B6); lo leen p00:5174, p00:51AD (4 bytes)
;   0x51b2..0x51b6  (4 bytes)
DATA_paletas_51B2:
	defw 051b6h	; 51b2  -> DATA_colores_51B6
	defw 051bah	; 51b4  -> DATA_colores_51BA

; ----------------------------------------------------------------------
; DATOS colores_51B6: 4 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 0 de la lista 0x7925; lo leen p00:5174,
;   p00:51AD (4 bytes)
;   0x51b6..0x51ba  (4 bytes)
DATA_colores_51B6:
	defb 000h,001h,009h,00dh	; 51b6

; ----------------------------------------------------------------------
; DATOS colores_51BA: 4 colores (un nibble cada uno, ya en su sitio) que
;   p00:4FC3 copia a 0xEC00: la paleta 1 de la lista 0x9401; lo leen p00:51AD
;   (4 bytes)
;   0x51ba..0x51be  (4 bytes)
DATA_colores_51BA:
	defb 000h,001h,00ah,00dh	; 51ba

; ======================================================================
; CODIGO 0x51be..0x5975  (1975 bytes)
; ======================================================================


L_51BE:
	call L_4392		;51be
	ld de,0602bh		;51c1
	ld hl,060aeh		;51c4
	call L_4FA3		;51c7
	jp L_438D		;51ca
L_51CD:
	call L_4397		;51cd
	ld hl,08719h		;51d0
	ld de,0fa00h		;51d3
	ld bc,00040h		;51d6
	call L_4AB7		;51d9
	jp L_438D		;51dc
L_51DF:
	ld a,(0e218h)		;51df
	cp (ix+007h)		;51e2
	ld hl,08699h		;51e5
	jr c,L_51ED		;51e8
	ld hl,086d9h		;51ea
L_51ED:
	call L_4397		;51ed
	ld de,0fa00h		;51f0
	ld bc,00040h		;51f3
	call L_4AB7		;51f6
	jp L_438D		;51f9
L_51FC:
	call L_5202		;51fc
	jp L_439F		;51ff
L_5202:
	call L_4397		;5202
	ld de,0bbfeh		;5205
	ld hl,0f800h		;5208
	call L_4B62		;520b
	ld de,0bc2fh		;520e
	ld hl,0f860h		;5211
	call L_4B62		;5214
	ld a,008h		;5217
	ld de,07307h		;5219
	call L_4BF0		;521c
	jp L_438D		;521f
L_5222:
	call L_5561		;5222
	call L_4397		;5225
	ld de,0a01fh		;5228
	ld hl,0a05fh		;522b
	call L_4FA3		;522e
	ld hl,0b163h		;5231
	ld de,0f800h		;5234
	ld bc,004e0h		;5237
	call L_4AB7		;523a
	ld hl,09feah		;523d
	ld de,00080h		;5240
	call L_4EFC		;5243
	ld de,0e800h		;5246
	ld hl,09f4ah		;5249
	ld bc,000a0h		;524c
	ldir		;524f
	ld de,04030h		;5251
	ld hl,0e800h		;5254
	ld bc,0100ah		;5257
	call L_55CD		;525a
	ld de,08080h		;525d
	ld hl,04048h		;5260
	ld bc,08018h		;5263
	ld a,004h		;5266
	call L_4D66		;5268
	jp L_438D		;526b
L_526E:
	call L_5561		;526e
	call L_4397		;5271
	ld de,0a7efh		;5274
	ld hl,0a82fh		;5277
	call L_4FA3		;527a
	ld de,0ad58h		;527d
	ld hl,0ad72h		;5280
	call L_4FA3		;5283
	ld hl,0b643h		;5286
	ld de,0f800h		;5289
	ld bc,00080h		;528c
	call L_4AB7		;528f
	ld hl,0a7b8h		;5292
	ld de,00080h		;5295
	call L_4EFC		;5298
	ld de,0e800h		;529b
	ld hl,0a718h		;529e
	ld bc,000a0h		;52a1
	ldir		;52a4
	ld de,04030h		;52a6
	ld hl,0e800h		;52a9
	ld bc,0100ah		;52ac
	call L_55CD		;52af
	jp L_438D		;52b2
L_52B5:
	call L_4392		;52b5
	ld de,0f818h		;52b8
	ld hl,0b942h		;52bb
	ld bc,0110dh		;52be
	call L_4E47		;52c1
	jp L_438D		;52c4
L_52C7:
	call L_4392		;52c7
	ld de,00028h		;52ca
L_52CD:
	ld hl,0b9dah		;52cd
	ld bc,00b0dh		;52d0
	call L_4E47		;52d3
	jp L_438D		;52d6
L_52D9:
	call L_4392		;52d9
	ld de,01020h		;52dc
	jr L_52CD		;52df
L_52E1:
	call L_52E7		;52e1
	jp L_439F		;52e4
L_52E7:
	call L_4392		;52e7
	ld de,0b066h		;52ea
	ld hl,0b07ah		;52ed
	call L_4FA3		;52f0
	ld hl,0b6b9h		;52f3
	ld de,02870h		;52f6
	call L_4EFC		;52f9
	ld a,00fh		;52fc
	ld de,07000h		;52fe
	call L_4BF0		;5301
	ld a,00ch		;5304
	ld de,06006h		;5306
	call L_4BF0		;5309
	jp L_438D		;530c
L_530F:
	call L_439F		;530f
	ld de,0ff00h		;5312
	ld hl,08fd1h		;5315
	ld bc,00100h		;5318
	call L_4AB7		;531b
	ld de,090d1h		;531e
	ld hl,090dbh		;5321
	call L_4FA3		;5324
	ld de,0f800h		;5327
	ld hl,08ad1h		;532a
	ld bc,00500h		;532d
	call L_4AB7		;5330
	jp L_438D		;5333
L_5336:
	call L_439F		;5336
	ld de,0fa00h		;5339
	ld hl,08951h		;533c
	ld bc,00180h		;533f
	call L_4AB7		;5342
	jp L_438D		;5345
L_5348:
	call L_439F		;5348
	ld de,0f800h		;534b
	ld hl,08751h		;534e
	ld bc,00200h		;5351
	call L_4AB7		;5354
	jp L_438D		;5357
L_535A:
	call L_4392		;535a
	ldir		;535d
	jp L_438D		;535f
L_5362:
	ld hl,0e800h		;5362
	ld b,01eh		;5365
	xor a			;5367
L_5368:
	ld (hl),a			;5368
	inc hl			;5369
	inc a			;536a
	djnz L_5368		;536b
	ld de,04020h		;536d
	ld hl,0e800h		;5370
	ld bc,00f02h		;5373
	call L_55CD		;5376
	jp L_438D		;5379
L_537C:
	call L_538E		;537c
	call L_4397		;537f
	ld de,0bbc3h		;5382
	ld hl,0fd00h		;5385
	call L_4B62		;5388
	jp L_438D		;538b
L_538E:
	call L_4397		;538e
	ld de,076beh		;5391
	ld hl,0fe00h		;5394
	call L_4B62		;5397
	jp L_438D		;539a
L_539D:
	call L_4397		;539d
	ld de,0bc3ch		;53a0
	ld hl,0fd80h		;53a3
	call L_4B62		;53a6
	ld de,079adh		;53a9
	ld hl,0fb80h		;53ac
	call L_4B62		;53af
	ld de,07b90h		;53b2
	ld hl,0ff00h		;53b5
	call L_4B62		;53b8
	ld de,09380h		;53bb
	ld hl,0fe20h		;53be
	call L_4B62		;53c1
	ld a,00dh		;53c4
	call L_5716		;53c6
	jp L_438D		;53c9
L_53CC:
	call L_4397		;53cc
	ld de,0814bh		;53cf
	call L_4B2D		;53d2
	jp L_438D		;53d5
L_53D8:
	call L_4397		;53d8
	ld de,079adh		;53db
	ld hl,0fb80h		;53de
	call L_4B62		;53e1
	jp L_438D		;53e4
L_53E7:
	call L_4397		;53e7
	ld de,0fe00h		;53ea
	ld hl,0782dh		;53ed
	call L_4AB7		;53f0
	xor a			;53f3
L_53F4:
	call L_4397		;53f4
	ld de,0fe80h		;53f7
	ld hl,078adh		;53fa
	call L_4AB7		;53fd
	jp L_438D		;5400
L_5403:
	call L_4397		;5403
	ld a,001h		;5406
	ld (0ed9fh),a		;5408
	ld de,0ff00h		;540b
	ld hl,0792dh		;540e
	call L_4AB7		;5411
	xor a			;5414
	ld (0ed9fh),a		;5415
	jp L_438D		;5418
L_541B:
	call L_5427		;541b
	jp L_439F		;541e
L_5421:
	call L_546B		;5421
	jp L_439F		;5424
L_5427:
	call L_4BC5		;5427
	call L_4397		;542a
	ld hl,0f800h		;542d
	ld de,08ad9h		;5430
	call L_4B62		;5433
	call L_4392		;5436
	ld hl,06000h		;5439
	call L_4C59		;543c
	ld a,00dh		;543f
	ld de,07707h		;5441
	call L_4BF0		;5444
	ld de,0a5d8h		;5447
	ld hl,0a619h		;544a
	call L_4FA3		;544d
	ld hl,0e800h		;5450
	ld de,0afc4h		;5453
	call L_5659		;5456
	ld de,08068h		;5459
	ld hl,0e800h		;545c
	ld bc,0100bh		;545f
	call L_55CD		;5462
	call L_438D		;5465
	jp L_4BB8		;5468
L_546B:
	call L_4397		;546b
	ld hl,0f800h		;546e
	ld de,08fe3h		;5471
	call L_4B62		;5474
	jp L_438D		;5477
L_547A:
	call L_4392		;547a
	ld de,0602bh		;547d
	ld hl,06053h		;5480
	call L_4FA3		;5483
	ld de,062e5h		;5486
	ld hl,06323h		;5489
	call L_4FA3		;548c
	ld de,069a4h		;548f
	ld hl,069cah		;5492
	call L_4FA3		;5495
	jp L_438D		;5498
L_549B:
	call L_4392		;549b
	ld hl,08412h		;549e
	ld de,083e0h		;54a1
	call L_4FA3		;54a4
	ld hl,08b40h		;54a7
	ld de,08b21h		;54aa
	call L_4FA3		;54ad
	jp L_438D		;54b0
L_54B3:
	call L_4392		;54b3
	ld hl,06cc3h		;54b6
	ld de,06c87h		;54b9
	call L_4FA3		;54bc
	ld hl,073d6h		;54bf
	ld de,073c4h		;54c2
	call L_4FA3		;54c5
	ld hl,075ech		;54c8
	ld de,075b7h		;54cb
	call L_4FA3		;54ce
	ld hl,078b3h		;54d1
	ld de,07881h		;54d4
	call L_4FA3		;54d7
	ld hl,07ef1h		;54da
	ld de,07ed2h		;54dd
	call L_4FA3		;54e0
	ld hl,0b759h		;54e3
	ld de,0b747h		;54e6
	call L_4FA3		;54e9
	jp L_438D		;54ec
L_54EF:
	call L_4392		;54ef
	ld hl,08b53h		;54f2
	ld de,08b21h		;54f5
	call L_4FA3		;54f8
	jp L_438D		;54fb
L_54FE:
	add a,a			;54fe
	add a,a			;54ff
	call L_4216		;5500
	ld e,(hl)			;5503
	inc hl			;5504
	ld d,(hl)			;5505
	inc hl			;5506
	ld a,(hl)			;5507
	inc hl			;5508
	ld h,(hl)			;5509
	ld l,a			;550a
	jp L_4FA3		;550b
L_550E:
	call L_4392		;550e
	ld hl,06000h		;5511
	call L_4C59		;5514
	ld a,(0d70ah)		;5517
	and 00fh		;551a
	ld hl,0bfdeh		;551c
	add a,a			;551f
	call L_4216		;5520
	ld a,00bh		;5523
	ld d,(hl)			;5525
	inc hl			;5526
	ld e,(hl)			;5527
	call L_4BF0		;5528
	ld hl,0d70bh		;552b
	ld a,(0de02h)		;552e
	bit 4,a		;5531
	jr z,L_554C		;5533
	bit 5,a		;5535
	jr nz,L_554C		;5537
	ld a,(0d6dch)		;5539
	rra			;553c
	ld a,(0e197h)		;553d
	jr nc,L_5545		;5540
	ld a,(0e195h)		;5542
L_5545:
	dec a			;5545
	ld hl,0d70ah		;5546
	call L_4216		;5549
L_554C:
	ld a,(hl)			;554c
	and 00fh		;554d
	ld hl,0bfdeh		;554f
	add a,a			;5552
	call L_4216		;5553
	ld a,008h		;5556
	ld d,(hl)			;5558
	inc hl			;5559
	ld e,(hl)			;555a
	call L_4BF0		;555b
	jp L_438D		;555e
L_5561:
	call L_4392		;5561
	ld hl,06000h		;5564
	call L_4C59		;5567
	jp L_438D		;556a
L_556D:
	add a,a			;556d
	call L_4216		;556e
	ld a,(hl)			;5571
	inc hl			;5572
	ld h,(hl)			;5573
	ld l,a			;5574
	ret			;5575
L_5576:
	call L_4392		;5576
	ld hl,0e800h		;5579
	ld de,09220h		;557c
	call L_5659		;557f
	ld de,00000h		;5582
	ld hl,0e800h		;5585
	ld bc,0201bh		;5588
	call L_55F0		;558b
	jp L_438D		;558e
L_5591:
	call 0988ah		;5591
	call L_4392		;5594
	ld de,09178h		;5597
	ld hl,0e800h		;559a
	call L_5659		;559d
	ld de,0b808h		;55a0
	ld hl,0e800h		;55a3
	ld bc,0080ch		;55a6
	call L_5636		;55a9
	jp L_438D		;55ac
L_55AF:
	call 09897h		;55af
	call L_4392		;55b2
	ld de,091cch		;55b5
	ld hl,0e800h		;55b8
	call L_5659		;55bb
	ld de,00808h		;55be
	ld hl,0e800h		;55c1
	ld bc,0080ch		;55c4
	call L_5636		;55c7
	jp L_438D		;55ca
L_55CD:
	ld a,b			;55cd
	ld (0e340h),a		;55ce
	ld a,d			;55d1
	ld (0e341h),a		;55d2
L_55D5:
	ld a,(hl)			;55d5
	inc hl			;55d6
	call L_4F30		;55d7
	ld a,d			;55da
	add a,008h		;55db
	ld d,a			;55dd
	djnz L_55D5		;55de
	dec c			;55e0
	ret z			;55e1
	ld a,e			;55e2
	add a,008h		;55e3
	ld e,a			;55e5
	ld a,(0e341h)		;55e6
	ld d,a			;55e9
	ld a,(0e340h)		;55ea
	ld b,a			;55ed
	jr L_55CD		;55ee
L_55F0:
	ld a,b			;55f0
	ld (0e340h),a		;55f1
	ld a,d			;55f4
	ld (0e341h),a		;55f5
L_55F8:
	ld a,(hl)			;55f8
	inc hl			;55f9
	call L_4F35		;55fa
	ld a,d			;55fd
	add a,008h		;55fe
	ld d,a			;5600
	djnz L_55F8		;5601
	dec c			;5603
	ret z			;5604
	ld a,e			;5605
	add a,008h		;5606
	ld e,a			;5608
	ld a,(0e341h)		;5609
	ld d,a			;560c
	ld a,(0e340h)		;560d
	ld b,a			;5610
	jr L_55F0		;5611
L_5613:
	ld a,b			;5613
	ld (0e340h),a		;5614
	ld a,d			;5617
	ld (0e341h),a		;5618
L_561B:
	ld a,(hl)			;561b
	inc hl			;561c
	call L_4F3A		;561d
	ld a,d			;5620
	add a,008h		;5621
	ld d,a			;5623
	djnz L_561B		;5624
	dec c			;5626
	ret z			;5627
	ld a,e			;5628
	add a,008h		;5629
	ld e,a			;562b
	ld a,(0e341h)		;562c
	ld d,a			;562f
	ld a,(0e340h)		;5630
	ld b,a			;5633
	jr L_5613		;5634
L_5636:
	ld a,b			;5636
	ld (0e340h),a		;5637
	ld a,d			;563a
	ld (0e341h),a		;563b
L_563E:
	ld a,(hl)			;563e
	inc hl			;563f
	call L_4F3F		;5640
	ld a,d			;5643
	add a,008h		;5644
	ld d,a			;5646
	djnz L_563E		;5647
	dec c			;5649
	ret z			;564a
	ld a,e			;564b
	add a,008h		;564c
	ld e,a			;564e
	ld a,(0e341h)		;564f
	ld d,a			;5652
	ld a,(0e340h)		;5653
	ld b,a			;5656
	jr L_5636		;5657
L_5659:
	ld a,(de)			;5659
	and a			;565a
	ret z			;565b
	inc de			;565c
	ld b,a			;565d
	and 07fh		;565e
	cp b			;5660
	jr z,L_566F		;5661
	and a			;5663
	jr z,L_5659		;5664
	ld b,a			;5666
L_5667:
	ld a,(de)			;5667
	inc de			;5668
	ld (hl),a			;5669
	inc hl			;566a
	djnz L_5667		;566b
	jr L_5659		;566d
L_566F:
	ld a,(de)			;566f
	inc de			;5670
L_5671:
	ld (hl),a			;5671
	inc hl			;5672
	djnz L_5671		;5673
	jr L_5659		;5675
L_5677:
	call L_4397		;5677
	ld hl,06c00h		;567a
	ld a,(0e1feh)		;567d
	or a			;5680
	jr nz,L_568E		;5681
	ld de,0604dh		;5683
	call L_4B62		;5686
	ld hl,07c4bh		;5689
	jr L_5697		;568c
L_568E:
	ld de,06808h		;568e
	call L_4B62		;5691
	ld hl,07ecbh		;5694
L_5697:
	ld de,07880h		;5697
	ld bc,00280h		;569a
	call L_4AB7		;569d
	jp L_438D		;56a0
L_56A3:
	ld hl,000f1h		;56a3
	ld de,000f0h		;56a6
	ld bc,00005h		;56a9
	ld a,004h		;56ac
	jp L_4D66		;56ae
L_56B1:
	ld a,(0e1d3h)		;56b1
	add a,0f9h		;56b4
	ld l,a			;56b6
	ld h,000h		;56b7
	ld de,000fbh		;56b9
	ld bc,00001h		;56bc
	ld a,004h		;56bf
	jp L_4D66		;56c1
L_56C4:
	call L_4397		;56c4
	ld hl,07c00h		;56c7
	ld (0e340h),hl		;56ca
	ld a,(0e1ebh)		;56cd
	and 003h		;56d0
	ld hl,06fbeh		;56d2
	call L_556D		;56d5
	ld b,007h		;56d8
L_56DA:
	push bc			;56da
	ld e,(hl)			;56db
	inc hl			;56dc
	ld d,(hl)			;56dd
	inc hl			;56de
	push hl			;56df
	ld hl,(0e340h)		;56e0
	ld bc,00080h		;56e3
	add hl,bc			;56e6
	ld (0e340h),hl		;56e7
	ex de,hl			;56ea
	ld a,(0e1ebh)		;56eb
	and 004h		;56ee
	jr nz,L_570A		;56f0
	call L_4AB7		;56f2
L_56F5:
	pop hl			;56f5
	pop bc			;56f6
	djnz L_56DA		;56f7
	ld hl,000ffh		;56f9
	ld de,080f9h		;56fc
	ld bc,08001h		;56ff
	ld a,004h		;5702
	call L_4D66		;5704
	jp L_438D		;5707
L_570A:
	ld a,010h		;570a
	call L_421B		;570c
	ld c,004h		;570f
	call L_4B66		;5711
	jr L_56F5		;5714
L_5716:
	push hl			;5716
	push de			;5717
	push bc			;5718
	ld de,08759h		;5719
	ld bc,0ffc0h		;571c
	call L_5746		;571f
	ld c,040h		;5722
	call L_4AB7		;5724
	call L_438D		;5727
	pop bc			;572a
	pop de			;572b
	pop hl			;572c
	ret			;572d
L_572E:
	push hl			;572e
	push de			;572f
	push bc			;5730
	ld de,08499h		;5731
	ld bc,0fac0h		;5734
	call L_574E		;5737
	ld c,080h		;573a
	call L_4AB7		;573c
	call L_438D		;573f
	pop bc			;5742
	pop de			;5743
	pop hl			;5744
	ret			;5745
L_5746:
	call L_4397		;5746
	ld l,a			;5749
	ld h,000h		;574a
	jr L_5755		;574c
L_574E:
	call L_4397		;574e
	ld l,a			;5751
	ld h,000h		;5752
	add hl,hl			;5754
L_5755:
	add hl,hl			;5755
	add hl,hl			;5756
	add hl,hl			;5757
	add hl,hl			;5758
	add hl,hl			;5759
	add hl,hl			;575a
	add hl,de			;575b
	ld d,b			;575c
	ld e,c			;575d
	ld b,000h		;575e
	ret			;5760
L_5761:
	call L_4397		;5761
	ld a,(0e1f6h)		;5764
	ld (0e340h),a		;5767
	ld l,a			;576a
	ld h,000h		;576b
	ld c,a			;576d
	ld b,h			;576e
	add hl,hl			;576f
	ld d,h			;5770
	ld e,l			;5771
	add hl,hl			;5772
	add hl,hl			;5773
	add hl,de			;5774
	add hl,bc			;5775
	ld de,06000h		;5776
	add hl,de			;5779
	ld a,(hl)			;577a
	ld (0e341h),a		;577b
	and 00fh		;577e
	ld b,a			;5780
	ld c,b			;5781
	inc hl			;5782
L_5783:
	push bc			;5783
	ld a,c			;5784
	sub b			;5785
	ld b,a			;5786
	ld a,(0e341h)		;5787
	ld c,0f0h		;578a
	and c			;578c
	jr z,L_5791		;578d
	ld c,0f5h		;578f
L_5791:
	call L_57AD		;5791
	ld b,(hl)			;5794
	inc hl			;5795
	push hl			;5796
	ex de,hl			;5797
	ld c,0d8h		;5798
	call L_57AD		;579a
	ex de,hl			;579d
	ld bc,08001h		;579e
	ld a,004h		;57a1
	call L_4D66		;57a3
	pop hl			;57a6
	pop bc			;57a7
	djnz L_5783		;57a8
	jp L_438D		;57aa
L_57AD:
	ld a,b			;57ad
	and 001h		;57ae
	rrc a		;57b0
	ld d,a			;57b2
	ld a,b			;57b3
	srl a		;57b4
	add a,c			;57b6
	ld e,a			;57b7
	ret			;57b8
L_57B9:
	ld hl,0547ch		;57b9
	ld bc,l5818h		;57bc
	ld a,011h		;57bf
	ld d,000h		;57c1
	jp L_4D2A		;57c3
L_57C6:
	call L_4392		;57c6
	ld hl,0be86h		;57c9
	call L_4C59		;57cc
	ld hl,0bce6h		;57cf
	ld de,00838h		;57d2
	ld bc,00d01h		;57d5
	call L_4E47		;57d8
	ld hl,0bd4eh		;57db
	ld de,07038h		;57de
	ld bc,00d02h		;57e1
	call L_4E47		;57e4
	ld hl,0bdb6h		;57e7
	ld de,0d838h		;57ea
	ld bc,01a03h		;57ed
	call L_4E47		;57f0
	ld de,04070h		;57f3
	ld hl,0bca5h		;57f6
	call L_4EFC		;57f9
	jp L_438D		;57fc
L_57FF:
	di			;57ff
	push hl			;5800
	push de			;5801
	push bc			;5802
	push ix		;5803
	push af			;5805
	ld a,004h		;5806
	ld (07000h),a		;5808
	inc a			;580b
	ld (09000h),a		;580c
	inc a			;580f
	ld (0b000h),a		;5810
	pop af			;5813
	push af			;5814
	call 06003h		;5815
L_5818:
	ld a,(0ddf1h)		;5818
	ld (07000h),a		;581b
	ld a,(0ddf2h)		;581e
	ld (09000h),a		;5821
	ld a,(0ddf3h)		;5824
	ld (0b000h),a		;5827
	pop af			;582a
	pop ix		;582b
	pop bc			;582d
	pop de			;582e
	pop hl			;582f
	ei			;5830
	ret			;5831
L_5832:
	call L_439F		;5832
	call 06d0eh		;5835
	jp L_438D		;5838
L_583B:
	ld a,0e0h		;583b
	ld (0e148h),a		;583d
	ld (0e14ch),a		;5840
	ld a,(0e1f7h)		;5843
	or a			;5846
	ld a,(0e19dh)		;5847
	jr nz,L_584F		;584a
	ld a,(0ec76h)		;584c
L_584F:
	ld c,000h		;584f
	and 003h		;5851
	jr z,L_5860		;5853
	cp 003h		;5855
	jr z,L_5860		;5857
	ld c,003h		;5859
	rra			;585b
	jr c,L_5860		;585c
	ld c,004h		;585e
L_5860:
	ld a,(0e1f3h)		;5860
	cp 002h		;5863
	jr nz,L_5868		;5865
	add a,c			;5867
L_5868:
	ld b,a			;5868
	ld a,(0e1f6h)		;5869
	cp b			;586c
	jp z,L_5877		;586d
	ld a,b			;5870
	ld (0e1f6h),a		;5871
	call L_5761		;5874
L_5877:
	call L_4397		;5877
	ld hl,09911h		;587a
	ld a,(0e1feh)		;587d
	or a			;5880
	jr z,L_5886		;5881
	ld hl,0991fh		;5883
L_5886:
	ld a,(0e1f6h)		;5886
	call L_556D		;5889
	ld b,(hl)			;588c
	inc hl			;588d
	ld de,0e100h		;588e
L_5891:
	ld a,(0e1f9h)		;5891
	ld c,a			;5894
	ld a,(hl)			;5895
	inc hl			;5896
	add a,c			;5897
	ld (de),a			;5898
	inc de			;5899
	ld a,(0e1f5h)		;589a
	ld c,a			;589d
	ld a,(hl)			;589e
	call L_5961		;589f
	jr z,L_58BD		;58a2
	ld a,(0edd0h)		;58a4
	or a			;58a7
	ld a,(0e19bh)		;58a8
	jr z,L_58B6		;58ab
	rra			;58ad
	ld a,018h		;58ae
	jr nc,L_58BD		;58b0
	ld a,01bh		;58b2
	jr L_58BD		;58b4
L_58B6:
	rra			;58b6
	ld a,018h		;58b7
	jr c,L_58BD		;58b9
	ld a,01bh		;58bb
L_58BD:
	inc hl			;58bd
	ld (de),a			;58be
	inc de			;58bf
	djnz L_5891		;58c0
	jp L_438D		;58c2
L_58C5:
	call L_56A3		;58c5
	call L_4397		;58c8
	ld hl,09d12h		;58cb
	ld a,(0e1feh)		;58ce
	or a			;58d1
	jr z,L_58D7		;58d2
	ld hl,09d62h		;58d4
L_58D7:
	ld de,0e100h		;58d7
	ld b,014h		;58da
	jr L_5891		;58dc
L_58DE:
	call L_4397		;58de
	ld a,0e0h		;58e1
	ld (0e150h),a		;58e3
	ld (0e154h),a		;58e6
	ld a,(0e1d3h)		;58e9
	cp 002h		;58ec
	jr nz,L_5908		;58ee
	ld a,(0e1ebh)		;58f0
	bit 1,a		;58f3
	jr z,L_5908		;58f5
	ld hl,09f3ah		;58f7
	rra			;58fa
	jr nc,L_5900		;58fb
	ld hl,09f42h		;58fd
L_5900:
	ld de,0e150h		;5900
	ld b,002h		;5903
	call L_5929		;5905
L_5908:
	ld a,(0e1ebh)		;5908
	and 003h		;590b
	ld hl,09db2h		;590d
	call L_556D		;5910
	ld de,0e158h		;5913
	ld a,(0e1d3h)		;5916
	or a			;5919
	rla			;591a
	rla			;591b
	rla			;591c
	rla			;591d
	call L_4216		;591e
	ld b,004h		;5921
	call L_5929		;5923
	jp L_438D		;5926
L_5929:
	ld a,(hl)			;5929
	inc hl			;592a
	add a,048h		;592b
	ld (de),a			;592d
	inc de			;592e
	ld a,(0e1ebh)		;592f
	and 004h		;5932
	ld a,(hl)			;5934
	jr z,L_5939		;5935
	neg		;5937
L_5939:
	ld c,a			;5939
	ld a,(0e1e1h)		;593a
	call L_5961		;593d
	jr z,L_595B		;5940
	ld a,(0edd0h)		;5942
	or a			;5945
	ld a,(0e19bh)		;5946
	jr z,L_5954		;5949
	rra			;594b
	ld a,018h		;594c
	jr c,L_595B		;594e
	ld a,01bh		;5950
	jr L_595B		;5952
L_5954:
	rra			;5954
	ld a,018h		;5955
	jr nc,L_595B		;5957
	ld a,01bh		;5959
L_595B:
	inc hl			;595b
	ld (de),a			;595c
	inc de			;595d
	djnz L_5929		;595e
	ret			;5960
L_5961:
	inc hl			;5961
	add a,c			;5962
	ld (de),a			;5963
	inc de			;5964
	ld a,(hl)			;5965
	inc hl			;5966
	ld (de),a			;5967
	inc de			;5968
	ld a,(hl)			;5969
	or a			;596a
	ret z			;596b
	cp 007h		;596c
	ret			;596e
L_596F:
	ld a,(0e190h)		;596f
	call L_4220		;5972

; ----------------------------------------------------------------------
; DATOS tabla_5975: 5 destinos del despachador p00:4220 (call en p00:5972, el
;   indice en A): 597F, 597F, 5988, 597F, 597F; lo leen p00:5972 (10 bytes)
;   0x5975..0x597f  (10 bytes)
DATA_tabla_5975:
	defw 0597fh,0597fh,05988h,0597fh,0597fh	; 5975

; ======================================================================
; CODIGO 0x597f..0x5a85  (262 bytes)
; ======================================================================


L_597F:
	call L_439F		;597f
	call 0a43bh		;5982
	jp L_438D		;5985
L_5988:
	call L_439F		;5988
	call 06000h		;598b
	jp L_438D		;598e
L_5991:
	ld a,001h		;5991
	ld (0faf6h),a		;5993
	call L_4397		;5996
	ld de,00000h		;5999
	ld hl,0b6c3h		;599c
	ld bc,0a10dh		;599f
	call L_4E47		;59a2
	call L_438D		;59a5
	xor a			;59a8
	ld (0faf6h),a		;59a9
	ret			;59ac
L_59AD:
	call L_4397		;59ad
	call L_59BF		;59b0
	jp L_438D		;59b3
L_59B6:
	call L_4397		;59b6
	call L_59BF		;59b9
	jp L_439F		;59bc
L_59BF:
	ld de,00028h		;59bf
	ld hl,0b6c3h		;59c2
	ld bc,0a104h		;59c5
	call L_4E47		;59c8
	ld a,004h		;59cb
	ld de,07003h		;59cd
	jp L_4BF0		;59d0
L_59D3:
	call 088a9h		;59d3
	call L_4392		;59d6
	call L_59EB		;59d9
	jp L_438D		;59dc
L_59DF:
	ld a,(0e19bh)		;59df
	rra			;59e2
	ld a,(0ed44h)		;59e3
	ret nc			;59e6
	ld a,(0ed45h)		;59e7
	ret			;59ea
L_59EB:
	call L_5A13		;59eb
	call L_59DF		;59ee
	ld hl,0bab2h		;59f1
	cp 00dh		;59f4
	jr nc,L_5A0F		;59f6
	ld a,(ix+007h)		;59f8
	cp 002h		;59fb
	jr c,L_5A0F		;59fd
	sub 002h		;59ff
	ld hl,0ba8ah		;5a01
	call L_556D		;5a04
	ld a,(ix+008h)		;5a07
	srl a		;5a0a
	call L_556D		;5a0c
L_5A0F:
	ld (0ed2ch),hl		;5a0f
	ret			;5a12
L_5A13:
	call L_59DF		;5a13
	cp 00dh		;5a16
	jr nc,L_5A32		;5a18
	ld a,(ix+00ah)		;5a1a
	cp 002h		;5a1d
	jr c,L_5A32		;5a1f
	dec a			;5a21
	cp 006h		;5a22
	jr c,L_5A28		;5a24
	ld a,005h		;5a26
L_5A28:
	rlca			;5a28
	rlca			;5a29
	rlca			;5a2a
	rlca			;5a2b
	and 0f0h		;5a2c
L_5A2E:
	ld (0e1ffh),a		;5a2e
	ret			;5a31
L_5A32:
	xor a			;5a32
	jr L_5A2E		;5a33
L_5A35:
	call 088a9h		;5a35
	call L_4392		;5a38
	call L_5A41		;5a3b
	jp L_438D		;5a3e
L_5A41:
	call L_5A64		;5a41
	ld a,(0e1fbh)		;5a44
	dec a			;5a47
	ld b,a			;5a48
	ld a,008h		;5a49
	sub b			;5a4b
	ld hl,(0ed2ch)		;5a4c
	call L_4216		;5a4f
	ld d,(hl)			;5a52
	call L_5A75		;5a53
	call L_5AE0		;5a56
	call L_5AEE		;5a59
	call L_5AB9		;5a5c
	call L_5A8B		;5a5f
	ex de,hl			;5a62
	ret			;5a63
L_5A64:
	ld a,(0e1ffh)		;5a64
	ld b,a			;5a67
	ld a,r		;5a68
	and 00fh		;5a6a
	add a,b			;5a6c
	ld hl,0ba2ah		;5a6d
	call L_4216		;5a70
	ld e,(hl)			;5a73
	ret			;5a74
L_5A75:
	ld a,(0e1fah)		;5a75
	dec a			;5a78
	ld c,a			;5a79
	ld b,000h		;5a7a
	ld hl,05a85h		;5a7c
	add hl,bc			;5a7f
	ld a,(hl)			;5a80
	add a,d			;5a81
	ret c			;5a82
	ld d,a			;5a83
	ret			;5a84

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5a85..0x5a8b  (6 bytes)
DATA_5A85:
	defb 020h,018h,000h,000h,010h,008h	; 5a85

; ======================================================================
; CODIGO 0x5a8b..0x5e74  (1001 bytes)
; ======================================================================


L_5A8B:
	ld a,(0ece0h)		;5a8b
	dec a			;5a8e
	ret z			;5a8f
	dec a			;5a90
	jr nz,L_5AA8		;5a91
	call L_5AA0		;5a93
	ld a,e			;5a96
	add a,002h		;5a97
	ld e,a			;5a99
	cp 00ch		;5a9a
	ret c			;5a9c
	ld e,00bh		;5a9d
	ret			;5a9f
L_5AA0:
	ld a,d			;5aa0
	sub 030h		;5aa1
	ld d,a			;5aa3
	ret nc			;5aa4
	ld d,000h		;5aa5
	ret			;5aa7
L_5AA8:
	call L_5AB2		;5aa8
	ld a,e			;5aab
	sub 002h		;5aac
	ret nc			;5aae
	ld e,000h		;5aaf
	ret			;5ab1
L_5AB2:
	ld a,d			;5ab2
	add a,030h		;5ab3
	ret nc			;5ab5
	ld d,0ffh		;5ab6
	ret			;5ab8
L_5AB9:
	ld a,e			;5ab9
	cp 004h		;5aba
	jr c,L_5AC8		;5abc
	cp 006h		;5abe
	ret c			;5ac0
	cp 00ah		;5ac1
	jr c,L_5AD6		;5ac3
	srl d		;5ac5
	ret			;5ac7
L_5AC8:
	ld a,r		;5ac8
	and 07fh		;5aca
	add a,030h		;5acc
	jr c,L_5AD3		;5ace
	add a,d			;5ad0
	ld d,a			;5ad1
	ret nc			;5ad2
L_5AD3:
	ld d,0ffh		;5ad3
	ret			;5ad5
L_5AD6:
	ld a,d			;5ad6
	srl d		;5ad7
	srl d		;5ad9
	srl d		;5adb
	sub d			;5add
	ld d,a			;5ade
	ret			;5adf
L_5AE0:
	ld a,(0e19bh)		;5ae0
	srl a		;5ae3
	cp 007h		;5ae5
	ret nz			;5ae7
L_5AE8:
	ld a,d			;5ae8
	add a,010h		;5ae9
	ret c			;5aeb
	ld d,a			;5aec
	ret			;5aed
L_5AEE:
	ld c,(ix+000h)		;5aee
	call L_5B0D		;5af1
	ld b,a			;5af4
	ld a,c			;5af5
	and 003h		;5af6
	jr z,L_5B07		;5af8
	cp 003h		;5afa
	ret nz			;5afc
	ld a,b			;5afd
	or a			;5afe
	jr z,L_5AE8		;5aff
L_5B01:
	ld a,d			;5b01
	sub 010h		;5b02
	ret c			;5b04
	ld d,a			;5b05
	ret			;5b06
L_5B07:
	ld a,b			;5b07
	or a			;5b08
	jr nz,L_5AE8		;5b09
	jr L_5B01		;5b0b
L_5B0D:
	xor a			;5b0d
	ld ix,0e231h		;5b0e
	or (ix+00bh)		;5b12
	or (ix+01bh)		;5b15
	or (ix+02bh)		;5b18
	or (ix+03bh)		;5b1b
	ret			;5b1e
L_5B1F:
	ld de,0ec96h		;5b1f
	ld hl,0e17fh		;5b22
	ld b,020h		;5b25
L_5B27:
	ld a,(de)			;5b27
	cp (hl)			;5b28
	ld a,(hl)			;5b29
	ld c,a			;5b2a
	dec hl			;5b2b
	dec hl			;5b2c
	dec hl			;5b2d
	dec hl			;5b2e
	jr z,L_5B65		;5b2f
	ld (de),a			;5b31
	push hl			;5b32
	push bc			;5b33
	push de			;5b34
	ld a,b			;5b35
	ld d,000h		;5b36
	or a			;5b38
	rla			;5b39
	rl d		;5b3a
	rla			;5b3c
	rl d		;5b3d
	rla			;5b3f
	rl d		;5b40
	rla			;5b42
	rl d		;5b43
	ld e,a			;5b45
	ld hl,0def0h		;5b46
	add hl,de			;5b49
	ld b,h			;5b4a
	ld a,c			;5b4b
	ld c,l			;5b4c
	call L_4392		;5b4d
	add a,a			;5b50
	ld hl,0bc05h		;5b51
	call L_4216		;5b54
	ld e,(hl)			;5b57
	inc hl			;5b58
	ld d,(hl)			;5b59
	ld h,b			;5b5a
	ld l,c			;5b5b
	call L_5659		;5b5c
	call L_438D		;5b5f
	pop de			;5b62
	pop bc			;5b63
	pop hl			;5b64
L_5B65:
	dec de			;5b65
	djnz L_5B27		;5b66
	ret			;5b68
L_5B69:
	call L_4397		;5b69
	ld hl,0bc78h		;5b6c
	call L_4216		;5b6f
	ld b,(hl)			;5b72
	jp L_438D		;5b73
L_5B76:
	call L_4392		;5b76
	ld a,(0e1a6h)		;5b79
	ld hl,09432h		;5b7c
	call L_556D		;5b7f
	ld b,008h		;5b82
L_5B84:
	push bc			;5b84
	push hl			;5b85
	ld a,(0ec41h)		;5b86
	ld (0e1b2h),a		;5b89
	ld e,a			;5b8c
	ld d,000h		;5b8d
	add hl,de			;5b8f
	ld l,(hl)			;5b90
	ld h,d			;5b91
	add hl,hl			;5b92
	add hl,hl			;5b93
	add hl,hl			;5b94
	add hl,hl			;5b95
	ld de,(0ec43h)		;5b96
	add hl,de			;5b9a
	ld de,0de10h		;5b9b
	ld a,(0ec40h)		;5b9e
	ld c,a			;5ba1
	call L_421B		;5ba2
	ld a,004h		;5ba5
	add a,c			;5ba7
	ld (0ec40h),a		;5ba8
	call L_5BB9		;5bab
	ld hl,0ec41h		;5bae
	inc (hl)			;5bb1
	pop hl			;5bb2
	pop bc			;5bb3
	djnz L_5B84		;5bb4
	jp L_438D		;5bb6
L_5BB9:
	ld c,004h		;5bb9
L_5BBB:
	ld b,004h		;5bbb
L_5BBD:
	ld a,(hl)			;5bbd
	ld (de),a			;5bbe
	inc hl			;5bbf
	inc de			;5bc0
	djnz L_5BBD		;5bc1
	ld a,01ch		;5bc3
	call L_421B		;5bc5
	dec c			;5bc8
	ret z			;5bc9
	jr L_5BBB		;5bca
L_5BCC:
	call L_4392		;5bcc
	ld hl,0bb1ah		;5bcf
	call L_556D		;5bd2
	ex de,hl			;5bd5
	ld a,(0e1f0h)		;5bd6
	ld hl,0bbc4h		;5bd9
	call L_4216		;5bdc
	ld a,(hl)			;5bdf
	ex de,hl			;5be0
	jp L_438D		;5be1
L_5BE4:
	ld b,00ah		;5be4
L_5BE6:
	ld a,(hl)			;5be6
	inc hl			;5be7
	call L_4F1C		;5be8
	call L_4F6F		;5beb
	djnz L_5BE6		;5bee
	ret			;5bf0
L_5BF1:
	ld c,000h		;5bf1
L_5BF3:
	dec b			;5bf3
	jr nz,L_5BF8		;5bf4
	ld c,0ffh		;5bf6
L_5BF8:
	inc b			;5bf8
	ld a,(hl)			;5bf9
	rra			;5bfa
	rra			;5bfb
	rra			;5bfc
	rra			;5bfd
	and 00fh		;5bfe
	jr nz,L_5C07		;5c00
	call L_5C20		;5c02
	jr L_5C0A		;5c05
L_5C07:
	call L_5C12		;5c07
L_5C0A:
	ld a,(hl)			;5c0a
	inc hl			;5c0b
	call L_5C12		;5c0c
	djnz L_5BF3		;5c0f
	ret			;5c11
L_5C12:
	and 00fh		;5c12
	jr z,L_5C18		;5c14
	ld c,0ffh		;5c16
L_5C18:
	add a,001h		;5c18
	and c			;5c1a
	call L_4F1C		;5c1b
	jr L_5C2F		;5c1e
L_5C20:
	push bc			;5c20
	push de			;5c21
	push hl			;5c22
	ex de,hl			;5c23
	ld bc,00808h		;5c24
	xor a			;5c27
	ld d,a			;5c28
	call L_4D2A		;5c29
	pop hl			;5c2c
	pop de			;5c2d
	pop bc			;5c2e
L_5C2F:
	ld a,d			;5c2f
	add a,008h		;5c30
	ld d,a			;5c32
	ret			;5c33
L_5C34:
	ld c,b			;5c34
	ld a,b			;5c35
	and 0feh		;5c36
	ld b,a			;5c38
	rr c		;5c39
	jr c,L_5C45		;5c3b
L_5C3D:
	ld a,(hl)			;5c3d
	rra			;5c3e
	rra			;5c3f
	rra			;5c40
	rra			;5c41
	call L_5C4D		;5c42
L_5C45:
	ld a,(hl)			;5c45
	inc hl			;5c46
	call L_5C4D		;5c47
	djnz L_5C3D		;5c4a
	ret			;5c4c
L_5C4D:
	and 00fh		;5c4d
	add a,001h		;5c4f
	call L_4F1C		;5c51
	jr L_5C2F		;5c54
L_5C56:
	ld c,000h		;5c56
	ld a,(hl)			;5c58
	call L_5C12		;5c59
	ld c,000h		;5c5c
	ld a,(hl)			;5c5e
	and 00fh		;5c5f
	jr z,L_5C65		;5c61
	ld c,0ffh		;5c63
L_5C65:
	inc hl			;5c65
	ld a,(hl)			;5c66
	rra			;5c67
	rra			;5c68
	rra			;5c69
	rra			;5c6a
	call L_5C12		;5c6b
	ld c,0ffh		;5c6e
	ld a,(hl)			;5c70
	jr L_5C12		;5c71
L_5C73:
	ld a,001h		;5c73
	jr L_5C79		;5c75
L_5C77:
	ld a,002h		;5c77
L_5C79:
	ld (0ed09h),a		;5c79
	ret			;5c7c
L_5C7D:
	ld hl,0e100h		;5c7d
	ld b,020h		;5c80
L_5C82:
	ld a,(0e1a2h)		;5c82
	add a,0d7h		;5c85
	ld e,a			;5c87
	xor a			;5c88
L_5C89:
	ld (hl),e			;5c89
	inc hl			;5c8a
	ld (hl),e			;5c8b
	inc hl			;5c8c
	ld (hl),e			;5c8d
	inc hl			;5c8e
	ld (hl),a			;5c8f
	inc hl			;5c90
	djnz L_5C89		;5c91
	ret			;5c93
L_5C94:
	call L_439F		;5c94
	ld hl,0abf2h		;5c97
	call L_4216		;5c9a
	ld e,(hl)			;5c9d
	inc hl			;5c9e
	ld d,(hl)			;5c9f
	jp L_438D		;5ca0
L_5CA3:
	call L_439F		;5ca3
	ld e,(hl)			;5ca6
	inc hl			;5ca7
	ld d,(hl)			;5ca8
	jp L_438D		;5ca9
L_5CAC:
	ld a,004h		;5cac
	ld (07000h),a		;5cae
	inc a			;5cb1
	ld (09000h),a		;5cb2
	inc a			;5cb5
	ld (0b000h),a		;5cb6
	call 06000h		;5cb9
	ld a,(0ddf1h)		;5cbc
	ld (07000h),a		;5cbf
	ld a,(0ddf2h)		;5cc2
	ld (09000h),a		;5cc5
	ld a,(0ddf3h)		;5cc8
	ld (0b000h),a		;5ccb
	ret			;5cce
L_5CCF:
	ld a,00dh		;5ccf
	ld (07000h),a		;5cd1
	inc a			;5cd4
	ld (09000h),a		;5cd5
	inc a			;5cd8
	ld (0b000h),a		;5cd9
	call L_5D23		;5cdc
	ld a,001h		;5cdf
	ld (07000h),a		;5ce1
	inc a			;5ce4
	ld (09000h),a		;5ce5
	inc a			;5ce8
	ld (0b000h),a		;5ce9
	ret			;5cec
L_5CED:
	call L_439F		;5ced
	call 09348h		;5cf0
	jp L_438D		;5cf3
L_5CF6:
	call L_439F		;5cf6
	call 09557h		;5cf9
	jp L_438D		;5cfc
L_5CFF:
	call L_439F		;5cff
	call 095bbh		;5d02
	jp L_438D		;5d05
L_5D08:
	call L_439F		;5d08
	call 0b0ach		;5d0b
	jp L_438D		;5d0e
L_5D11:
	call L_439F		;5d11
	call 0b158h		;5d14
	jp L_438D		;5d17
L_5D1A:
	call L_439F		;5d1a
	call 0b25fh		;5d1d
	jp L_438D		;5d20
L_5D23:
	call L_439F		;5d23
	call 084afh		;5d26
	jp L_438D		;5d29
L_5D2C:
	call L_439F		;5d2c
	call 083d7h		;5d2f
	jp L_438D		;5d32
L_5D35:
	call L_439F		;5d35
	call 0b693h		;5d38
	jp L_438D		;5d3b
L_5D3E:
	call L_439F		;5d3e
	call 06940h		;5d41
	jp L_438D		;5d44
L_5D47:
	call L_439F		;5d47
	call 06a13h		;5d4a
	jp L_438D		;5d4d
L_5D50:
	call L_439F		;5d50
	call 06aech		;5d53
	jp L_438D		;5d56
L_5D59:
	call L_439F		;5d59
	call 08000h		;5d5c
	jp L_438D		;5d5f
L_5D62:
	call L_439F		;5d62
	call 0a4f8h		;5d65
	jp L_438D		;5d68
L_5D6B:
	call L_439F		;5d6b
	call 085e0h		;5d6e
	jp L_438D		;5d71
L_5D74:
	call L_439F		;5d74
	call 0a8ach		;5d77
	jp L_438D		;5d7a
L_5D7D:
	call L_438D		;5d7d
	call 0bcdeh		;5d80
	jp L_439F		;5d83
L_5D86:
	call L_439F		;5d86
	call 06187h		;5d89
	jp L_438D		;5d8c
L_5D8F:
	call L_439F		;5d8f
	call 06b93h		;5d92
	jp L_438D		;5d95
L_5D98:
	call L_439F		;5d98
	call 08654h		;5d9b
	jp L_438D		;5d9e
L_5DA1:
	call L_439F		;5da1
	ldir		;5da4
	jp L_438D		;5da6
L_5DA9:
	call L_439F		;5da9
	call 0bb48h		;5dac
	jp L_438D		;5daf
L_5DB2:
	call L_439F		;5db2
	call 06d8dh		;5db5
	jp L_438D		;5db8
L_5DBB:
	call L_438D		;5dbb
	call 06543h		;5dbe
	jp L_439F		;5dc1
L_5DC4:
	ld a,(0ed9fh)		;5dc4
	or a			;5dc7
	ret nz			;5dc8
	ld hl,0de00h		;5dc9
	ld a,(hl)			;5dcc
	cp 005h		;5dcd
	ret nz			;5dcf
	inc hl			;5dd0
	ld a,(hl)			;5dd1
	cp 004h		;5dd2
	ret nz			;5dd4
	call L_5E8C		;5dd5
	call L_5E47		;5dd8
	ld a,(0effah)		;5ddb
	or a			;5dde
	ret nz			;5ddf
	ld a,(0ef3bh)		;5de0
	or a			;5de3
	jr z,L_5DEA		;5de4
	ld (0e33dh),a		;5de6
	ret			;5de9
L_5DEA:
	ld a,(0e33dh)		;5dea
	cp 03dh		;5ded
	jr z,L_5E08		;5def
	cp 03eh		;5df1
	jr z,L_5E08		;5df3
	cp 042h		;5df5
	jr z,L_5E08		;5df7
	cp 043h		;5df9
	jr z,L_5E08		;5dfb
	cp 044h		;5dfd
	jr z,L_5E08		;5dff
	cp 045h		;5e01
	jr z,L_5E08		;5e03
	cp 03fh		;5e05
	ret nz			;5e07
L_5E08:
	ld hl,0e23ch		;5e08
	ld ix,0e340h		;5e0b
	ld de,00010h		;5e0f
	ld b,004h		;5e12
L_5E14:
	ld a,(hl)			;5e14
	and 007h		;5e15
	ld (ix+000h),a		;5e17
	add hl,de			;5e1a
	inc ix		;5e1b
	djnz L_5E14		;5e1d
	ld hl,0e340h		;5e1f
	ld b,003h		;5e22
L_5E24:
	ld a,(hl)			;5e24
	inc hl			;5e25
	cp (hl)			;5e26
	call nc,L_5E41		;5e27
	djnz L_5E24		;5e2a
	ld a,(0e19bh)		;5e2c
	rra			;5e2f
	ld de,05e74h		;5e30
	jr nc,L_5E38		;5e33
	ld de,05e7ah		;5e35
L_5E38:
	ld a,(hl)			;5e38
	ex de,hl			;5e39
	call L_4216		;5e3a
	ld a,(hl)			;5e3d
	jp 06003h		;5e3e
L_5E41:
	ld c,(hl)			;5e41
	ld (hl),a			;5e42
	dec hl			;5e43
	ld (hl),c			;5e44
	inc hl			;5e45
	ret			;5e46
L_5E47:
	ld a,(0eddbh)		;5e47
	or a			;5e4a
	ret nz			;5e4b
	ld a,007h		;5e4c
	call 00141h		;5e4e   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	bit 1,a		;5e51
	ld hl,0effbh		;5e53
	jr z,L_5E5B		;5e56
	ld (hl),001h		;5e58
	ret			;5e5a
L_5E5B:
	ld a,(hl)			;5e5b
	or a			;5e5c
	ret z			;5e5d
	dec hl			;5e5e
	ld a,001h		;5e5f
	xor (hl)			;5e61
	ld (hl),a			;5e62
	jr z,L_5E6F		;5e63
	ld a,046h		;5e65
	call 06003h		;5e67
	xor a			;5e6a
	ld (0effbh),a		;5e6b
	ret			;5e6e
L_5E6F:
	inc hl			;5e6f
	ld (hl),000h		;5e70
	jr L_5E08		;5e72

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5e74..0x5e80  (12 bytes)
DATA_5E74:
	defb 033h,033h,034h,035h,036h,036h,037h,037h,038h,039h,03ah,03ah	; 5e74  3345667789::

; ======================================================================
; CODIGO 0x5e80..0x5fb5  (309 bytes)
; ======================================================================


L_5E80:
	ld hl,0ed99h		;5e80
	ld (hl),068h		;5e83
	inc hl			;5e85
	ld (hl),a			;5e86
	ld a,081h		;5e87
	jp L_57FF		;5e89
L_5E8C:
	ld hl,0ed99h		;5e8c
	ld a,(hl)			;5e8f
	or a			;5e90
	ret z			;5e91
	dec (hl)			;5e92
	ret nz			;5e93
	ld a,080h		;5e94
	call 06003h		;5e96
	ld a,(0ed9ah)		;5e99
	jp 06003h		;5e9c
L_5E9F:
	call L_4392		;5e9f
	ld (0e350h),a		;5ea2
	ld b,000h		;5ea5
	ld a,d			;5ea7
	sub h			;5ea8
	jr nz,L_5EAD		;5ea9
	ld b,001h		;5eab
L_5EAD:
	ld c,000h		;5ead
	ld a,e			;5eaf
	sub l			;5eb0
	jr nz,L_5EB5		;5eb1
	ld c,002h		;5eb3
L_5EB5:
	ld a,b			;5eb5
	or c			;5eb6
	ld (0e35ch),a		;5eb7
	call L_5F04		;5eba
	ld d,000h		;5ebd
	ld a,(0e351h)		;5ebf
	ld e,a			;5ec2
	ld d,000h		;5ec3
	ld a,e			;5ec5
	sub 03fh		;5ec6
	neg		;5ec8
	ld hl,0bf96h		;5eca
	push hl			;5ecd
	add hl,de			;5ece
	ld c,(hl)			;5ecf
	pop hl			;5ed0
	ld e,a			;5ed1
	add hl,de			;5ed2
	ld a,(hl)			;5ed3
	ld (0e352h),a		;5ed4
	ld e,c			;5ed7
	call L_5F53		;5ed8
	ld a,(0e353h)		;5edb
	and a			;5ede
	call nz,L_5F79		;5edf
	push de			;5ee2
	ld a,(0e352h)		;5ee3
	ld e,a			;5ee6
	call L_5F53		;5ee7
	ld a,(0e354h)		;5eea
	and a			;5eed
	call nz,L_5F79		;5eee
	pop hl			;5ef1
	ld a,(0e35ch)		;5ef2
	rra			;5ef5
	jr nc,L_5EFB		;5ef6
	ld de,00000h		;5ef8
L_5EFB:
	rra			;5efb
	jr nc,L_5F01		;5efc
	ld hl,00000h		;5efe
L_5F01:
	jp L_438D		;5f01
L_5F04:
	ld a,l			;5f04
	ld (0e340h),a		;5f05
	ld a,h			;5f08
	ld (0e341h),a		;5f09
	ld hl,0e353h		;5f0c
	ld (hl),000h		;5f0f
	ld a,(0e340h)		;5f11
	sub e			;5f14
	jr nc,L_5F1A		;5f15
	neg		;5f17
	inc (hl)			;5f19
L_5F1A:
	and 0f0h		;5f1a
	ld e,a			;5f1c
	inc hl			;5f1d
	ld (hl),000h		;5f1e
	ld a,(0e341h)		;5f20
	sub d			;5f23
	jr nc,L_5F29		;5f24
	neg		;5f26
	inc (hl)			;5f28
L_5F29:
	ld d,a			;5f29
	ld a,d			;5f2a
	rra			;5f2b
	rra			;5f2c
	rra			;5f2d
	rra			;5f2e
	and 00fh		;5f2f
	add a,e			;5f31
	ld hl,0be96h		;5f32
	call L_4216		;5f35
	ld a,(hl)			;5f38
	ld (0e351h),a		;5f39
	ld c,a			;5f3c
	ld hl,(0e353h)		;5f3d
	ld a,h			;5f40
	ld b,000h		;5f41
	and a			;5f43
	jr z,L_5F48		;5f44
	ld b,080h		;5f46
L_5F48:
	cp l			;5f48
	ld a,c			;5f49
	jr z,L_5F4E		;5f4a
	neg		;5f4c
L_5F4E:
	add a,b			;5f4e
	ld (0e357h),a		;5f4f
	ret			;5f52
L_5F53:
	ld a,(0e350h)		;5f53
	ld h,a			;5f56
	call L_5F65		;5f57
	xor a			;5f5a
	add hl,hl			;5f5b
	adc a,a			;5f5c
	add hl,hl			;5f5d
	adc a,a			;5f5e
	add hl,hl			;5f5f
	adc a,a			;5f60
	ld l,h			;5f61
	ld h,a			;5f62
	ex de,hl			;5f63
	ret			;5f64
L_5F65:
	ld b,008h		;5f65
	ld l,000h		;5f67
	ld d,l			;5f69
L_5F6A:
	add hl,hl			;5f6a
	jr nc,L_5F6E		;5f6b
	add hl,de			;5f6d
L_5F6E:
	djnz L_5F6A		;5f6e
	ret			;5f70
L_5F71:
	ld a,l			;5f71
	cpl			;5f72
	ld l,a			;5f73
	ld a,h			;5f74
	cpl			;5f75
	ld h,a			;5f76
	inc hl			;5f77
	ret			;5f78
L_5F79:
	ld a,e			;5f79
	cpl			;5f7a
	ld e,a			;5f7b
	ld a,d			;5f7c
	cpl			;5f7d
	ld d,a			;5f7e
	inc de			;5f7f
	ret			;5f80
L_5F81:
	call L_4392		;5f81
	ld a,b			;5f84
	ld hl,0bf96h		;5f85
	call L_4216		;5f88
	ld e,c			;5f8b
	ld a,(hl)			;5f8c
	call L_5FA4		;5f8d
	ex de,hl			;5f90
	push de			;5f91
	ld a,03fh		;5f92
	sub b			;5f94
	ld hl,0bf96h		;5f95
	call L_4216		;5f98
	ld e,c			;5f9b
	ld a,(hl)			;5f9c
	call L_5FA4		;5f9d
	pop de			;5fa0
	jp L_438D		;5fa1
L_5FA4:
	push bc			;5fa4
	ld d,000h		;5fa5
	ld hl,00000h		;5fa7
	ld b,008h		;5faa
L_5FAC:
	add hl,hl			;5fac
	add a,a			;5fad
	jr nc,L_5FB1		;5fae
	add hl,de			;5fb0
L_5FB1:
	djnz L_5FAC		;5fb1
	pop bc			;5fb3
	ret			;5fb4

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5fb5..0x5ff1  (60 bytes)
DATA_5FB5:
	defb 00bh,028h,030h,038h,040h,048h,050h,058h,060h,068h,070h,078h,080h,0a3h,0abh,0b3h	; 5fb5  .(08@HPX`hpx....
	defb 0bbh,078h,080h,088h,090h,098h,0a0h,0a8h,0b0h,0b8h,0c0h,028h,030h,038h,040h,048h	; 5fc5  .x.........(08@H
	defb 050h,064h,088h,090h,098h,0b0h,0b8h,0d4h,0dch,028h,030h,038h,040h,048h,050h,060h	; 5fd5  Pd.......(08@HP`
	defb 068h,074h,07ch,084h,090h,098h,0a0h,0b0h,0b8h,0d0h,0e0h,0f0h	; 5fe5  ht|.........

; ======================================================================
; CODIGO 0x5ff1..0x6000  (15 bytes)
; ======================================================================


L_5FF1:
	call L_54EF		;5ff1
	jp L_549B		;5ff4
L_5FF7:
	ld a,(0eddfh)		;5ff7
	rra			;5ffa
	jr c,$+8		;5ffb
	ld a,(0ed72h)		;5ffd
