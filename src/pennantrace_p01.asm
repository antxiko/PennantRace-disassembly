; ==========================================================================
; THE PRO YAKYUU GEKITOTSU PENNANT RACE - Konami (1988) - MSX2 - MegaROM RC-757 de 128 KB (Konami SCC) - banco 01 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ======================================================================
; CODIGO 0x6000..0x6284  (644 bytes)
; ======================================================================


L_6000:
	bit 1,a		;6000   ; con el bit 1 de A, nada
	ret nz			;6002
L_6003:
	ld a,(0eddeh)		;6003   ; la musica de la jugada: no si ya hay algo (0xEDDE, 0xE33E, bit 6 de 0xED82)...
	or a			;6006
	ret nz			;6007
	ld a,(0e33eh)		;6008
	or a			;600b
	ret nz			;600c
	ld a,(0ed82h)		;600d
	and 040h		;6010
	ret nz			;6012
	ld a,(0e1d0h)		;6013   ; ...ni sin 0xE1D0
	or a			;6016
	ret z			;6017
	ld a,(0ecedh)		;6018   ; la ficha 0xECED de 0xE23C (16 bytes cada una)...
	sla a		;601b
	sla a		;601d
	sla a		;601f
	sla a		;6021
	ld e,a			;6023
	ld d,000h		;6024
	ld hl,0e23ch		;6026
	add hl,de			;6029
	ld a,(hl)			;602a
	and 00fh		;602b
	cp 002h		;602d   ; ...tiene que estar en el estado 2
	ret nz			;602f
	ld a,(0ecebh)		;6030   ; ...y nada en 0xECEB, 0xED3F ni 0xEDDE
	or a			;6033
	ret nz			;6034
	ld a,(0ed3fh)		;6035
	or a			;6038
	ret nz			;6039
	ld a,(0eddeh)		;603a   ; lee la jugada anulada (foul)
	or a			;603d
	ret nz			;603e
	ld a,001h		;603f   ; 0xE33E = 1: ya suena
	ld (0e33eh),a		;6041
	ld a,01fh		;6044   ; el sonido 0x1F...
	call 057ffh		;6046   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	ld a,(0e19bh)		;6049   ; ...y la musica 0x3D en la alta o 0x3E en la baja
	rra			;604c
	ld a,03dh		;604d
	jr nc,L_6053		;604f
	ld a,03eh		;6051
L_6053:
	jp 057ffh		;6053   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_6056:
	ld (0faf5h),a		;6056   ; la pagina A en pantalla: 0xFAF5 y los registros R#2, R#4, R#6, R#10 y R#11 del VDP
	ld d,a			;6059
	add a,a			;605a
	ld l,a			;605b
	add a,a			;605c
	add a,a			;605d
	add a,a			;605e
	ld e,a			;605f
	add a,a			;6060
	ld h,a			;6061
	ld a,(0f3e1h)		;6062   ; R#2 (tabla de nombres): la pagina en los bits 5-6
	and 01fh		;6065
	or h			;6067
	ld b,a			;6068
	ld c,002h		;6069
	call 00047h		;606b   ; BIOS WRTVDP - Writes data in the VDP-register
	ld a,(0ffe9h)		;606e   ; R#10 (colores, alto)
	and 001h		;6071
	or l			;6073
	ld b,a			;6074
	ld c,00ah		;6075
	call 00047h		;6077   ; BIOS WRTVDP - Writes data in the VDP-register
	ld a,(0f3e3h)		;607a   ; R#4 (patrones)
	and 00fh		;607d
	or e			;607f
	ld b,a			;6080
	ld c,004h		;6081
	call 00047h		;6083   ; BIOS WRTVDP - Writes data in the VDP-register
	ld b,d			;6086   ; R#11 (atributos de sprite, alto)
	ld c,00bh		;6087
	call 00047h		;6089   ; BIOS WRTVDP - Writes data in the VDP-register
	ld a,(0f3e5h)		;608c   ; R#6 (dibujos de sprite)
	and 00fh		;608f
	or e			;6091
	ld b,a			;6092
	ld c,006h		;6093
	jp 00047h		;6095   ; BIOS WRTVDP - Writes data in the VDP-register
L_6098:
	ld a,006h		;6098   ; la tecla F1 (SNSMAT fila 6, bit 5)...
	call 00141h		;609a   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;609d
	and 020h		;609e
	ld hl,0ec74h		;60a0   ; ...comparada con la de antes (0xEC74)...
	ld c,(hl)			;60a3
	ld (hl),a			;60a4
	xor c			;60a5
	ret z			;60a6
	bit 5,(hl)		;60a7   ; ...carry si se acaba de pulsar
	ret z			;60a9
	scf			;60aa
	ret			;60ab
L_60AC:
	ld hl,0ed13h		;60ac   ; el marcador de abajo: 0xED13 (visitante) menos uno...
	ld a,(hl)			;60af
	sub 001h		;60b0
	daa			;60b2
	ld (hl),a			;60b3
	ld de,05860h		;60b4   ; ...en (0x58, 0x60)
	ld b,001h		;60b7
	call 05bf1h		;60b9   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
	ld hl,0ed14h		;60bc   ; 0xED14 (local) menos uno en (0xB8, 0x60)
	ld a,(hl)			;60bf
	sub 001h		;60c0
	daa			;60c2
	ld (hl),a			;60c3
	ld de,0b860h		;60c4
	ld b,001h		;60c7
	call 05bf1h		;60c9   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
	ld hl,0ed15h		;60cc   ; 0xED15 y 0xED16 en la fila 0x6C
	ld de,0586ch		;60cf
	ld b,001h		;60d2
	call 05bf1h		;60d4   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
	ld hl,0ed16h		;60d7   ; apunta a los hits del local (BCD)
	ld de,0b86ch		;60da
	ld b,001h		;60dd
	call 05bf1h		;60df   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
	ld hl,0ed17h		;60e2   ; 0xED17 y 0xED18 en la fila 0x78
	ld de,05878h		;60e5
	ld b,001h		;60e8
	call 05bf1h		;60ea   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
	ld hl,0ed18h		;60ed   ; apunta a los home runs del local (BCD)
	ld de,0b878h		;60f0
	ld b,001h		;60f3
	call 05bf1h		;60f5   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
	ld hl,0ed19h		;60f8   ; 0xED19 y 0xED1A en la fila 0x84
	ld de,05884h		;60fb
	ld b,001h		;60fe
	call 05bf1h		;6100   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
	ld hl,0ed1ah		;6103   ; apunta a los eliminados por strikes del local (BCD)
	ld de,0b884h		;6106
	ld b,001h		;6109
	call 05bf1h		;610b   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
	ld hl,0ed1bh		;610e   ; 0xED1B y 0xED1C (las bolas cuatro) en la fila 0x90
	ld de,05890h		;6111
	ld b,001h		;6114
	call 05bf1h		;6116   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
	ld hl,0ed1ch		;6119   ; apunta a las bases por bolas del local (BCD)
	ld de,0b890h		;611c
	ld b,001h		;611f
	jp 05bf1h		;6121   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
L_6124:
	call contador_del_bateo		;6124   ; los strikes y las bolas
	ld a,(0e198h)		;6127   ; los strikes (0xE198): 3 es eliminado
	or a			;612a
	jr z,L_6134		;612b
	cp 003h		;612d
	jr z,L_6145		;612f
	call L_6141		;6131   ; la luz del strike que toca
L_6134:
	ld a,(0e199h)		;6134   ; las bolas (0xE199): 4 es base por bolas
	or a			;6137
	ret z			;6138
	cp 004h		;6139
	jr z,L_61A8		;613b
L_613D:
	ld e,080h		;613d   ; la luz de la bola, en la fila 0x80
	jr L_6159		;613f
L_6141:
	ld e,078h		;6141   ; la del strike, en la fila 0x78
	jr L_6159		;6143
L_6145:
	call L_62F7		;6145   ; eliminado por strikes: las luces a cero, el aviso (p01:6165)...
	call L_6194		;6148
	call L_6165		;614b
	call 0b123h		;614e   ; ...p15:B123 y si no hay 3 outs (0xE19A)...
	ld a,(0e19ah)		;6151   ; lee los outs de la media entrada
	cp 003h		;6154
	ret nc			;6156
L_6157:
	ld e,088h		;6157   ; ...la luz del out, en la fila 0x88
L_6159:
	or a			;6159   ; x = 8 x cuenta + 0x10...
	rla			;615a
	rla			;615b
	rla			;615c
	add a,010h		;615d
	ld d,a			;615f
	ld a,09ah		;6160   ; ...y el caracter 0x9A (la luz)
	jp 04f1ch		;6162   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
L_6165:
	ld a,(0e19ah)		;6165   ; con menos de 2 outs, los sonidos 0x0D y 0x42
	cp 002h		;6168
	jr nc,L_6176		;616a
	ld a,00dh		;616c
	call 057ffh		;616e   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	ld a,042h		;6171
	call 057ffh		;6173   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_6176:
	ld hl,0e103h		;6176   ; el color de los sprites 1-22 a cero...
	ld de,00004h		;6179
	ld b,016h		;617c
L_617E:
	ld (hl),000h		;617e
	add hl,de			;6180
	djnz L_617E		;6181
	call 05b1fh		;6183   ; ...dibujos y colores a la VRAM
	call 05c73h		;6186
	ld a,001h		;6189   ; 0xE30F = 1, 0xE310 = 0x40
	ld (0e30fh),a		;618b
	ld a,040h		;618e
	ld (0e310h),a		;6190
	ret			;6193
L_6194:
	ld hl,01878h		;6194   ; borra las luces: un rectangulo de color 0 en (0x78, 0x18)
	ld bc,01810h		;6197
	xor a			;619a
	ld d,a			;619b
	call 04d2ah		;619c   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
L_619F:
	ld hl,0e198h		;619f   ; strikes y bolas a cero
	ld (hl),000h		;61a2
	inc hl			;61a4
	ld (hl),000h		;61a5
	ret			;61a7
L_61A8:
	ld hl,07df9h		;61a8   ; FOUR BALL (p13:7DF9)...
	call 04ea6h		;61ab   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld b,017h		;61ae   ; ...el sonido 0x17, o 0x18 si 0xE1F0 llega a 0x28...
	ld a,(0e1f0h)		;61b0
	cp 028h		;61b3
	jr c,L_61B9		;61b5
	ld b,018h		;61b7
L_61B9:
	ld a,b			;61b9
	call 057ffh		;61ba   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	ld a,043h		;61bd   ; ...y la musica 0x43
	call 057ffh		;61bf   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	ld a,001h		;61c2   ; 0xECDB = 1
	ld (0ecdbh),a		;61c4
L_61C7:
	ld hl,0ed1bh		;61c7   ; una bola cuatro mas al equipo que batea (0xED1B / 0xED1C)
	ld a,(0e19bh)		;61ca   ; lee la media entrada (bit 0: 0 la alta, 1 la baja; 0x11 = la baja de la 9.a)
	rra			;61cd
	jr nc,L_61D1		;61ce
	inc hl			;61d0
L_61D1:
	ld a,001h		;61d1
	add a,(hl)			;61d3
	daa			;61d4
	ld (hl),a			;61d5
	call L_62F7		;61d6   ; las luces a cero y los colores
	call L_6194		;61d9
	call L_6176		;61dc
	call L_6267		;61df
	ld hl,0e23ch		;61e2   ; los corredores: suma el estado (bits 0-3) de las 4 fichas de 0xE23C
	ld de,00010h		;61e5
	ld b,004h		;61e8
	ld c,000h		;61ea
L_61EC:
	ld a,(hl)			;61ec
	and 00fh		;61ed
	add a,c			;61ef
	ld c,a			;61f0
	add hl,de			;61f1
	djnz L_61EC		;61f2
	cp 009h		;61f4   ; 9 (las tres bases y el bateador): carrera forzada
	jr z,L_6255		;61f6
	ld hl,06284h		;61f8   ; si no, la tabla de 0x6284 dice a que base va el bateador
	call 04216h		;61fb   ; hl_mas_a: HL = HL + A
	ld c,(hl)			;61fe
	ld hl,0e23ch		;61ff
	ld de,00010h		;6202
	ld b,003h		;6205
L_6207:
	ld a,(hl)			;6207   ; la primera ficha libre de 0xE23C
	or a			;6208
	jr z,L_620F		;6209
	add hl,de			;620b
	djnz L_6207		;620c
	ret			;620e
L_620F:
	ld (hl),c			;620f   ; su estado
	ld de,0fff5h		;6210   ; IX = el principio de la ficha (0xE231 + 16 n)
	add hl,de			;6213
	push hl			;6214
	pop ix		;6215
	ld a,c			;6217   ; sus 4 bytes en 0x6284 + 4 x estado:
	add a,a			;6218
	add a,a			;6219
	ld hl,06284h		;621a
	call 04216h		;621d   ; hl_mas_a: HL = HL + A
	ld (ix+000h),0f0h		;6220   ; IX+0 = 0xF0
	ld a,(hl)			;6224   ; x...
	inc hl			;6225
	ld (ix+002h),a		;6226
	ld a,(hl)			;6229
	inc hl			;622a
	ld (ix+003h),a		;622b
	ld a,(hl)			;622e   ; ...y y
	inc hl			;622f
	ld (ix+007h),a		;6230
	ld a,(hl)			;6233
	inc hl			;6234
	ld (ix+008h),a		;6235
	ld a,c			;6238
	call 08fech		;6239   ; p02:8FEC
	ld de,0ec98h		;623c   ; copia las fichas de los corredores a 0xEC98
	ld hl,0e231h		;623f   ; apunta a las 4 fichas de 16 bytes de los corredores (0xE23C = su estado)
	ld bc,00040h		;6242
	ldir		;6245
	ld a,001h		;6247   ; con 0xED9F puesto, p15:AD26
	ld (0ed9fh),a		;6249
	call 0ad26h		;624c
	xor a			;624f
	ld (0ed9fh),a		;6250
	jr L_6264		;6253
L_6255:
	call L_66EB		;6255   ; carrera: p01:66EB, el marcador, p02:988A, 98A4 y 9897
	call L_633C		;6258
	call 0988ah		;625b
	call 098a4h		;625e
	call 09897h		;6261
L_6264:
	jp 095adh		;6264   ; p02:95AD
L_6267:
	ld a,001h		;6267   ; con 0xED9F puesto, rachas a los dibujos de sprite 0xC0 (p00:538E)
	ld (0ed9fh),a		;6269
	call 0538eh		;626c
	xor a			;626f
	ld (0ed9fh),a		;6270
	ld de,0e231h		;6273   ; y las fichas de 0xEC98 vuelven a 0xE231
	ld hl,0ec98h		;6276
	ld bc,00040h		;6279
	ldir		;627c
	call 09594h		;627e
	jp 095adh		;6281

; ----------------------------------------------------------------------
; DATOS resto_6284: lo apuntan con el banco puesto p01:61F8 (0x6284), p01:621A
;   (0x6284); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p01:61F8, p01:621A (20 bytes)
;   0x6284..0x6298  (20 bytes)
DATA_resto_6284:
	defb 002h,000h,003h,002h,002h,004h,003h,002h,040h,001h,0a8h,001h,000h,001h,038h,001h	; 6284  ........@.....8.
	defb 040h,001h,0c4h,000h	; 6294

; ======================================================================
; CODIGO 0x6298..0x65e8  (848 bytes)
; ======================================================================


contador_del_bateo:		; pinta el contador binario del equipo que batea (0xED59 / 0xED5B) en tres cifras
	ld a,(0e19bh)		;6298   ; el contador del equipo que batea: 0xED59 en la baja, 0xED5B en la alta
	ld hl,0ed59h		;629b
	rra			;629e
	jr c,L_62A4		;629f
	ld hl,0ed5bh		;62a1
L_62A4:
	ld a,(hl)			;62a4   ; de binario a BCD: la cifra alta...
	ld c,a			;62a5
	rra			;62a6
	rra			;62a7
	rra			;62a8
	rra			;62a9
	and 00fh		;62aa
	add a,000h		;62ac
	daa			;62ae
	ld b,a			;62af
	ld hl,00000h		;62b0
	jr z,L_62BF		;62b3
L_62B5:
	ld a,l			;62b5   ; ...x 16 (0x16 en BCD)...
	add a,016h		;62b6
	daa			;62b8
	ld l,a			;62b9
	jr nc,L_62BD		;62ba
	inc h			;62bc
L_62BD:
	djnz L_62B5		;62bd
L_62BF:
	ld a,c			;62bf   ; ...mas la baja
	and 00fh		;62c0
	add a,000h		;62c2
	daa			;62c4
	add a,l			;62c5
	daa			;62c6
	ld l,a			;62c7
	jr nc,L_62CB		;62c8
	inc h			;62ca
L_62CB:
	ld a,h			;62cb   ; las centenas...
	or a			;62cc
	jr z,L_62D1		;62cd
	add a,001h		;62cf
L_62D1:
	ld de,010b8h		;62d1   ; ...en (0x10, 0xB8)
	call 04f1ch		;62d4   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld a,l			;62d7   ; las decenas (en blanco si son ceros a la izquierda)
	rra			;62d8
	rra			;62d9
	rra			;62da
	rra			;62db
	and 00fh		;62dc
	jr nz,L_62E6		;62de
	ld c,a			;62e0
	ld a,h			;62e1
	or a			;62e2
	jr z,L_62E7		;62e3
	ld a,c			;62e5
L_62E6:
	inc a			;62e6
L_62E7:
	ld de,018b8h		;62e7   ; en (0x18, 0xB8)
	call 04f1ch		;62ea   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld a,l			;62ed   ; y las unidades en (0x20, 0xB8)
	and 00fh		;62ee
	inc a			;62f0
	ld de,020b8h		;62f1
	jp 04f1ch		;62f4   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
L_62F7:
	ld a,(0e1a1h)		;62f7   ; un bateador mas: en 0xE1A1 = 3, solo la primera vez (0xEDD4)
	cp 003h		;62fa
	jr nz,L_6306		;62fc
	ld hl,0edd4h		;62fe
	ld a,(hl)			;6301
	or a			;6302
	ret nz			;6303
	ld (hl),001h		;6304
L_6306:
	xor a			;6306   ; 0xECDB = 0
	ld (0ecdbh),a		;6307
	ld a,(0e19bh)		;630a   ; los turnos del equipo que batea: 0xED13 o 0xED14
	rra			;630d
	ld hl,0ed13h		;630e   ; apunta a los bateadores del visitante (BCD; uno mas por turno, p01:6316)
	jr nc,L_6316		;6311
	ld hl,0ed14h		;6313   ; apunta a los bateadores del local (BCD)
L_6316:
	ld a,001h		;6316   ; +1
	add a,(hl)			;6318
	daa			;6319
	ld (hl),a			;631a
	ld a,(0e19bh)		;631b   ; y el orden de bateo: 0xEC4F o 0xEC61...
	rra			;631e
	ld hl,0ec4fh		;631f   ; apunta a el orden de bateo del visitante (0-8)
	jr nc,L_6327		;6322
	ld hl,0ec61h		;6324   ; apunta a el orden de bateo del local (0-8)
L_6327:
	inc (hl)			;6327   ; ...el siguiente, de 0 a 8
	ld a,(hl)			;6328
	cp 009h		;6329
	ret c			;632b
	xor a			;632c
	ld (hl),a			;632d
	ret			;632e
L_632F:
	ld hl,05c28h		;632f   ; un rectangulo de color 0xFF en (0x28, 0x5C), 0x48 x 0x08
	ld bc,04808h		;6332
	ld d,000h		;6335
	ld a,0ffh		;6337
	jp 04d2ah		;6339   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
L_633C:
	ld hl,0e194h		;633c   ; las carreras del visitante en (0x80, 0xDC)...
	ld de,0dc80h		;633f
	ld b,001h		;6342
	call 05bf1h		;6344   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
	ld hl,0e196h		;6347   ; ...y las del local en (0x88, 0xDC)
	ld de,0dc88h		;634a
	ld b,001h		;634d
	jp 05bf1h		;634f   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
L_6352:
	ld hl,00f77h		;6352   ; el marcador grande: dos marcos...
	ld de,0221ah		;6355
	ld c,00dh		;6358
	call 04cfeh		;635a   ; marco: un marco de lineas: HL la esquina, DE el tamano
	ld hl,0c777h		;635d
	ld de,02a1ah		;6360
	ld c,00dh		;6363
	call 04cfeh		;6365   ; marco: un marco de lineas: HL la esquina, DE el tamano
	ld hl,01078h		;6368   ; ...rellenos de 0 con bordes de color 13...
	ld bc,02019h		;636b
	xor a			;636e
	ld d,000h		;636f
	call 04d2ah		;6371   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
	ld hl,03078h		;6374
	ld bc,00219h		;6377
	ld a,00dh		;637a
	call 04d2ah		;637c   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
	ld hl,0c878h		;637f
	ld bc,02819h		;6382
	xor a			;6385
	call 04d2ah		;6386   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
	ld hl,0f078h		;6389
	ld bc,00219h		;638c
	ld a,00dh		;638f
	call 04d2ah		;6391   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
	ld hl,007a7h		;6394   ; ...lineas...
	ld bc,0320dh		;6397
	call 04c91h		;639a   ; linea: orden LINE (0x70) del VDP desde HL
	ld hl,007c1h		;639d
	ld bc,0320dh		;63a0
	call 04c91h		;63a3   ; linea: orden LINE (0x70) del VDP desde HL
	ld hl,007a7h		;63a6
	ld bc,01a0dh		;63a9
	call 04cc7h		;63ac   ; linea_vertical: orden LINE (0x70) del VDP, el lado largo en vertical
	ld hl,0c7a7h		;63af
	ld bc,0320dh		;63b2
	call 04c91h		;63b5   ; linea: orden LINE (0x70) del VDP desde HL
	ld hl,0c7c1h		;63b8
	ld bc,0320dh		;63bb
	call 04c91h		;63be   ; linea: orden LINE (0x70) del VDP desde HL
	ld hl,0c7a7h		;63c1
	ld bc,01a0dh		;63c4
	call 04cc7h		;63c7   ; linea_vertical: orden LINE (0x70) del VDP, el lado largo en vertical
	ld hl,008a8h		;63ca   ; ...y los recuadros de abajo
	ld bc,03019h		;63cd
	xor a			;63d0
	ld d,000h		;63d1
	call 04d2ah		;63d3   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
	ld hl,038a8h		;63d6
	ld bc,00219h		;63d9
	ld a,00dh		;63dc
	call 04d2ah		;63de   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
	ld hl,0c8a8h		;63e1
	ld bc,03019h		;63e4
	xor a			;63e7
	call 04d2ah		;63e8   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
	ld hl,0f8a8h		;63eb
	ld bc,00219h		;63ee
	ld a,00dh		;63f1
	call 04d2ah		;63f3   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
	ld hl,07e1eh		;63f6   ; el texto de p13:7E1E
	call 04ea6h		;63f9   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld a,(0d380h)		;63fc   ; el caracter de 0xD380 en (0x80, 0xCC)...
	ld de,0cc80h		;63ff
	call 04f1ch		;6402   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld a,(0d47fh)		;6405   ; ...y el de 0xD47F en (0x88, 0xCC)
	ld de,0cc88h		;6408
	call 04f1ch		;640b   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	call pinta_entrada		;640e   ; la entrada y el contador
	call contador_del_bateo		;6411   ; contador_del_bateo: pinta el contador binario del equipo que batea (0xED59 / 0xED5B) en tres cifras
	ld a,(0e198h)		;6414   ; una luz por strike...
	or a			;6417
	jr z,L_6422		;6418
L_641A:
	push af			;641a
	call L_6141		;641b
	pop af			;641e
	dec a			;641f
	jr nz,L_641A		;6420
L_6422:
	ld a,(0e199h)		;6422   ; ...una por bola...
	or a			;6425
	jr z,L_6430		;6426
L_6428:
	push af			;6428
	call L_613D		;6429
	pop af			;642c
	dec a			;642d
	jr nz,L_6428		;642e
L_6430:
	ld a,(0e19ah)		;6430   ; ...una por out
	or a			;6433
	jr z,L_643E		;6434
L_6436:
	push af			;6436
	call L_6157		;6437
	pop af			;643a
	dec a			;643b
	jr nz,L_6436		;643c
L_643E:
	jp L_633C		;643e   ; y las carreras
pinta_entrada:		; pinta la alta o la baja y el numero de la entrada
	ld a,(0e19bh)		;6441   ; la entrada: el texto de la alta (p13:7E49) o el de la baja (0x7E4E)
	rra			;6444
	push af			;6445
	ld hl,07e49h		;6446
	jr nc,L_644E		;6449
	ld hl,07e4eh		;644b
