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
	ld a,(0e140h)		;a002   ; paso: hasta que el sprite de 0xE140 baje de 0x40; luego 16 cuadros
	cp 040h		;a005   ; mientras no llegue a 0x40, nada
	ret nc			;a007
	ld a,010h		;a008   ; si llega: 0x10 cuadros de espera...
	ld (0de04h),a		;a00a   ; guarda la cuenta atras del estado
	jr $-19		;a00d   ; ...y vuelve al paso de antes
L_A00F:
	ld hl,0de04h		;a00f   ; paso: los datos de 0xDD80 (el campeon): nombre, resultados y el texto de 0xA307...
	dec (hl)			;a012   ; cuenta atras: hasta 0 no sigue
	ret nz			;a013
	xor a			;a014
	ld (hl),a			;a015
	ld (0dd86h),a		;a016   ; la cuenta de lineas (0xDD86) a 0
	call 09ffah		;a019   ; paso_ecef: al paso siguiente (0xECEF + 1)
	ld hl,0dd80h		;a01c   ; la ficha que se ensena (0xDD88) = 0xDD80
	ld (0dd88h),hl		;a01f
	call L_A20E		;a022   ; una fila en blanco
	ld a,(0dd80h)		;a025   ; el nombre del equipo de 0xDD80 en (0x50, 0x40)
	call ficha_del_equipo		;a028   ; ficha_del_equipo: HL = la ficha de 15 bytes del equipo A en 0xD680
	ld de,05040h		;a02b
	call diez_letras		;a02e   ; diez_letras: 10 letras en ASCII (el '$' acaba)
	ld a,(0dd80h)		;a031   ; sus victorias, en (0x90, 0x30)...
	call victorias_de		;a034   ; victorias_de: HL = las victorias de la ficha del equipo A (+11)
	push hl			;a037
	ld de,03090h		;a038
	call tres_cifras		;a03b   ; tres_cifras: un numero de 3 cifras BCD con los ceros de delante en blanco
	pop hl			;a03e
	inc hl			;a03f   ; ...y sus derrotas, en (0x90, 0x60)
	inc hl			;a040
	ld de,06090h		;a041
	call tres_cifras		;a044   ; tres_cifras: un numero de 3 cifras BCD con los ceros de delante en blanco
	ld hl,0a307h		;a047   ; los rotulos de 0xA307
	call texto_15		;a04a   ; texto_15: un texto con [x y] y caracteres de la fuente hasta 0xFF
	ld hl,00040h		;a04d   ; ...sube el cuadro (p15:A171), 0xE365 y 0xE370 = 0x90
	ld de,008d4h		;a050
	ld a,001h		;a053
	call ymmm		;a055   ; ymmm: orden YMMM (0xE0) del VDP: mueve en vertical una franja
	call 09f03h		;a058   ; 0xE365 = victorias y derrotas (p14:9F03)
	ld a,090h		;a05b   ; el porcentaje se pinta en la y 0x90
	ld (0e370h),a		;a05d
	jp L_A28B		;a060
