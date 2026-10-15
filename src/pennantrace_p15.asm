; ==========================================================================
; THE PRO YAKYUU GEKITOTSU PENNANT RACE - Konami (1988) - MSX2 - MegaROM RC-757 de 128 KB (Konami SCC) - banco 15 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS partida_A000: los 2 ultimos bytes de la instruccion de p14:9FFF (CD 6B
;   A2), que empieza en el banco 14; lo leen p14:9FFF (2 bytes)
;   0xa000..0xa002  (2 bytes)
DATA_partida_A000:
	defb 06bh,0a2h	; a000

; ======================================================================
; CODIGO 0xa002..0xa133  (305 bytes)
; ======================================================================


L_A002:
	ld a,(0e140h)		;a002
	cp 040h		;a005
	ret nc			;a007
	ld a,010h		;a008
	ld (0de04h),a		;a00a   ; guarda la cuenta atras del estado
	jr $-19		;a00d
L_A00F:
	ld hl,0de04h		;a00f   ; apunta a la cuenta atras del estado
	dec (hl)			;a012
	ret nz			;a013
	xor a			;a014
	ld (hl),a			;a015
	ld (0dd86h),a		;a016
	call 09ffah		;a019
	ld hl,0dd80h		;a01c
	ld (0dd88h),hl		;a01f
	call L_A20E		;a022
	ld a,(0dd80h)		;a025
	call L_AD7D		;a028
	ld de,05040h		;a02b
	call L_A241		;a02e
	ld a,(0dd80h)		;a031
	call L_AD75		;a034
	push hl			;a037
	ld de,03090h		;a038
	call L_A1CC		;a03b
	pop hl			;a03e
	inc hl			;a03f
	inc hl			;a040
	ld de,06090h		;a041
	call L_A1CC		;a044
	ld hl,0a307h		;a047
	call L_A22D		;a04a
	ld hl,00040h		;a04d
	ld de,008d4h		;a050
	ld a,001h		;a053
	call L_A171		;a055
	call 09f03h		;a058
	ld a,090h		;a05b
	ld (0e370h),a		;a05d
	jp L_A28B		;a060
L_A063:
	ld hl,0de04h		;a063   ; apunta a la cuenta atras del estado
	inc (hl)			;a066
	ld a,(hl)			;a067
	cp 060h		;a068
	jr z,L_A078		;a06a
	and a			;a06c
	rra			;a06d
	ret c			;a06e
	call L_A07F		;a06f
	ld c,017h		;a072
	ld b,a			;a074
	jp 00047h		;a075   ; BIOS WRTVDP - Writes data in the VDP-register
L_A078:
	xor a			;a078
	ld (0dd86h),a		;a079
	jp 09ffah		;a07c
L_A07F:
	ld b,a			;a07f
	ld hl,0dd86h		;a080
	inc (hl)			;a083
	ld a,(hl)			;a084
	and 007h		;a085
	ld a,b			;a087
	ret nz			;a088
	push af			;a089
	ld a,(0dd86h)		;a08a
	ld e,a			;a08d
	add a,040h		;a08e
	ld l,a			;a090
	ld h,000h		;a091
	ld a,0d4h		;a093
	add a,e			;a095
	ld e,a			;a096
	ld d,008h		;a097
	ld a,001h		;a099
	call L_A171		;a09b
	pop af			;a09e
	ret			;a09f
L_A0A0:
	ld hl,0dd86h		;a0a0
	inc (hl)			;a0a3
	ld a,(hl)			;a0a4
	cp 092h		;a0a5
	jr z,L_A0BF		;a0a7
	and a			;a0a9
	rra			;a0aa
	ret c			;a0ab
	ld e,a			;a0ac
	ld a,0d4h		;a0ad
	sub e			;a0af
	ld e,a			;a0b0
	ld a,0ffh		;a0b1
	sub e			;a0b3
	add a,010h		;a0b4
	ld d,a			;a0b6
	ld hl,00040h		;a0b7
	ld a,001h		;a0ba
	jp L_A171		;a0bc
L_A0BF:
	ld a,(0dd9dh)		;a0bf
	dec a			;a0c2
	jr z,L_A0CB		;a0c3
L_A0C5:
	ld a,001h		;a0c5
	ld (0ed2fh),a		;a0c7
	ret			;a0ca
L_A0CB:
	ld hl,0dd8ah		;a0cb
	inc (hl)			;a0ce
	ld e,(hl)			;a0cf
	ld d,000h		;a0d0
	ld hl,0dd80h		;a0d2
	add hl,de			;a0d5
	ld (0dd88h),hl		;a0d6
	ld a,(hl)			;a0d9
	inc a			;a0da
	jr z,L_A0C5		;a0db
	ld a,090h		;a0dd
	ld (0de04h),a		;a0df   ; guarda la cuenta atras del estado
	jp 09ffah		;a0e2
L_A0E5:
	ld hl,0de04h		;a0e5   ; apunta a la cuenta atras del estado
	dec (hl)			;a0e8
	ret nz			;a0e9
	xor a			;a0ea
	ld (hl),a			;a0eb
	ld (0dd86h),a		;a0ec
	jp 09ffah		;a0ef
L_A0F2:
	ld a,(0de03h)		;a0f2   ; lee el contador de cuadros del juego (sube uno por cuadro)
	and 003h		;a0f5
	ret nz			;a0f7
	ld hl,0dd86h		;a0f8
	inc (hl)			;a0fb
	ld a,(hl)			;a0fc
	cp 060h		;a0fd
	jr z,L_A113		;a0ff
	ld e,08ch		;a101
	ld a,0ffh		;a103
	sub e			;a105
	sub (hl)			;a106
	ld d,a			;a107
	ld a,040h		;a108
	add a,(hl)			;a10a
	ld h,000h		;a10b
	ld l,a			;a10d
	ld a,001h		;a10e
	jp L_A171		;a110
L_A113:
	call 09ffah		;a113
	xor a			;a116
	ld (0dd86h),a		;a117
	call 040e1h		;a11a
	ld de,05040h		;a11d
	ld hl,0a133h		;a120
	call L_A241		;a123
	ld hl,(0dd88h)		;a126
	ld a,(hl)			;a129
	call L_AD7D		;a12a
	ld de,05040h		;a12d
	jp L_A241		;a130

; ----------------------------------------------------------------------
; DATOS resto_A133: lo apuntan con el banco puesto p15:A120 (0xA133); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p15:A120 (10 bytes)
;   0xa133..0xa13d  (10 bytes)
DATA_resto_A133:
	defb 020h,020h,020h,020h,020h,020h,020h,020h,020h,020h	; a133

; ======================================================================
; CODIGO 0xa13d..0xa307  (458 bytes)
; ======================================================================


L_A13D:
	ld hl,0dd86h		;a13d
	inc (hl)			;a140
	ld a,(hl)			;a141
	and a			;a142
	rra			;a143
	ret c			;a144
	ld d,a			;a145
	ld a,005h		;a146
	sub d			;a148
	ld e,a			;a149
	cp 0ffh		;a14a
	jr nz,L_A15C		;a14c
	push de			;a14e
	ld de,00800h		;a14f
	ld hl,00050h		;a152
	ld a,001h		;a155
	call L_A171		;a157
	pop de			;a15a
	ld a,e			;a15b
L_A15C:
	cp 08bh		;a15c
	jp z,L_A169		;a15e
	ld hl,00040h		;a161
	ld a,001h		;a164
	jp L_A171		;a166
L_A169:
	ld a,010h		;a169
	ld (0ecefh),a		;a16b
	jp L_A0CB		;a16e