L_644E:
	call 04ea6h		;644e   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	pop af			;6451
	cp 063h		;6452   ; desde la 0x63 (la 50.a) otro texto (p13:7B94)
	jr z,L_648B		;6454
	inc a			;6456   ; el numero de entrada: (0xE19B + 1) / 2...
	push af			;6457
	rra			;6458   ; ...de binario a BCD...
	rra			;6459
	rra			;645a
	rra			;645b
	and 00fh		;645c
	jr z,L_6467		;645e
	ld b,a			;6460
	xor a			;6461
L_6462:
	add a,016h		;6462
	daa			;6464
	djnz L_6462		;6465
L_6467:
	ld c,a			;6467
	pop af			;6468
	and 00fh		;6469
	add a,000h		;646b
	daa			;646d
	add a,c			;646e
	daa			;646f
	ld b,001h		;6470   ; ...en (0x78, 0xC8): la decena (si no es 0)...
	ld de,0c878h		;6472
	push af			;6475
	rra			;6476
	rra			;6477
	rra			;6478
	rra			;6479
	and 00fh		;647a
	jr z,L_6487		;647c
	call 05c12h		;647e
L_6481:
	pop af			;6481   ; ...y la unidad
	and 00fh		;6482
	jp 05c12h		;6484
L_6487:
	ld d,0d0h		;6487   ; sin decena, la unidad en 0xD0
	jr L_6481		;6489
L_648B:
	ld hl,07b94h		;648b
	jp 04ea6h		;648e   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
L_6491:
	ld hl,06c70h		;6491   ; guarda en la pagina 1 el trozo de 0x28 x 8 de (0x70, 0x6C) y pinta p13:7EBD
	ld de,0d860h		;6494
	ld bc,02808h		;6497
	ld a,004h		;649a
	call 04d66h		;649c   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
	ld hl,07ebdh		;649f
	jp 04ea6h		;64a2   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
L_64A5:
	ld de,06c70h		;64a5   ; lo devuelve a la pagina 0
	ld hl,0d860h		;64a8
	ld bc,02808h		;64ab
	ld a,001h		;64ae
	jp 04d66h		;64b0   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
L_64B3:
	ld hl,06c70h		;64b3   ; guarda el trozo de (0xC8, 0x28) y pinta la velocidad: 0xE1F0...
	ld de,028c8h		;64b6
	ld bc,02808h		;64b9
	ld a,004h		;64bc
	call 04d66h		;64be   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
	ld c,0ffh		;64c1
	ld a,(0e1f0h)		;64c3
L_64C6:
	inc c			;64c6   ; ...entre 5 (C = las decenas)...
	ld b,a			;64c7
	sub 005h		;64c8
	jr nc,L_64C6		;64ca
	sla b		;64cc   ; ...el resto x 2 mas un bit al azar: la cifra de las unidades...
	ld a,r		;64ce
	and 001h		;64d0
	add a,b			;64d2
	inc a			;64d3
	ld de,07c70h		;64d4
	call 04f1ch		;64d7   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld a,006h		;64da   ; ...las decenas mas 6...
	add a,c			;64dc
	daa			;64dd
	ld c,a			;64de
	and 00fh		;64df
	inc a			;64e1
	ld d,074h		;64e2
	call 04f1ch		;64e4   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld a,c			;64e7   ; ...y la centena (1)...
	and 0f0h		;64e8
	jr z,L_64EE		;64ea
	ld a,002h		;64ec
L_64EE:
	ld de,06c70h		;64ee
	call 04f1ch		;64f1   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld hl,07e44h		;64f4   ; ...y p13:7E44 (las unidades de la velocidad)
	jp 04ea6h		;64f7   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
L_64FA:
	ld de,06c70h		;64fa   ; devuelve el trozo de (0xC8, 0x28)
	ld hl,028c8h		;64fd
	ld bc,02808h		;6500
	ld a,001h		;6503
	jp 04d66h		;6505   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
L_6508:
	ld hl,07e53h		;6508   ; el texto de p13:7E53
	jp 04ea6h		;650b   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
borra_partido:		; 0xE194-0xEFFB a cero: un partido nuevo
	ld hl,0e194h		;650e   ; 0xE194-0xEFFB a cero: un partido nuevo (marcador, cuenta y todo)
	ld bc,00e67h		;6511
	ld d,h			;6514
	ld e,l			;6515
	inc e			;6516
	ld (hl),000h		;6517
	ldir		;6519
	ret			;651b
L_651C:
	xor a			;651c
	ld (0ed09h),a		;651d   ; guarda la peticion de copiar sprites a la VRAM (1 colores, 2 todo)
	call 04b9fh		;6520   ; borra_pantalla: esconde los sprites, apaga la pantalla, rellena la VRAM de 0, R#23 = 0 y la enciende
	call 05427h		;6523
	ld hl,02870h		;6526
	ld bc,0d048h		;6529
	xor a			;652c
	ld d,001h		;652d
	call 04d2ah		;652f   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
	call 052e7h		;6532
	ld de,01c08h		;6535
	ld hl,02870h		;6538
	ld bc,0d048h		;653b
	ld a,001h		;653e
	call 04d66h		;6540   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
L_6543:
	ld hl,07d8fh		;6543   ; el menu: 5 textos seguidos (p13:7D8F en adelante)...
	call 04ea6h		;6546   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	call 04ea6h		;6549   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	call 04ea6h		;654c   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	call 04ea6h		;654f   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	call 04ea6h		;6552   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld a,(0dd8eh)		;6555   ; ...y con 0xDD8E = 3, MEDIA SELECT
	cp 003h		;6558
	ret nz			;655a
	ld hl,07dd2h		;655b
	jp 04ea6h		;655e   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
L_6561:
	ld e,005h		;6561   ; la eleccion del modo: 5 opciones, o 6 con 0xDD8E = 3
	ld a,(0dd8eh)		;6563
	cp 003h		;6566
	jr nz,L_656B		;6568
	inc e			;656a
L_656B:
	ld d,e			;656b
	dec d			;656c
	ld hl,0de04h		;656d   ; parpadeo con el bit 3 de 0xDE04
	bit 3,(hl)		;6570
	ld c,0ffh		;6572
	jr nz,L_6577		;6574
	inc c			;6576
L_6577:
	ld hl,0e190h		;6577   ; la tecla de 0xE332: bit 0 arriba, bit 1 abajo
	ld a,(0e332h)		;657a
	and 003h		;657d
	ld b,a			;657f
	ld a,(hl)			;6580
	jr z,L_65AF		;6581
	rr b		;6583   ; abajo: el siguiente (vuelve al primero)
	jr c,L_659B		;6585
	inc a			;6587
	cp e			;6588
	jr c,L_658C		;6589
	xor a			;658b
L_658C:
	ld (hl),a			;658c   ; pinta el nuevo y borra el de antes
	push af			;658d
	push de			;658e
	call L_65AF		;658f
	pop de			;6592
	pop af			;6593
	dec a			;6594
	cp e			;6595
	jr c,L_65AD		;6596
	ld a,d			;6598
	jr L_65AD		;6599
L_659B:
	dec a			;659b   ; arriba: el anterior
	cp e			;659c
	jr c,L_65A0		;659d
	ld a,d			;659f
L_65A0:
	ld (hl),a			;65a0
	push af			;65a1
	push de			;65a2
	call L_65AF		;65a3
	pop de			;65a6
	pop af			;65a7
	inc a			;65a8
	cp e			;65a9
	jr c,L_65AD		;65aa
	xor a			;65ac
L_65AD:
	ld c,000h		;65ad
L_65AF:
	add a,a			;65af   ; la flecha en la fila del modo A: y = 16 A + 0x70, x = 0x18 (p13:7DF7)
	add a,a			;65b0
	add a,a			;65b1
	add a,a			;65b2
	add a,070h		;65b3
	ld e,a			;65b5
	ld d,018h		;65b6
	ld hl,07df7h		;65b8
	jp 04eb5h		;65bb   ; texto_en_de: pinta el texto HL en la posicion DE (sin [x y] delante)
prepara_maquina:		; arranca el sonido, SCREEN 5 (CHGMOD), borde 0, cuatro registros del VDP (0x65E8), la paleta y los sprites
	call 05cach		;65be   ; arranca_sonido: el arranque del motor de sonido (p04:6000) con los bancos 4-5-6
	call 05ccfh		;65c1
	ld a,005h		;65c4
	call 0005fh		;65c6   ; BIOS CHGMOD - Switches to given screen mode
	xor a			;65c9
	ld (0f3ebh),a		;65ca
	call 00062h		;65cd   ; BIOS CHGCLR - Changes the screen colors
	ld b,004h		;65d0
	ld hl,065e8h		;65d2
L_65D5:
	push bc			;65d5
	ld c,(hl)			;65d6
	inc hl			;65d7
	ld b,(hl)			;65d8
	inc hl			;65d9
	push hl			;65da
	call 00047h		;65db   ; BIOS WRTVDP - Writes data in the VDP-register
	pop hl			;65de
	pop bc			;65df
	djnz L_65D5		;65e0
	call 04c25h		;65e2
	jp 04bdah		;65e5   ; apaga_sprites: R#8 con el bit 1 (SPD) a 1: no se pintan sprites

; ----------------------------------------------------------------------
; DATOS resto_65E8: lo apuntan con el banco puesto p01:65D2 (0x65E8); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p01:65D2 (8 bytes)
;   0x65e8..0x65f0  (8 bytes)
DATA_resto_65E8:
	defb 001h,062h,005h,0efh,006h,01fh,00bh,001h	; 65e8  .b......

; ======================================================================
; CODIGO 0x65f0..0x681f  (559 bytes)
; ======================================================================


lee_mando:		; lee el mando y el teclado: 0xDE07/0xDE09 lo pulsado y 0xDE06/0xDE08 lo recien pulsado
	call mandos_y_teclado		;65f0   ; D = el primer mando, E = el segundo
	ld hl,0de07h		;65f3   ; apunta a los botones pulsados del mando 1 / cursores
L_65F6:
	ld a,d			;65f6   ; lo pulsado ahora...
	ld c,(hl)			;65f7
	ld (hl),a			;65f8
	xor c			;65f9   ; ...y lo que no lo estaba antes: recien pulsado
	and (hl)			;65fa
	dec hl			;65fb
	ld (hl),a			;65fc
	inc hl			;65fd
	inc hl			;65fe
	inc hl			;65ff
	ld a,e			;6600   ; lo mismo con el segundo
	ld c,(hl)			;6601
	ld (hl),a			;6602
	xor c			;6603
	and (hl)			;6604
	dec hl			;6605
	ld (hl),a			;6606
	ret			;6607
mandos_y_teclado:		; D = el primer mando con espacio y cursores, E = el segundo con SHIFT, CTRL y GRAPH (activos a 1)
	ld e,08fh		;6608   ; el mando del puerto 1: R#15 del PSG = 0x8F...
	ld a,00fh		;660a
	call 00093h		;660c   ; BIOS WRTPSG - Writes data to PSG-register
	ld a,00eh		;660f   ; ...y R#14 (GTPSG), activo a 0
	di			;6611
	call 00096h		;6612   ; BIOS RDPSG - Reads value from PSG-register
	ei			;6615
	cpl			;6616
	and 03fh		;6617   ; los 4 cursores y los 2 botones
	push af			;6619
	ld e,0cfh		;661a   ; el del puerto 2: R#15 = 0xCF
	ld a,00fh		;661c
	call 00093h		;661e   ; BIOS WRTPSG - Writes data to PSG-register
	ld a,00eh		;6621
	di			;6623
	call 00096h		;6624   ; BIOS RDPSG - Reads value from PSG-register
	ei			;6627
	cpl			;6628
	and 03fh		;6629
	ld e,a			;662b
	pop af			;662c
	ld d,a			;662d
	push de			;662e
	ld a,004h		;662f   ; el teclado: fila 4 (N y M)...
	call 00141h		;6631   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;6634
	and 00ch		;6635
	jr z,L_663B		;6637
	ld a,020h		;6639   ; ...cuentan como el boton 2
L_663B:
	ld e,a			;663b
	ld a,008h		;663c   ; fila 8: espacio y cursores...
	call 00141h		;663e   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;6641
	rrca			;6642
	rrca			;6643
	ld b,a			;6644
	and 004h		;6645   ; ...repartidos a los bits del mando
	or e			;6647
	ld c,a			;6648
	ld a,b			;6649
	rrca			;664a
	rrca			;664b
	ld b,a			;664c
	and 018h		;664d
	or c			;664f
	ld c,a			;6650
	ld a,b			;6651
	rrca			;6652
	and 003h		;6653
	or c			;6655
	pop bc			;6656
	or b			;6657   ; se suman al primer mando
	ld b,a			;6658
	push bc			;6659
	ld a,006h		;665a   ; fila 6 (SHIFT, CTRL, GRAPH): botones del segundo...
	call 00141h		;665c   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;665f
	rlca			;6660
	rlca			;6661
	rlca			;6662
	rlca			;6663
	and 030h		;6664
	ld e,a			;6666
	ld a,003h		;6667   ; ...fila 3...
	call 00141h		;6669   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;666c
	ld b,a			;666d
	and 008h		;666e
	or e			;6670
	ld c,a			;6671
	ld a,b			;6672
	rlca			;6673
	and 002h		;6674
	or c			;6676
	ld c,a			;6677
	ld a,b			;6678
	rrca			;6679
	rrca			;667a
	and 001h		;667b
	or c			;667d
	ld e,a			;667e
	ld a,005h		;667f   ; ...y fila 5
	call 00141h		;6681   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;6684
	rlca			;6685
	rlca			;6686
	and 004h		;6687
	or e			;6689
	pop bc			;668a
	or c			;668b   ; D = primer mando, E = segundo
	ld e,a			;668c
	ld d,b			;668d
	ret			;668e
L_668F:
	xor a			;668f   ; antes del partido: 0xE1D1 = 0, 0xE1A5 = 1, 0xE1C9 = 4...
	ld (0e1d1h),a		;6690   ; guarda la marca de acabado de los pasos; en el lanzamiento, su paso (p03:A525)
	inc a			;6693
	ld (0e1a5h),a		;6694
	ld a,004h		;6697
	ld (0e1c9h),a		;6699
	ld hl,0e331h		;669c   ; ...160 cuadros, sprites fuera, p01:66E7 y p15:B47B...
	ld (hl),0a0h		;669f
	call 05c7dh		;66a1   ; esconde_atributos: pone las 32 fichas de sprite de 0xE100 fuera de la pantalla
	call 05b1fh		;66a4
	call 05c73h		;66a7
	call L_66E7		;66aa
	call 0b47bh		;66ad
	jp 04bb8h		;66b0   ; ...y la pantalla encendida
L_66B3:
	ld hl,(0e1a2h)		;66b3   ; 0xE1A2 (el desplazamiento) baja de 4 en 4 hasta 0, cada dos cuadros
	ld a,h			;66b6
	or l			;66b7
	jr z,L_66D0		;66b8
	ld a,(0de03h)		;66ba   ; lee el contador de cuadros del juego (sube uno por cuadro)
	rra			;66bd
	jp c,0b29ch		;66be   ; los impares, p15:B29C
	ld de,0fffch		;66c1
	add hl,de			;66c4
	jr c,L_66CA		;66c5
	ld hl,00000h		;66c7
L_66CA:
	ld (0e1a2h),hl		;66ca   ; guarda el desplazamiento de la pantalla, 16 bits (en TEAM EDIT, la fila elegida)
	jp 0b1bdh		;66cd   ; los pares, p15:B1BD
L_66D0:
	call 0b440h		;66d0   ; en 0: p15:B440 y la cuenta de 0xE331...
	ld a,080h		;66d3
	ld (0e1d1h),a		;66d5   ; guarda la marca de acabado de los pasos; en el lanzamiento, su paso (p03:A525)
	ld hl,0e331h		;66d8
	dec (hl)			;66db
	ret nz			;66dc
	ld a,001h		;66dd   ; ...al acabar, 0xE1D1 = 1
	ld (0e1d1h),a		;66df   ; guarda la marca de acabado de los pasos; en el lanzamiento, su paso (p03:A525)
	ret			;66e2
L_66E3:
	ld c,026h		;66e3   ; una casilla con 0x26 (la X de la entrada que no se juega)
	jr carreras_de_la_entrada		;66e5
L_66E7:
	ld c,000h		;66e7   ; cero carreras: abre la casilla de la entrada
	jr carreras_de_la_entrada		;66e9
L_66EB:
	ld c,001h		;66eb   ; una carrera
carreras_de_la_entrada:		; suma C carreras al equipo que batea: al total (hasta 99) y a la casilla de la entrada
	ld a,(0e19bh)		;66ed   ; la entrada (0xE19B / 2) y el equipo: local en la baja...
	srl a		;66f0
	ld hl,0e321h		;66f2   ; apunta a las carreras del local por entrada (10 casillas, 12-13 el total)
	ld de,0e196h		;66f5   ; apunta a las carreras del local (BCD; 0x99 acaba el partido)
	jr c,L_6700		;66f8
	ld hl,0e311h		;66fa   ; ...visitante en la alta
	ld de,0e194h		;66fd   ; apunta a las carreras del visitante (BCD; 0x99 acaba el partido)
L_6700:
	ld b,a			;6700   ; la casilla: la entrada modulo 10
	sub 00ah		;6701
	jr nc,L_6700		;6703
	push hl			;6705
	ld a,b			;6706
	call 04216h		;6707   ; hl_mas_a: HL = HL + A
	ld a,c			;670a
	or a			;670b
	jp z,L_674D		;670c
	ld a,c			;670f   ; 0x26: la X en la casilla del local
	cp 026h		;6710
	jr nz,L_671F		;6712
	pop hl			;6714
	ld a,b			;6715
	ld hl,0e321h		;6716   ; apunta a las carreras del local por entrada (10 casillas, 12-13 el total)
	call 04216h		;6719   ; hl_mas_a: HL = HL + A
	ld (hl),026h		;671c
	ret			;671e
L_671F:
	ld a,(de)			;671f   ; las carreras del partido, hasta 99 (BCD)...
	cp 099h		;6720
	jr z,L_6727		;6722
	add a,c			;6724
	daa			;6725
	ld (de),a			;6726
L_6727:
	ld a,(hl)			;6727   ; ...y las de la entrada, de 0 a 9 (casilla 1-10)
	or a			;6728
	jr nz,L_672C		;6729
	inc (hl)			;672b
L_672C:
	ld a,(hl)			;672c
	add a,000h		;672d
	daa			;672f
	inc a			;6730
	and 00fh		;6731
	ld (hl),a			;6733
L_6734:
	pop hl			;6734   ; el total en las casillas 12-13 (cifra mas 1; 0 en blanco)
	ld a,00ch		;6735
	call 04216h		;6737   ; hl_mas_a: HL = HL + A
	ld a,(de)			;673a
	ld b,a			;673b
	and 00fh		;673c
	inc a			;673e
	ld (hl),a			;673f
	ld a,b			;6740
	and 0f0h		;6741
	rrca			;6743
	rrca			;6744
	rrca			;6745
	rrca			;6746
	or a			;6747
	ret z			;6748
	inc a			;6749
	dec hl			;674a
	ld (hl),a			;674b
	ret			;674c
L_674D:
	ld a,(hl)			;674d   ; sin carreras, la casilla se abre (0 = el caracter 1, el cero)
	or a			;674e
	jr nz,L_6734		;674f
	inc (hl)			;6751
	jr L_6734		;6752
L_6754:
	ld a,(0e19bh)		;6754   ; borra las casillas de la entrada (modulo 10)
	srl a		;6757
L_6759:
	ld b,a			;6759
	sub 00ah		;675a
	jr nc,L_6759		;675c
	ld hl,0e321h		;675e   ; apunta a las carreras del local por entrada (10 casillas, 12-13 el total)
	call L_6767		;6761
	ld hl,0e311h		;6764   ; apunta a las carreras del visitante por entrada (10 casillas, 12-13 el total)
L_6767:
	ld a,b			;6767
	call 04216h		;6768   ; hl_mas_a: HL = HL + A
	xor a			;676b
	ld (hl),a			;676c
	inc hl			;676d
	ld (hl),a			;676e
	ret			;676f
L_6770:
	ld hl,0e311h		;6770   ; las casillas de las dos filas a cero...
	ld de,0e312h		;6773
	ld bc,0001fh		;6776
	ld (hl),000h		;6779
	ldir		;677b
	ld a,0ffh		;677d   ; ...con 0xFF al final de cada una
	ld (0e31eh),a		;677f
	ld (0e32eh),a		;6782
	ret			;6785
L_6786:
	call L_6974		;6786   ; el cambio de campo: p01:6974 y el paso de 0xE339
	ld a,(0e339h)		;6789
	ld b,a			;678c
	djnz L_67F0		;678d
	call 05b1fh		;678f   ; paso 1: los sprites a la VRAM...
	call 05c73h		;6792
	ld hl,0e110h		;6795   ; ...8 sprites desde el 4 fuera de la pantalla...
	ld b,008h		;6798
	call 05c82h		;679a
	ld a,03fh		;679d   ; ...0xE19D = 0x3F y p02:8B0E
	ld (0e19dh),a		;679f   ; guarda el mando del bateador o los corredores
	call 08b0eh		;67a2
	call L_66B3		;67a5   ; el desplazamiento (p01:66B3) hasta que acaba (bit 0 de 0xE1D1)
	ld a,(0e1d1h)		;67a8   ; lee la marca de acabado de los pasos; en el lanzamiento, su paso (p03:A525)
	rra			;67ab
	ret nc			;67ac
	call L_693E		;67ad   ; el campo nuevo (p01:693E) y los dibujos de p00:530F
	call 0530fh		;67b0
	ld de,0e100h		;67b3   ; los 8 primeros atributos de sprite de 0x69C2
	ld hl,069c2h		;67b6
	ld bc,00020h		;67b9
	ldir		;67bc
	ld a,(0edd0h)		;67be   ; el color de la camiseta 0x1B en los 4 sprites del equipo que no batea
	or a			;67c1
	jr z,L_67CC		;67c2
	ld a,(0e19bh)		;67c4   ; lee la media entrada (bit 0: 0 la alta, 1 la baja; 0x11 = la baja de la 9.a)
	rra			;67c7
	jr nc,L_67E0		;67c8
	jr L_67D2		;67ca
L_67CC:
	ld a,(0e19bh)		;67cc   ; lee la media entrada (bit 0: 0 la alta, 1 la baja; 0x11 = la baja de la 9.a)
	rra			;67cf
	jr c,L_67E0		;67d0
L_67D2:
	ld hl,0e107h		;67d2
	ld de,00008h		;67d5
	ld b,004h		;67d8
	ld a,01bh		;67da
L_67DC:
	ld (hl),a			;67dc
	add hl,de			;67dd
	djnz L_67DC		;67de
L_67E0:
	call 05b1fh		;67e0   ; los sprites a la VRAM, 12 cuadros y 6 vueltas (0xDD8B)
	ld a,00ch		;67e3
	ld (0de04h),a		;67e5   ; guarda la cuenta atras del estado
	ld a,006h		;67e8
	ld (0dd8bh),a		;67ea
	jp L_6939		;67ed
L_67F0:
	djnz $+87		;67f0   ; paso 2: cada 12 cuadros...
	call 05c73h		;67f2   ; los sprites; cada 12 cuadros...
	ld hl,0de04h		;67f5   ; apunta a la cuenta atras del estado
	dec (hl)			;67f8
	ret nz			;67f9
	ld (hl),00ch		;67fa
	ld hl,0dd8bh		;67fc   ; ...y al acabar las 6 vueltas...
	dec (hl)			;67ff
	jr nz,$+39		;6800
	ld (hl),004h		;6802   ; ...4 vueltas mas de 28 cuadros
	ld a,01ch		;6804
	ld (0de04h),a		;6806   ; guarda la cuenta atras del estado
	ld de,0e120h		;6809   ; los atributos 8-9 de 0x681F
	ld hl,0681fh		;680c
	ld bc,00008h		;680f
	ldir		;6812
	call 05b1fh		;6814   ; a la VRAM y el sonido 0x47
	ld a,047h		;6817
	call 057ffh		;6819   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	jp L_6939		;681c   ; al paso siguiente

; ----------------------------------------------------------------------
; DATOS resto_681F: lo apuntan con el banco puesto p01:680C (0x681F); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p01:680C (8 bytes)
;   0x681f..0x6827  (8 bytes)
DATA_resto_681F:
	defb 024h,0b0h,0e0h,00dh,024h,0b0h,0e4h,01eh	; 681f  $...$...

; ======================================================================
; CODIGO 0x6827..0x688a  (99 bytes)
; ======================================================================


L_6827:
	ld a,(hl)			;6827   ; con A = 1, los dibujos de p00:5348
	push af			;6828
	dec a			;6829
	call z,05348h		;682a
	pop af			;682d
	ld hl,069bch		;682e   ; el dibujo de la fila A de 0x69BC...
	call 04216h		;6831   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;6834
	ld b,008h		;6835
	ld de,0e102h		;6837