L_A063:
	ld hl,0de04h		;a063   ; paso: 96 cuadros subiendo la pantalla (R#23) cada dos...
	inc (hl)			;a066   ; 0xDE04 cuenta hasta 0x60 cuadros
	ld a,(hl)			;a067
	cp 060h		;a068
	jr z,L_A078		;a06a
	and a			;a06c   ; en los cuadros impares, nada
	rra			;a06d
	ret c			;a06e
	call L_A07F		;a06f   ; la linea siguiente (p15:A07F)...
	ld c,017h		;a072   ; ...y el registro 23 del VDP (el desplazamiento vertical) = A
	ld b,a			;a074
	jp 00047h		;a075   ; BIOS WRTVDP - Writes data in the VDP-register
L_A078:
	xor a			;a078   ; ...y al siguiente
	ld (0dd86h),a		;a079
	jp 09ffah		;a07c   ; paso_ecef: al paso siguiente (0xECEF + 1)
L_A07F:
	ld b,a			;a07f   ; cada 8 vueltas, una linea mas del cuadro (YMMM)
	ld hl,0dd86h		;a080   ; 0xDD86 cuenta las vueltas
	inc (hl)			;a083
	ld a,(hl)			;a084
	and 007h		;a085
	ld a,b			;a087
	ret nz			;a088
	push af			;a089
	ld a,(0dd86h)		;a08a   ; la linea 0xDD86: de la y 0x40 + n...
	ld e,a			;a08d
	add a,040h		;a08e
	ld l,a			;a090
	ld h,000h		;a091
	ld a,0d4h		;a093   ; ...a la y 0xD4 + n
	add a,e			;a095
	ld e,a			;a096
	ld d,008h		;a097
	ld a,001h		;a099
	call ymmm		;a09b   ; ymmm: orden YMMM (0xE0) del VDP: mueve en vertical una franja
	pop af			;a09e
	ret			;a09f
L_A0A0:
	ld hl,0dd86h		;a0a0   ; paso: 0x92 vueltas bajando el cuadro...
	inc (hl)			;a0a3   ; 0xDD86 cuenta hasta 0x92
	ld a,(hl)			;a0a4
	cp 092h		;a0a5
	jr z,L_A0BF		;a0a7
	and a			;a0a9   ; en las vueltas impares, nada
	rra			;a0aa
	ret c			;a0ab
	ld e,a			;a0ac   ; la franja de x 0x40 baja de la y 0xD4 - n/2...
	ld a,0d4h		;a0ad
	sub e			;a0af
	ld e,a			;a0b0
	ld a,0ffh		;a0b1
	sub e			;a0b3
	add a,010h		;a0b4
	ld d,a			;a0b6
	ld hl,00040h		;a0b7
	ld a,001h		;a0ba   ; ...a la 0xFF - lo anterior + 0x10
	jp ymmm		;a0bc   ; ymmm: orden YMMM (0xE0) del VDP: mueve en vertical una franja
L_A0BF:
	ld a,(0dd9dh)		;a0bf   ; ...con un solo equipo de jugador se acaba (0xED2F = 1)...
	dec a			;a0c2
	jr z,L_A0CB		;a0c3
L_A0C5:
	ld a,001h		;a0c5   ; se acaba: 0xED2F = 1
	ld (0ed2fh),a		;a0c7
	ret			;a0ca
L_A0CB:
	ld hl,0dd8ah		;a0cb   ; ...si no, el siguiente de la lista de 0xDD80 (0xFF acaba) y 144 cuadros
	inc (hl)			;a0ce
	ld e,(hl)			;a0cf   ; el siguiente de la lista de 0xDD80 (0xDD8A cuenta)
	ld d,000h		;a0d0
	ld hl,0dd80h		;a0d2
	add hl,de			;a0d5
	ld (0dd88h),hl		;a0d6
	ld a,(hl)			;a0d9   ; 0xFF acaba la lista
	inc a			;a0da
	jr z,L_A0C5		;a0db
	ld a,090h		;a0dd   ; 0x90 cuadros de espera y al paso siguiente
	ld (0de04h),a		;a0df   ; guarda la cuenta atras del estado
	jp 09ffah		;a0e2   ; paso_ecef: al paso siguiente (0xECEF + 1)
L_A0E5:
	ld hl,0de04h		;a0e5   ; paso: la espera
	dec (hl)			;a0e8
	ret nz			;a0e9
	xor a			;a0ea   ; la cuenta de lineas a 0 y al paso siguiente
	ld (hl),a			;a0eb
	ld (0dd86h),a		;a0ec
	jp 09ffah		;a0ef   ; paso_ecef: al paso siguiente (0xECEF + 1)
L_A0F2:
	ld a,(0de03h)		;a0f2   ; paso: cada 4 cuadros una linea, hasta 0x60...
	and 003h		;a0f5
	ret nz			;a0f7
	ld hl,0dd86h		;a0f8   ; 0xDD86 cuenta hasta 0x60
	inc (hl)			;a0fb
	ld a,(hl)			;a0fc
	cp 060h		;a0fd
	jr z,L_A113		;a0ff
	ld e,08ch		;a101   ; la franja de x 0x40 + n, a la y 0xFF - 0x8C - n
	ld a,0ffh		;a103
	sub e			;a105
	sub (hl)			;a106
	ld d,a			;a107
	ld a,040h		;a108
	add a,(hl)			;a10a
	ld h,000h		;a10b
	ld l,a			;a10d
	ld a,001h		;a10e
	jp ymmm		;a110   ; ymmm: orden YMMM (0xE0) del VDP: mueve en vertical una franja
L_A113:
	call 09ffah		;a113   ; ...luego los rotulos de 0xA133 y el nombre
	xor a			;a116   ; la cuenta de lineas a 0
	ld (0dd86h),a		;a117
	call 040e1h		;a11a   ; la fuente (p00:40E1)
	ld de,05040h		;a11d   ; el rotulo de 0xA133 en (0x50, 0x40)...
	ld hl,0a133h		;a120
	call diez_letras		;a123   ; diez_letras: 10 letras en ASCII (el '$' acaba)
	ld hl,(0dd88h)		;a126   ; ...y el nombre del equipo que se ensena
	ld a,(hl)			;a129
	call ficha_del_equipo		;a12a   ; ficha_del_equipo: HL = la ficha de 15 bytes del equipo A en 0xD680
	ld de,05040h		;a12d
	jp diez_letras		;a130   ; diez_letras: 10 letras en ASCII (el '$' acaba)

; ----------------------------------------------------------------------
; DATOS resto_A133: lo apuntan con el banco puesto p15:A120 (0xA133); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p15:A120 (10 bytes)
;   0xa133..0xa13d  (10 bytes)
DATA_resto_A133:
	defb 020h,020h,020h,020h,020h,020h,020h,020h,020h,020h	; a133	10 letras ASCII: el rotulo

; ======================================================================
; CODIGO 0xa13d..0xa307  (458 bytes)
; ======================================================================


L_A13D:
	ld hl,0dd86h		;a13d   ; paso: el cuadro baja de dos en dos hasta 0x8B; despues el siguiente equipo
	inc (hl)			;a140
	ld a,(hl)			;a141
	and a			;a142
	rra			;a143
	ret c			;a144
	ld d,a			;a145   ; D = n/2; E = 5 - n/2
	ld a,005h		;a146
	sub d			;a148
	ld e,a			;a149
	cp 0ffh		;a14a   ; con E = 0xFF, una franja de la x 0x50 a la y 0x00...
	jr nz,L_A15C		;a14c
	push de			;a14e
	ld de,00800h		;a14f
	ld hl,00050h		;a152
	ld a,001h		;a155
	call ymmm		;a157   ; ymmm: orden YMMM (0xE0) del VDP: mueve en vertical una franja
	pop de			;a15a
	ld a,e			;a15b
L_A15C:
	cp 08bh		;a15c   ; hasta E = 0x8B, la franja de x 0x40 a la y E
	jp z,L_A169		;a15e
	ld hl,00040h		;a161
	ld a,001h		;a164
	jp ymmm		;a166   ; ymmm: orden YMMM (0xE0) del VDP: mueve en vertical una franja
L_A169:
	ld a,010h		;a169   ; al acabar: el paso 0x10 y el siguiente equipo
	ld (0ecefh),a		;a16b
	jp L_A0CB		;a16e
ymmm:		; orden YMMM (0xE0) del VDP: mueve en vertical una franja
	ex af,af'			;a171   ; orden YMMM (0xE0) del VDP: mueve en vertical la franja de x = L, de la y = H a D, E de alto
	call 04c67h		;a172   ; espera_vdp: espera a que el VDP acabe la orden (S#2 bit 0, CE)
	ld a,(00007h)		;a175   ; C = el puerto de ordenes del VDP (0x99 en un MSX)
	inc a			;a178   ; el puerto de datos del VDP (0x0007 de la BIOS) + 1: el de ordenes
	ld c,a			;a179
	ld a,022h		;a17a   ; R#17 = 34 con autoincremento: escribe desde el registro de la x de destino
	di			;a17c   ; sin interrupciones mientras se escriben los registros
	out (c),a		;a17d
	ld a,091h		;a17f   ; 0x91: el registro 17 de vuelta
	out (c),a		;a181
	inc c			;a183
	inc c			;a184   ; C = 0x9B, el puerto de los registros
	out (c),l		;a185   ; DX = L
	ex af,af'			;a187   ; la pagina de destino: los bits 0-1 de A
	ld l,a			;a188
	and 003h		;a189
	out (c),a		;a18b   ; R#36 = DX alto (la pagina)
	out (c),h		;a18d   ; DY = H + 256 x pagina
	xor a			;a18f
	out (c),a		;a190   ; R#37 = 0
	out (c),e		;a192   ; SY = E...
	ld a,l			;a194   ; ...+ 256 x la pagina de origen (bits 2-3 de A)
	rra			;a195
	rra			;a196
	and 003h		;a197
	out (c),a		;a199   ; R#39 = la pagina de origen
	xor a			;a19b   ; NX sin usar
	out (c),a		;a19c   ; R#40, R#41 = 0
	out (c),a		;a19e
	out (c),d		;a1a0   ; NY = D, o 1 si D es 0...
	cp d			;a1a2   ; NY = 0 se cambia por 1
	jr nz,L_A1A6		;a1a3
	inc a			;a1a5
L_A1A6:
	out (c),a		;a1a6
	xor a			;a1a8   ; ...ARG = 0
	out (c),a		;a1a9
	out (c),a		;a1ab
	ld a,0e0h		;a1ad   ; YMMM
	out (c),a		;a1af
	ei			;a1b1
	ret			;a1b2
L_A1B3:
	ld de,0e041h		;a1b3   ; 0xE040-0xE0FF a cero
	ld hl,0e040h		;a1b6
	ld bc,000bfh		;a1b9
	jr L_A1C7		;a1bc
L_A1BE:
	ld de,0df01h		;a1be   ; 0xDF00-0xE0FF a cero (los colores de sprite)
	ld hl,0df00h		;a1c1   ; apunta a los colores de sprite (16 bytes por sprite) antes de la VRAM 0xF400
	ld bc,001ffh		;a1c4
L_A1C7:
	ld (hl),000h		;a1c7   ; HL a cero y LDIR: el resto lo copia
	ldir		;a1c9
	ret			;a1cb
tres_cifras:		; un numero de 3 cifras BCD con los ceros de delante en blanco
	ld c,000h		;a1cc   ; un numero de 3 cifras BCD con los ceros de delante en blanco...
	ld a,(hl)			;a1ce   ; la cifra alta del primer byte
	call cifra_15		;a1cf   ; cifra_15: una cifra (1-10, o 0 en blanco) y 8 a la derecha
	ld c,000h		;a1d2   ; si la primera no era 0, las siguientes ya se pintan aunque sean 0
	ld a,(hl)			;a1d4
	and 00fh		;a1d5
	jr z,L_A1DB		;a1d7
	ld c,0ffh		;a1d9
L_A1DB:
	inc hl			;a1db
	ld a,(hl)			;a1dc   ; la cifra alta del segundo
	rra			;a1dd
	rra			;a1de
	rra			;a1df
	rra			;a1e0
	call cifra_15		;a1e1   ; cifra_15: una cifra (1-10, o 0 en blanco) y 8 a la derecha
	ld c,0ffh		;a1e4   ; y la baja, siempre
	ld a,(hl)			;a1e6
cifra_15:		; una cifra (1-10, o 0 en blanco) y 8 a la derecha
	and 00fh		;a1e7   ; ...una cifra (1-10, o 0 en blanco) con p15:A259 y 8 a la derecha
	jr z,L_A1ED		;a1e9
	ld c,0ffh		;a1eb   ; una cifra que no es 0: a partir de aqui todas
L_A1ED:
	add a,001h		;a1ed   ; cifra + 1 (en la fuente 0 es el blanco), o 0 si C = 0
	and c			;a1ef
	call caracter_15		;a1f0   ; caracter_15: un caracter de la fuente de la pagina 1 a la 1
	ld a,d			;a1f3   ; la x 8 mas
	add a,008h		;a1f4
	ld d,a			;a1f6
	ret			;a1f7
tres_cifras_con_ceros:		; tres cifras BCD sin quitar ceros
	ld c,0ffh		;a1f8   ; tres cifras BCD sin quitar ceros
	ld a,(hl)			;a1fa   ; la cifra baja del primero
	call cifra_15		;a1fb   ; cifra_15: una cifra (1-10, o 0 en blanco) y 8 a la derecha
	inc hl			;a1fe
	ld c,0ffh		;a1ff
	ld a,(hl)			;a201   ; las dos del segundo
	rra			;a202
	rra			;a203
	rra			;a204
	rra			;a205
	call cifra_15		;a206   ; cifra_15: una cifra (1-10, o 0 en blanco) y 8 a la derecha
	ld c,0ffh		;a209
	ld a,(hl)			;a20b
	jr cifra_15		;a20c
L_A20E:
	ld de,00040h		;a20e   ; una fila de caracteres 0 (en blanco) desde (0x40, 0)
	ld bc,00001h		;a211
L_A214:
	push bc			;a214   ; la fila: el caracter 0 (blanco) de (0, 0)...
	push de			;a215
	ld hl,00000h		;a216
	ld bc,00808h		;a219
	ld a,005h		;a21c   ; ...copiado de la pagina 1 a la 1...
	call 04d66h		;a21e   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
	pop de			;a221
	call 04f6fh		;a222   ; ...8 a la derecha cada vez
	pop bc			;a225
	djnz L_A214		;a226   ; B veces
	dec c			;a228
	jr z,L_A214		;a229
	ret			;a22b
L_A22C:
	inc hl			;a22c
texto_15:		; un texto con [x y] y caracteres de la fuente hasta 0xFF
	ld d,(hl)			;a22d   ; [x y]...
	inc hl			;a22e
	ld e,(hl)			;a22f
L_A230:
	inc hl			;a230
	ld a,(hl)			;a231   ; 0xFF acaba; 0xFE da otra posicion
	cp 0ffh		;a232
	ret z			;a234
	cp 0feh		;a235
	jr z,L_A22C		;a237
	call caracter_15		;a239   ; el caracter y la siguiente columna
	call 04f6fh		;a23c   ; siguiente_columna: D += 8; si da la vuelta, E += 8
	jr L_A230		;a23f
diez_letras:		; 10 letras en ASCII (el '$' acaba)
	ld b,00ah		;a241   ; 10 letras en ASCII (el '$' acaba)
L_A243:
	call 09834h		;a243   ; cada letra ASCII a la fuente (p14:9834)
	push af			;a246
	ld a,(hl)			;a247   ; un '$' acaba: esta es la ultima vuelta
	cp 024h		;a248
	jr nz,L_A24E		;a24a
	ld b,001h		;a24c
L_A24E:
	pop af			;a24e
	inc hl			;a24f
	call caracter_15		;a250   ; caracter_15: un caracter de la fuente de la pagina 1 a la 1
	call 04f6fh		;a253   ; siguiente_columna: D += 8; si da la vuelta, E += 8
	djnz L_A243		;a256
	ret			;a258
caracter_15:		; un caracter de la fuente de la pagina 1 a la 1
	push bc			;a259   ; un caracter de la fuente 0x38 de la pagina 1 a la 1 (A' = 5)
	push hl			;a25a
	push de			;a25b
	call 04f5eh		;a25c   ; la posicion de A en la hoja de la fuente (p00:4F5E)
	ld bc,00808h		;a25f   ; 8x8 de la pagina 1 a la 1 con HMMM
	ld a,005h		;a262
	call 04d66h		;a264   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
	pop de			;a267
	pop hl			;a268
	pop bc			;a269
	ret			;a26a
L_A26B:
	ld hl,(0ecf0h)		;a26b   ; la caida de 4 sprites: la y (0xECF0) mas la velocidad (0xECF2), que crece
	ld de,(0ecf2h)		;a26e   ; la y en 16 bits (0xECF0) + la velocidad (0xECF2)
	add hl,de			;a272
	ld (0ecf0h),hl		;a273
	ld a,h			;a276   ; la y de los 4 sprites (0xE140-0xE14C)
	ld (0e140h),a		;a277
	ld (0e144h),a		;a27a
	ld (0e148h),a		;a27d
	ld (0e14ch),a		;a280
	ld hl,00020h		;a283   ; la velocidad crece 0x20: cae cada vez mas deprisa
	add hl,de			;a286
	ld (0ecf2h),hl		;a287
	ret			;a28a
L_A28B:
	ld hl,(0dd88h)		;a28b   ; el porcentaje de victorias: las victorias...
	ld a,(hl)			;a28e   ; las victorias del equipo, en binario
	call victorias_de		;a28f   ; victorias_de: HL = las victorias de la ficha del equipo A (+11)
	call bcd_a_binario		;a292   ; bcd_a_binario: A = el BCD de 3 cifras de HL en binario
	ld hl,0e365h		;a295   ; ...entre los partidos (0xE365)...
	ld e,(hl)			;a298
	ld d,000h		;a299
	ld l,a			;a29b
	ld h,d			;a29c
	exx			;a29d   ; en los otros registros: E361-E362 a cero para el resultado
	ld bc,00002h		;a29e
	ld hl,0e360h		;a2a1
	ld de,0e361h		;a2a4
	ld (hl),000h		;a2a7
	ldir		;a2a9
	ld hl,0e360h		;a2ab
	exx			;a2ae
	ld a,l			;a2af   ; sin victorias, 0
	or a			;a2b0
	jr z,L_A2EE		;a2b1
	ld b,004h		;a2b3   ; ...tres cifras de la division larga...
L_A2B5:
	ld c,0ffh		;a2b5   ; C = cuantas veces cabe DE en HL
	and a			;a2b7
L_A2B8:
	inc c			;a2b8
	sbc hl,de		;a2b9
	jr z,L_A2D6		;a2bb
	jr nc,L_A2B8		;a2bd   ; si no es exacta, se deshace la ultima resta
	add hl,de			;a2bf
	ld a,b			;a2c0   ; la primera vuelta no se guarda (es la parte entera)
	cp 004h		;a2c1
	jr z,L_A2CA		;a2c3
	ld a,c			;a2c5   ; la cifra al resultado
	exx			;a2c6
	ld (hl),a			;a2c7
	inc hl			;a2c8
	exx			;a2c9
L_A2CA:
	push de			;a2ca   ; ...el resto x 10 cada vez...
	add hl,hl			;a2cb   ; HL x 10: HL x 2...
	ld d,h			;a2cc
	ld e,l			;a2cd
	add hl,hl			;a2ce
	add hl,hl			;a2cf
	add hl,de			;a2d0   ; ...x 4 + x 2...
	pop de			;a2d1
	djnz L_A2B5		;a2d2   ; ...cuatro vueltas
	jr L_A2E0		;a2d4
L_A2D6:
	ld a,004h		;a2d6   ; ...exacta: la cifra que toca...
	cp b			;a2d8
	jr z,L_A2FA		;a2d9
	inc c			;a2db
	ld a,c			;a2dc
	exx			;a2dd
	ld (hl),a			;a2de
	exx			;a2df
L_A2E0:
	ld hl,0e361h		;a2e0   ; ...las dos primeras juntas en BCD...
	ld a,(hl)			;a2e3
	rla			;a2e4   ; la primera cifra a la mitad alta...
	rla			;a2e5
	rla			;a2e6
	rla			;a2e7
	and 0f0h		;a2e8
	inc hl			;a2ea
	add a,(hl)			;a2eb   ; ...mas la segunda
	dec hl			;a2ec
	ld (hl),a			;a2ed   ; en 0xE361
L_A2EE:
	ld hl,0e360h		;a2ee   ; ...y se pinta en (0xBC, 0xE370)
	ld a,(0e370h)		;a2f1
	ld e,a			;a2f4
	ld d,0bch		;a2f5
	jp tres_cifras_con_ceros		;a2f7   ; tres_cifras_con_ceros: tres cifras BCD sin quitar ceros
L_A2FA:
	ld a,(0e370h)		;a2fa   ; todas: un 1 (1.000) en 0xB0
	ld e,a			;a2fd
	ld d,0b0h		;a2fe
	ld a,002h		;a300   ; el caracter 2 (la cifra 1) en (0xB0, y)
	call caracter_15		;a302   ; caracter_15: un caracter de la fuente de la pagina 1 a la 1
	jr L_A2EE		;a305   ; y las tres cifras de 0xE360 detras

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
	ld a,(0d74ch)		;a43b   ; segun el despachador de los menus (0xD74C)
	call 04220h		;a43e   ; la tabla de pasos de los menus (p15:A441)

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
	ld hl,0d74ch		;a44b   ; el paso anterior de los menus
	dec (hl)			;a44e   ; el despachador uno atras...
	inc hl			;a44f   ; ...y el subpaso a 0
	ld (hl),000h		;a450
	ret			;a452
L_A453:
	call L_A456		;a453   ; dos pasos mas...
L_A456:
	ld hl,0d74ch		;a456   ; ...el siguiente, con el subpaso a 0
	inc (hl)			;a459   ; el despachador uno adelante...
	inc hl			;a45a   ; ...y el subpaso a 0
	ld (hl),000h		;a45b
	ret			;a45d
L_A45E:
	ld hl,0d74dh		;a45e   ; el subpaso siguiente
	inc (hl)			;a461   ; el subpaso + 1
	ret			;a462
L_A463:
	ld a,(0d759h)		;a463   ; el paso de la opcion (0xD759 + 2)
	add a,002h		;a466   ; el despachador = la opcion + 2...
	ld (0d74ch),a		;a468   ; guarda el despachador de los menus (y 0xD74D)
	xor a			;a46b   ; ...con el subpaso a 0
	ld (0d74dh),a		;a46c
	ret			;a46f
L_A470:
	call 04b9fh		;a470   ; la eleccion de equipos para jugar: pantalla borrada, menus a cero...
	xor a			;a473   ; los 16 bytes de 0xD74C-0xD75B a cero
	ld hl,0d74ch		;a474   ; apunta a el despachador de los menus (y 0xD74D)
	ld de,0d74dh		;a477   ; los 16 bytes desde 0xD74C a 0
	ld (hl),a			;a47a
	ld bc,0000fh		;a47b
	ldir		;a47e
	ld (0da6bh),a		;a480   ; 0xDA6B y la opcion a 0
	ld (0d759h),a		;a483   ; guarda la opcion del menu de PENNANT
	ld de,0f800h		;a486   ; ...la flecha (32 bytes de 0xA6F0), el texto de 0xA710...
	ld hl,0a6f0h		;a489   ; 32 bytes: el dibujo 0 de los sprites
	ld bc,00020h		;a48c
	call 04ab7h		;a48f   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	ld hl,0a710h		;a492   ; el texto de 0xA710
	call 04ea6h		;a495   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld hl,00050h		;a498   ; una linea horizontal en la y 0x50, color 0x0D
	ld c,00dh		;a49b   ; color 0x0D
	ld b,000h		;a49d
	call 04c91h		;a49f   ; linea: orden LINE (0x70): una linea horizontal desde (H, L) de B puntos (0 = 256) del color C
	ld hl,008c6h		;a4a2   ; un marco desde (0xC6, 0x08), color 0x0D
	ld c,00dh		;a4a5
	ld de,0f20ch		;a4a7   ; de 0xF2 x 0x0C
	call 04cfeh		;a4aa   ; marco: un marco de lineas: HL la esquina, DE el tamano
	ld hl,03ec6h		;a4ad   ; cuatro lineas verticales de 12 en la y 0xC6: x 0x3E, 0x6E, 0x9E y 0xCE
	ld c,00dh		;a4b0   ; color 0x0D, 12 de largo
	ld b,00ch		;a4b2
	call 04cc7h		;a4b4   ; linea_vertical: orden LINE (0x70): una linea vertical desde (H, L) de B puntos del color C
	ld hl,06ec6h		;a4b7
	ld c,00dh		;a4ba
	ld b,00ch		;a4bc
	call 04cc7h		;a4be   ; linea_vertical: orden LINE (0x70): una linea vertical desde (H, L) de B puntos del color C
	ld hl,09ec6h		;a4c1
	ld c,00dh		;a4c4
	ld b,00ch		;a4c6
	call 04cc7h		;a4c8   ; linea_vertical: orden LINE (0x70): una linea vertical desde (H, L) de B puntos del color C
	ld hl,0cec6h		;a4cb
	ld c,00dh		;a4ce
	ld b,00ch		;a4d0
	call 04cc7h		;a4d2   ; linea_vertical: orden LINE (0x70): una linea vertical desde (H, L) de B puntos del color C
	ld a,(0de02h)		;a4d5   ; ...el titulo: el ordenador solo (0xA770), dos jugadores (0xA72B) o uno (0xA74F)...
	bit 3,a		;a4d8   ; bit 3 de 0xDE02 (el ordenador solo): el titulo de 0xA770
	ld hl,0a770h		;a4da
	jr nz,L_A4E9		;a4dd
	bit 5,a		;a4df   ; bit 5 (dos jugadores): 0xA72B; si no, 0xA74F
	ld hl,0a74fh		;a4e1
	jr z,L_A4E9		;a4e4
	ld hl,0a72bh		;a4e6
L_A4E9:
	call 04ea6h		;a4e9   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	call L_A67A		;a4ec   ; ...la opcion y al paso siguiente
	jp L_A456		;a4ef
L_A4F2:
	call L_A4FD		;a4f2   ; los nombres y al paso siguiente
	jp L_A456		;a4f5
L_A4F8:
	call L_A532		;a4f8   ; los equipos de serie (sin la lista)
	jr L_A503		;a4fb
L_A4FD:
	call L_A532		;a4fd   ; los equipos de serie (p15:A532) y la lista (p13:6A0D)...
	call 06a0dh		;a500   ; lista_de_jugadores: la lista de jugadores desde 0xDAAE
L_A503:
	ld hl,0da6ch		;a503   ; ...los dos elegidos en blanco y el cursor
	ld (hl),020h		;a506   ; 0xDA6C-0xDA82 en blanco (22 espacios): los dos nombres elegidos
	ld de,0da6dh		;a508
	ld bc,00015h		;a50b
	ldir		;a50e
	ld de,0f600h		;a510   ; 3 bytes de atributos (0xA52F) al sprite 0: la flecha
	ld hl,0a52fh		;a513
	ld bc,00003h		;a516
	call 04ab7h		;a519   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	ld hl,0f604h		;a51c   ; el sprite 1 fuera (y = 0xD8: no se pinta ninguno mas)
	ld a,0d8h		;a51f
	call 04ae3h		;a521   ; byte_a_vram: escribe A en la VRAM HL
	ld hl,0f400h		;a524   ; los colores del sprite 0: 16 lineas de color 7
	ld a,007h		;a527
	ld bc,00010h		;a529
	jp 04acah		;a52c

; ----------------------------------------------------------------------
; DATOS copia_A52F: 3 bytes que p00:4AB7 copia tal cual a la VRAM 0xF600; lo
;   leen p15:A519 (3 bytes)
;   0xa52f..0xa532  (3 bytes)
DATA_copia_A52F:
	defb 0e0h,000h,000h	; a52f	los atributos de la flecha: y, x y dibujo

; ======================================================================
; CODIGO 0xa532..0xa5a9  (119 bytes)
; ======================================================================


L_A532:
	ld hl,062d7h		;a532   ; los 6 nombres de serie a 0xDAAE (y 0x24 al final), 6 en la lista, p14:81FC, el sonido 0x2E y ninguno elegido
	ld de,0daaeh		;a535   ; apunta a los nombres de los equipos (11 letras cada uno)
	ld bc,00042h		;a538
	ldir		;a53b
	ld a,024h		;a53d   ; un '$' al final de la lista
	ld (de),a			;a53f
	ld a,006h		;a540   ; 0xD2B2 = 6 y el directorio (p14:81FC)
	ld (0d2b2h),a		;a542   ; guarda cuantos nombres hay en la lista de equipos (los 6 de serie y los grabados)
	call 081fch		;a545
	ld a,02eh		;a548   ; el sonido 0x2E
	call 057ffh		;a54a   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	ld hl,0d70ah		;a54d   ; apunta a los 6 equipos elegidos (0xFF libre)
	ld de,0d70bh		;a550
	ld (hl),0ffh		;a553   ; los 6 equipos elegidos a 0xFF: ninguno
	ld bc,00005h		;a555
	ldir		;a558
	ret			;a55a
L_A55B:
	call L_A663		;a55b   ; opcion 0: el visitante con el boton...
	ld a,(0d759h)		;a55e   ; lee la opcion del menu de PENNANT
	or a			;a561   ; si la opcion ya no es esta, a su paso
	jp nz,L_A463		;a562
	call 06938h		;a565   ; la lista se mueve con el mando (p13:6938)
	call 06a0dh		;a568   ; lista_de_jugadores: la lista de jugadores desde 0xDAAE
	ld a,(0de06h)		;a56b   ; lee los botones recien pulsados del mando 1 / cursores
	and 010h		;a56e
	ret z			;a570   ; sin el boton, nada
	ld hl,0d70ah		;a571   ; ...en 0xD70A
	ld e,000h		;a574
	call L_A5DA		;a576   ; el elegido y sus letras
	call L_A603		;a579   ; se marca en la lista
	jp 06922h		;a57c   ; y la opcion siguiente (p13:6922)
L_A57F:
	call L_A663		;a57f   ; opcion 1: el local, en 0xD70B
	ld a,(0d759h)		;a582   ; lee la opcion del menu de PENNANT
	dec a			;a585
	jp nz,L_A463		;a586   ; si la opcion no es esta, a su paso
	call 06938h		;a589
	call 06a0dh		;a58c   ; lista_de_jugadores: la lista de jugadores desde 0xDAAE
	ld a,(0de06h)		;a58f   ; lee los botones recien pulsados del mando 1 / cursores
	and 010h		;a592
	ret z			;a594
	ld hl,0d70bh		;a595   ; el local (E = 1)
	ld e,001h		;a598
	call L_A5DA		;a59a
	call L_A603		;a59d
	jp 06922h		;a5a0
L_A5A3:
	ld a,(0d74dh)		;a5a3   ; el subpaso de 0xD74D
	call 04220h		;a5a6   ; la tabla de subpasos (p15:A5A9)

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
	call L_A663		;a5ad   ; opcion 2: con el boton y los dos elegidos, al subpaso siguiente
	ld a,(0d759h)		;a5b0   ; lee la opcion del menu de PENNANT
	sub 002h		;a5b3
	jp nz,L_A463		;a5b5   ; si la opcion no es esta, a su paso
	ld a,(0de06h)		;a5b8   ; lee los botones recien pulsados del mando 1 / cursores
	and 010h		;a5bb
	ret z			;a5bd   ; sin el boton, nada
	ld hl,(0d70ah)		;a5be   ; lee los 6 equipos elegidos (0xFF libre) y el byte siguiente (16 bits)
	ld a,h			;a5c1   ; sin visitante (0xFF), nada
	inc a			;a5c2
	ret z			;a5c3
	ld a,l			;a5c4
	inc a			;a5c5   ; sin local, nada
	ret z			;a5c6
	jp nz,L_A45E		;a5c7   ; los dos elegidos: el subpaso siguiente
	ret			;a5ca
L_A5CB:
	call L_A630		;a5cb   ; copia los dos nombres (p15:A630), el texto de 0xA76A y 0xE1D1 = 1
	ld hl,0a76ah		;a5ce
	call 04ea6h		;a5d1   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld a,001h		;a5d4   ; 0xE1D1 = 1: ya esta
	ld (0e1d1h),a		;a5d6   ; guarda la marca de acabado de los pasos; en el lanzamiento, su paso (p03:A525)
	ret			;a5d9
L_A5DA:
	ld a,(0d74fh)		;a5da   ; el equipo de la fila: no el mismo que el otro...
	ld bc,(0d70ah)		;a5dd   ; lee los 6 equipos elegidos (0xFF libre) y el byte siguiente (16 bits)
	cp b			;a5e1   ; el que ya es visitante o local, no
	ret z			;a5e2
	cp c			;a5e3
	ret z			;a5e4
	ld (hl),a			;a5e5   ; el equipo al hueco HL
	ld a,e			;a5e6
	call 06afdh		;a5e7   ; por_once: HL = A x 11
	ld bc,0da6ch		;a5ea   ; el sitio de su nombre: 0xDA6C + E x 11
	add hl,bc			;a5ed
	ex de,hl			;a5ee
	ld a,(0d74fh)		;a5ef   ; lee la fila del cursor de las listas
	call 06afdh		;a5f2   ; por_once: HL = A x 11
	ld bc,0daaeh		;a5f5   ; el nombre de la lista: 0xDAAE + fila x 11
	add hl,bc			;a5f8
	ld bc,0000bh		;a5f9   ; 11 letras
	ldir		;a5fc
	ld a,027h		;a5fe   ; y el sonido 0x27
	jp 057ffh		;a600   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_A603:
	ld hl,0da6ch		;a603   ; los dos nombres elegidos (o espacios) en (0x20, 0x80) y (0x38, 0x80)
	ld de,08020h		;a606   ; el visitante en (0x20, 0x80)
	ld a,(0d70ah)		;a609   ; lee los 6 equipos elegidos (0xFF libre)
	inc a			;a60c   ; sin visitante (0xFF), el texto en blanco de 0x6AAB
	jr nz,L_A612		;a60d
	ld hl,06aabh		;a60f
L_A612:
	call diez_letras_2		;a612   ; diez_letras_2: 10 letras ASCII en la fuente
	ld hl,0da77h		;a615   ; el local (0xDA77) en (0x38, 0x80)
	ld de,08038h		;a618
	ld a,(0d70bh)		;a61b
	inc a			;a61e
	jr nz,L_A624		;a61f
	ld hl,06aabh		;a621
L_A624:
	call diez_letras_2		;a624   ; diez_letras_2: 10 letras ASCII en la fuente
	call L_A669		;a627   ; la opcion (p15:A669) y la lista
	call 06a0dh		;a62a   ; lista_de_jugadores: la lista de jugadores desde 0xDAAE
	jp L_A463		;a62d   ; al paso de la opcion
L_A630:
	ld hl,0d680h		;a630   ; 0xD680 a cero y los nombres a 0xD680 (visitante) y 0xD740 (local)
	ld de,0d681h		;a633   ; 11 bytes de 0xD680 a cero
	ld (hl),000h		;a636
	ld bc,0000ah		;a638
	ldir		;a63b
	ld de,0d680h		;a63d   ; el nombre del visitante a 0xD680...
	ld hl,0da6ch		;a640
	ld bc,0000bh		;a643
	ldir		;a646
	ld de,0d740h		;a648   ; ...y el del local a 0xD740
	ld bc,0000bh		;a64b
	ldir		;a64e
	ret			;a650
diez_letras_2:		; 10 letras ASCII en la fuente
	ld b,00ah		;a651   ; 10 letras ASCII en la fuente
L_A653:
	push bc			;a653
	call 09834h		;a654   ; la letra a la fuente y se pinta
	call 04f1ch		;a657   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld a,d			;a65a   ; la x 8 mas
	add a,008h		;a65b
	ld d,a			;a65d
	inc hl			;a65e
	pop bc			;a65f
	djnz L_A653		;a660
	ret			;a662
L_A663:
	ld a,(0de06h)		;a663   ; con el boton 2...
	and 020h		;a666   ; sin el boton 2, nada
	ret z			;a668
L_A669:
	ld a,(0d759h)		;a669   ; ...la opcion siguiente (0-2), el sonido 0x26...
	inc a			;a66c
	cp 003h		;a66d   ; despues de la 2, la 0
	jr nz,L_A672		;a66f
	xor a			;a671
L_A672:
	ld (0d759h),a		;a672   ; guarda la opcion del menu de PENNANT
	ld a,026h		;a675   ; el sonido 0x26
	call 057ffh		;a677   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_A67A:
	ld a,(0de02h)		;a67a   ; ...el titulo y el texto de la opcion (tabla 0xA6BE, o 0xA6C6 con el ordenador solo)
	bit 3,a		;a67d   ; el titulo segun el modo: ordenador solo, dos jugadores o uno
	ld hl,0a770h		;a67f
	jr nz,L_A68E		;a682
	bit 5,a		;a684
	ld hl,0a74fh		;a686
	jr z,L_A68E		;a689
	ld hl,0a72bh		;a68b
L_A68E:
	call 04ea6h		;a68e   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld a,(0de02h)		;a691   ; lee las marcas del modo: bit 6 un jugador, 5 dos jugadores, 4 PENNANT (contra el ordenador), 3 el ordenador solo
	bit 3,a		;a694   ; con el ordenador solo, los textos de 0xA6C6
	jr nz,L_A6B6		;a696
	ld a,(0d759h)		;a698   ; lee la opcion del menu de PENNANT
	cp 001h		;a69b   ; la opcion 1 con un jugador: el texto 3
	jr nz,L_A6A8		;a69d
	ld hl,0de02h		;a69f   ; apunta a las marcas del modo: bit 6 un jugador, 5 dos jugadores, 4 PENNANT (contra el ordenador), 3 el ordenador solo
	bit 5,(hl)		;a6a2
	jr nz,L_A6A8		;a6a4
	ld a,003h		;a6a6
L_A6A8:
	ld hl,0a6beh		;a6a8   ; los textos de cada opcion (0xA6BE)
L_A6AB:
	add a,a			;a6ab   ; la palabra A de la tabla HL...
	call 04216h		;a6ac   ; hl_mas_a: HL = HL + A
	ld e,(hl)			;a6af
	inc hl			;a6b0
	ld d,(hl)			;a6b1
	ex de,hl			;a6b2   ; ...es el texto que se pinta
	jp 04ea6h		;a6b3   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
L_A6B6:
	ld a,(0d759h)		;a6b6   ; lee la opcion del menu de PENNANT
	ld hl,0a6c6h		;a6b9
	jr L_A6AB		;a6bc

; ----------------------------------------------------------------------
; DATOS resto_A6BE: lo apuntan con el banco puesto p15:A6A8 (0xA6BE), p13:61EB
;   (0xA6C6), p15:A6B9 (0xA6C6); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p15:A6A8, p13:61EB, p15:A6B9 (50 bytes)
;   0xa6be..0xa6f0  (50 bytes)
DATA_resto_A6BE:
	defb 0cch,0a6h,0d1h,0a6h,0dch,0a6h,0d6h,0a6h,0e2h,0a6h,0e9h,0a6h,0dch,0a6h,00ah,0c8h	; a6be  ................	los 4 textos de las opciones (y 4 del ordenador solo en 0xA6C6)
	defb 0a2h,0beh,0ffh,042h,0c8h,0a3h,0beh,0ffh,042h,0c8h,0b1h,0beh,0c3h,0ffh,072h,0c8h	; a6ce  ...B....B.....r.
	defb 0b3h,0bch,0b2h,0ffh,00ah,0c8h,0b1h,0beh,0c3h,0a2h,0ffh,042h,0c8h,0b1h,0beh,0c3h	; a6de  ...........B....
	defb 0a3h,0ffh	; a6ee

; ----------------------------------------------------------------------
; DATOS copia_A6F0: 32 bytes que p00:4AB7 copia tal cual a la VRAM 0xF800; lo
;   leen p15:A48F (32 bytes)
;   0xa6f0..0xa710  (32 bytes)
DATA_copia_A6F0:
	defb 010h,018h,01ch,01eh,01eh,01ch,018h,010h,000h,000h,000h,000h,000h,000h,000h,000h	; a6f0  ................	los 32 bytes del dibujo de la flecha
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a700  ................

; ----------------------------------------------------------------------
; DATOS texto_A710: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p13:6548, p15:A495 (27 bytes)
;   0xa710..0xa72b  (27 bytes)
DATA_texto_A710:
	defb 03ch,000h,022h,013h,00fh,01bh,000h,01ch,00fh,01bh,013h,000h,021h,013h,01ah,013h	; a710  <.".........!...	los textos del menu ([x y], letras y 0xFF)
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
	xor a			;a792   ; el campeon de PENNANT: la lista de 0xDD80 a 0xFF...
	ld (0dd9dh),a		;a793
	dec a			;a796   ; 0xDD80-0xDD86 a 0xFF: la lista del campeon vacia
	ld hl,0dd80h		;a797
	ld de,0dd81h		;a79a
	ld (hl),a			;a79d
	ld bc,00006h		;a79e
	ldir		;a7a1
	call 06b5bh		;a7a3   ; ...los partidos de cada uno: (equipos - 1) x 0xD6DE...
	dec b			;a7a6   ; 0xE360 = los partidos de cada equipo: 0xD6DE x (equipos - 1)
	ld a,(0d6deh)		;a7a7
	ld c,a			;a7aa
	xor a			;a7ab
L_A7AC:
	add a,c			;a7ac
	djnz L_A7AC		;a7ad
	ld (0e360h),a		;a7af
	ld a,(0d6e1h)		;a7b2   ; ...con varios jugadores, si alguno no ha acabado los suyos, aun no...
	dec a			;a7b5   ; con uno solo, otra cuenta
	jr z,L_A7E2		;a7b6
	ld hl,0d6e3h		;a7b8   ; los partidos jugados de cada uno (6 bytes cada fila de 0xD6E3)
	call 06b5bh		;a7bb   ; cuantos_equipos: B = cuantos equipos juegan: 0xD6E1, o 6 con uno solo
L_A7BE:
	push hl			;a7be
	push bc			;a7bf
	call 06b5bh		;a7c0   ; cuantos_equipos: B = cuantos equipos juegan: 0xD6E1, o 6 con uno solo
	xor a			;a7c3
L_A7C4:
	add a,(hl)			;a7c4   ; los suma
	inc hl			;a7c5
	djnz L_A7C4		;a7c6
	ld hl,0e360h		;a7c8
	cp (hl)			;a7cb   ; si alguno no los ha jugado todos...
	jr c,L_A7D9		;a7cc
	pop bc			;a7ce
	pop hl			;a7cf
	ld de,00006h		;a7d0   ; ...la fila siguiente
	add hl,de			;a7d3
	djnz L_A7BE		;a7d4
	jp L_A864		;a7d6   ; todos jugados: se acaba
L_A7D9:
	pop bc			;a7d9   ; ...p15:A81E (puede alcanzarle alguien?)
	pop hl			;a7da
	call L_A81E		;a7db   ; si nadie puede alcanzar al primero, tambien se acaba
	ret nc			;a7de
	jp L_A864		;a7df
L_A7E2:
	ld a,(0e360h)		;a7e2   ; con uno: cuando la jornada (0xD6DC) llega al final...
	ld hl,0d6dch		;a7e5   ; apunta a el equipo del jugador en PENNANT (bit 0)
	cp (hl)			;a7e8   ; la ultima jornada: se acaba
	jr z,L_A7EF		;a7e9
	call L_A81E		;a7eb   ; si no, solo si nadie le puede alcanzar
	ret nc			;a7ee
L_A7EF:
	ld hl,0e195h		;a7ef   ; ...su equipo contra la clasificacion de 0xD730...
	ld a,(0d6dch)		;a7f2   ; la columna de su equipo (visitante 0xE195 o local 0xE197)
	rra			;a7f5
	jr c,L_A7FB		;a7f6
	ld hl,0e197h		;a7f8
L_A7FB:
	ld de,0d731h		;a7fb   ; la clasificacion (0xD730, dos bytes por puesto)
	call 06b5bh		;a7fe   ; cuantos_equipos: B = cuantos equipos juegan: 0xD6E1, o 6 con uno solo
	dec b			;a801
L_A802:
	ld a,(de)			;a802   ; el equipo del puesto y su marca
	ld c,a			;a803
	dec de			;a804
	ld a,(de)			;a805
	cp (hl)			;a806   ; el suyo: se acaba
	jr z,L_A864		;a807
	inc de			;a809
	inc de			;a80a
	ld a,(de)			;a80b   ; si la marca del siguiente es otra, no hay empate
	cp c			;a80c
	jr nz,L_A813		;a80d
	djnz L_A802		;a80f
	jr L_A864		;a811
L_A813:
	ld a,002h		;a813   ; ...empate en cabeza: 0xDD9D = 2 (desempate) y el rival a 0xDD80
	ld (0dd9dh),a		;a815   ; el desempate: el primero a la lista
	ld de,0dd80h		;a818
	ldi		;a81b
	ret			;a81d
L_A81E:
	call 06b5bh		;a81e   ; puede alcanzar alguien al primero? las victorias de cada uno (p15:ADD0)...
	ld a,b			;a821   ; por cada equipo de la clasificacion (0xD730)...
	ld hl,0d730h		;a822
	ld de,0e340h		;a825   ; apunta a variable de paso (cada rutina la usa a su manera)
	ld bc,0e350h		;a828
L_A82B:
	push af			;a82b
	ld a,(hl)			;a82c
	exx			;a82d
	call victorias_de		;a82e   ; ...sus victorias...
	call bcd_a_binario		;a831   ; bcd_a_binario: A = el BCD de 3 cifras de HL en binario
	ld e,a			;a834   ; ...a 0xE340...
	inc hl			;a835   ; ...y sus derrotas
	inc hl			;a836
	call bcd_a_binario		;a837   ; bcd_a_binario: A = el BCD de 3 cifras de HL en binario
	add a,e			;a83a   ; los partidos jugados
	ld b,a			;a83b
	ld a,(0e360h)		;a83c   ; ...y los partidos que le quedan...
	sub b			;a83f
	push af			;a840
	ld a,e			;a841
	exx			;a842
	ld (de),a			;a843   ; las victorias a 0xE340 + n...
	pop af			;a844
	ld (bc),a			;a845   ; ...y lo que le queda por jugar a 0xE350 + n
	inc hl			;a846
	inc hl			;a847
	inc de			;a848
	inc bc			;a849
	pop af			;a84a
	dec a			;a84b
	jr nz,L_A82B		;a84c
	call 06b5bh		;a84e   ; cuantos_equipos: B = cuantos equipos juegan: 0xD6E1, o 6 con uno solo
	dec b			;a851
	ld hl,0e340h		;a852   ; C = las victorias del primero
	ld c,(hl)			;a855
	ld de,0e351h		;a856
	inc hl			;a859
L_A85A:
	ld a,(de)			;a85a   ; las de cada otro mas las que le quedan...
	add a,(hl)			;a85b
	cp c			;a85c
	ret nc			;a85d   ; ...si llegan a las del primero, aun puede (sin carry)
	inc de			;a85e
	inc hl			;a85f
	djnz L_A85A		;a860
	scf			;a862   ; nadie puede: carry
	ret			;a863
L_A864:
	ld a,001h		;a864   ; se acaba: 0xDD9D = 1 y los primeros empatados a la lista 0xDD80
	ld (0dd9dh),a		;a866
	ld hl,0d730h		;a869
	ld a,(hl)			;a86c   ; las victorias del primero
	call victorias_de		;a86d   ; victorias_de: HL = las victorias de la ficha del equipo A (+11)
	call bcd_a_binario		;a870   ; bcd_a_binario: A = el BCD de 3 cifras de HL en binario
	push af			;a873
	ld hl,0d730h		;a874
	call 06b5bh		;a877   ; cuantos_equipos: B = cuantos equipos juegan: 0xD6E1, o 6 con uno solo
	dec b			;a87a
	pop af			;a87b
L_A87C:
	push bc			;a87c
	exx			;a87d
	ld b,a			;a87e   ; el siguiente de la clasificacion...
	exx			;a87f
	inc hl			;a880
	inc hl			;a881
	push hl			;a882
	ld a,(hl)			;a883
	call victorias_de		;a884   ; ...sus victorias...
	call bcd_a_binario		;a887   ; bcd_a_binario: A = el BCD de 3 cifras de HL en binario
	pop hl			;a88a
	ld b,a			;a88b
	exx			;a88c
	ld a,b			;a88d
	exx			;a88e
	cp b			;a88f   ; ...si son las mismas, empatan en cabeza
	ld a,b			;a890
	pop bc			;a891
	jr nz,L_A896		;a892
	djnz L_A87C		;a894
L_A896:
	push bc			;a896
	call 06b5bh		;a897   ; cuantos_equipos: B = cuantos equipos juegan: 0xD6E1, o 6 con uno solo
	ld a,b			;a89a
	pop bc			;a89b
	sub b			;a89c   ; B = cuantos empatan
	ld b,a			;a89d
	ld hl,0d730h		;a89e
	ld de,0dd80h		;a8a1
L_A8A4:
	ld c,0ffh		;a8a4   ; el equipo de cada uno a 0xDD80 (dos bytes por puesto)
	ldi		;a8a6
	inc hl			;a8a8
	djnz L_A8A4		;a8a9
	ret			;a8ab
L_A8AC:
	ld hl,0d392h		;a8ac   ; las medias del equipo de TEAM EDIT: las dos cifras de cada uno (12 de campo)...
	ld de,0e1b4h		;a8af   ; de 0xD392 a 0xE1B4: 12 jugadores (p15:A9C9)
	ld bc,00c0ch		;a8b2   ; 12 jugadores de 12 bytes
	call columnas_bcd		;a8b5   ; columnas_bcd: B jugadores: tres bytes de cifras (- 1) a dos BCD en DE, saltando C bytes
	ld hl,0e1ech		;a8b8   ; ...ordenadas (p15:BA2D) y la media (p15:AA23) en 0xE1EE...
	ld de,0e1b4h		;a8bb
	ld b,00ch		;a8be   ; las 12 palabras
	call suma_bcd_16		;a8c0   ; suma_bcd_16: la suma BCD de B palabras de DE, guardada en HL
	ex de,hl			;a8c3
	ld hl,0e1ech		;a8c4
	ld bc,03500h		;a8c7   ; 0x3500 - la suma (BCD)
	call resta_bcd		;a8ca   ; resta_bcd: guarda la suma y DE = BC - la suma (BCD)
	ld (0e1eeh),de		;a8cd   ; a 0xE1EE
	ld hl,0d395h		;a8d1   ; ...la segunda columna (0xE1EA) y la tercera (0xE1E6)...
	ld de,0e1cch		;a8d4
	ld bc,00c0dh		;a8d7   ; 12 jugadores, saltando 13
	call columna_bcd		;a8da   ; columna_bcd: B jugadores: dos bytes de cifras (- 1) a un BCD en DE, saltando C bytes
	ld b,00ch		;a8dd
	call suma_bcd		;a8df   ; suma_bcd: HL = la suma BCD de B bytes de DE
	ex de,hl			;a8e2
	ld hl,0e1e8h		;a8e3
	ld bc,00200h		;a8e6   ; 0x0200 - la suma
	call resta_bcd		;a8e9   ; resta_bcd: guarda la suma y DE = BC - la suma (BCD)
	ld (0e1eah),de		;a8ec   ; a 0xE1EA
	ld hl,0d397h		;a8f0
	ld de,0e1d8h		;a8f3
	ld bc,00c0dh		;a8f6   ; 12 jugadores, saltando 13
	call columna_bcd		;a8f9   ; columna_bcd: B jugadores: dos bytes de cifras (- 1) a un BCD en DE, saltando C bytes
	ld b,00ch		;a8fc
	call suma_bcd		;a8fe   ; suma_bcd: HL = la suma BCD de B bytes de DE
	ex de,hl			;a901
	ld hl,0e1e4h		;a902   ; 0x0600 - la suma
	ld bc,00600h		;a905
	call resta_bcd		;a908   ; resta_bcd: guarda la suma y DE = BC - la suma (BCD)
	ld (0e1e6h),de		;a90b   ; a 0xE1E6
	ld hl,0d43bh		;a90f   ; ...las de los 4 lanzadores (0xE1FA, 0xE206, 0xE218)...
	ld de,0e1f0h		;a912
	ld bc,00411h		;a915   ; 4 lanzadores de 19 bytes (0x11 + 2)
	call columnas_bcd		;a918   ; columnas_bcd: B jugadores: tres bytes de cifras (- 1) a dos BCD en DE, saltando C bytes
	ld hl,0e1f8h		;a91b   ; la suma de los 4...
	ld de,0e1f0h		;a91e
	ld b,004h		;a921
	call suma_bcd_16		;a923   ; suma_bcd_16: la suma BCD de B palabras de DE, guardada en HL
	ex de,hl			;a926
	ld hl,0e1f8h		;a927   ; ...y 0x0540 - la suma, a 0xE1FA
	ld bc,00540h		;a92a
	call resta_bcd		;a92d   ; resta_bcd: guarda la suma y DE = BC - la suma (BCD)
	ld (0e1fah),de		;a930
	ld hl,0d43eh		;a934   ; la segunda columna de los lanzadores (0xD43E) a 0xE1FC
	ld de,0e1fch		;a937
	ld bc,00411h		;a93a   ; 4 lanzadores
	call columnas_bcd		;a93d   ; columnas_bcd: B jugadores: tres bytes de cifras (- 1) a dos BCD en DE, saltando C bytes
	ld hl,0e204h		;a940
	ld de,0e1fch		;a943
	ld b,004h		;a946
	call suma_bcd_16		;a948   ; suma_bcd_16: la suma BCD de B palabras de DE, guardada en HL
	ex de,hl			;a94b
	ld hl,0e204h		;a94c   ; 0x0990 - la suma, a 0xE206
	ld bc,00990h		;a94f
	call resta_bcd		;a952   ; resta_bcd: guarda la suma y DE = BC - la suma (BCD)
	ld (0e206h),de		;a955
	ld hl,0d441h		;a959   ; la tercera (0xD441), de una cifra, a 0xE20E
	ld de,0e20eh		;a95c
	ld bc,00412h		;a95f   ; 4 lanzadores, saltando 0x12
	call columna_bcd		;a962   ; columna_bcd: B jugadores: dos bytes de cifras (- 1) a un BCD en DE, saltando C bytes
	ld b,004h		;a965
	call suma_bcd		;a967   ; suma_bcd: HL = la suma BCD de B bytes de DE
	ex de,hl			;a96a
	ld hl,0e216h		;a96b   ; 0x0200 - la suma, a 0xE218
	ld bc,00200h		;a96e
	call resta_bcd		;a971   ; resta_bcd: guarda la suma y DE = BC - la suma (BCD)
	ld (0e218h),de		;a974
	ld hl,0d443h		;a978   ; ...tres valores de los lanzadores con p15:AA31...
	ld de,0e21ah		;a97b
	call cuatro_lanzadores		;a97e   ; cuatro_lanzadores: un valor - 1 de cada uno de los 4 lanzadores (19 bytes) a DE, y su suma
	ld hl,0e21eh		;a981   ; 0x25 - la suma, a 0xE21F
	call resta_de_25		;a984   ; resta_de_25: guarda la suma y A = 0x25 - la suma (BCD)
	ld (0e21fh),a		;a987
	ld hl,0d444h		;a98a   ; el segundo valor (0xD444) a 0xE220; 0x25 - la suma a 0xE225
	ld de,0e220h		;a98d
	call cuatro_lanzadores		;a990   ; cuatro_lanzadores: un valor - 1 de cada uno de los 4 lanzadores (19 bytes) a DE, y su suma
	ld hl,0e224h		;a993
	call resta_de_25		;a996   ; resta_de_25: guarda la suma y A = 0x25 - la suma (BCD)
	ld (0e225h),a		;a999
	ld hl,0d445h		;a99c   ; el tercero (0xD445) a 0xE226; 0x25 - la suma a 0xE22B
	ld de,0e226h		;a99f
	call cuatro_lanzadores		;a9a2   ; cuatro_lanzadores: un valor - 1 de cada uno de los 4 lanzadores (19 bytes) a DE, y su suma
	ld hl,0e22ah		;a9a5
	call resta_de_25		;a9a8   ; resta_de_25: guarda la suma y A = 0x25 - la suma (BCD)
	ld (0e22bh),a		;a9ab
	call L_B76A		;a9ae   ; ...y los pinta todos
	call L_B7F6		;a9b1   ; las columnas, una rutina cada una
	call L_B6FE		;a9b4
	call L_B8D1		;a9b7
	call L_B91B		;a9ba
	call L_B981		;a9bd
	call L_B9FF		;a9c0
	call L_B9C0		;a9c3
	jp L_B84B		;a9c6
columnas_bcd:		; B jugadores: tres bytes de cifras (- 1) a dos BCD en DE, saltando C bytes
	push bc			;a9c9   ; C columnas de dos cifras (decenas y unidades) a BCD menos uno, B filas de C bytes
	inc de			;a9ca   ; el primer byte - 1, en el segundo de DE
	ld a,(hl)			;a9cb
	inc hl			;a9cc
	dec a			;a9cd
	ld (de),a			;a9ce
	dec de			;a9cf
	ld a,(hl)			;a9d0   ; el segundo - 1 en la cifra alta...
	inc hl			;a9d1
	dec a			;a9d2
	rla			;a9d3
	rla			;a9d4
	rla			;a9d5
	rla			;a9d6
	and 0f0h		;a9d7
	or (hl)			;a9d9   ; ...y el tercero - 1 en la baja: BCD
	dec a			;a9da
	ld (de),a			;a9db
	inc de			;a9dc   ; DE dos mas
	inc de			;a9dd
	ld b,000h		;a9de   ; HL salta al jugador siguiente (C bytes)
	add hl,bc			;a9e0
	pop bc			;a9e1
	djnz columnas_bcd		;a9e2
	ret			;a9e4
columna_bcd:		; B jugadores: dos bytes de cifras (- 1) a un BCD en DE, saltando C bytes
	push de			;a9e5   ; lo mismo con una sola columna
L_A9E6:
	push bc			;a9e6
	ld a,(hl)			;a9e7   ; dos cifras: el primero - 1 en la alta...
	inc hl			;a9e8
	dec a			;a9e9
	rla			;a9ea
	rla			;a9eb
	rla			;a9ec
	rla			;a9ed
	and 0f0h		;a9ee
	add a,(hl)			;a9f0   ; ...y el segundo - 1 en la baja
	dec a			;a9f1
	ld (de),a			;a9f2
	ld b,000h		;a9f3   ; al siguiente (C bytes)
	add hl,bc			;a9f5
	inc de			;a9f6
	pop bc			;a9f7
	djnz L_A9E6		;a9f8
	pop de			;a9fa
	ret			;a9fb
cuatro_lanzadores:		; un valor - 1 de cada uno de los 4 lanzadores (19 bytes) a DE, y su suma
	push de			;a9fc   ; 4 valores de los lanzadores (cada 19 bytes) menos uno y su suma
	ld b,004h		;a9fd
L_A9FF:
	push bc			;a9ff
	ld a,(hl)			;aa00   ; el valor - 1
	dec a			;aa01
	ld (de),a			;aa02
	inc de			;aa03
	ld bc,00013h		;aa04   ; el lanzador siguiente (19 bytes)
	add hl,bc			;aa07
	pop bc			;aa08
	djnz L_A9FF		;aa09
	pop de			;aa0b
	ld b,004h		;aa0c   ; y la suma de los 4
	call suma_bcd		;aa0e   ; suma_bcd: HL = la suma BCD de B bytes de DE
	ex de,hl			;aa11
	ret			;aa12
suma_bcd:		; HL = la suma BCD de B bytes de DE
	ld hl,00000h		;aa13   ; HL = la suma BCD de B bytes de DE
L_AA16:
	ld a,(de)			;aa16   ; cada byte sumado en BCD...
	inc de			;aa17
	add a,l			;aa18
	daa			;aa19
	ld l,a			;aa1a
	ld a,000h		;aa1b   ; ...con el acarreo a H
	adc a,h			;aa1d
	daa			;aa1e
	ld h,a			;aa1f
	djnz L_AA16		;aa20
	ret			;aa22
resta_bcd:		; guarda la suma y DE = BC - la suma (BCD)
	ld (hl),e			;aa23   ; la suma a (HL)
	inc hl			;aa24
	ld (hl),d			;aa25
	ld a,c			;aa26   ; la cifra baja: C - E (BCD)
	sub e			;aa27
	daa			;aa28
	ld e,a			;aa29
	ld a,b			;aa2a   ; la alta: B - D con el acarreo
	sbc a,d			;aa2b
	daa			;aa2c
	ld d,a			;aa2d
	ld d,e			;aa2e   ; D y E cambiados
	ld e,a			;aa2f
	ret			;aa30
resta_de_25:		; guarda la suma y A = 0x25 - la suma (BCD)
	ld bc,00025h		;aa31   ; guarda la suma y A = 0x25 - la suma (BCD)
	ld (hl),e			;aa34   ; la suma a (HL)
	inc hl			;aa35
	ld (hl),d			;aa36
	ld a,c			;aa37   ; 0x25 - E (BCD)
	sub e			;aa38
	daa			;aa39
	ret			;aa3a
L_AA3B:
	ld a,(0dd92h)		;aa3b   ; MEDIA SELECT: segun el paso (0xDD92)...
	dec a			;aa3e   ; paso 1
	jr z,L_AA81		;aa3f
	dec a			;aa41   ; paso 2
	jp z,L_AAD6		;aa42
	ld de,02870h		;aa45   ; 6 filas desde (0x70, 0x28)
	ld b,006h		;aa48
	call L_AA69		;aa4a
	ld de,078c0h		;aa4d   ; dos caracteres en blanco en (0xC0, 0x78) y (0xC0, 0x80)
	xor a			;aa50
	call 04f1ch		;aa51   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld d,080h		;aa54
	xor a			;aa56
	call 04f1ch		;aa57   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld hl,07de1h		;aa5a   ; el texto de 0x7DE1
	call 04ea6h		;aa5d   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	xor a			;aa60   ; la flecha en la fila 0
	call L_AABC		;aa61
L_AA64:
	ld hl,0dd92h		;aa64   ; al paso siguiente
	inc (hl)			;aa67
	ret			;aa68
L_AA69:
	push de			;aa69   ; B filas de 10 caracteres en blanco, de 16 en 16
	push bc			;aa6a
	ld b,00ah		;aa6b
L_AA6D:
	push bc			;aa6d
	xor a			;aa6e   ; un blanco y la columna siguiente
	call 04f1ch		;aa6f   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	call 04f6fh		;aa72   ; siguiente_columna: D += 8; si da la vuelta, E += 8
	pop bc			;aa75
	djnz L_AA6D		;aa76
	pop bc			;aa78
	pop de			;aa79
	ld a,e			;aa7a   ; la fila 16 mas abajo
	add a,010h		;aa7b
	ld e,a			;aa7d
	djnz L_AA69		;aa7e
	ret			;aa80
L_AA81:
	call L_AAAB		;aa81   ; paso 1: la flecha; con el boton 1, el soporte (0xDD8F = 0xDD93 + 1)...
	ld a,(0de06h)		;aa84   ; lee los botones recien pulsados del mando 1 / cursores
	and 010h		;aa87   ; sin el boton 1, nada
	ret z			;aa89
	ld a,(0dd93h)		;aa8a   ; el soporte = la fila + 1
	inc a			;aa8d
	ld (0dd8fh),a		;aa8e   ; guarda el soporte elegido: 0 la RAM, 1 el disco, 2 el Game Master 2
	dec a			;aa91   ; la otra fila...
	xor 001h		;aa92
	ld de,02890h		;aa94   ; ...borra la otra opcion y 32 cuadros
	rla			;aa97
	rla			;aa98
	rla			;aa99
	rla			;aa9a
	and 0f0h		;aa9b
	add a,e			;aa9d
	ld e,a			;aa9e
	ld b,001h		;aa9f   ; ...se borra
	call L_AA69		;aaa1
	ld hl,0de04h		;aaa4   ; apunta a la cuenta atras del estado
	ld (hl),020h		;aaa7   ; 32 cuadros de espera
	jr L_AA64		;aaa9
L_AAAB:
	call L_AACF		;aaab   ; la flecha: arriba o abajo cambian 0xDD93...
	ld hl,0dd93h		;aaae
	ld a,(0de06h)		;aab1   ; lee los botones recien pulsados del mando 1 / cursores
	and 003h		;aab4   ; sin arriba ni abajo, igual
	ld a,(hl)			;aab6
	jr z,L_AABC		;aab7
	xor 001h		;aab9   ; cambia de fila
	ld (hl),a			;aabb
L_AABC:
	ld c,0ffh		;aabc   ; ...y se pinta en su fila (y = 16 n + 0x90)
L_AABE:
	rla			;aabe   ; la y = 16 x fila + 0x90
	rla			;aabf
	rla			;aac0
	rla			;aac1
	and 0f0h		;aac2
	add a,090h		;aac4
	ld e,a			;aac6
	ld d,018h		;aac7   ; la x 0x18
	ld hl,07df7h		;aac9   ; el texto de 0x7DF7 (la flecha) con el color C
	jp 04eb5h		;aacc   ; texto_en_de: pinta el texto HL en la posicion DE (sin [x y] delante)
L_AACF:
	ld a,(0dd93h)		;aacf   ; borra la flecha
	ld c,000h		;aad2   ; con color 0 (borrada)
	jr L_AABE		;aad4
L_AAD6:
	ld hl,0de04h		;aad6   ; paso 2: la espera y 0xDD91 = 1
	dec (hl)			;aad9
	ret nz			;aada
	ld a,001h		;aadb   ; y al acabar, 0xDD91 = 1
	ld (0dd91h),a		;aadd
	ret			;aae0
L_AAE1:
	ld a,(0dd92h)		;aae1   ; SI / NO: el primer cuadro, el cursor; luego...
	dec a			;aae4
	jr z,L_AAF2		;aae5   ; paso 1
	call 06187h		;aae7   ; el primero: el recuadro (p13:6187) y SI / NO (p13:6272)
	call 06272h		;aaea
	ld hl,0dd92h		;aaed
	inc (hl)			;aaf0
	ret			;aaf1
L_AAF2:
	call L_AB01		;aaf2   ; ...con el boton 1, 0xDD91 = 1
	ld a,(0de06h)		;aaf5   ; lee los botones recien pulsados del mando 1 / cursores
	and 010h		;aaf8   ; sin el boton 1, nada
	ret z			;aafa
	ld a,001h		;aafb
	ld (0dd91h),a		;aafd
	ret			;ab00
L_AB01:
	ld a,(0de06h)		;ab01   ; arriba o abajo cambian SI / NO y el cursor se mueve
	and 003h		;ab04
	jr z,L_AB10		;ab06   ; sin arriba ni abajo, igual
	ld a,(0dd93h)		;ab08   ; cambia SI / NO
	xor 001h		;ab0b
	ld (0dd93h),a		;ab0d
L_AB10:
	ld a,(0dd93h)		;ab10   ; la y = 16 x fila + D
	rla			;ab13
	rla			;ab14
	rla			;ab15
	rla			;ab16
	and 0f0h		;ab17
	add a,d			;ab19
	jp 069e0h		;ab1a   ; el cursor (p13:69E0)
L_AB1D:
	ld hl,0e190h		;ab1d   ; la demostracion: todo el partido a cero, los equipos...
	ld de,0e191h		;ab20   ; 0xE190-0xEDE4 a cero
	ld bc,00c54h		;ab23
	ld (hl),000h		;ab26
	ldir		;ab28
	call L_AB73		;ab2a   ; los equipos y los ordenes (p15:AB73)
	ld hl,00708h		;ab2d   ; ...0x708 cuadros (0xDE0B), al paso 0, 0xE1A0 = 1 y el sonido 0x2D
	ld (0de0bh),hl		;ab30
	xor a			;ab33   ; el paso 0 (0xECEF)
	ld (0ecefh),a		;ab34
	inc a			;ab37
	ld (0e1a0h),a		;ab38   ; 0xE1A0 = 1
	ld a,02dh		;ab3b   ; y el sonido 0x2D
	jp 057ffh		;ab3d   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_AB40:
	ld a,(0ecefh)		;ab40   ; el paso de 0xECEF
	call 04220h		;ab43   ; la tabla de pasos (p15:AB46)

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
	call 04081h		;ab4a   ; paso 0: el partido (p00:4081) hasta acabar la cuenta; luego p00:4078 y 120 cuadros
	ld hl,(0de0bh)		;ab4d   ; la cuenta (0xDE0B) baja...
	dec hl			;ab50
	ld (0de0bh),hl		;ab51
	ld a,h			;ab54   ; ...hasta 0
	or l			;ab55
	ret nz			;ab56
	ld a,001h		;ab57   ; al acabar, p00:4078 con A = 1...
	call 04078h		;ab59
	ld a,078h		;ab5c   ; ...120 cuadros mas...
	ld (0de0bh),a		;ab5e
	ld hl,0ecefh		;ab61   ; ...y el paso siguiente
	inc (hl)			;ab64
	ret			;ab65
L_AB66:
	call 04081h		;ab66   ; paso 1: el partido 120 cuadros mas y 0xE1A0 = 0
	ld hl,0de0bh		;ab69   ; la cuenta baja (solo el byte bajo)
	dec (hl)			;ab6c
	ret nz			;ab6d
	xor a			;ab6e   ; al acabar, 0xE1A0 = 0
	ld (0e1a0h),a		;ab6f   ; guarda el modo elegido en el menu (no 0: elegido)
	ret			;ab72
L_AB73:
	call 0408ah		;ab73   ; los preparativos: p00:408A, p00:4093, dos equipos (p15:ABB0)...
	call 04093h		;ab76
	call L_ABB0		;ab79   ; los dos equipos y sus fichas (p15:ABB0)
	call L_AB89		;ab7c   ; ...los ordenes de bateo de 0xABA0, el paso 0 y el ordenador solo (0xDE02 = 8)
	xor a			;ab7f   ; la jugada 0
	ld (0e1a1h),a		;ab80   ; guarda el paso de la jugada (y de TEAM EDIT)
	ld a,008h		;ab83   ; el modo: bit 3, el ordenador solo
	ld (0de02h),a		;ab85   ; guarda las marcas del modo: bit 6 un jugador, 5 dos jugadores, 4 PENNANT (contra el ordenador), 3 el ordenador solo
	ret			;ab88
L_AB89:
	ld hl,0aba0h		;ab89   ; el mismo orden de 16 bytes de 0xABA0 a los dos equipos
	ld de,0ec50h		;ab8c   ; apunta a el orden de bateo del visitante (9 numeros de jugador)
	ld bc,00010h		;ab8f
	ldir		;ab92
	ld hl,0aba0h		;ab94   ; el mismo orden para el local
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
	defb 001h,002h,003h,004h,005h,006h,007h,008h,00dh,00ah,00bh,00ch,000h,00eh,00fh,010h	; aba0  ................	el orden de bateo de la demostracion (16 bytes)

; ======================================================================
; CODIGO 0xabb0..0xabe1  (49 bytes)
; ======================================================================


L_ABB0:
	ld hl,0edffh		;abb0   ; dos equipos de la tabla 0xABE1, una pareja distinta cada vez (0xEDFF)...
	inc (hl)			;abb3   ; 0xEDFF avanza en cada demostracion...
	ld a,(hl)			;abb4
	and 00fh		;abb5   ; ...y elige una pareja de las 16 de 0xABE1
	ld de,0d70ah		;abb7   ; apunta a los 6 equipos elegidos (0xFF libre)
	ld hl,0abe1h		;abba
	call 04216h		;abbd   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;abc0   ; el visitante...
	ld (de),a			;abc1
	inc hl			;abc2
	inc de			;abc3
	ld a,(hl)			;abc4   ; ...y el local
	ld (de),a			;abc5
	ld a,(0d70ah)		;abc6   ; ...con sus fichas de 255 bytes de p13:731F
	ld de,0d380h		;abc9   ; apunta a la ficha del visitante (255 bytes de p13:731F: nombre de 11 letras y jugadores)
	call L_ABD5		;abcc
	ld a,(0d70bh)		;abcf   ; la ficha del local
	ld de,0d47fh		;abd2   ; apunta a la ficha del local (255 bytes de p13:731F; en TEAM EDIT, el paso del dialogo de guardar)
L_ABD5:
	ld hl,0731fh		;abd5   ; la ficha del equipo A (la tabla p13:731F) a DE
	call 0556dh		;abd8   ; palabra_a: HL = la palabra A de la tabla HL
	ld bc,000ffh		;abdb   ; 255 bytes
	ldir		;abde
	ret			;abe0

; ----------------------------------------------------------------------
; DATOS resto_ABE1: lo apuntan con el banco puesto p15:ABBA (0xABE1), p00:5C97
;   (0xABF2); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p15:ABBA, p00:5C97 (57 bytes)
;   0xabe1..0xac1a  (57 bytes)
DATA_resto_ABE1:
	defb 000h,001h,002h,003h,004h,005h,003h,001h,004h,002h,000h,005h,001h,004h,000h,002h	; abe1  ................	las 16 parejas de la demostracion (visitante y local)
	defb 005h,08bh,000h,0e4h,000h,091h,000h,0f0h,000h,097h,000h,0fch,000h,09dh,000h,008h	; abf1  ................
	defb 001h,0a3h,000h,014h,001h,0a9h,000h,020h,001h,0afh,000h,02ch,001h,0b5h,000h,038h	; ac01  ....... ...,...8
	defb 001h,0bbh,000h,044h,001h,0c1h,000h,050h,001h	; ac11  ...D...P.

; ======================================================================
; CODIGO 0xac1a..0xb071  (1111 bytes)
; ======================================================================


L_AC1A:
	ld hl,0d6dch		;ac1a   ; la jornada siguiente de PENNANT (0xD6DC): los partidos, el rival...
	inc (hl)			;ac1d
	call L_AC81		;ac1e   ; los partidos jugados (p15:AC81)
	ld a,(0d6e1h)		;ac21   ; con un jugador, los resultados de los otros dos partidos
	dec a			;ac24
	call z,L_AC31		;ac25
	call L_ACF7		;ac28   ; las victorias (p15:ACF7), la clasificacion (p15:AD2A)...
	call L_AD2A		;ac2b
	jp L_ADFA		;ac2e   ; ...y en pantalla
L_AC31:
	ld hl,0d710h		;ac31   ; con un jugador, los otros dos partidos de la jornada se echan a suertes: las carreras al azar (p15:AC7A)...
	call azar_16		;ac34   ; carreras al azar (0-15) del visitante del primero...
	push hl			;ac37
	ld hl,0d712h		;ac38
	call azar_16		;ac3b   ; ...y del local
	pop hl			;ac3e
	cp (hl)			;ac3f   ; ...sin empates: si salen iguales, uno mas a uno de los dos al azar
	jr nz,L_AC4C		;ac40
	ld a,r		;ac42   ; al azar, una carrera mas para uno de los dos
	and 001h		;ac44
	jr nz,L_AC4B		;ac46
	ld hl,0d712h		;ac48
L_AC4B:
	inc (hl)			;ac4b
L_AC4C:
	ld hl,0d714h		;ac4c   ; el segundo partido igual: 0xD714 contra 0xD716
	call azar_16		;ac4f   ; azar_16: un numero al azar de 0 a 15
	push hl			;ac52
	ld hl,0d716h		;ac53
	call azar_16		;ac56   ; azar_16: un numero al azar de 0 a 15
	pop hl			;ac59
	cp (hl)			;ac5a   ; sin empate
	jr nz,L_AC67		;ac5b
	ld a,r		;ac5d
	and 001h		;ac5f
	jr nz,L_AC66		;ac61
	ld hl,0d716h		;ac63
L_AC66:
	inc (hl)			;ac66
L_AC67:
	ld hl,0d710h		;ac67   ; las 4 a BCD
	ld b,004h		;ac6a
L_AC6C:
	push bc			;ac6c
	ld a,(hl)			;ac6d   ; la cifra baja a BCD (p13:646D)
	and 00fh		;ac6e
	call 0646dh		;ac70
	ld (hl),a			;ac73
	inc hl			;ac74   ; cada 2 bytes
	inc hl			;ac75
	pop bc			;ac76
	djnz L_AC6C		;ac77
	ret			;ac79
azar_16:		; un numero al azar de 0 a 15
	call azar		;ac7a   ; un numero al azar de 0 a 15 (p15:AD8A)
	and 00fh		;ac7d
	ld (hl),a			;ac7f
	ret			;ac80
L_AC81:
	ld a,(0d6e1h)		;ac81   ; los partidos jugados de cada pareja: con un jugador, los dos de las suertes...
	dec a			;ac84
	jr nz,L_ACBB		;ac85   ; con varios jugadores, solo el del jugador
	ld d,000h		;ac87   ; DE = el numero - 1
	ld a,(0d711h)		;ac89   ; el visitante del primero: el equipo 0xD711 de la lista 0xD70A...
	dec a			;ac8c
	ld e,a			;ac8d
	ld hl,0d70ah		;ac8e   ; apunta a los 6 equipos elegidos (0xFF libre)
	add hl,de			;ac91
	ld b,(hl)			;ac92   ; B = el equipo
	ld a,(0d713h)		;ac93   ; ...contra el 0xD713
	dec a			;ac96
	ld e,a			;ac97
	ld hl,0d70ah		;ac98   ; apunta a los 6 equipos elegidos (0xFF libre)
	add hl,de			;ac9b
	ld l,(hl)			;ac9c   ; L = el otro
	ld h,b			;ac9d
	call partido_jugado		;ac9e   ; uno mas en la tabla de partidos
	ld d,000h		;aca1
	ld a,(0d715h)		;aca3   ; el segundo: 0xD715 contra 0xD717
	dec a			;aca6
	ld e,a			;aca7
	ld hl,0d70ah		;aca8   ; apunta a los 6 equipos elegidos (0xFF libre)
	add hl,de			;acab
	ld b,(hl)			;acac   ; B = el equipo
	ld a,(0d717h)		;acad
	dec a			;acb0
	ld e,a			;acb1
	ld hl,0d70ah		;acb2   ; apunta a los 6 equipos elegidos (0xFF libre)
	add hl,de			;acb5
	ld l,(hl)			;acb6   ; L = el otro
	ld h,b			;acb7
	call partido_jugado		;acb8   ; partido_jugado: uno mas en la tabla de partidos para H contra L y L contra H
L_ACBB:
	ld d,000h		;acbb   ; ...y el del jugador (0xE195 contra 0xE197)
	ld a,(0e195h)		;acbd   ; el visitante del jugador (0xE195)...
	dec a			;acc0
	ld e,a			;acc1
	ld hl,0d70ah		;acc2   ; apunta a los 6 equipos elegidos (0xFF libre)
	add hl,de			;acc5
	ld b,(hl)			;acc6
	ld a,(0e197h)		;acc7   ; ...contra el local (0xE197)
	dec a			;acca
	ld e,a			;accb
	ld hl,0d70ah		;accc   ; apunta a los 6 equipos elegidos (0xFF libre)
	add hl,de			;accf
	ld l,(hl)			;acd0
	ld h,b			;acd1
partido_jugado:		; uno mas en la tabla de partidos para H contra L y L contra H
	push hl			;acd2   ; uno mas en la tabla de partidos para los dos (los dos sentidos)
	call L_ACDA		;acd3   ; H contra L...
	pop hl			;acd6
	ld a,l			;acd7   ; ...y L contra H
	ld l,h			;acd8
	ld h,a			;acd9
L_ACDA:
	push hl			;acda   ; la casilla de A contra B en 0xD6E3 (6 x 6)
	ld a,l			;acdb
	call 065fbh		;acdc   ; C = la fila del primero
	ld l,c			;acdf   ; la fila x 6...
	ld h,000h		;ace0
	add hl,hl			;ace2
	ld d,h			;ace3
	ld e,l			;ace4
	add hl,hl			;ace5
	add hl,de			;ace6
	ld bc,0d6e3h		;ace7   ; ...en 0xD6E3
	add hl,bc			;acea
	pop de			;aceb
	ld a,d			;acec
	push hl			;aced
	call 065fbh		;acee   ; C = la columna del segundo
	pop hl			;acf1
	ld b,000h		;acf2
	add hl,bc			;acf4
	inc (hl)			;acf5   ; uno mas
	ret			;acf6
L_ACF7:
	ld a,(0d6e1h)		;acf7   ; las victorias: con un jugador, los dos partidos de las suertes...
	dec a			;acfa
	jr nz,L_AD09		;acfb   ; con varios jugadores, solo el del jugador
	ld hl,0d710h		;acfd
	call L_AD0C		;ad00   ; los dos de las suertes
	ld hl,0d714h		;ad03
	call L_AD0C		;ad06
L_AD09:
	ld hl,0e194h		;ad09   ; ...y el del jugador (las carreras de 0xE194 y 0xE196)
L_AD0C:
	ld a,(hl)			;ad0c   ; A carreras de uno, B su equipo...
	inc hl			;ad0d
	ld b,(hl)			;ad0e
	inc hl			;ad0f
	ld c,(hl)			;ad10   ; ...C las del otro, D su equipo
	inc hl			;ad11
	ld d,(hl)			;ad12
	cp c			;ad13   ; B = el que pierde, A = el que gana
	ld a,b			;ad14
	ld b,d			;ad15
	jr nc,L_AD1A		;ad16
	ld b,a			;ad18
	ld a,d			;ad19
L_AD1A:
	push bc			;ad1a
	call victorias_de		;ad1b   ; una victoria mas para el que gana
	call bcd_mas_uno		;ad1e   ; bcd_mas_uno: uno mas al BCD de 4 cifras de HL
	pop bc			;ad21
	ld a,b			;ad22
	call victorias_de		;ad23   ; una derrota mas para el que pierde (+2)
	inc hl			;ad26
	inc hl			;ad27
	jr bcd_mas_uno		;ad28
L_AD2A:
	ld hl,0d68bh		;ad2a   ; la clasificacion: numero y victorias de cada equipo a 0xD730...
	ld de,0d730h		;ad2d
	call 06b5bh		;ad30   ; cuantos_equipos: B = cuantos equipos juegan: 0xD6E1, o 6 con uno solo
	ld c,001h		;ad33   ; C = el numero del equipo, desde 1
L_AD35:
	push bc			;ad35
	ld a,c			;ad36   ; el numero...
	ld (de),a			;ad37
	inc de			;ad38
	call bcd_a_binario		;ad39   ; ...y sus victorias en binario: dos bytes por equipo en 0xD730
	ld (de),a			;ad3c
	inc de			;ad3d
	ld a,00fh		;ad3e   ; la ficha siguiente (15 bytes)
	call 04216h		;ad40   ; hl_mas_a: HL = HL + A
	pop bc			;ad43
	inc c			;ad44
	djnz L_AD35		;ad45
	call 06b5bh		;ad47   ; ...ordenada por victorias (burbuja)
	dec b			;ad4a
	ld de,0d731h		;ad4b
L_AD4E:
	ld h,d			;ad4e   ; la victoria de este puesto...
	ld l,e			;ad4f
	ld a,(de)			;ad50
	push bc			;ad51
L_AD52:
	inc hl			;ad52   ; ...contra la de cada uno de los de detras
	inc hl			;ad53
	cp (hl)			;ad54
	jp p,L_AD67		;ad55   ; si no tiene mas, se queda
	jr z,L_AD67		;ad58
	push bc			;ad5a
	dec de			;ad5b   ; si tiene mas, cambian el numero...
	dec hl			;ad5c
	call L_AD6F		;ad5d
	inc de			;ad60
	inc hl			;ad61
	call L_AD6F		;ad62   ; ...y las victorias
	ld a,c			;ad65
	pop bc			;ad66
L_AD67:
	djnz L_AD52		;ad67   ; todos los de detras
	pop bc			;ad69
	inc de			;ad6a   ; el puesto siguiente
	inc de			;ad6b
	djnz L_AD4E		;ad6c
	ret			;ad6e
L_AD6F:
	ld c,(hl)			;ad6f   ; cambia (HL) con (DE)
	ld a,(de)			;ad70
	ld (hl),a			;ad71
	ld a,c			;ad72
	ld (de),a			;ad73
	ret			;ad74
victorias_de:		; HL = las victorias de la ficha del equipo A (+11)
	call ficha_del_equipo		;ad75   ; HL = las victorias de la ficha del equipo A (+11)
	ld a,00bh		;ad78   ; las victorias son el byte 11
	jp 04216h		;ad7a   ; hl_mas_a: HL = HL + A
ficha_del_equipo:		; HL = la ficha de 15 bytes del equipo A en 0xD680
	dec a			;ad7d   ; HL = la ficha de 15 bytes del equipo A en 0xD680
	ld hl,0d680h		;ad7e   ; la ficha A: 0xD680 + (A - 1) x 15
	ld b,a			;ad81
	add a,a			;ad82
	add a,a			;ad83
	add a,a			;ad84
	add a,a			;ad85
	sub b			;ad86
	jp 04216h		;ad87   ; hl_mas_a: HL = HL + A
azar:		; al azar: 0xD6E0 += R x 3
	ld a,r		;ad8a   ; al azar: 0xD6E0 += R x 3
	ld c,a			;ad8c   ; A x 3...
	add a,a			;ad8d
	add a,c			;ad8e
	ld c,a			;ad8f
	ld a,(0d6e0h)		;ad90   ; ...sumado a la semilla
	add a,c			;ad93
	ld (0d6e0h),a		;ad94
	ret			;ad97
bcd_mas_uno:		; uno mas al BCD de 4 cifras de HL
	ld d,h			;ad98   ; uno mas (BCD de 4 cifras en HL)
	ld e,l			;ad99
	inc de			;ad9a   ; el byte bajo...
	ld a,(de)			;ad9b
	add a,001h		;ad9c   ; ...+ 1 en BCD
	daa			;ad9e
	jr nc,L_ADA2		;ad9f   ; con acarreo, el alto + 1
	inc (hl)			;ada1
L_ADA2:
	ld (de),a			;ada2
	ret			;ada3
a_bcd:		; A a BCD: las centenas en 0xE379, el resto en 0xE37A
	ld hl,0e37ah		;ada4   ; A a BCD: las centenas en 0xE379, el resto en 0xE37A
	ld (hl),000h		;ada7
	dec hl			;ada9
	ld (hl),000h		;adaa
L_ADAC:
	cp 064h		;adac   ; las centenas: restar 100 mientras quepa
	jr c,L_ADB5		;adae
	sub 064h		;adb0
	inc (hl)			;adb2
	jr L_ADAC		;adb3
L_ADB5:
	ld b,00ah		;adb5   ; las decenas: restar 10...
	ld c,000h		;adb7
L_ADB9:
	inc c			;adb9
	sub b			;adba
	jr z,L_ADC3		;adbb
	jp p,L_ADB9		;adbd
	dec c			;adc0   ; ...deshaciendo la ultima resta
	add a,00ah		;adc1
L_ADC3:
	sla c		;adc3   ; las decenas en la cifra alta y las unidades en la baja
	sla c		;adc5
	sla c		;adc7
	sla c		;adc9
	add a,c			;adcb
	inc hl			;adcc
	ld (hl),a			;adcd   ; a 0xE37A
	dec hl			;adce
	ret			;adcf
bcd_a_binario:		; A = el BCD de 3 cifras de HL en binario
	inc hl			;add0   ; A = el BCD de 3 cifras de HL en binario
	ld a,(hl)			;add1   ; el segundo byte (decenas y unidades)
	push af			;add2
	sub a			;add3   ; RLD: la cifra alta a A...
	rld		;add4
	add a,a			;add6   ; ...x 10
	ld b,a			;add7
	add a,a			;add8
	add a,a			;add9
	add a,b			;adda
	ld b,a			;addb
	sub a			;addc   ; la baja...
	rld		;addd
	add a,b			;addf   ; ...sumada
	ld b,a			;ade0
	pop af			;ade1
	ld (hl),a			;ade2   ; el byte se deja como estaba
	dec hl			;ade3
	ld a,(hl)			;ade4   ; con centenas (el primer byte no es 0)...
	or a			;ade5
	ld a,b			;ade6
	ret z			;ade7
	add a,064h		;ade8   ; ...100 mas
	ret			;adea
diez_ascii:		; 10 letras ASCII
	ld b,00ah		;adeb   ; 10 letras ASCII
L_ADED:
	call 09834h		;aded   ; letra_ascii: una letra ASCII a la fuente
	inc hl			;adf0   ; la letra siguiente
	call 04f1ch		;adf1   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	call 04f6fh		;adf4   ; siguiente_columna: D += 8; si da la vuelta, E += 8
	djnz L_ADED		;adf7
	ret			;adf9
L_ADFA:
	call 04b9fh		;adfa   ; la clasificacion en pantalla: borrada, rotulos...
	ld a,00eh		;adfd   ; la marca 0x0E en (0x1C, 0x78)
	ld de,0781ch		;adff
	call 04f1ch		;ae02   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld a,(0d6e1h)		;ae05   ; con un jugador, dos mas en (0x28, 0x78) y (0x34, 0x78)
	dec a			;ae08
	jr nz,L_AE1B		;ae09
	ld a,00eh		;ae0b
	ld de,07828h		;ae0d
	call 04f1ch		;ae10   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld a,00eh		;ae13
	ld de,07834h		;ae15
	call 04f1ch		;ae18   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
L_AE1B:
	ld de,0046ch		;ae1b   ; el 2, 3... (los puestos) en la x 0x04 desde la y 0x6C, de 12 en 12
	call 06b5bh		;ae1e   ; cuantos_equipos: B = cuantos equipos juegan: 0xD6E1, o 6 con uno solo
	ld c,002h		;ae21
L_AE23:
	ld a,c			;ae23
	push bc			;ae24   ; guarda la cuenta y la posicion
	push de			;ae25
	call 04f1ch		;ae26   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	pop de			;ae29
	ld a,e			;ae2a   ; 12 mas abajo
	add a,00ch		;ae2b
	ld e,a			;ae2d
	pop bc			;ae2e
	inc c			;ae2f   ; el puesto siguiente
	djnz L_AE23		;ae30
	ld de,0e878h		;ae32   ; una columna de 0x90 en la x 0x78 desde la y 0xE8
	call 06b5bh		;ae35   ; cuantos_equipos: B = cuantos equipos juegan: 0xD6E1, o 6 con uno solo
	dec b			;ae38   ; todos menos el primero
	ld a,090h		;ae39
	call columna_de_caracteres		;ae3b   ; columna_de_caracteres: B caracteres A en columna, de 12 en 12
	ld de,0ec78h		;ae3e   ; una de caracteres 1 en la x 0x78 desde la y 0xEC
	call 06b5bh		;ae41   ; cuantos_equipos: B = cuantos equipos juegan: 0xD6E1, o 6 con uno solo
	dec b			;ae44
	ld a,001h		;ae45
	call columna_de_caracteres		;ae47   ; columna_de_caracteres: B caracteres A en columna, de 12 en 12
	ld de,L_AC6C		;ae4a   ; una columna de 0x90 en (0x6C, 0xAC): DE es un numero, no la rutina
	call 06b5bh		;ae4d   ; cuantos_equipos: B = cuantos equipos juegan: 0xD6E1, o 6 con uno solo
	ld a,090h		;ae50
	call columna_de_caracteres		;ae52   ; columna_de_caracteres: B caracteres A en columna, de 12 en 12
	ld hl,0b0a6h		;ae55   ; los titulos de las columnas
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
	call L_AEAE		;ae8b   ; el partido del jugador
	ld a,(0d6e1h)		;ae8e   ; lee el numero de jugadores de PENNANT (1-6)
	dec a			;ae91   ; con un jugador...
	jp nz,tabla_de_pennant		;ae92   ; con un jugador, los otros dos y la tabla
	call L_AED6		;ae95
	call L_AEFE		;ae98
	jp tabla_de_pennant		;ae9b   ; tabla_de_pennant: la tabla de PENNANT: cada equipo con partidos, victorias, derrotas, porcentaje y diferencia
columna_de_caracteres:		; B caracteres A en columna, de 12 en 12
	push af			;ae9e   ; B caracteres A en columna, de 12 en 12
	push bc			;ae9f
	push de			;aea0
	call 04f1ch		;aea1   ; el caracter
	pop de			;aea4
	pop bc			;aea5
	ld a,e			;aea6   ; 12 mas abajo
	add a,00ch		;aea7
	ld e,a			;aea9
	pop af			;aeaa
	djnz columna_de_caracteres		;aeab
	ret			;aead
L_AEAE:
	ld a,(0e195h)		;aeae   ; el partido del jugador: los dos nombres y sus carreras
	ld de,0081ch		;aeb1   ; el visitante en (0x08, 0x1C)
	call nombre_del_equipo		;aeb4   ; nombre_del_equipo: el nombre del equipo A (10 letras)
	ld hl,0e194h		;aeb7   ; apunta a las carreras del visitante (BCD; 0x99 acaba el partido)
	ld de,0601ch		;aeba   ; sus carreras en (0x60, 0x1C)
	ld b,001h		;aebd
	call 05bf1h		;aebf   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
	ld a,(0e197h)		;aec2
	ld de,0a01ch		;aec5   ; el local en (0xA0, 0x1C)
	call nombre_del_equipo		;aec8   ; nombre_del_equipo: el nombre del equipo A (10 letras)
	ld hl,0e196h		;aecb   ; apunta a las carreras del local (BCD; 0x99 acaba el partido)
	ld de,0881ch		;aece   ; sus carreras en (0x88, 0x1C)
	ld b,001h		;aed1
	jp 05bf1h		;aed3   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
L_AED6:
	ld a,(0d711h)		;aed6   ; el primer partido de las suertes
	ld de,00828h		;aed9   ; el visitante en (0x08, 0x28)
	call nombre_del_equipo		;aedc   ; nombre_del_equipo: el nombre del equipo A (10 letras)
	ld hl,0d710h		;aedf
	ld de,06028h		;aee2   ; sus carreras en (0x60, 0x28)
	ld b,001h		;aee5
	call 05bf1h		;aee7   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
	ld a,(0d713h)		;aeea
	ld de,0a028h		;aeed   ; el local en (0xA0, 0x28)
	call nombre_del_equipo		;aef0   ; nombre_del_equipo: el nombre del equipo A (10 letras)
	ld hl,0d712h		;aef3
	ld de,08828h		;aef6   ; sus carreras en (0x88, 0x28)
	ld b,001h		;aef9
	jp 05bf1h		;aefb   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
L_AEFE:
	ld a,(0d715h)		;aefe   ; el segundo
	ld de,00834h		;af01   ; el visitante del segundo en (0x08, 0x34)
	call nombre_del_equipo		;af04   ; nombre_del_equipo: el nombre del equipo A (10 letras)
	ld hl,0d714h		;af07   ; sus carreras en (0x60, 0x34)
	ld de,06034h		;af0a
	ld b,001h		;af0d
	call 05bf1h		;af0f   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
	ld a,(0d717h)		;af12   ; el local en (0xA0, 0x34)
	ld de,0a034h		;af15
	call nombre_del_equipo		;af18   ; nombre_del_equipo: el nombre del equipo A (10 letras)
	ld hl,0d716h		;af1b   ; sus carreras en (0x88, 0x34)
	ld de,08834h		;af1e
	ld b,001h		;af21
	jp 05bf1h		;af23   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
nombre_del_equipo:		; el nombre del equipo A (10 letras)
	call ficha_del_equipo		;af26   ; el nombre del equipo A (10 letras)
	jp diez_ascii		;af29   ; sus 10 letras
tabla_de_pennant:		; la tabla de PENNANT: cada equipo con partidos, victorias, derrotas, porcentaje y diferencia
	ld hl,0d730h		;af2c   ; la tabla: las victorias del primero (para la diferencia) y la primera fila 0x6C...
	ld a,(hl)			;af2f
	call victorias_de		;af30   ; victorias_de: HL = las victorias de la ficha del equipo A (+11)
	call bcd_a_binario		;af33   ; bcd_a_binario: A = el BCD de 3 cifras de HL en binario
	ld (0e371h),a		;af36   ; 0xE371 = las victorias del primero
	ld a,06ch		;af39   ; la primera fila en la y 0x6C
	ld (0e372h),a		;af3b
	call 06b5bh		;af3e   ; cuantos_equipos: B = cuantos equipos juegan: 0xD6E1, o 6 con uno solo
	ld hl,0d72eh		;af41   ; 0xE373 recorre la clasificacion (empieza 2 antes de 0xD730)
	ld (0e373h),hl		;af44
L_AF47:
	ld hl,(0e373h)		;af47   ; ...por cada equipo de la clasificacion: partidos, victorias y derrotas, porcentaje, diferencia y nombre...
	inc hl			;af4a   ; dos bytes por puesto
	inc hl			;af4b
	ld (0e373h),hl		;af4c
	push bc			;af4f
	call L_AF7D		;af50   ; partidos, victorias y derrotas, porcentaje, diferencia y nombre
	call L_AFA8		;af53
	call L_AFBD		;af56
	call L_B034		;af59
	call L_AF6B		;af5c
	pop bc			;af5f
	ld a,(0e372h)		;af60   ; ...12 mas abajo
	add a,00ch		;af63
	ld (0e372h),a		;af65
	djnz L_AF47		;af68
	ret			;af6a
L_AF6B:
	ld hl,(0e373h)		;af6b   ; el nombre del equipo de la fila (6 letras) en x = 0x10
	ld a,(hl)			;af6e
	call ficha_del_equipo		;af6f   ; la ficha del equipo (su nombre al principio)...
	ld a,(0e372h)		;af72   ; ...en (0x10, fila), 6 letras
	ld e,a			;af75
	ld d,010h		;af76
	ld b,006h		;af78
	jp L_ADED		;af7a
L_AF7D:
	ld e,(hl)			;af7d   ; el numero del equipo - 1...
	dec e			;af7e
	ld d,000h		;af7f
	ld hl,0d70ah		;af81   ; apunta a los 6 equipos elegidos (0xFF libre)
	add hl,de			;af84
	ld a,(hl)			;af85   ; ...su equipo en la lista 0xD70A...
	call 065fbh		;af86   ; ...su fila de la tabla de partidos (0xD6E3 + 6 x indice)
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
	xor a			;af96   ; la suma de sus 6 casillas
	ld b,006h		;af97
L_AF99:
	add a,(hl)			;af99
	inc hl			;af9a
	djnz L_AF99		;af9b
	ld (0e375h),a		;af9d   ; a 0xE375 y en BCD (p15:ADA4)
	call a_bcd		;afa0   ; a_bcd: A a BCD: las centenas en 0xE379, el resto en 0xE37A
	ld d,044h		;afa3   ; en la x 0x44
	jp tres_cifras_en_fila		;afa5   ; tres_cifras_en_fila: tres cifras en la fila 0xE372, x = D
L_AFA8:
	ld hl,(0e373h)		;afa8   ; las victorias (x = 0x64) y las derrotas (x = 0x84)
	ld a,(hl)			;afab
	call victorias_de		;afac   ; victorias_de: HL = las victorias de la ficha del equipo A (+11)
	push hl			;afaf
	ld d,064h		;afb0   ; victorias en la x 0x64
	call tres_cifras_en_fila		;afb2   ; tres_cifras_en_fila: tres cifras en la fila 0xE372, x = D
	pop hl			;afb5
	inc hl			;afb6   ; las derrotas (+2) en la x 0x84
	inc hl			;afb7
	ld d,084h		;afb8
	jp tres_cifras_en_fila		;afba   ; tres_cifras_en_fila: tres cifras en la fila 0xE372, x = D
L_AFBD:
	ld hl,(0e373h)		;afbd   ; el porcentaje: victorias entre partidos, tres cifras (como p15:A28B)...
	ld a,(hl)			;afc0
	call victorias_de		;afc1   ; victorias_de: HL = las victorias de la ficha del equipo A (+11)
	call bcd_a_binario		;afc4   ; bcd_a_binario: A = el BCD de 3 cifras de HL en binario
	ld hl,0e375h		;afc7   ; HL = victorias, DE = partidos
	ld e,(hl)			;afca
	ld d,000h		;afcb
	ld l,a			;afcd
	ld h,d			;afce
	exx			;afcf
	ld bc,00002h		;afd0   ; 0xE360-0xE362 a cero para el resultado
	ld hl,0e360h		;afd3
	ld de,0e361h		;afd6
	ld (hl),000h		;afd9
	ldir		;afdb
	ld hl,0e360h		;afdd
	exx			;afe0
	ld a,l			;afe1
	or a			;afe2   ; sin victorias, 0
	jr z,L_B020		;afe3
	ld b,004h		;afe5
L_AFE7:
	ld c,0ffh		;afe7   ; la division larga: C = cuantas veces cabe
	and a			;afe9
L_AFEA:
	inc c			;afea
	sbc hl,de		;afeb
	jr z,L_B008		;afed
	jr nc,L_AFEA		;afef
	add hl,de			;aff1   ; se deshace la ultima resta
	ld a,b			;aff2
	cp 004h		;aff3   ; la primera vuelta es la parte entera: no se guarda
	jr z,L_AFFC		;aff5
	ld a,c			;aff7   ; la cifra al resultado
	exx			;aff8
	ld (hl),a			;aff9
	inc hl			;affa
	exx			;affb
L_AFFC:
	push de			;affc
	add hl,hl			;affd   ; el resto x 10
	ld d,h			;affe
	ld e,l			;afff
	add hl,hl			;b000
	add hl,hl			;b001
	add hl,de			;b002
	pop de			;b003
	djnz L_AFE7		;b004   ; cuatro vueltas
	jr L_B012		;b006
L_B008:
	ld a,004h		;b008
	cp b			;b00a
	jr z,L_B027		;b00b
	inc c			;b00d   ; exacta: la cifra que toca
	ld a,c			;b00e
	exx			;b00f
	ld (hl),a			;b010
	exx			;b011
L_B012:
	ld hl,0e361h		;b012
	ld a,(hl)			;b015   ; las dos primeras cifras juntas en BCD
	rla			;b016   ; la primera a la mitad alta...
	rla			;b017
	rla			;b018
	rla			;b019
	and 0f0h		;b01a
	inc hl			;b01c
	add a,(hl)			;b01d   ; ...mas la segunda...
	dec hl			;b01e
	ld (hl),a			;b01f   ; ...en 0xE361
L_B020:
	ld hl,0e360h		;b020   ; ...en x = 0xB0
	ld d,0b0h		;b023
	jr L_B068		;b025
L_B027:
	ld a,(0e372h)		;b027   ; todas ganadas: un 1 en 0xA4
	ld e,a			;b02a
	ld d,0a4h		;b02b
	ld a,002h		;b02d   ; el caracter 2 (la cifra 1)
	call 04f1ch		;b02f   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	jr L_B020		;b032
L_B034:
	ld hl,00000h		;b034   ; la diferencia con el primero (en el primero no se pinta)
	ld (0e377h),hl		;b037   ; 0xE377-0xE378 a cero
	ld hl,(0e373h)		;b03a
	ld a,(hl)			;b03d
	call victorias_de		;b03e   ; victorias_de: HL = las victorias de la ficha del equipo A (+11)
	call bcd_a_binario		;b041   ; bcd_a_binario: A = el BCD de 3 cifras de HL en binario
	ld b,a			;b044   ; la diferencia: las del primero menos las suyas
	ld a,(0e371h)		;b045
	sub b			;b048
	cp 064h		;b049   ; las centenas a 0xE377...
	ld hl,0e377h		;b04b
	jr c,L_B053		;b04e
	inc (hl)			;b050
	sub 064h		;b051
L_B053:
	inc hl			;b053   ; ...y lo demas en BCD a 0xE378
	call 0646dh		;b054
	ld (hl),a			;b057
	ld d,0d0h		;b058   ; en la x 0xD0
	dec hl			;b05a
	ld a,(0e372h)		;b05b   ; el primero no la pinta
	cp 06ch		;b05e
	ret z			;b060
tres_cifras_en_fila:		; tres cifras en la fila 0xE372, x = D
	ld a,(0e372h)		;b061   ; la y de la fila
	ld e,a			;b064
	jp 05c56h		;b065   ; tres cifras (p00:5C56)
L_B068:
	ld a,(0e372h)		;b068   ; B cifras con ceros
	ld e,a			;b06b
	ld b,003h		;b06c   ; tres cifras
	jp 05c34h		;b06e   ; cifras_bcd: B cifras BCD con ceros, empezando por la baja si B es impar

; ----------------------------------------------------------------------
; DATOS texto_B071: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p15:AE5E (10 bytes)
;   0xb071..0xb07b  (10 bytes)
DATA_texto_B071:
	defb 060h,008h,0a0h,000h,0a1h,000h,0a2h,000h,0a3h,0ffh	; b071  `.........	los titulos de las columnas ([x y], letras y 0xFF)

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
	call L_B0B4		;b0ac   ; el letrero de SAFE / OUT de la base (p15:B0B4) y 0xED0D a 0
	xor a			;b0af   ; y 0xED0D a 0
	ld (0ed0dh),a		;b0b0
	ret			;b0b3
L_B0B4:
	ld a,(0e33bh)		;b0b4   ; con 0xED0D (la base y el bit 7: fuera) y sin home run...
	or a			;b0b7   ; con 0xE33B, nada
	ret nz			;b0b8
	ld a,(0ed0dh)		;b0b9
	or a			;b0bc   ; sin letrero pedido, nada
	ret z			;b0bd
	ld a,(0e1a6h)		;b0be   ; ...su sitio segun la zona del campo...
	or a			;b0c1
	jr z,L_B0DE		;b0c2   ; la zona 0: en (0x30, 0xC8)
	dec a			;b0c4
	jr z,L_B0E3		;b0c5   ; la zona 1: segun donde esta la pelota
	ld de,02830h		;b0c7   ; las demas: en (0x30, 0x28)
L_B0CA:
	call cuadro_55		;b0ca   ; ...borra el sitio (p15:B140) y pinta SAFE (1) u OUT (0)...
L_B0CD:
	ld a,(0ed0dh)		;b0cd   ; bit 7 de 0xED0D: OUT (letrero 0); si no SAFE (1)
	bit 7,a		;b0d0
	ld a,001h		;b0d2
	jr z,letrero		;b0d4
	xor a			;b0d6
	jr letrero		;b0d7
L_B0D9:
	call L_B121		;b0d9   ; junto a la caja: borra las dos franjas y el letrero
	jr L_B0CD		;b0dc
L_B0DE:
	ld de,0c830h		;b0de
	jr L_B0CA		;b0e1
L_B0E3:
	ld de,00830h		;b0e3   ; ...en la zona 1, segun donde esta la pelota...
	ld a,(0e218h)		;b0e6   ; lee la x de la pelota
	cp 0c0h		;b0e9   ; x de la pelota de 0xC0 o mas: en (0x30, 0x08)
	jr nc,L_B0CA		;b0eb
	ld de,0e830h		;b0ed   ; de 0x80 a 0xBF: en (0x30, 0xE8)
	cp 080h		;b0f0
	jr nc,L_B0CA		;b0f2
	ld hl,(0e213h)		;b0f4   ; ...en la caja: borra dos franjas (p15:B121)...
	ld bc,0feb0h		;b0f7   ; con la y por debajo de 0x150, junto a la caja
	add hl,bc			;b0fa
	jr nc,L_B0D9		;b0fb
	ld hl,(0e1a2h)		;b0fd   ; si la pantalla no ha bajado de 0xD0, nada
	ld de,0ff30h		;b100
	add hl,de			;b103
	ret nc			;b104
	ld de,07898h		;b105   ; borra un cuadro en (0x98, 0x78)
	call cuadro_44		;b108   ; cuadro_44: un rectangulo de 16 x 16 de color 0x44 en DE
	ld hl,(0e213h)		;b10b   ; lee la y de la pelota (vertical) y el byte siguiente (16 bits)
	ld bc,0fe70h		;b10e   ; con la y de 0x190 o mas, el letrero normal
	add hl,bc			;b111
	jr c,L_B0CD		;b112
	ld a,(0ed0dh)		;b114   ; ...y en casa SAFE (3) u OUT (2)
	bit 7,a		;b117
	ld a,002h		;b119
	jr nz,letrero		;b11b
	ld a,003h		;b11d
	jr letrero		;b11f
L_B121:
	ld de,068f8h		;b121   ; borra dos franjas de 16 x 8 en (0xF8, 0x68) y (0x00, 0x68) con el color 0x55
	push de			;b124   ; una en (0xF8, 0x68)...
	push de			;b125
	ex de,hl			;b126
	call L_B132		;b127
	pop hl			;b12a
	ld l,000h		;b12b   ; ...y otra en (0x00, 0x68)
	call L_B132		;b12d
	pop de			;b130
	ret			;b131
L_B132:
	ld a,055h		;b132   ; de color 0x55 (verde)
	ld bc,01008h		;b134
	ld d,000h		;b137
	jp 04d2ah		;b139   ; en la pagina 0
cuadro_44:		; un rectangulo de 16 x 16 de color 0x44 en DE
	ld a,044h		;b13c   ; un rectangulo de 16 x 16 de color 0x44...
	jr L_B142		;b13e
cuadro_55:		; un rectangulo de 16 x 16 de color 0x55 en DE
	ld a,055h		;b140   ; ...o 0x55
L_B142:
	push de			;b142
	ex de,hl			;b143
	ld bc,01010h		;b144   ; 16 x 16 en la pagina 0
	ld d,000h		;b147
	call 04d2ah		;b149   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
	pop de			;b14c
	ret			;b14d
letrero:		; el letrero A de la tabla 0xB20D (2 x 2 caracteres) en DE
	add a,a			;b14e   ; x 4: cuatro caracteres por letrero
	add a,a			;b14f
	ld hl,0b20dh		;b150
	call 04216h		;b153   ; hl_mas_a: HL = HL + A
	jr L_B1C1		;b156   ; dos filas de dos
L_B158:
	ld a,(0e33bh)		;b158   ; el letrero de FAIR / FOUL: una vez (0xED2A) al decidirse (bit 0 de 0xEDDF)...
	or a			;b15b
	ret nz			;b15c
	ld a,(0ed08h)		;b15d   ; 0xED08 bit 0: sin letrero
	rra			;b160
	ret c			;b161
	ld hl,0ed2ah		;b162   ; solo una vez por jugada (0xED2A)
	ld a,(hl)			;b165
	or a			;b166
	ret nz			;b167
	ld a,(0eddfh)		;b168   ; si la pelota aun no ha caido (bit 0 de 0xEDDF), nada
	rra			;b16b
	ret nc			;b16c
	ld (hl),001h		;b16d   ; 0xED2A = 1: ya se puso
	call L_B1D8		;b16f   ; ...si la pelota cae en la zona de las lineas (p15:B1D8)...
	ret nc			;b172
	ld hl,(0e1a2h)		;b173   ; ...y se ve en pantalla: segun la zona, FAIR (5 o 6) o FOUL (7)
	ld de,0ffa0h		;b176   ; si la pantalla no ha bajado de 0x60, nada
	add hl,de			;b179
	ret nc			;b17a
	ld a,(0e1a6h)		;b17b
	or a			;b17e
	jr z,L_B193		;b17f   ; zona 0 o 1: otros sitios
	dec a			;b181
	jr z,L_B1A2		;b182
	ld de,0a028h		;b184   ; las demas: en (0x28, 0xA0)
	ld a,(0eddeh)		;b187   ; lee la jugada anulada (foul)
	rra			;b18a   ; FAIR (5), o FOUL (7) con la jugada anulada
	ld a,005h		;b18b
	jr nc,letrero		;b18d
	ld a,007h		;b18f
	jr letrero		;b191
L_B193:
	ld de,04828h		;b193   ; la zona 0: en (0x28, 0x48), FAIR (6) o FOUL (7)
	ld a,(0eddeh)		;b196   ; lee la jugada anulada (foul)
	rra			;b199
	ld a,006h		;b19a
	jr nc,letrero		;b19c
	ld a,007h		;b19e
	jr letrero		;b1a0
L_B1A2:
	ld hl,(0e213h)		;b1a2   ; en la zona 1, junto a la caja: FOUL (7) o 4
	ld de,0feb0h		;b1a5   ; con la y por debajo de 0x150, nada
	add hl,de			;b1a8
	ret nc			;b1a9
	ld a,(0eddeh)		;b1aa   ; lee la jugada anulada (foul)
	rra			;b1ad
	ret nc			;b1ae   ; si no es foul, nada
	ld de,07898h		;b1af   ; en (0x98, 0x78)
	ld hl,(0e213h)		;b1b2   ; lee la y de la pelota (vertical) y el byte siguiente (16 bits)
	ld bc,0fe70h		;b1b5   ; la y de 0x190 o mas: FOUL (7); si no, el letrero 4
	add hl,bc			;b1b8
	ld a,007h		;b1b9
	jr c,letrero		;b1bb
	ld a,004h		;b1bd
	jr letrero		;b1bf
L_B1C1:
	push de			;b1c1   ; dos filas de dos caracteres...
	call L_B1CA		;b1c2   ; la fila de arriba
	pop de			;b1c5
	ld a,e			;b1c6   ; y la de abajo, 8 mas
	add a,008h		;b1c7
	ld e,a			;b1c9
L_B1CA:
	ld a,(hl)			;b1ca   ; ...cada uno con p15:B22D
	inc hl			;b1cb
	call caracter_lmmm		;b1cc   ; caracter_lmmm: un caracter de la fuente con LMMM (sin el color 0)
	ld a,d			;b1cf   ; 8 a la derecha
	add a,008h		;b1d0
	ld d,a			;b1d2
	ld a,(hl)			;b1d3
	inc hl			;b1d4
	jp caracter_lmmm		;b1d5   ; caracter_lmmm: un caracter de la fuente con LMMM (sin el color 0)
L_B1D8:
	ld de,(0e221h)		;b1d8   ; DE = la x de la pelota, BC = su y
	ld bc,(0e223h)		;b1dc
	ld a,b			;b1e0   ; con la y de 0x140 o mas...
	or a			;b1e1
	jr z,L_B1F5		;b1e2
	dec a			;b1e4
	jr nz,L_B1EC		;b1e5
	ld a,c			;b1e7
	cp 040h		;b1e8
	jr c,L_B1F5		;b1ea
L_B1EC:
	call L_B201		;b1ec   ; ...y + 3x/4 - 0x280
	add hl,de			;b1ef
	ld de,0fd80h		;b1f0
	add hl,de			;b1f3
	ret			;b1f4
L_B1F5:
	call L_B201		;b1f5   ; ...o y - 3x/4 contra 0xA0
	ex de,hl			;b1f8
	or a			;b1f9
	sbc hl,de		;b1fa
	ld de,0ff60h		;b1fc   ; - 0xA0
	add hl,de			;b1ff
	ret			;b200
L_B201:
	srl b		;b201   ; BC / 2...
	rr c		;b203
	push bc			;b205   ; ...+ BC / 4
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
	defb 0e5h,0e6h,0fch,0e7h,0e8h,0e9h,0eah,0fbh,0ebh,0ech,0edh,0eeh,0efh,0f0h,0e0h,0e1h	; b20d  ................	los 8 letreros de 2 x 2 caracteres (OUT, SAFE, ..., FAIR, FOUL)
	defb 0f7h,0f8h,0e2h,0e3h,0f1h,0f2h,0fdh,0e4h,0f1h,0f2h,0fah,0f3h,0f4h,0f5h,0f9h,0f6h	; b21d  ................

; ======================================================================
; CODIGO 0xb22d..0xb23f  (18 bytes)
; ======================================================================


caracter_lmmm:		; un caracter de la fuente con LMMM (sin el color 0)
	push bc			;b22d   ; un caracter de la fuente de la fila 0x68 con TIMP (copia sin el color 0)
	push hl			;b22e
	push de			;b22f
	call 04f5ah		;b230   ; la posicion del caracter A en la fuente (p00:4F5A)
	ld bc,00808h		;b233   ; 8 x 8 con LMMM, operacion 0x48 (sin el color 0)
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
	defb 0f1h,000h,000h,001h,063h,000h,000h,038h,001h,05eh,0ffh,043h,0a8h,004h,040h,0c4h	; b23f  ....c..8.^.C..@.	datos sin lector a la vista

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
	xor a			;b25f   ; la jugada nueva: todas las marcas de la defensa a cero...
	ld (0ed9dh),a		;b260   ; 0xED9D, 0xECE6, 0xED82, 0xED0D, 0xED2A, 0xED35, 0xED50, 0xED02, 0xEDD5, 0xED7B, 0xEDD3 y 0xE1B8 a 0
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
	ld hl,0e271h		;b284   ; ...las 9 fichas de defensor a cero...
	ld de,0e272h		;b287
	ld bc,0008fh		;b28a   ; 0x90 bytes: las 9 fichas
	ld (hl),000h		;b28d
	ldir		;b28f
	ld hl,0e23ch		;b291   ; ...los corredores sin el bit 4
	ld de,00010h		;b294
	ld b,004h		;b297
L_B299:
	res 4,(hl)		;b299   ; quita el bit 4 de las marcas de cada corredor
	add hl,de			;b29b
	djnz L_B299		;b29c
	ld hl,0e27dh		;b29e   ; el dibujo 0x68 a los 9 defensores
	ld de,00010h		;b2a1
	ld b,009h		;b2a4
L_B2A6:
	ld (hl),068h		;b2a6   ; el sprite 0x68 de cada defensor
	add hl,de			;b2a8
	djnz L_B2A6		;b2a9
	ld a,0f8h		;b2ab   ; el receptor con el dibujo 0xF8 y, con robo, p15:B623
	ld (0e2edh),a		;b2ad   ; guarda el dibujo de su sprite del receptor (ficha 0xE2E1, defensor 2)
	ld a,(0ecebh)		;b2b0
	or a			;b2b3
	call nz,pelota_tras_robo		;b2b4   ; con 0xECEB, p15:B623
	ld hl,0e271h		;b2b7   ; los 9 defensores en su puesto: numero, y y x de la tabla 0xB5ED
	ld de,0b5edh		;b2ba
	ld b,009h		;b2bd
L_B2BF:
	ld (hl),b			;b2bf   ; el numero (9 a 1)...
	inc hl			;b2c0   ; +2: la y
	inc hl			;b2c1
	ld a,(de)			;b2c2   ; ...la y de la tabla 0xB5ED...
	inc de			;b2c3
	ld (hl),a			;b2c4
	inc hl			;b2c5
	ld a,(de)			;b2c6   ; +3: su byte alto
	inc de			;b2c7
	ld (hl),a			;b2c8
	inc hl			;b2c9
	inc hl			;b2ca   ; +7: la x
	inc hl			;b2cb   ; ...la x...
	inc hl			;b2cc
	ld a,(de)			;b2cd
	inc de			;b2ce
	ld (hl),a			;b2cf
	inc hl			;b2d0
	ld a,(de)			;b2d1   ; +8: su byte alto
	inc de			;b2d2
	ld (hl),a			;b2d3
	ld a,008h		;b2d4   ; ...y la ficha siguiente (16 bytes)
	call 04216h		;b2d6   ; hl_mas_a: HL = HL + A
	djnz L_B2BF		;b2d9   ; los 9
	ld a,(0ed3fh)		;b2db   ; sin robo ni lanzada: los puestos de cobertura (p15:B53B, p15:B308)
	or a			;b2de
	jr nz,L_B2F9		;b2df
	ld a,(0ecebh)		;b2e1   ; sin robo (0xECEB)...
	or a			;b2e4
	jr nz,L_B2EE		;b2e5
	call L_B53B		;b2e7   ; sin robo ni lanzada: p15:B53B y segun la pelota (p15:B308)
	call L_B308		;b2ea   ; ...los defensores segun la pelota
	ret			;b2ed
L_B2EE:
	ld a,(0edddh)		;b2ee   ; con 0xEDDD, p15:B623; si no, p15:B611
	or a			;b2f1
	jr z,L_B2F9		;b2f2
	call pelota_tras_robo		;b2f4   ; pelota_tras_robo: tras un robo, la pelota al lanzador o al receptor
	jr L_B2FC		;b2f7
L_B2F9:
	call pelota_al_lanzador		;b2f9   ; pelota_al_lanzador: la pelota en manos del lanzador
L_B2FC:
	call L_B4C6		;b2fc   ; y las coberturas del robo
	call L_B367		;b2ff   ; el parador, el tercera base y el receptor (p15:B367, B480, B3CB)
	call L_B480		;b302
	jp L_B3CB		;b305
L_B308:
	ld de,(0e215h)		;b308   ; segun la pelota: hacia el bateador (vy < 0)...
	ld hl,(0e21ah)		;b30c   ; lee la velocidad x de la pelota y el byte siguiente (16 bits)
	ld a,d			;b30f   ; si la velocidad y es negativa (hacia arriba)...
	rla			;b310
	jr nc,L_B31B		;b311
	call L_B58B		;b313   ; ...p15:B58B y el receptor (p15:B3EA)
	call L_B3EA		;b316
	jr L_B329		;b319
L_B31B:
	ld a,007h		;b31b   ; ...o hacia fuera: el tipo 7 y las coberturas de fuera
	ld (0ed9dh),a		;b31d   ; guarda el tipo de golpe (1-7)
	call L_B45D		;b320   ; el lanzador (p15:B45D), el tercera base y el primera base
	call L_B480		;b323
	call L_B4C6		;b326
L_B329:
	ld hl,0ed9dh		;b329   ; el tipo de golpe (0xED9D) segun el signo de 0xE21B
	ld a,(0e21bh)		;b32c   ; lee la velocidad x, byte alto de la pelota
	rla			;b32f   ; la velocidad x de la pelota hacia...
	ld a,001h		;b330
	jr c,L_B396		;b332   ; ...la izquierda (signo): tipo 1 (p15:B396)
	ld a,000h		;b334   ; si no, el tipo se queda
	or (hl)			;b336
	ld (hl),a			;b337
L_B338:
	ld hl,00104h		;b338   ; el parador en corto (0xE2A1, defensor 6): la y 0x104 y la x 0x11C...
	ld (0e2a3h),hl		;b33b   ; guarda la y (vertical) del parador en corto (ficha 0xE2A1, defensor 6) y el byte siguiente (16 bits)
	ld hl,0011ch		;b33e
	ld (0e2a8h),hl		;b341   ; guarda la x (horizontal) del parador en corto (ficha 0xE2A1, defensor 6) y el byte siguiente (16 bits)
	ld de,0245ch		;b344   ; ...la velocidad hacia el punto (p00:40D2)...
	ld hl,0781fh		;b347
	ld a,020h		;b34a
	call 040d2h		;b34c   ; velocidad_hacia: con los bancos 7-8-9, la velocidad de HL (x, y) a DE (p00:5E9F); vuelve a 13-14-15
	ld (0e2a5h),hl		;b34f   ; guarda la velocidad y, byte bajo del parador en corto (ficha 0xE2A1, defensor 6) y el byte siguiente (16 bits)
	ld (0e2aah),de		;b352   ; guarda la velocidad x, byte bajo del parador en corto (ficha 0xE2A1, defensor 6) y el byte siguiente (16 bits)
	ld a,016h		;b356   ; ...estado 0x16, +13 = 0x31 y destino 0x37FF
	ld (0e2a1h),a		;b358   ; guarda la ficha del parador en corto (defensor 6) (+0: el numero (bits 0-3) y el estado (bits 4-7))
	ld a,031h		;b35b
	ld (0e2aeh),a		;b35d   ; guarda la base de destino (nibble alto; 2 abajo: llegado) del parador en corto (ficha 0xE2A1, defensor 6)
	ld hl,037ffh		;b360
	ld (0e2afh),hl		;b363   ; guarda la y de destino del parador en corto (ficha 0xE2A1, defensor 6) y el byte siguiente (16 bits)
	ret			;b366
L_B367:
	ld hl,00104h		;b367   ; el parador en corto (0xE2A1): lo mismo con la x 0x128
	ld (0e2a3h),hl		;b36a   ; guarda la y (vertical) del parador en corto (ficha 0xE2A1, defensor 6) y el byte siguiente (16 bits)
	ld hl,00128h		;b36d
	ld (0e2a8h),hl		;b370   ; guarda la x (horizontal) del parador en corto (ficha 0xE2A1, defensor 6) y el byte siguiente (16 bits)
	ld de,0245ch		;b373
	ld hl,0781fh		;b376
	ld a,020h		;b379
	call 040d2h		;b37b   ; velocidad_hacia: con los bancos 7-8-9, la velocidad de HL (x, y) a DE (p00:5E9F); vuelve a 13-14-15
	ld (0e2a5h),hl		;b37e   ; guarda la velocidad y, byte bajo del parador en corto (ficha 0xE2A1, defensor 6) y el byte siguiente (16 bits)
	ld (0e2aah),de		;b381   ; guarda la velocidad x, byte bajo del parador en corto (ficha 0xE2A1, defensor 6) y el byte siguiente (16 bits)
	ld a,016h		;b385
	ld (0e2a1h),a		;b387   ; guarda la ficha del parador en corto (defensor 6) (+0: el numero (bits 0-3) y el estado (bits 4-7))
	ld a,031h		;b38a
	ld (0e2aeh),a		;b38c   ; guarda la base de destino (nibble alto; 2 abajo: llegado) del parador en corto (ficha 0xE2A1, defensor 6)
	ld hl,037ffh		;b38f
	ld (0e2afh),hl		;b392   ; guarda la y de destino del parador en corto (ficha 0xE2A1, defensor 6) y el byte siguiente (16 bits)
	ret			;b395
L_B396:
	bit 2,(hl)		;b396   ; el segunda base (0xE2C1, defensor 4): la y 0x104, la x 0x164, estado 0x14
	jr nz,L_B39C		;b398   ; con el bit 2 del tipo ya puesto, no se toca
	or (hl)			;b39a
	ld (hl),a			;b39b
L_B39C:
	ld hl,00104h		;b39c
	ld (0e2c3h),hl		;b39f   ; guarda la y (vertical) del segunda base (ficha 0xE2C1, defensor 4) y el byte siguiente (16 bits)
	ld hl,00164h		;b3a2
	ld (0e2c8h),hl		;b3a5   ; guarda la x (horizontal) del segunda base (ficha 0xE2C1, defensor 4) y el byte siguiente (16 bits)
	ld de,0c030h		;b3a8
	ld hl,0781fh		;b3ab
	ld a,020h		;b3ae
	call 040d2h		;b3b0   ; velocidad_hacia: con los bancos 7-8-9, la velocidad de HL (x, y) a DE (p00:5E9F); vuelve a 13-14-15
	ld (0e2c5h),hl		;b3b3   ; guarda la velocidad y, byte bajo del segunda base (ficha 0xE2C1, defensor 4) y el byte siguiente (16 bits)
	ld (0e2cah),de		;b3b6   ; guarda la velocidad x, byte bajo del segunda base (ficha 0xE2C1, defensor 4) y el byte siguiente (16 bits)
	ld a,014h		;b3ba
	ld (0e2c1h),a		;b3bc   ; guarda la ficha del segunda base (defensor 4) (+0: el numero (bits 0-3) y el estado (bits 4-7))
	ld a,031h		;b3bf
	ld (0e2ceh),a		;b3c1   ; guarda la base de destino (nibble alto; 2 abajo: llegado) del segunda base (ficha 0xE2C1, defensor 4)
	ld hl,037ffh		;b3c4
	ld (0e2cfh),hl		;b3c7   ; guarda la y de destino del segunda base (ficha 0xE2C1, defensor 4) y el byte siguiente (16 bits)
	ret			;b3ca
L_B3CB:
	ld hl,00188h		;b3cb   ; el receptor (0xE2E1, defensor 2) en la y 0x188 y la x 0x137, estado 0x22
	ld (0e2e3h),hl		;b3ce   ; guarda la y (vertical) del receptor (ficha 0xE2E1, defensor 2) y el byte siguiente (16 bits)
	ld hl,00137h		;b3d1
	ld (0e2e8h),hl		;b3d4   ; guarda la x (horizontal) del receptor (ficha 0xE2E1, defensor 2) y el byte siguiente (16 bits)
	ld de,078b8h		;b3d7
	ld a,022h		;b3da
	ld (0e2e1h),a		;b3dc   ; guarda la ficha del receptor (defensor 2) (+0: el numero (bits 0-3) y el estado (bits 4-7))
	ld a,052h		;b3df   ; +13 = 0x52 y el sprite 0xF8
	ld (0e2eeh),a		;b3e1   ; guarda la base de destino (nibble alto; 2 abajo: llegado) del receptor (ficha 0xE2E1, defensor 2)
	ld a,0f8h		;b3e4
	ld (0e2edh),a		;b3e6   ; guarda el dibujo de su sprite del receptor (ficha 0xE2E1, defensor 2)
	ret			;b3e9
L_B3EA:
	ld de,078b8h		;b3ea   ; el receptor (0xE2E1) sale: la velocidad hacia el punto, estado 0x12
	ld hl,078a4h		;b3ed
	ld a,020h		;b3f0
	call 040d2h		;b3f2   ; velocidad_hacia: con los bancos 7-8-9, la velocidad de HL (x, y) a DE (p00:5E9F); vuelve a 13-14-15
	ld (0e2e5h),hl		;b3f5   ; guarda la velocidad y, byte bajo del receptor (ficha 0xE2E1, defensor 2) y el byte siguiente (16 bits)
	ld (0e2eah),de		;b3f8   ; guarda la velocidad x, byte bajo del receptor (ficha 0xE2E1, defensor 2) y el byte siguiente (16 bits)
	ld a,012h		;b3fc
	ld (0e2e1h),a		;b3fe   ; guarda la ficha del receptor (defensor 2) (+0: el numero (bits 0-3) y el estado (bits 4-7))
	ld a,051h		;b401   ; +13 = 0x51, +11 = 1 y destino 0x3788
	ld (0e2eeh),a		;b403   ; guarda la base de destino (nibble alto; 2 abajo: llegado) del receptor (ficha 0xE2E1, defensor 2)
	ld a,001h		;b406
	ld (0e2ech),a		;b408   ; guarda las marcas del receptor (ficha 0xE2E1, defensor 2)
	ld hl,03788h		;b40b
	ld (0e2efh),hl		;b40e   ; guarda la y de destino del receptor (ficha 0xE2E1, defensor 2) y el byte siguiente (16 bits)
	ld a,010h		;b411   ; 16 cuadros (0xEC48)
	ld (0ec48h),a		;b413
	ret			;b416
L_B417:
	ld hl,0ec60h		;b417   ; el lanzador (0xE2F1, defensor 1) sale: estado 0x11, +13 = 0x21, destino 0xB040
	ld de,07860h		;b41a
	ld a,020h		;b41d   ; la velocidad hacia el punto
	call 040d2h		;b41f   ; velocidad_hacia: con los bancos 7-8-9, la velocidad de HL (x, y) a DE (p00:5E9F); vuelve a 13-14-15
	ld (0e2f5h),hl		;b422   ; guarda la velocidad y, byte bajo del lanzador (ficha 0xE2F1, defensor 1) y el byte siguiente (16 bits)
	ld (0e2fah),de		;b425   ; guarda la velocidad x, byte bajo del lanzador (ficha 0xE2F1, defensor 1) y el byte siguiente (16 bits)
	ld a,011h		;b429
	ld (0e2f1h),a		;b42b   ; guarda la ficha del lanzador (defensor 1) (+0: el numero (bits 0-3) y el estado (bits 4-7))
	ld a,021h		;b42e
	ld (0e2feh),a		;b430   ; guarda la base de destino (nibble alto; 2 abajo: llegado) del lanzador (ficha 0xE2F1, defensor 1)
	ld hl,0b040h		;b433
	ld (0e2ffh),hl		;b436   ; guarda la y de destino del lanzador (ficha 0xE2F1, defensor 1) y el byte siguiente (16 bits)
	ret			;b439
L_B43A:
	ld hl,00460h		;b43a   ; el lanzador (0xE2F1): estado 0x11, +13 = 0x41, destino 0xC440
	ld de,07860h		;b43d
	ld a,020h		;b440   ; la velocidad hacia el punto
	call 040d2h		;b442   ; velocidad_hacia: con los bancos 7-8-9, la velocidad de HL (x, y) a DE (p00:5E9F); vuelve a 13-14-15
	ld (0e2f5h),hl		;b445   ; guarda la velocidad y, byte bajo del lanzador (ficha 0xE2F1, defensor 1) y el byte siguiente (16 bits)
	ld (0e2fah),de		;b448   ; guarda la velocidad x, byte bajo del lanzador (ficha 0xE2F1, defensor 1) y el byte siguiente (16 bits)
	ld a,011h		;b44c
	ld (0e2f1h),a		;b44e   ; guarda la ficha del lanzador (defensor 1) (+0: el numero (bits 0-3) y el estado (bits 4-7))
	ld a,041h		;b451
	ld (0e2feh),a		;b453   ; guarda la base de destino (nibble alto; 2 abajo: llegado) del lanzador (ficha 0xE2F1, defensor 1)
	ld hl,0c440h		;b456
	ld (0e2ffh),hl		;b459   ; guarda la y de destino del lanzador (ficha 0xE2F1, defensor 1) y el byte siguiente (16 bits)
	ret			;b45c
L_B45D:
	ld hl,078a4h		;b45d   ; el lanzador (0xE2F1): estado 0x11, +13 = 0x51, destino 0x3788
	ld de,07860h		;b460
	ld a,020h		;b463   ; la velocidad hacia el punto
	call 040d2h		;b465   ; velocidad_hacia: con los bancos 7-8-9, la velocidad de HL (x, y) a DE (p00:5E9F); vuelve a 13-14-15
	ld (0e2f5h),hl		;b468   ; guarda la velocidad y, byte bajo del lanzador (ficha 0xE2F1, defensor 1) y el byte siguiente (16 bits)
	ld (0e2fah),de		;b46b   ; guarda la velocidad x, byte bajo del lanzador (ficha 0xE2F1, defensor 1) y el byte siguiente (16 bits)
	ld a,011h		;b46f
	ld (0e2f1h),a		;b471   ; guarda la ficha del lanzador (defensor 1) (+0: el numero (bits 0-3) y el estado (bits 4-7))
	ld a,051h		;b474
	ld (0e2feh),a		;b476   ; guarda la base de destino (nibble alto; 2 abajo: llegado) del lanzador (ficha 0xE2F1, defensor 1)
	ld hl,03788h		;b479
	ld (0e2ffh),hl		;b47c   ; guarda la y de destino del lanzador (ficha 0xE2F1, defensor 1) y el byte siguiente (16 bits)
	ret			;b47f
L_B480:
	ld hl,00460h		;b480   ; el tercera base (0xE2B1, defensor 5) sale: estado 0x15, +13 = 0x41, destino 0xC440
	ld de,00438h		;b483
	ld a,020h		;b486   ; la velocidad hacia el punto
	call 040d2h		;b488   ; velocidad_hacia: con los bancos 7-8-9, la velocidad de HL (x, y) a DE (p00:5E9F); vuelve a 13-14-15
	ld (0e2b5h),hl		;b48b   ; guarda la velocidad y, byte bajo del tercera base (ficha 0xE2B1, defensor 5) y el byte siguiente (16 bits)
	ld (0e2bah),de		;b48e   ; guarda la velocidad x, byte bajo del tercera base (ficha 0xE2B1, defensor 5) y el byte siguiente (16 bits)
	ld a,015h		;b492
	ld (0e2b1h),a		;b494   ; guarda la ficha del tercera base (defensor 5) (+0: el numero (bits 0-3) y el estado (bits 4-7))
	ld a,041h		;b497
	ld (0e2beh),a		;b499   ; guarda la base de destino (nibble alto; 2 abajo: llegado) del tercera base (ficha 0xE2B1, defensor 5)
	ld hl,0c440h		;b49c
	ld (0e2bfh),hl		;b49f   ; guarda la y de destino del tercera base (ficha 0xE2B1, defensor 5) y el byte siguiente (16 bits)
	ret			;b4a2
L_B4A3:
	ld hl,00460h		;b4a3   ; el parador en corto (0xE2A1) sale: estado 0x16, +13 = 0x41, destino 0xC440
	ld de,04030h		;b4a6
	ld a,020h		;b4a9   ; la velocidad hacia el punto
	call 040d2h		;b4ab   ; velocidad_hacia: con los bancos 7-8-9, la velocidad de HL (x, y) a DE (p00:5E9F); vuelve a 13-14-15
	ld (0e2a5h),hl		;b4ae   ; guarda la velocidad y, byte bajo del parador en corto (ficha 0xE2A1, defensor 6) y el byte siguiente (16 bits)
	ld (0e2aah),de		;b4b1   ; guarda la velocidad x, byte bajo del parador en corto (ficha 0xE2A1, defensor 6) y el byte siguiente (16 bits)
	ld a,016h		;b4b5
	ld (0e2a1h),a		;b4b7   ; guarda la ficha del parador en corto (defensor 6) (+0: el numero (bits 0-3) y el estado (bits 4-7))
	ld a,041h		;b4ba
	ld (0e2aeh),a		;b4bc   ; guarda la base de destino (nibble alto; 2 abajo: llegado) del parador en corto (ficha 0xE2A1, defensor 6)
	ld hl,0c440h		;b4bf
	ld (0e2afh),hl		;b4c2   ; guarda la y de destino del parador en corto (ficha 0xE2A1, defensor 6) y el byte siguiente (16 bits)
	ret			;b4c5
L_B4C6:
	ld hl,0ec60h		;b4c6   ; el primera base (0xE2D1, defensor 3) sale: estado 0x13, +13 = 0x21, destino 0xB040
	ld de,06838h		;b4c9
	ld a,020h		;b4cc   ; la velocidad hacia el punto
	call 040d2h		;b4ce   ; velocidad_hacia: con los bancos 7-8-9, la velocidad de HL (x, y) a DE (p00:5E9F); vuelve a 13-14-15
	ld (0e2d5h),hl		;b4d1   ; guarda la velocidad y, byte bajo del primera base (ficha 0xE2D1, defensor 3) y el byte siguiente (16 bits)
	ld (0e2dah),de		;b4d4   ; guarda la velocidad x, byte bajo del primera base (ficha 0xE2D1, defensor 3) y el byte siguiente (16 bits)
	ld a,013h		;b4d8
	ld (0e2d1h),a		;b4da   ; guarda la ficha del primera base (defensor 3) (+0: el numero (bits 0-3) y el estado (bits 4-7))
	ld a,021h		;b4dd
	ld (0e2deh),a		;b4df   ; guarda la base de destino (nibble alto; 2 abajo: llegado) del primera base (ficha 0xE2D1, defensor 3)
	ld hl,0b040h		;b4e2
	ld (0e2dfh),hl		;b4e5   ; guarda la y de destino del primera base (ficha 0xE2D1, defensor 3) y el byte siguiente (16 bits)
	ret			;b4e8
L_B4E9:
	ld hl,0ec60h		;b4e9   ; el segunda base (0xE2C1) sale: estado 0x14
	ld de,0c030h		;b4ec
	ld a,020h		;b4ef   ; la velocidad hacia el punto
	call 040d2h		;b4f1   ; velocidad_hacia: con los bancos 7-8-9, la velocidad de HL (x, y) a DE (p00:5E9F); vuelve a 13-14-15
	ld (0e2c5h),hl		;b4f4   ; guarda la velocidad y, byte bajo del segunda base (ficha 0xE2C1, defensor 4) y el byte siguiente (16 bits)
	ld (0e2cah),de		;b4f7   ; guarda la velocidad x, byte bajo del segunda base (ficha 0xE2C1, defensor 4) y el byte siguiente (16 bits)
	ld a,014h		;b4fb
	ld (0e2c1h),a		;b4fd   ; guarda la ficha del segunda base (defensor 4) (+0: el numero (bits 0-3) y el estado (bits 4-7))
	ld a,021h		;b500
	ld (0e2ceh),a		;b502   ; guarda la base de destino (nibble alto; 2 abajo: llegado) del segunda base (ficha 0xE2C1, defensor 4)
	ld hl,0b040h		;b505
	ld (0e2cfh),hl		;b508   ; guarda la y de destino del segunda base (ficha 0xE2C1, defensor 4) y el byte siguiente (16 bits)
	ret			;b50b
L_B50C:
	ld hl,0ec60h		;b50c   ; el segunda base (0xE2C1): en la y 0x128 y la x 0x190, con la velocidad hacia el punto, estado 0x14
	ld de,0d048h		;b50f
	ld a,020h		;b512
	call 040d2h		;b514   ; velocidad_hacia: con los bancos 7-8-9, la velocidad de HL (x, y) a DE (p00:5E9F); vuelve a 13-14-15
	ld (0e2c5h),hl		;b517   ; guarda la velocidad y, byte bajo del segunda base (ficha 0xE2C1, defensor 4) y el byte siguiente (16 bits)
	ld (0e2cah),de		;b51a   ; guarda la velocidad x, byte bajo del segunda base (ficha 0xE2C1, defensor 4) y el byte siguiente (16 bits)
	ld hl,00128h		;b51e
	ld (0e2c3h),hl		;b521   ; guarda la y (vertical) del segunda base (ficha 0xE2C1, defensor 4) y el byte siguiente (16 bits)
	ld hl,00190h		;b524
	ld (0e2c8h),hl		;b527   ; guarda la x (horizontal) del segunda base (ficha 0xE2C1, defensor 4) y el byte siguiente (16 bits)
	ld a,014h		;b52a
	ld (0e2c1h),a		;b52c   ; guarda la ficha del segunda base (defensor 4) (+0: el numero (bits 0-3) y el estado (bits 4-7))
	ld a,021h		;b52f
	ld (0e2ceh),a		;b531   ; guarda la base de destino (nibble alto; 2 abajo: llegado) del segunda base (ficha 0xE2C1, defensor 4)
	ld hl,0b040h		;b534
	ld (0e2cfh),hl		;b537   ; guarda la y de destino del segunda base (ficha 0xE2C1, defensor 4) y el byte siguiente (16 bits)
	ret			;b53a
L_B53B:
	ld a,(0ed7ch)		;b53b   ; las coberturas: un toque, o una bola corta y lenta...
	or a			;b53e   ; con 0xED7C (el toque), las del toque
	jr nz,L_B564		;b53f
	ld hl,(0e215h)		;b541   ; |vy| + |vx| de la pelota...
	ld de,(0e21ah)		;b544   ; lee la velocidad x de la pelota y el byte siguiente (16 bits)
	ld a,h			;b548
	rla			;b549
	call c,menos_hl_15		;b54a   ; menos_hl_15: HL = -HL
	ld a,d			;b54d
	rla			;b54e
	call c,menos_de_15		;b54f   ; menos_de_15: DE = -DE
	add hl,de			;b552
	ld a,h			;b553   ; ...de 0x180 o mas: nada mas
	or a			;b554
	jr z,L_B55E		;b555
	cp 002h		;b557
	ret nc			;b559
	ld a,l			;b55a
	cp 080h		;b55b
	ret nc			;b55d
L_B55E:
	ld a,(0e227h)		;b55e   ; un golpe de tipo 2 o mas: nada mas
	cp 002h		;b561
	ret nc			;b563
L_B564:
	pop hl			;b564   ; no vuelve a quien llamo: se queda aqui
	ld hl,0ed9dh		;b565   ; apunta a el tipo de golpe (1-7)
	ld a,(0e21bh)		;b568   ; hacia la izquierda: tipo 6; si no, 5
	rla			;b56b
	ld a,006h		;b56c
	jr c,L_B57E		;b56e
	dec a			;b570
	ld (hl),a			;b571
	call L_B50C		;b572   ; el segunda base, el parador, el tercera base y el receptor
	call L_B338		;b575
	call L_B480		;b578
	jp L_B3EA		;b57b
L_B57E:
	ld (hl),a			;b57e
	call L_B4C6		;b57f   ; el primera base, el segunda base, el parador y el receptor
	call L_B39C		;b582
	call L_B4A3		;b585
	jp L_B3EA		;b588
L_B58B:
	call menos_de_15		;b58b   ; |vx|
	ld a,h			;b58e   ; segun el signo de la vy...
	rla			;b58f
	jr nc,L_B5B1		;b590
	call menos_hl_15		;b592   ; ...|vy| - |vx|: hacia donde va mas
	or a			;b595
	sbc hl,de		;b596
	rl h		;b598
	ld hl,0ed9dh		;b59a   ; apunta a el tipo de golpe (1-7)
	jr c,L_B5A8		;b59d
	ld a,004h		;b59f   ; tipo 4: el lanzador y el primera base
	ld (hl),a			;b5a1
	call L_B43A		;b5a2
	jp L_B4C6		;b5a5
L_B5A8:
	ld a,002h		;b5a8   ; tipo 2: el tercera base y el primera base
	ld (hl),a			;b5aa
	call L_B480		;b5ab
	jp L_B4C6		;b5ae
L_B5B1:
	or a			;b5b1
	sbc hl,de		;b5b2
	rl h		;b5b4
	ld hl,0ed9dh		;b5b6   ; apunta a el tipo de golpe (1-7)
	jr nc,L_B5C4		;b5b9
	ld a,002h		;b5bb   ; tipo 2: el primera base y el tercera base
	ld (hl),a			;b5bd
	call L_B4C6		;b5be
	jp L_B480		;b5c1
L_B5C4:
	ld a,001h		;b5c4   ; tipo 1: el lanzador y el tercera base
	ld (hl),a			;b5c6
	call L_B417		;b5c7
	jp L_B480		;b5ca
L_B5CD:
	ld hl,0e27eh		;b5cd   ; carry si ningun defensor esta en el estado C
	ld de,00010h		;b5d0
L_B5D3:
	ld a,(hl)			;b5d3   ; el estado (nibble alto de +13) de cada uno contra C
	and 0f0h		;b5d4
	cp c			;b5d6
	ret z			;b5d7
	add hl,de			;b5d8
	djnz L_B5D3		;b5d9
	scf			;b5db
	ret			;b5dc
menos_hl_15:		; HL = -HL
	ld a,l			;b5dd   ; HL = -HL
	cpl			;b5de
	ld l,a			;b5df
	ld a,h			;b5e0
	cpl			;b5e1
	ld h,a			;b5e2
	inc hl			;b5e3
	ret			;b5e4
menos_de_15:		; DE = -DE
	ld a,e			;b5e5   ; DE = -DE
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
	defb 0c8h,000h,0e8h,001h,088h,000h,038h,001h,0c8h,000h,088h,000h,010h,001h,000h,001h	; b5ed  ......8.........	los sitios de partida de los 9 defensores: la y y la x (2 + 2 bytes), del 9 al 1
	defb 038h,001h,0c4h,000h,010h,001h,080h,001h,038h,001h,0a0h,001h,098h,001h,038h,001h	; b5fd  8.......8.....8.
	defb 040h,001h,038h,001h	; b60d

; ======================================================================
; CODIGO 0xb611..0xb68c  (123 bytes)
; ======================================================================


pelota_al_lanzador:		; la pelota en manos del lanzador
	ld a,001h		;b611   ; la pelota en manos del lanzador (1): en (0x48, 0x38)
	ld (0e2fch),a		;b613   ; guarda las marcas del lanzador (ficha 0xE2F1, defensor 1)
	ld (0e2f1h),a		;b616   ; el lanzador: estado 1
	ld (0e220h),a		;b619   ; guarda el defensor que tiene la pelota (1-9; 0 nadie)
	ld de,03848h		;b61c   ; la pelota en (0x48, 0x38)
	ld a,001h		;b61f
	jr L_B656		;b621
pelota_tras_robo:		; tras un robo, la pelota al lanzador o al receptor
	ld a,(0e337h)		;b623   ; tras un robo: el lanzador o, si ya lanzo, el receptor (2) con la pelota
	or a			;b626   ; si ya lanzo (0xE337) o con 0xEDDD, el receptor
	jr nz,L_B643		;b627
	ld a,(0edddh)		;b629
	or a			;b62c
	jr nz,L_B643		;b62d
	ld a,001h		;b62f
	ld (0e2fch),a		;b631   ; guarda las marcas del lanzador (ficha 0xE2F1, defensor 1)
	ld (0e220h),a		;b634   ; guarda el defensor que tiene la pelota (1-9; 0 nadie)
	ld a,021h		;b637   ; estado 0x21, la pelota en (0x40, 0x38)
	ld (0e2f1h),a		;b639   ; guarda la ficha del lanzador (defensor 1) (+0: el numero (bits 0-3) y el estado (bits 4-7))
	ld de,03840h		;b63c
	ld a,001h		;b63f
	jr L_B656		;b641
L_B643:
	ld a,001h		;b643
	ld (0e2ech),a		;b645   ; guarda las marcas del receptor (ficha 0xE2E1, defensor 2)
	inc a			;b648   ; el receptor (2) la tiene: estado 0x22, en (0x98, 0x38)
	ld (0e220h),a		;b649   ; guarda el defensor que tiene la pelota (1-9; 0 nadie)
	ld a,022h		;b64c
	ld (0e2e1h),a		;b64e   ; guarda la ficha del receptor (defensor 2) (+0: el numero (bits 0-3) y el estado (bits 4-7))
	ld de,03898h		;b651
	ld a,002h		;b654
L_B656:
	ld (0e220h),a		;b656   ; la pelota en la mano: su y y su x (con el byte alto a 1)...
	ld hl,0e212h		;b659
	ld (hl),000h		;b65c   ; la y = 0x1xx: E en el byte medio...
	inc hl			;b65e
	ld (hl),e			;b65f
	inc hl			;b660
	ld (hl),001h		;b661
	inc hl			;b663
	inc hl			;b664
	inc hl			;b665
	ld (hl),000h		;b666   ; ...y la x = 0x1xx: D en el byte medio
	inc hl			;b668
	ld (hl),d			;b669
	inc hl			;b66a
	ld (hl),001h		;b66b
	ld a,001h		;b66d   ; ...cogida (0xE33C), estado 3...
	ld (0e33ch),a		;b66f
	ld a,003h		;b672
	ld (0e211h),a		;b674   ; guarda la ficha de 16 bytes de la pelota
	xor a			;b677
	ld (0e302h),a		;b678   ; 0xE302 y 0xED39 a 0
	ld (0ed39h),a		;b67b
	ld hl,0e2adh		;b67e   ; ...y los 6 de detras con el dibujo 0x68
	ld de,00010h		;b681
	ld b,006h		;b684
L_B686:
	ld (hl),068h		;b686   ; el sprite 0x68
	add hl,de			;b688
	djnz L_B686		;b689
	ret			;b68b

; ----------------------------------------------------------------------
; DATOS texto_suelto_B68C: con forma de texto ([x y], caracteres y 0xFF), pero
;   ninguna instruccion ni palabra lo apunta: SIN LECTOR A LA VISTA; lo leen
;   nadie (7 bytes)
;   0xb68c..0xb693  (7 bytes)
DATA_texto_suelto_B68C:
	defb 070h,078h,010h,00fh,01ch,022h,0ffh	; b68c	datos sin lector a la vista

; ======================================================================
; CODIGO 0xb693..0xb8dc  (585 bytes)
; ======================================================================


L_B693:
	ld a,(0e1a2h)		;b693   ; TEAM EDIT, las cifras: la fila (0xE1A2) y la columna (0xE1A3)...
	cp 00dh		;b696   ; la fila 13 o mas: los lanzadores (p15:B801)
	ld a,(0e1a3h)		;b698
	jp nc,L_B801		;b69b
	cp 00ah		;b69e   ; columnas 0-9: el promedio; 10-11: velocidad y defensa
	jr c,L_B70B		;b6a0
	cp 00ch		;b6a2
	jp c,L_B79B		;b6a4
	ld a,(0e1a2h)		;b6a7   ; ...de un jugador de campo: la cifra en el nibble que toca...
	dec a			;b6aa
	ld hl,0e1d8h		;b6ab   ; la casilla del jugador en 0xE1D8
	call 04216h		;b6ae   ; hl_mas_a: HL = HL + A
	ld a,(0e1afh)		;b6b1   ; B = la cifra elegida (0xE1AF)
	ld b,a			;b6b4
	ld a,(0e1a3h)		;b6b5
	sub 00ch		;b6b8   ; columna 12: la cifra alta; 13: la baja
	jr z,L_B6C9		;b6ba
	ld a,(hl)			;b6bc   ; la baja = B - 1...
	and 0f0h		;b6bd
	ld c,a			;b6bf
	ld a,b			;b6c0
	dec a			;b6c1
	and 00fh		;b6c2
	or c			;b6c4
	ld c,(hl)			;b6c5   ; ...guardando la de antes en C
	ld (hl),a			;b6c6
	jr L_B6D8		;b6c7
L_B6C9:
	ld a,(hl)			;b6c9   ; la alta = B - 1
	and 00fh		;b6ca   ; C = la baja de antes
	ld c,a			;b6cc
	ld a,b			;b6cd
	dec a			;b6ce
	rla			;b6cf   ; B - 1 a la mitad alta
	rla			;b6d0
	rla			;b6d1
	rla			;b6d2
	and 0f0h		;b6d3
	or c			;b6d5   ; junto con la baja
	ld c,(hl)			;b6d6   ; la de antes en C, la nueva en su sitio
	ld (hl),a			;b6d7
L_B6D8:
	push hl			;b6d8   ; ...los puntos usados no pueden pasar de 600: si pasa, se deshace
	ld de,0e1d8h		;b6d9
	ld b,00ch		;b6dc   ; la suma de los 12
	call suma_bcd		;b6de   ; suma_bcd: HL = la suma BCD de B bytes de DE
	ex de,hl			;b6e1
	ld hl,0e1e4h		;b6e2
	ld (hl),e			;b6e5   ; a 0xE1E4
	inc hl			;b6e6
	ld (hl),d			;b6e7
	xor a			;b6e8   ; 0x600 - la suma (BCD)...
	sub e			;b6e9
	daa			;b6ea
	ld e,a			;b6eb
	ld a,006h		;b6ec
	sbc a,d			;b6ee
	daa			;b6ef
	ld d,a			;b6f0
	rl d		;b6f1   ; ...si pasa, se deshace
	pop hl			;b6f3
	jr nc,L_B6F8		;b6f4
	ld (hl),c			;b6f6
	ret			;b6f7
L_B6F8:
	ld d,e			;b6f8   ; ...los que quedan, en 0xE1E6
	ld e,a			;b6f9
	ld (0e1e6h),de		;b6fa
L_B6FE:
	ld hl,0e1e6h		;b6fe   ; los puntos que quedan, 3 cifras en (0x8B, 0xCC)
	ld de,0cc8bh		;b701
	ld b,003h		;b704   ; 3 cifras en (0x8B, 0xCC)
	jp 05c34h		;b706   ; cifras_bcd: B cifras BCD con ceros, empezando por la baja si B es impar
L_B709:
	scf			;b709   ; carry: no vale
	ret			;b70a
L_B70B:
	ld a,(0e1a2h)		;b70b   ; el promedio de bateo de un jugador (dos cifras BCD de 0xE1B4 + 2n)...
	dec a			;b70e   ; dos bytes por jugador en 0xE1B4
	add a,a			;b70f
	ld hl,0e1b4h		;b710
	call 04216h		;b713   ; hl_mas_a: HL = HL + A
	ld a,(0e1afh)		;b716
	ld b,a			;b719
	add a,a			;b71a
	ld a,(0e1a3h)		;b71b
	sub 007h		;b71e   ; la cifra que toca (columna - 7)
	ld d,a			;b720
	call cifra_en_casilla		;b721   ; ...la cifra nueva (p15:BA0A)...
	ld b,a			;b724
	ld a,d			;b725
	or a			;b726   ; la de las decenas...
	jr nz,L_B73E		;b727
	ld a,b			;b729   ; ...la de las decenas de 1 a 3, y si es 1 la otra al menos 0x50...
	cp 004h		;b72a   ; ...de 4 o mas, o 0, no vale
	jr nc,L_B709		;b72c
	or a			;b72e
	jr z,L_B709		;b72f
	dec a			;b731   ; con un 1 en las decenas, el minimo 0x50 en las unidades
	jr nz,L_B74C		;b732
	dec hl			;b734
	ld a,(hl)			;b735
	cp 050h		;b736
	call c,L_B775		;b738
	inc hl			;b73b
	jr L_B74C		;b73c
L_B73E:
	dec a			;b73e   ; las otras cifras: con 1 en las decenas...
	jr nz,L_B74C		;b73f
	inc hl			;b741
	ld a,(hl)			;b742
	dec hl			;b743
	dec a			;b744
	jr nz,L_B74C		;b745
	ld a,b			;b747   ; ...las unidades no bajan de 0x50
	cp 050h		;b748
	jr c,L_B709		;b74a
L_B74C:
	ld a,b			;b74c   ; ...se guarda y la suma de los 12 no puede pasar de 0x350
	ld c,(hl)			;b74d
	push bc			;b74e   ; la de antes en C
	ld (hl),a			;b74f
	ld (0e22dh),hl		;b750   ; donde va, en 0xE22D
	ld hl,0e1ech		;b753   ; la suma de los 12
	ld de,0e1b4h		;b756
	ld b,00ch		;b759
	call suma_bcd_16		;b75b   ; suma_bcd_16: la suma BCD de B palabras de DE, guardada en HL
	ld bc,03500h		;b75e   ; 0x3500 - la suma; carry si pasa
	call bc_menos_hl		;b761   ; bc_menos_hl: HL = BC - HL (BCD); carry si pasa
	pop bc			;b764
	jr c,L_B796		;b765
	ld (0e1eeh),hl		;b767   ; lo que queda, a 0xE1EE
L_B76A:
	ld hl,0e1eeh		;b76a   ; los puntos de bateo que quedan, 2 cifras en (0x8B, 0x80)
	ld de,0808bh		;b76d   ; 2 cifras en (0x8B, 0x80)
	ld b,002h		;b770
	jp 05c34h		;b772   ; cifras_bcd: B cifras BCD con ceros, empezando por la baja si B es impar
L_B775:
	ld (hl),050h		;b775   ; el minimo 0x50 con el aviso de 0xB8DF
	push hl			;b777
	push de			;b778
	ld hl,0b8dfh		;b779   ; el texto de 0xB8DF en la x 0x90
	ld d,090h		;b77c
	jr L_B787		;b77e
L_B780:
	push hl			;b780   ; el aviso de 0xB8DC
	push de			;b781
	ld hl,0b8dch		;b782
	ld d,07ch		;b785
L_B787:
	push bc			;b787
	ld a,(0e100h)		;b788   ; la y: la del cursor (0xE100) + 1
	inc a			;b78b
	ld e,a			;b78c
	ld c,0ffh		;b78d   ; con el color 0xFF
	call 04eb5h		;b78f   ; texto_en_de: pinta el texto HL en la posicion DE (sin [x y] delante)
	pop bc			;b792
	pop de			;b793
	pop hl			;b794
	ret			;b795
L_B796:
	ld hl,(0e22dh)		;b796   ; no cabe: se deshace
	ld (hl),c			;b799
	ret			;b79a
L_B79B:
	ld a,(0e1a2h)		;b79b   ; la velocidad o la defensa de un jugador (nibbles de 0xE1CC)...
	dec a			;b79e
	ld hl,0e1cch		;b79f   ; la casilla en 0xE1CC
	call 04216h		;b7a2   ; hl_mas_a: HL = HL + A
	ld a,(0e1afh)		;b7a5
	ld b,a			;b7a8
	ld a,(0e1a3h)		;b7a9
	sub 00ah		;b7ac   ; columna 10: la alta (p15:B7BD); 11: la baja
	jr z,L_B7BD		;b7ae
	ld a,(hl)			;b7b0   ; la baja = B - 1
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
	ld a,006h		;b7bd   ; ...la de la izquierda hasta 6...
	cp b			;b7bf
	ret c			;b7c0
	ld a,(hl)			;b7c1   ; la alta = B - 1
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
	push hl			;b7d0   ; ...la suma de los 12 no puede pasar de 200
	ld de,0e1cch		;b7d1   ; la suma de los 12
	ld b,00ch		;b7d4
	call suma_bcd		;b7d6   ; suma_bcd: HL = la suma BCD de B bytes de DE
	ex de,hl			;b7d9
	ld hl,0e1e8h		;b7da   ; a 0xE1E8
	ld (hl),e			;b7dd
	inc hl			;b7de
	ld (hl),d			;b7df
	xor a			;b7e0   ; 0x200 - la suma; si pasa, se deshace
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
	ld d,e			;b7f0   ; lo que queda a 0xE1EA
	ld e,a			;b7f1
	ld (0e1eah),de		;b7f2
L_B7F6:
	ld hl,0e1eah		;b7f6   ; lo que queda, 3 cifras en (0x8B, 0xA8)
	ld de,0a88bh		;b7f9
	ld b,003h		;b7fc
	jp 05c34h		;b7fe   ; cifras_bcd: B cifras BCD con ceros, empezando por la baja si B es impar
L_B801:
	cp 00bh		;b801   ; los lanzadores: segun la columna, velocidad, aguante, curvas o el estilo...
	jr c,L_B856		;b803   ; columnas 0-10: la velocidad
	cp 00eh		;b805   ; 11-13: el aguante; 14-15: dos cifras; 16 y 17: una curva cada una
	jp c,L_B8E2		;b807
	cp 010h		;b80a
	jp c,L_B926		;b80c
	jp z,L_B9CB		;b80f
	cp 011h		;b812
	jp z,L_B98C		;b814
	ld a,(0e1a2h)		;b817   ; las de 18 en adelante: la casilla de 0xE226 + fila - 13
	sub 00dh		;b81a
	ld e,a			;b81c
	ld d,000h		;b81d
	ld hl,0e226h		;b81f
	add hl,de			;b822
	ld a,(0e1afh)		;b823   ; la cifra elegida - 1...
	dec a			;b826
	ld c,(hl)			;b827   ; ...guardando la de antes en C
	push bc			;b828
	push hl			;b829
	ld (hl),a			;b82a
	ld hl,0e226h		;b82b   ; la suma BCD de los 4 lanzadores (el primero y tres sumas)
	ld b,003h		;b82e
	ld a,(hl)			;b830
	inc hl			;b831
L_B832:
	add a,(hl)			;b832
	daa			;b833
	inc hl			;b834
	djnz L_B832		;b835
	ld (0e22ah),a		;b837   ; a 0xE22A
	ld b,a			;b83a
	ld a,025h		;b83b   ; 0x25 - la suma; si pasa, se deshace
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
	ld (0e22bh),a		;b848   ; ...lo que queda en 0xE22B
L_B84B:
	ld hl,0e22bh		;b84b   ; lo que queda de curvas, 1 cifra en (0xC7, 0xE8)
	ld de,0e8c7h		;b84e   ; 1 cifra en (0xC7, 0xE8)
	ld b,001h		;b851
	jp 05bf1h		;b853   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
L_B856:
	ld a,(0e1a2h)		;b856   ; la velocidad de un lanzador (dos cifras de 0xE1F0 + 2n)...
	sub 00dh		;b859   ; la casilla 0xE1F0 + 2 x (fila - 13)
	add a,a			;b85b   ; 2 bytes por lanzador
	ld e,a			;b85c
	ld d,000h		;b85d
	ld hl,0e1f0h		;b85f
	add hl,de			;b862
	ld a,(0e1afh)		;b863
	ld b,a			;b866   ; B = la cifra
	add a,a			;b867
	ld a,(0e1a3h)		;b868   ; la cifra que toca (columna - 8)
	sub 008h		;b86b   ; la columna - 8: 0 decenas, 1 unidades
	ld d,a			;b86d
	call cifra_en_casilla		;b86e   ; cifra_en_casilla: la cifra B en el sitio D de la casilla HL: A = el byte nuevo
	ld b,a			;b871
	ld a,d			;b872
	or a			;b873
	jr z,L_B88D		;b874   ; la primera: las decenas
	dec a			;b876   ; la segunda: si las decenas son 0...
	jr nz,L_B8B0		;b877   ; la tercera cifra: sin mas
	inc hl			;b879   ; con decenas 0...
	ld a,(hl)			;b87a
	dec hl			;b87b
	or a			;b87c
	jr z,L_B8B0		;b87d
	ld a,b			;b87f   ; ...las unidades no pasan de 5
	rra			;b880   ; ...la cifra nueva no pasa de 5
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
	ld a,b			;b88d   ; ...las decenas hasta 1 y el tope 0x59 (o 0xE1FB)...
	ld c,a			;b88e
	ld a,001h		;b88f   ; las decenas: 0 o 1
	cp c			;b891
	ret c			;b892
	ld a,b			;b893
	or a			;b894
	jr z,L_B8B0		;b895
	ld a,(hl)			;b897   ; con un 1 en las decenas...
	dec a			;b898
	jr z,L_B8B0		;b899
	dec hl			;b89b
	ld a,(hl)			;b89c   ; ...las unidades no pasan de 0x59 ni de lo que diga 0xE1FB
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
	call nz,L_B780		;b8ac   ; si cambia, el aviso de 0xB8DC
L_B8AF:
	inc hl			;b8af
L_B8B0:
	ld a,c			;b8b0   ; ...y la suma de los 4 no puede pasar de 0x540
	ld c,(hl)			;b8b1
	push hl			;b8b2
	push bc			;b8b3
	ld a,b			;b8b4   ; la cifra nueva
	ld (hl),a			;b8b5
	ld de,0e1f0h		;b8b6
	ld hl,0e204h		;b8b9   ; la suma de los 4 a 0xE204
	ld b,004h		;b8bc
	call suma_bcd_16		;b8be   ; suma_bcd_16: la suma BCD de B palabras de DE, guardada en HL
	ld bc,00540h		;b8c1   ; 0x540 - la suma; si pasa, se deshace
	call bc_menos_hl		;b8c4   ; bc_menos_hl: HL = BC - HL (BCD); carry si pasa
	pop bc			;b8c7
	pop de			;b8c8
	jr nc,L_B8CE		;b8c9
	ld a,c			;b8cb
	ld (de),a			;b8cc
	ret			;b8cd
L_B8CE:
	ld (0e1fah),hl		;b8ce
L_B8D1:
	ld hl,0e1fah		;b8d1   ; lo que queda, 3 cifras en (0xC7, 0x74)
	ld de,074c7h		;b8d4
	ld b,003h		;b8d7
	jp 05c34h		;b8d9   ; cifras_bcd: B cifras BCD con ceros, empezando por la baja si B es impar

; ----------------------------------------------------------------------
; DATOS resto_B8DC: lo apuntan con el banco puesto p15:B782 (0xB8DC), p15:B779
;   (0xB8DF); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p15:B782, p15:B779 (6 bytes)
;   0xb8dc..0xb8e2  (6 bytes)
DATA_resto_B8DC:
	defb 006h,00ah,0ffh,006h,001h,0ffh	; b8dc	los avisos ([x y] y letras)

; ======================================================================
; CODIGO 0xb8e2..0xba8e  (428 bytes)
; ======================================================================


L_B8E2:
	ld a,(0e1a2h)		;b8e2   ; el aguante de un lanzador (0xE1FC + 2n)
	sub 00dh		;b8e5   ; la casilla 0xE1FC + 2 x (fila - 13)
	add a,a			;b8e7
	ld e,a			;b8e8
	ld d,000h		;b8e9
	ld hl,0e1fch		;b8eb
	add hl,de			;b8ee
	ld a,(0e1afh)		;b8ef
	ld b,a			;b8f2
	add a,a			;b8f3
	ld a,(0e1a3h)		;b8f4   ; la cifra que toca (columna - 11)
	sub 00bh		;b8f7
	call cifra_en_casilla		;b8f9   ; cifra_en_casilla: la cifra B en el sitio D de la casilla HL: A = el byte nuevo
	ld c,(hl)			;b8fc   ; la de antes en C
	push bc			;b8fd
	push hl			;b8fe
	ld (hl),a			;b8ff   ; ...la suma de los 4 no puede pasar de 0x990
	ld de,0e1fch		;b900   ; la suma de los 4 a 0xE204
	ld hl,0e204h		;b903
	ld b,004h		;b906
	call suma_bcd_16		;b908   ; suma_bcd_16: la suma BCD de B palabras de DE, guardada en HL
	ld bc,00990h		;b90b   ; 0x990 - la suma; si pasa, se deshace
	call bc_menos_hl		;b90e   ; bc_menos_hl: HL = BC - HL (BCD); carry si pasa
	pop de			;b911
	pop bc			;b912
	jr nc,L_B918		;b913
	ld a,c			;b915
	ld (de),a			;b916
	ret			;b917
L_B918:
	ld (0e206h),hl		;b918
L_B91B:
	ld hl,0e206h		;b91b   ; lo que queda, 3 cifras en (0xC7, 0x90)
	ld de,090c7h		;b91e
	ld b,003h		;b921
	jp 05c34h		;b923   ; cifras_bcd: B cifras BCD con ceros, empezando por la baja si B es impar
L_B926:
	ld a,(0e1a2h)		;b926   ; dos cifras de un lanzador en nibbles (0xE20E + n)...
	sub 00dh		;b929   ; la casilla 0xE20E + fila - 13
	ld e,a			;b92b
	ld d,000h		;b92c
	ld hl,0e20eh		;b92e
	add hl,de			;b931
	ld a,(0e1afh)		;b932
	ld b,a			;b935
	ld a,(0e1a3h)		;b936   ; columna 14: la cifra alta; 15: la baja
	sub 00eh		;b939
	jr z,L_B94A		;b93b
	ld a,(hl)			;b93d   ; la baja = B - 1
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
	ld a,(hl)			;b94a   ; la alta = B - 1
	and 00fh		;b94b   ; C = la baja de antes
	ld c,a			;b94d
	ld a,b			;b94e
	dec a			;b94f
	rla			;b950   ; B - 1 a la mitad alta
	rla			;b951
	rla			;b952
	rla			;b953
	and 0f0h		;b954
	or c			;b956   ; junto con la baja
	ld c,(hl)			;b957   ; la de antes en C, la nueva en su sitio
	ld (hl),a			;b958
L_B959:
	push hl			;b959   ; ...la suma de los 4 no puede pasar de 200
	ld de,0e20eh		;b95a   ; la suma de los 4...
	ld b,004h		;b95d
	call suma_bcd		;b95f   ; suma_bcd: HL = la suma BCD de B bytes de DE
	ld de,0e216h		;b962   ; ...a 0xE216
	ld a,l			;b965
	ld (de),a			;b966
	inc de			;b967
	ld a,h			;b968
	ld (de),a			;b969
	ld a,000h		;b96a   ; 0x200 - la suma; si pasa, se deshace
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
	ld h,l			;b97c   ; lo que queda a 0xE218
	ld l,a			;b97d
	ld (0e218h),hl		;b97e
L_B981:
	ld hl,0e218h		;b981   ; lo que queda, 3 cifras en (0xC7, 0xAC)
	ld de,0acc7h		;b984
	ld b,003h		;b987
	jp 05c34h		;b989   ; cifras_bcd: B cifras BCD con ceros, empezando por la baja si B es impar
L_B98C:
	ld a,(0e1a2h)		;b98c   ; una curva de un lanzador (0xE220 + n): la suma de los 4 lanzadores no puede pasar de 0x25
	sub 00dh		;b98f   ; la casilla 0xE220 + fila - 13
	ld e,a			;b991
	ld d,000h		;b992
	ld hl,0e220h		;b994
	add hl,de			;b997
	ld a,(0e1afh)		;b998
	dec a			;b99b   ; la cifra elegida - 1, con la de antes en C
	ld c,(hl)			;b99c
	push bc			;b99d
	push hl			;b99e
	ld (hl),a			;b99f
	ld hl,0e220h		;b9a0   ; la suma BCD de los 4 (el primero y tres sumas)
	ld b,003h		;b9a3
	ld a,(hl)			;b9a5
	inc hl			;b9a6
L_B9A7:
	add a,(hl)			;b9a7
	inc hl			;b9a8
	daa			;b9a9
	djnz L_B9A7		;b9aa
	ld (0e224h),a		;b9ac   ; a 0xE224
	ld b,a			;b9af
	ld a,025h		;b9b0   ; 0x25 - la suma; si pasa, se deshace
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
	ld hl,0e225h		;b9c0   ; lo que queda, 1 cifra en (0xC7, 0xD8)
	ld de,0d8c7h		;b9c3
	ld b,001h		;b9c6
	jp 05bf1h		;b9c8   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
L_B9CB:
	ld a,(0e1a2h)		;b9cb   ; la otra curva (0xE21A + n): igual
	sub 00dh		;b9ce   ; la casilla 0xE21A + fila - 13
	ld e,a			;b9d0
	ld d,000h		;b9d1
	ld hl,0e21ah		;b9d3
	add hl,de			;b9d6
	ld a,(0e1afh)		;b9d7
	dec a			;b9da
	ld c,(hl)			;b9db
	ld (hl),a			;b9dc
	push bc			;b9dd
	push hl			;b9de
	ld hl,0e21ah		;b9df   ; la suma de los 4
	ld b,003h		;b9e2
	ld a,(hl)			;b9e4
	inc hl			;b9e5
L_B9E6:
	add a,(hl)			;b9e6
	inc hl			;b9e7
	daa			;b9e8
	djnz L_B9E6		;b9e9
	ld (0e21eh),a		;b9eb   ; a 0xE21E
	ld b,a			;b9ee
	ld a,025h		;b9ef   ; 0x25 - la suma; si pasa, se deshace
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
	ld hl,0e21fh		;b9ff   ; lo que queda, 1 cifra en (0xC7, 0xC8)
	ld de,0c8c7h		;ba02
	ld b,001h		;ba05
	jp 05bf1h		;ba07   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
cifra_en_casilla:		; la cifra B en el sitio D de la casilla HL: A = el byte nuevo
	jr z,L_BA19		;ba0a   ; la cifra B en el sitio D: 0 la segunda, 1 el nibble alto, 2 el bajo
	dec a			;ba0c   ; D = 1: la cifra alta de (HL)
	jr z,L_BA1F		;ba0d
	ld a,(hl)			;ba0f   ; D = 2: la baja = B - 1
	and 0f0h		;ba10
	ld c,a			;ba12
	ld a,b			;ba13
	dec a			;ba14
	and 00fh		;ba15
	or c			;ba17
	ret			;ba18
L_BA19:
	inc hl			;ba19   ; D = 0: el byte siguiente, la baja
	ld a,b			;ba1a
	dec a			;ba1b
	and 00fh		;ba1c
	ret			;ba1e
L_BA1F:
	ld a,(hl)			;ba1f   ; la alta = B - 1
	and 00fh		;ba20   ; C = la baja de antes
	ld c,a			;ba22
	ld a,b			;ba23
	dec a			;ba24
	rla			;ba25   ; B - 1 a la mitad alta
	rla			;ba26
	rla			;ba27
	rla			;ba28
	and 0f0h		;ba29
	or c			;ba2b   ; junto con la baja (el byte nuevo en A)
	ret			;ba2c
suma_bcd_16:		; la suma BCD de B palabras de DE, guardada en HL
	push hl			;ba2d   ; la suma BCD de B palabras de DE, guardada en HL
	ld hl,00000h		;ba2e
L_BA31:
	ld a,(de)			;ba31   ; cada palabra sumada en BCD
	inc de			;ba32
	add a,l			;ba33
	daa			;ba34
	ld l,a			;ba35
	ld a,(de)			;ba36   ; el byte alto con el acarreo
	inc de			;ba37
	adc a,h			;ba38
	daa			;ba39
	ld h,a			;ba3a
	djnz L_BA31		;ba3b
	pop de			;ba3d   ; la suma a (HL de antes)
	ld a,l			;ba3e
	ld (de),a			;ba3f
	inc de			;ba40
	ld a,h			;ba41
	ld (de),a			;ba42
	ret			;ba43
bc_menos_hl:		; HL = BC - HL (BCD); carry si pasa
	ld a,c			;ba44   ; HL = BC - HL (BCD); carry si pasa
	sub l			;ba45   ; la cifra baja
	daa			;ba46
	ld l,a			;ba47
	ld a,b			;ba48   ; la alta con el acarreo; D guarda el signo
	sbc a,h			;ba49
	ld d,a			;ba4a
	daa			;ba4b
	rl d		;ba4c   ; carry: no cabe
	ret c			;ba4e
	ld h,l			;ba4f
	ld l,a			;ba50
	ret			;ba51
guarda_recuadro:		; guarda el trozo de pantalla del recuadro y lo pinta
	push hl			;ba52   ; guarda el trozo de pantalla del recuadro en la pagina 1 y pinta el recuadro
	ld hl,05230h		;ba53   ; 0x58 x 0x35 de (0x30, 0x52) a (0x40, 0x40) de la pagina 1
	ld de,04040h		;ba56
	ld bc,05835h		;ba59
	ld a,004h		;ba5c
	call 04d66h		;ba5e   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
	call recuadro_15		;ba61   ; recuadro_15: el recuadro: borrado y un marco
	pop hl			;ba64
	ret			;ba65
recuadro_15:		; el recuadro: borrado y un marco
	call borra_recuadro		;ba66   ; el recuadro: borrado y un marco
	ld hl,05230h		;ba69   ; un marco en (0x30, 0x52), color 0x0D
	ld de,05835h		;ba6c
	ld c,00dh		;ba6f
	jp 04cfeh		;ba71   ; marco: un marco de lineas: HL la esquina, DE el tamano
quita_recuadro_15:		; devuelve el trozo de pantalla
	ld de,05230h		;ba74   ; de vuelta a (0x30, 0x52)
	ld hl,04040h		;ba77
	ld bc,05835h		;ba7a
	ld a,001h		;ba7d
	jp 04d66h		;ba7f   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
borra_recuadro:		; borra el recuadro
	ld hl,05230h		;ba82   ; 0x58 x 0x35 de color 0 en (0x30, 0x52)
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
	defb 002h,002h,032h,03eh,005h,0a8h	; ba8e	datos sin lector a la vista
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
	ld de,08808h		;bb48   ; el reloj de juego en (0x08, 0x88): horas, minutos...
	ld hl,0ed4ch		;bb4b   ; apunta a el reloj de juego: minutos, cifra baja
	call cifra_del_reloj		;bb4e   ; las horas en la x 0x88...
	ld d,082h		;bb51   ; ...la primera de los minutos en 0x82...
	call cifra_del_reloj		;bb53   ; cifra_del_reloj: una cifra del reloj (0 en blanco)
	ld d,07ch		;bb56   ; ...los dos puntos (0xDA)...
	ld a,0dah		;bb58
	call 04f3ah		;bb5a   ; ...en la x 0x7C...
	ld d,076h		;bb5d   ; ...y las otras dos en 0x76 y 0x70
	call cifra_del_reloj		;bb5f   ; cifra_del_reloj: una cifra del reloj (0 en blanco)
	ld d,070h		;bb62
cifra_del_reloj:		; una cifra del reloj (0 en blanco)
	push hl			;bb64   ; una cifra del reloj (0 en blanco con 0xD9) con la tabla 0xBB7D
	ld a,(hl)			;bb65   ; la cifra; 0 se pinta como el caracter 0xD9
	or a			;bb66
	jr z,L_BB76		;bb67
	ld hl,0bb7dh		;bb69   ; su caracter de la tabla 0xBB7D
	call 04216h		;bb6c   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;bb6f
	call 04f30h		;bb70   ; con la fuente de la fila 0x28 (p00:4F30)
L_BB73:
	pop hl			;bb73
	inc hl			;bb74   ; la cifra siguiente
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
	defb 015h,002h,003h,004h,005h,006h,007h,00eh,00fh,010h	; bb7d  ..........	los caracteres de las cifras 0-9 del reloj

; ======================================================================
; CODIGO 0xbb87..0xbb8d  (6 bytes)
; ======================================================================


L_BB87:
	ld a,(0ecefh)		;bb87   ; la presentacion: el paso de 0xECEF
	call 04220h		;bb8a   ; la tabla de pasos (p15:BB8D)

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
	call 04b9fh		;bb97   ; paso 0: pantalla borrada, un rectangulo, los dibujos de la presentacion (p00:541B, p00:52E1)...
	call 05c7dh		;bb9a   ; esconde_atributos: pone las 32 fichas de sprite de 0xE100 fuera de la pantalla
	ld hl,02870h		;bb9d   ; 0xD0 x 0x48 de color 0 en (0x70, 0x28) de la pagina 1
	ld bc,0d048h		;bba0
	xor a			;bba3
	ld d,001h		;bba4
	call 04d2ah		;bba6   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
	call 0541bh		;bba9   ; p00:541B y p00:52E1
	call 052e1h		;bbac
	xor a			;bbaf
	ld (0e1d1h),a		;bbb0   ; guarda la marca de acabado de los pasos; en el lanzamiento, su paso (p03:A525)
	ld (0e1a2h),a		;bbb3   ; guarda el desplazamiento de la pantalla, 16 bits (en TEAM EDIT, la fila elegida)
	ld a,020h		;bbb6   ; ...32 cuadros
	ld (0de04h),a		;bbb8   ; guarda la cuenta atras del estado
	jr L_BC1D		;bbbb
L_BBBD:
	ld hl,0de04h		;bbbd   ; paso 1: la espera; luego la pelota que vuela (9 bytes de 0xBD99), corta la musica y el sonido 0x28
	dec (hl)			;bbc0
	ret nz			;bbc1
	ld de,0ecf0h		;bbc2   ; 9 bytes de 0xBD99 a 0xECF0: la posicion, la velocidad y la forma de la pelota
	ld hl,0bd99h		;bbc5
	ld bc,00009h		;bbc8
	ldir		;bbcb
	call sprites_pelota_grande		;bbcd   ; sus sprites
	call 040dbh		;bbd0   ; dibujos_de_sprites_13: los dibujos de los 32 sprites (p00:5B1F) y vuelve a los bancos 13-14-15
	ld a,080h		;bbd3   ; calla (0x80) y el sonido 0x28
	call 057ffh		;bbd5   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	ld a,028h		;bbd8
	call 057ffh		;bbda   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	ld a,008h		;bbdd   ; 8 cuadros por paso
	ld (0de04h),a		;bbdf   ; guarda la cuenta atras del estado
	jr L_BC1D		;bbe2
L_BBE4:
	call 05c73h		;bbe4   ; paso 2: la pelota se acerca (cambia de tamano cada 8 cuadros)...
	call sprites_pelota_grande		;bbe7   ; los sprites, la posicion y el frenado
	call 040dbh		;bbea   ; dibujos_de_sprites_13: los dibujos de los 32 sprites (p00:5B1F) y vuelve a los bancos 13-14-15
	call mueve_pelota_grande		;bbed   ; mueve_pelota_grande: la posicion de la pelota de la presentacion mas su velocidad
	call L_BC89		;bbf0
	ld hl,0de04h		;bbf3   ; apunta a la cuenta atras del estado
	dec (hl)			;bbf6   ; cada 8 cuadros...
	ret nz			;bbf7
	ld a,008h		;bbf8
	ld (0de04h),a		;bbfa   ; guarda la cuenta atras del estado
	ld hl,0ecf8h		;bbfd   ; ...0xECF8 baja: cuando llega a 0, se acaba
	dec (hl)			;bc00
	ret nz			;bc01
	call 05c7dh		;bc02   ; ...al acabar, el campo (p00:5421) y el siguiente vuelo (0xBDA2)
	call 04235h		;bc05   ; p00:4235
	xor a			;bc08
	ld (0ed09h),a		;bc09   ; guarda la peticion de copiar sprites a la VRAM (1 colores, 2 todo)
	call 05421h		;bc0c
	call 04c67h		;bc0f   ; espera_vdp: espera a que el VDP acabe la orden (S#2 bit 0, CE)
	ld hl,0bda2h		;bc12   ; los 9 bytes del paso siguiente (0xBDA2)
	ld de,0ecf0h		;bc15
	ld bc,00009h		;bc18
	ldir		;bc1b
L_BC1D:
	ld hl,0ecefh		;bc1d   ; al paso siguiente
	inc (hl)			;bc20
	ret			;bc21
L_BC22:
	call 05c73h		;bc22   ; paso 3: la pelota cruza la pantalla dejando el rotulo detras (copias de la pagina 1)...
	call sprites_pelota_grande		;bc25   ; sprites_pelota_grande: los sprites de la pelota de la presentacion
	call 040dbh		;bc28   ; dibujos_de_sprites_13: los dibujos de los 32 sprites (p00:5B1F) y vuelve a los bancos 13-14-15
	call mueve_pelota_grande		;bc2b   ; mueve_pelota_grande: la posicion de la pelota de la presentacion mas su velocidad
	call L_BC9E		;bc2e
	ld a,(0ecf5h)		;bc31   ; hasta que la x pasa de 0x1C, nada
	sub 01ch		;bc34
	ret c			;bc36
	or a			;bc37
	ret z			;bc38
	ld a,(0ecf5h)		;bc39   ; la columna de 8 x 0x48 de detras de la pelota...
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
	call 04d66h		;bc4e   ; ...se copia de la pagina 1 (el rotulo aparece)
	ld a,(0ecf5h)		;bc51   ; ...hasta 0xE9: sprites fuera y 16 cuadros
	cp 0e9h		;bc54
	ret c			;bc56
	call 05c7dh		;bc57   ; esconde_atributos: pone las 32 fichas de sprite de 0xE100 fuera de la pantalla
	call 05c73h		;bc5a   ; pide_colores_sprite: pide copiar los colores de sprite (0xED09 = 1)
	ld a,010h		;bc5d   ; 16 cuadros
	ld (0de04h),a		;bc5f   ; guarda la cuenta atras del estado
	jr L_BC1D		;bc62
L_BC64:
	ld hl,0de04h		;bc64   ; paso 4: la espera, p00:5DBB y 0xE1D1 = 1
	dec (hl)			;bc67
	ret nz			;bc68
	call 05dbbh		;bc69
	ld a,001h		;bc6c   ; 0xE1D1 = 1: se acabo la presentacion
	ld (0e1d1h),a		;bc6e   ; guarda la marca de acabado de los pasos; en el lanzamiento, su paso (p03:A525)
	ret			;bc71
mueve_pelota_grande:		; la posicion de la pelota de la presentacion mas su velocidad
	ld hl,(0ecf0h)		;bc72   ; la posicion de la pelota mas su velocidad (y y x)
	ld de,(0ecf2h)		;bc75
	add hl,de			;bc79
	ld (0ecf0h),hl		;bc7a
	ld hl,(0ecf4h)		;bc7d   ; la x (0xECF4) mas su velocidad (0xECF6)
	ld de,(0ecf6h)		;bc80
	add hl,de			;bc84
	ld (0ecf4h),hl		;bc85
	ret			;bc88
L_BC89:
	ld hl,(0ecf2h)		;bc89   ; la velocidad baja (frena)
	ld de,0fffbh		;bc8c   ; la vy baja 5
	add hl,de			;bc8f
	ld (0ecf2h),hl		;bc90
	ld hl,(0ecf6h)		;bc93
	ld de,0fff8h		;bc96   ; la vx baja 8
	add hl,de			;bc99
	ld (0ecf6h),hl		;bc9a
	ret			;bc9d
L_BC9E:
	ld a,(0de03h)		;bc9e   ; cada 8 cuadros cambia de tamano (0xECF8)
	and 007h		;bca1
	ret nz			;bca3
	ld a,(0ecf8h)		;bca4   ; cambia 0xECF8 entre dos formas
	xor 001h		;bca7
	ld (0ecf8h),a		;bca9
	ret			;bcac
sprites_pelota_grande:		; los sprites de la pelota de la presentacion
	ld a,(0ecf8h)		;bcad   ; los sprites de la pelota: la forma del tamano 0xECF8 (0xBD13, 0xBD31)...
	dec a			;bcb0
	add a,a			;bcb1
	ld hl,0bd13h		;bcb2   ; la entrada (forma) de la tabla 0xBD13: la lista y el primer dibujo
	call 04216h		;bcb5   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;bcb8
	inc hl			;bcb9
	ld c,(hl)			;bcba
	add a,a			;bcbb
	ld hl,0bd31h		;bcbc   ; la lista de piezas de 0xBD31
	call 04216h		;bcbf   ; hl_mas_a: HL = HL + A
	ld e,(hl)			;bcc2
	inc hl			;bcc3
	ld d,(hl)			;bcc4
	ex de,hl			;bcc5
	ld b,(hl)			;bcc6   ; B = cuantas piezas
	inc hl			;bcc7
	ld de,0e100h		;bcc8   ; apunta a los atributos de sprite (32 fichas de 4 bytes [y][x][dibujo][color])
L_BCCB:
	push bc			;bccb   ; ...cada pieza en su sitio, con color 13 o 0x1E (0 si sale por abajo)
	ld a,(0ecf1h)		;bccc   ; la y de la pelota + la de la pieza
	add a,(hl)			;bccf
	inc hl			;bcd0
	ld (de),a			;bcd1
	inc de			;bcd2
	ld a,(0ecf5h)		;bcd3   ; la x + la de la pieza
	add a,(hl)			;bcd6
	inc hl			;bcd7
	cp 0f0h		;bcd8   ; de 0xF0 o mas: fuera (B = 0)
	ld b,001h		;bcda
	jr c,L_BCDF		;bcdc
	dec b			;bcde
L_BCDF:
	ld (de),a			;bcdf
	inc de			;bce0
	ld a,c			;bce1   ; el dibujo C...
	ld (de),a			;bce2
	add a,004h		;bce3   ; ...el siguiente, 4 mas
	ld c,a			;bce5
	inc de			;bce6
	ld a,b			;bce7   ; el color 0x0D (0 si esta fuera)
	or a			;bce8
	ld a,00dh		;bce9
	jr nz,L_BCEE		;bceb
	xor a			;bced
L_BCEE:
	ld (de),a			;bcee
	inc de			;bcef
	ld a,(0ecf1h)		;bcf0   ; el segundo sprite de la pieza, encima
	add a,(hl)			;bcf3   ; la y + la de la pieza
	inc hl			;bcf4
	ld (de),a			;bcf5
	inc de			;bcf6
	ld a,(0ecf5h)		;bcf7
	add a,(hl)			;bcfa   ; la x + la de la pieza
	inc hl			;bcfb
	ld (de),a			;bcfc
	inc de			;bcfd
	ld a,c			;bcfe   ; el dibujo C...
	ld (de),a			;bcff
	add a,004h		;bd00   ; ...y el siguiente, 4 mas
	ld c,a			;bd02
	inc de			;bd03
	ld a,b			;bd04   ; el color 0x1E (0 si esta fuera)
	or a			;bd05
	ld a,01eh		;bd06
	jr nz,L_BD0B		;bd08
	xor a			;bd0a
L_BD0B:
	ld (de),a			;bd0b   ; el color
	inc de			;bd0c
	ld a,c			;bd0d
	pop bc			;bd0e   ; C = el dibujo siguiente para la pieza que viene
	ld c,a			;bd0f
	djnz L_BCCB		;bd10   ; todas las piezas
	ret			;bd12

; ----------------------------------------------------------------------
; DATOS resto_BD13: lo apuntan con el banco puesto p15:BCB2 (0xBD13), p15:BCBC
;   (0xBD31), p15:BBC5 (0xBD99), p15:BC12 (0xBDA2); el tamano es lo que hay
;   hasta lo siguiente, no sale de recorrerlo; lo leen p15:BCB2, p15:BCBC,
;   p15:BBC5, p15:BC12 (273 bytes)
;   0xbd13..0xbe24  (273 bytes)
DATA_resto_BD13:
	defb 002h,0e0h,002h,0c0h,002h,0a0h,002h,080h,002h,060h,002h,040h,001h,030h,000h,028h	; bd13  .........`.@.0.(	las formas de la pelota (lista y dibujo) y sus listas de piezas
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