L_A171:
	ex af,af'			;a171
	call 04c67h		;a172   ; espera_vdp: espera a que el VDP acabe la orden (S#2 bit 0, CE)
	ld a,(00007h)		;a175
	inc a			;a178
	ld c,a			;a179
	ld a,022h		;a17a
	di			;a17c
	out (c),a		;a17d
	ld a,091h		;a17f
	out (c),a		;a181
	inc c			;a183
	inc c			;a184
	out (c),l		;a185
	ex af,af'			;a187
	ld l,a			;a188
	and 003h		;a189
	out (c),a		;a18b
	out (c),h		;a18d
	xor a			;a18f
	out (c),a		;a190
	out (c),e		;a192
	ld a,l			;a194
	rra			;a195
	rra			;a196
	and 003h		;a197
	out (c),a		;a199
	xor a			;a19b
	out (c),a		;a19c
	out (c),a		;a19e
	out (c),d		;a1a0
	cp d			;a1a2
	jr nz,L_A1A6		;a1a3
	inc a			;a1a5
L_A1A6:
	out (c),a		;a1a6
	xor a			;a1a8
	out (c),a		;a1a9
	out (c),a		;a1ab
	ld a,0e0h		;a1ad
	out (c),a		;a1af
	ei			;a1b1
	ret			;a1b2
L_A1B3:
	ld de,0e041h		;a1b3
	ld hl,0e040h		;a1b6
	ld bc,000bfh		;a1b9
	jr L_A1C7		;a1bc
L_A1BE:
	ld de,0df01h		;a1be
	ld hl,0df00h		;a1c1   ; apunta a los colores de sprite (16 bytes por sprite) antes de la VRAM 0xF400
	ld bc,001ffh		;a1c4
L_A1C7:
	ld (hl),000h		;a1c7
	ldir		;a1c9
	ret			;a1cb
L_A1CC:
	ld c,000h		;a1cc
	ld a,(hl)			;a1ce
	call L_A1E7		;a1cf
	ld c,000h		;a1d2
	ld a,(hl)			;a1d4
	and 00fh		;a1d5
	jr z,L_A1DB		;a1d7
	ld c,0ffh		;a1d9
L_A1DB:
	inc hl			;a1db
	ld a,(hl)			;a1dc
	rra			;a1dd
	rra			;a1de
	rra			;a1df
	rra			;a1e0
	call L_A1E7		;a1e1
	ld c,0ffh		;a1e4
	ld a,(hl)			;a1e6
L_A1E7:
	and 00fh		;a1e7
	jr z,L_A1ED		;a1e9
	ld c,0ffh		;a1eb
L_A1ED:
	add a,001h		;a1ed
	and c			;a1ef
	call L_A259		;a1f0
	ld a,d			;a1f3
	add a,008h		;a1f4
	ld d,a			;a1f6
	ret			;a1f7
L_A1F8:
	ld c,0ffh		;a1f8
	ld a,(hl)			;a1fa
	call L_A1E7		;a1fb
	inc hl			;a1fe
	ld c,0ffh		;a1ff
	ld a,(hl)			;a201
	rra			;a202
	rra			;a203
	rra			;a204
	rra			;a205
	call L_A1E7		;a206
	ld c,0ffh		;a209
	ld a,(hl)			;a20b
	jr L_A1E7		;a20c
L_A20E:
	ld de,00040h		;a20e
	ld bc,00001h		;a211
L_A214:
	push bc			;a214
	push de			;a215
	ld hl,00000h		;a216
	ld bc,00808h		;a219
	ld a,005h		;a21c
	call 04d66h		;a21e   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
	pop de			;a221
	call 04f6fh		;a222   ; siguiente_columna: D += 8; si da la vuelta, E += 8
	pop bc			;a225
	djnz L_A214		;a226
	dec c			;a228
	jr z,L_A214		;a229
	ret			;a22b
L_A22C:
	inc hl			;a22c
L_A22D:
	ld d,(hl)			;a22d
	inc hl			;a22e
	ld e,(hl)			;a22f
L_A230:
	inc hl			;a230
	ld a,(hl)			;a231
	cp 0ffh		;a232
	ret z			;a234
	cp 0feh		;a235
	jr z,L_A22C		;a237
	call L_A259		;a239
	call 04f6fh		;a23c   ; siguiente_columna: D += 8; si da la vuelta, E += 8
	jr L_A230		;a23f
L_A241:
	ld b,00ah		;a241
L_A243:
	call 09834h		;a243
	push af			;a246
	ld a,(hl)			;a247
	cp 024h		;a248
	jr nz,L_A24E		;a24a
	ld b,001h		;a24c
L_A24E:
	pop af			;a24e
	inc hl			;a24f
	call L_A259		;a250
	call 04f6fh		;a253   ; siguiente_columna: D += 8; si da la vuelta, E += 8
	djnz L_A243		;a256
	ret			;a258
L_A259:
	push bc			;a259
	push hl			;a25a
	push de			;a25b
	call 04f5eh		;a25c
	ld bc,00808h		;a25f
	ld a,005h		;a262
	call 04d66h		;a264   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
	pop de			;a267
	pop hl			;a268
	pop bc			;a269
	ret			;a26a
L_A26B:
	ld hl,(0ecf0h)		;a26b
	ld de,(0ecf2h)		;a26e
	add hl,de			;a272
	ld (0ecf0h),hl		;a273
	ld a,h			;a276
	ld (0e140h),a		;a277
	ld (0e144h),a		;a27a
	ld (0e148h),a		;a27d
	ld (0e14ch),a		;a280
	ld hl,00020h		;a283
	add hl,de			;a286
	ld (0ecf2h),hl		;a287
	ret			;a28a
L_A28B:
	ld hl,(0dd88h)		;a28b
	ld a,(hl)			;a28e
	call L_AD75		;a28f
	call L_ADD0		;a292
	ld hl,0e365h		;a295
	ld e,(hl)			;a298
	ld d,000h		;a299
	ld l,a			;a29b
	ld h,d			;a29c
	exx			;a29d
	ld bc,00002h		;a29e
	ld hl,0e360h		;a2a1
	ld de,0e361h		;a2a4
	ld (hl),000h		;a2a7
	ldir		;a2a9
	ld hl,0e360h		;a2ab
	exx			;a2ae
	ld a,l			;a2af
	or a			;a2b0
	jr z,L_A2EE		;a2b1
	ld b,004h		;a2b3
L_A2B5:
	ld c,0ffh		;a2b5
	and a			;a2b7
L_A2B8:
	inc c			;a2b8
	sbc hl,de		;a2b9
	jr z,L_A2D6		;a2bb
	jr nc,L_A2B8		;a2bd
	add hl,de			;a2bf
	ld a,b			;a2c0
	cp 004h		;a2c1
	jr z,L_A2CA		;a2c3
	ld a,c			;a2c5
	exx			;a2c6
	ld (hl),a			;a2c7
	inc hl			;a2c8
	exx			;a2c9
L_A2CA:
	push de			;a2ca
	add hl,hl			;a2cb
	ld d,h			;a2cc
	ld e,l			;a2cd
	add hl,hl			;a2ce
	add hl,hl			;a2cf
	add hl,de			;a2d0
	pop de			;a2d1
	djnz L_A2B5		;a2d2
	jr L_A2E0		;a2d4
L_A2D6:
	ld a,004h		;a2d6
	cp b			;a2d8
	jr z,L_A2FA		;a2d9
	inc c			;a2db
	ld a,c			;a2dc
	exx			;a2dd
	ld (hl),a			;a2de
	exx			;a2df
L_A2E0:
	ld hl,0e361h		;a2e0
	ld a,(hl)			;a2e3
	rla			;a2e4
	rla			;a2e5
	rla			;a2e6
	rla			;a2e7
	and 0f0h		;a2e8
	inc hl			;a2ea
	add a,(hl)			;a2eb
	dec hl			;a2ec
	ld (hl),a			;a2ed
L_A2EE:
	ld hl,0e360h		;a2ee
	ld a,(0e370h)		;a2f1
	ld e,a			;a2f4
	ld d,0bch		;a2f5
	jp L_A1F8		;a2f7
L_A2FA:
	ld a,(0e370h)		;a2fa
	ld e,a			;a2fd
	ld d,0b0h		;a2fe
	ld a,002h		;a300
	call L_A259		;a302
	jr L_A2EE		;a305

; ----------------------------------------------------------------------
; DATOS resto_A307: lo apuntan con el banco puesto p15:A047 (0xA307), p14:9EE7
;   (0xA339), p14:9E17 (0xA38B), p14:9F2E (0xA38B), p14:9FD0 (0xA38B),
;   p14:9FAC (0xA3DB); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p15:A047, p14:9EE7, p14:9E17, p14:9F2E, p14:9FD0,
;   p14:9FAC (308 bytes)
;   0xa307..0xa43b  (308 bytes)
DATA_resto_A307:
	defb 044h,058h,011h,01dh,01ch,015h,020h,00fh,022h,023h,01ah,00fh,022h,017h,01dh,01ch	; a307  DX.... ."#.."...
	defb 021h,0feh,04ch,06ch,015h,020h,013h,00fh,022h,000h,024h,017h,011h,022h,01dh,020h	; a317  !.Ll. ..".$..".
	defb 027h,0feh,050h,090h,0a4h,0feh,080h,090h,0a5h,0feh,098h,090h,0a4h,08fh,000h,000h	; a327  '.P.............
	defb 090h,0ffh,06ch,054h,021h,01dh,020h,020h,027h,0feh,050h,064h,01ah,01dh,021h,022h	; a337  ..lT!.  '.Pd..!"
	defb 000h,024h,017h,011h,022h,01dh,020h,027h,0feh,050h,078h,0a4h,0feh,080h,078h,0a5h	; a347  .$..". '.Px...x.
	defb 0feh,098h,078h,0a4h,08fh,000h,000h,090h,0feh,020h,088h,01bh,00fh,027h,000h,022h	; a357  ..x...... ...'."
	defb 016h,013h,000h,014h,01dh,020h,011h,013h,000h,010h,013h,000h,025h,017h,022h,016h	; a367  ..... ......%.".
	defb 000h,027h,01dh,023h,0feh,050h,098h,01ch,013h,026h,022h,000h,000h,021h,013h,00fh	; a377  .'.#.P...&"..!..
	defb 021h,01dh,01ch,0ffh,057h,060h,000h,007h,057h,060h,004h,01bh,057h,070h,008h,007h	; a387  !...W`..W`..Wp..
	defb 057h,070h,00ch,01bh,057h,080h,010h,007h,057h,080h,014h,01bh,057h,090h,018h,007h	; a397  Wp..W...W...W...
	defb 057h,090h,01ch,01bh,067h,060h,020h,007h,067h,060h,024h,01bh,067h,070h,028h,007h	; a3a7  W...g` .g`$.gp(.
	defb 067h,070h,02ch,01bh,067h,080h,030h,007h,067h,080h,034h,01bh,067h,090h,038h,007h	; a3b7  gp,.g.0.g.4.g.8.
	defb 067h,090h,03ch,01bh,050h,070h,080h,007h,050h,070h,084h,01bh,050h,080h,088h,007h	; a3c7  g.<.Pp..Pp..P...
	defb 050h,080h,08ch,01bh,053h,060h,040h,007h,053h,060h,044h,01bh,056h,070h,048h,007h	; a3d7  P...S`@.S`D.VpH.
	defb 056h,070h,04ch,01bh,056h,080h,050h,007h,056h,080h,054h,01bh,053h,090h,058h,007h	; a3e7  VpL.V.P.V.T.S.X.
	defb 053h,090h,05ch,01bh,063h,060h,060h,007h,063h,060h,064h,01bh,066h,070h,068h,007h	; a3f7  S.\.c``.c`d.fph.
	defb 066h,070h,06ch,01bh,066h,080h,070h,007h,066h,080h,074h,01bh,063h,090h,078h,007h	; a407  fpl.f.p.f.t.c.x.
	defb 063h,090h,07ch,01bh,037h,003h,072h,004h,043h,006h,047h,006h,077h,007h,044h,004h	; a417  c.|.7.r.C.G.w.D.
	defb 064h,001h,061h,007h,001h,004h,070h,000h,064h,006h,054h,006h,030h,000h,073h,002h	; a427  d.a...p.d.T.0.s.
	defb 007h,000h,050h,004h	; a437

; ======================================================================
; CODIGO 0xa43b..0xa441  (6 bytes)
; ======================================================================


L_A43B:
	ld a,(0d74ch)		;a43b   ; lee el despachador de los menus (y 0xD74D)
	call 04220h		;a43e   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_A441: 5 destinos del despachador p00:4220 (call en p15:A43E, el
;   indice en A): A470, A4F2, A55B, A57F, A5A3; lo leen p15:A43E (10 bytes)
;   0xa441..0xa44b  (10 bytes)
DATA_tabla_A441:
	defw 0a470h,0a4f2h,0a55bh,0a57fh,0a5a3h	; a441

; ======================================================================
; CODIGO 0xa44b..0xa52f  (228 bytes)
; ======================================================================


L_A44B:
	ld hl,0d74ch		;a44b   ; apunta a el despachador de los menus (y 0xD74D)
	dec (hl)			;a44e
	inc hl			;a44f
	ld (hl),000h		;a450
	ret			;a452
L_A453:
	call L_A456		;a453
L_A456:
	ld hl,0d74ch		;a456   ; apunta a el despachador de los menus (y 0xD74D)
	inc (hl)			;a459
	inc hl			;a45a
	ld (hl),000h		;a45b
	ret			;a45d
L_A45E:
	ld hl,0d74dh		;a45e
	inc (hl)			;a461
	ret			;a462
L_A463:
	ld a,(0d759h)		;a463
	add a,002h		;a466
	ld (0d74ch),a		;a468   ; guarda el despachador de los menus (y 0xD74D)
	xor a			;a46b
	ld (0d74dh),a		;a46c
	ret			;a46f
L_A470:
	call 04b9fh		;a470   ; borra_pantalla: esconde los sprites, apaga la pantalla, rellena la VRAM de 0, R#23 = 0 y la enciende
	xor a			;a473
	ld hl,0d74ch		;a474   ; apunta a el despachador de los menus (y 0xD74D)
	ld de,0d74dh		;a477
	ld (hl),a			;a47a
	ld bc,0000fh		;a47b
	ldir		;a47e
	ld (0da6bh),a		;a480
	ld (0d759h),a		;a483
	ld de,0f800h		;a486
	ld hl,0a6f0h		;a489
	ld bc,00020h		;a48c
	call 04ab7h		;a48f   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	ld hl,0a710h		;a492
	call 04ea6h		;a495   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld hl,00050h		;a498
	ld c,00dh		;a49b
	ld b,000h		;a49d
	call 04c91h		;a49f   ; linea: orden LINE (0x70) del VDP desde HL
	ld hl,008c6h		;a4a2
	ld c,00dh		;a4a5
	ld de,0f20ch		;a4a7
	call 04cfeh		;a4aa   ; marco: un marco de lineas: HL la esquina, DE el tamano
	ld hl,03ec6h		;a4ad
	ld c,00dh		;a4b0
	ld b,00ch		;a4b2
	call 04cc7h		;a4b4   ; linea_vertical: orden LINE (0x70) del VDP, el lado largo en vertical
	ld hl,06ec6h		;a4b7
	ld c,00dh		;a4ba
	ld b,00ch		;a4bc
	call 04cc7h		;a4be   ; linea_vertical: orden LINE (0x70) del VDP, el lado largo en vertical
	ld hl,09ec6h		;a4c1
	ld c,00dh		;a4c4
	ld b,00ch		;a4c6
	call 04cc7h		;a4c8   ; linea_vertical: orden LINE (0x70) del VDP, el lado largo en vertical
	ld hl,0cec6h		;a4cb
	ld c,00dh		;a4ce
	ld b,00ch		;a4d0
	call 04cc7h		;a4d2   ; linea_vertical: orden LINE (0x70) del VDP, el lado largo en vertical
	ld a,(0de02h)		;a4d5   ; lee las marcas del modo: bit 6 un jugador, 5 dos jugadores, 4 PENNANT (contra el ordenador), 3 el ordenador solo
	bit 3,a		;a4d8
	ld hl,0a770h		;a4da
	jr nz,L_A4E9		;a4dd
	bit 5,a		;a4df
	ld hl,0a74fh		;a4e1
	jr z,L_A4E9		;a4e4
	ld hl,0a72bh		;a4e6
L_A4E9:
	call 04ea6h		;a4e9   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	call L_A67A		;a4ec
	jp L_A456		;a4ef
L_A4F2:
	call L_A4FD		;a4f2
	jp L_A456		;a4f5
L_A4F8:
	call L_A532		;a4f8
	jr L_A503		;a4fb
L_A4FD:
	call L_A532		;a4fd
	call 06a0dh		;a500
L_A503:
	ld hl,0da6ch		;a503
	ld (hl),020h		;a506
	ld de,0da6dh		;a508
	ld bc,00015h		;a50b
	ldir		;a50e
	ld de,0f600h		;a510
	ld hl,0a52fh		;a513
	ld bc,00003h		;a516
	call 04ab7h		;a519   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	ld hl,0f604h		;a51c
	ld a,0d8h		;a51f
	call 04ae3h		;a521   ; byte_a_vram: escribe A en la VRAM HL
	ld hl,0f400h		;a524
	ld a,007h		;a527
	ld bc,00010h		;a529
	jp 04acah		;a52c

; ----------------------------------------------------------------------
; DATOS copia_A52F: 3 bytes que p00:4AB7 copia tal cual a la VRAM 0xF600; lo
;   leen p15:A519 (3 bytes)
;   0xa52f..0xa532  (3 bytes)
DATA_copia_A52F:
	defb 0e0h,000h,000h	; a52f

; ======================================================================
; CODIGO 0xa532..0xa5a9  (119 bytes)
; ======================================================================


L_A532:
	ld hl,062d7h		;a532
	ld de,0daaeh		;a535
	ld bc,00042h		;a538
	ldir		;a53b
	ld a,024h		;a53d
	ld (de),a			;a53f
	ld a,006h		;a540
	ld (0d2b2h),a		;a542
	call 081fch		;a545
	ld a,02eh		;a548
	call 057ffh		;a54a   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	ld hl,0d70ah		;a54d
	ld de,0d70bh		;a550
	ld (hl),0ffh		;a553
	ld bc,00005h		;a555
	ldir		;a558
	ret			;a55a
L_A55B:
	call L_A663		;a55b
	ld a,(0d759h)		;a55e
	or a			;a561
	jp nz,L_A463		;a562
	call 06938h		;a565
	call 06a0dh		;a568
	ld a,(0de06h)		;a56b   ; lee los botones recien pulsados del mando 1 / cursores
	and 010h		;a56e
	ret z			;a570
	ld hl,0d70ah		;a571
	ld e,000h		;a574
	call L_A5DA		;a576
	call L_A603		;a579
	jp 06922h		;a57c
L_A57F:
	call L_A663		;a57f
	ld a,(0d759h)		;a582
	dec a			;a585
	jp nz,L_A463		;a586
	call 06938h		;a589
	call 06a0dh		;a58c
	ld a,(0de06h)		;a58f   ; lee los botones recien pulsados del mando 1 / cursores
	and 010h		;a592
	ret z			;a594
	ld hl,0d70bh		;a595
	ld e,001h		;a598
	call L_A5DA		;a59a
	call L_A603		;a59d
	jp 06922h		;a5a0
L_A5A3:
	ld a,(0d74dh)		;a5a3
	call 04220h		;a5a6   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_A5A9: 2 destinos del despachador p00:4220 (call en p15:A5A6, el
;   indice en A): A5AD, A5CB; lo leen p15:A5A6 (4 bytes)
;   0xa5a9..0xa5ad  (4 bytes)
DATA_tabla_A5A9:
	defw 0a5adh,0a5cbh	; a5a9  -> L_A5AD L_A5CB

; ======================================================================
; CODIGO 0xa5ad..0xa6be  (273 bytes)
; ======================================================================


L_A5AD:
	call L_A663		;a5ad
	ld a,(0d759h)		;a5b0
	sub 002h		;a5b3
	jp nz,L_A463		;a5b5
	ld a,(0de06h)		;a5b8   ; lee los botones recien pulsados del mando 1 / cursores
	and 010h		;a5bb
	ret z			;a5bd
	ld hl,(0d70ah)		;a5be
	ld a,h			;a5c1
	inc a			;a5c2
	ret z			;a5c3
	ld a,l			;a5c4
	inc a			;a5c5
	ret z			;a5c6
	jp nz,L_A45E		;a5c7
	ret			;a5ca
L_A5CB:
	call L_A630		;a5cb
	ld hl,0a76ah		;a5ce
	call 04ea6h		;a5d1   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld a,001h		;a5d4
	ld (0e1d1h),a		;a5d6   ; guarda la marca de acabado de los pasos; en el lanzamiento, su paso (p03:A525)
	ret			;a5d9
L_A5DA:
	ld a,(0d74fh)		;a5da
	ld bc,(0d70ah)		;a5dd
	cp b			;a5e1
	ret z			;a5e2
	cp c			;a5e3
	ret z			;a5e4
	ld (hl),a			;a5e5
	ld a,e			;a5e6
	call 06afdh		;a5e7
	ld bc,0da6ch		;a5ea
	add hl,bc			;a5ed
	ex de,hl			;a5ee
	ld a,(0d74fh)		;a5ef
	call 06afdh		;a5f2
	ld bc,0daaeh		;a5f5
	add hl,bc			;a5f8
	ld bc,0000bh		;a5f9
	ldir		;a5fc
	ld a,027h		;a5fe
	jp 057ffh		;a600   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_A603:
	ld hl,0da6ch		;a603
	ld de,08020h		;a606
	ld a,(0d70ah)		;a609
	inc a			;a60c
	jr nz,L_A612		;a60d
	ld hl,06aabh		;a60f
L_A612:
	call L_A651		;a612
	ld hl,0da77h		;a615
	ld de,08038h		;a618
	ld a,(0d70bh)		;a61b
	inc a			;a61e
	jr nz,L_A624		;a61f
	ld hl,06aabh		;a621
L_A624:
	call L_A651		;a624
	call L_A669		;a627
	call 06a0dh		;a62a
	jp L_A463		;a62d
L_A630:
	ld hl,0d680h		;a630
	ld de,0d681h		;a633
	ld (hl),000h		;a636
	ld bc,0000ah		;a638
	ldir		;a63b
	ld de,0d680h		;a63d
	ld hl,0da6ch		;a640
	ld bc,0000bh		;a643
	ldir		;a646
	ld de,0d740h		;a648
	ld bc,0000bh		;a64b
	ldir		;a64e
	ret			;a650
L_A651:
	ld b,00ah		;a651
L_A653:
	push bc			;a653
	call 09834h		;a654
	call 04f1ch		;a657   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld a,d			;a65a
	add a,008h		;a65b
	ld d,a			;a65d
	inc hl			;a65e
	pop bc			;a65f
	djnz L_A653		;a660
	ret			;a662
L_A663:
	ld a,(0de06h)		;a663   ; lee los botones recien pulsados del mando 1 / cursores
	and 020h		;a666
	ret z			;a668
L_A669:
	ld a,(0d759h)		;a669
	inc a			;a66c
	cp 003h		;a66d
	jr nz,L_A672		;a66f
	xor a			;a671
L_A672:
	ld (0d759h),a		;a672
	ld a,026h		;a675
	call 057ffh		;a677   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_A67A:
	ld a,(0de02h)		;a67a   ; lee las marcas del modo: bit 6 un jugador, 5 dos jugadores, 4 PENNANT (contra el ordenador), 3 el ordenador solo
	bit 3,a		;a67d
	ld hl,0a770h		;a67f
	jr nz,L_A68E		;a682
	bit 5,a		;a684
	ld hl,0a74fh		;a686
	jr z,L_A68E		;a689
	ld hl,0a72bh		;a68b
L_A68E:
	call 04ea6h		;a68e   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld a,(0de02h)		;a691   ; lee las marcas del modo: bit 6 un jugador, 5 dos jugadores, 4 PENNANT (contra el ordenador), 3 el ordenador solo
	bit 3,a		;a694
	jr nz,L_A6B6		;a696
	ld a,(0d759h)		;a698
	cp 001h		;a69b
	jr nz,L_A6A8		;a69d
	ld hl,0de02h		;a69f   ; apunta a las marcas del modo: bit 6 un jugador, 5 dos jugadores, 4 PENNANT (contra el ordenador), 3 el ordenador solo
	bit 5,(hl)		;a6a2
	jr nz,L_A6A8		;a6a4
	ld a,003h		;a6a6
L_A6A8:
	ld hl,0a6beh		;a6a8
L_A6AB:
	add a,a			;a6ab
	call 04216h		;a6ac   ; hl_mas_a: HL = HL + A
	ld e,(hl)			;a6af
	inc hl			;a6b0
	ld d,(hl)			;a6b1
	ex de,hl			;a6b2
	jp 04ea6h		;a6b3   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
L_A6B6:
	ld a,(0d759h)		;a6b6
	ld hl,0a6c6h		;a6b9
	jr L_A6AB		;a6bc

; ----------------------------------------------------------------------
; DATOS resto_A6BE: lo apuntan con el banco puesto p15:A6A8 (0xA6BE), p13:61EB
;   (0xA6C6), p15:A6B9 (0xA6C6); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p15:A6A8, p13:61EB, p15:A6B9 (50 bytes)
;   0xa6be..0xa6f0  (50 bytes)
DATA_resto_A6BE:
	defb 0cch,0a6h,0d1h,0a6h,0dch,0a6h,0d6h,0a6h,0e2h,0a6h,0e9h,0a6h,0dch,0a6h,00ah,0c8h	; a6be  ................
	defb 0a2h,0beh,0ffh,042h,0c8h,0a3h,0beh,0ffh,042h,0c8h,0b1h,0beh,0c3h,0ffh,072h,0c8h	; a6ce  ...B....B.....r.
	defb 0b3h,0bch,0b2h,0ffh,00ah,0c8h,0b1h,0beh,0c3h,0a2h,0ffh,042h,0c8h,0b1h,0beh,0c3h	; a6de  ...........B....
	defb 0a3h,0ffh	; a6ee

; ----------------------------------------------------------------------
; DATOS copia_A6F0: 32 bytes que p00:4AB7 copia tal cual a la VRAM 0xF800; lo
;   leen p15:A48F (32 bytes)
;   0xa6f0..0xa710  (32 bytes)
DATA_copia_A6F0:
	defb 010h,018h,01ch,01eh,01eh,01ch,018h,010h,000h,000h,000h,000h,000h,000h,000h,000h	; a6f0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a700  ................

; ----------------------------------------------------------------------
; DATOS texto_A710: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p13:6548, p15:A495 (27 bytes)
;   0xa710..0xa72b  (27 bytes)
DATA_texto_A710:
	defb 03ch,000h,022h,013h,00fh,01bh,000h,01ch,00fh,01bh,013h,000h,021h,013h,01ah,013h	; a710  <.".........!...
	defb 011h,022h,0feh,068h,054h,022h,013h,00fh,01bh,021h,0ffh	; a720  .".hT"...!.

; ----------------------------------------------------------------------
; DATOS texto_A72B: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p15:A4E9, p15:A68E (36 bytes)
;   0xa72b..0xa74f  (36 bytes)
DATA_texto_A72B:
	defb 038h,020h,01eh,01ah,00fh,027h,013h,020h,002h,0feh,038h,038h,01eh,01ah,00fh,027h	; a72b  8 ...'. ..88...'
	defb 013h,020h,003h,0feh,00ah,0c8h,002h,01eh,0feh,042h,0c8h,003h,01eh,0feh,072h,0c8h	; a73b  . .......B....r.
	defb 013h,01ch,012h,0ffh	; a74b

; ----------------------------------------------------------------------
; DATOS resto_A74F: lo apuntan con el banco puesto p15:A4E1 (0xA74F), p15:A686
;   (0xA74F); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p15:A4E1, p15:A686 (27 bytes)
;   0xa74f..0xa76a  (27 bytes)
DATA_resto_A74F:
	defb 038h,020h,01eh,01ah,00fh,027h,013h,020h,002h,0feh,048h,038h,011h,01eh,023h,0feh	; a74f  8 ...'. ..H8..#.
	defb 00ah,0c8h,002h,01eh,0feh,042h,0c8h,011h,01eh,023h,0feh	; a75f  .....B...#.

; ----------------------------------------------------------------------
; DATOS texto_A76A: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p15:A5D1 (6 bytes)
;   0xa76a..0xa770  (6 bytes)
DATA_texto_A76A:
	defb 072h,0c8h,013h,01ch,012h,0ffh	; a76a

; ----------------------------------------------------------------------
; DATOS resto_A770: lo apuntan con el banco puesto p15:A4DA (0xA770), p15:A67F
;   (0xA770); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p15:A4DA, p15:A67F (34 bytes)
;   0xa770..0xa792  (34 bytes)
DATA_resto_A770:
	defb 048h,020h,011h,01eh,023h,002h,0feh,048h,038h,011h,01eh,023h,003h,0feh,00ah,0c8h	; a770  H ..#..H8..#....
	defb 011h,01eh,023h,002h,0feh,042h,0c8h,011h,01eh,023h,003h,0feh,072h,0c8h,013h,01ch	; a780  ..#..B...#..r...
	defb 012h,0ffh	; a790

; ======================================================================
; CODIGO 0xa792..0xab46  (948 bytes)
; ======================================================================


L_A792:
	xor a			;a792
	ld (0dd9dh),a		;a793
	dec a			;a796
	ld hl,0dd80h		;a797
	ld de,0dd81h		;a79a
	ld (hl),a			;a79d
	ld bc,00006h		;a79e
	ldir		;a7a1
	call 06b5bh		;a7a3
	dec b			;a7a6
	ld a,(0d6deh)		;a7a7
	ld c,a			;a7aa
	xor a			;a7ab
L_A7AC:
	add a,c			;a7ac
	djnz L_A7AC		;a7ad
	ld (0e360h),a		;a7af
	ld a,(0d6e1h)		;a7b2
	dec a			;a7b5
	jr z,L_A7E2		;a7b6
	ld hl,0d6e3h		;a7b8
	call 06b5bh		;a7bb
L_A7BE:
	push hl			;a7be
	push bc			;a7bf
	call 06b5bh		;a7c0
	xor a			;a7c3
L_A7C4:
	add a,(hl)			;a7c4
	inc hl			;a7c5
	djnz L_A7C4		;a7c6
	ld hl,0e360h		;a7c8
	cp (hl)			;a7cb
	jr c,L_A7D9		;a7cc
	pop bc			;a7ce
	pop hl			;a7cf
	ld de,00006h		;a7d0
	add hl,de			;a7d3
	djnz L_A7BE		;a7d4
	jp L_A864		;a7d6
L_A7D9:
	pop bc			;a7d9
	pop hl			;a7da
	call L_A81E		;a7db
	ret nc			;a7de
	jp L_A864		;a7df
L_A7E2:
	ld a,(0e360h)		;a7e2
	ld hl,0d6dch		;a7e5   ; apunta a el equipo del jugador en PENNANT (bit 0)
	cp (hl)			;a7e8
	jr z,L_A7EF		;a7e9
	call L_A81E		;a7eb
	ret nc			;a7ee
L_A7EF:
	ld hl,0e195h		;a7ef
	ld a,(0d6dch)		;a7f2   ; lee el equipo del jugador en PENNANT (bit 0)
	rra			;a7f5
	jr c,L_A7FB		;a7f6
	ld hl,0e197h		;a7f8
L_A7FB:
	ld de,0d731h		;a7fb
	call 06b5bh		;a7fe
	dec b			;a801
L_A802:
	ld a,(de)			;a802
	ld c,a			;a803
	dec de			;a804
	ld a,(de)			;a805
	cp (hl)			;a806
	jr z,L_A864		;a807
	inc de			;a809
	inc de			;a80a
	ld a,(de)			;a80b
	cp c			;a80c
	jr nz,L_A813		;a80d
	djnz L_A802		;a80f
	jr L_A864		;a811
L_A813:
	ld a,002h		;a813
	ld (0dd9dh),a		;a815
	ld de,0dd80h		;a818
	ldi		;a81b
	ret			;a81d
L_A81E:
	call 06b5bh		;a81e
	ld a,b			;a821
	ld hl,0d730h		;a822
	ld de,0e340h		;a825   ; apunta a variable de paso (cada rutina la usa a su manera)
	ld bc,0e350h		;a828
L_A82B:
	push af			;a82b
	ld a,(hl)			;a82c
	exx			;a82d
	call L_AD75		;a82e
	call L_ADD0		;a831
	ld e,a			;a834
	inc hl			;a835
	inc hl			;a836
	call L_ADD0		;a837
	add a,e			;a83a
	ld b,a			;a83b
	ld a,(0e360h)		;a83c
	sub b			;a83f
	push af			;a840
	ld a,e			;a841
	exx			;a842
	ld (de),a			;a843
	pop af			;a844
	ld (bc),a			;a845
	inc hl			;a846
	inc hl			;a847
	inc de			;a848
	inc bc			;a849
	pop af			;a84a
	dec a			;a84b
	jr nz,L_A82B		;a84c
	call 06b5bh		;a84e
	dec b			;a851
	ld hl,0e340h		;a852   ; apunta a variable de paso (cada rutina la usa a su manera)
	ld c,(hl)			;a855
	ld de,0e351h		;a856
	inc hl			;a859
L_A85A:
	ld a,(de)			;a85a
	add a,(hl)			;a85b
	cp c			;a85c
	ret nc			;a85d
	inc de			;a85e
	inc hl			;a85f
	djnz L_A85A		;a860
	scf			;a862
	ret			;a863
L_A864:
	ld a,001h		;a864
	ld (0dd9dh),a		;a866
	ld hl,0d730h		;a869
	ld a,(hl)			;a86c
	call L_AD75		;a86d
	call L_ADD0		;a870
	push af			;a873
	ld hl,0d730h		;a874
	call 06b5bh		;a877
	dec b			;a87a
	pop af			;a87b
L_A87C:
	push bc			;a87c
	exx			;a87d
	ld b,a			;a87e
	exx			;a87f
	inc hl			;a880
	inc hl			;a881
	push hl			;a882
	ld a,(hl)			;a883
	call L_AD75		;a884
	call L_ADD0		;a887
	pop hl			;a88a
	ld b,a			;a88b
	exx			;a88c
	ld a,b			;a88d
	exx			;a88e
	cp b			;a88f
	ld a,b			;a890
	pop bc			;a891
	jr nz,L_A896		;a892
	djnz L_A87C		;a894
L_A896:
	push bc			;a896
	call 06b5bh		;a897
	ld a,b			;a89a
	pop bc			;a89b
	sub b			;a89c
	ld b,a			;a89d
	ld hl,0d730h		;a89e
	ld de,0dd80h		;a8a1
L_A8A4:
	ld c,0ffh		;a8a4
	ldi		;a8a6
	inc hl			;a8a8
	djnz L_A8A4		;a8a9
	ret			;a8ab
L_A8AC:
	ld hl,0d392h		;a8ac
	ld de,0e1b4h		;a8af
	ld bc,00c0ch		;a8b2
	call L_A9C9		;a8b5
	ld hl,0e1ech		;a8b8
	ld de,0e1b4h		;a8bb
	ld b,00ch		;a8be
	call L_BA2D		;a8c0
	ex de,hl			;a8c3
	ld hl,0e1ech		;a8c4
	ld bc,03500h		;a8c7
	call L_AA23		;a8ca
	ld (0e1eeh),de		;a8cd
	ld hl,0d395h		;a8d1
	ld de,0e1cch		;a8d4
	ld bc,00c0dh		;a8d7
	call L_A9E5		;a8da
	ld b,00ch		;a8dd
	call L_AA13		;a8df
	ex de,hl			;a8e2
	ld hl,0e1e8h		;a8e3
	ld bc,00200h		;a8e6
	call L_AA23		;a8e9
	ld (0e1eah),de		;a8ec
	ld hl,0d397h		;a8f0
	ld de,0e1d8h		;a8f3
	ld bc,00c0dh		;a8f6
	call L_A9E5		;a8f9
	ld b,00ch		;a8fc
	call L_AA13		;a8fe
	ex de,hl			;a901
	ld hl,0e1e4h		;a902
	ld bc,00600h		;a905
	call L_AA23		;a908
	ld (0e1e6h),de		;a90b
	ld hl,0d43bh		;a90f
	ld de,0e1f0h		;a912
	ld bc,00411h		;a915
	call L_A9C9		;a918
	ld hl,0e1f8h		;a91b
	ld de,0e1f0h		;a91e
	ld b,004h		;a921
	call L_BA2D		;a923
	ex de,hl			;a926
	ld hl,0e1f8h		;a927
	ld bc,00540h		;a92a
	call L_AA23		;a92d
	ld (0e1fah),de		;a930
	ld hl,0d43eh		;a934
	ld de,0e1fch		;a937
	ld bc,00411h		;a93a
	call L_A9C9		;a93d
	ld hl,0e204h		;a940
	ld de,0e1fch		;a943
	ld b,004h		;a946
	call L_BA2D		;a948
	ex de,hl			;a94b
	ld hl,0e204h		;a94c
	ld bc,00990h		;a94f
	call L_AA23		;a952
	ld (0e206h),de		;a955
	ld hl,0d441h		;a959
	ld de,0e20eh		;a95c
	ld bc,00412h		;a95f
	call L_A9E5		;a962
	ld b,004h		;a965
	call L_AA13		;a967
	ex de,hl			;a96a
	ld hl,0e216h		;a96b
	ld bc,00200h		;a96e
	call L_AA23		;a971
	ld (0e218h),de		;a974   ; guarda la x de la pelota y el byte siguiente (16 bits)
	ld hl,0d443h		;a978
	ld de,0e21ah		;a97b   ; apunta a la velocidad x de la pelota
	call L_A9FC		;a97e
	ld hl,0e21eh		;a981
	call L_AA31		;a984
	ld (0e21fh),a		;a987
	ld hl,0d444h		;a98a
	ld de,0e220h		;a98d   ; apunta a el defensor que tiene la pelota (1-9; 0 nadie)
	call L_A9FC		;a990
	ld hl,0e224h		;a993
	call L_AA31		;a996
	ld (0e225h),a		;a999
	ld hl,0d445h		;a99c
	ld de,0e226h		;a99f
	call L_A9FC		;a9a2
	ld hl,0e22ah		;a9a5
	call L_AA31		;a9a8
	ld (0e22bh),a		;a9ab   ; guarda el defensor que va a por la pelota (desplazamiento de 16 en 16)
	call L_B76A		;a9ae
	call L_B7F6		;a9b1
	call L_B6FE		;a9b4
	call L_B8D1		;a9b7
	call L_B91B		;a9ba
	call L_B981		;a9bd
	call L_B9FF		;a9c0
	call L_B9C0		;a9c3
	jp L_B84B		;a9c6
L_A9C9:
	push bc			;a9c9
	inc de			;a9ca
	ld a,(hl)			;a9cb
	inc hl			;a9cc
	dec a			;a9cd
	ld (de),a			;a9ce
	dec de			;a9cf
	ld a,(hl)			;a9d0
	inc hl			;a9d1
	dec a			;a9d2
	rla			;a9d3
	rla			;a9d4
	rla			;a9d5
	rla			;a9d6
	and 0f0h		;a9d7
	or (hl)			;a9d9
	dec a			;a9da
	ld (de),a			;a9db
	inc de			;a9dc
	inc de			;a9dd
	ld b,000h		;a9de
	add hl,bc			;a9e0
	pop bc			;a9e1
	djnz L_A9C9		;a9e2
	ret			;a9e4
L_A9E5:
	push de			;a9e5
L_A9E6:
	push bc			;a9e6
	ld a,(hl)			;a9e7
	inc hl			;a9e8
	dec a			;a9e9
	rla			;a9ea
	rla			;a9eb
	rla			;a9ec
	rla			;a9ed
	and 0f0h		;a9ee
	add a,(hl)			;a9f0
	dec a			;a9f1
	ld (de),a			;a9f2
	ld b,000h		;a9f3
	add hl,bc			;a9f5
	inc de			;a9f6
	pop bc			;a9f7
	djnz L_A9E6		;a9f8
	pop de			;a9fa
	ret			;a9fb
L_A9FC:
	push de			;a9fc
	ld b,004h		;a9fd
L_A9FF:
	push bc			;a9ff
	ld a,(hl)			;aa00
	dec a			;aa01
	ld (de),a			;aa02
	inc de			;aa03
	ld bc,00013h		;aa04
	add hl,bc			;aa07
	pop bc			;aa08
	djnz L_A9FF		;aa09
	pop de			;aa0b
	ld b,004h		;aa0c
	call L_AA13		;aa0e
	ex de,hl			;aa11
	ret			;aa12
L_AA13:
	ld hl,00000h		;aa13
L_AA16:
	ld a,(de)			;aa16
	inc de			;aa17
	add a,l			;aa18
	daa			;aa19
	ld l,a			;aa1a
	ld a,000h		;aa1b
	adc a,h			;aa1d
	daa			;aa1e
	ld h,a			;aa1f
	djnz L_AA16		;aa20
	ret			;aa22
L_AA23:
	ld (hl),e			;aa23
	inc hl			;aa24
	ld (hl),d			;aa25
	ld a,c			;aa26
	sub e			;aa27
	daa			;aa28
	ld e,a			;aa29
	ld a,b			;aa2a
	sbc a,d			;aa2b
	daa			;aa2c
	ld d,a			;aa2d
	ld d,e			;aa2e
	ld e,a			;aa2f
	ret			;aa30
L_AA31:
	ld bc,00025h		;aa31
	ld (hl),e			;aa34
	inc hl			;aa35
	ld (hl),d			;aa36
	ld a,c			;aa37
	sub e			;aa38
	daa			;aa39
	ret			;aa3a
L_AA3B:
	ld a,(0dd92h)		;aa3b
	dec a			;aa3e
	jr z,L_AA81		;aa3f
	dec a			;aa41
	jp z,L_AAD6		;aa42
	ld de,02870h		;aa45
	ld b,006h		;aa48
	call L_AA69		;aa4a
	ld de,078c0h		;aa4d
	xor a			;aa50
	call 04f1ch		;aa51   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld d,080h		;aa54
	xor a			;aa56
	call 04f1ch		;aa57   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld hl,07de1h		;aa5a
	call 04ea6h		;aa5d   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	xor a			;aa60
	call L_AABC		;aa61
L_AA64:
	ld hl,0dd92h		;aa64
	inc (hl)			;aa67
	ret			;aa68
L_AA69:
	push de			;aa69
	push bc			;aa6a
	ld b,00ah		;aa6b
L_AA6D:
	push bc			;aa6d
	xor a			;aa6e
	call 04f1ch		;aa6f   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	call 04f6fh		;aa72   ; siguiente_columna: D += 8; si da la vuelta, E += 8
	pop bc			;aa75
	djnz L_AA6D		;aa76
	pop bc			;aa78
	pop de			;aa79
	ld a,e			;aa7a
	add a,010h		;aa7b
	ld e,a			;aa7d
	djnz L_AA69		;aa7e
	ret			;aa80
L_AA81:
	call L_AAAB		;aa81
	ld a,(0de06h)		;aa84   ; lee los botones recien pulsados del mando 1 / cursores
	and 010h		;aa87
	ret z			;aa89
	ld a,(0dd93h)		;aa8a
	inc a			;aa8d
	ld (0dd8fh),a		;aa8e
	dec a			;aa91
	xor 001h		;aa92
	ld de,02890h		;aa94
	rla			;aa97
	rla			;aa98
	rla			;aa99
	rla			;aa9a
	and 0f0h		;aa9b
	add a,e			;aa9d
	ld e,a			;aa9e
	ld b,001h		;aa9f
	call L_AA69		;aaa1
	ld hl,0de04h		;aaa4   ; apunta a la cuenta atras del estado
	ld (hl),020h		;aaa7
	jr L_AA64		;aaa9
L_AAAB:
	call L_AACF		;aaab
	ld hl,0dd93h		;aaae
	ld a,(0de06h)		;aab1   ; lee los botones recien pulsados del mando 1 / cursores
	and 003h		;aab4
	ld a,(hl)			;aab6
	jr z,L_AABC		;aab7
	xor 001h		;aab9
	ld (hl),a			;aabb
L_AABC:
	ld c,0ffh		;aabc
L_AABE:
	rla			;aabe
	rla			;aabf
	rla			;aac0
	rla			;aac1
	and 0f0h		;aac2
	add a,090h		;aac4
	ld e,a			;aac6
	ld d,018h		;aac7
	ld hl,07df7h		;aac9
	jp 04eb5h		;aacc   ; texto_en_de: pinta el texto HL en la posicion DE (sin [x y] delante)
L_AACF:
	ld a,(0dd93h)		;aacf
	ld c,000h		;aad2
	jr L_AABE		;aad4
L_AAD6:
	ld hl,0de04h		;aad6   ; apunta a la cuenta atras del estado
	dec (hl)			;aad9
	ret nz			;aada
	ld a,001h		;aadb
	ld (0dd91h),a		;aadd
	ret			;aae0
L_AAE1:
	ld a,(0dd92h)		;aae1
	dec a			;aae4
	jr z,L_AAF2		;aae5
	call 06187h		;aae7
	call 06272h		;aaea
	ld hl,0dd92h		;aaed
	inc (hl)			;aaf0
	ret			;aaf1
L_AAF2:
	call L_AB01		;aaf2
	ld a,(0de06h)		;aaf5   ; lee los botones recien pulsados del mando 1 / cursores
	and 010h		;aaf8
	ret z			;aafa
	ld a,001h		;aafb
	ld (0dd91h),a		;aafd
	ret			;ab00
L_AB01:
	ld a,(0de06h)		;ab01   ; lee los botones recien pulsados del mando 1 / cursores
	and 003h		;ab04
	jr z,L_AB10		;ab06
	ld a,(0dd93h)		;ab08
	xor 001h		;ab0b
	ld (0dd93h),a		;ab0d
L_AB10:
	ld a,(0dd93h)		;ab10
	rla			;ab13
	rla			;ab14
	rla			;ab15
	rla			;ab16
	and 0f0h		;ab17
	add a,d			;ab19
	jp 069e0h		;ab1a
L_AB1D:
	ld hl,0e190h		;ab1d   ; apunta a el modo de juego (0 1PLAYER, 1 2PLAYERS, 2 PENNANT, 3 TEAM EDIT, 4 WATCH, 5 MEDIA SELECT)
	ld de,0e191h		;ab20
	ld bc,00c54h		;ab23
	ld (hl),000h		;ab26
	ldir		;ab28
	call L_AB73		;ab2a
	ld hl,00708h		;ab2d
	ld (0de0bh),hl		;ab30
	xor a			;ab33
	ld (0ecefh),a		;ab34
	inc a			;ab37
	ld (0e1a0h),a		;ab38   ; guarda el modo elegido en el menu (no 0: elegido)
	ld a,02dh		;ab3b
	jp 057ffh		;ab3d   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_AB40:
	ld a,(0ecefh)		;ab40
	call 04220h		;ab43   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_AB46: 2 destinos del despachador p00:4220 (call en p15:AB43, el
;   indice en A): AB4A, AB66; lo leen p15:AB43 (4 bytes)
;   0xab46..0xab4a  (4 bytes)
DATA_tabla_AB46:
	defw 0ab4ah,0ab66h	; ab46  -> L_AB4A L_AB66

; ======================================================================
; CODIGO 0xab4a..0xaba0  (86 bytes)
; ======================================================================


L_AB4A:
	call 04081h		;ab4a
	ld hl,(0de0bh)		;ab4d
	dec hl			;ab50
	ld (0de0bh),hl		;ab51
	ld a,h			;ab54
	or l			;ab55
	ret nz			;ab56
	ld a,001h		;ab57
	call 04078h		;ab59
	ld a,078h		;ab5c
	ld (0de0bh),a		;ab5e
	ld hl,0ecefh		;ab61
	inc (hl)			;ab64
	ret			;ab65
L_AB66:
	call 04081h		;ab66
	ld hl,0de0bh		;ab69
	dec (hl)			;ab6c
	ret nz			;ab6d
	xor a			;ab6e
	ld (0e1a0h),a		;ab6f   ; guarda el modo elegido en el menu (no 0: elegido)
	ret			;ab72
L_AB73:
	call 0408ah		;ab73
	call 04093h		;ab76
	call L_ABB0		;ab79
	call L_AB89		;ab7c
	xor a			;ab7f
	ld (0e1a1h),a		;ab80   ; guarda el paso de la jugada (y de TEAM EDIT)
	ld a,008h		;ab83
	ld (0de02h),a		;ab85   ; guarda las marcas del modo: bit 6 un jugador, 5 dos jugadores, 4 PENNANT (contra el ordenador), 3 el ordenador solo
	ret			;ab88
L_AB89:
	ld hl,0aba0h		;ab89
	ld de,0ec50h		;ab8c   ; apunta a el orden de bateo del visitante (9 numeros de jugador)
	ld bc,00010h		;ab8f
	ldir		;ab92
	ld hl,0aba0h		;ab94
	ld de,0ec62h		;ab97   ; apunta a el orden de bateo del local (9 numeros de jugador)
	ld bc,00010h		;ab9a
	ldir		;ab9d
	ret			;ab9f

; ----------------------------------------------------------------------
; DATOS resto_ABA0: lo apuntan con el banco puesto p15:AB89 (0xABA0), p15:AB94
;   (0xABA0); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p15:AB89, p15:AB94 (16 bytes)
;   0xaba0..0xabb0  (16 bytes)
DATA_resto_ABA0:
	defb 001h,002h,003h,004h,005h,006h,007h,008h,00dh,00ah,00bh,00ch,000h,00eh,00fh,010h	; aba0  ................

; ======================================================================
; CODIGO 0xabb0..0xabe1  (49 bytes)
; ======================================================================


L_ABB0:
	ld hl,0edffh		;abb0
	inc (hl)			;abb3
	ld a,(hl)			;abb4
	and 00fh		;abb5
	ld de,0d70ah		;abb7
	ld hl,0abe1h		;abba
	call 04216h		;abbd   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;abc0
	ld (de),a			;abc1
	inc hl			;abc2
	inc de			;abc3
	ld a,(hl)			;abc4
	ld (de),a			;abc5
	ld a,(0d70ah)		;abc6
	ld de,0d380h		;abc9   ; apunta a la ficha del visitante (255 bytes de p13:731F: nombre de 11 letras y jugadores)
	call L_ABD5		;abcc
	ld a,(0d70bh)		;abcf
	ld de,0d47fh		;abd2   ; apunta a la ficha del local (255 bytes de p13:731F; en TEAM EDIT, el paso del dialogo de guardar)
L_ABD5:
	ld hl,0731fh		;abd5
	call 0556dh		;abd8   ; palabra_a: HL = la palabra A de la tabla HL
	ld bc,000ffh		;abdb
	ldir		;abde
	ret			;abe0

; ----------------------------------------------------------------------
; DATOS resto_ABE1: lo apuntan con el banco puesto p15:ABBA (0xABE1), p00:5C97
;   (0xABF2); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p15:ABBA, p00:5C97 (57 bytes)
;   0xabe1..0xac1a  (57 bytes)
DATA_resto_ABE1:
	defb 000h,001h,002h,003h,004h,005h,003h,001h,004h,002h,000h,005h,001h,004h,000h,002h	; abe1  ................
	defb 005h,08bh,000h,0e4h,000h,091h,000h,0f0h,000h,097h,000h,0fch,000h,09dh,000h,008h	; abf1  ................
	defb 001h,0a3h,000h,014h,001h,0a9h,000h,020h,001h,0afh,000h,02ch,001h,0b5h,000h,038h	; ac01  ....... ...,...8
	defb 001h,0bbh,000h,044h,001h,0c1h,000h,050h,001h	; ac11  ...D...P.

; ======================================================================
; CODIGO 0xac1a..0xb071  (1111 bytes)
; ======================================================================


L_AC1A:
	ld hl,0d6dch		;ac1a   ; apunta a el equipo del jugador en PENNANT (bit 0)
	inc (hl)			;ac1d
	call L_AC81		;ac1e
	ld a,(0d6e1h)		;ac21
	dec a			;ac24
	call z,L_AC31		;ac25
	call L_ACF7		;ac28
	call L_AD2A		;ac2b
	jp L_ADFA		;ac2e
L_AC31:
	ld hl,0d710h		;ac31
	call L_AC7A		;ac34
	push hl			;ac37
	ld hl,0d712h		;ac38
	call L_AC7A		;ac3b
	pop hl			;ac3e
	cp (hl)			;ac3f
	jr nz,L_AC4C		;ac40
	ld a,r		;ac42
	and 001h		;ac44
	jr nz,L_AC4B		;ac46
	ld hl,0d712h		;ac48
L_AC4B:
	inc (hl)			;ac4b
L_AC4C:
	ld hl,0d714h		;ac4c
	call L_AC7A		;ac4f
	push hl			;ac52
	ld hl,0d716h		;ac53
	call L_AC7A		;ac56
	pop hl			;ac59
	cp (hl)			;ac5a
	jr nz,L_AC67		;ac5b
	ld a,r		;ac5d
	and 001h		;ac5f
	jr nz,L_AC66		;ac61
	ld hl,0d716h		;ac63
L_AC66:
	inc (hl)			;ac66
L_AC67:
	ld hl,0d710h		;ac67
	ld b,004h		;ac6a
L_AC6C:
	push bc			;ac6c
	ld a,(hl)			;ac6d
	and 00fh		;ac6e
	call 0646dh		;ac70
	ld (hl),a			;ac73
	inc hl			;ac74
	inc hl			;ac75
	pop bc			;ac76
	djnz L_AC6C		;ac77
	ret			;ac79
L_AC7A:
	call L_AD8A		;ac7a
	and 00fh		;ac7d
	ld (hl),a			;ac7f
	ret			;ac80
L_AC81:
	ld a,(0d6e1h)		;ac81
	dec a			;ac84
	jr nz,L_ACBB		;ac85
	ld d,000h		;ac87
	ld a,(0d711h)		;ac89
	dec a			;ac8c
	ld e,a			;ac8d
	ld hl,0d70ah		;ac8e
	add hl,de			;ac91
	ld b,(hl)			;ac92
	ld a,(0d713h)		;ac93
	dec a			;ac96
	ld e,a			;ac97
	ld hl,0d70ah		;ac98
	add hl,de			;ac9b
	ld l,(hl)			;ac9c
	ld h,b			;ac9d
	call L_ACD2		;ac9e
	ld d,000h		;aca1
	ld a,(0d715h)		;aca3
	dec a			;aca6
	ld e,a			;aca7
	ld hl,0d70ah		;aca8
	add hl,de			;acab
	ld b,(hl)			;acac
	ld a,(0d717h)		;acad
	dec a			;acb0
	ld e,a			;acb1
	ld hl,0d70ah		;acb2
	add hl,de			;acb5
	ld l,(hl)			;acb6
	ld h,b			;acb7
	call L_ACD2		;acb8
L_ACBB:
	ld d,000h		;acbb
	ld a,(0e195h)		;acbd
	dec a			;acc0
	ld e,a			;acc1
	ld hl,0d70ah		;acc2
	add hl,de			;acc5
	ld b,(hl)			;acc6
	ld a,(0e197h)		;acc7
	dec a			;acca
	ld e,a			;accb
	ld hl,0d70ah		;accc
	add hl,de			;accf
	ld l,(hl)			;acd0
	ld h,b			;acd1
L_ACD2:
	push hl			;acd2
	call L_ACDA		;acd3
	pop hl			;acd6
	ld a,l			;acd7
	ld l,h			;acd8
	ld h,a			;acd9
L_ACDA:
	push hl			;acda
	ld a,l			;acdb
	call 065fbh		;acdc
	ld l,c			;acdf
	ld h,000h		;ace0
	add hl,hl			;ace2
	ld d,h			;ace3
	ld e,l			;ace4
	add hl,hl			;ace5
	add hl,de			;ace6
	ld bc,0d6e3h		;ace7
	add hl,bc			;acea
	pop de			;aceb
	ld a,d			;acec
	push hl			;aced
	call 065fbh		;acee
	pop hl			;acf1
	ld b,000h		;acf2
	add hl,bc			;acf4
	inc (hl)			;acf5
	ret			;acf6
L_ACF7:
	ld a,(0d6e1h)		;acf7
	dec a			;acfa
	jr nz,L_AD09		;acfb
	ld hl,0d710h		;acfd
	call L_AD0C		;ad00
	ld hl,0d714h		;ad03
	call L_AD0C		;ad06
L_AD09:
	ld hl,0e194h		;ad09   ; apunta a las carreras del visitante (BCD; 0x99 acaba el partido)
L_AD0C:
	ld a,(hl)			;ad0c
	inc hl			;ad0d
	ld b,(hl)			;ad0e
	inc hl			;ad0f
	ld c,(hl)			;ad10
	inc hl			;ad11
	ld d,(hl)			;ad12
	cp c			;ad13
	ld a,b			;ad14
	ld b,d			;ad15
	jr nc,L_AD1A		;ad16
	ld b,a			;ad18
	ld a,d			;ad19
L_AD1A:
	push bc			;ad1a
	call L_AD75		;ad1b
	call L_AD98		;ad1e
	pop bc			;ad21
	ld a,b			;ad22
	call L_AD75		;ad23
	inc hl			;ad26
	inc hl			;ad27
	jr L_AD98		;ad28
L_AD2A:
	ld hl,0d68bh		;ad2a
	ld de,0d730h		;ad2d
	call 06b5bh		;ad30
	ld c,001h		;ad33
L_AD35:
	push bc			;ad35
	ld a,c			;ad36
	ld (de),a			;ad37
	inc de			;ad38
	call L_ADD0		;ad39
	ld (de),a			;ad3c
	inc de			;ad3d
	ld a,00fh		;ad3e
	call 04216h		;ad40   ; hl_mas_a: HL = HL + A
	pop bc			;ad43
	inc c			;ad44
	djnz L_AD35		;ad45
	call 06b5bh		;ad47
	dec b			;ad4a
	ld de,0d731h		;ad4b
L_AD4E:
	ld h,d			;ad4e
	ld l,e			;ad4f
	ld a,(de)			;ad50
	push bc			;ad51
L_AD52:
	inc hl			;ad52
	inc hl			;ad53
	cp (hl)			;ad54
	jp p,L_AD67		;ad55
	jr z,L_AD67		;ad58
	push bc			;ad5a
	dec de			;ad5b
	dec hl			;ad5c
	call L_AD6F		;ad5d
	inc de			;ad60
	inc hl			;ad61
	call L_AD6F		;ad62
	ld a,c			;ad65
	pop bc			;ad66
L_AD67:
	djnz L_AD52		;ad67
	pop bc			;ad69
	inc de			;ad6a
	inc de			;ad6b
	djnz L_AD4E		;ad6c
	ret			;ad6e
L_AD6F:
	ld c,(hl)			;ad6f
	ld a,(de)			;ad70
	ld (hl),a			;ad71
	ld a,c			;ad72
	ld (de),a			;ad73
	ret			;ad74
L_AD75:
	call L_AD7D		;ad75
	ld a,00bh		;ad78
	jp 04216h		;ad7a   ; hl_mas_a: HL = HL + A
L_AD7D:
	dec a			;ad7d
	ld hl,0d680h		;ad7e
	ld b,a			;ad81
	add a,a			;ad82
	add a,a			;ad83
	add a,a			;ad84
	add a,a			;ad85
	sub b			;ad86
	jp 04216h		;ad87   ; hl_mas_a: HL = HL + A
L_AD8A:
	ld a,r		;ad8a
	ld c,a			;ad8c
	add a,a			;ad8d
	add a,c			;ad8e
	ld c,a			;ad8f
	ld a,(0d6e0h)		;ad90
	add a,c			;ad93
	ld (0d6e0h),a		;ad94
	ret			;ad97
L_AD98:
	ld d,h			;ad98
	ld e,l			;ad99
	inc de			;ad9a
	ld a,(de)			;ad9b
	add a,001h		;ad9c
	daa			;ad9e
	jr nc,L_ADA2		;ad9f
	inc (hl)			;ada1
L_ADA2:
	ld (de),a			;ada2
	ret			;ada3
L_ADA4:
	ld hl,0e37ah		;ada4
	ld (hl),000h		;ada7
	dec hl			;ada9
	ld (hl),000h		;adaa
L_ADAC:
	cp 064h		;adac
	jr c,L_ADB5		;adae
	sub 064h		;adb0
	inc (hl)			;adb2
	jr L_ADAC		;adb3
L_ADB5:
	ld b,00ah		;adb5
	ld c,000h		;adb7
L_ADB9:
	inc c			;adb9
	sub b			;adba
	jr z,L_ADC3		;adbb
	jp p,L_ADB9		;adbd
	dec c			;adc0
	add a,00ah		;adc1
L_ADC3:
	sla c		;adc3
	sla c		;adc5
	sla c		;adc7
	sla c		;adc9
	add a,c			;adcb
	inc hl			;adcc
	ld (hl),a			;adcd
	dec hl			;adce
	ret			;adcf
L_ADD0:
	inc hl			;add0
	ld a,(hl)			;add1
	push af			;add2
	sub a			;add3
	rld		;add4
	add a,a			;add6
	ld b,a			;add7
	add a,a			;add8
	add a,a			;add9
	add a,b			;adda
	ld b,a			;addb
	sub a			;addc
	rld		;addd
	add a,b			;addf
	ld b,a			;ade0
	pop af			;ade1
	ld (hl),a			;ade2
	dec hl			;ade3
	ld a,(hl)			;ade4
	or a			;ade5
	ld a,b			;ade6
	ret z			;ade7
	add a,064h		;ade8
	ret			;adea
L_ADEB:
	ld b,00ah		;adeb
L_ADED:
	call 09834h		;aded
	inc hl			;adf0
	call 04f1ch		;adf1   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	call 04f6fh		;adf4   ; siguiente_columna: D += 8; si da la vuelta, E += 8
	djnz L_ADED		;adf7
	ret			;adf9
L_ADFA:
	call 04b9fh		;adfa   ; borra_pantalla: esconde los sprites, apaga la pantalla, rellena la VRAM de 0, R#23 = 0 y la enciende
	ld a,00eh		;adfd
	ld de,0781ch		;adff
	call 04f1ch		;ae02   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld a,(0d6e1h)		;ae05
	dec a			;ae08
	jr nz,L_AE1B		;ae09
	ld a,00eh		;ae0b
	ld de,07828h		;ae0d
	call 04f1ch		;ae10   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld a,00eh		;ae13
	ld de,07834h		;ae15
	call 04f1ch		;ae18   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
L_AE1B:
	ld de,0046ch		;ae1b
	call 06b5bh		;ae1e
	ld c,002h		;ae21
L_AE23:
	ld a,c			;ae23
	push bc			;ae24
	push de			;ae25
	call 04f1ch		;ae26   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	pop de			;ae29
	ld a,e			;ae2a
	add a,00ch		;ae2b
	ld e,a			;ae2d
	pop bc			;ae2e
	inc c			;ae2f
	djnz L_AE23		;ae30
	ld de,0e878h		;ae32
	call 06b5bh		;ae35
	dec b			;ae38
	ld a,090h		;ae39
	call L_AE9E		;ae3b
	ld de,0ec78h		;ae3e
	call 06b5bh		;ae41
	dec b			;ae44
	ld a,001h		;ae45
	call L_AE9E		;ae47
	ld de,L_AC6C		;ae4a
	call 06b5bh		;ae4d
	ld a,090h		;ae50
	call L_AE9E		;ae52
	ld hl,0b0a6h		;ae55
	call 04ea6h		;ae58   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld hl,0b071h		;ae5b
	call 04ea6h		;ae5e   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld hl,0b07bh		;ae61
	call 04ea6h		;ae64   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld hl,0b081h		;ae67
	call 04ea6h		;ae6a   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld hl,0b089h		;ae6d
	call 04ea6h		;ae70   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld hl,0b08fh		;ae73
	call 04ea6h		;ae76   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld hl,0b094h		;ae79
	call 04ea6h		;ae7c   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld hl,0b099h		;ae7f
	call 04ea6h		;ae82   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld hl,0b09eh		;ae85
	call 04ea6h		;ae88   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	call L_AEAE		;ae8b
	ld a,(0d6e1h)		;ae8e
	dec a			;ae91
	jp nz,L_AF2C		;ae92
	call L_AED6		;ae95
	call L_AEFE		;ae98
	jp L_AF2C		;ae9b
L_AE9E:
	push af			;ae9e
	push bc			;ae9f
	push de			;aea0
	call 04f1ch		;aea1   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	pop de			;aea4
	pop bc			;aea5
	ld a,e			;aea6
	add a,00ch		;aea7
	ld e,a			;aea9
	pop af			;aeaa
	djnz L_AE9E		;aeab
	ret			;aead
L_AEAE:
	ld a,(0e195h)		;aeae
	ld de,0081ch		;aeb1
	call L_AF26		;aeb4
	ld hl,0e194h		;aeb7   ; apunta a las carreras del visitante (BCD; 0x99 acaba el partido)
	ld de,0601ch		;aeba
	ld b,001h		;aebd
	call 05bf1h		;aebf   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
	ld a,(0e197h)		;aec2
	ld de,0a01ch		;aec5
	call L_AF26		;aec8
	ld hl,0e196h		;aecb   ; apunta a las carreras del local (BCD; 0x99 acaba el partido)
	ld de,0881ch		;aece
	ld b,001h		;aed1
	jp 05bf1h		;aed3   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
L_AED6:
	ld a,(0d711h)		;aed6
	ld de,00828h		;aed9
	call L_AF26		;aedc
	ld hl,0d710h		;aedf
	ld de,06028h		;aee2
	ld b,001h		;aee5
	call 05bf1h		;aee7   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
	ld a,(0d713h)		;aeea
	ld de,0a028h		;aeed
	call L_AF26		;aef0
	ld hl,0d712h		;aef3
	ld de,08828h		;aef6
	ld b,001h		;aef9
	jp 05bf1h		;aefb   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
L_AEFE:
	ld a,(0d715h)		;aefe
	ld de,00834h		;af01
	call L_AF26		;af04
	ld hl,0d714h		;af07
	ld de,06034h		;af0a
	ld b,001h		;af0d
	call 05bf1h		;af0f   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
	ld a,(0d717h)		;af12
	ld de,0a034h		;af15
	call L_AF26		;af18
	ld hl,0d716h		;af1b
	ld de,08834h		;af1e
	ld b,001h		;af21
	jp 05bf1h		;af23   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
L_AF26:
	call L_AD7D		;af26
	jp L_ADEB		;af29
L_AF2C:
	ld hl,0d730h		;af2c
	ld a,(hl)			;af2f
	call L_AD75		;af30
	call L_ADD0		;af33
	ld (0e371h),a		;af36
	ld a,06ch		;af39
	ld (0e372h),a		;af3b
	call 06b5bh		;af3e
	ld hl,0d72eh		;af41
	ld (0e373h),hl		;af44
L_AF47:
	ld hl,(0e373h)		;af47
	inc hl			;af4a
	inc hl			;af4b
	ld (0e373h),hl		;af4c
	push bc			;af4f
	call L_AF7D		;af50
	call L_AFA8		;af53
	call L_AFBD		;af56
	call L_B034		;af59
	call L_AF6B		;af5c
	pop bc			;af5f
	ld a,(0e372h)		;af60
	add a,00ch		;af63
	ld (0e372h),a		;af65
	djnz L_AF47		;af68
	ret			;af6a
L_AF6B:
	ld hl,(0e373h)		;af6b
	ld a,(hl)			;af6e
	call L_AD7D		;af6f
	ld a,(0e372h)		;af72
	ld e,a			;af75
	ld d,010h		;af76
	ld b,006h		;af78
	jp L_ADED		;af7a
L_AF7D:
	ld e,(hl)			;af7d
	dec e			;af7e
	ld d,000h		;af7f
	ld hl,0d70ah		;af81
	add hl,de			;af84
	ld a,(hl)			;af85
	call 065fbh		;af86
	ld l,c			;af89
	ld h,000h		;af8a
	add hl,hl			;af8c
	ld d,h			;af8d
	ld e,l			;af8e
	add hl,hl			;af8f
	add hl,de			;af90
	ex de,hl			;af91
	ld hl,0d6e3h		;af92
	add hl,de			;af95
	xor a			;af96
	ld b,006h		;af97
L_AF99:
	add a,(hl)			;af99
	inc hl			;af9a
	djnz L_AF99		;af9b
	ld (0e375h),a		;af9d
	call L_ADA4		;afa0
	ld d,044h		;afa3
	jp L_B061		;afa5
L_AFA8:
	ld hl,(0e373h)		;afa8
	ld a,(hl)			;afab
	call L_AD75		;afac
	push hl			;afaf
	ld d,064h		;afb0
	call L_B061		;afb2
	pop hl			;afb5
	inc hl			;afb6
	inc hl			;afb7
	ld d,084h		;afb8
	jp L_B061		;afba
L_AFBD:
	ld hl,(0e373h)		;afbd
	ld a,(hl)			;afc0
	call L_AD75		;afc1
	call L_ADD0		;afc4
	ld hl,0e375h		;afc7
	ld e,(hl)			;afca
	ld d,000h		;afcb
	ld l,a			;afcd
	ld h,d			;afce
	exx			;afcf
	ld bc,00002h		;afd0
	ld hl,0e360h		;afd3
	ld de,0e361h		;afd6
	ld (hl),000h		;afd9
	ldir		;afdb
	ld hl,0e360h		;afdd
	exx			;afe0
	ld a,l			;afe1
	or a			;afe2
	jr z,L_B020		;afe3
	ld b,004h		;afe5
L_AFE7:
	ld c,0ffh		;afe7
	and a			;afe9
L_AFEA:
	inc c			;afea
	sbc hl,de		;afeb
	jr z,L_B008		;afed
	jr nc,L_AFEA		;afef
	add hl,de			;aff1
	ld a,b			;aff2
	cp 004h		;aff3
	jr z,L_AFFC		;aff5
	ld a,c			;aff7
	exx			;aff8
	ld (hl),a			;aff9
	inc hl			;affa
	exx			;affb
L_AFFC:
	push de			;affc
	add hl,hl			;affd
	ld d,h			;affe
	ld e,l			;afff
	add hl,hl			;b000
	add hl,hl			;b001
	add hl,de			;b002
	pop de			;b003
	djnz L_AFE7		;b004
	jr L_B012		;b006
L_B008:
	ld a,004h		;b008
	cp b			;b00a
	jr z,L_B027		;b00b
	inc c			;b00d
	ld a,c			;b00e
	exx			;b00f
	ld (hl),a			;b010
	exx			;b011
L_B012:
	ld hl,0e361h		;b012
	ld a,(hl)			;b015
	rla			;b016
	rla			;b017
	rla			;b018
	rla			;b019
	and 0f0h		;b01a
	inc hl			;b01c
	add a,(hl)			;b01d
	dec hl			;b01e
	ld (hl),a			;b01f
L_B020:
	ld hl,0e360h		;b020
	ld d,0b0h		;b023
	jr L_B068		;b025
L_B027:
	ld a,(0e372h)		;b027
	ld e,a			;b02a
	ld d,0a4h		;b02b
	ld a,002h		;b02d
	call 04f1ch		;b02f   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	jr L_B020		;b032
L_B034:
	ld hl,00000h		;b034
	ld (0e377h),hl		;b037
	ld hl,(0e373h)		;b03a
	ld a,(hl)			;b03d
	call L_AD75		;b03e
	call L_ADD0		;b041
	ld b,a			;b044
	ld a,(0e371h)		;b045
	sub b			;b048
	cp 064h		;b049
	ld hl,0e377h		;b04b
	jr c,L_B053		;b04e
	inc (hl)			;b050
	sub 064h		;b051
L_B053:
	inc hl			;b053
	call 0646dh		;b054
	ld (hl),a			;b057
	ld d,0d0h		;b058
	dec hl			;b05a
	ld a,(0e372h)		;b05b
	cp 06ch		;b05e
	ret z			;b060
L_B061:
	ld a,(0e372h)		;b061
	ld e,a			;b064
	jp 05c56h		;b065
L_B068:
	ld a,(0e372h)		;b068
	ld e,a			;b06b
	ld b,003h		;b06c
	jp 05c34h		;b06e

; ----------------------------------------------------------------------
; DATOS texto_B071: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p15:AE5E (10 bytes)
;   0xb071..0xb07b  (10 bytes)
DATA_texto_B071:
	defb 060h,008h,0a0h,000h,0a1h,000h,0a2h,000h,0a3h,0ffh	; b071  `.........

; ----------------------------------------------------------------------
; DATOS texto_B07B: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p15:AE64 (6 bytes)
;   0xb07b..0xb081  (6 bytes)
DATA_texto_B07B:
	defb 044h,060h,0a0h,0a1h,081h,0ffh	; b07b

; ----------------------------------------------------------------------
; DATOS texto_B081: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p15:AE6A (8 bytes)
;   0xb081..0xb089  (8 bytes)
DATA_texto_B081:
	defb 068h,050h,0a7h,000h,0a8h,000h,0a9h,0ffh	; b081  hP......

; ----------------------------------------------------------------------
; DATOS texto_B089: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p15:AE70 (6 bytes)
;   0xb089..0xb08f  (6 bytes)
DATA_texto_B089:
	defb 018h,060h,064h,00eh,06dh,0ffh	; b089

; ----------------------------------------------------------------------
; DATOS texto_B08F: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p15:AE76 (5 bytes)
;   0xb08f..0xb094  (5 bytes)
DATA_texto_B08F:
	defb 06ch,060h,0a4h,081h,0ffh	; b08f

; ----------------------------------------------------------------------
; DATOS texto_B094: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p15:AE7C (5 bytes)
;   0xb094..0xb099  (5 bytes)
DATA_texto_B094:
	defb 08ch,060h,0a5h,081h,0ffh	; b094

; ----------------------------------------------------------------------
; DATOS texto_B099: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p15:AE82 (5 bytes)
;   0xb099..0xb09e  (5 bytes)
DATA_texto_B099:
	defb 0b0h,060h,0a4h,08fh,0ffh	; b099

; ----------------------------------------------------------------------
; DATOS texto_B09E: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p15:AE88 (8 bytes)
;   0xb09e..0xb0a6  (8 bytes)
DATA_texto_B09E:
	defb 0d0h,060h,06ch,00ch,00eh,06dh,0a6h,0ffh	; b09e  .`l..m..

; ----------------------------------------------------------------------
; DATOS texto_B0A6: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p15:AE58 (6 bytes)
;   0xb0a6..0xb0ac  (6 bytes)
DATA_texto_B0A6:
	defb 0d8h,06ch,00eh,00eh,00eh,0ffh	; b0a6

; ======================================================================
; CODIGO 0xb0ac..0xb20d  (353 bytes)
; ======================================================================


L_B0AC:
	call L_B0B4		;b0ac
	xor a			;b0af
	ld (0ed0dh),a		;b0b0
	ret			;b0b3
L_B0B4:
	ld a,(0e33bh)		;b0b4   ; lee lo que acaba la jugada: 1 home run, 2 jugada anulada
	or a			;b0b7
	ret nz			;b0b8
	ld a,(0ed0dh)		;b0b9
	or a			;b0bc
	ret z			;b0bd
	ld a,(0e1a6h)		;b0be
	or a			;b0c1
	jr z,L_B0DE		;b0c2
	dec a			;b0c4
	jr z,L_B0E3		;b0c5
	ld de,02830h		;b0c7
L_B0CA:
	call L_B140		;b0ca
L_B0CD:
	ld a,(0ed0dh)		;b0cd
	bit 7,a		;b0d0
	ld a,001h		;b0d2
	jr z,L_B14E		;b0d4
	xor a			;b0d6
	jr L_B14E		;b0d7
L_B0D9:
	call L_B121		;b0d9
	jr L_B0CD		;b0dc
L_B0DE:
	ld de,0c830h		;b0de
	jr L_B0CA		;b0e1
L_B0E3:
	ld de,00830h		;b0e3
	ld a,(0e218h)		;b0e6   ; lee la x de la pelota
	cp 0c0h		;b0e9
	jr nc,L_B0CA		;b0eb
	ld de,0e830h		;b0ed
	cp 080h		;b0f0
	jr nc,L_B0CA		;b0f2
	ld hl,(0e213h)		;b0f4   ; lee la y de la pelota (vertical) y el byte siguiente (16 bits)
	ld bc,0feb0h		;b0f7
	add hl,bc			;b0fa
	jr nc,L_B0D9		;b0fb
	ld hl,(0e1a2h)		;b0fd   ; lee el desplazamiento de la pantalla, 16 bits (en TEAM EDIT, la fila elegida)
	ld de,0ff30h		;b100
	add hl,de			;b103
	ret nc			;b104
	ld de,07898h		;b105
	call L_B13C		;b108
	ld hl,(0e213h)		;b10b   ; lee la y de la pelota (vertical) y el byte siguiente (16 bits)
	ld bc,0fe70h		;b10e
	add hl,bc			;b111
	jr c,L_B0CD		;b112
	ld a,(0ed0dh)		;b114
	bit 7,a		;b117
	ld a,002h		;b119
	jr nz,L_B14E		;b11b
	ld a,003h		;b11d
	jr L_B14E		;b11f
L_B121:
	ld de,068f8h		;b121
	push de			;b124
	push de			;b125
	ex de,hl			;b126
	call L_B132		;b127
	pop hl			;b12a
	ld l,000h		;b12b
	call L_B132		;b12d
	pop de			;b130
	ret			;b131
L_B132:
	ld a,055h		;b132
	ld bc,01008h		;b134
	ld d,000h		;b137
	jp 04d2ah		;b139   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
L_B13C:
	ld a,044h		;b13c
	jr L_B142		;b13e
L_B140:
	ld a,055h		;b140
L_B142:
	push de			;b142
	ex de,hl			;b143
	ld bc,01010h		;b144
	ld d,000h		;b147
	call 04d2ah		;b149   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
	pop de			;b14c
	ret			;b14d
L_B14E:
	add a,a			;b14e
	add a,a			;b14f
	ld hl,0b20dh		;b150
	call 04216h		;b153   ; hl_mas_a: HL = HL + A
	jr L_B1C1		;b156
L_B158:
	ld a,(0e33bh)		;b158   ; lee lo que acaba la jugada: 1 home run, 2 jugada anulada
	or a			;b15b
	ret nz			;b15c
	ld a,(0ed08h)		;b15d
	rra			;b160
	ret c			;b161
	ld hl,0ed2ah		;b162
	ld a,(hl)			;b165
	or a			;b166
	ret nz			;b167
	ld a,(0eddfh)		;b168
	rra			;b16b
	ret nc			;b16c
	ld (hl),001h		;b16d
	call L_B1D8		;b16f
	ret nc			;b172
	ld hl,(0e1a2h)		;b173   ; lee el desplazamiento de la pantalla, 16 bits (en TEAM EDIT, la fila elegida)
	ld de,0ffa0h		;b176
	add hl,de			;b179
	ret nc			;b17a
	ld a,(0e1a6h)		;b17b
	or a			;b17e
	jr z,L_B193		;b17f
	dec a			;b181
	jr z,L_B1A2		;b182
	ld de,0a028h		;b184
	ld a,(0eddeh)		;b187   ; lee la jugada anulada (foul)
	rra			;b18a
	ld a,005h		;b18b
	jr nc,L_B14E		;b18d
	ld a,007h		;b18f
	jr L_B14E		;b191
L_B193:
	ld de,04828h		;b193
	ld a,(0eddeh)		;b196   ; lee la jugada anulada (foul)
	rra			;b199
	ld a,006h		;b19a
	jr nc,L_B14E		;b19c
	ld a,007h		;b19e
	jr L_B14E		;b1a0
L_B1A2:
	ld hl,(0e213h)		;b1a2   ; lee la y de la pelota (vertical) y el byte siguiente (16 bits)
	ld de,0feb0h		;b1a5
	add hl,de			;b1a8
	ret nc			;b1a9
	ld a,(0eddeh)		;b1aa   ; lee la jugada anulada (foul)
	rra			;b1ad
	ret nc			;b1ae
	ld de,07898h		;b1af
	ld hl,(0e213h)		;b1b2   ; lee la y de la pelota (vertical) y el byte siguiente (16 bits)
	ld bc,0fe70h		;b1b5
	add hl,bc			;b1b8
	ld a,007h		;b1b9
	jr c,L_B14E		;b1bb
	ld a,004h		;b1bd
	jr L_B14E		;b1bf
L_B1C1:
	push de			;b1c1
	call L_B1CA		;b1c2
	pop de			;b1c5
	ld a,e			;b1c6
	add a,008h		;b1c7
	ld e,a			;b1c9
L_B1CA:
	ld a,(hl)			;b1ca
	inc hl			;b1cb
	call L_B22D		;b1cc
	ld a,d			;b1cf
	add a,008h		;b1d0
	ld d,a			;b1d2
	ld a,(hl)			;b1d3
	inc hl			;b1d4
	jp L_B22D		;b1d5
L_B1D8:
	ld de,(0e221h)		;b1d8
	ld bc,(0e223h)		;b1dc
	ld a,b			;b1e0
	or a			;b1e1
	jr z,L_B1F5		;b1e2
	dec a			;b1e4
	jr nz,L_B1EC		;b1e5
	ld a,c			;b1e7
	cp 040h		;b1e8
	jr c,L_B1F5		;b1ea
L_B1EC:
	call L_B201		;b1ec
	add hl,de			;b1ef
	ld de,0fd80h		;b1f0
	add hl,de			;b1f3
	ret			;b1f4
L_B1F5:
	call L_B201		;b1f5
	ex de,hl			;b1f8
	or a			;b1f9
	sbc hl,de		;b1fa
	ld de,0ff60h		;b1fc
	add hl,de			;b1ff
	ret			;b200
L_B201:
	srl b		;b201
	rr c		;b203
	push bc			;b205
	srl b		;b206
	rr c		;b208
	pop hl			;b20a
	add hl,bc			;b20b
	ret			;b20c

; ----------------------------------------------------------------------
; DATOS resto_B20D: lo apuntan con el banco puesto p15:B150 (0xB20D); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p15:B150 (32 bytes)
;   0xb20d..0xb22d  (32 bytes)
DATA_resto_B20D:
	defb 0e5h,0e6h,0fch,0e7h,0e8h,0e9h,0eah,0fbh,0ebh,0ech,0edh,0eeh,0efh,0f0h,0e0h,0e1h	; b20d  ................
	defb 0f7h,0f8h,0e2h,0e3h,0f1h,0f2h,0fdh,0e4h,0f1h,0f2h,0fah,0f3h,0f4h,0f5h,0f9h,0f6h	; b21d  ................

; ======================================================================
; CODIGO 0xb22d..0xb23f  (18 bytes)
; ======================================================================


L_B22D:
	push bc			;b22d
	push hl			;b22e
	push de			;b22f
	call 04f5ah		;b230
	ld bc,00808h		;b233
	ld a,048h		;b236
	call 04dfbh		;b238   ; copia_logica: orden LMMM (0x90 + operacion) del VDP: copia el rectangulo HL a DE, BC de tamano; las paginas en los bits 4-7 de A' y la operacion logica en los 0-3
	pop de			;b23b
	pop hl			;b23c
	pop bc			;b23d
	ret			;b23e

; ----------------------------------------------------------------------
; DATOS copia16_B23F: 16 bytes que p00:5DA1 copia (BC = 0x10) con 13-14-15
;   puesto a 0xE231 / 0xE241; lo leen p03:B518 (16 bytes)
;   0xb23f..0xb24f  (16 bytes)
DATA_copia16_B23F:
	defb 0f1h,000h,000h,001h,063h,000h,000h,038h,001h,05eh,0ffh,043h,0a8h,004h,040h,0c4h	; b23f  ....c..8.^.C..@.

; ----------------------------------------------------------------------
; DATOS copia16_B24F: 16 bytes que p00:5DA1 copia (BC = 0x10) con 13-14-15
;   puesto a 0xE231 / 0xE241; lo leen p03:B510 (16 bytes)
;   0xb24f..0xb25f  (16 bytes)
DATA_copia16_B24F:
	defb 0f1h,000h,040h,001h,063h,000h,000h,0c4h,000h,0a2h,000h,044h,000h,002h,088h,038h	; b24f  ..@.c......D...8

; ======================================================================
; CODIGO 0xb25f..0xb5ed  (910 bytes)
; ======================================================================


L_B25F:
	xor a			;b25f
	ld (0ed9dh),a		;b260
	ld (0ece6h),a		;b263   ; guarda el paso de la defensa del ordenador
	ld (0ed82h),a		;b266
	ld (0ed0dh),a		;b269
	ld (0ed2ah),a		;b26c
	ld (0ed35h),a		;b26f
	ld (0ed50h),a		;b272
	ld (0ed02h),a		;b275
	ld (0edd5h),a		;b278
	ld (0ed7bh),a		;b27b
	ld (0edd3h),a		;b27e
	ld (0e1b8h),a		;b281
	ld hl,0e271h		;b284   ; apunta a las 9 fichas de 16 bytes de los defensores
	ld de,0e272h		;b287
	ld bc,0008fh		;b28a
	ld (hl),000h		;b28d
	ldir		;b28f
	ld hl,0e23ch		;b291
	ld de,00010h		;b294
	ld b,004h		;b297
L_B299:
	res 4,(hl)		;b299
	add hl,de			;b29b
	djnz L_B299		;b29c
	ld hl,0e27dh		;b29e
	ld de,00010h		;b2a1
	ld b,009h		;b2a4
L_B2A6:
	ld (hl),068h		;b2a6
	add hl,de			;b2a8
	djnz L_B2A6		;b2a9
	ld a,0f8h		;b2ab
	ld (0e2edh),a		;b2ad
	ld a,(0ecebh)		;b2b0
	or a			;b2b3
	call nz,L_B623		;b2b4
	ld hl,0e271h		;b2b7   ; apunta a las 9 fichas de 16 bytes de los defensores
	ld de,0b5edh		;b2ba
	ld b,009h		;b2bd
L_B2BF:
	ld (hl),b			;b2bf
	inc hl			;b2c0
	inc hl			;b2c1
	ld a,(de)			;b2c2
	inc de			;b2c3
	ld (hl),a			;b2c4
	inc hl			;b2c5
	ld a,(de)			;b2c6
	inc de			;b2c7
	ld (hl),a			;b2c8
	inc hl			;b2c9
	inc hl			;b2ca
	inc hl			;b2cb
	inc hl			;b2cc
	ld a,(de)			;b2cd
	inc de			;b2ce
	ld (hl),a			;b2cf
	inc hl			;b2d0
	ld a,(de)			;b2d1
	inc de			;b2d2
	ld (hl),a			;b2d3
	ld a,008h		;b2d4
	call 04216h		;b2d6   ; hl_mas_a: HL = HL + A
	djnz L_B2BF		;b2d9
	ld a,(0ed3fh)		;b2db
	or a			;b2de
	jr nz,L_B2F9		;b2df
	ld a,(0ecebh)		;b2e1
	or a			;b2e4
	jr nz,L_B2EE		;b2e5
	call L_B53B		;b2e7
	call L_B308		;b2ea
	ret			;b2ed
L_B2EE:
	ld a,(0edddh)		;b2ee
	or a			;b2f1
	jr z,L_B2F9		;b2f2
	call L_B623		;b2f4
	jr L_B2FC		;b2f7
L_B2F9:
	call L_B611		;b2f9
L_B2FC:
	call L_B4C6		;b2fc
	call L_B367		;b2ff
	call L_B480		;b302
	jp L_B3CB		;b305
L_B308:
	ld de,(0e215h)		;b308   ; lee la velocidad y de la pelota y el byte siguiente (16 bits)
	ld hl,(0e21ah)		;b30c   ; lee la velocidad x de la pelota y el byte siguiente (16 bits)
	ld a,d			;b30f
	rla			;b310
	jr nc,L_B31B		;b311
	call L_B58B		;b313
	call L_B3EA		;b316
	jr L_B329		;b319
L_B31B:
	ld a,007h		;b31b
	ld (0ed9dh),a		;b31d
	call L_B45D		;b320
	call L_B480		;b323
	call L_B4C6		;b326
L_B329:
	ld hl,0ed9dh		;b329
	ld a,(0e21bh)		;b32c
	rla			;b32f
	ld a,001h		;b330
	jr c,L_B396		;b332
	ld a,000h		;b334
	or (hl)			;b336
	ld (hl),a			;b337
L_B338:
	ld hl,00104h		;b338
	ld (0e2a3h),hl		;b33b
	ld hl,0011ch		;b33e
	ld (0e2a8h),hl		;b341
	ld de,0245ch		;b344
	ld hl,0781fh		;b347
	ld a,020h		;b34a
	call 040d2h		;b34c
	ld (0e2a5h),hl		;b34f
	ld (0e2aah),de		;b352
	ld a,016h		;b356
	ld (0e2a1h),a		;b358
	ld a,031h		;b35b
	ld (0e2aeh),a		;b35d
	ld hl,037ffh		;b360
	ld (0e2afh),hl		;b363
	ret			;b366
L_B367:
	ld hl,00104h		;b367
	ld (0e2a3h),hl		;b36a
	ld hl,00128h		;b36d
	ld (0e2a8h),hl		;b370
	ld de,0245ch		;b373
	ld hl,0781fh		;b376
	ld a,020h		;b379
	call 040d2h		;b37b
	ld (0e2a5h),hl		;b37e
	ld (0e2aah),de		;b381
	ld a,016h		;b385
	ld (0e2a1h),a		;b387
	ld a,031h		;b38a
	ld (0e2aeh),a		;b38c
	ld hl,037ffh		;b38f
	ld (0e2afh),hl		;b392
	ret			;b395
L_B396:
	bit 2,(hl)		;b396
	jr nz,L_B39C		;b398
	or (hl)			;b39a
	ld (hl),a			;b39b
L_B39C:
	ld hl,00104h		;b39c
	ld (0e2c3h),hl		;b39f
	ld hl,00164h		;b3a2
	ld (0e2c8h),hl		;b3a5
	ld de,0c030h		;b3a8
	ld hl,0781fh		;b3ab
	ld a,020h		;b3ae
	call 040d2h		;b3b0
	ld (0e2c5h),hl		;b3b3
	ld (0e2cah),de		;b3b6
	ld a,014h		;b3ba
	ld (0e2c1h),a		;b3bc
	ld a,031h		;b3bf
	ld (0e2ceh),a		;b3c1
	ld hl,037ffh		;b3c4
	ld (0e2cfh),hl		;b3c7
	ret			;b3ca
L_B3CB:
	ld hl,00188h		;b3cb
	ld (0e2e3h),hl		;b3ce
	ld hl,00137h		;b3d1
	ld (0e2e8h),hl		;b3d4
	ld de,078b8h		;b3d7
	ld a,022h		;b3da
	ld (0e2e1h),a		;b3dc
	ld a,052h		;b3df
	ld (0e2eeh),a		;b3e1
	ld a,0f8h		;b3e4
	ld (0e2edh),a		;b3e6
	ret			;b3e9
L_B3EA:
	ld de,078b8h		;b3ea
	ld hl,078a4h		;b3ed
	ld a,020h		;b3f0
	call 040d2h		;b3f2
	ld (0e2e5h),hl		;b3f5
	ld (0e2eah),de		;b3f8
	ld a,012h		;b3fc
	ld (0e2e1h),a		;b3fe
	ld a,051h		;b401
	ld (0e2eeh),a		;b403
	ld a,001h		;b406
	ld (0e2ech),a		;b408
	ld hl,03788h		;b40b
	ld (0e2efh),hl		;b40e
	ld a,010h		;b411
	ld (0ec48h),a		;b413
	ret			;b416
L_B417:
	ld hl,0ec60h		;b417
	ld de,07860h		;b41a
	ld a,020h		;b41d
	call 040d2h		;b41f
	ld (0e2f5h),hl		;b422
	ld (0e2fah),de		;b425
	ld a,011h		;b429
	ld (0e2f1h),a		;b42b
	ld a,021h		;b42e
	ld (0e2feh),a		;b430
	ld hl,0b040h		;b433
	ld (0e2ffh),hl		;b436
	ret			;b439
L_B43A:
	ld hl,00460h		;b43a
	ld de,07860h		;b43d
	ld a,020h		;b440
	call 040d2h		;b442
	ld (0e2f5h),hl		;b445
	ld (0e2fah),de		;b448
	ld a,011h		;b44c
	ld (0e2f1h),a		;b44e
	ld a,041h		;b451
	ld (0e2feh),a		;b453
	ld hl,0c440h		;b456
	ld (0e2ffh),hl		;b459
	ret			;b45c
L_B45D:
	ld hl,078a4h		;b45d
	ld de,07860h		;b460
	ld a,020h		;b463
	call 040d2h		;b465
	ld (0e2f5h),hl		;b468
	ld (0e2fah),de		;b46b
	ld a,011h		;b46f
	ld (0e2f1h),a		;b471
	ld a,051h		;b474
	ld (0e2feh),a		;b476
	ld hl,03788h		;b479
	ld (0e2ffh),hl		;b47c
	ret			;b47f
L_B480:
	ld hl,00460h		;b480
	ld de,00438h		;b483
	ld a,020h		;b486
	call 040d2h		;b488
	ld (0e2b5h),hl		;b48b
	ld (0e2bah),de		;b48e
	ld a,015h		;b492
	ld (0e2b1h),a		;b494
	ld a,041h		;b497
	ld (0e2beh),a		;b499
	ld hl,0c440h		;b49c
	ld (0e2bfh),hl		;b49f
	ret			;b4a2
L_B4A3:
	ld hl,00460h		;b4a3
	ld de,04030h		;b4a6
	ld a,020h		;b4a9
	call 040d2h		;b4ab
	ld (0e2a5h),hl		;b4ae
	ld (0e2aah),de		;b4b1
	ld a,016h		;b4b5
	ld (0e2a1h),a		;b4b7
	ld a,041h		;b4ba
	ld (0e2aeh),a		;b4bc
	ld hl,0c440h		;b4bf
	ld (0e2afh),hl		;b4c2
	ret			;b4c5
L_B4C6:
	ld hl,0ec60h		;b4c6
	ld de,06838h		;b4c9
	ld a,020h		;b4cc
	call 040d2h		;b4ce
	ld (0e2d5h),hl		;b4d1
	ld (0e2dah),de		;b4d4
	ld a,013h		;b4d8
	ld (0e2d1h),a		;b4da
	ld a,021h		;b4dd
	ld (0e2deh),a		;b4df
	ld hl,0b040h		;b4e2
	ld (0e2dfh),hl		;b4e5
	ret			;b4e8
L_B4E9:
	ld hl,0ec60h		;b4e9
	ld de,0c030h		;b4ec
	ld a,020h		;b4ef
	call 040d2h		;b4f1
	ld (0e2c5h),hl		;b4f4
	ld (0e2cah),de		;b4f7
	ld a,014h		;b4fb
	ld (0e2c1h),a		;b4fd
	ld a,021h		;b500
	ld (0e2ceh),a		;b502
	ld hl,0b040h		;b505
	ld (0e2cfh),hl		;b508
	ret			;b50b
L_B50C:
	ld hl,0ec60h		;b50c
	ld de,0d048h		;b50f
	ld a,020h		;b512
	call 040d2h		;b514
	ld (0e2c5h),hl		;b517
	ld (0e2cah),de		;b51a
	ld hl,00128h		;b51e
	ld (0e2c3h),hl		;b521
	ld hl,00190h		;b524
	ld (0e2c8h),hl		;b527
	ld a,014h		;b52a
	ld (0e2c1h),a		;b52c
	ld a,021h		;b52f
	ld (0e2ceh),a		;b531
	ld hl,0b040h		;b534
	ld (0e2cfh),hl		;b537
	ret			;b53a
L_B53B:
	ld a,(0ed7ch)		;b53b
	or a			;b53e
	jr nz,L_B564		;b53f
	ld hl,(0e215h)		;b541   ; lee la velocidad y de la pelota y el byte siguiente (16 bits)
	ld de,(0e21ah)		;b544   ; lee la velocidad x de la pelota y el byte siguiente (16 bits)
	ld a,h			;b548
	rla			;b549
	call c,L_B5DD		;b54a
	ld a,d			;b54d
	rla			;b54e
	call c,L_B5E5		;b54f
	add hl,de			;b552
	ld a,h			;b553
	or a			;b554
	jr z,L_B55E		;b555
	cp 002h		;b557
	ret nc			;b559
	ld a,l			;b55a
	cp 080h		;b55b
	ret nc			;b55d
L_B55E:
	ld a,(0e227h)		;b55e
	cp 002h		;b561
	ret nc			;b563
L_B564:
	pop hl			;b564
	ld hl,0ed9dh		;b565
	ld a,(0e21bh)		;b568
	rla			;b56b
	ld a,006h		;b56c
	jr c,L_B57E		;b56e
	dec a			;b570
	ld (hl),a			;b571
	call L_B50C		;b572
	call L_B338		;b575
	call L_B480		;b578
	jp L_B3EA		;b57b
L_B57E:
	ld (hl),a			;b57e
	call L_B4C6		;b57f
	call L_B39C		;b582
	call L_B4A3		;b585
	jp L_B3EA		;b588
L_B58B:
	call L_B5E5		;b58b
	ld a,h			;b58e
	rla			;b58f
	jr nc,L_B5B1		;b590
	call L_B5DD		;b592
	or a			;b595
	sbc hl,de		;b596
	rl h		;b598
	ld hl,0ed9dh		;b59a
	jr c,L_B5A8		;b59d
	ld a,004h		;b59f
	ld (hl),a			;b5a1
	call L_B43A		;b5a2
	jp L_B4C6		;b5a5
L_B5A8:
	ld a,002h		;b5a8
	ld (hl),a			;b5aa
	call L_B480		;b5ab
	jp L_B4C6		;b5ae
L_B5B1:
	or a			;b5b1
	sbc hl,de		;b5b2
	rl h		;b5b4
	ld hl,0ed9dh		;b5b6
	jr nc,L_B5C4		;b5b9
	ld a,002h		;b5bb
	ld (hl),a			;b5bd
	call L_B4C6		;b5be
	jp L_B480		;b5c1
L_B5C4:
	ld a,001h		;b5c4
	ld (hl),a			;b5c6
	call L_B417		;b5c7
	jp L_B480		;b5ca
L_B5CD:
	ld hl,0e27eh		;b5cd
	ld de,00010h		;b5d0
L_B5D3:
	ld a,(hl)			;b5d3
	and 0f0h		;b5d4
	cp c			;b5d6
	ret z			;b5d7
	add hl,de			;b5d8
	djnz L_B5D3		;b5d9
	scf			;b5db
	ret			;b5dc
L_B5DD:
	ld a,l			;b5dd
	cpl			;b5de
	ld l,a			;b5df
	ld a,h			;b5e0
	cpl			;b5e1
	ld h,a			;b5e2
	inc hl			;b5e3
	ret			;b5e4
L_B5E5:
	ld a,e			;b5e5
	cpl			;b5e6
	ld e,a			;b5e7
	ld a,d			;b5e8
	cpl			;b5e9
	ld d,a			;b5ea
	inc de			;b5eb
	ret			;b5ec

; ----------------------------------------------------------------------
; DATOS resto_B5ED: lo apuntan con el banco puesto p15:B2BA (0xB5ED); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p15:B2BA (36 bytes)
;   0xb5ed..0xb611  (36 bytes)
DATA_resto_B5ED:
	defb 0c8h,000h,0e8h,001h,088h,000h,038h,001h,0c8h,000h,088h,000h,010h,001h,000h,001h	; b5ed  ......8.........
	defb 038h,001h,0c4h,000h,010h,001h,080h,001h,038h,001h,0a0h,001h,098h,001h,038h,001h	; b5fd  8.......8.....8.
	defb 040h,001h,038h,001h	; b60d

; ======================================================================
; CODIGO 0xb611..0xb68c  (123 bytes)
; ======================================================================


L_B611:
	ld a,001h		;b611
	ld (0e2fch),a		;b613
	ld (0e2f1h),a		;b616
	ld (0e220h),a		;b619   ; guarda el defensor que tiene la pelota (1-9; 0 nadie)
	ld de,03848h		;b61c
	ld a,001h		;b61f
	jr L_B656		;b621
L_B623:
	ld a,(0e337h)		;b623
	or a			;b626
	jr nz,L_B643		;b627
	ld a,(0edddh)		;b629
	or a			;b62c
	jr nz,L_B643		;b62d
	ld a,001h		;b62f
	ld (0e2fch),a		;b631
	ld (0e220h),a		;b634   ; guarda el defensor que tiene la pelota (1-9; 0 nadie)
	ld a,021h		;b637
	ld (0e2f1h),a		;b639
	ld de,03840h		;b63c
	ld a,001h		;b63f
	jr L_B656		;b641
L_B643:
	ld a,001h		;b643
	ld (0e2ech),a		;b645
	inc a			;b648
	ld (0e220h),a		;b649   ; guarda el defensor que tiene la pelota (1-9; 0 nadie)
	ld a,022h		;b64c
	ld (0e2e1h),a		;b64e
	ld de,03898h		;b651
	ld a,002h		;b654
L_B656:
	ld (0e220h),a		;b656   ; guarda el defensor que tiene la pelota (1-9; 0 nadie)
	ld hl,0e212h		;b659
	ld (hl),000h		;b65c
	inc hl			;b65e
	ld (hl),e			;b65f
	inc hl			;b660
	ld (hl),001h		;b661
	inc hl			;b663
	inc hl			;b664
	inc hl			;b665
	ld (hl),000h		;b666
	inc hl			;b668
	ld (hl),d			;b669
	inc hl			;b66a
	ld (hl),001h		;b66b
	ld a,001h		;b66d
	ld (0e33ch),a		;b66f
	ld a,003h		;b672
	ld (0e211h),a		;b674   ; guarda la ficha de 16 bytes de la pelota
	xor a			;b677
	ld (0e302h),a		;b678
	ld (0ed39h),a		;b67b
	ld hl,0e2adh		;b67e
	ld de,00010h		;b681
	ld b,006h		;b684
L_B686:
	ld (hl),068h		;b686
	add hl,de			;b688
	djnz L_B686		;b689
	ret			;b68b

; ----------------------------------------------------------------------
; DATOS texto_suelto_B68C: con forma de texto ([x y], caracteres y 0xFF), pero
;   ninguna instruccion ni palabra lo apunta: SIN LECTOR A LA VISTA; lo leen
;   nadie (7 bytes)
;   0xb68c..0xb693  (7 bytes)
DATA_texto_suelto_B68C:
	defb 070h,078h,010h,00fh,01ch,022h,0ffh	; b68c

; ======================================================================
; CODIGO 0xb693..0xb8dc  (585 bytes)
; ======================================================================


L_B693:
	ld a,(0e1a2h)		;b693   ; lee el desplazamiento de la pantalla, 16 bits (en TEAM EDIT, la fila elegida)
	cp 00dh		;b696
	ld a,(0e1a3h)		;b698
	jp nc,L_B801		;b69b
	cp 00ah		;b69e
	jr c,L_B70B		;b6a0
	cp 00ch		;b6a2
	jp c,L_B79B		;b6a4
	ld a,(0e1a2h)		;b6a7   ; lee el desplazamiento de la pantalla, 16 bits (en TEAM EDIT, la fila elegida)
	dec a			;b6aa
	ld hl,0e1d8h		;b6ab
	call 04216h		;b6ae   ; hl_mas_a: HL = HL + A
	ld a,(0e1afh)		;b6b1
	ld b,a			;b6b4
	ld a,(0e1a3h)		;b6b5
	sub 00ch		;b6b8
	jr z,L_B6C9		;b6ba
	ld a,(hl)			;b6bc
	and 0f0h		;b6bd
	ld c,a			;b6bf
	ld a,b			;b6c0
	dec a			;b6c1
	and 00fh		;b6c2
	or c			;b6c4
	ld c,(hl)			;b6c5
	ld (hl),a			;b6c6
	jr L_B6D8		;b6c7
L_B6C9:
	ld a,(hl)			;b6c9
	and 00fh		;b6ca
	ld c,a			;b6cc
	ld a,b			;b6cd
	dec a			;b6ce
	rla			;b6cf
	rla			;b6d0
	rla			;b6d1
	rla			;b6d2
	and 0f0h		;b6d3
	or c			;b6d5
	ld c,(hl)			;b6d6
	ld (hl),a			;b6d7
L_B6D8:
	push hl			;b6d8
	ld de,0e1d8h		;b6d9
	ld b,00ch		;b6dc
	call L_AA13		;b6de
	ex de,hl			;b6e1
	ld hl,0e1e4h		;b6e2
	ld (hl),e			;b6e5
	inc hl			;b6e6
	ld (hl),d			;b6e7
	xor a			;b6e8
	sub e			;b6e9
	daa			;b6ea
	ld e,a			;b6eb
	ld a,006h		;b6ec
	sbc a,d			;b6ee
	daa			;b6ef
	ld d,a			;b6f0
	rl d		;b6f1
	pop hl			;b6f3
	jr nc,L_B6F8		;b6f4
	ld (hl),c			;b6f6
	ret			;b6f7
L_B6F8:
	ld d,e			;b6f8
	ld e,a			;b6f9
	ld (0e1e6h),de		;b6fa
L_B6FE:
	ld hl,0e1e6h		;b6fe
	ld de,0cc8bh		;b701
	ld b,003h		;b704
	jp 05c34h		;b706
L_B709:
	scf			;b709
	ret			;b70a
L_B70B:
	ld a,(0e1a2h)		;b70b   ; lee el desplazamiento de la pantalla, 16 bits (en TEAM EDIT, la fila elegida)
	dec a			;b70e
	add a,a			;b70f
	ld hl,0e1b4h		;b710
	call 04216h		;b713   ; hl_mas_a: HL = HL + A
	ld a,(0e1afh)		;b716
	ld b,a			;b719
	add a,a			;b71a
	ld a,(0e1a3h)		;b71b
	sub 007h		;b71e
	ld d,a			;b720
	call L_BA0A		;b721
	ld b,a			;b724
	ld a,d			;b725
	or a			;b726
	jr nz,L_B73E		;b727
	ld a,b			;b729
	cp 004h		;b72a
	jr nc,L_B709		;b72c
	or a			;b72e
	jr z,L_B709		;b72f
	dec a			;b731
	jr nz,L_B74C		;b732
	dec hl			;b734
	ld a,(hl)			;b735
	cp 050h		;b736
	call c,L_B775		;b738
	inc hl			;b73b
	jr L_B74C		;b73c
L_B73E:
	dec a			;b73e
	jr nz,L_B74C		;b73f
	inc hl			;b741
	ld a,(hl)			;b742
	dec hl			;b743
	dec a			;b744
	jr nz,L_B74C		;b745
	ld a,b			;b747
	cp 050h		;b748
	jr c,L_B709		;b74a
L_B74C:
	ld a,b			;b74c
	ld c,(hl)			;b74d
	push bc			;b74e
	ld (hl),a			;b74f
	ld (0e22dh),hl		;b750
	ld hl,0e1ech		;b753
	ld de,0e1b4h		;b756
	ld b,00ch		;b759
	call L_BA2D		;b75b
	ld bc,03500h		;b75e
	call L_BA44		;b761
	pop bc			;b764
	jr c,L_B796		;b765
	ld (0e1eeh),hl		;b767
L_B76A:
	ld hl,0e1eeh		;b76a
	ld de,0808bh		;b76d
	ld b,002h		;b770
	jp 05c34h		;b772
L_B775:
	ld (hl),050h		;b775
	push hl			;b777
	push de			;b778
	ld hl,0b8dfh		;b779
	ld d,090h		;b77c
	jr L_B787		;b77e
L_B780:
	push hl			;b780
	push de			;b781
	ld hl,0b8dch		;b782
	ld d,07ch		;b785
L_B787:
	push bc			;b787
	ld a,(0e100h)		;b788   ; lee los atributos de sprite (32 fichas de 4 bytes [y][x][dibujo][color])
	inc a			;b78b
	ld e,a			;b78c
	ld c,0ffh		;b78d
	call 04eb5h		;b78f   ; texto_en_de: pinta el texto HL en la posicion DE (sin [x y] delante)
	pop bc			;b792
	pop de			;b793
	pop hl			;b794
	ret			;b795
L_B796:
	ld hl,(0e22dh)		;b796
	ld (hl),c			;b799
	ret			;b79a
L_B79B:
	ld a,(0e1a2h)		;b79b   ; lee el desplazamiento de la pantalla, 16 bits (en TEAM EDIT, la fila elegida)
	dec a			;b79e
	ld hl,0e1cch		;b79f
	call 04216h		;b7a2   ; hl_mas_a: HL = HL + A
	ld a,(0e1afh)		;b7a5
	ld b,a			;b7a8
	ld a,(0e1a3h)		;b7a9
	sub 00ah		;b7ac
	jr z,L_B7BD		;b7ae
	ld a,(hl)			;b7b0
	and 0f0h		;b7b1
	ld c,a			;b7b3
	ld a,b			;b7b4
	dec a			;b7b5
	and 00fh		;b7b6
	or c			;b7b8
	ld c,(hl)			;b7b9
	ld (hl),a			;b7ba
	jr L_B7D0		;b7bb
L_B7BD:
	ld a,006h		;b7bd
	cp b			;b7bf
	ret c			;b7c0
	ld a,(hl)			;b7c1
	and 00fh		;b7c2
	ld c,a			;b7c4
	ld a,b			;b7c5
	dec a			;b7c6
	rla			;b7c7
	rla			;b7c8
	rla			;b7c9
	rla			;b7ca
	and 0f0h		;b7cb
	or c			;b7cd
	ld c,(hl)			;b7ce
	ld (hl),a			;b7cf
L_B7D0:
	push hl			;b7d0
	ld de,0e1cch		;b7d1
	ld b,00ch		;b7d4
	call L_AA13		;b7d6
	ex de,hl			;b7d9
	ld hl,0e1e8h		;b7da
	ld (hl),e			;b7dd
	inc hl			;b7de
	ld (hl),d			;b7df
	xor a			;b7e0
	sub e			;b7e1
	daa			;b7e2
	ld e,a			;b7e3
	ld a,002h		;b7e4
	sbc a,d			;b7e6
	daa			;b7e7
	ld d,a			;b7e8
	rl d		;b7e9
	pop hl			;b7eb
	jr nc,L_B7F0		;b7ec
	ld (hl),c			;b7ee
	ret			;b7ef
L_B7F0:
	ld d,e			;b7f0
	ld e,a			;b7f1
	ld (0e1eah),de		;b7f2
L_B7F6:
	ld hl,0e1eah		;b7f6
	ld de,0a88bh		;b7f9
	ld b,003h		;b7fc
	jp 05c34h		;b7fe
L_B801:
	cp 00bh		;b801
	jr c,L_B856		;b803
	cp 00eh		;b805
	jp c,L_B8E2		;b807
	cp 010h		;b80a
	jp c,L_B926		;b80c
	jp z,L_B9CB		;b80f
	cp 011h		;b812
	jp z,L_B98C		;b814
	ld a,(0e1a2h)		;b817   ; lee el desplazamiento de la pantalla, 16 bits (en TEAM EDIT, la fila elegida)
	sub 00dh		;b81a
	ld e,a			;b81c
	ld d,000h		;b81d
	ld hl,0e226h		;b81f
	add hl,de			;b822
	ld a,(0e1afh)		;b823
	dec a			;b826
	ld c,(hl)			;b827
	push bc			;b828
	push hl			;b829
	ld (hl),a			;b82a
	ld hl,0e226h		;b82b
	ld b,003h		;b82e
	ld a,(hl)			;b830
	inc hl			;b831
L_B832:
	add a,(hl)			;b832
	daa			;b833
	inc hl			;b834
	djnz L_B832		;b835
	ld (0e22ah),a		;b837
	ld b,a			;b83a
	ld a,025h		;b83b
	sub b			;b83d
	daa			;b83e
	ld b,a			;b83f
	rl b		;b840
	pop hl			;b842
	pop bc			;b843
	jr nc,L_B848		;b844
	ld (hl),c			;b846
	ret			;b847
L_B848:
	ld (0e22bh),a		;b848   ; guarda el defensor que va a por la pelota (desplazamiento de 16 en 16)
L_B84B:
	ld hl,0e22bh		;b84b   ; apunta a el defensor que va a por la pelota (desplazamiento de 16 en 16)
	ld de,0e8c7h		;b84e
	ld b,001h		;b851
	jp 05bf1h		;b853   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
L_B856:
	ld a,(0e1a2h)		;b856   ; lee el desplazamiento de la pantalla, 16 bits (en TEAM EDIT, la fila elegida)
	sub 00dh		;b859
	add a,a			;b85b
	ld e,a			;b85c
	ld d,000h		;b85d
	ld hl,0e1f0h		;b85f
	add hl,de			;b862
	ld a,(0e1afh)		;b863
	ld b,a			;b866
	add a,a			;b867
	ld a,(0e1a3h)		;b868
	sub 008h		;b86b
	ld d,a			;b86d
	call L_BA0A		;b86e
	ld b,a			;b871
	ld a,d			;b872
	or a			;b873
	jr z,L_B88D		;b874
	dec a			;b876
	jr nz,L_B8B0		;b877
	inc hl			;b879
	ld a,(hl)			;b87a
	dec hl			;b87b
	or a			;b87c
	jr z,L_B8B0		;b87d
	ld a,b			;b87f
	rra			;b880
	rra			;b881
	rra			;b882
	rra			;b883
	and 00fh		;b884
	ld c,a			;b886
	ld a,005h		;b887
	cp c			;b889
	ret c			;b88a
	jr L_B8B0		;b88b
L_B88D:
	ld a,b			;b88d
	ld c,a			;b88e
	ld a,001h		;b88f
	cp c			;b891
	ret c			;b892
	ld a,b			;b893
	or a			;b894
	jr z,L_B8B0		;b895
	ld a,(hl)			;b897
	dec a			;b898
	jr z,L_B8B0		;b899
	dec hl			;b89b
	ld a,(hl)			;b89c
	ld c,059h		;b89d
	cp c			;b89f
	jr c,L_B8AF		;b8a0
	ld a,(0e1fbh)		;b8a2
	cp c			;b8a5
	jr c,L_B8A9		;b8a6
	ld c,a			;b8a8
L_B8A9:
	ld (hl),c			;b8a9
	ld a,c			;b8aa
	or a			;b8ab
	call nz,L_B780		;b8ac
L_B8AF:
	inc hl			;b8af
L_B8B0:
	ld a,c			;b8b0
	ld c,(hl)			;b8b1
	push hl			;b8b2
	push bc			;b8b3
	ld a,b			;b8b4
	ld (hl),a			;b8b5
	ld de,0e1f0h		;b8b6
	ld hl,0e204h		;b8b9
	ld b,004h		;b8bc
	call L_BA2D		;b8be
	ld bc,00540h		;b8c1
	call L_BA44		;b8c4
	pop bc			;b8c7
	pop de			;b8c8
	jr nc,L_B8CE		;b8c9
	ld a,c			;b8cb
	ld (de),a			;b8cc
	ret			;b8cd
L_B8CE:
	ld (0e1fah),hl		;b8ce
L_B8D1:
	ld hl,0e1fah		;b8d1
	ld de,074c7h		;b8d4
	ld b,003h		;b8d7
	jp 05c34h		;b8d9

; ----------------------------------------------------------------------
; DATOS resto_B8DC: lo apuntan con el banco puesto p15:B782 (0xB8DC), p15:B779
;   (0xB8DF); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p15:B782, p15:B779 (6 bytes)
;   0xb8dc..0xb8e2  (6 bytes)
DATA_resto_B8DC:
	defb 006h,00ah,0ffh,006h,001h,0ffh	; b8dc

; ======================================================================
; CODIGO 0xb8e2..0xba8e  (428 bytes)
; ======================================================================


L_B8E2:
	ld a,(0e1a2h)		;b8e2   ; lee el desplazamiento de la pantalla, 16 bits (en TEAM EDIT, la fila elegida)
	sub 00dh		;b8e5
	add a,a			;b8e7
	ld e,a			;b8e8
	ld d,000h		;b8e9
	ld hl,0e1fch		;b8eb
	add hl,de			;b8ee
	ld a,(0e1afh)		;b8ef
	ld b,a			;b8f2
	add a,a			;b8f3
	ld a,(0e1a3h)		;b8f4
	sub 00bh		;b8f7
	call L_BA0A		;b8f9
	ld c,(hl)			;b8fc
	push bc			;b8fd
	push hl			;b8fe
	ld (hl),a			;b8ff
	ld de,0e1fch		;b900
	ld hl,0e204h		;b903
	ld b,004h		;b906
	call L_BA2D		;b908
	ld bc,00990h		;b90b
	call L_BA44		;b90e
	pop de			;b911
	pop bc			;b912
	jr nc,L_B918		;b913
	ld a,c			;b915
	ld (de),a			;b916
	ret			;b917
L_B918:
	ld (0e206h),hl		;b918
L_B91B:
	ld hl,0e206h		;b91b
	ld de,090c7h		;b91e
	ld b,003h		;b921
	jp 05c34h		;b923
L_B926:
	ld a,(0e1a2h)		;b926   ; lee el desplazamiento de la pantalla, 16 bits (en TEAM EDIT, la fila elegida)
	sub 00dh		;b929
	ld e,a			;b92b
	ld d,000h		;b92c
	ld hl,0e20eh		;b92e
	add hl,de			;b931
	ld a,(0e1afh)		;b932
	ld b,a			;b935
	ld a,(0e1a3h)		;b936
	sub 00eh		;b939
	jr z,L_B94A		;b93b
	ld a,(hl)			;b93d
	and 0f0h		;b93e
	ld c,a			;b940
	ld a,b			;b941
	dec a			;b942
	and 00fh		;b943
	or c			;b945
	ld c,(hl)			;b946
	ld (hl),a			;b947
	jr L_B959		;b948
L_B94A:
	ld a,(hl)			;b94a
	and 00fh		;b94b
	ld c,a			;b94d
	ld a,b			;b94e
	dec a			;b94f
	rla			;b950
	rla			;b951
	rla			;b952
	rla			;b953
	and 0f0h		;b954
	or c			;b956
	ld c,(hl)			;b957
	ld (hl),a			;b958
L_B959:
	push hl			;b959
	ld de,0e20eh		;b95a
	ld b,004h		;b95d
	call L_AA13		;b95f
	ld de,0e216h		;b962
	ld a,l			;b965
	ld (de),a			;b966
	inc de			;b967
	ld a,h			;b968
	ld (de),a			;b969
	ld a,000h		;b96a
	sub l			;b96c
	daa			;b96d
	ld l,a			;b96e
	ld a,002h		;b96f
	sbc a,h			;b971
	ld d,a			;b972
	daa			;b973
	rl d		;b974
	pop de			;b976
	jr nc,L_B97C		;b977
	ld a,c			;b979
	ld (de),a			;b97a
	ret			;b97b
L_B97C:
	ld h,l			;b97c
	ld l,a			;b97d
	ld (0e218h),hl		;b97e   ; guarda la x de la pelota y el byte siguiente (16 bits)
L_B981:
	ld hl,0e218h		;b981   ; apunta a la x de la pelota
	ld de,0acc7h		;b984
	ld b,003h		;b987
	jp 05c34h		;b989
L_B98C:
	ld a,(0e1a2h)		;b98c   ; lee el desplazamiento de la pantalla, 16 bits (en TEAM EDIT, la fila elegida)
	sub 00dh		;b98f
	ld e,a			;b991
	ld d,000h		;b992
	ld hl,0e220h		;b994   ; apunta a el defensor que tiene la pelota (1-9; 0 nadie)
	add hl,de			;b997
	ld a,(0e1afh)		;b998
	dec a			;b99b
	ld c,(hl)			;b99c
	push bc			;b99d
	push hl			;b99e
	ld (hl),a			;b99f
	ld hl,0e220h		;b9a0   ; apunta a el defensor que tiene la pelota (1-9; 0 nadie)
	ld b,003h		;b9a3
	ld a,(hl)			;b9a5
	inc hl			;b9a6
L_B9A7:
	add a,(hl)			;b9a7
	inc hl			;b9a8
	daa			;b9a9
	djnz L_B9A7		;b9aa
	ld (0e224h),a		;b9ac
	ld b,a			;b9af
	ld a,025h		;b9b0
	sub b			;b9b2
	daa			;b9b3
	ld b,a			;b9b4
	rl b		;b9b5
	pop hl			;b9b7
	pop bc			;b9b8
	jr nc,L_B9BD		;b9b9
	ld (hl),c			;b9bb
	ret			;b9bc
L_B9BD:
	ld (0e225h),a		;b9bd
L_B9C0:
	ld hl,0e225h		;b9c0
	ld de,0d8c7h		;b9c3
	ld b,001h		;b9c6
	jp 05bf1h		;b9c8   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
L_B9CB:
	ld a,(0e1a2h)		;b9cb   ; lee el desplazamiento de la pantalla, 16 bits (en TEAM EDIT, la fila elegida)
	sub 00dh		;b9ce
	ld e,a			;b9d0
	ld d,000h		;b9d1
	ld hl,0e21ah		;b9d3   ; apunta a la velocidad x de la pelota
	add hl,de			;b9d6
	ld a,(0e1afh)		;b9d7
	dec a			;b9da
	ld c,(hl)			;b9db
	ld (hl),a			;b9dc
	push bc			;b9dd
	push hl			;b9de
	ld hl,0e21ah		;b9df   ; apunta a la velocidad x de la pelota
	ld b,003h		;b9e2
	ld a,(hl)			;b9e4
	inc hl			;b9e5
L_B9E6:
	add a,(hl)			;b9e6
	inc hl			;b9e7
	daa			;b9e8
	djnz L_B9E6		;b9e9
	ld (0e21eh),a		;b9eb
	ld b,a			;b9ee
	ld a,025h		;b9ef
	sub b			;b9f1
	daa			;b9f2
	ld b,a			;b9f3
	rl b		;b9f4
	pop hl			;b9f6
	pop bc			;b9f7
	jr nc,L_B9FC		;b9f8
	ld (hl),c			;b9fa
	ret			;b9fb
L_B9FC:
	ld (0e21fh),a		;b9fc
L_B9FF:
	ld hl,0e21fh		;b9ff
	ld de,0c8c7h		;ba02
	ld b,001h		;ba05
	jp 05bf1h		;ba07   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
L_BA0A:
	jr z,L_BA19		;ba0a
	dec a			;ba0c
	jr z,L_BA1F		;ba0d
	ld a,(hl)			;ba0f
	and 0f0h		;ba10
	ld c,a			;ba12
	ld a,b			;ba13
	dec a			;ba14
	and 00fh		;ba15
	or c			;ba17
	ret			;ba18
L_BA19:
	inc hl			;ba19
	ld a,b			;ba1a
	dec a			;ba1b
	and 00fh		;ba1c
	ret			;ba1e
L_BA1F:
	ld a,(hl)			;ba1f
	and 00fh		;ba20
	ld c,a			;ba22
	ld a,b			;ba23
	dec a			;ba24
	rla			;ba25
	rla			;ba26
	rla			;ba27
	rla			;ba28
	and 0f0h		;ba29
	or c			;ba2b
	ret			;ba2c
L_BA2D:
	push hl			;ba2d
	ld hl,00000h		;ba2e
L_BA31:
	ld a,(de)			;ba31
	inc de			;ba32
	add a,l			;ba33
	daa			;ba34
	ld l,a			;ba35
	ld a,(de)			;ba36
	inc de			;ba37
	adc a,h			;ba38
	daa			;ba39
	ld h,a			;ba3a
	djnz L_BA31		;ba3b
	pop de			;ba3d
	ld a,l			;ba3e
	ld (de),a			;ba3f
	inc de			;ba40
	ld a,h			;ba41
	ld (de),a			;ba42
	ret			;ba43
L_BA44:
	ld a,c			;ba44
	sub l			;ba45
	daa			;ba46
	ld l,a			;ba47
	ld a,b			;ba48
	sbc a,h			;ba49
	ld d,a			;ba4a
	daa			;ba4b
	rl d		;ba4c
	ret c			;ba4e
	ld h,l			;ba4f
	ld l,a			;ba50
	ret			;ba51
L_BA52:
	push hl			;ba52
	ld hl,05230h		;ba53
	ld de,04040h		;ba56
	ld bc,05835h		;ba59
	ld a,004h		;ba5c
	call 04d66h		;ba5e   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
	call L_BA66		;ba61
	pop hl			;ba64
	ret			;ba65
L_BA66:
	call L_BA82		;ba66
	ld hl,05230h		;ba69
	ld de,05835h		;ba6c
	ld c,00dh		;ba6f
	jp 04cfeh		;ba71   ; marco: un marco de lineas: HL la esquina, DE el tamano
L_BA74:
	ld de,05230h		;ba74
	ld hl,04040h		;ba77
	ld bc,05835h		;ba7a
	ld a,001h		;ba7d
	jp 04d66h		;ba7f   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
L_BA82:
	ld hl,05230h		;ba82
	ld bc,05835h		;ba85
	xor a			;ba88
	ld d,000h		;ba89
	jp 04d2ah		;ba8b   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'

; ----------------------------------------------------------------------
; DATOS lista_BA8E: 2 fichas de dibujo de 6 bytes [paleta-tipo][VRAM lo
;   hi][caracteres][puntero] detras del numero (p00:4FA3, paletas en 0x51B2);
;   lo leen p00:5174 (13 bytes)
;   0xba8e..0xba9b  (13 bytes)
DATA_lista_BA8E:
	defb 002h,002h,032h,03eh,005h,0a8h	; ba8e
	defb 0bah,002h,032h,042h,005h,0f8h	; ba94
	defb 0bah	; ba9a

; ----------------------------------------------------------------------
; DATOS lista_BA9B: 2 fichas de dibujo de 6 bytes [paleta-tipo][VRAM lo
;   hi][caracteres][puntero] detras del numero (p00:4FA3, paletas en 0x51B2);
;   lo leen p00:5174 (13 bytes)
;   0xba9b..0xbaa8  (13 bytes)
DATA_lista_BA9B:
	defb 002h,002h,03ah,03eh,005h,0a8h	; ba9b
	defb 0bah,002h,03ah,042h,005h,0f8h	; baa1
	defb 0bah	; baa7

; ----------------------------------------------------------------------
; DATOS dibujo_BAA8: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0xBA9B (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:5174 (80 bytes)
;   0xbaa8..0xbaf8  (80 bytes)
DATA_dibujo_BAA8:
	defb 0ffh,000h,0e0h,01fh,080h,07fh,03fh,0ffh,019h,0ffh,019h,0ffh,01fh,0ffh,018h,0ffh	; baa8  ......?.........
	defb 0f8h,007h,000h,0ffh,000h,0ffh,03ch,0ffh,098h,0ffh,098h,0ffh,018h,0ffh,019h,0ffh	; bab8  ......<.........
	defb 000h,0ffh,000h,0ffh,000h,0ffh,01ch,0ffh,026h,0ffh,026h,0ffh,026h,0ffh,03eh,0ffh	; bac8  ........&.&.&.>.
	defb 03fh,0c0h,000h,0ffh,000h,0ffh,0e7h,0ffh,042h,0ffh,024h,0ffh,018h,0ffh,018h,0ffh	; bad8  ?.......B.$.....
	defb 0ffh,000h,00fh,0f0h,003h,0fch,03dh,0feh,03dh,0feh,039h,0feh,039h,0feh,001h,0feh	; bae8  ......=.=.9.9...

; ----------------------------------------------------------------------
; DATOS dibujo_BAF8: 5 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0xBA9B (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:5174 (80 bytes)
;   0xbaf8..0xbb48  (80 bytes)
DATA_dibujo_BAF8:
	defb 018h,0ffh,03ch,0ffh,080h,07fh,0e0h,01fh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; baf8  ..<.............
	defb 019h,0ffh,03fh,0ffh,000h,0ffh,000h,0ffh,0f8h,007h,0ffh,000h,0ffh,000h,0ffh,000h	; bb08  ..?.............
	defb 026h,0ffh,067h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h	; bb18  &.g.............
	defb 018h,0ffh,03ch,0ffh,000h,0ffh,000h,0ffh,03fh,0c0h,0ffh,000h,0ffh,000h,0ffh,000h	; bb28  ..<.....?.......
	defb 071h,0feh,071h,0feh,003h,0fch,00fh,0f0h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; bb38  q.q.............

; ======================================================================
; CODIGO 0xbb48..0xbb7d  (53 bytes)
; ======================================================================


L_BB48:
	ld de,08808h		;bb48
	ld hl,0ed4ch		;bb4b   ; apunta a el reloj de juego: minutos, cifra baja
	call L_BB64		;bb4e
	ld d,082h		;bb51
	call L_BB64		;bb53
	ld d,07ch		;bb56
	ld a,0dah		;bb58
	call 04f3ah		;bb5a
	ld d,076h		;bb5d
	call L_BB64		;bb5f
	ld d,070h		;bb62
L_BB64:
	push hl			;bb64
	ld a,(hl)			;bb65
	or a			;bb66
	jr z,L_BB76		;bb67
	ld hl,0bb7dh		;bb69
	call 04216h		;bb6c   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;bb6f
	call 04f30h		;bb70
L_BB73:
	pop hl			;bb73
	inc hl			;bb74
	ret			;bb75
L_BB76:
	ld a,0d9h		;bb76
	call 04f3ah		;bb78
	jr L_BB73		;bb7b

; ----------------------------------------------------------------------
; DATOS resto_BB7D: lo apuntan con el banco puesto p15:BB69 (0xBB7D); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p15:BB69 (10 bytes)
;   0xbb7d..0xbb87  (10 bytes)
DATA_resto_BB7D:
	defb 015h,002h,003h,004h,005h,006h,007h,00eh,00fh,010h	; bb7d  ..........

; ======================================================================
; CODIGO 0xbb87..0xbb8d  (6 bytes)
; ======================================================================


L_BB87:
	ld a,(0ecefh)		;bb87
	call 04220h		;bb8a   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_BB8D: 5 destinos del despachador p00:4220 (call en p15:BB8A, el
;   indice en A): BB97, BBBD, BBE4, BC22, BC64; lo leen p15:BB8A (10 bytes)
;   0xbb8d..0xbb97  (10 bytes)
DATA_tabla_BB8D:
	defw 0bb97h,0bbbdh,0bbe4h,0bc22h,0bc64h	; bb8d

; ======================================================================
; CODIGO 0xbb97..0xbd13  (380 bytes)
; ======================================================================


L_BB97:
	call 04b9fh		;bb97   ; borra_pantalla: esconde los sprites, apaga la pantalla, rellena la VRAM de 0, R#23 = 0 y la enciende
	call 05c7dh		;bb9a   ; esconde_atributos: pone las 32 fichas de sprite de 0xE100 fuera de la pantalla
	ld hl,02870h		;bb9d
	ld bc,0d048h		;bba0
	xor a			;bba3
	ld d,001h		;bba4
	call 04d2ah		;bba6   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
	call 0541bh		;bba9
	call 052e1h		;bbac
	xor a			;bbaf
	ld (0e1d1h),a		;bbb0   ; guarda la marca de acabado de los pasos; en el lanzamiento, su paso (p03:A525)
	ld (0e1a2h),a		;bbb3   ; guarda el desplazamiento de la pantalla, 16 bits (en TEAM EDIT, la fila elegida)
	ld a,020h		;bbb6
	ld (0de04h),a		;bbb8   ; guarda la cuenta atras del estado
	jr L_BC1D		;bbbb
L_BBBD:
	ld hl,0de04h		;bbbd   ; apunta a la cuenta atras del estado
	dec (hl)			;bbc0
	ret nz			;bbc1
	ld de,0ecf0h		;bbc2
	ld hl,0bd99h		;bbc5
	ld bc,00009h		;bbc8
	ldir		;bbcb
	call L_BCAD		;bbcd
	call 040dbh		;bbd0
	ld a,080h		;bbd3
	call 057ffh		;bbd5   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	ld a,028h		;bbd8
	call 057ffh		;bbda   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	ld a,008h		;bbdd
	ld (0de04h),a		;bbdf   ; guarda la cuenta atras del estado
	jr L_BC1D		;bbe2
L_BBE4:
	call 05c73h		;bbe4
	call L_BCAD		;bbe7
	call 040dbh		;bbea
	call L_BC72		;bbed
	call L_BC89		;bbf0
	ld hl,0de04h		;bbf3   ; apunta a la cuenta atras del estado
	dec (hl)			;bbf6
	ret nz			;bbf7
	ld a,008h		;bbf8
	ld (0de04h),a		;bbfa   ; guarda la cuenta atras del estado
	ld hl,0ecf8h		;bbfd
	dec (hl)			;bc00
	ret nz			;bc01
	call 05c7dh		;bc02   ; esconde_atributos: pone las 32 fichas de sprite de 0xE100 fuera de la pantalla
	call 04235h		;bc05
	xor a			;bc08
	ld (0ed09h),a		;bc09   ; guarda la peticion de copiar sprites a la VRAM (1 colores, 2 todo)
	call 05421h		;bc0c
	call 04c67h		;bc0f   ; espera_vdp: espera a que el VDP acabe la orden (S#2 bit 0, CE)
	ld hl,0bda2h		;bc12
	ld de,0ecf0h		;bc15
	ld bc,00009h		;bc18
	ldir		;bc1b
L_BC1D:
	ld hl,0ecefh		;bc1d
	inc (hl)			;bc20
	ret			;bc21
L_BC22:
	call 05c73h		;bc22
	call L_BCAD		;bc25
	call 040dbh		;bc28
	call L_BC72		;bc2b
	call L_BC9E		;bc2e
	ld a,(0ecf5h)		;bc31
	sub 01ch		;bc34
	ret c			;bc36
	or a			;bc37
	ret z			;bc38
	ld a,(0ecf5h)		;bc39
	and 0f8h		;bc3c
	sub 004h		;bc3e
	ld d,a			;bc40
	add a,00ch		;bc41
	ld h,a			;bc43
	ld l,070h		;bc44
	ld e,008h		;bc46
	ld b,008h		;bc48
	ld c,048h		;bc4a
	ld a,001h		;bc4c
	call 04d66h		;bc4e   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
	ld a,(0ecf5h)		;bc51
	cp 0e9h		;bc54
	ret c			;bc56
	call 05c7dh		;bc57   ; esconde_atributos: pone las 32 fichas de sprite de 0xE100 fuera de la pantalla
	call 05c73h		;bc5a
	ld a,010h		;bc5d
	ld (0de04h),a		;bc5f   ; guarda la cuenta atras del estado
	jr L_BC1D		;bc62
L_BC64:
	ld hl,0de04h		;bc64   ; apunta a la cuenta atras del estado
	dec (hl)			;bc67
	ret nz			;bc68
	call 05dbbh		;bc69
	ld a,001h		;bc6c
	ld (0e1d1h),a		;bc6e   ; guarda la marca de acabado de los pasos; en el lanzamiento, su paso (p03:A525)
	ret			;bc71
L_BC72:
	ld hl,(0ecf0h)		;bc72
	ld de,(0ecf2h)		;bc75
	add hl,de			;bc79
	ld (0ecf0h),hl		;bc7a
	ld hl,(0ecf4h)		;bc7d
	ld de,(0ecf6h)		;bc80
	add hl,de			;bc84
	ld (0ecf4h),hl		;bc85
	ret			;bc88
L_BC89:
	ld hl,(0ecf2h)		;bc89
	ld de,0fffbh		;bc8c
	add hl,de			;bc8f
	ld (0ecf2h),hl		;bc90
	ld hl,(0ecf6h)		;bc93
	ld de,0fff8h		;bc96
	add hl,de			;bc99
	ld (0ecf6h),hl		;bc9a
	ret			;bc9d
L_BC9E:
	ld a,(0de03h)		;bc9e   ; lee el contador de cuadros del juego (sube uno por cuadro)
	and 007h		;bca1
	ret nz			;bca3
	ld a,(0ecf8h)		;bca4
	xor 001h		;bca7
	ld (0ecf8h),a		;bca9
	ret			;bcac
L_BCAD:
	ld a,(0ecf8h)		;bcad
	dec a			;bcb0
	add a,a			;bcb1
	ld hl,0bd13h		;bcb2
	call 04216h		;bcb5   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;bcb8
	inc hl			;bcb9
	ld c,(hl)			;bcba
	add a,a			;bcbb
	ld hl,0bd31h		;bcbc
	call 04216h		;bcbf   ; hl_mas_a: HL = HL + A
	ld e,(hl)			;bcc2
	inc hl			;bcc3
	ld d,(hl)			;bcc4
	ex de,hl			;bcc5
	ld b,(hl)			;bcc6
	inc hl			;bcc7
	ld de,0e100h		;bcc8   ; apunta a los atributos de sprite (32 fichas de 4 bytes [y][x][dibujo][color])
L_BCCB:
	push bc			;bccb
	ld a,(0ecf1h)		;bccc
	add a,(hl)			;bccf
	inc hl			;bcd0
	ld (de),a			;bcd1
	inc de			;bcd2
	ld a,(0ecf5h)		;bcd3
	add a,(hl)			;bcd6
	inc hl			;bcd7
	cp 0f0h		;bcd8
	ld b,001h		;bcda
	jr c,L_BCDF		;bcdc
	dec b			;bcde
L_BCDF:
	ld (de),a			;bcdf
	inc de			;bce0
	ld a,c			;bce1
	ld (de),a			;bce2
	add a,004h		;bce3
	ld c,a			;bce5
	inc de			;bce6
	ld a,b			;bce7
	or a			;bce8
	ld a,00dh		;bce9
	jr nz,L_BCEE		;bceb
	xor a			;bced
L_BCEE:
	ld (de),a			;bcee
	inc de			;bcef
	ld a,(0ecf1h)		;bcf0
	add a,(hl)			;bcf3
	inc hl			;bcf4
	ld (de),a			;bcf5
	inc de			;bcf6
	ld a,(0ecf5h)		;bcf7
	add a,(hl)			;bcfa
	inc hl			;bcfb
	ld (de),a			;bcfc
	inc de			;bcfd
	ld a,c			;bcfe
	ld (de),a			;bcff
	add a,004h		;bd00
	ld c,a			;bd02
	inc de			;bd03
	ld a,b			;bd04
	or a			;bd05
	ld a,01eh		;bd06
	jr nz,L_BD0B		;bd08
	xor a			;bd0a
L_BD0B:
	ld (de),a			;bd0b
	inc de			;bd0c
	ld a,c			;bd0d
	pop bc			;bd0e
	ld c,a			;bd0f
	djnz L_BCCB		;bd10
	ret			;bd12

; ----------------------------------------------------------------------
; DATOS resto_BD13: lo apuntan con el banco puesto p15:BCB2 (0xBD13), p15:BCBC
;   (0xBD31), p15:BBC5 (0xBD99), p15:BC12 (0xBDA2); el tamano es lo que hay
;   hasta lo siguiente, no sale de recorrerlo; lo leen p15:BCB2, p15:BCBC,
;   p15:BBC5, p15:BC12 (273 bytes)
;   0xbd13..0xbe24  (273 bytes)
DATA_resto_BD13:
	defb 002h,0e0h,002h,0c0h,002h,0a0h,002h,080h,002h,060h,002h,040h,001h,030h,000h,028h	; bd13  .........`.@.0.(
	defb 000h,020h,000h,018h,000h,010h,000h,008h,000h,000h,003h,000h,003h,080h,039h,0bdh	; bd23  . ............9.
	defb 03eh,0bdh,047h,0bdh,058h,0bdh,001h,0f8h,0f8h,0f8h,0f8h,002h,0f7h,0f7h,0f7h,0f7h	; bd33  >.G.X...........
	defb 0fah,0fah,0fah,0fah,004h,0f0h,0f0h,0f0h,0f0h,0f0h,000h,0f0h,000h,000h,0f0h,000h	; bd43  ................
	defb 0f0h,000h,000h,000h,000h,010h,0e0h,0e0h,0e0h,0e0h,0e0h,0f0h,0e0h,0f0h,0e0h,000h	; bd53  ................
	defb 0e0h,000h,0e0h,010h,0e0h,010h,0f0h,0e0h,0f0h,0e0h,0f0h,0f0h,0f0h,0f0h,0f0h,000h	; bd63  ................
	defb 0f0h,000h,0f0h,010h,0f0h,010h,000h,0e0h,000h,0e0h,000h,0f0h,000h,0f0h,000h,000h	; bd73  ................
	defb 000h,000h,000h,010h,000h,010h,010h,0e0h,010h,0e0h,010h,0f0h,010h,0f0h,010h,000h	; bd83  ................
	defb 010h,000h,010h,010h,010h,010h,000h,0a0h,0a0h,000h,000h,0d8h,080h,0ffh,00dh,000h	; bd93  ................
	defb 028h,000h,000h,000h,014h,000h,004h,00fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bda3  (...............
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bdb3  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bdc3  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bdd3  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bde3  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bdf3  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be03  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be13  ................
	defb 0ffh	; be23

; ----------------------------------------------------------------------
; DATOS texto_BE24: texto (p00:4EBA, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p03:BDC7 (3 bytes)
;   0xbe24..0xbe27  (3 bytes)
DATA_texto_BE24:
	defb 0ffh,0ffh,0ffh	; be24

; ----------------------------------------------------------------------
; DATOS relleno_ff: 27 bytes a 0xFF entre los textos: relleno; lo leen nadie
;   (27 bytes)
;   0xbe27..0xbe42  (27 bytes)
DATA_BE27:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be27  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be37  ...........

; ----------------------------------------------------------------------
; DATOS texto_BE42: texto (p00:4EBA, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p03:BC6D (3 bytes)
;   0xbe42..0xbe45  (3 bytes)
DATA_texto_BE42:
	defb 0ffh,0ffh,0ffh	; be42

; ----------------------------------------------------------------------
; DATOS relleno_ff: 443 bytes a 0xFF hasta el final del banco: relleno; lo
;   leen nadie (443 bytes)
;   0xbe45..0xc000  (443 bytes)
DATA_BE45:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be45  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be55  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be65  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be75  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be85  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be95  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bea5  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; beb5  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bec5  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bed5  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bee5  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bef5  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf05  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf15  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf25  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf35  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf45  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf55  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf65  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf75  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf85  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf95  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfa5  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfb5  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfc5  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfd5  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfe5  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bff5  ...........