L_683A:
	ld (de),a			;683a   ; ...en los 8 atributos desde 0xE102, de 4 en 4
	inc de			;683b
	inc de			;683c
	inc de			;683d
	inc de			;683e
	add a,004h		;683f
	djnz L_683A		;6841
	call 05c73h		;6843
	ret			;6846
L_6847:
	djnz $+75		;6847   ; paso 3: los sprites 8 y 9 suben uno por cuadro
	call 05c73h		;6849
	ld hl,0e121h		;684c
	dec (hl)			;684f
	inc hl			;6850
	inc hl			;6851
	inc hl			;6852
	inc hl			;6853
	dec (hl)			;6854
	ld hl,0de04h		;6855   ; cada 28 cuadros, 0xDD8B vueltas
	dec (hl)			;6858
	ret nz			;6859
	ld (hl),01ch		;685a
	ld hl,0dd8bh		;685c
	dec (hl)			;685f
	jp nz,L_694B		;6860
	call 05336h		;6863   ; al acabar: los dibujos de p00:5336...
	ld a,008h		;6866   ; ...8 cuadros, 0xDD8B = 7, 0xDD8C = 2, 0xDD8D = 0...
	ld (0de04h),a		;6868   ; guarda la cuenta atras del estado
	ld a,007h		;686b
	ld hl,0dd8bh		;686d
	ld (hl),a			;6870
	inc hl			;6871
	ld a,002h		;6872
	ld (hl),a			;6874
	inc hl			;6875
	ld a,000h		;6876
	ld (hl),a			;6878
	ld de,0e120h		;6879   ; ...y los atributos 8-9 de 0x688A
	ld hl,0688ah		;687c
	ld bc,00008h		;687f
	ldir		;6882
	call 05b1fh		;6884
	jp L_6939		;6887

; ----------------------------------------------------------------------
; DATOS resto_688A: lo apuntan con el banco puesto p01:687C (0x688A); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p01:687C (8 bytes)
;   0x688a..0x6892  (8 bytes)
DATA_resto_688A:
	defb 020h,040h,000h,00bh,020h,040h,004h,01dh	; 688a   @.. @..

; ======================================================================
; CODIGO 0x6892..0x69bd  (299 bytes)
; ======================================================================


L_6892:
	djnz L_68EA		;6892   ; paso 4: cada 8 cuadros...
	call 05c73h		;6894
	ld hl,0de04h		;6897   ; apunta a la cuenta atras del estado
	dec (hl)			;689a
	ret nz			;689b
	ld (hl),008h		;689c
	ld hl,0dd8ch		;689e   ; ...0xDD8C vueltas: entonces p01:695A...
	dec (hl)			;68a1
	jr nz,L_68C8		;68a2
	call L_695A		;68a4
	ld hl,0dd8ch		;68a7
	ld a,002h		;68aa   ; ...y otra tanda, hasta que se acabe 0xDD8B
	ld (hl),a			;68ac
	dec hl			;68ad
	dec (hl)			;68ae
	inc hl			;68af
	jr nz,L_68C8		;68b0
	ld (hl),080h		;68b2   ; al final, 128 cuadros, los sprites desde el 8 fuera y p01:6902
	ld hl,0e120h		;68b4
	ld b,018h		;68b7
	call 05c82h		;68b9
	call 05b1fh		;68bc
	call 05c73h		;68bf
	call L_6902		;68c2
	jp L_6939		;68c5
L_68C8:
	dec hl			;68c8   ; la fila de 0x69E1 de esta vuelta...
	ld a,(hl)			;68c9
	ex de,hl			;68ca
	ld hl,069e1h		;68cb
	call 04216h		;68ce   ; hl_mas_a: HL = HL + A
	ld b,(hl)			;68d1
	ld c,020h		;68d2
	ex de,hl			;68d4
	inc hl			;68d5
	inc hl			;68d6
	ld a,008h		;68d7   ; ...8 puntos mas a la derecha...
	add a,(hl)			;68d9
	ld (hl),a			;68da
	ld hl,0e121h		;68db   ; ...en los sprites 8 y 9
	ld (hl),b			;68de
	inc hl			;68df
	ld (hl),a			;68e0
	inc hl			;68e1
	inc hl			;68e2
	inc hl			;68e3
	add a,004h		;68e4
	ld (hl),b			;68e6
	inc hl			;68e7
	ld (hl),a			;68e8
	ret			;68e9
L_68EA:
	djnz L_6910		;68ea   ; paso 5: la espera de 0xDD8B
	ld hl,0dd8bh		;68ec
	dec (hl)			;68ef
	jr z,L_68FF		;68f0
	ld a,(0de03h)		;68f2   ; cada 16 cuadros parpadea (bit 4 de 0xDE03): borra o copia
	ld b,a			;68f5
	and 00fh		;68f6
	ret nz			;68f8
	bit 4,b		;68f9
	jr z,L_693E		;68fb
	jr L_6902		;68fd
L_68FF:
	call L_6939		;68ff
L_6902:
	ld de,04020h		;6902   ; copia con TIMP de (0x10, 0x00) de la pagina 1 a (0x20, 0x40): 0x78 x 0x10
	ld hl,00010h		;6905
	ld bc,07810h		;6908
	ld a,048h		;690b
	jp 04dfbh		;690d   ; copia_logica: orden LMMM (0x90 + operacion) del VDP: copia el rectangulo HL a DE, BC de tamano; las paginas en los bits 4-7 de A' y la operacion logica en los 0-3
L_6910:
	djnz L_6928		;6910   ; paso 6: 0xEDC2 carreras de una vez (p01:66EB)
	ld a,(0edc2h)		;6912
	ld b,a			;6915
L_6916:
	push bc			;6916
	call L_66EB		;6917
	pop bc			;691a
	djnz L_6916		;691b
	call 05991h		;691d   ; la fuente, los caracteres y 0xE33B = 0
	call 052b5h		;6920
	xor a			;6923
	ld (0e33bh),a		;6924   ; guarda lo que acaba la jugada: 1 home run, 2 jugada anulada
	ret			;6927
L_6928:
	call 05b1fh		;6928   ; paso 7: los sprites, p02:98FC y la cuenta; al acabar p15:B44F
	call 05c73h		;692b
	call 098fch		;692e
	ld hl,0de04h		;6931   ; apunta a la cuenta atras del estado
	dec (hl)			;6934
	ret nz			;6935
	call 0b44fh		;6936
L_6939:
	ld hl,0e339h		;6939   ; al paso siguiente (0xE339)
	inc (hl)			;693c
	ret			;693d
L_693E:
	ld hl,02818h		;693e   ; un rectangulo de color 0x11 en (0x18, 0x28), 0x28 x 0xB0
	ld bc,0b028h		;6941
	ld a,011h		;6944
	ld d,000h		;6946
	jp 04d2ah		;6948   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
L_694B:
	ld hl,0e122h		;694b   ; los sprites 8 y 9, 8 puntos mas a la derecha
	ld a,008h		;694e
	add a,(hl)			;6950
	ld (hl),a			;6951
	inc hl			;6952
	inc hl			;6953
	inc hl			;6954
	inc hl			;6955
	add a,004h		;6956
	ld (hl),a			;6958
	ret			;6959
L_695A:
	ld a,(0dd8bh)		;695a   ; la columna de 0x69E1 de la vuelta 0xDD8B...
	ld hl,069e1h		;695d
	call 04216h		;6960   ; hl_mas_a: HL = HL + A
	ld d,(hl)			;6963
	ld e,021h		;6964
	ld a,d			;6966   ; ...copiada con TIMP de 0x40 mas a la izquierda: 16 x 16
	sub 040h		;6967
	ld h,a			;6969
	ld l,010h		;696a
	ld bc,01010h		;696c
	ld a,048h		;696f
	jp 04dfbh		;6971   ; copia_logica: orden LMMM (0x90 + operacion) del VDP: copia el rectangulo HL a DE, BC de tamano; las paginas en los bits 4-7 de A' y la operacion logica en los 0-3
L_6974:
	ld hl,0ed21h		;6974   ; la cuenta de 0xED21: cada 96 cuadros (0xED22) una menos...
	xor a			;6977
	or (hl)			;6978
	ret z			;6979
	inc hl			;697a
	dec (hl)			;697b
	ret nz			;697c
	ld (hl),060h		;697d
	dec hl			;697f
	dec (hl)			;6980
	ld a,01ch		;6981   ; ...con el sonido 0x1C
	jp 057ffh		;6983   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_6986:
	ld hl,02818h		;6986   ; borra el rectangulo de (0x18, 0x28), 0x28 x 0xB0
	ld bc,0b028h		;6989
	xor a			;698c
	ld d,a			;698d
	jp 04d2ah		;698e   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
L_6991:
	ld hl,00000h		;6991   ; borra cuatro rectangulos de la pantalla
	ld bc,00018h		;6994
	xor a			;6997
	ld d,a			;6998
	call 04d2ah		;6999   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
	ld hl,00010h		;699c
	ld bc,02830h		;699f
	xor a			;69a2
	ld d,a			;69a3
	call 04d2ah		;69a4   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
	ld hl,0d810h		;69a7
	ld bc,02830h		;69aa
	xor a			;69ad
	ld d,a			;69ae
	call 04d2ah		;69af   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
	ld hl,00040h		;69b2
	ld bc,00094h		;69b5
	xor a			;69b8
	ld d,a			;69b9
	jp 04d2ah		;69ba   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'

; ----------------------------------------------------------------------
; DATOS resto_69BD: lo apuntan con el banco puesto p01:67B6 (0x69C2), p01:68CB
;   (0x69E1), p01:695D (0x69E1); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p01:67B6, p01:68CB, p01:695D (44 bytes)
;   0x69bd..0x69e9  (44 bytes)
DATA_resto_69BD:
	defb 080h,060h,040h,020h,000h,01ch,0b8h,000h,007h,01ch,0b8h,004h,018h,01ch,0c8h,008h	; 69bd  .`@ ............
	defb 007h,01ch,0c8h,00ch,018h,02ch,0b8h,010h,007h,02ch,0b8h,014h,018h,02ch,0c8h,018h	; 69cd  .....,...,...,..
	defb 007h,02ch,0c8h,01ch,018h,0a8h,098h,088h,070h,060h,050h,040h	; 69dd  .,......p`P@

; ======================================================================
; CODIGO 0x69e9..0x6ab1  (200 bytes)
; ======================================================================


L_69E9:
	ld a,(0e19bh)		;69e9   ; el bateador: los datos del equipo de la alta (0xD38B) o de la baja (0xD48A)...
	rra			;69ec
	ld hl,0d38bh		;69ed   ; apunta a los jugadores del visitante (14 bytes cada uno)
	ld de,0ec4fh		;69f0   ; ...y su orden de bateo (0xEC4F o 0xEC61)
	jr nc,L_69FA		;69f3
	ld hl,0d48ah		;69f5   ; apunta a los jugadores del local (14 bytes cada uno)
	ld e,061h		;69f8
L_69FA:
	push de			;69fa
	ld a,(de)			;69fb   ; su numero en el orden, en (0xA8, 0xC8)
	push hl			;69fc
	inc a			;69fd
	ld de,0c8a8h		;69fe
	call 05c12h		;6a01
	pop hl			;6a04
	pop de			;6a05
	call L_6A24		;6a06   ; su ficha (p01:6A24)
	or a			;6a09
	jr nz,L_6A1E		;6a0a
	inc hl			;6a0c   ; si es bateador: dos numeros de su ficha (3 cifras en (0xB8, 0xE0) y 2 en (0xB0, 0xE4))
	inc hl			;6a0d
	ld de,0e0b8h		;6a0e
	ld b,003h		;6a11
	call 05be6h		;6a13
	ld de,0e4b0h		;6a16
	ld b,002h		;6a19
	jp 05be6h		;6a1b
L_6A1E:
	ld hl,07eabh		;6a1e   ; si es lanzador, el texto de p13:7EAB
	jp 04ea6h		;6a21   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
L_6A24:
	call L_6A40		;6a24   ; la ficha del jugador DE del equipo HL...
	push de			;6a27
	ld de,0d0a8h		;6a28   ; ...borra el sitio del nombre (0x28 x 8 en (0xA8, 0xD0))...
	push hl			;6a2b
	push de			;6a2c
	ld bc,02808h		;6a2d
	xor a			;6a30
	ex de,hl			;6a31
	ld d,000h		;6a32
	call 04d2ah		;6a34   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
	pop de			;6a37
	pop hl			;6a38
	ld b,005h		;6a39   ; ...y pinta sus 5 letras (p15:A425)
	call 0a425h		;6a3b
	pop af			;6a3e
	ret			;6a3f
L_6A40:
	ld a,(de)			;6a40   ; el numero de jugador (indice en el orden) de la lista...
	inc de			;6a41
	call 0421bh		;6a42   ; de_mas_a: DE = DE + A
	ld a,(de)			;6a45   ; ...los 12 primeros son de campo: fichas de 14 bytes
	ld b,a			;6a46
	sub 00dh		;6a47
	jr nc,L_6A58		;6a49
	ld a,b			;6a4b   ; (n - 1) x 14
	dec a			;6a4c
	add a,a			;6a4d
	ld b,a			;6a4e
	add a,a			;6a4f
	ld c,a			;6a50
	add a,a			;6a51
	add a,b			;6a52
	add a,c			;6a53
	ld d,000h		;6a54
	jr L_6A5F		;6a56
L_6A58:
	call L_6AA8		;6a58   ; los lanzadores (desde 13): fichas de 11 bytes desde +0xA8
	add a,0a8h		;6a5b
	ld d,001h		;6a5d
L_6A5F:
	ld b,000h		;6a5f   ; HL = la ficha; D = 1 si es lanzador
	ld c,a			;6a61
	add hl,bc			;6a62
	ret			;6a63
L_6A64:
	ld a,(0e19bh)		;6a64   ; el lanzador del equipo que no batea: su lista de la alineacion...
	rra			;6a67
	ld de,0ec50h		;6a68   ; apunta a el orden de bateo del visitante (9 numeros de jugador)
	ld hl,0d38bh		;6a6b   ; apunta a los jugadores del visitante (14 bytes cada uno)
	jr c,L_6A76		;6a6e
	ld de,0ec62h		;6a70   ; apunta a el orden de bateo del local (9 numeros de jugador)
	ld hl,0d48ah		;6a73   ; apunta a los jugadores del local (14 bytes cada uno)
L_6A76:
	ld b,009h		;6a76   ; ...busca en los 9 el primero de 13 en adelante
	ld c,00dh		;6a78
L_6A7A:
	ld a,(de)			;6a7a
	cp c			;6a7b
	jr nc,L_6A82		;6a7c
	inc de			;6a7e
	djnz L_6A7A		;6a7f
	ret			;6a81
L_6A82:
	sub 00dh		;6a82   ; su ficha de lanzador...
	call L_6AA8		;6a84
	add a,0a8h		;6a87
	call 04216h		;6a89   ; hl_mas_a: HL = HL + A
	ld de,010a8h		;6a8c   ; ...su nombre (5 letras) en (0xA8, 0x10)...
	ld b,005h		;6a8f
	call 0a425h		;6a91
	ld de,00006h		;6a94   ; ...y dos numeros de la ficha: 1 en (0xB0, 0x18) y 2 en (0xB0, 0x24)
	add hl,de			;6a97
	ld de,018b0h		;6a98
	ld b,001h		;6a9b
	call 0a425h		;6a9d
	ld de,024b0h		;6aa0
	ld b,002h		;6aa3
	jp 0a425h		;6aa5
L_6AA8:
	ld b,a			;6aa8   ; A x 11
	add a,a			;6aa9
	ld c,a			;6aaa
	add a,a			;6aab
	add a,a			;6aac
	add a,a			;6aad
	add a,b			;6aae
	add a,c			;6aaf
	ret			;6ab0

; ----------------------------------------------------------------------
; DATOS resto_6AB1: lo apuntan con el banco puesto p01:6E29 (0x6AB1), p01:6E8E
;   (0x6AB1); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p01:6E29, p01:6E8E (16 bytes)
;   0x6ab1..0x6ac1  (16 bytes)
DATA_resto_6AB1:
	defb 0ffh,000h,039h,001h,088h,001h,039h,001h,03fh,001h,0c4h,000h,03fh,001h,0ach,001h	; 6ab1  ..9...9.?...?...

; ======================================================================
; CODIGO 0x6ac1..0x6b2b  (106 bytes)
; ======================================================================


L_6AC1:
	call L_6B37		;6ac1   ; el campo: la cuenta de 0xEC48, p01:6F34, p14:8324 y p01:6F52...
	call L_6F34		;6ac4
	call 08324h		;6ac7
	call L_6F52		;6aca
	ld b,009h		;6acd   ; ...y los 9 jugadores de campo (fichas de 16 bytes desde 0xE271)
	ld ix,0e271h		;6acf   ; apunta a las 9 fichas de 16 bytes de los defensores
L_6AD3:
	push bc			;6ad3
	call L_6AEA		;6ad4   ; si tiene la pelota, p01:6AEA; luego p01:6B44 y lo suyo (p01:6B1F)
	call L_6B44		;6ad7
	push ix		;6ada
	call L_6B1F		;6adc
	pop ix		;6adf
	ld de,00010h		;6ae1
	add ix,de		;6ae4
	pop bc			;6ae6
	djnz L_6AD3		;6ae7
	ret			;6ae9
L_6AEA:
	ld a,(ix+000h)		;6aea   ; el jugador IX coge la pelota? su numero (bits 0-3) contra 0xE220
	ld c,a			;6aed
	and 00fh		;6aee
	ld b,a			;6af0
	ld a,(0e220h)		;6af1   ; lee el defensor que tiene la pelota (1-9; 0 nadie)
	cp b			;6af4
	ret nz			;6af5
	ld b,a			;6af6
	ld a,(0ed50h)		;6af7   ; si no la tenia ya (0xED50)...
	cp b			;6afa
	ret z			;6afb
	ld a,b			;6afc   ; ...la tiene: 0xED50, 0xED57 = 1, 0xEDC3 = IX+13...
	ld (0ed50h),a		;6afd
	ld a,001h		;6b00
	ld (0ed57h),a		;6b02
	ld a,(ix+00dh)		;6b05   ; lee la base de destino (nibble alto; 2 abajo: llegado)
	ld (0edc3h),a		;6b08
	ld a,(ix+000h)		;6b0b   ; ...su estado a 2 (bits 4-7)
	and 00fh		;6b0e
	or 020h		;6b10
	ld (ix+000h),a		;6b12   ; guarda el numero (bits 0-3) y el estado (bits 4-7)
	and 00fh		;6b15   ; si es el 2 (el receptor), 0xED3A = 0
	cp 002h		;6b17
	ret nz			;6b19
	xor a			;6b1a
	ld (0ed3ah),a		;6b1b
	ret			;6b1e
L_6B1F:
	ld a,(ix+000h)		;6b1f   ; lo que hace el jugador segun su estado (bits 4-7 de IX+0)
	rra			;6b22
	rra			;6b23
	rra			;6b24
	rra			;6b25
	and 00fh		;6b26
	call 04220h		;6b28   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_6B2B: 6 destinos del despachador p00:4220 (call en p01:6B28, el
;   indice en A): 724A, 7376, 6B43, 6F77, 6F77, 6C96; lo leen p01:6B28 (12
;   bytes)
;   0x6b2b..0x6b37  (12 bytes)
DATA_tabla_6B2B:
	defw 0724ah,07376h,06b43h,06f77h,06f77h,06c96h	; 6b2b

; ======================================================================
; CODIGO 0x6b37..0x6d97  (608 bytes)
; ======================================================================


L_6B37:
	ld hl,0ec48h		;6b37   ; la cuenta de 0xEC48; al acabar, 0xE2EC = 0
	ld a,(hl)			;6b3a
	or a			;6b3b
	ret z			;6b3c
	dec (hl)			;6b3d
	ret nz			;6b3e
	xor a			;6b3f
	ld (0e2ech),a		;6b40
L_6B43:
	ret			;6b43
L_6B44:
	ld a,(ix+000h)		;6b44   ; si el que tiene la pelota (0xE220)...
	and 00fh		;6b47
	ld b,a			;6b49
	ld a,(0e220h)		;6b4a   ; lee el defensor que tiene la pelota (1-9; 0 nadie)
	cp b			;6b4d
	ret nz			;6b4e
	ld a,(0e19fh)		;6b4f   ; ...y se pulsa una direccion de lanzar (0xE19F, bits 4-5)...
	ld b,a			;6b52
	and 030h		;6b53
	ret z			;6b55
	and 010h		;6b56   ; ...el bit 4: a la base (p01:6BF2)
	jp nz,L_6BF2		;6b58
	ld a,(ix+000h)		;6b5b   ; en los estados 3 y 4 no
	and 0f0h		;6b5e
	cp 030h		;6b60
	ret z			;6b62
	cp 040h		;6b63
	ret z			;6b65
	ld a,b			;6b66   ; la base elegida (p01:6E15): carry si hay
	call L_6E15		;6b67
	ret nc			;6b6a
	ld a,(0e344h)		;6b6b   ; el punto de destino (p01:6E7C)
	ld b,a			;6b6e
	call L_6E7C		;6b6f
	ld a,(0ecffh)		;6b72   ; la fuerza: 0x30, o 0x3C sin 0xECFF
	or a			;6b75
	ld a,030h		;6b76
	jr nz,L_6B7C		;6b78
	ld a,03ch		;6b7a
L_6B7C:
	call 05e9fh		;6b7c   ; la velocidad de la pelota (p00:5E9F)...
	ld (ix+004h),l		;6b7f   ; ...en IX+4/5 (y, vertical) y IX+9/10 (x)
	ld (ix+005h),h		;6b82   ; guarda la velocidad y, byte alto
	ld (ix+009h),e		;6b85   ; guarda la velocidad x, byte bajo
	ld (ix+00ah),d		;6b88   ; guarda la velocidad x, byte alto
	ld a,(ix+000h)		;6b8b   ; el receptor (2)...
	and 00fh		;6b8e
	cp 002h		;6b90
	jr nz,L_6BB6		;6b92
	ld a,001h		;6b94   ; ...0xED3A = 1 y el dibujo de la base: 0, 2, 4 o 6 segun 0xE19F
	ld (0ed3ah),a		;6b96
	ld a,(0e19fh)		;6b99   ; lee el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	ld b,000h		;6b9c
	rra			;6b9e
	jr c,L_6BAD		;6b9f
	ld b,002h		;6ba1
	rra			;6ba3
	jr c,L_6BAD		;6ba4
	ld b,004h		;6ba6
	rra			;6ba8
	jr c,L_6BAD		;6ba9
	ld b,006h		;6bab
L_6BAD:
	ld a,b			;6bad
	ld (0ed3bh),a		;6bae
	call 05716h		;6bb1   ; el dibujo de 64 bytes 0xED3B (p00:5716)
	jr L_6BBD		;6bb4
L_6BB6:
	call L_6C68		;6bb6   ; los demas, p01:6C68
	xor a			;6bb9
	ld (0ed3ah),a		;6bba
L_6BBD:
	ld a,(0e19fh)		;6bbd   ; el dibujo del lanzamiento segun la base: 0x31, 0x51, 0x41 o 0x21
	ld b,031h		;6bc0
	rra			;6bc2
	jr c,L_6BD1		;6bc3
	ld b,051h		;6bc5
	rra			;6bc7
	jr c,L_6BD1		;6bc8
	ld b,041h		;6bca
	rra			;6bcc
	jr c,L_6BD1		;6bcd
	ld b,021h		;6bcf
L_6BD1:
	ld (ix+00dh),b		;6bd1   ; a IX+13
	ld hl,(0e35ah)		;6bd4   ; el destino de 0xE35A a IX+14/15
	ld b,(hl)			;6bd7
	dec hl			;6bd8
	dec hl			;6bd9
	ld c,(hl)			;6bda
	ld (ix+00eh),c		;6bdb   ; guarda la y de destino
	ld (ix+00fh),b		;6bde   ; guarda la x de destino
	ld a,(ix+00ch)		;6be1   ; 0xEDC5 = IX+12 y el estado 3: lanzando
	ld (0edc5h),a		;6be4
	ld a,(ix+000h)		;6be7   ; lee el numero (bits 0-3) y el estado (bits 4-7)
	and 00fh		;6bea
	or 030h		;6bec
	ld (ix+000h),a		;6bee   ; guarda el numero (bits 0-3) y el estado (bits 4-7)
	ret			;6bf1
L_6BF2:
	ld a,(0ed57h)		;6bf2   ; a la base: solo si el jugador acaba de coger la pelota (0xED57)
	or a			;6bf5
	ret z			;6bf6
	ld a,(0e19fh)		;6bf7   ; la direccion de 0xE19F se guarda en 0xED38
	ld (0ed38h),a		;6bfa
	call L_6E15		;6bfd   ; la base elegida: carry si hay una
	ret nc			;6c00
	xor a			;6c01   ; ya no es recien cogida
	ld (0ed57h),a		;6c02
	ld a,(ix+00dh)		;6c05   ; si el lanzamiento llevaba dibujo (IX+13)...
	or a			;6c08
	jr z,L_6C23		;6c09
	ld hl,0e27eh		;6c0b   ; ...los 9 de campo que esperan ese dibujo se marcan
	ld b,009h		;6c0e
L_6C10:
	cp (hl)			;6c10
	jr nz,L_6C1D		;6c11
	ld de,0fffeh		;6c13
	add hl,de			;6c16
	ld (hl),001h		;6c17
	ld de,00002h		;6c19
	add hl,de			;6c1c
L_6C1D:
	ld de,00010h		;6c1d
	add hl,de			;6c20
	djnz L_6C10		;6c21
L_6C23:
	ld (ix+00bh),001h		;6c23   ; IX+11 = 1
	ld a,(ix+000h)		;6c27   ; el receptor (2) va aparte
	and 00fh		;6c2a
	cp 002h		;6c2c
	jr z,L_6C3C		;6c2e
	ld a,(ix+00ch)		;6c30   ; los demas: el dibujo de antes a 0xEDC5 y el 0x60
	ld (0edc5h),a		;6c33
	ld (ix+00ch),060h		;6c36   ; el dibujo de su sprite = 0x60
	jr L_6C52		;6c3a
L_6C3C:
	ld (ix+00ch),0f8h		;6c3c   ; el receptor: dibujo 0xF8 y el de 64 bytes 0x0B (p00:5716)
	ld hl,0ed3bh		;6c40
	ld a,(hl)			;6c43
	ld (0edc5h),a		;6c44
	ld a,00bh		;6c47
	ld (hl),a			;6c49
	call 05716h		;6c4a
	ld a,001h		;6c4d
	ld (0ed3ah),a		;6c4f
L_6C52:
	ld a,004h		;6c52   ; 4 cuadros de preparacion (0xED35)...
	ld (0ed35h),a		;6c54
	push ix		;6c57   ; ...el jugador en 0xED33...
	pop hl			;6c59
	ld (0ed33h),hl		;6c5a
	ld a,(ix+000h)		;6c5d   ; ...y su estado a 5: preparando el lanzamiento
	and 00fh		;6c60
	or 050h		;6c62
	ld (ix+000h),a		;6c64   ; guarda el numero (bits 0-3) y el estado (bits 4-7)
	ret			;6c67
L_6C68:
	ld a,d			;6c68   ; el dibujo segun la direccion: 0x20 o 0x30 segun el signo de D...
	rla			;6c69
	ld b,020h		;6c6a
	jr c,L_6C70		;6c6c
	ld b,030h		;6c6e
L_6C70:
	ld a,h			;6c70   ; ...0x00 o 0x10 segun el de H...
	rla			;6c71
	ld c,000h		;6c72
	jr c,L_6C78		;6c74
	ld c,010h		;6c76
L_6C78:
	xor a			;6c78   ; ...con los dos parados se miran E y L...
	res 7,h		;6c79
	jr z,L_6C7E		;6c7b
	inc a			;6c7d
L_6C7E:
	res 7,d		;6c7e
	jr z,L_6C83		;6c80
	inc a			;6c82
L_6C83:
	or a			;6c83
	jr nz,L_6C8C		;6c84
	res 7,e		;6c86
	ld d,e			;6c88
	res 7,l		;6c89
	ld h,l			;6c8b
L_6C8C:
	ld a,h			;6c8c   ; ...el mayor elige: hacia arriba-abajo o a los lados
	sub d			;6c8d
	ld a,b			;6c8e
	jr c,L_6C92		;6c8f
	ld a,c			;6c91
L_6C92:
	ld (ix+00ch),a		;6c92   ; guarda el dibujo de su sprite
	ret			;6c95
L_6C96:
	ld hl,0ed35h		;6c96   ; la preparacion del lanzamiento: 4 cuadros
	dec (hl)			;6c99
	ret nz			;6c9a
	ld (hl),004h		;6c9b
	ld a,(0ed3ah)		;6c9d   ; el receptor: el dibujo 0x0C...
	or a			;6ca0
	jr z,L_6CAD		;6ca1
	ld a,00ch		;6ca3
	ld (0ed3bh),a		;6ca5
	call 05716h		;6ca8
	jr L_6CB1		;6cab
L_6CAD:
	ld (ix+00ch),058h		;6cad   ; ...los demas el 0x58
L_6CB1:
	ld a,(0ed38h)		;6cb1   ; la base de 0xED38...
	call L_6E15		;6cb4
	ld a,005h		;6cb7   ; ...el sonido 5 (el lanzamiento)...
	call 057ffh		;6cb9   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	ld a,(0e344h)		;6cbc   ; ...el punto de destino...
	ld b,a			;6cbf
	call L_6E7C		;6cc0
	ld a,(0ecffh)		;6cc3   ; ...la fuerza 0x50, o 0x70 sin 0xECFF
	or a			;6cc6
	ld a,050h		;6cc7
	jr nz,L_6CCD		;6cc9
	ld a,070h		;6ccb
L_6CCD:
	call 05e9fh		;6ccd   ; la velocidad de la pelota (p00:5E9F)...
	push ix		;6cd0
	ld ix,0e211h		;6cd2   ; ...a la ficha de la pelota (0xE211)
	xor a			;6cd6
	ld (ix+000h),a		;6cd7   ; guarda el numero (bits 0-3) y el estado (bits 4-7)
	ld (ix+004h),l		;6cda   ; guarda la velocidad y, byte bajo
	ld (ix+005h),h		;6cdd   ; guarda la velocidad y, byte alto
	ld (ix+009h),e		;6ce0   ; guarda la velocidad x, byte bajo
	ld (ix+00ah),d		;6ce3   ; guarda la velocidad x, byte alto
	ld (ix+00bh),001h		;6ce6   ; las marcas = 0x01
	ld (ix+00ch),a		;6cea   ; guarda el dibujo de su sprite
	ld (ix+00eh),a		;6ced   ; guarda la y de destino
	pop ix		;6cf0
	xor a			;6cf2   ; el dibujo de la pelota segun el signo de la y (p00:572E)
	rl h		;6cf3
	jr nc,L_6CF8		;6cf5
	inc a			;6cf7
L_6CF8:
	call 0572eh		;6cf8
	call 051cdh		;6cfb   ; los dibujos 0x40 (p00:51CD) y la altura (p01:6DB7)
	call L_6DB7		;6cfe
	ld a,h			;6d01   ; la altura de la pelota: 0x0400, o la de 0x6D97 segun la distancia / 16
	or a			;6d02
	ld de,00400h		;6d03
	jr nz,L_6D19		;6d06
	ld a,l			;6d08
	rra			;6d09
	rra			;6d0a
	rra			;6d0b
	rra			;6d0c
	and 00fh		;6d0d
	add a,a			;6d0f
	ld hl,06d97h		;6d10
	call 04216h		;6d13   ; hl_mas_a: HL = HL + A
	ld e,(hl)			;6d16
	inc hl			;6d17
	ld d,(hl)			;6d18
L_6D19:
	ld hl,0e226h		;6d19   ; a 0xE226
	ld (hl),e			;6d1c
	inc hl			;6d1d
	ld (hl),d			;6d1e
	ld a,00dh		;6d1f   ; 0xE302 = 0x0D, 0xED39 = 0x0F, 0xED3C = 0x10
	ld (0e302h),a		;6d21
	ld a,00fh		;6d24
	ld (0ed39h),a		;6d26
	ld a,010h		;6d29
	ld (0ed3ch),a		;6d2b
	xor a			;6d2e   ; nadie tiene la pelota: 0xE33C, 0xED3A, 0xE220 y 0xED50 a 0
	ld (0e33ch),a		;6d2f
	ld (0ed3ah),a		;6d32
	ld (0e220h),a		;6d35   ; guarda el defensor que tiene la pelota (1-9; 0 nadie)
	ld (0ed50h),a		;6d38
	call L_6D7D		;6d3b   ; el dibujo del que lanza
	ld a,(0edc3h)		;6d3e   ; 0xEDC3: el que la tenia...
	or a			;6d41
	jr z,L_6D57		;6d42
	cp (ix+00dh)		;6d44   ; ...si es este, vuelve al estado 2
	jr nz,L_6D69		;6d47
	ld (ix+00dh),a		;6d49
	ld a,(ix+000h)		;6d4c
	and 00fh		;6d4f
	or 020h		;6d51
	ld (ix+000h),a		;6d53
	ret			;6d56
L_6D57:
	ld (ix+00dh),a		;6d57   ; sin nadie: estado 0 y el dibujo de 0xED50
	ld a,(ix+000h)		;6d5a   ; lee el numero (bits 0-3) y el estado (bits 4-7)
	and 00fh		;6d5d
	ld (ix+000h),a		;6d5f   ; guarda el numero (bits 0-3) y el estado (bits 4-7)
	ld a,(0ed50h)		;6d62
	ld (ix+00ch),a		;6d65   ; guarda el dibujo de su sprite
	ret			;6d68
L_6D69:
	and 0f0h		;6d69   ; otro: estado 1 y a correr (p01:712E)
	or 001h		;6d6b
	ld (ix+00dh),a		;6d6d   ; guarda la base de destino (nibble alto; 2 abajo: llegado)
	ld a,(ix+000h)		;6d70   ; lee el numero (bits 0-3) y el estado (bits 4-7)
	and 00fh		;6d73
	or 010h		;6d75
	ld (ix+000h),a		;6d77   ; guarda el numero (bits 0-3) y el estado (bits 4-7)
	jp L_712E		;6d7a
L_6D7D:
	ld a,(ix+000h)		;6d7d   ; el dibujo del jugador: el receptor el 64 bytes 2...
	and 00fh		;6d80
	cp 002h		;6d82
	jr z,L_6D8F		;6d84
	ld h,(ix+005h)		;6d86   ; ...los demas segun su velocidad
	ld d,(ix+00ah)		;6d89   ; lee la velocidad x, byte alto
	jp L_6C68		;6d8c
L_6D8F:
	ld a,002h		;6d8f
	ld (0ed3bh),a		;6d91
	jp 05716h		;6d94

; ----------------------------------------------------------------------
; DATOS resto_6D97: lo apuntan con el banco puesto p01:6D10 (0x6D97); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p01:6D10 (32 bytes)
;   0x6d97..0x6db7  (32 bytes)
DATA_resto_6D97:
	defb 000h,001h,001h,001h,002h,001h,090h,001h,0e1h,001h,000h,002h,001h,002h,002h,002h	; 6d97  ................
	defb 080h,002h,081h,002h,000h,003h,040h,003h,080h,003h,000h,004h,040h,004h,080h,004h	; 6da7  ......@.....@...

; ======================================================================
; CODIGO 0x6db7..0x7203  (1100 bytes)
; ======================================================================


L_6DB7:
	ld hl,(0e35ah)		;6db7   ; la distancia al destino (0xE35A): |dx| (IX+7/8)...
	ld c,(hl)			;6dba
	inc hl			;6dbb
	ld b,(hl)			;6dbc
	push hl			;6dbd
	ex de,hl			;6dbe
	ld e,(ix+007h)		;6dbf   ; lee la x (horizontal)
	ld d,(ix+008h)		;6dc2   ; lee la x, byte alto
	ld h,b			;6dc5
	ld l,c			;6dc6
	or a			;6dc7
	sbc hl,de		;6dc8
	ld a,h			;6dca
	rla			;6dcb
	jr nc,L_6DD5		;6dcc
	ld a,h			;6dce
	cpl			;6dcf
	ld h,a			;6dd0
	ld a,l			;6dd1
	cpl			;6dd2
	ld l,a			;6dd3
	inc hl			;6dd4
L_6DD5:
	ld (0e340h),hl		;6dd5   ; ...en 0xE340...
	pop hl			;6dd8
	dec hl			;6dd9
	dec hl			;6dda
	dec hl			;6ddb
	ld c,(hl)			;6ddc
	inc hl			;6ddd
	ld b,(hl)			;6dde
	ld e,(ix+002h)		;6ddf   ; ...y |dy| (IX+2/3)
	ld d,(ix+003h)		;6de2   ; lee la y, byte alto
	ld h,b			;6de5
	ld l,c			;6de6
	or a			;6de7
	sbc hl,de		;6de8
	ld a,h			;6dea
	rla			;6deb
	jr nc,L_6DF5		;6dec
	ld a,h			;6dee
	cpl			;6def
	ld h,a			;6df0
	ld a,l			;6df1
	cpl			;6df2
	ld l,a			;6df3
	inc hl			;6df4
L_6DF5:
	push hl			;6df5
	ld de,(0e340h)		;6df6   ; lee variable de paso (cada rutina la usa a su manera) y el byte siguiente (16 bits)
	or a			;6dfa
	sbc hl,de		;6dfb   ; la mayor y la menor de las dos...
	rl h		;6dfd
	pop hl			;6dff
	jr c,L_6E03		;6e00
	ex de,hl			;6e02
L_6E03:
	srl h		;6e03   ; ...distancia = mayor + menor x 3 / 8 (aprox. de la hipotenusa)
	rr l		;6e05
	srl h		;6e07
	rr l		;6e09
	srl h		;6e0b
	rr l		;6e0d
	ld b,h			;6e0f
	ld c,l			;6e10
	add hl,hl			;6e11
	add hl,bc			;6e12
	add hl,de			;6e13
	ret			;6e14
L_6E15:
	ld (0e344h),a		;6e15   ; la base de la direccion A (0xE344): bit 0 primera, 1 segunda, 2 tercera, si no la del bateador
	rra			;6e18
	ld b,000h		;6e19
	jr c,L_6E26		;6e1b
	rra			;6e1d
	inc b			;6e1e
	jr c,L_6E26		;6e1f
	rra			;6e21
	inc b			;6e22
	jr c,L_6E26		;6e23
	inc b			;6e25
L_6E26:
	ld a,b			;6e26   ; su punto en la tabla de bases (0x6AB1, 4 bytes cada una)
	add a,a			;6e27
	add a,a			;6e28
	ld de,06ab1h		;6e29
	call 0421bh		;6e2c   ; de_mas_a: DE = DE + A
	ex de,hl			;6e2f
	ld e,(hl)			;6e30
	inc hl			;6e31
	ld d,(hl)			;6e32
	ld (0e342h),hl		;6e33
	ld c,(ix+002h)		;6e36   ; el jugador cerca de la y de la base (a menos de 8)?
	ld b,(ix+003h)		;6e39   ; lee la y, byte alto
	call L_6E63		;6e3c
	ld a,000h		;6e3f
	jr nc,L_6E44		;6e41
	inc a			;6e43
L_6E44:
	ld (0e345h),a		;6e44
	ld c,(ix+007h)		;6e47   ; y de la x?
	ld b,(ix+008h)		;6e4a   ; lee la x, byte alto
	ld hl,(0e342h)		;6e4d
	inc hl			;6e50
	ld e,(hl)			;6e51
	inc hl			;6e52
	ld d,(hl)			;6e53
	call L_6E63		;6e54
	ld c,000h		;6e57
	jr nc,L_6E5C		;6e59
	inc c			;6e5b
L_6E5C:
	ld a,(0e345h)		;6e5c   ; carry si no esta en la base (no cumple las dos)
	add a,c			;6e5f
	cp 002h		;6e60
	ret			;6e62
L_6E63:
	ld h,b			;6e63   ; |BC - DE| - 8: carry si estan a menos de 8
	ld l,c			;6e64
	or a			;6e65
	sbc hl,de		;6e66
	ld a,h			;6e68
	rla			;6e69
	jr nc,L_6E73		;6e6a
	ld a,h			;6e6c
	cpl			;6e6d
	ld h,a			;6e6e
	ld a,l			;6e6f
	cpl			;6e70
	ld l,a			;6e71
	inc hl			;6e72
L_6E73:
	ld a,l			;6e73
	sub 008h		;6e74
	ld l,a			;6e76
	ret nc			;6e77
	ld a,h			;6e78
	sbc a,000h		;6e79
	ret			;6e7b
L_6E7C:
	xor a			;6e7c   ; el destino: la base de B (bit 0 primera...)
	rr b		;6e7d
	jr c,L_6E8C		;6e7f
	inc a			;6e81
	rr b		;6e82
	jr c,L_6E8C		;6e84
	inc a			;6e86
	rr b		;6e87
	jr c,L_6E8C		;6e89
	inc a			;6e8b
L_6E8C:
	add a,a			;6e8c
	add a,a			;6e8d
	ld hl,06ab1h		;6e8e   ; su y y su x de la tabla de bases (0xE35A apunta a su x)
	call 04216h		;6e91   ; hl_mas_a: HL = HL + A
	ld c,(hl)			;6e94
	inc hl			;6e95
	ld b,(hl)			;6e96
	inc hl			;6e97
	ld (0e35ah),hl		;6e98
	ld a,b			;6e9b
	ld b,h			;6e9c
	ld h,a			;6e9d
	ld a,c			;6e9e
	ld c,l			;6e9f
	ld l,a			;6ea0
	ld e,(ix+002h)		;6ea1   ; dy = y de la base - y del jugador (0xE340: signo)
	ld d,(ix+003h)		;6ea4   ; lee la y, byte alto
	xor a			;6ea7
	ld (0e340h),a		;6ea8   ; guarda variable de paso (cada rutina la usa a su manera)
	or a			;6eab
	sbc hl,de		;6eac
	jr nc,L_6EBC		;6eae
	ld a,l			;6eb0
	cpl			;6eb1
	ld l,a			;6eb2
	ld a,h			;6eb3
	cpl			;6eb4
	ld h,a			;6eb5
	inc hl			;6eb6
	ld a,001h		;6eb7
	ld (0e340h),a		;6eb9   ; guarda variable de paso (cada rutina la usa a su manera)
L_6EBC:
	ld (0e341h),hl		;6ebc   ; |dy| en 0xE341; 0xE346 = 1 si pasa de 255
	xor a			;6ebf
	or h			;6ec0
	ld a,000h		;6ec1
	jr z,L_6EC6		;6ec3
	inc a			;6ec5
L_6EC6:
	ld (0e346h),a		;6ec6
	ld h,b			;6ec9   ; dx (0xE343: signo)
	ld l,c			;6eca
	ld c,(hl)			;6ecb
	inc hl			;6ecc
	ld h,(hl)			;6ecd
	ld l,c			;6ece
	ld b,h			;6ecf
	ld c,l			;6ed0
	ld e,(ix+007h)		;6ed1   ; lee la x (horizontal)
	ld d,(ix+008h)		;6ed4   ; lee la x, byte alto
	xor a			;6ed7
	ld (0e343h),a		;6ed8
	or a			;6edb
	sbc hl,de		;6edc
	jr nc,L_6EEC		;6ede
	ld a,l			;6ee0
	cpl			;6ee1
	ld l,a			;6ee2
	ld a,h			;6ee3
	cpl			;6ee4
	ld h,a			;6ee5
	inc hl			;6ee6
	ld a,001h		;6ee7
	ld (0e343h),a		;6ee9
L_6EEC:
	ld (0e344h),hl		;6eec   ; |dx| en 0xE344
	xor a			;6eef
	or h			;6ef0
	jr z,L_6EF8		;6ef1
	ld a,001h		;6ef3
	ld (0e346h),a		;6ef5
L_6EF8:
	ld a,(0e346h)		;6ef8   ; si alguno pasa de 255, los dos a la mitad
	or a			;6efb
	jr z,L_6F12		;6efc
	ld hl,(0e341h)		;6efe
	srl h		;6f01
	rr l		;6f03
	ld (0e341h),hl		;6f05
	ld hl,(0e344h)		;6f08
	srl h		;6f0b
	rr l		;6f0d
	ld (0e344h),hl		;6f0f
L_6F12:
	ld a,(0e340h)		;6f12   ; HL = (y, x) del jugador y DE = (y, x) del destino, con los signos
	or a			;6f15
	ld a,(0e341h)		;6f16
	jr z,L_6F20		;6f19
	ld e,a			;6f1b
	ld l,000h		;6f1c
	jr L_6F23		;6f1e
L_6F20:
	ld l,a			;6f20
	ld e,000h		;6f21
L_6F23:
	ld a,(0e343h)		;6f23
	or a			;6f26
	ld a,(0e344h)		;6f27
	jr z,L_6F30		;6f2a
	ld d,a			;6f2c
	ld h,000h		;6f2d
	ret			;6f2f
L_6F30:
	ld h,a			;6f30
	ld d,000h		;6f31
	ret			;6f33
L_6F34:
	ld hl,0ed3ch		;6f34   ; la cuenta de 0xED3C (o de una vez con 0xE33C)...
	ld a,(hl)			;6f37
	or a			;6f38
	ret z			;6f39
	ld a,(0e33ch)		;6f3a
	or a			;6f3d
	jr nz,L_6F42		;6f3e
	dec (hl)			;6f40
	ret nz			;6f41
L_6F42:
	ld (hl),000h		;6f42   ; ...al acabar, IX+11 de los 9 de campo a 0
	ld hl,0e27ch		;6f44
	ld de,00010h		;6f47
	ld b,009h		;6f4a
L_6F4C:
	ld (hl),000h		;6f4c
	add hl,de			;6f4e
	djnz L_6F4C		;6f4f
	ret			;6f51
L_6F52:
	ld a,(0de02h)		;6f52   ; los mandos de campo: con el bit 5 de 0xDE02 nada
	bit 5,a		;6f55
	ret nz			;6f57
	bit 3,a		;6f58   ; con el bit 3 (los dos los lleva el ordenador), p01:7B79
	jp nz,L_7B79		;6f5a
	bit 4,a		;6f5d   ; con el bit 4 (contra el ordenador) segun 0xD6DC el equipo del jugador...
	jr z,L_6F67		;6f5f
	ld a,(0d6dch)		;6f61   ; lee el equipo del jugador en PENNANT (bit 0)
	rra			;6f64
	jr c,L_6F6F		;6f65
L_6F67:
	ld a,(0e19bh)		;6f67   ; ...el ordenador lleva la defensa en la alta...
	rra			;6f6a
	jp nc,L_7B79		;6f6b
	ret			;6f6e
L_6F6F:
	ld a,(0e19bh)		;6f6f   ; ...o en la baja
	rra			;6f72
	jp c,L_7B79		;6f73
	ret			;6f76
L_6F77:
	call L_701A		;6f77   ; el jugador IX se mueve (p01:701A, p01:720F)
	call L_720F		;6f7a
	ld h,(ix+007h)		;6f7d   ; su posicion: y en 0xE340, x en 0xE342
	ld l,(ix+008h)		;6f80   ; lee la x, byte alto
	ld d,(ix+002h)		;6f83   ; lee la y (vertical)
	ld e,(ix+003h)		;6f86   ; lee la y, byte alto
	ld (0e340h),de		;6f89   ; guarda variable de paso (cada rutina la usa a su manera) y el byte siguiente (16 bits)
	ld (0e342h),hl		;6f8d
L_6F90:
	ld a,(0eddeh)		;6f90   ; si tiene la pelota (0xE220) toca a algun corredor?
	or a			;6f93
	ret nz			;6f94
	ld a,(ix+000h)		;6f95   ; lee el numero (bits 0-3) y el estado (bits 4-7)
	and 00fh		;6f98
	ld b,a			;6f9a
	ld a,(0e220h)		;6f9b   ; lee el defensor que tiene la pelota (1-9; 0 nadie)
	cp b			;6f9e
	ret nz			;6f9f
	ld ix,0e231h		;6fa0   ; las 4 fichas de corredor de 0xE231
	ld b,004h		;6fa4
L_6FA6:
	ld a,(ix+000h)		;6fa6   ; lee el numero (bits 0-3) y el estado (bits 4-7)
	or a			;6fa9
	jr z,L_6FDC		;6faa
	ld a,(ix+002h)		;6fac   ; a menos de 8 en y (el byte bajo)...
	sub d			;6faf
	jr nc,L_6FB4		;6fb0
	neg		;6fb2
L_6FB4:
	cp 008h		;6fb4
	jr nc,L_6FDC		;6fb6
	ld a,(ix+003h)		;6fb8   ; ...y en el alto...
	sub e			;6fbb
	jr nc,L_6FC0		;6fbc
	neg		;6fbe
L_6FC0:
	cp 008h		;6fc0
	jr nc,L_6FDC		;6fc2
	ld a,(ix+007h)		;6fc4   ; ...y lo mismo con la x
	sub h			;6fc7
	jr nc,L_6FCC		;6fc8
	neg		;6fca
L_6FCC:
	cp 008h		;6fcc
	jr nc,L_6FDC		;6fce
	ld a,(ix+008h)		;6fd0   ; lee la x, byte alto
	sub l			;6fd3
	jr nc,L_6FD8		;6fd4
	neg		;6fd6
L_6FD8:
	cp 008h		;6fd8
	jr c,L_6FE8		;6fda
L_6FDC:
	ld de,00010h		;6fdc   ; el siguiente corredor
	add ix,de		;6fdf
	ld de,(0e340h)		;6fe1   ; lee variable de paso (cada rutina la usa a su manera) y el byte siguiente (16 bits)
	djnz L_6FA6		;6fe5
	ret			;6fe7
L_6FE8:
	ld a,(ix+00bh)		;6fe8   ; tocado: con el bit 6 de IX+11 (corriendo hacia atras)...
	bit 6,a		;6feb
	jr z,L_7000		;6fed
	ld a,(0ed3fh)		;6fef
	or a			;6ff2
	ret nz			;6ff3
	bit 4,(ix+00bh)		;6ff4   ; mira el bit 4 de las marcas
	ret nz			;6ff8
	set 4,(ix+00bh)		;6ff9   ; ...se marca una vez y p15:B0F5
	jp 0b0f5h		;6ffd
L_7000:
	ld (ix+000h),000h		;7000   ; el corredor queda fuera: su ficha a cero
	ld a,(ix+00bh)		;7004   ; si era el bateador (IX+11 = 1), cuenta como bateador (p01:62F7)
	ld (ix+00bh),000h		;7007   ; las marcas = 0x00
	and 007h		;700b
	dec a			;700d
	call z,L_62F7		;700e
	ld hl,07e69h		;7011   ; el texto de p13:7E69 y p15:B11F
	call 04ea6h		;7014   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	jp 0b11fh		;7017
L_701A:
	ld a,(ix+000h)		;701a   ; el jugador corre: el receptor (2)...
	and 00fh		;701d
	cp 002h		;701f
	jr nz,L_7036		;7021
	ld a,(0ed0eh)		;7023   ; ...cada 8 cuadros (0xED0E) cambia de dibujo de 64 bytes...
	and 007h		;7026
	jr nz,L_7045		;7028
	ld hl,0ed3bh		;702a
	ld a,001h		;702d
	xor (hl)			;702f
	ld (hl),a			;7030
	call 05716h		;7031
	jr L_7045		;7034
L_7036:
	ld a,(0ed0eh)		;7036   ; ...los demas cambian el bit 3 de su dibujo: las piernas
	and 007h		;7039
	jr nz,L_7045		;703b
	ld a,008h		;703d
	xor (ix+00ch)		;703f   ; XOR con el dibujo de su sprite
	ld (ix+00ch),a		;7042   ; guarda el dibujo de su sprite
L_7045:
	ld e,(ix+004h)		;7045   ; la y (vertical): si tiene velocidad (IX+4/5)...
	ld d,(ix+005h)		;7048   ; lee la velocidad y, byte alto
	ld a,d			;704b
	or e			;704c
	jr z,L_708B		;704d
	call L_71BB		;704f   ; ...avanza (p01:71BB)
	ld (ix+001h),l		;7052   ; guarda la y, fraccion
	ld (ix+002h),h		;7055   ; guarda la y (vertical)
	ld a,(ix+00dh)		;7058   ; la base de destino (IX+13 / 16 - 2)...
	rra			;705b
	rra			;705c
	rra			;705d
	rra			;705e
	sub 002h		;705f
	and 00fh		;7061
	ld de,07207h		;7063   ; ...si esta en su zona de la tabla 0x7207...
	call 0421bh		;7066   ; de_mas_a: DE = DE + A
	ld a,(de)			;7069
	cp (ix+003h)		;706a   ; compara con la y, byte alto
	jr nz,L_708B		;706d
	ld a,(ix+00eh)		;706f   ; ...y a menos de 4 de su y...
	sub h			;7072
	jr nc,L_7077		;7073
	neg		;7075
L_7077:
	cp 004h		;7077
	jr nc,L_708B		;7079
	ld a,(ix+00eh)		;707b   ; ...llega: la y de destino y la velocidad y a cero
	ld (ix+002h),a		;707e   ; guarda la y (vertical)
	xor a			;7081
	ld (ix+001h),a		;7082   ; guarda la y, fraccion
	ld (ix+004h),a		;7085   ; guarda la velocidad y, byte bajo
	ld (ix+005h),a		;7088   ; guarda la velocidad y, byte alto
L_708B:
	ld e,(ix+009h)		;708b   ; lo mismo con la x (p01:71DF, tabla 0x720B)
	ld d,(ix+00ah)		;708e   ; lee la velocidad x, byte alto
	ld a,d			;7091
	or e			;7092
	jr z,L_70BF		;7093
	call L_71DF		;7095
	ld (ix+006h),l		;7098   ; guarda la x, fraccion
	ld (ix+007h),h		;709b   ; guarda la x (horizontal)
	ld a,(ix+00dh)		;709e   ; lee la base de destino (nibble alto; 2 abajo: llegado)
	rra			;70a1
	rra			;70a2
	rra			;70a3
	rra			;70a4
	sub 002h		;70a5
	and 00fh		;70a7
	ld de,0720bh		;70a9
	call 0421bh		;70ac   ; de_mas_a: DE = DE + A
	ld a,(de)			;70af
	cp (ix+008h)		;70b0   ; compara con la x, byte alto
	ret nz			;70b3
	ld a,(ix+00fh)		;70b4   ; lee la x de destino
	sub h			;70b7
	jr nc,L_70BC		;70b8
	neg		;70ba
L_70BC:
	cp 004h		;70bc
	ret nc			;70be
L_70BF:
	ld a,(ix+00fh)		;70bf   ; llegado en x: la x de destino y la velocidad x a cero
	ld (ix+007h),a		;70c2   ; guarda la x (horizontal)
	xor a			;70c5
	ld (ix+009h),a		;70c6   ; guarda la velocidad x, byte bajo
	ld (ix+00ah),a		;70c9   ; guarda la velocidad x, byte alto
	ld a,(ix+004h)		;70cc   ; si aun se mueve en y, nada mas
	or (ix+005h)		;70cf   ; OR con la velocidad y, byte alto
	ret nz			;70d2
	ld a,(ix+000h)		;70d3   ; ha llegado: si estaba lanzando (estado 3)...
	and 0f0h		;70d6
	cp 030h		;70d8
	jr z,L_711B		;70da
	ld a,(ix+000h)		;70dc   ; ...el receptor, dibujo 0x0D de 64 bytes...
	and 00fh		;70df
	cp 002h		;70e1
	jr z,L_70EB		;70e3
	ld (ix+00ch),068h		;70e5   ; ...los demas, 0x68
	jr L_70F7		;70e9
L_70EB:
	xor a			;70eb
	ld (0ed3ah),a		;70ec
	ld a,00dh		;70ef
	ld (0ed3bh),a		;70f1
	call 05716h		;70f4
L_70F7:
	ld a,(ix+00dh)		;70f7   ; en la base: IX+13 = la base | 2
	and 0f0h		;70fa
	or 002h		;70fc
	ld (ix+00dh),a		;70fe   ; guarda la base de destino (nibble alto; 2 abajo: llegado)
	ld a,(ix+00ch)		;7101   ; si el dibujo es 0 o 1, nada; si no, estado 2 (con destino) o 0
	cp 002h		;7104
	ret c			;7106
	ld a,(ix+00dh)		;7107   ; lee la base de destino (nibble alto; 2 abajo: llegado)
	or a			;710a
	ld c,020h		;710b
	jr nz,L_7111		;710d
	ld c,000h		;710f
L_7111:
	ld a,(ix+000h)		;7111   ; lee el numero (bits 0-3) y el estado (bits 4-7)
	and 00fh		;7114
	or c			;7116
	ld (ix+000h),a		;7117   ; guarda el numero (bits 0-3) y el estado (bits 4-7)
	ret			;711a
L_711B:
	ld a,(ix+00dh)		;711b   ; llegaba lanzando: p15:AF50, p15:AED0 y p15:B0B7
	and 0f0h		;711e
	or 002h		;7120
	ld (ix+00dh),a		;7122   ; guarda la base de destino (nibble alto; 2 abajo: llegado)
	call 0af50h		;7125
	call 0aed0h		;7128
	call 0b0b7h		;712b
L_712E:
	ld a,(0edcfh)		;712e   ; 0xEDCF con 3 en el nibble alto se borra
	and 0f0h		;7131
	cp 030h		;7133
	jr nz,L_713B		;7135
	xor a			;7137
	ld (0edcfh),a		;7138
L_713B:
	ld a,(0edc3h)		;713b   ; sin nadie en 0xEDC3: estado 2
	or a			;713e
	jr nz,L_714C		;713f
	ld a,(ix+000h)		;7141   ; lee el numero (bits 0-3) y el estado (bits 4-7)
	and 00fh		;7144
	or 020h		;7146
	ld (ix+000h),a		;7148   ; guarda el numero (bits 0-3) y el estado (bits 4-7)
	ret			;714b
L_714C:
	ld (ix+00dh),a		;714c   ; con alguien: la base de 0xEDC3 a IX+13...
	and 0f0h		;714f
	or 001h		;7151
	ld (ix+00dh),a		;7153   ; guarda la base de destino (nibble alto; 2 abajo: llegado)
	rra			;7156
	rra			;7157
	rra			;7158
	rra			;7159
	dec a			;715a
	dec a			;715b
	and 00fh		;715c
	ld hl,07203h		;715e   ; ...la direccion de esa base (0x7203)...
	call 04216h		;7161   ; hl_mas_a: HL = HL + A
	ld b,(hl)			;7164
	push ix		;7165   ; ...el destino (p01:6E7C)...
	pop hl			;7167
	inc hl			;7168
	inc hl			;7169
	call L_6E7C		;716a
	ld a,018h		;716d   ; ...con la fuerza 0x18 (p00:5E9F)...
	call 05e9fh		;716f
	ld (ix+004h),l		;7172   ; ...la velocidad a IX+4/5 y IX+9/10...
	ld (ix+005h),h		;7175   ; guarda la velocidad y, byte alto
	ld (ix+009h),e		;7178   ; guarda la velocidad x, byte bajo
	ld (ix+00ah),d		;717b   ; guarda la velocidad x, byte alto
	ld hl,(0e35ah)		;717e   ; ...y el punto a IX+14/15
	ld d,(hl)			;7181
	dec hl			;7182
	dec hl			;7183
	ld e,(hl)			;7184
	ld (ix+00eh),e		;7185   ; guarda la y de destino
	ld (ix+00fh),d		;7188   ; guarda la x de destino
	ld a,(ix+000h)		;718b   ; el receptor: el dibujo 2 de 64 bytes
	and 00fh		;718e
	cp 002h		;7190
	jr nz,L_719E		;7192
	ld a,002h		;7194
	ld (0ed3bh),a		;7196
	call 05716h		;7199
	jr L_71AD		;719c
L_719E:
	ld h,(ix+005h)		;719e   ; los demas: segun la direccion
	ld l,(ix+004h)		;71a1   ; lee la velocidad y, byte bajo
	ld d,(ix+00ah)		;71a4   ; lee la velocidad x, byte alto
	ld e,(ix+009h)		;71a7   ; lee la velocidad x, byte bajo
	call L_6C68		;71aa
L_71AD:
	ld a,(ix+000h)		;71ad   ; estado 4: corriendo a la base
	and 00fh		;71b0
	or 040h		;71b2
	ld (ix+000h),a		;71b4   ; guarda el numero (bits 0-3) y el estado (bits 4-7)
	ld (0edc4h),a		;71b7
	ret			;71ba
L_71BB:
	ld l,(ix+001h)		;71bb   ; la y (vertical) en 24 bits: IX+1/2 mas la velocidad DE, IX+3 el alto...
	ld h,(ix+002h)		;71be   ; lee la y (vertical)
	ld a,d			;71c1
	rla			;71c2
	jr c,L_71D2		;71c3
	add hl,de			;71c5   ; ...hacia abajo: si pasa de 0xFFFF sube IX+3 (sin pasar de 1)...
	ret nc			;71c6
	ld a,(ix+003h)		;71c7   ; lee la y, byte alto
	dec a			;71ca
	ret z			;71cb
	inc (ix+003h)		;71cc   ; sube la y, byte alto
	ld l,000h		;71cf
	ret			;71d1
L_71D2:
	add hl,de			;71d2   ; ...hacia arriba: si baja de 0 baja IX+3 (sin bajar de 0)
	ret c			;71d3
	ld a,(ix+003h)		;71d4   ; lee la y, byte alto
	or a			;71d7
	ret z			;71d8
	dec (ix+003h)		;71d9   ; baja la y, byte alto
	ld l,000h		;71dc
	ret			;71de
L_71DF:
	ld l,(ix+006h)		;71df   ; la x igual: IX+6/7 mas DE, con IX+8 de alto
	ld h,(ix+007h)		;71e2   ; lee la x (horizontal)
	ld a,d			;71e5
	rla			;71e6
	jr c,L_71F6		;71e7
	add hl,de			;71e9
	ret nc			;71ea
	ld a,(ix+008h)		;71eb   ; lee la x, byte alto
	dec a			;71ee
	ret z			;71ef
	inc (ix+008h)		;71f0   ; sube la x, byte alto
	ld l,000h		;71f3
	ret			;71f5
L_71F6:
	add hl,de			;71f6
	ret c			;71f7
	ld a,(ix+008h)		;71f8   ; lee la x, byte alto
	or a			;71fb
	ret z			;71fc
	dec (ix+008h)		;71fd   ; baja la x, byte alto
	ld l,000h		;7200
	ret			;7202

; ----------------------------------------------------------------------
; DATOS resto_7203: lo apuntan con el banco puesto p01:715E (0x7203), p01:7063
;   (0x7207), p01:70A9 (0x720B); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p01:715E, p01:7063, p01:70A9 (12 bytes)
;   0x7203..0x720f  (12 bytes)
DATA_resto_7203:
	defb 008h,001h,004h,002h,001h,000h,001h,001h,001h,001h,000h,001h	; 7203  ............

; ======================================================================
; CODIGO 0x720f..0x7429  (538 bytes)
; ======================================================================


L_720F:
	ld a,(ix+00dh)		;720f   ; el jugador ya en la zona de su destino? (salvo si ya llego, IX+13 = 2)
	and 00fh		;7212
	cp 002h		;7214
	ret z			;7216
	ld a,(ix+003h)		;7217   ; lee la y, byte alto
	or a			;721a
	ret z			;721b
	ld h,(ix+002h)		;721c   ; y de destino - 2 <= y...
	ld a,(ix+00eh)		;721f   ; lee la y de destino
	sub 002h		;7222
	cp h			;7224
	ret nc			;7225
	add a,004h		;7226   ; ...y y <= destino + 2...
	cp h			;7228
	ret c			;7229
	ld h,(ix+007h)		;722a   ; ...x - 6 <= x...
	ld a,(ix+00fh)		;722d   ; lee la x de destino
	sub 006h		;7230
	jr nc,L_7235		;7232
	xor a			;7234
L_7235:
	cp h			;7235
	ret nc			;7236
	add a,00ch		;7237   ; ...x <= destino + 6 (sin pasar de 255)
	jr nc,L_723D		;7239
	ld a,0ffh		;723b
L_723D:
	cp h			;723d
	ret c			;723e
	ld a,(ix+00dh)		;723f   ; llegado: IX+13 con el 2 abajo
	and 0f0h		;7242
	or 002h		;7244
	ld (ix+00dh),a		;7246   ; guarda la base de destino (nibble alto; 2 abajo: llegado)
	ret			;7249
L_724A:
	ld a,(0e19fh)		;724a   ; el jugador lo mueve el mando (0xE19F): sin direccion, nada
	and 00fh		;724d
	ret z			;724f
	ld b,a			;7250
	ld hl,00000h		;7251   ; la velocidad y: arriba -0x90, abajo +0x90...
	rra			;7254
	jr nc,L_725A		;7255
	ld hl,0ff70h		;7257
L_725A:
	rra			;725a
	jr nc,L_7261		;725b
	ld de,00090h		;725d
	add hl,de			;7260
L_7261:
	ld (0ece1h),hl		;7261   ; ...en 0xECE1
	rra			;7264   ; la x: izquierda -0xC0, derecha +0xC0, en 0xECE3
	ld hl,00000h		;7265
	jr nc,L_726D		;7268
	ld hl,0ff40h		;726a
L_726D:
	rra			;726d
	jr nc,L_7274		;726e
	ld de,000c0h		;7270
	add hl,de			;7273
L_7274:
	ld (0ece3h),hl		;7274
	ld a,(ix+000h)		;7277   ; el receptor (2) va aparte
	and 00fh		;727a
	cp 002h		;727c
	jr z,L_72AC		;727e
	ld c,000h		;7280   ; el dibujo segun la direccion: 0x00, 0x10, 0x20 o 0x30...
	rr b		;7282
	jr c,L_7294		;7284
	ld c,010h		;7286
	rr b		;7288
	jr c,L_7294		;728a
	ld c,020h		;728c
	rr b		;728e
	jr c,L_7294		;7290
	ld c,030h		;7292
L_7294:
	ld a,(ix+00ch)		;7294   ; ...0x40 si estaba agachado...
	and 0f0h		;7297
	cp 040h		;7299
	jr nz,L_72A1		;729b
	ld c,040h		;729d
	jr L_72A7		;729f
L_72A1:
	ld a,(0ed0eh)		;72a1   ; ...con el bit 3 que cambia cada 8 cuadros (las piernas)
	and 008h		;72a4
	or c			;72a6
L_72A7:
	ld (ix+00ch),a		;72a7   ; guarda el dibujo de su sprite
	jr L_72CB		;72aa
L_72AC:
	ld a,b			;72ac   ; el receptor: el dibujo de 64 bytes 0-7 segun la direccion y el paso
	ld b,000h		;72ad
	rra			;72af
	jr c,L_72BB		;72b0
	inc b			;72b2
	rra			;72b3
	jr c,L_72BB		;72b4
	inc b			;72b6
	rra			;72b7
	jr c,L_72BB		;72b8
	inc b			;72ba
L_72BB:
	ld a,b			;72bb
	sla a		;72bc
	ld b,a			;72be
	ld a,(0ed0eh)		;72bf   ; lee el contador de cuadros de la jugada (las piernas de los sprites)
	rra			;72c2
	rra			;72c3
	rra			;72c4
	and 001h		;72c5
	add a,b			;72c7
	call 05716h		;72c8
L_72CB:
	ld de,(0ece1h)		;72cb   ; mueve la y: guarda la de antes en 0xE1D1-0xE1D3...
	ld a,e			;72cf
	or d			;72d0
	jr z,L_72F1		;72d1
	ld a,(ix+001h)		;72d3   ; lee la y, fraccion
	ld (0e1d1h),a		;72d6   ; guarda la marca de acabado de los pasos; en el lanzamiento, su paso (p03:A525)
	ld l,a			;72d9
	ld a,(ix+003h)		;72da   ; lee la y, byte alto
	ld (0e1d3h),a		;72dd
	ld a,(ix+002h)		;72e0   ; lee la y (vertical)
	ld (0e1d2h),a		;72e3
	ld h,a			;72e6   ; ...suma la velocidad y ajusta el alto (p01:74A1)
	add hl,de			;72e7
	ld (ix+001h),l		;72e8   ; guarda la y, fraccion
	ld (ix+002h),h		;72eb   ; guarda la y (vertical)
	call L_74A1		;72ee
L_72F1:
	ld de,(0ece3h)		;72f1   ; mueve la x: guarda la de antes en 0xE1D4-0xE1D6...
	ld a,e			;72f5
	or d			;72f6
	jr z,L_731B		;72f7
	ld a,(ix+006h)		;72f9   ; lee la x, fraccion
	ld l,a			;72fc
	ld (0e1d4h),a		;72fd
	ld a,(ix+008h)		;7300   ; lee la x, byte alto
	ld (0e1d6h),a		;7303
	ld a,(ix+007h)		;7306   ; lee la x (horizontal)
	ld (0e1d5h),a		;7309
	ld h,a			;730c
	ld de,(0ece3h)		;730d   ; ...suma la velocidad y ajusta el alto (p01:74C4)
	add hl,de			;7311
	ld (ix+006h),l		;7312   ; guarda la x, fraccion
	ld (ix+007h),h		;7315   ; guarda la x (horizontal)
	call L_74C4		;7318
L_731B:
	ld l,(ix+002h)		;731b   ; el punto de los pies (y + 12, x + 8)...
	ld h,(ix+003h)		;731e   ; lee la y, byte alto
	ld a,00ch		;7321
	call 04216h		;7323   ; hl_mas_a: HL = HL + A
	push hl			;7326
	ld de,0fee8h		;7327   ; ...segun este a un lado u otro de 0x118...
	add hl,de			;732a
	ld e,(ix+007h)		;732b   ; lee la x (horizontal)
	ld d,(ix+008h)		;732e   ; lee la x, byte alto
	ld a,008h		;7331
	call 0421bh		;7333   ; de_mas_a: DE = DE + A
	rl h		;7336
	pop hl			;7338
	jr c,L_7342		;7339
	call 05cf6h		;733b   ; ...el borde del campo de un lado (p14:9557)...
	jr nc,L_7347		;733e
	jr L_7375		;7340
L_7342:
	call 05cffh		;7342   ; ...o del otro (p14:95BB)
	jr nc,L_7375		;7345
L_7347:
	ld de,(0ece1h)		;7347   ; se sale: vuelve a la y de antes...
	ld a,e			;734b
	or d			;734c
	jr z,L_735E		;734d
	ld a,(0e1d1h)		;734f   ; lee la marca de acabado de los pasos; en el lanzamiento, su paso (p03:A525)
	ld (ix+001h),a		;7352   ; guarda la y, fraccion
	ld hl,(0e1d2h)		;7355
	ld (ix+002h),l		;7358   ; guarda la y (vertical)
	ld (ix+003h),h		;735b   ; guarda la y, byte alto
L_735E:
	ld de,(0ece3h)		;735e   ; ...y a la x de antes
	ld a,e			;7362
	or d			;7363
	jr z,L_7375		;7364
	ld a,(0e1d4h)		;7366
	ld (ix+006h),a		;7369   ; guarda la x, fraccion
	ld hl,(0e1d5h)		;736c
	ld (ix+007h),l		;736f   ; guarda la x (horizontal)
	ld (ix+008h),h		;7372   ; guarda la x, byte alto
L_7375:
	ret			;7375
L_7376:
	call L_720F		;7376   ; corre al destino: si ya esta en su zona, llega
	ld a,(ix+000h)		;7379   ; lee el numero (bits 0-3) y el estado (bits 4-7)
	and 00fh		;737c
	cp 002h		;737e
	jr nz,L_7394		;7380
	ld a,(0ed0eh)		;7382   ; el receptor cambia de dibujo cada 8 cuadros
	and 007h		;7385
	jr nz,L_7394		;7387
	ld a,(0ed3bh)		;7389
	xor 001h		;738c
	ld (0ed3bh),a		;738e
	call 05716h		;7391
L_7394:
	call L_743F		;7394   ; avanza en x (p01:743F) y en y (p01:7472)
	call L_7472		;7397
	ld a,b			;739a   ; llegado en las dos (B | C = 3)...
	or c			;739b
	cp 003h		;739c
	jr c,L_73DA		;739e
	ld a,(ix+00dh)		;73a0   ; ...IX+13 con 2, el punto exacto del destino...
	and 0f0h		;73a3
	or 002h		;73a5
	ld (ix+00dh),a		;73a7   ; guarda la base de destino (nibble alto; 2 abajo: llegado)
	ld a,(ix+00eh)		;73aa   ; lee la y de destino
	ld (ix+002h),a		;73ad   ; guarda la y (vertical)
	ld (ix+001h),000h		;73b0   ; la y, fraccion = 0x00
	ld a,(ix+00fh)		;73b4   ; lee la x de destino
	ld (ix+007h),a		;73b7   ; guarda la x (horizontal)
	ld (ix+006h),000h		;73ba   ; la x, fraccion = 0x00
	ld a,(ix+000h)		;73be   ; ...y el estado siguiente
	ld c,a			;73c1
	add a,010h		;73c2
	ld (ix+000h),a		;73c4   ; guarda el numero (bits 0-3) y el estado (bits 4-7)
	ld a,c			;73c7
	and 00fh		;73c8
	cp 002h		;73ca
	jr nz,L_73D6		;73cc
	ld a,00dh		;73ce   ; el receptor, el dibujo 0x0D de 64 bytes
	ld (0ed3bh),a		;73d0
	jp 05716h		;73d3
L_73D6:
	ld a,068h		;73d6   ; los demas, el 0x68
	jr L_7425		;73d8
L_73DA:
	ld a,(ix+00ch)		;73da   ; aun corriendo (salvo el dibujo 0xF8): el dibujo segun la velocidad
	cp 0f8h		;73dd
	ret z			;73df
	ld e,(ix+004h)		;73e0   ; lee la velocidad y, byte bajo
	ld d,(ix+005h)		;73e3   ; lee la velocidad y, byte alto
	ld l,(ix+009h)		;73e6   ; lee la velocidad x, byte bajo
	ld h,(ix+00ah)		;73e9   ; lee la velocidad x, byte alto
	ld c,000h		;73ec   ; C = 1 si va hacia abajo; |vy|...
	ld a,d			;73ee
	rla			;73ef
	jr c,L_73F6		;73f0
	ld c,001h		;73f2
	jr L_73FD		;73f4
L_73F6:
	ld a,d			;73f6
	cpl			;73f7
	ld d,a			;73f8
	ld a,e			;73f9
	cpl			;73fa
	ld e,a			;73fb
	inc de			;73fc
L_73FD:
	ld b,000h		;73fd   ; ...B = 2 si va a la derecha; |vx|...
	ld a,h			;73ff
	rla			;7400
	jr c,L_7407		;7401
	ld b,002h		;7403
	jr L_740E		;7405
L_7407:
	ld a,h			;7407
	cpl			;7408
	ld h,a			;7409
	ld a,l			;740a
	cpl			;740b
	ld l,a			;740c
	inc hl			;740d
L_740E:
	ld a,b			;740e   ; ...+4 si |vx| > |vy|
	or c			;740f
	ld b,a			;7410
	sbc hl,de		;7411
	rl h		;7413
	jr c,L_7419		;7415
	add a,004h		;7417
L_7419:
	ld hl,07437h		;7419   ; la fila de 0x7437 con el paso de las piernas (bit 3 de 0xED0E)
	call 04216h		;741c   ; hl_mas_a: HL = HL + A
	ld a,(0ed0eh)		;741f   ; lee el contador de cuadros de la jugada (las piernas de los sprites)
	and 008h		;7422
	or (hl)			;7424
L_7425:
	ld (ix+00ch),a		;7425   ; guarda el dibujo de su sprite
	ret			;7428

; ----------------------------------------------------------------------
; DATOS resto_7429: lo apuntan con el banco puesto p01:7419 (0x7437); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p01:7419 (22 bytes)
;   0x7429..0x743f  (22 bytes)
DATA_resto_7429:
	defb 021h,035h,0edh,07eh,0b7h,0c8h,035h,0c0h,02ah,033h,0edh,036h,068h,0c9h,000h,010h	; 7429  !5.~..5.*3.6h...
	defb 000h,010h,020h,020h,030h,030h	; 7439

; ======================================================================
; CODIGO 0x743f..0x74f0  (177 bytes)
; ======================================================================


L_743F:
	ld c,001h		;743f
	ld e,(ix+004h)		;7441   ; lee la velocidad y, byte bajo
	ld d,(ix+005h)		;7444   ; lee la velocidad y, byte alto
	ld (0e340h),de		;7447   ; guarda variable de paso (cada rutina la usa a su manera) y el byte siguiente (16 bits)
	ld a,d			;744b
	or e			;744c
	ret z			;744d
	ld l,(ix+001h)		;744e   ; lee la y, fraccion
	ld h,(ix+002h)		;7451   ; lee la y (vertical)
	ld a,h			;7454
	add hl,de			;7455
	ld (ix+001h),l		;7456   ; guarda la y, fraccion
	ld (ix+002h),h		;7459   ; guarda la y (vertical)
	call L_74A1		;745c
	ld c,000h		;745f
	ld a,(ix+002h)		;7461   ; lee la y (vertical)
	cp (ix+00eh)		;7464   ; compara con la y de destino
	ret nz			;7467
	ld c,001h		;7468
	xor a			;746a
	ld (ix+004h),a		;746b   ; guarda la velocidad y, byte bajo
	ld (ix+005h),a		;746e   ; guarda la velocidad y, byte alto
	ret			;7471
L_7472:
	ld b,002h		;7472
	ld e,(ix+009h)		;7474   ; lee la velocidad x, byte bajo
	ld d,(ix+00ah)		;7477   ; lee la velocidad x, byte alto
	ld a,d			;747a
	or e			;747b
	ret z			;747c
	ld l,(ix+006h)		;747d   ; lee la x, fraccion
	ld h,(ix+007h)		;7480   ; lee la x (horizontal)
	ld a,h			;7483
	add hl,de			;7484
	ld (ix+006h),l		;7485   ; guarda la x, fraccion
	ld (ix+007h),h		;7488   ; guarda la x (horizontal)
	call L_74C4		;748b
	ld b,000h		;748e
	ld a,(ix+007h)		;7490   ; lee la x (horizontal)
	cp (ix+00fh)		;7493   ; compara con la x de destino
	ret nz			;7496
	ld b,002h		;7497
	xor a			;7499
	ld (ix+009h),a		;749a   ; guarda la velocidad x, byte bajo
	ld (ix+00ah),a		;749d   ; guarda la velocidad x, byte alto
	ret			;74a0
L_74A1:
	or a			;74a1
	jr z,L_74B1		;74a2
	inc a			;74a4
	ret nz			;74a5
	rl d		;74a6
	ret c			;74a8
	ld a,001h		;74a9
	ld (ix+002h),000h		;74ab   ; la y (vertical) = 0x00
	jr L_74BA		;74af
L_74B1:
	rl d		;74b1
	ret nc			;74b3
	ld a,0ffh		;74b4
	ld (ix+002h),0ffh		;74b6   ; la y (vertical) = 0xFF
L_74BA:
	add a,(ix+003h)		;74ba   ; le suma la y, byte alto
	cp 002h		;74bd
	ret nc			;74bf
	ld (ix+003h),a		;74c0   ; guarda la y, byte alto
	ret			;74c3
L_74C4:
	or a			;74c4
	jr z,L_74D4		;74c5
	inc a			;74c7
	ret nz			;74c8
	rl d		;74c9
	ret c			;74cb
	ld a,001h		;74cc
	ld (ix+007h),000h		;74ce   ; la x (horizontal) = 0x00
	jr L_74DC		;74d2
L_74D4:
	rl d		;74d4
	ret nc			;74d6
	ld a,0ffh		;74d7
	ld (ix+007h),a		;74d9   ; guarda la x (horizontal)
L_74DC:
	ld (ix+006h),000h		;74dc   ; la x, fraccion = 0x00
	add a,(ix+008h)		;74e0   ; le suma la x, byte alto
	ld (ix+008h),a		;74e3   ; guarda la x, byte alto
	ret			;74e6
L_74E7:
	ld a,(0e1a6h)		;74e7
	ld hl,074f0h		;74ea
	jp 0556dh		;74ed   ; palabra_a: HL = la palabra A de la tabla HL

; ----------------------------------------------------------------------
; DATOS resto_74F0: lo apuntan con el banco puesto p01:74EA (0x74F0); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p01:74EA (6 bytes)
;   0x74f0..0x74f6  (6 bytes)
DATA_resto_74F0:
	defb 000h,000h,0c0h,000h,080h,001h	; 74f0

; ======================================================================
; CODIGO 0x74f6..0x75de  (232 bytes)
; ======================================================================


L_74F6:
	ld a,0ffh		;74f6
	ld (0e1ceh),a		;74f8
	ld b,004h		;74fb
	ld ix,0e231h		;74fd   ; apunta a las 4 fichas de 16 bytes de los corredores (0xE23C = su estado)
	call L_7513		;7501
	ld b,008h		;7504
	ld ix,0e281h		;7506
	call L_7513		;750a
	ld b,001h		;750d
	ld ix,0e271h		;750f   ; apunta a las 9 fichas de 16 bytes de los defensores
L_7513:
	call L_74E7		;7513
	push hl			;7516
	ld hl,(0e1a2h)		;7517   ; lee el desplazamiento de la pantalla, 16 bits (en TEAM EDIT, la fila elegida)
	ld de,0fff0h		;751a
	add hl,de			;751d
	ex de,hl			;751e
	pop hl			;751f
L_7520:
	push bc			;7520
	ld c,l			;7521
	ld b,h			;7522
	ld a,(ix+000h)		;7523   ; lee el numero (bits 0-3) y el estado (bits 4-7)
	or a			;7526
	jr z,L_7554		;7527
	ld l,(ix+002h)		;7529   ; lee la y (vertical)
	ld h,(ix+003h)		;752c   ; lee la y, byte alto
	or a			;752f
	sbc hl,de		;7530
	ld a,h			;7532
	rla			;7533
	jr c,L_7554		;7534
	ld a,h			;7536
	or a			;7537
	jr nz,L_7554		;7538
	ld a,l			;753a
	cp 0d4h		;753b
	jr nc,L_7554		;753d
	ld l,(ix+007h)		;753f   ; lee la x (horizontal)
	ld h,(ix+008h)		;7542   ; lee la x, byte alto
	or a			;7545
	push hl			;7546
	sbc hl,bc		;7547
	ld a,h			;7549
	rla			;754a
	pop hl			;754b
	jr c,L_7554		;754c
	or a			;754e
	jr nz,L_7554		;754f
	call L_7561		;7551
L_7554:
	ex de,hl			;7554
	ld de,00010h		;7555
	add ix,de		;7558
	ex de,hl			;755a
	ld l,c			;755b
	ld h,b			;755c
	pop bc			;755d
	djnz L_7520		;755e
	ret			;7560
L_7561:
	ld a,(0ed04h)		;7561   ; lee cuantos sprites rotan (9 o 10)
	ld h,a			;7564
	ld a,(0e1ceh)		;7565
	inc a			;7568
	cp h			;7569
	ret nc			;756a
	push de			;756b
	push bc			;756c
	ld (0e1ceh),a		;756d
	rlca			;7570
	rlca			;7571
	rlca			;7572
	ld e,a			;7573
	ld d,000h		;7574
	ld hl,0e110h		;7576
	add hl,de			;7579
	ld d,h			;757a
	ld e,l			;757b
	inc de			;757c
	inc de			;757d
	inc de			;757e
	inc de			;757f
	ld a,(ix+002h)		;7580   ; lee la y (vertical)
	cp 0d8h		;7583
	jr nz,L_7588		;7585
	dec a			;7587
L_7588:
	ld (hl),a			;7588
	inc hl			;7589
	ld (de),a			;758a
	inc de			;758b
	ld a,(ix+007h)		;758c   ; lee la x (horizontal)
	sub c			;758f
	ld (hl),a			;7590
	inc hl			;7591
	ld (de),a			;7592
	inc de			;7593
	ld a,(ix+00ch)		;7594   ; lee el dibujo de su sprite
	ld (hl),a			;7597
	inc hl			;7598
	add a,004h		;7599
	ld (de),a			;759b
	inc de			;759c
	ld (hl),007h		;759d
	inc hl			;759f
	ld a,(0edd0h)		;75a0
	or a			;75a3
	ld a,(0e19bh)		;75a4   ; lee la media entrada (bit 0: 0 la alta, 1 la baja; 0x11 = la baja de la 9.a)
	ld l,(ix+00ch)		;75a7   ; lee el dibujo de su sprite
	jr z,L_75B1		;75aa
	rra			;75ac
	jr nc,L_75C3		;75ad
	jr L_75B4		;75af
L_75B1:
	rra			;75b1
	jr c,L_75C3		;75b2
L_75B4:
	ld a,l			;75b4
	cp 070h		;75b5
	ld h,018h		;75b7
	jr c,L_75D0		;75b9
	cp 0f8h		;75bb
	jr z,L_75D0		;75bd
	ld h,01bh		;75bf
	jr L_75D0		;75c1
L_75C3:
	ld a,l			;75c3
	ld h,01bh		;75c4
	cp 070h		;75c6
	jr c,L_75D0		;75c8
	cp 0f8h		;75ca
	jr z,L_75D0		;75cc
	ld h,018h		;75ce
L_75D0:
	ld a,h			;75d0
	ld (de),a			;75d1
	pop hl			;75d2
	pop de			;75d3
	ret			;75d4
L_75D5:
	call L_767D		;75d5   ; el lanzador del ordenador: lo de p01:767D y el paso de 0xED3E
	ld a,(0ed3eh)		;75d8   ; lee el paso del lanzador del ordenador
	call 04220h		;75db   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_75DE: 5 destinos del despachador p00:4220 (call en p01:75DB, el
;   indice en A): 75E8, 75FD, 762C, 7641, 7651; lo leen p01:75DB (10 bytes)
;   0x75de..0x75e8  (10 bytes)
DATA_tabla_75DE:
	defw 075e8h,075fdh,0762ch,07641h,07651h	; 75de

; ======================================================================
; CODIGO 0x75e8..0x7766  (382 bytes)
; ======================================================================


L_75E8:
	xor a			;75e8   ; paso 0: 0xE1E8 y 0xE1EC a cero y una espera al azar (0x70-0x7F) en 0xE1E5
	ld (0e1e8h),a		;75e9
	ld (0e1ech),a		;75ec
	ld a,r		;75ef
	and 00fh		;75f1
	add a,070h		;75f3
	ld (0e1e5h),a		;75f5
L_75F8:
	ld hl,0ed3eh		;75f8   ; al paso siguiente
	inc (hl)			;75fb
	ret			;75fc
L_75FD:
	xor a			;75fd   ; paso 1: sin mando, y otra espera al azar (0x30-0x4F) en 0xE1E3
	ld (0e19fh),a		;75fe   ; guarda el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	ld a,r		;7601
	and 01fh		;7603
	add a,030h		;7605
	ld (0e1e3h),a		;7607
	ld a,(0de03h)		;760a   ; cada dos cuadros: si 0xE1E1 cambia...
	and 001h		;760d
	ret z			;760f
	ld hl,0e1ech		;7610
	ld de,0e1e1h		;7613
	ld a,(de)			;7616
	cp (hl)			;7617
	jr z,L_75F8		;7618
	ld (hl),a			;761a
	ld a,(0e1e5h)		;761b   ; ...y aun no llega a 0xE1E5...
	ld b,a			;761e
	ld a,(de)			;761f
	cp b			;7620
	jr z,L_75F8		;7621
	ld hl,0e19fh		;7623   ; ...se mueve a un lado: 8 (derecha) o 4 (izquierda)
	ld (hl),008h		;7626
	ret c			;7628
	ld (hl),004h		;7629
	ret			;762b
L_762C:
	ld hl,0e1e3h		;762c   ; paso 2: la espera de 0xE1E3; al acabar elige el lanzamiento...
	dec (hl)			;762f
	ret nz			;7630
	call L_76B1		;7631
	call L_770B		;7634
	ld a,(0e19fh)		;7637   ; ...y lanza (bit 4 del mando)
	or 010h		;763a
	ld (0e19fh),a		;763c   ; guarda el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	jr L_75F8		;763f
L_7641:
	ld hl,0e1d3h		;7641   ; paso 3: si 0xE1D2 = 1 y 0xE1D3 = 2...
	ld a,(hl)			;7644
	dec a			;7645
	dec a			;7646
	ret nz			;7647
	dec hl			;7648
	ld a,(hl)			;7649
	dec a			;764a
	ret nz			;764b
	call L_76EB		;764c   ; ...el efecto (p01:76EB)
	jr L_75F8		;764f
L_7651:
	ld a,(0e1d9h)		;7651   ; paso 4: con 0xE1D9 entre 0x6B y 0x85, la espera...
	cp 06bh		;7654
	jr c,L_7674		;7656
	cp 086h		;7658
	jr nc,L_7674		;765a
L_765C:
	ld hl,0e1e3h		;765c
	dec (hl)			;765f
	ret nz			;7660
	xor a			;7661   ; ...y el efecto elegido (0xE1E7, 0xE1E4)
	ld (0e19fh),a		;7662   ; guarda el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	ld b,0ffh		;7665
	ld a,(0e1e7h)		;7667
	call L_76D2		;766a
	ld a,(0e1e4h)		;766d
	ld (0e19fh),a		;7670   ; guarda el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	ret			;7673
L_7674:
	xor a			;7674   ; fuera de ahi, sin efecto
	ld (0e1e7h),a		;7675
	ld (0e1e4h),a		;7678
	jr L_765C		;767b
L_767D:
	call 08318h		;767d   ; si p14:8318 dice que hay algo (0xED0A)...
	or a			;7680
	ret z			;7681
	ld (0ed0ah),a		;7682
	ld a,(0ed3eh)		;7685   ; ...antes del paso 2, o con la espera entre 0x18 y 0x27...
	cp 002h		;7688
	jr c,L_769F		;768a
	ret nz			;768c
	ld a,(0e1e3h)		;768d
	cp 028h		;7690
	jr nc,L_769F		;7692
	cp 018h		;7694
	ret c			;7696
	ld hl,0ed0ah		;7697
	ld a,(hl)			;769a
	call L_76A6		;769b
	ld (hl),b			;769e
L_769F:
	ld a,020h		;769f   ; ...el boton 2 (0x20) y se sale del que llamo
	ld (0e19fh),a		;76a1   ; guarda el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	pop hl			;76a4
	ret			;76a5
L_76A6:
	rra			;76a6   ; la direccion: bit 0 -> 8, bit 1 -> 4, si no 1
	ld b,008h		;76a7
	ret c			;76a9
	ld b,004h		;76aa
	rra			;76ac
	ret c			;76ad
	ld b,001h		;76ae
	ret			;76b0
L_76B1:
	call L_7722		;76b1   ; la eleccion del lanzamiento (p01:7722) y su espera
	call L_76D9		;76b4
	ld a,b			;76b7
	cp 0ffh		;76b8
	jr z,L_76D1		;76ba
	dec a			;76bc   ; el tipo x 4 mas un azar de 0 a 3...
	add a,a			;76bd
	add a,a			;76be
	ld b,a			;76bf
	ld a,r		;76c0
	and 003h		;76c2
	add a,b			;76c4
	call 05b69h		;76c5   ; ...da la espera (p00:5B69)
	ld a,(0e199h)		;76c8   ; con 3 bolas, 13
	cp 003h		;76cb
	jr c,L_76D1		;76cd
	ld b,00dh		;76cf
L_76D1:
	xor a			;76d1
L_76D2:
	ld hl,0e1e3h		;76d2   ; 0xE1E3 = la espera, 0xE1E4 = el mando
	ld (hl),b			;76d5
	inc hl			;76d6
	ld (hl),a			;76d7
	ret			;76d8
L_76D9:
	ld a,(0e1e7h)		;76d9   ; segun 0xE1E7: 4 -> IX+17, 8 -> IX+16, si no 0xFF
	cp 004h		;76dc
	ld b,(ix+011h)		;76de
	ret z			;76e1
	cp 008h		;76e2
	ld b,(ix+010h)		;76e4
	ret z			;76e7
	ld b,0ffh		;76e8
	ret			;76ea
L_76EB:
	ld b,000h		;76eb   ; el efecto: con 3 bolas nada...
	ld a,(0e199h)		;76ed   ; lee las bolas de la cuenta (4 = base por bolas, FOUR BALL)
	cp 003h		;76f0
	call nz,L_76FA		;76f2
	ld a,b			;76f5
	ld (0e19fh),a		;76f6   ; guarda el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	ret			;76f9
L_76FA:
	ld b,001h		;76fa   ; ...si no, al azar: 1 (1 de 8), 2 (1 de 8) o nada
	ld a,r		;76fc
	and 00fh		;76fe
	cp 002h		;7700
	ret c			;7702
	ld b,002h		;7703
	cp 004h		;7705
	ret c			;7707
	ld b,000h		;7708
	ret			;770a
L_770B:
	call L_7713		;770b   ; la direccion del lanzamiento al azar: 2 (1 de 8), 1 (2 de 8) o 0
	ld a,b			;770e
	ld (0e19fh),a		;770f   ; guarda el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	ret			;7712
L_7713:
	ld b,002h		;7713
	ld a,r		;7715
	and 007h		;7717
	ret z			;7719
	ld b,001h		;771a
	cp 003h		;771c
	ret c			;771e
	ld b,000h		;771f
	ret			;7721
L_7722:
	call 0aad3h		;7722   ; la eleccion: p15:AAD3 y los limites (p01:774B)...
	call L_774B		;7725
	call L_7737		;7728   ; ...la tabla segun la ficha (p01:7737)...
	ld a,r		;772b   ; ...y uno al azar de los 8: el tipo en 0xE1E7
	and 007h		;772d
	call 04216h		;772f   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;7732
	ld (0e1e7h),a		;7733
	ret			;7736
L_7737:
	ld hl,07766h		;7737   ; la tabla 0x7766, 0x776A o 0x7772 segun IX+16 y IX+17 contra B y C
	ld a,(ix+010h)		;773a
	cp b			;773d
	ret nc			;773e
	ld hl,0776ah		;773f
	ld a,(ix+011h)		;7742
	cp c			;7745
	ret nc			;7746
	ld hl,07772h		;7747
	ret			;774a
L_774B:
	ld bc,00505h		;774b   ; los limites: 5 y 5, o 11 en uno segun 0xE1E5 y 0xE1FE
	ld a,(0e1feh)		;774e   ; lee el lado por el que batea (0 si IX+6 de su ficha es 0x20, si no 1): elige las tablas del otro lado
	or a			;7751
	jr z,L_775D		;7752
	ld a,(0e1e5h)		;7754
	cp 078h		;7757
	ret c			;7759
	ld b,00bh		;775a
	ret			;775c
L_775D:
	ld a,(0e1e5h)		;775d
	cp 078h		;7760
	ret nc			;7762
	ld c,00bh		;7763
	ret			;7765

; ----------------------------------------------------------------------
; DATOS resto_7766: lo apuntan con el banco puesto p01:7737 (0x7766), p01:773F
;   (0x776A), p01:7747 (0x7772), p00:45E5 (0x7777); el tamano es lo que hay
;   hasta lo siguiente, no sale de recorrerlo; lo leen p01:7737, p01:773F,
;   p01:7747, p00:45E5 (20 bytes)
;   0x7766..0x777a  (20 bytes)
DATA_resto_7766:
	defb 008h,008h,008h,008h,000h,000h,000h,000h,004h,004h,004h,004h,000h,000h,000h,000h	; 7766  ................
	defb 000h,000h,004h,008h	; 7776

; ======================================================================
; CODIGO 0x777a..0x778e  (20 bytes)
; ======================================================================


L_777A:
	call L_78C4		;777a   ; el bateador del ordenador: p01:78C4, p01:785E...
	call L_785E		;777d
	ld a,(0e1d1h)		;7780   ; ...p01:78EC si 0xE1D1 < 3...
	cp 003h		;7783
	call c,L_78EC		;7785
	ld a,(0eceeh)		;7788   ; ...y el paso de 0xECEE
	call 04220h		;778b   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_778E: 4 destinos del despachador p00:4220 (call en p01:778B, el
;   indice en A): 7796, 77C6, 7844, 7851; lo leen p01:778B (8 bytes)
;   0x778e..0x7796  (8 bytes)
DATA_tabla_778E:
	defw 07796h,077c6h,07844h,07851h	; 778e  -> L_7796 L_77C6 L_7844 L_7851

; ======================================================================
; CODIGO 0x7796..0x7916  (384 bytes)
; ======================================================================


L_7796:
	ld a,(0e1d1h)		;7796   ; paso 0: la cuenta de 0xE1EA hasta 6...
	cp 003h		;7799
	ret c			;779b
	ld hl,0e1eah		;779c
	dec (hl)			;779f
	ld a,(hl)			;77a0
	cp 006h		;77a1
	ret nz			;77a3
	call L_77E0		;77a4   ; ...si la pelota va a pasar entre 0x6B y 0x85...
	ld a,h			;77a7
	cp 06bh		;77a8
	ret c			;77aa
	cp 086h		;77ab
	ret nc			;77ad
	call L_780E		;77ae   ; ...y p01:780E y p01:7824 lo dejan...
	ret c			;77b1
	call L_7824		;77b2
	ld a,b			;77b5
	cp 0ffh		;77b6
	ret z			;77b8
	ld a,r		;77b9   ; ...un retraso al azar de 1 a 4 (0xED98)
	and 003h		;77bb
	inc a			;77bd
	ld (0ed98h),a		;77be
L_77C1:
	ld hl,0eceeh		;77c1   ; apunta a el paso del bateador del ordenador
	inc (hl)			;77c4
	ret			;77c5
L_77C6:
	ld hl,0e1eah		;77c6   ; paso 1: la cuenta mas el retraso llega a 6...
	dec (hl)			;77c9
	ld b,(hl)			;77ca
	ld a,(0ed98h)		;77cb
	add a,b			;77ce
	cp 006h		;77cf
	ret nz			;77d1
	call L_783B		;77d2   ; ...y batea: 0xE19D con el bit 4
	ld a,(0e19dh)		;77d5   ; lee el mando del bateador o los corredores
	or 010h		;77d8
	or b			;77da
	ld (0e19dh),a		;77db   ; guarda el mando del bateador o los corredores
	jr L_77C1		;77de
L_77E0:
	ld hl,(0e1d8h)		;77e0   ; donde va a pasar la pelota: 0xE1D8 y la direccion de 0xE19F...
	ld a,(0e19fh)		;77e3   ; lee el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	and 00ch		;77e6
	ret z			;77e8
	cp 00ch		;77e9
	ret z			;77eb
	push hl			;77ec
	call L_77FB		;77ed
	ld a,(0e1e9h)		;77f0   ; ...con el signo segun 0xE1E9
	cp 004h		;77f3
	call z,05f71h		;77f5
	pop de			;77f8
	add hl,de			;77f9
	ret			;77fa
L_77FB:
	ld a,(0ed12h)		;77fb   ; la distancia por la velocidad: 0xED12 x 0xED94...
	ld e,a			;77fe
	ld a,(0ed94h)		;77ff
	call 05fa4h		;7802   ; multiplica: HL = A x E (8 x 8 bits)
	ld de,00018h		;7805   ; ...mas 0x18, por 3
	add hl,de			;7808
	ld d,h			;7809
	ld e,l			;780a
	add hl,hl			;780b
	add hl,de			;780c
	ret			;780d
L_780E:
	call L_7819		;780e   ; batea si va a pasar por la zona (0x6D-0x83), o 1 de 8 veces al azar
	ld a,c			;7811
	or a			;7812
	ret nz			;7813
	ld a,r		;7814
	cp 020h		;7816
	ret			;7818
L_7819:
	ld c,000h		;7819   ; C = 1 si A esta entre 0x6D y 0x83
	cp 06dh		;781b
	ret c			;781d
	cp 084h		;781e
	ret nc			;7820
	ld c,001h		;7821
	ret			;7823
L_7824:
	ld b,000h		;7824   ; la direccion del golpe segun 0xE1E6: sin nada 0; si no, 3 de 4 veces ninguna...
	ld a,(0e1e6h)		;7826
	or a			;7829
	ld c,a			;782a
	ret z			;782b
	dec b			;782c
	ld a,r		;782d
	and 003h		;782f
	ret nz			;7831
	ld a,c			;7832
L_7833:
	ld b,001h		;7833   ; ...1 -> 1, lo demas -> 2
	cp 001h		;7835
	ret z			;7837
	ld b,002h		;7838
	ret			;783a
L_783B:
	ld b,000h		;783b   ; lo mismo sin el azar
	ld a,(0e1e6h)		;783d
	or a			;7840
	ret z			;7841
	jr L_7833		;7842
L_7844:
	ld a,(0e1f3h)		;7844   ; sin 0xE1F3: 64 cuadros de espera y al paso siguiente
	or a			;7847
	ret nz			;7848
	ld a,040h		;7849
	ld (0e1eah),a		;784b
	jp L_77C1		;784e
L_7851:
	ld hl,0e1eah		;7851   ; al acabar la espera, sin mando y al paso 0
	dec (hl)			;7854
	ret nz			;7855
	xor a			;7856
	ld (0e19dh),a		;7857   ; guarda el mando del bateador o los corredores
	ld (0eceeh),a		;785a   ; guarda el paso del bateador del ordenador
	ret			;785d
L_785E:
	ld a,(0e1d1h)		;785e   ; el bateador se coloca: con 0xE1D1 >= 3 solo si faltan menos de 10
	cp 003h		;7861
	jr c,L_786B		;7863
	ld a,(0e1eah)		;7865
	cp 00ah		;7868
	ret nc			;786a
L_786B:
	ld a,(0e1feh)		;786b   ; donde va la pelota (0xE1D9 - 0x30, o + 0x24 con 0xE1FE)...
	or a			;786e
	jp nz,L_789C		;786f
	ld a,(0e1d9h)		;7872
	sub 030h		;7875
	ld b,a			;7877
	call L_78B2		;7878
	ld a,(0e1f5h)		;787b   ; ...contra su sitio (0xE1F5): igual, quieto...
	cp b			;787e
	ld a,(0e19dh)		;787f   ; lee el mando del bateador o los corredores
	jr z,L_788E		;7882
	jr c,L_7894		;7884
L_7886:
	and 0f3h		;7886   ; ...antes, hacia un lado (bit 2)...
	or 004h		;7888
	ld (0e19dh),a		;788a   ; guarda el mando del bateador o los corredores
	ret			;788d
L_788E:
	and 0f3h		;788e
	ld (0e19dh),a		;7890   ; guarda el mando del bateador o los corredores
	ret			;7893
L_7894:
	and 0f3h		;7894   ; ...despues, al otro (bit 3)
	or 008h		;7896
	ld (0e19dh),a		;7898   ; guarda el mando del bateador o los corredores
	ret			;789b
L_789C:
	ld a,(0e1d9h)		;789c
	add a,024h		;789f
	ld b,a			;78a1
	call L_78BB		;78a2
	ld a,(0e1f5h)		;78a5
	cp b			;78a8
	ld a,(0e19dh)		;78a9   ; lee el mando del bateador o los corredores
	jr z,L_788E		;78ac
	jr c,L_7894		;78ae
	jr L_7886		;78b0
L_78B2:
	ld a,(0e1d1h)		;78b2   ; con 0xE1D1 < 3, el sitio fijo 0x4C...
	cp 003h		;78b5
	ret nc			;78b7
	ld b,04ch		;78b8
	ret			;78ba
L_78BB:
	ld a,(0e1d1h)		;78bb   ; ...o 0x94
	cp 003h		;78be
	ret nc			;78c0
	ld b,094h		;78c1
	ret			;78c3
L_78C4:
	ld a,(0ed79h)		;78c4   ; el toque pedido (0xED79): 0xFF ya hecho...
	cp 0ffh		;78c7
	ret z			;78c9
	or a			;78ca
	jr nz,L_78DD		;78cb
	call 0860ch		;78cd   ; ...0: lo decide p14:860C...
	ld a,(0ed79h)		;78d0
	or a			;78d3
	ret z			;78d4
	cp 0ffh		;78d5
	ret z			;78d7
	ld (0e19dh),a		;78d8   ; ...y se usa como mando
	pop hl			;78db
	ret			;78dc
L_78DD:
	ld c,042h		;78dd   ; si no: con p15:B06E, el mando a cero y 0xED79 = 0xFF
	call 0b06eh		;78df
	ret nc			;78e2
	xor a			;78e3
	ld (0e19dh),a		;78e4   ; guarda el mando del bateador o los corredores
	dec a			;78e7
	ld (0ed79h),a		;78e8
	ret			;78eb
L_78EC:
	ld hl,0e19dh		;78ec   ; suelta el bit 4 (el bate)
	res 4,(hl)		;78ef
	ret			;78f1
L_78F2:
	xor a			;78f2   ; los corredores del ordenador: sin mando...
	ld (0e19dh),a		;78f3   ; guarda el mando del bateador o los corredores
	call L_7933		;78f6   ; ...el toque (p01:7933) y p01:7922...
	call L_7922		;78f9
	ld a,(0ed3fh)		;78fc   ; ...con 0xED3F y sin el paso 3, p01:7AA3 / p01:7AE3
	or a			;78ff
	jr z,L_7910		;7900
	ld a,(0ed29h)		;7902   ; lee el paso de los corredores del ordenador
	cp 003h		;7905
	jr z,L_7910		;7907
	call L_7AA3		;7909
	ret c			;790c
	jp L_7AE3		;790d
L_7910:
	ld a,(0ed29h)		;7910   ; si no, el paso de 0xED29
	call 04220h		;7913   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_7916: 6 destinos del despachador p00:4220 (call en p01:7913, el
;   indice en A): 793E, 7969, 798C, 79C1, 7A71, 7A7F; lo leen p01:7913 (12
;   bytes)
;   0x7916..0x7922  (12 bytes)
DATA_tabla_7916:
	defw 0793eh,07969h,0798ch,079c1h,07a71h,07a7fh	; 7916

; ======================================================================
; CODIGO 0x7922..0x7b88  (614 bytes)
; ======================================================================


L_7922:
	ld hl,0ed32h		;7922   ; la cuenta de 0xED32 (hasta 2)
	ld a,(hl)			;7925
	or a			;7926
	ret z			;7927
	cp 002h		;7928
	jr z,L_795F		;792a
	inc (hl)			;792c
	xor a			;792d
	ld (0ed08h),a		;792e
	jr L_795F		;7931
L_7933:
	ld a,(0ed79h)		;7933   ; con toque pedido, el paso 5
	or a			;7936
	ret z			;7937
	ld a,005h		;7938
	ld (0ed29h),a		;793a   ; guarda el paso de los corredores del ordenador
	ret			;793d
L_793E:
	ld a,(0ed72h)		;793e   ; el paso segun la jugada: 4 con el bit 1 de 0xED72...
	bit 1,a		;7941
	jr nz,L_7963		;7943
	ld a,(0e1d0h)		;7945   ; ...1 sin 0xE1D0 ni el bit 0 de 0xEDDF...
	or a			;7948
	jr nz,L_7955		;7949
	ld a,(0eddfh)		;794b
	rra			;794e
	jr c,L_7955		;794f
	ld a,001h		;7951
	jr L_7965		;7953
L_7955:
	ld a,(0ed02h)		;7955   ; ...2 con 0xED02, si no 3
	or a			;7958
	jr z,L_795F		;7959
	ld a,002h		;795b
	jr L_7965		;795d
L_795F:
	ld a,003h		;795f
	jr L_7965		;7961
L_7963:
	ld a,004h		;7963
L_7965:
	ld (0ed29h),a		;7965   ; guarda el paso de los corredores del ordenador
	ret			;7968
L_7969:
	ld a,(0e1d0h)		;7969   ; paso 1: sin 0xE1D0 ni el bit 0 de 0xEDDF, p01:7AA3...
	or a			;796c
	jr nz,L_79A6		;796d
	ld a,(0eddfh)		;796f
	rra			;7972
	jr c,L_79A6		;7973
	call L_7AA3		;7975
	ret c			;7978
	ld a,(0e19ah)		;7979   ; ...con 2 outs corre (p01:7AC0)...
	cp 002h		;797c
	jp z,L_7AC0		;797e
	ld a,(0e227h)		;7981   ; ...si no, segun 0xE227
	cp 004h		;7984
	jp c,L_7AC0		;7986
	jp L_7AE3		;7989
L_798C:
	call L_7AA3		;798c   ; paso 2: p01:7AA3 y las marcas del corredor (IX+11 y IX+13)
	ret c			;798f
	ld a,(ix+00bh)		;7990   ; lee las marcas
	ld b,a			;7993
	and 04fh		;7994
	cp 044h		;7996
	jr z,L_79AB		;7998
	bit 6,(ix+00dh)		;799a   ; mira el bit 6 de la base de destino (nibble alto; 2 abajo: llegado)
	jr nz,L_79A6		;799e
	ld a,b			;79a0
	and 0c0h		;79a1
	jp z,L_7AE3		;79a3
L_79A6:
	xor a			;79a6   ; al paso 0
	ld (0ed29h),a		;79a7   ; guarda el paso de los corredores del ordenador
	ret			;79aa
L_79AB:
	ld a,(0ecffh)		;79ab   ; con 0xECFF, si la pelota no la tiene nadie o uno de los 7 primeros...
	or a			;79ae
	ret z			;79af
	ld a,(0e220h)		;79b0   ; lee el defensor que tiene la pelota (1-9; 0 nadie)
	or a			;79b3
	jr z,L_79B9		;79b4
	cp 007h		;79b6
	ret c			;79b8
L_79B9:
	bit 6,(ix+00dh)		;79b9   ; ...y el bit 6 de IX+13: corre
	ret z			;79bd
	jp L_7AC0		;79be
L_79C1:
	call L_7AA3		;79c1   ; paso 3: p01:7AA3 y las marcas: bit 6 de IX+11...
	ret c			;79c4
	ld a,(ix+00bh)		;79c5   ; lee las marcas
	bit 6,a		;79c8
	jp nz,L_79EC		;79ca
	bit 7,a		;79cd   ; ...bit 7...
	jp nz,L_7A2A		;79cf
	call L_7AC0		;79d2   ; ...si no, corre (p01:7AC0)...
	bit 5,(ix+00dh)		;79d5   ; mira el bit 5 de la base de destino (nibble alto; 2 abajo: llegado)
	ret nz			;79d9
	call L_7B3C		;79da   ; ...y segun p01:7B3C y p01:7A44, p01:7AE3
	jp c,L_7AE3		;79dd
	ld a,(0e220h)		;79e0   ; lee el defensor que tiene la pelota (1-9; 0 nadie)
	or a			;79e3
	ret z			;79e4
	call L_7A44		;79e5
	jp z,L_7AE3		;79e8
	ret			;79eb
L_79EC:
	bit 5,(ix+00dh)		;79ec   ; el bit 6: con el bit 5 de IX+13 corre...
	jp nz,L_7AC0		;79f0
	ld hl,0ed08h		;79f3   ; una sola vez (0xED08), y con 0xE33C se marca
	ld a,(hl)			;79f6
	or a			;79f7
	ret nz			;79f8
	ld a,(0e33ch)		;79f9
	or a			;79fc
	jr z,L_7A01		;79fd
	ld (hl),001h		;79ff
L_7A01:
	call L_7B3C		;7a01   ; si la base de delante esta ocupada (p01:7B3C) no
	ret c			;7a04
	call 0835eh		;7a05   ; p14:835E decide si corre
	jp c,L_7AC0		;7a08
	push ix		;7a0b   ; el defensor mas cerca (p01:7B07)...
	call L_7B07		;7a0d
	ld hl,(0e22fh)		;7a10   ; ...si esta a mas de 0x24 no corre...
	ld de,0ffdch		;7a13
	add hl,de			;7a16
	pop ix		;7a17
	ret nc			;7a19
	ld a,(0ed32h)		;7a1a   ; ...salvo con 0xED32 = 2 o 0xECFF
	cp 002h		;7a1d
	jp z,L_7AC0		;7a1f
	ld a,(0ecffh)		;7a22
	or a			;7a25
	ret z			;7a26
	jp L_7AC0		;7a27
L_7A2A:
	call L_7B5C		;7a2a   ; el bit 7: con la base de atras libre (p01:7B5C) vuelve...
	jp c,L_7AC0		;7a2d
	call L_7A39		;7a30   ; ...o si el que tiene la pelota esta en su base
	jp z,L_7AC0		;7a33
	jp L_7AE3		;7a36
L_7A39:
	call L_7A4E		;7a39   ; Z si el que tiene la pelota guarda la base de este corredor
	add a,002h		;7a3c
	cp b			;7a3e
	ret z			;7a3f
	add a,00fh		;7a40
	cp b			;7a42
	ret			;7a43
L_7A44:
	call L_7A4E		;7a44   ; Z si guarda la siguiente
	inc a			;7a47
	cp b			;7a48
	ret z			;7a49
	add a,011h		;7a4a
	cp b			;7a4c
	ret			;7a4d
L_7A4E:
	ld a,(0e220h)		;7a4e   ; B = la base que guarda el que tiene la pelota (IX+13 de su ficha)...
	ld b,a			;7a51
	ld a,009h		;7a52
	sub b			;7a54
	rlca			;7a55
	rlca			;7a56
	rlca			;7a57
	rlca			;7a58
	add a,00dh		;7a59
	ld hl,0e271h		;7a5b   ; apunta a las 9 fichas de 16 bytes de los defensores
	call 04216h		;7a5e   ; hl_mas_a: HL = HL + A
	ld b,(hl)			;7a61
	ld a,(ix+00bh)		;7a62   ; ...y A = la base del corredor en el nibble alto
	rlca			;7a65
	rlca			;7a66
	rlca			;7a67
	rlca			;7a68
	and 0f0h		;7a69
	ret			;7a6b
L_7A6C:
	ld hl,0ed29h		;7a6c   ; al paso siguiente
	inc (hl)			;7a6f
	ret			;7a70
L_7A71:
	call L_7AA3		;7a71   ; paso 4: con las marcas a cero, avanza; si no, al paso 0
	ld a,(ix+00bh)		;7a74   ; lee las marcas
	and 0c0h		;7a77
	jp z,L_7AE3		;7a79
	jp L_79A6		;7a7c
L_7A7F:
	ld a,(0ed2eh)		;7a7f   ; paso 5 (el toque): con 0xED2E = 2 o 0xED32 se acaba...
	cp 002h		;7a82
	jr z,L_7A95		;7a84
	ld a,(0ed32h)		;7a86
	or a			;7a89
	jr nz,L_7A95		;7a8a
	call L_79C1		;7a8c
	ld a,(ix+00bh)		;7a8f   ; lee las marcas
	cp 043h		;7a92
	ret nz			;7a94
L_7A95:
	xor a			;7a95   ; ...todo a cero y al paso 0
	ld (0ed79h),a		;7a96
	ld (0ed72h),a		;7a99
	inc a			;7a9c
	ld (0ed08h),a		;7a9d
	jp L_79A6		;7aa0
L_7AA3:
	ld a,(0ed6ch)		;7aa3   ; el corredor siguiente (0xED6C de 16 en 16, 4 fichas)...
	add a,010h		;7aa6
	cp 040h		;7aa8
	jr c,L_7AAD		;7aaa
	xor a			;7aac
L_7AAD:
	ld (0ed6ch),a		;7aad
	ld e,a			;7ab0
	ld d,000h		;7ab1
	ld ix,0e231h		;7ab3   ; apunta a las 4 fichas de 16 bytes de los corredores (0xE23C = su estado)
	add ix,de		;7ab7
	ld a,(ix+00bh)		;7ab9   ; ...carry si esta vacio
	or a			;7abc
	ret nz			;7abd
	scf			;7abe
	ret			;7abf
L_7AC0:
	ld a,(ix+00bh)		;7ac0   ; que vuelva: segun su base, el mando 1, 4 o 2 con el bit 5
	ld b,a			;7ac3
	cp 001h		;7ac4
	ret z			;7ac6
	and 0c0h		;7ac7
	ret z			;7ac9
	ld a,b			;7aca
	and 00fh		;7acb
	call L_7AD7		;7acd
	ld a,020h		;7ad0
	or b			;7ad2
	ld (0e19dh),a		;7ad3   ; guarda el mando del bateador o los corredores
	ret			;7ad6
L_7AD7:
	dec a			;7ad7   ; la base 2 -> 1, 3 -> 4, 4 -> 2
	dec a			;7ad8
	ld b,001h		;7ad9
	ret z			;7adb
	dec a			;7adc
	ld b,004h		;7add
	ret z			;7adf
	ld b,002h		;7ae0
	ret			;7ae2
L_7AE3:
	ld a,(ix+00bh)		;7ae3   ; que avance (si no esta ya corriendo): el mando 8, 1 o 4 con el bit 4
	ld b,a			;7ae6
	and 0c0h		;7ae7
	ret nz			;7ae9
	ld a,b			;7aea
	and 00fh		;7aeb
	cp 001h		;7aed
	ret z			;7aef
	call L_7AFA		;7af0
	ld a,010h		;7af3
	or b			;7af5
	ld (0e19dh),a		;7af6   ; guarda el mando del bateador o los corredores
	ret			;7af9
L_7AFA:
	dec a			;7afa   ; la base 2 -> 8, 3 -> 1, 4 -> 4
	dec a			;7afb
	ld b,008h		;7afc
	ret z			;7afe
	dec a			;7aff
	ld b,001h		;7b00
	ret z			;7b02
	dec a			;7b03
	ld b,004h		;7b04
	ret			;7b06
L_7B07:
	xor a			;7b07   ; el defensor mas cerca: la distancia del primero (0xE22F)...
	call L_7B30		;7b08
	ld (0e22fh),hl		;7b0b
	ld a,010h		;7b0e
L_7B10:
	push af			;7b10   ; ...y la de los demas (de 16 en 16, hasta 8)...
	call L_7B1C		;7b11
	pop af			;7b14
	add a,010h		;7b15
	cp 090h		;7b17
	ret nc			;7b19
	jr L_7B10		;7b1a
L_7B1C:
	call L_7B30		;7b1c
	ld b,h			;7b1f
	ld c,l			;7b20
	ld de,(0e22fh)		;7b21
	or a			;7b25
	sbc hl,de		;7b26
	rl h		;7b28
	ret nc			;7b2a
	ld (0e22fh),bc		;7b2b   ; ...la menor
	ret			;7b2f
L_7B30:
	ld d,000h		;7b30   ; la distancia del defensor A (p14:808A)
	ld e,a			;7b32
	ld ix,0e271h		;7b33   ; apunta a las 9 fichas de 16 bytes de los defensores
	add ix,de		;7b37
	jp 0808ah		;7b39
L_7B3C:
	ld a,(ix+00bh)		;7b3c   ; carry si en la base siguiente hay un corredor parado
	and 00fh		;7b3f
	inc a			;7b41
	ld c,a			;7b42
	ld b,004h		;7b43
	ld hl,0e23ch		;7b45
	ld de,00010h		;7b48
L_7B4B:
	ld a,(hl)			;7b4b   ; busca la ficha de esa base
	and 00fh		;7b4c
	cp c			;7b4e
	jr z,L_7B56		;7b4f
	add hl,de			;7b51
	djnz L_7B4B		;7b52
	or a			;7b54
	ret			;7b55
L_7B56:
	ld a,(hl)			;7b56
	and 0c0h		;7b57
	ret z			;7b59
	scf			;7b5a
	ret			;7b5b
L_7B5C:
	ld a,(ix+00bh)		;7b5c   ; carry si en la misma base hay otro corredor (bit 6)
	and 00fh		;7b5f
	ld c,a			;7b61
	ld b,004h		;7b62
	ld hl,0e23ch		;7b64
	ld de,00010h		;7b67
L_7B6A:
	ld a,(hl)			;7b6a
	and 00fh		;7b6b
	cp c			;7b6d
	jr nz,L_7B74		;7b6e
	bit 6,(hl)		;7b70
	scf			;7b72
	ret nz			;7b73
L_7B74:
	add hl,de			;7b74
	djnz L_7B6A		;7b75
	or a			;7b77
	ret			;7b78
L_7B79:
	call L_7FDA		;7b79   ; la defensa del ordenador: p01:7FDA y el paso de 0xECE6
	ld a,(0eddeh)		;7b7c   ; lee la jugada anulada (foul)
	rra			;7b7f
	jr c,$+28		;7b80
	ld a,(0ece6h)		;7b82   ; lee el paso de la defensa del ordenador
	call 04220h		;7b85   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS tabla_7B88: 10 destinos del despachador p00:4220 (call en p01:7B85, el
;   indice en A): 7BA1, 7BC3, 7BE7, 7D57, 7D80, 7F4D, 7F70, 7FB8, 7FEB, 8021;
;   lo leen p01:7B85 (20 bytes)
;   0x7b88..0x7b9c  (20 bytes)
DATA_tabla_7B88:
	defw 07ba1h,07bc3h,07be7h,07d57h,07d80h,07f4dh,07f70h,07fb8h	; 7b88
	defw 07febh,08021h	; 7b98  -> L_7FEB 0x8021

; ======================================================================
; CODIGO 0x7b9c..0x7fff  (1123 bytes)
; ======================================================================


L_7B9C:
	xor a			;7b9c   ; sin mando
	ld (0e19fh),a		;7b9d   ; guarda el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	ret			;7ba0
L_7BA1:
	xor a			;7ba1   ; paso 0: todo a cero, 5 cuadros (0xEDD6), p15:B524, p14:80F2 y p14:814D
	ld (0e19fh),a		;7ba2   ; guarda el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	ld (0ed86h),a		;7ba5
	ld h,a			;7ba8
	ld l,a			;7ba9
	ld (0ece9h),hl		;7baa
	ld (0ece7h),hl		;7bad
	ld a,005h		;7bb0
	ld (0edd6h),a		;7bb2
	call 0b524h		;7bb5
	call 080f2h		;7bb8
	call 0814dh		;7bbb
L_7BBE:
	ld hl,0ece6h		;7bbe   ; al paso siguiente
	inc (hl)			;7bc1
	ret			;7bc2
L_7BC3:
	ld a,(0ed7ch)		;7bc3   ; paso 1: espera (0xEDD6) salvo que la jugada empiece...
	ld hl,0e1d0h		;7bc6
	or (hl)			;7bc9
	ld hl,0ecffh		;7bca
	or (hl)			;7bcd
	jr nz,L_7BD5		;7bce
	ld hl,0edd6h		;7bd0
	dec (hl)			;7bd3
	ret nz			;7bd4
L_7BD5:
	call L_7BBE		;7bd5   ; ...p14:80BA y, si 0xE22B baja de 0x30, p01:7D27 y p15:B531
	call 080bah		;7bd8
	ld a,(0e22bh)		;7bdb   ; lee el defensor que va a por la pelota (desplazamiento de 16 en 16)
	cp 030h		;7bde
	ret nc			;7be0
	call L_7D27		;7be1
	jp 0b531h		;7be4
L_7BE7:
	ld a,(0e33ch)		;7be7   ; paso 2: con 0xE33C al paso siguiente; si no, p14:81F1 y p01:7D27
	or a			;7bea
	jr nz,L_7BBE		;7beb
	call 081f1h		;7bed
	call L_7D27		;7bf0
	ld a,(0e1b8h)		;7bf3   ; segun 0xE1B8 (0, 0x80 u otro)
	or a			;7bf6
	jr z,L_7C16		;7bf7
	cp 080h		;7bf9
	jr z,L_7C2B		;7bfb
	ld a,(0ed32h)		;7bfd   ; con 0xED32, 0xE1D0 o 0xED86 = 2, a por la pelota (0xE1B8 = 0x80)
	ld hl,0e1d0h		;7c00
	or (hl)			;7c03
	jr nz,L_7C0F		;7c04
	ld a,(0ed86h)		;7c06
	cp 002h		;7c09
	jr z,L_7C0F		;7c0b
	jr L_7C3A		;7c0d
L_7C0F:
	ld a,080h		;7c0f
	ld (0e1b8h),a		;7c11
	jr L_7C2B		;7c14
L_7C16:
	ld a,(0e1d0h)		;7c16   ; sin 0xE1B8: con la pelota en el aire (0xE1D0) a buscarla...
	or a			;7c19
	jr nz,L_7C28		;7c1a
	ld a,(0ed86h)		;7c1c   ; ...con 0xED86 = 2, quieto
	cp 002h		;7c1f
	jr nz,L_7C3A		;7c21
	xor a			;7c23
	ld (0e19fh),a		;7c24   ; guarda el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	ret			;7c27
L_7C28:
	call L_7D34		;7c28   ; el defensor que va (p01:7D34)
L_7C2B:
	call L_7D0D		;7c2b   ; hacia donde caera la pelota: la y (p01:7D0D, p01:7C73)...
	call L_7C73		;7c2e
	call L_7D04		;7c31   ; ...y la x (p01:7D04, p01:7C56); sin salirse (p01:7CA4)
	call L_7C56		;7c34
	jp L_7CA4		;7c37
L_7C3A:
	ld de,(0ece7h)		;7c3a   ; hacia su puesto (0xECE7, 0xECE9)
	call L_7C73		;7c3e
	ld de,(0ece9h)		;7c41
	call L_7C56		;7c45
	ld a,(0ed86h)		;7c48   ; en su puesto: el boton 1
	cp 002h		;7c4b
	jp nz,L_7CA4		;7c4d
	ld a,002h		;7c50
	ld (0e19fh),a		;7c52   ; guarda el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	ret			;7c55
L_7C56:
	ld l,(ix+007h)		;7c56   ; la direccion x: izquierda o derecha (bits 2-3)...
	ld h,(ix+008h)		;7c59
	call L_7C8F		;7c5c
	ld a,b			;7c5f
	or a			;7c60
	jr z,L_7C6E		;7c61
	rla			;7c63
	rla			;7c64
	ld b,a			;7c65
	ld a,(0e19fh)		;7c66   ; lee el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	or b			;7c69
	ld (0e19fh),a		;7c6a   ; guarda el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	ret			;7c6d
L_7C6E:
	ld hl,0ed86h		;7c6e   ; ...o ya esta (0xED86 + 1)
	inc (hl)			;7c71
	ret			;7c72
L_7C73:
	xor a			;7c73   ; la direccion y: arriba o abajo (bits 0-1), o ya esta
	ld (0e19fh),a		;7c74   ; guarda el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	ld (0ed86h),a		;7c77
	ld l,(ix+002h)		;7c7a
	ld h,(ix+003h)		;7c7d
	call L_7C8F		;7c80
	ld a,b			;7c83
	ld (0e19fh),a		;7c84   ; guarda el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	or a			;7c87
	ret nz			;7c88
	ld a,001h		;7c89
	ld (0ed86h),a		;7c8b
	ret			;7c8e
L_7C8F:
	ld bc,00002h		;7c8f   ; B = 2 si DE esta delante de HL + 2, 1 si detras de HL + 6, 0 en medio
	add hl,bc			;7c92
	ld b,002h		;7c93
	sbc hl,de		;7c95
	bit 7,h		;7c97
	ret nz			;7c99
	dec b			;7c9a
	ld a,h			;7c9b
	or a			;7c9c
	ret nz			;7c9d
	ld a,l			;7c9e
	cp 004h		;7c9f
	ret nc			;7ca1
	dec b			;7ca2
	ret			;7ca3
L_7CA4:
	ld l,(ix+007h)		;7ca4   ; que no se salga del campo: sus pies (x + 8, y + 12)...
	ld h,(ix+008h)		;7ca7
	ld de,00008h		;7caa
	add hl,de			;7cad
	ex de,hl			;7cae
	ld l,(ix+002h)		;7caf
	ld h,(ix+003h)		;7cb2
	ld bc,0000ch		;7cb5
	add hl,bc			;7cb8
	ld a,(0e19fh)		;7cb9   ; lee el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	and 00fh		;7cbc
	ret z			;7cbe
	push af			;7cbf   ; ...arriba-abajo (p01:7CE1)...
	push hl			;7cc0
	push de			;7cc1
	and 003h		;7cc2
	call nz,L_7CE1		;7cc4
	pop de			;7cc7
	pop hl			;7cc8
	pop af			;7cc9
	and 00ch		;7cca   ; ...y a los lados (p01:7CF4): si se sale, quita esa direccion
	ret z			;7ccc
	dec de			;7ccd
	bit 2,a		;7cce
	jr nz,L_7CD4		;7cd0
	inc de			;7cd2
	inc de			;7cd3
L_7CD4:
	call L_7CF4		;7cd4
	ret nc			;7cd7
	ld a,(0e19fh)		;7cd8   ; lee el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	and 0f3h		;7cdb
	ld (0e19fh),a		;7cdd   ; guarda el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	ret			;7ce0
L_7CE1:
	dec hl			;7ce1   ; un punto mas arriba o abajo
	rra			;7ce2
	jr c,L_7CE7		;7ce3
	inc hl			;7ce5
	inc hl			;7ce6
L_7CE7:
	call L_7CF4		;7ce7
	ret nc			;7cea
	ld a,(0e19fh)		;7ceb   ; lee el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	and 0fch		;7cee
	ld (0e19fh),a		;7cf0   ; guarda el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	ret			;7cf3
L_7CF4:
	push de			;7cf4   ; carry si se sale: segun el lado de 0x118, p14:95BB o p14:9557
	ld de,00118h		;7cf5
	call 00020h		;7cf8   ; BIOS DCOMPR - Compares HL with DE
	pop de			;7cfb
	jp c,05cffh		;7cfc
	call 05cf6h		;7cff
	ccf			;7d02
	ret			;7d03
L_7D04:
	ld de,(0e218h)		;7d04   ; donde cae la pelota en x: 0xE218 + 0xE21A x 8 / 256
	ld hl,(0e21ah)		;7d08   ; lee la velocidad x de la pelota y el byte siguiente (16 bits)
	jr L_7D14		;7d0b
L_7D0D:
	ld de,(0e213h)		;7d0d   ; donde cae en y: 0xE213 + 0xE215 x 8 / 256
	ld hl,(0e215h)		;7d11   ; lee la velocidad y de la pelota y el byte siguiente (16 bits)
L_7D14:
	ld a,h			;7d14   ; (si la velocidad es pequena, sin cambio)
	inc a			;7d15
	cp 002h		;7d16
	ret c			;7d18
	add hl,hl			;7d19
	add hl,hl			;7d1a
	add hl,hl			;7d1b
	ld l,h			;7d1c
	bit 7,h		;7d1d
	ld h,000h		;7d1f
	jr z,L_7D24		;7d21
	dec h			;7d23
L_7D24:
	add hl,de			;7d24
	ex de,hl			;7d25
	ret			;7d26
L_7D27:
	ld a,(0e22bh)		;7d27   ; IX = la ficha del defensor 0xE22B
	ld e,a			;7d2a
	ld d,000h		;7d2b
	ld ix,0e271h		;7d2d   ; apunta a las 9 fichas de 16 bytes de los defensores
	add ix,de		;7d31
	ret			;7d33
L_7D34:
	call L_7D3C		;7d34   ; el defensor que va a por la pelota (0xE22B)
	ld a,b			;7d37
	ld (0e22bh),a		;7d38   ; guarda el defensor que va a por la pelota (desplazamiento de 16 en 16)
	ret			;7d3b
L_7D3C:
	ld a,(0ed40h)		;7d3c   ; 0xED40 si no es 0xFF y hay 0xED43; si no 0xED41, o 0xED42 con 0xECFF
	cp 0ffh		;7d3f
	jr z,L_7D49		;7d41
	ld b,a			;7d43
	ld a,(0ed43h)		;7d44
	or a			;7d47
	ret z			;7d48
L_7D49:
	ld a,(0ed41h)		;7d49
	ld b,a			;7d4c
	ld a,(0ecffh)		;7d4d
	or a			;7d50
	ret z			;7d51
	ld a,(0ed42h)		;7d52
	ld b,a			;7d55
	ret			;7d56
L_7D57:
	xor a			;7d57   ; sin mando: segun 0xED02, p14:8278 o p14:8225 deciden...
	ld (0e19fh),a		;7d58   ; guarda el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	ld a,(0ed02h)		;7d5b
	or a			;7d5e
	jr nz,L_7D70		;7d5f
	ld a,001h		;7d61
	ld (0edd5h),a		;7d63
L_7D66:
	call 08278h		;7d66
	or a			;7d69
	jp nz,08035h		;7d6a   ; ...si hay que lanzar (p14:8035)
	jp L_7B9C		;7d6d
L_7D70:
	ld a,(0edd5h)		;7d70
	or a			;7d73
	jr nz,L_7D66		;7d74
	call 08225h		;7d76
	or a			;7d79
	jp nz,08035h		;7d7a
	jp L_7B9C		;7d7d
L_7D80:
	call 082a7h		;7d80   ; a que base lanzar: p14:82A7 y p01:7F3B...
	call L_7F3B		;7d83
	ld ix,0e2a1h		;7d86   ; ...los 6 defensores de 0xE2A1: quien guarda esa base?
	ld de,00010h		;7d8a
	ld b,006h		;7d8d
L_7D8F:
	ld a,(ix+00dh)		;7d8f
	cp c			;7d92
	jr z,L_7DCB		;7d93
	add ix,de		;7d95
	djnz L_7D8F		;7d97
	call L_7F26		;7d99   ; nadie: la siguiente
	call L_7F3B		;7d9c
	dec c			;7d9f
	ld a,(hl)			;7da0
	cp c			;7da1
	jr nz,L_7DAE		;7da2
L_7DA4:
	ld a,(0ed6eh)		;7da4   ; lanza a la base de 0xED6E (bit 5)
	or 020h		;7da7
	ld (0e19fh),a		;7da9   ; guarda el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	jr L_7DC6		;7dac
L_7DAE:
	cp 022h		;7dae   ; con 0x22, o el 3 no tiene la pelota, o 0xED6E no es 8, se espera
	jr z,L_7DC6		;7db0
	ld a,(0e220h)		;7db2   ; lee el defensor que tiene la pelota (1-9; 0 nadie)
	cp 003h		;7db5
	jr nz,L_7DC6		;7db7
	ld a,(0ed6eh)		;7db9
	cp 008h		;7dbc
	jr nz,L_7DC6		;7dbe
	or 020h		;7dc0
	ld (0e19fh),a		;7dc2   ; guarda el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	ret			;7dc5
L_7DC6:
	ld hl,0ece6h		;7dc6   ; al paso anterior
	dec (hl)			;7dc9
	ret			;7dca
L_7DCB:
	ld a,(0e220h)		;7dcb   ; alguien guarda la base: si es el que tiene la pelota, p01:7E7D
	ld b,a			;7dce
	ld a,(ix+000h)		;7dcf
	and 00fh		;7dd2
	cp b			;7dd4
	jp z,L_7E7D		;7dd5
	ld a,(0edd5h)		;7dd8   ; con 0xEDD5, segun p01:7DF8: 1 corre, 2 lanza
	or a			;7ddb
	jr z,L_7DE8		;7ddc
	call L_7DF8		;7dde
	ld a,b			;7de1
	dec a			;7de2
	jr z,L_7E35		;7de3
	dec a			;7de5
	jr z,L_7DA4		;7de6
L_7DE8:
	ld a,(0ed6eh)		;7de8   ; lanza a la base de 0xED6E (bit 4), 0xED00 = 0x18 y al paso siguiente
	or 010h		;7deb
	ld (0e19fh),a		;7ded   ; guarda el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	ld a,018h		;7df0
	ld (0ed00h),a		;7df2
	jp L_7BBE		;7df5
L_7DF8:
	call L_7F26		;7df8   ; lanzar o correr: la ficha del que tiene la pelota (p01:7F26)...
	ld a,(0edd3h)		;7dfb   ; ...con 0xEDD3 y el bit 0, lanzar (2)
	or a			;7dfe
	jr z,L_7E0A		;7dff
	ld b,002h		;7e01
	bit 0,(hl)		;7e03
	ret nz			;7e05
	xor a			;7e06
	ld (0edd3h),a		;7e07
L_7E0A:
	ld a,(hl)			;7e0a   ; si su base no es la de C, nada (0)
	add a,010h		;7e0b
	and 0f0h		;7e0d
	ld b,a			;7e0f
	ld a,c			;7e10
	and 0f0h		;7e11
	cp b			;7e13
	ld b,000h		;7e14
	ret nz			;7e16
	ld a,(hl)			;7e17   ; si p14:8309 lo deja (por la base de 0xEDC8): lanzar (2) o correr (1)
	rlca			;7e18
	rlca			;7e19
	rlca			;7e1a
	rlca			;7e1b
	and 00fh		;7e1c
	ld d,a			;7e1e
	push bc			;7e1f
	call 08309h		;7e20
	pop bc			;7e23
	ld b,002h		;7e24
	ret nc			;7e26
	ld b,000h		;7e27
	ld a,(0edc8h)		;7e29
	cp d			;7e2c
	jr z,L_7E32		;7e2d
	dec d			;7e2f
	cp d			;7e30
	ret nz			;7e31
L_7E32:
	ld b,001h		;7e32
	ret			;7e34
L_7E35:
	ld a,c			;7e35   ; corre con la pelota: segun la base (C: 0x32, 0x42, 0x52)...
	cp 032h		;7e36
	jr z,L_7E6A		;7e38
	cp 042h		;7e3a
	jr z,L_7E57		;7e3c
	cp 052h		;7e3e
	jp nz,L_7DC6		;7e40
	ld d,004h		;7e43   ; ...si el corredor (0xED0B) va a esa base y esta cerca...
	call L_7F05		;7e45
	jp nz,L_7DC6		;7e48
	ld de,0ff20h		;7e4b
	call L_7F10		;7e4e
	jr c,L_7DE8		;7e51
	ld a,002h		;7e53   ; ...lanza (2) o corre (4)
	jr L_7EB8		;7e55
L_7E57:
	ld d,003h		;7e57
	call L_7F05		;7e59
	jp nz,L_7DC6		;7e5c
	ld de,0fed8h		;7e5f
	call L_7F10		;7e62
	jp nc,L_7DE8		;7e65
	jr L_7ED9		;7e68
L_7E6A:
	ld d,002h		;7e6a
	call L_7F05		;7e6c
	jp nz,L_7DC6		;7e6f
	ld de,0fe68h		;7e72
	call L_7F10		;7e75
	jp nc,L_7DE8		;7e78
	jr L_7EB6		;7e7b
L_7E7D:
	push bc			;7e7d   ; tiene la pelota en su base: p14:830F y 0xEDC7-0xEDC9
	call 0830fh		;7e7e
	pop bc			;7e81
	jr nc,L_7E92		;7e82
	ld hl,0edc7h		;7e84
	ld a,(hl)			;7e87
	inc hl			;7e88
	cp (hl)			;7e89
	jp nz,L_7DC6		;7e8a
	inc hl			;7e8d
	cp (hl)			;7e8e
	jp z,L_7DC6		;7e8f
L_7E92:
	ld a,c			;7e92   ; segun la base (0x32, 0x52, 0x42)...
	cp 032h		;7e93
	jr z,L_7EDD		;7e95
	cp 052h		;7e97
	jr z,L_7EC3		;7e99
	cp 042h		;7e9b
	jp nz,L_7DC6		;7e9d
	call 0830fh		;7ea0   ; ...p14:830F, el corredor y su distancia...
	jr nc,L_7F18		;7ea3
	ld d,003h		;7ea5
	call L_7EF7		;7ea7
	jp nz,L_7DC6		;7eaa
	ld de,0ff10h		;7ead
	call L_7F10		;7eb0
	jp c,L_7DC6		;7eb3
L_7EB6:
	ld a,001h		;7eb6   ; ...lanza a la base 1
L_7EB8:
	or 020h		;7eb8   ; el mando con el bit 5 y 0xEDD3 = 1
	ld (0e19fh),a		;7eba   ; guarda el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	ld a,001h		;7ebd
	ld (0edd3h),a		;7ebf
	ret			;7ec2
L_7EC3:
	call 0830fh		;7ec3   ; base 0x52: lanza a la 4
	jr nc,L_7F1E		;7ec6
	ld d,004h		;7ec8
	call L_7EF7		;7eca
	jp nz,L_7DC6		;7ecd
	ld de,0fef8h		;7ed0
	call L_7F10		;7ed3
	jp nc,L_7DC6		;7ed6
L_7ED9:
	ld a,004h		;7ed9
	jr L_7EB8		;7edb
L_7EDD:
	call 0830fh		;7edd   ; base 0x32: lanza a la 8
	jr nc,L_7F22		;7ee0
	ld d,002h		;7ee2
	call L_7EF7		;7ee4
	jp nz,L_7DC6		;7ee7
	ld de,0fe98h		;7eea
	call L_7F10		;7eed
	jp c,L_7DC6		;7ef0
	ld a,008h		;7ef3
	jr L_7EB8		;7ef5
L_7EF7:
	ld ix,(0ed0bh)		;7ef7   ; el corredor de 0xED0B: Z si va a la base D (y no esta volviendo)
	ld a,(ix+00bh)		;7efb
	bit 5,a		;7efe
	ret nz			;7f00
	and 00fh		;7f01
	cp d			;7f03
	ret			;7f04
L_7F05:
	ld ix,(0ed0bh)		;7f05   ; Z si va a la base D
	ld a,(ix+00bh)		;7f09
	and 00fh		;7f0c
	cp d			;7f0e
	ret			;7f0f
L_7F10:
	ld l,(ix+007h)		;7f10   ; HL = su x mas DE
	ld h,(ix+008h)		;7f13
	add hl,de			;7f16
	ret			;7f17
L_7F18:
	ld a,021h		;7f18   ; lanza a la base 1, 4 u 8 (bit 5)
L_7F1A:
	ld (0e19fh),a		;7f1a   ; guarda el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	ret			;7f1d
L_7F1E:
	ld a,024h		;7f1e
	jr L_7F1A		;7f20
L_7F22:
	ld a,028h		;7f22
	jr L_7F1A		;7f24
L_7F26:
	ld a,(0e220h)		;7f26   ; HL = el byte 13 de la ficha del que tiene la pelota (0xE27E + 16 x (9 - n))
	ld b,a			;7f29
	ld a,009h		;7f2a
	sub b			;7f2c
	rlca			;7f2d
	rlca			;7f2e
	rlca			;7f2f
	rlca			;7f30
	and 0f0h		;7f31
	ld e,a			;7f33
	ld d,000h		;7f34
	ld hl,0e27eh		;7f36
	add hl,de			;7f39
	ret			;7f3a
L_7F3B:
	ld a,(0ed6eh)		;7f3b   ; C = la base de 0xED6E: bit 0 0x32, bit 1 0x52, bit 2 0x42, si no 0x22
	ld c,032h		;7f3e
	rra			;7f40
	ret c			;7f41
	ld c,052h		;7f42
	rra			;7f44
	ret c			;7f45
	ld c,042h		;7f46
	rra			;7f48
	ret c			;7f49
	ld c,022h		;7f4a
	ret			;7f4c
L_7F4D:
	ld hl,0ed00h		;7f4d   ; la cuenta de 0xED00; con 0xE33C al paso 3...
	ld a,(0e33ch)		;7f50
	or a			;7f53
	jr z,L_7F5C		;7f54
L_7F56:
	ld hl,0ece6h		;7f56   ; apunta a el paso de la defensa del ordenador
	ld (hl),003h		;7f59
	ret			;7f5b
L_7F5C:
	dec (hl)			;7f5c
	ret nz			;7f5d
	xor a			;7f5e   ; ...al acabar, empieza a buscar al mas cerca (p14:8081)
	ld (0ed25h),a		;7f5f
	call 08081h		;7f62
	ld (0ed26h),hl		;7f65
	ld a,010h		;7f68
	ld (0ed24h),a		;7f6a
	jp L_7BBE		;7f6d
L_7F70:
	ld a,(0e33ch)		;7f70   ; de 16 en 16 por los 9 defensores sin destino (IX+13 = 0)...
	or a			;7f73
	jr nz,L_7F56		;7f74
	ld a,(0ed24h)		;7f76
	cp 090h		;7f79
	jr nc,L_7FAF		;7f7b
	ld e,a			;7f7d
	ld d,000h		;7f7e
	ld ix,0e271h		;7f80   ; apunta a las 9 fichas de 16 bytes de los defensores
	add ix,de		;7f84
	ld a,(ix+00dh)		;7f86   ; lee la base de destino (nibble alto; 2 abajo: llegado)
	or a			;7f89
	jr nz,L_7FA6		;7f8a
	call 0808ah		;7f8c   ; ...la distancia (p14:808A)...
	ld b,h			;7f8f
	ld c,l			;7f90
	ld de,(0ed26h)		;7f91
	sbc hl,de		;7f95
	rl h		;7f97
	jr nc,L_7FA6		;7f99
	ld (0ed26h),bc		;7f9b   ; ...la menor en 0xED26 y quien en 0xED25
	ld hl,0ed24h		;7f9f
	ld a,(hl)			;7fa2
	ld (0ed25h),a		;7fa3
L_7FA6:
	ld a,(0ed24h)		;7fa6
	add a,010h		;7fa9
	ld (0ed24h),a		;7fab
	ret			;7fae
L_7FAF:
	ld a,(0ed25h)		;7faf   ; al acabar: el defensor elegido (0xE22B) y al paso siguiente
	ld (0e22bh),a		;7fb2   ; guarda el defensor que va a por la pelota (desplazamiento de 16 en 16)
	jp L_7BBE		;7fb5
L_7FB8:
	call 081f1h		;7fb8   ; va a por la pelota: p14:81F1, p14:8115, el defensor y su direccion
	call 08115h		;7fbb
	call L_7D34		;7fbe
	call L_7D27		;7fc1
	ld de,(0e213h)		;7fc4   ; lee la y de la pelota (vertical) y el byte siguiente (16 bits)
	call L_7C73		;7fc8
	ld de,(0e218h)		;7fcb   ; lee la x de la pelota y el byte siguiente (16 bits)
	call L_7C56		;7fcf
	ld a,(0e33ch)		;7fd2   ; con 0xE33C, al paso 3
	or a			;7fd5
	ret z			;7fd6
	jp L_7F56		;7fd7
L_7FDA:
	ld a,(0ece6h)		;7fda   ; con 0xED0A y sin el paso 9, al paso 8
	cp 009h		;7fdd
	ret z			;7fdf
	ld a,(0ed0ah)		;7fe0
	or a			;7fe3
	ret z			;7fe4
	ld a,008h		;7fe5
	ld (0ece6h),a		;7fe7   ; guarda el paso de la defensa del ordenador
	ret			;7fea
L_7FEB:
	xor a			;7feb   ; sin mando, y segun quien tiene la pelota...
	ld (0e19fh),a		;7fec   ; guarda el mando del que defiende o lanza (bits 0-3 direccion, 4 y 5 botones)
	ld a,(0e220h)		;7fef   ; lee el defensor que tiene la pelota (1-9; 0 nadie)
	or a			;7ff2
	jr z,$+28		;7ff3
	cp 003h		;7ff5
	jr nc,$+24		;7ff7
	dec a			;7ff9
	ld a,006h		;7ffa
	ld (0ed00h),a		;7ffc

; ----------------------------------------------------------------------
; DATOS partida_7FFF: los 1 primeros bytes de una instruccion de 3 (CA BE 7B)
;   que sigue en el banco 2: el trazador de un solo banco no puede verla
;   entera (tools/bancos.py); lo leen p01:7FFF (1 bytes)
;   0x7fff..0x8000  (1 bytes)
DATA_partida_7FFF:
	defb 0cah	; 7fff
