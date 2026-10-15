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
; DATOS resto_4000: lo apuntan con el banco puesto p02:86FD (0x4001), p13:70D0
;   (0x4010), p13:70DA (0x4011), p00:536D (0x4020), p01:6902 (0x4020),
;   p03:B2DA (0x4020); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p02:86FD, p13:70D0, p13:70DA, p00:536D, p01:6902,
;   p03:B2DA (48 bytes)
;   0x4000..0x4030  (48 bytes)
DATA_resto_4000:
	defb 041h,042h,0f0h,040h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 4000  AB.@............
	defb 045h,046h,007h,057h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 4010  EF.W............
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,081h,001h,001h,002h,080h,0f6h,0ffh,0ffh	; 4020  ................

; ======================================================================
; CODIGO 0x4030..0x4494  (1124 bytes)
; ======================================================================


L_4030:
	call bancos_1_2_3		;4030   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	call 0a27ah		;4033   ; fila_en_blanco: una fila en blanco: 0x68 x 8 de color 0 en DE
	jp bancos_13_14_15		;4036   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
L_4039:
	call bancos_1_2_3		;4039   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	call 084d5h		;403c
	jp bancos_13_14_15		;403f   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
L_4042:
	call bancos_1_2_3		;4042   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	call 0a1f6h		;4045   ; orden_valido: el orden DE vale? sin huecos y un solo lanzador; carry si no
	jp bancos_13_14_15		;4048   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
L_404B:
	call bancos_1_2_3		;404b   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	call 0ab94h		;404e
	jp bancos_13_14_15		;4051   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
L_4054:
	call bancos_1_2_3		;4054   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	call 0a218h		;4057   ; jugador_del_puesto: el jugador del puesto A del orden BC, en su fila
	jp bancos_13_14_15		;405a   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
L_405D:
	call bancos_1_2_3		;405d   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	call 0a452h		;4060
	jp bancos_13_14_15		;4063   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
L_4066:
	call bancos_1_2_3		;4066   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	call 0a220h		;4069   ; jugador_a: el jugador A en su fila (0 en blanco, 1-12 de campo, 13 o mas lanzador)
	jp bancos_13_14_15		;406c   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
L_406F:
	call bancos_1_2_3		;406f   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	call 0aa74h		;4072
	jp bancos_13_14_15		;4075   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
L_4078:
	call bancos_1_2_3		;4078   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	call calla_y_espera		;407b   ; calla_y_espera: calla la musica (0x81) y apunta la siguiente en 0xED9A
	jp bancos_13_14_15		;407e   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
L_4081:
	call bancos_1_2_3		;4081   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	call 09149h		;4084
	jp bancos_13_14_15		;4087   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
L_408A:
	call bancos_1_2_3		;408a   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	call 06770h		;408d
	jp bancos_13_14_15		;4090   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
L_4093:
	call bancos_1_2_3		;4093   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	call L_4448		;4096
	jp bancos_13_14_15		;4099   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
L_409C:
	call bancos_1_2_3		;409c   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	call multiplica		;409f   ; multiplica: HL = A x E (8 x 8 bits)
	jp bancos_13_14_15		;40a2   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
L_40A5:
	call bancos_1_2_3		;40a5   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	call L_51DF		;40a8
	jp bancos_13_14_15		;40ab   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
L_40AE:
	call bancos_1_2_3		;40ae   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	call 062f7h		;40b1   ; bateador_mas: un bateador mas: en 0xE1A1 = 3, solo la primera vez (0xEDD4)
	jp bancos_13_14_15		;40b4   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
L_40B7:
	call bancos_1_2_3		;40b7   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	call dibujo_64		;40ba   ; dibujo_64: el dibujo de 64 bytes A (p11:8759 + 64 A)
	jp bancos_13_14_15		;40bd   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
L_40C0:
	call bancos_1_2_3		;40c0   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	call 0b11fh		;40c3
	jp bancos_13_14_15		;40c6   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
L_40C9:
	call bancos_1_2_3		;40c9   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	call 0619fh		;40cc
	jp bancos_13_14_15		;40cf   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
velocidad_hacia:		; con los bancos 7-8-9, la velocidad de HL (x, y) a DE (p00:5E9F); vuelve a 13-14-15
	call bancos_7_8_9		;40d2   ; bancos_7_8_9: pone los bancos 7, 8 y 9 (los graficos) y sus copias
	call L_5E9F		;40d5
	jp bancos_13_14_15		;40d8   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
colores_de_sprites_13:		; los colores de los 32 sprites (p00:5B1F) y vuelve a los bancos 13-14-15
	call colores_de_sprites		;40db   ; colores_de_sprites: los colores de los 32 sprites: compara el indice (4.o byte) de cada atributo y descomprime los que cambian (p09:BC05)
	jp bancos_13_14_15		;40de   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
carga_la_fuente_13:		; carga la fuente (p00:5991) y vuelve a los bancos 13-14-15
	call carga_la_fuente		;40e1   ; carga_la_fuente: carga la fuente: 161 caracteres de un bit (0xFAF6 = 1 mientras tanto)
	jp bancos_13_14_15		;40e4   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
L_40E7:
	call bancos_13_14_15		;40e7   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 0968ah		;40ea
	jp bancos_1_2_3		;40ed   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
init:		; INIT de la cabecera: deja en H.STKE (0xFEDA) un rst 0x30 con el slot del cartucho y 0x4102
	di			;40f0
	call slot_del_cartucho		;40f1   ; slot_del_cartucho: A = el slot de la pagina 1 (el cartucho) en el formato de ENASLT; lo apunta en 0xD2AA
	di			;40f4
	ld h,a			;40f5
	ld l,0f7h		;40f6
	ld (0fedah),hl		;40f8
	ld hl,arranque		;40fb
	ld (0fedch),hl		;40fe
	ret			;4101
arranque:		; la puesta en marcha (desde H.STKE): pila en 0xD280, RAM a cero, bancos 0-1-2-3, H.TIMI a 0x418E y a esperar en `jr $`
	di			;4102
	im 1		;4103
	ld sp,0d280h		;4105   ; la ficha de 0xD280 (nombre de 5 letras, 8 ceros y 4 bytes; p13:71B8)
	ld hl,084d4h		;4108   ; 0xF323 (DISKVE, el gestor de errores de disco) = 0x84D4
	ld (0f323h),hl		;410b   ; guarda DISKVE: la rutina de errores del disco y el byte siguiente (16 bits)
	ld hl,0e280h		;410e   ; guarda la zona del disco (0xE280-0xF37F) en 0xC000: el juego usa esa RAM y p14:8334 la devuelve para el BDOS...
	ld bc,01100h		;4111
	ld de,0c000h		;4114
	ldir		;4117   ; ...de una vez
	ld hl,0f100h		;4119   ; ...y 0xF100-0xF37F en 0xD780
	ld de,0d780h		;411c
	ld bc,00280h		;411f
	ldir		;4122
	ld hl,0fd9fh		;4124   ; guarda el gancho H.TIMI de la BIOS (5 bytes) en 0xD2AB...
	ld de,0d2abh		;4127
	ld bc,00005h		;412a
	ldir		;412d
	ld a,0c9h		;412f   ; ...y lo deja en `ret` mientras arranca
	ld (0fd9fh),a		;4131   ; guarda el gancho H.TIMI de la BIOS (0xC3 = jp a la interrupcion del juego, 0xC9 = ret)
	call cartucho_en_pagina_2		;4134   ; el cartucho tambien en 0x8000-0xBFFF (p00:43EC: ENASLT con H = 0x80)
	call slot_del_cartucho		;4137   ; slot_del_cartucho: A = el slot de la pagina 1 (el cartucho) en el formato de ENASLT; lo apunta en 0xD2AA
	xor a			;413a   ; A = 0 para los borrados de abajo
	ld (0dd90h),a		;413b
	ld hl,0d380h		;413e   ; la RAM 0xD380-0xD75A a cero
	ld de,0d381h		;4141
	ld bc,003dah		;4144
	ld (hl),a			;4147
	ldir		;4148
	ld hl,0de00h		;414a   ; apunta a el estado del juego (indice del despachador principal)
	ld de,0de01h		;414d   ; apunta a el paso dentro del estado
	ld bc,011fbh		;4150   ; y 0xDE00-0xEFFB, la del juego y la del sonido
	ld (hl),a			;4153
	ldir		;4154
	ld (0dde0h),a		;4156
	xor a			;4159   ; el mapper en su reparto de encendido: 0 en 0x4000...
	ld hl,0ddf0h		;415a   ; apunta a la copia del banco de 0x4000 (0)
	ld (05000h),a		;415d   ; el mapper: pone en 0x4000 el banco de A
	ld (hl),a			;4160
	inc hl			;4161
	inc a			;4162   ; ...1 en 0x6000...
	ld (07000h),a		;4163   ; el mapper: pone en 0x6000 el banco de A
	ld (hl),a			;4166
	inc hl			;4167
	inc a			;4168   ; ...2 en 0x8000...
	ld (09000h),a		;4169   ; el mapper: pone en 0x8000 el banco de A
	ld (hl),a			;416c
	inc hl			;416d
	inc a			;416e   ; ...y 3 en 0xA000
	ld (hl),a			;416f
	ld (0b000h),a		;4170   ; el mapper: pone en 0xA000 el banco de A
	call 065beh		;4173   ; sonido, SCREEN 5, borde, registros del VDP y paleta (p01:65BE)
	di			;4176
	ld hl,0ed0fh		;4177   ; el contador de cuadros de 0xED0F a cero
	ld (hl),000h		;417a
	ld a,0c3h		;417c   ; H.TIMI = jp interrupcion: desde aqui el juego corre en la interrupcion
	ld (0fd9fh),a		;417e   ; guarda el gancho H.TIMI de la BIOS (0xC3 = jp a la interrupcion del juego, 0xC9 = ret)
	ld hl,interrupcion		;4181
	ld (0fda0h),hl		;4184
	xor a			;4187   ; 0xF3DB (CLIKSW) = 0: sin el clic de las teclas
	ld (0f3dbh),a		;4188
	ei			;418b   ; y a esperar
L_418C:
	jr L_418C		;418c
interrupcion:		; H.TIMI: lee el estado del VDP, el sonido con 4-5-6 (p04:6009) y, si no esta ya en marcha (0xDE05), el cuadro del juego
	call 0013eh		;418e   ; BIOS RDVDP - Reads VDP status register | lo primero: H.TIMI deja leido el estado del VDP; la BIOS lo vuelve a pedir (0x013E: RDVDP)
	ld a,(0de05h)		;4191   ; si ya hay un cuadro en marcha no se entra
	or a			;4194
	jr nz,L_41B0		;4195
	ld a,002h		;4197   ; el estado 2 del VDP...
	call lee_estado		;4199   ; lee_estado: A = el registro de estado A del VDP (R#15)
	rra			;419c   ; ...bit 0 (CE): el VDP aun esta con una orden
	jr c,L_41B0		;419d
	ld hl,0de05h		;419f   ; apunta a las marcas de la interrupcion (bit 0: cuadro en marcha, bit 1: sonido, bit 2: lectura del VDP)
	set 2,(hl)		;41a2   ; marca: copiando sprites
	call sprites_a_vram		;41a4   ; los atributos y colores de sprite de la RAM a la VRAM (p00:422A)
	ld hl,0de05h		;41a7   ; apunta a las marcas de la interrupcion (bit 0: cuadro en marcha, bit 1: sonido, bit 2: lectura del VDP)
	res 2,(hl)		;41aa
	ld hl,0ed0fh		;41ac   ; un cuadro mas
	inc (hl)			;41af
L_41B0:
	di			;41b0
	ld hl,0de05h		;41b1   ; apunta a las marcas de la interrupcion (bit 0: cuadro en marcha, bit 1: sonido, bit 2: lectura del VDP)
	bit 1,(hl)		;41b4   ; si el sonido ya esta sonando (interrupcion dentro de otra), se salta
	jp nz,L_420E		;41b6
	set 1,(hl)		;41b9   ; marca: sonido en marcha
	di			;41bb
	ld a,004h		;41bc   ; los bancos del sonido, 4-5-6, sin tocar las copias de 0xDDF1-0xDDF3
	ld (07000h),a		;41be   ; el mapper: pone en 0x6000 el banco de A
	inc a			;41c1
	ld (09000h),a		;41c2   ; el mapper: pone en 0x8000 el banco de A
	inc a			;41c5
	ld (0b000h),a		;41c6   ; el mapper: pone en 0xA000 el banco de A
	call sonidos_del_partido		;41c9   ; en el partido (estado 5-4): sonidos de fondo y la tecla F5 (p00:5DC4)
	call 06009h		;41cc   ; el motor de sonido de este cuadro (p04:6009 -> p06:B41E)
	ld hl,0de05h		;41cf   ; apunta a las marcas de la interrupcion (bit 0: cuadro en marcha, bit 1: sonido, bit 2: lectura del VDP)
	res 1,(hl)		;41d2
	di			;41d4
	ld a,(0ddf1h)		;41d5   ; devuelve los bancos que habia, leidos de sus copias
	ld (07000h),a		;41d8   ; el mapper: pone en 0x6000 el banco de A
	ld a,(0ddf2h)		;41db   ; lee la copia del banco de 0x8000
	ld (09000h),a		;41de   ; el mapper: pone en 0x8000 el banco de A
	ld a,(0ddf3h)		;41e1   ; lee la copia del banco de 0xA000
	ld (0b000h),a		;41e4   ; el mapper: pone en 0xA000 el banco de A
	ld hl,0de05h		;41e7   ; apunta a las marcas de la interrupcion (bit 0: cuadro en marcha, bit 1: sonido, bit 2: lectura del VDP)
	ld a,(hl)			;41ea   ; si no habia cuadro en marcha...
	or a			;41eb
	jp nz,L_420E		;41ec
	inc (hl)			;41ef   ; ...se lanza uno
	ei			;41f0   ; con las interrupciones abiertas: el cuadro puede durar mas de uno
	ld hl,(0fda0h)		;41f1   ; guarda el gancho H.TIMI...
	ld (0dd9eh),hl		;41f4
	ld hl,interrupcion		;41f7   ; ...y lo deja en esta rutina por si el cuadro cambia el gancho
	ld (0fda0h),hl		;41fa
	call 065f0h		;41fd   ; lee el mando y el teclado (p01:65F0)
	call cuadro_del_juego		;4200   ; el cuadro del juego: el estado de 0xDE00 (p00:4480)
	ld hl,(0dd9eh)		;4203   ; vuelve a poner el gancho de antes
	ld (0fda0h),hl		;4206
	ld hl,0de05h		;4209   ; apunta a las marcas de la interrupcion (bit 0: cuadro en marcha, bit 1: sonido, bit 2: lectura del VDP)
	res 0,(hl)		;420c   ; cuadro acabado
L_420E:
	call L_4428		;420e
	call 0013eh		;4211   ; BIOS RDVDP - Reads VDP status register
	ei			;4214
	ret			;4215
hl_mas_a:		; HL = HL + A
	add a,l			;4216
	ld l,a			;4217
	ret nc			;4218
	inc h			;4219
	ret			;421a
de_mas_a:		; DE = DE + A
	add a,e			;421b
	ld e,a			;421c
	ret nc			;421d
	inc d			;421e
	ret			;421f
despacha:		; salta a la palabra A de la tabla que va pegada detras del `call`
	pop hl			;4220
	add a,a			;4221
	call hl_mas_a		;4222   ; hl_mas_a: HL = HL + A
	ld e,(hl)			;4225
	inc hl			;4226
	ld d,(hl)			;4227
	ex de,hl			;4228
	jp (hl)			;4229
sprites_a_vram:		; si 0xED09 lo pide, copia los colores (0xDF00) y los atributos (0xE100) de sprite a la VRAM 0xF400 / 0xF600
	ld hl,0ed09h		;422a   ; 0xED09 dice que copiar: 1 solo los colores, 2 todo con rotacion
	ld a,(hl)			;422d
	or a			;422e
	ret z			;422f
	ld (hl),000h		;4230   ; ya pedido: se borra la peticion
	dec a			;4232
	jr nz,L_4245		;4233
L_4235:
	ld hl,0df00h		;4235   ; 1: los colores de sprite (0xDF00, 0x280 bytes) a la VRAM 0xF400...
	ld de,0f400h		;4238
	ld bc,00280h		;423b
	call copia_a_vram		;423e   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	call espera_vdp		;4241   ; ...y se espera al VDP
	ret			;4244
L_4245:
	ld ix,0ed05h		;4245   ; IX+0 cuenta los trozos copiados por rotacion
	ld (ix+000h),000h		;4249
	ld de,0e341h		;424d   ; el apunte de los trozos (0xE340-0xE35F) a cero
	ld hl,0e340h		;4250   ; apunta a variable de paso (cada rutina la usa a su manera)
	ld bc,0001fh		;4253
	ld (hl),000h		;4256
	ldir		;4258
	di			;425a
	ld hl,0df00h		;425b   ; los colores de los sprites 0-3 (64 bytes)...
	ld de,0f400h		;425e
	ld bc,00040h		;4261
	call copia_a_vram		;4264   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	ld hl,0e060h		;4267   ; ...0xE060-0xE0FF a la VRAM 0xF560 (los colores de los 10 sprites fijos de abajo)
	ld de,0f560h		;426a
	ld bc,000a0h		;426d
	call copia_a_vram		;4270   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	ld hl,0e100h		;4273   ; los atributos de los sprites 0-3, que no rotan
	ld de,0f600h		;4276
	ld bc,00010h		;4279
	call copia_a_vram		;427c   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	ld hl,0e158h		;427f   ; y los de 0xE158 en adelante (10 sprites), que tampoco
	ld de,0f658h		;4282
	ld bc,00028h		;4285   ; 40 bytes (10 atributos)
	call copia_a_vram		;4288   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	ld hl,0ece5h		;428b   ; la rotacion: 0xECE5 cuenta hacia atras...
	dec (hl)			;428e
	ld a,(hl)			;428f
	or a			;4290
	jr nz,L_42A1		;4291   ; sin llegar a 0, sigue
	ld a,(0e1a2h)		;4293   ; lee el desplazamiento de la pantalla, 16 bits (en TEAM EDIT, la fila elegida)
	cp 078h		;4296   ; con el desplazamiento por debajo de 0x78, 9; si no, 10
	ld a,009h		;4298
	jr c,L_429D		;429a
	inc a			;429c
L_429D:
	ld (0ed04h),a		;429d   ; 0xED04 = cuantos sprites rotan
	ld (hl),a			;42a0   ; la cuenta otra vez
L_42A1:
	ld a,(0ed04h)		;42a1   ; primer trozo: los atributos desde el sprite 4 + (0xECE5 - 1)...
	ld e,a			;42a4
	ld a,(0ece5h)		;42a5   ; lee la rotacion de sprites de este cuadro
	dec a			;42a8   ; D = la rotacion - 1
	ld d,a			;42a9
	neg		;42aa   ; E - D: los sprites del primer trozo
	add a,e			;42ac
	ld l,a			;42ad
	ld h,000h		;42ae   ; x 8: BC = los bytes
	add hl,hl			;42b0
	add hl,hl			;42b1
	add hl,hl			;42b2
	ld b,h			;42b3
	ld c,l			;42b4
	ld l,d			;42b5   ; HL = D x 8...
	ld h,000h		;42b6
	add hl,hl			;42b8
	add hl,hl			;42b9
	add hl,hl			;42ba
	ld de,0e110h		;42bb   ; ...de 0xE110 en adelante...
	add hl,de			;42be   ; ...desde 0xE110
	ld de,0f610h		;42bf   ; ...a la VRAM desde 0xF610
	ld (0e340h),a		;42c2   ; apunta el trozo en 0xE340 (para depurar o rehacer)
	ld (0e341h),bc		;42c5
	ld (0e343h),de		;42c9
	ld (0e345h),hl		;42cd
	call copia_a_vram		;42d0   ; copia el primer trozo
	ld a,(0ece5h)		;42d3   ; si la rotacion no esta en 1, queda el segundo trozo: lo que da la vuelta
	dec a			;42d6
	jr z,L_4309		;42d7   ; en 1, no hay segundo
	ld d,a			;42d9
	ld l,a			;42da
	ld h,000h		;42db   ; HL = (rotacion - 1) x 8: los bytes del segundo
	add hl,hl			;42dd
	add hl,hl			;42de
	add hl,hl			;42df
	ld b,h			;42e0
	ld c,l			;42e1
	ld a,(0ed04h)		;42e2   ; lee cuantos sprites rotan (9 o 10)
	ld e,a			;42e5
	ld a,d			;42e6   ; E - D
	neg		;42e7
	add a,e			;42e9
	ld l,a			;42ea   ; x 8 + 0xF610: su sitio en la VRAM
	ld h,000h		;42eb
	add hl,hl			;42ed
	add hl,hl			;42ee
	add hl,hl			;42ef
	ld de,0f610h		;42f0   ; ...a su sitio de la VRAM
	add hl,de			;42f3
	ex de,hl			;42f4
	ld hl,0e110h		;42f5   ; desde 0xE110
	ld (0e348h),a		;42f8   ; apunta el trozo en 0xE348
	ld (0e349h),bc		;42fb
	ld (0e34bh),de		;42ff
	ld (0e34dh),hl		;4303
	call copia_a_vram		;4306   ; copia el segundo trozo
L_4309:
	ld a,(0ed04h)		;4309   ; lo mismo con los colores (16 bytes por sprite): el primer trozo...
	ld e,a			;430c
	ld a,(0ece5h)		;430d   ; lee la rotacion de sprites de este cuadro
	dec a			;4310
	ld d,a			;4311
	neg		;4312   ; E - D
	add a,e			;4314
	ld l,a			;4315   ; x 32: los bytes de colores
	ld h,000h		;4316
	add hl,hl			;4318
	add hl,hl			;4319
	add hl,hl			;431a
	add hl,hl			;431b
	add hl,hl			;431c
	ld b,h			;431d
	ld c,l			;431e
	ld l,d			;431f   ; D x 32...
	ld h,000h		;4320
	add hl,hl			;4322
	add hl,hl			;4323
	add hl,hl			;4324
	add hl,hl			;4325
	add hl,hl			;4326
	ld de,0df40h		;4327   ; ...desde 0xDF40
	add hl,de			;432a
	ld de,0f440h		;432b   ; ...a la VRAM 0xF440
	ld (0e350h),a		;432e   ; apunta el trozo en 0xE350
	ld (0e351h),bc		;4331
	ld (0e353h),de		;4335
	ld (0e355h),hl		;4339
	call copia_a_vram		;433c   ; copia los colores del primer trozo
	ld a,(0ece5h)		;433f   ; y el segundo, si lo hay
	dec a			;4342
	jr z,L_4379		;4343   ; en 1, no hay segundo
	ld d,a			;4345
	ld l,a			;4346
	ld h,000h		;4347   ; x 32: los bytes
	add hl,hl			;4349
	add hl,hl			;434a
	add hl,hl			;434b
	add hl,hl			;434c
	add hl,hl			;434d
	ld b,h			;434e
	ld c,l			;434f
	ld a,(0ed04h)		;4350   ; lee cuantos sprites rotan (9 o 10)
	ld e,a			;4353
	ld a,d			;4354   ; E - D...
	neg		;4355
	add a,e			;4357
	ld l,a			;4358   ; ...x 32 + 0xF440
	ld h,000h		;4359
	add hl,hl			;435b
	add hl,hl			;435c
	add hl,hl			;435d
	add hl,hl			;435e
	add hl,hl			;435f
	ld de,0f440h		;4360
	add hl,de			;4363
	ex de,hl			;4364
	ld hl,0df40h		;4365   ; desde 0xDF40
	ld (0e358h),a		;4368   ; apunta el trozo en 0xE358
	ld (0e359h),bc		;436b
	ld (0e35bh),de		;436f
	ld (0e35dh),hl		;4373
	call L_4384		;4376   ; copia los colores del segundo trozo
L_4379:
	ld a,(ix+000h)		;4379   ; (sin efecto: A se cambia en seguida)
	ld a,(0ece5h)		;437c   ; 0xE347 = la rotacion de este cuadro
	ld (0e347h),a		;437f
	ei			;4382   ; interrupciones otra vez
	ret			;4383
L_4384:
	ld a,(0ece5h)		;4384   ; la rotacion en curso
	inc (ix+000h)		;4387   ; un trozo mas
	jp copia_a_vram		;438a   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
bancos_1_2_3:		; pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	push af			;438d
	ld a,001h		;438e   ; el 1
	jr L_43A2		;4390
bancos_7_8_9:		; pone los bancos 7, 8 y 9 (los graficos) y sus copias
	push af			;4392
	ld a,007h		;4393   ; el 7
	jr L_43A2		;4395
bancos_10_11_12:		; pone los bancos 10, 11 y 12 (los graficos) y sus copias
	push af			;4397
	ld a,00ah		;4398   ; el 10
	jr L_43A2		;439a
guarda_y_13_14_15:		; guarda el reparto en 0xED46-0xED48 (p00:43D9) y pone 13, 14 y 15
	call guarda_reparto		;439c   ; guarda_reparto: copia 0xDDF1-0xDDF3 a 0xED46-0xED48
bancos_13_14_15:		; pone los bancos 13, 14 y 15 y sus copias
	push af			;439f
	ld a,00dh		;43a0   ; el 13
L_43A2:
	di			;43a2   ; sin interrupciones mientras se cambian
	push hl			;43a3
	ld hl,0ddf1h		;43a4   ; apunta a la copia del banco de 0x6000
	ld (07000h),a		;43a7   ; el mapper: pone en 0x6000 el banco de A
	ld (hl),a			;43aa   ; y su copia
	inc a			;43ab   ; el siguiente en 0x8000
	inc l			;43ac
	ld (09000h),a		;43ad   ; el mapper: pone en 0x8000 el banco de A
	ld (hl),a			;43b0   ; y su copia
	inc a			;43b1   ; el siguiente en 0xA000
	inc l			;43b2
	ld (0b000h),a		;43b3   ; el mapper: pone en 0xA000 el banco de A
	ld (hl),a			;43b6   ; y su copia
	pop hl			;43b7
	pop af			;43b8
	ei			;43b9   ; interrupciones otra vez
	ret			;43ba
devuelve_reparto:		; vuelve a poner el reparto guardado en 0xED46-0xED48
	di			;43bb   ; sin interrupciones
	ld a,(0ed46h)		;43bc   ; lee el reparto guardado por p00:439C (3 bytes)
	ld (07000h),a		;43bf   ; el mapper: pone en 0x6000 el banco de A
	ld (0ddf1h),a		;43c2   ; guarda la copia del banco de 0x6000
	ld a,(0ed47h)		;43c5
	ld (09000h),a		;43c8   ; el mapper: pone en 0x8000 el banco de A
	ld (0ddf2h),a		;43cb   ; guarda la copia del banco de 0x8000
	ld a,(0ed48h)		;43ce
	ld (0b000h),a		;43d1   ; el mapper: pone en 0xA000 el banco de A
	ld (0ddf3h),a		;43d4   ; guarda la copia del banco de 0xA000
	ei			;43d7   ; interrupciones otra vez
	ret			;43d8
guarda_reparto:		; copia 0xDDF1-0xDDF3 a 0xED46-0xED48
	ld a,(0ddf1h)		;43d9   ; lee la copia del banco de 0x6000
	ld (0ed46h),a		;43dc   ; guarda el reparto guardado por p00:439C (3 bytes)
	ld a,(0ddf2h)		;43df   ; lee la copia del banco de 0x8000
	ld (0ed47h),a		;43e2   ; a 0xED47
	ld a,(0ddf3h)		;43e5   ; lee la copia del banco de 0xA000
	ld (0ed48h),a		;43e8   ; a 0xED48
	ret			;43eb
cartucho_en_pagina_2:		; pone el slot del cartucho tambien en 0x8000-0xBFFF (ENASLT con H = 0x80)
	call 00138h		;43ec   ; BIOS RSLREG - Reads the primary slot register
	rrca			;43ef   ; el slot primario de la pagina 1...
	rrca			;43f0
	and 003h		;43f1
	ld c,a			;43f3
	ld b,000h		;43f4   ; BC = el slot
	ld hl,0fcc1h		;43f6   ; ...y su marca de expandido (0xFCC1 + slot)
	add hl,bc			;43f9
	ld a,(hl)			;43fa
	and 080h		;43fb   ; el bit 7: expandido
	or c			;43fd
	ld c,a			;43fe   ; C = el slot con su marca
	inc hl			;43ff
	inc hl			;4400   ; el subslot, de 0xFCC5 + slot
	inc hl			;4401
	inc hl			;4402
	ld a,(hl)			;4403   ; el subslot (bits 2-3)
	and 00ch		;4404
	or c			;4406
	ld h,080h		;4407   ; H = 0x80: la pagina 2
	jp 00024h		;4409   ; BIOS ENASLT - Switches to specified slot and page definitively | ENASLT
slot_del_cartucho:		; A = el slot de la pagina 1 (el cartucho) en el formato de ENASLT; lo apunta en 0xD2AA
	call 00138h		;440c   ; BIOS RSLREG - Reads the primary slot register
	rrca			;440f   ; el slot primario de la pagina 1 (la del cartucho)
	rrca			;4410
	and 003h		;4411
	ld c,a			;4413
	ld b,000h		;4414
	ld hl,0fcc1h		;4416   ; ...con su marca de expandido (0xFCC1 + slot)
	add hl,bc			;4419
	or (hl)			;441a   ; con la marca del slot
	ld c,a			;441b
	inc hl			;441c
	inc hl			;441d
	inc hl			;441e
	inc hl			;441f
	ld a,(hl)			;4420   ; el subslot, de 0xFCC5 + slot
	and 00ch		;4421   ; bits 2-3
	or c			;4423
	ld (0d2aah),a		;4424   ; apunta el slot en 0xD2AA
	ret			;4427
L_4428:
	ld hl,0ed4ah		;4428   ; el reloj de juego: 0xED4A cuenta cuadros hasta 60...
	call L_4455		;442b   ; 60 cuadros: un segundo
	ret c			;442e
	inc hl			;442f   ; ...0xED4B los segundos hasta 60...
	call L_4455		;4430   ; 60 segundos: un minuto
	ret c			;4433
	call L_445E		;4434   ; ...0xED4C y 0xED4D los minutos en dos cifras...
	ret c			;4437
	inc hl			;4438
	inc (hl)			;4439   ; ...0xED4E las horas hasta 6...
	ld a,(hl)			;443a
	cp 006h		;443b   ; 6 horas
	ret c			;443d
	ld (hl),000h		;443e
	call L_445E		;4440   ; ...y 0xED4F-0xED50 lo que pasa de ahi
	ret c			;4443
	call L_445E		;4444
	ret c			;4447
L_4448:
	ld hl,00000h		;4448   ; el reloj de juego a cero
	ld (0ed4ah),hl		;444b   ; guarda el reloj de juego: cuadros (0-59) y el byte siguiente (16 bits)
	ld (0ed4ch),hl		;444e   ; guarda el reloj de juego: minutos, cifra baja y el byte siguiente (16 bits)
	ld (0ed4eh),hl		;4451   ; guarda el reloj de juego: horas y el byte siguiente (16 bits)
	ret			;4454
L_4455:
	inc (hl)			;4455   ; una cifra del reloj que cuenta hasta 60: carry si no ha dado la vuelta
	ld a,(hl)			;4456
	cp 03ch		;4457   ; hasta 60
	ret c			;4459
	ld (hl),000h		;445a   ; vuelve a 0, sin carry
	or a			;445c
	ret			;445d
L_445E:
	inc hl			;445e   ; la cifra siguiente, hasta 10: carry si no ha dado la vuelta
	inc (hl)			;445f
	ld a,(hl)			;4460
	cp 00ah		;4461   ; hasta 10
	ret c			;4463
	ld (hl),000h		;4464   ; vuelve a 0, sin carry
	or a			;4466
	ret			;4467
L_4468:
	ld hl,0f680h		;4468   ; lee 32 bytes de la VRAM 0xF680 a 0xDDA0
	ld de,0dda0h		;446b
	ld bc,00020h		;446e
	call L_4A9C		;4471   ; p00:4A9C: leer la VRAM
	ld a,(0dda0h)		;4474   ; si los dos primeros son 0 vuelve con Z
	or a			;4477
	jr nz,L_447F		;4478
	ld a,(0dda1h)		;447a
	or a			;447d
	ret z			;447e
L_447F:
	ret			;447f   ; si no, NZ
cuadro_del_juego:		; el estado del juego: despacha 0xDE00 (y 0xDE01 dentro) por la tabla de p00:4494
	ld hl,0de03h		;4480   ; un cuadro mas (0xDE03, el reloj de las animaciones)
	inc (hl)			;4483
	ld bc,(0de00h)		;4484   ; C = el estado (0xDE00), B = el paso (0xDE01)
	ld a,c			;4488
	cp 003h		;4489   ; los estados 0-2 vuelven por p00:4A42 (la vuelta de la tabla)
	jr nc,L_4491		;448b
	ld hl,04a42h		;448d
	push hl			;4490
L_4491:
	call despacha		;4491   ; el estado A por la tabla de detras

; ----------------------------------------------------------------------
; DATOS tabla_4494: 10 destinos del despachador p00:4220 (call en p00:4491, el
;   indice en A): 44A8, 44FA, 4508, 4548, 45D2, 4611, 472A, 47B8, 4A16, 4A2D;
;   lo leen p00:4491 (20 bytes)
;   0x4494..0x44a8  (20 bytes)
DATA_tabla_4494:
	defw 044a8h,044fah,04508h,04548h,045d2h,04611h,0472ah,047b8h	; 4494	la tabla de los 10 estados del juego
	defw 04a16h,04a2dh	; 44a4  -> L_4A16 L_4A2D

; ======================================================================
; CODIGO 0x44a8..0x4c39  (1937 bytes)
; ======================================================================


L_44A8:
	djnz L_44C0		;44a8   ; estado 0, paso 0: p14:872E cada cuadro...
	call bancos_13_14_15		;44aa   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 0872eh		;44ad   ; el rotulo (p14:872E)
	call bancos_1_2_3		;44b0   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	ld a,(0de0fh)		;44b3   ; ...hasta que marque 0xDE0F...
	or a			;44b6
	ret z			;44b7   ; sin marcar, nada
	ld a,078h		;44b8   ; ...2 segundos de espera y al paso siguiente
	ld (0de04h),a		;44ba   ; guarda la cuenta atras del estado
	jp paso_siguiente		;44bd   ; paso_siguiente: al paso siguiente del estado (0xDE01 + 1)
L_44C0:
	djnz L_44CD		;44c0   ; paso 1: la espera
	ld hl,0de04h		;44c2   ; apunta a la cuenta atras del estado
	dec (hl)			;44c5
	ret nz			;44c6   ; hasta 0, nada
	xor a			;44c7   ; 0xECEF = 0
	ld (0ecefh),a		;44c8
	jr paso_siguiente		;44cb
L_44CD:
	djnz L_44E6		;44cd   ; paso 2: p15:BB87 cada cuadro...
	call bancos_13_14_15		;44cf   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 0bb87h		;44d2   ; la presentacion (p15:BB87)
	call bancos_1_2_3		;44d5   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	ld a,(0e1d1h)		;44d8   ; ...hasta que marque 0xE1D1...
	or a			;44db
	ret z			;44dc   ; sin marcar, nada
	ld a,02dh		;44dd   ; ...el sonido 0x2D y al estado 0, paso 0
	call sonido		;44df   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	xor a			;44e2
	jp L_45FA		;44e3   ; cuenta 0 y al estado siguiente (1, el menu) con el paso 0
L_44E6:
	ld a,001h		;44e6   ; paso 3: calla todo (sonido 1)...
	call sonido		;44e8   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	xor a			;44eb
	ld (0eff4h),a		;44ec   ; el tono libre a 0
	call borra_pantalla		;44ef   ; ...borra la pantalla, carga la fuente (p00:5991: 161 caracteres a la VRAM 0) y p03:B670
	call carga_la_fuente		;44f2   ; carga_la_fuente: carga la fuente: 161 caracteres de un bit (0xFAF6 = 1 mientras tanto)
	call 0b670h		;44f5   ; el menu de modos (p03:B670)
	jr paso_siguiente		;44f8
L_44FA:
	ld hl,0de04h		;44fa   ; estado 1: la espera del menu; al acabar...
	dec (hl)			;44fd   ; mientras cuenta, el menu (p01:6561); al acabar, la demostracion
	jp nz,06561h		;44fe
	xor a			;4501   ; ...el modo 0 (1PLAYER) y al estado siguiente
	ld (0e190h),a		;4502   ; guarda el modo de juego (0 1PLAYER, 1 2PLAYERS, 2 PENNANT, 3 TEAM EDIT, 4 WATCH, 5 MEDIA SELECT)
	jp L_45F8		;4505
L_4508:
	djnz L_452F		;4508   ; estado 2, paso 0: p15:AB40 cada cuadro...
	call bancos_13_14_15		;450a   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 0ab40h		;450d   ; la demostracion (p15:AB40)
	call bancos_1_2_3		;4510   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	ld a,(0e1a0h)		;4513   ; ...hasta que marque 0xE1A0 (el modo elegido)
	or a			;4516   ; sin acabar (0xE1A0), nada
	ret nz			;4517
	ld a,001h		;4518   ; el sonido de la eleccion (p00:5E80)
	call calla_y_espera		;451a   ; calla_y_espera: calla la musica (0x81) y apunta la siguiente en 0xED9A
vuelve_al_menu:		; el menu: estado, despachador de menus y paso a 0
	call 0650eh		;451d   ; el menu: deja el estado y el despachador del menu a 0...
	xor a			;4520
	ld (0d74ch),a		;4521   ; guarda el despachador de los menus (y 0xD74D)
	ld (0de00h),a		;4524   ; guarda el estado del juego (indice del despachador principal)
	ld a,020h		;4527   ; ...32 cuadros de espera...
	ld (0de04h),a		;4529   ; guarda la cuenta atras del estado
	jp paso_cero		;452c   ; ...y el paso a 0
L_452F:
	call borra_pantalla		;452f   ; paso 1: borra la pantalla, 17 caracteres a la VRAM 0xF818 (p00:52B5) y p15:AB1D
	call kanji_de_los_datos		;4532   ; kanji_de_los_datos: los 17 kanji de p09:B942 en la casilla (0xF8, 0x18) de la hoja: los codigos 0x7F-0x8F
	call bancos_13_14_15		;4535   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 0ab1dh		;4538   ; la demostracion se prepara (p15:AB1D)
	call bancos_1_2_3		;453b   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	ld a,020h		;453e   ; 32 cuadros de espera y al paso siguiente
L_4540:
	ld (0de04h),a		;4540   ; guarda la cuenta atras del estado
paso_siguiente:		; al paso siguiente del estado (0xDE01 + 1)
	ld hl,0de01h		;4543   ; al paso siguiente
	inc (hl)			;4546
	ret			;4547
L_4548:
	djnz L_457D		;4548   ; paso 2: la cuenta atras con el nombre del modo...
	ld hl,0de04h		;454a   ; apunta a la cuenta atras del estado
	dec (hl)			;454d
	jr z,paso_siguiente		;454e   ; acabada: al paso siguiente
	ld a,(0e190h)		;4550   ; ...elegido en 0xE190: 1PLAYER...
	ld de,07d9fh		;4553
	or a			;4556
	jr z,L_4574		;4557
	ld de,07da9h		;4559   ; ...2PLAYERS...
	dec a			;455c
	jr z,L_4574		;455d
	ld de,07db4h		;455f   ; ...PENNANT...
	dec a			;4562
	jr z,L_4574		;4563
	ld de,07dbeh		;4565   ; ...TEAM EDIT...
	dec a			;4568
	jr z,L_4574		;4569
	ld de,07dcah		;456b   ; ...WATCH...
	dec a			;456e
	jr z,L_4574		;456f
	ld de,07dd2h		;4571   ; ...o MEDIA SELECT
L_4574:
	bit 2,(hl)		;4574   ; parpadea: el bit 2 de la cuenta elige pintarlo o borrarlo
	ex de,hl			;4576   ; HL = el texto
	jp z,texto		;4577   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	jp texto_c0		;457a   ; texto_c0: como texto, con C = 0
L_457D:
	djnz L_459D		;457d   ; paso 3: MEDIA SELECT (modo 5) va aparte...
	ld a,(0e190h)		;457f   ; lee el modo de juego (0 1PLAYER, 1 2PLAYERS, 2 PENNANT, 3 TEAM EDIT, 4 WATCH, 5 MEDIA SELECT)
	cp 005h		;4582
	jr z,L_458B		;4584   ; MEDIA SELECT: p00:458B
	call 0650eh		;4586   ; ...los demas vuelven al menu
	jr L_45F8		;4589   ; y al estado siguiente
L_458B:
	xor a			;458b   ; MEDIA SELECT: las marcas de 0xDD91-0xDD93 a cero
	ld (0dd92h),a		;458c
	ld (0dd91h),a		;458f
	ld (0dd93h),a		;4592
	ld de,018c0h		;4595   ; en (0xC0, 0x18)
	call caracter		;4598   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	jr paso_siguiente		;459b
L_459D:
	djnz L_45B0		;459d   ; paso 4: MEDIA SELECT (p15:AA3B) hasta que acabe (0xDD91)
	call bancos_13_14_15		;459f   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 0aa3bh		;45a2   ; MEDIA SELECT (p15:AA3B)
	call bancos_1_2_3		;45a5   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	ld a,(0dd91h)		;45a8
	or a			;45ab
	ret z			;45ac   ; sin acabar, nada
	jp vuelve_al_menu		;45ad   ; vuelve_al_menu: el menu: estado, despachador de menus y paso a 0
L_45B0:
	ld a,007h		;45b0   ; paso 5: la tecla F5 (SNSMAT fila 7, bit 1) decide si el motor acepta los sonidos 0x32-0x3C
	call 00141h		;45b2   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	bit 1,a		;45b5   ; el bit 1 (F5)
	ld a,001h		;45b7
	jr z,L_45BC		;45b9
	dec a			;45bb   ; pulsada: 0
L_45BC:
	ld (0effah),a		;45bc   ; 0xEFFA: 1 si no esta pulsada
	xor a			;45bf
	ld (0ed99h),a		;45c0   ; guarda la espera antes de la siguiente musica
	ld a,080h		;45c3   ; calla la musica (0x80) y el sonido 0x23
	call sonido		;45c5   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	ld a,023h		;45c8   ; el sonido 0x23
	call sonido		;45ca   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	ld a,0a0h		;45cd   ; 160 cuadros de espera
	jp L_4540		;45cf
L_45D2:
	djnz L_4606		;45d2   ; antes del partido: p00:5FF1, la fuente, p00:59AD, caracteres (p00:52B5, p00:52D9)...
	call L_5FF1		;45d4
	call carga_la_fuente		;45d7   ; carga_la_fuente: carga la fuente: 161 caracteres de un bit (0xFAF6 = 1 mientras tanto)
	call L_59AD		;45da   ; p00:59AD
	call kanji_de_los_datos		;45dd   ; kanji_de_los_datos: los 17 kanji de p09:B942 en la casilla (0xF8, 0x18) de la hoja: los codigos 0x7F-0x8F
	call kanji_del_menu		;45e0   ; p00:52D9
	ld a,007h		;45e3   ; ...el color 7 a 0x77 0x07...
	ld de,07777h		;45e5
	call pon_color		;45e8   ; pon_color: el color A de la paleta a D (rojo-azul) y E (verde), por R#16, y su copia en 0xDDC0 + 2 x A
	ld a,(0e190h)		;45eb   ; ...y en TEAM EDIT (modo 3) p15:B9DA
	cp 003h		;45ee
	call z,0b9dah		;45f0   ; TEAM EDIT: su pantalla
	ld hl,0e1a0h		;45f3   ; 0xE1A0 = 1
	ld (hl),001h		;45f6
L_45F8:
	ld a,020h		;45f8   ; 32 cuadros
L_45FA:
	ld (0de04h),a		;45fa   ; guarda la cuenta atras del estado
	ld hl,0de00h		;45fd   ; al estado siguiente
	inc (hl)			;4600   ; uno mas
paso_cero:		; el paso del estado a 0
	xor a			;4601   ; paso 0 del estado
pon_paso:		; el paso del estado (0xDE01) = A
	ld (0de01h),a		;4602   ; guarda el paso dentro del estado
	ret			;4605
L_4606:
	call borra_pantalla		;4606   ; borra la pantalla y 120 cuadros de espera
	ld a,078h		;4609
	ld (0de04h),a		;460b   ; guarda la cuenta atras del estado
	jp paso_siguiente		;460e   ; paso_siguiente: al paso siguiente del estado (0xDE01 + 1)
L_4611:
	djnz L_464D		;4611   ; la cuenta del paso...
	ld hl,0de04h		;4613   ; apunta a la cuenta atras del estado
	ld a,(hl)			;4616
	or a			;4617
	jr z,L_461B		;4618   ; en 0, nada que contar
	dec (hl)			;461a
L_461B:
	jr z,L_4645		;461b
	ld a,(0d2b1h)		;461d   ; ...0xD2B1 = 1: se sigue esperando
	dec a			;4620
	ret z			;4621   ; 1: se sigue esperando
L_4622:
	call bancos_13_14_15		;4622   ; p13:6DF7 cada cuadro
	call 06df7h		;4625   ; MEDIA SELECT y la grabacion (p13:6DF7)
	call bancos_1_2_3		;4628   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	ld a,(0d2b1h)		;462b   ; 0xD2B1 = 2: vuelta al menu
	cp 002h		;462e
	jp z,vuelve_al_menu		;4630   ; vuelve_al_menu: el menu: estado, despachador de menus y paso a 0
	or a			;4633
	ret z			;4634   ; 0: nada
	ld a,(0de04h)		;4635   ; acabada la cuenta...
	or a			;4638
	ret nz			;4639   ; sin acabar la cuenta, nada
L_463A:
	ld a,02fh		;463a   ; ...el sonido 0x2F, p02:9EA9 y al paso siguiente
	call sonido		;463c   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	call 09ea9h		;463f   ; la pantalla de los lanzadores (p02:9EA9)
	jp paso_siguiente		;4642   ; paso_siguiente: al paso siguiente del estado (0xDE01 + 1)
L_4645:
	ld a,(0d2b1h)		;4645   ; lee como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	dec a			;4648
	jr nz,L_4622		;4649   ; si no es 1, p00:4622
	jr L_463A		;464b
L_464D:
	djnz L_465D		;464d   ; paso siguiente: p02:9D49 hasta que marque 0xE1D1
	call 09d49h		;464f   ; los lanzadores (p02:9D49)
	ld a,(0e1d1h)		;4652   ; lee la marca de acabado de los pasos; en el lanzamiento, su paso (p03:A525)
	or a			;4655
	ret z			;4656   ; sin marcar, nada
	call 0a2edh		;4657   ; y p03:A2ED (la pantalla del orden de bateo)
	jp paso_siguiente		;465a   ; paso_siguiente: al paso siguiente del estado (0xDE01 + 1)
L_465D:
	djnz L_468A		;465d   ; p02:9F8A hasta que marque 0xE1D1
	call 09f8ah		;465f   ; el orden de bateo (p02:9F8A)
	ld a,(0e1d1h)		;4662   ; lee la marca de acabado de los pasos; en el lanzamiento, su paso (p03:A525)
	or a			;4665
	ret z			;4666   ; sin marcar, nada
	call L_4448		;4667   ; el reloj de juego a cero
	ld a,(0effah)		;466a   ; la musica del partido (0x32) si 0xEFFA lo deja; si no, el sonido 1
	or a			;466d
	ld a,032h		;466e
	jr z,L_4674		;4670   ; con 0xEFFA (musica quitada): el sonido 1 (callar)
	ld a,001h		;4672
L_4674:
	call calla_y_espera		;4674   ; calla_y_espera: calla la musica (0x81) y apunta la siguiente en 0xED9A
	ld a,001h		;4677   ; 0xED13 y 0xED14 a 1
	ld hl,0ed13h		;4679   ; apunta a los bateadores del visitante (BCD; uno mas por turno, p01:6316)
	ld (hl),a			;467c
	inc hl			;467d
	ld (hl),a			;467e   ; los dos a 1: el primer bateador
	call 06770h		;467f   ; p01:6770
	ld a,001h		;4682   ; 0xE1CB = 1
	ld (0e1cbh),a		;4684
	jp paso_siguiente		;4687   ; paso_siguiente: al paso siguiente del estado (0xDE01 + 1)
L_468A:
	djnz L_46FB		;468a   ; el partido (p02:9149)...
	call 09149h		;468c
	ld a,(0eda0h)		;468f   ; ...0xEDA0 no 0: estado 6, con 1 o 2 segun 0xEDA0
	or a			;4692
	jr z,L_46A1		;4693
	ld hl,0de00h		;4695   ; apunta a el estado del juego (indice del despachador principal)
	ld (hl),006h		;4698
	dec a			;469a   ; 1: p00:4790; si no p00:479E
	jp z,L_4790		;469b
	jp L_479E		;469e
L_46A1:
	ld a,(0ed87h)		;46a1   ; el fin del partido: 0xED87 lo pide...
	or a			;46a4
	jr nz,L_46EE		;46a5   ; se acaba: p00:46EE
	ld a,(0eda1h)		;46a7   ; ...0xEDA1 vuelve al menu...
	or a			;46aa
	jp nz,vuelve_al_menu		;46ab   ; vuelve_al_menu: el menu: estado, despachador de menus y paso a 0
	ld a,(0e194h)		;46ae   ; ...o un marcador llega a 99
	cp 099h		;46b1
	jr z,L_46EE		;46b3
	ld a,(0e196h)		;46b5   ; lee las carreras del local (BCD; 0x99 acaba el partido)
	cp 099h		;46b8
	jr z,L_46EE		;46ba
	ld hl,0eddah		;46bc   ; 0xEDDA: este cuadro no se mira
	ld a,(hl)			;46bf
	ld (hl),000h		;46c0   ; a 0
	or a			;46c2
	ret nz			;46c3   ; este cuadro no: nada
	ld a,(0e19bh)		;46c4   ; solo durante una baja (bit 0 de 0xE19B), en cada cuadro
	ld b,a			;46c7
	rra			;46c8
	ret nc			;46c9   ; en la alta, nada
	ld hl,0e194h		;46ca   ; la diferencia de carreras: visitante - local
	ld a,(hl)			;46cd
	inc hl			;46ce
	inc hl			;46cf
	sub (hl)			;46d0   ; las del visitante menos las del local
	ld c,000h		;46d1   ; C = 1 si gana el local
	jr nc,L_46D8		;46d3
	inc c			;46d5
	neg		;46d6   ; la diferencia en valor absoluto
L_46D8:
	ld d,a			;46d8   ; si gana el local por 10 o mas, se acaba
	ld a,c			;46d9
	or a			;46da
	jr z,L_46E2		;46db   ; gana el visitante: sigue
	ld a,d			;46dd
	cp 010h		;46de
	jr nc,L_46EE		;46e0
L_46E2:
	ld a,b			;46e2   ; antes de la baja de la 9.a (0xE19B < 0x11) se sigue
	cp 011h		;46e3
	ret c			;46e5   ; antes de 0x11, nada
	ld hl,0e194h		;46e6   ; desde la 9.a, si el local va por delante se acaba
	ld a,(hl)			;46e9
	inc hl			;46ea
	inc hl			;46eb
	cp (hl)			;46ec   ; el visitante no pierde: nada
	ret nc			;46ed
L_46EE:
	ld a,009h		;46ee   ; fin del partido: estado 9 y 128 cuadros
	ld (0de00h),a		;46f0   ; guarda el estado del juego (indice del despachador principal)
	ld a,080h		;46f3
	ld (0de04h),a		;46f5   ; guarda la cuenta atras del estado
	jp paso_cero		;46f8   ; paso_cero: el paso del estado a 0
L_46FB:
	ld a,(0e190h)		;46fb   ; TEAM EDIT (modo 3) va a p03:B694
	cp 003h		;46fe
	jp z,0b694h		;4700   ; TEAM EDIT: su bucle (p03:B694)
	call L_596F		;4703   ; p00:596F hasta que marque 0xE1D1
	ld a,(0e1d1h)		;4706   ; lee la marca de acabado de los pasos; en el lanzamiento, su paso (p03:A525)
	or a			;4709   ; sin marcar, nada
	ret z			;470a
	ld a,(0de02h)		;470b   ; con el bit 4 de 0xDE02, p14:9697
	bit 4,a		;470e
	jr z,L_471B		;4710
	call bancos_13_14_15		;4712   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 09697h		;4715   ; el rival de PENNANT (p14:9697)
	call bancos_1_2_3		;4718   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_471B:
	ld a,03ch		;471b   ; 60 cuadros, 0xD2B0 y 0xD2B1 a cero y al paso siguiente
	ld (0de04h),a		;471d   ; guarda la cuenta atras del estado
	xor a			;4720
	ld (0d2b0h),a		;4721   ; guarda el paso de MEDIA SELECT y de la grabacion
	ld (0d2b1h),a		;4724   ; guarda como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	jp paso_siguiente		;4727   ; paso_siguiente: al paso siguiente del estado (0xDE01 + 1)
L_472A:
	djnz L_4737		;472a   ; p14:9853 o p14:9A26 segun el paso...
	call bancos_13_14_15		;472c   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 09853h		;472f   ; el cambio del visitante (p14:9853)
	call bancos_1_2_3		;4732   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	jr L_4742		;4735
L_4737:
	djnz L_4754		;4737
	call bancos_13_14_15		;4739   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 09a26h		;473c   ; el del local (p14:9A26)
	call bancos_1_2_3		;473f   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_4742:
	ld a,(0e1d1h)		;4742   ; ...hasta que marque 0xE1D1
	or a			;4745   ; sin marcar, nada
	ret z			;4746
	ld a,(0ed9bh)		;4747   ; sin 0xED9B, p15:AC91
	or a			;474a
	call z,0ac91h		;474b   ; p15:AC91 si no hay 0xED9B
	xor a			;474e
	ld (0ed9bh),a		;474f
	jr L_47AF		;4752
L_4754:
	call 06098h		;4754   ; p01:6098: con carry se acaba (al estado 5-4)
	jr c,L_47AC		;4757   ; F1 pulsada: el partido
	ld a,(0de02h)		;4759   ; los bits de 0xDE02: el 3 no deja seguir...
	ld b,a			;475c
	and 008h		;475d
	ret nz			;475f   ; el ordenador solo: nada
	bit 4,b		;4760   ; ...el 4 y el 5 dicen que mando atiende
	jr nz,L_476A		;4762   ; PENNANT: p00:476A
	bit 5,b		;4764
	jr z,L_478A		;4766   ; un jugador: el primer mando
	jr L_4783		;4768   ; dos: los dos mandos
L_476A:
	bit 5,b		;476a
	jr nz,L_4783		;476c   ; PENNANT con dos: los dos
	ld a,(0d6dch)		;476e   ; con el bit 0 de 0xD6DC...
	rra			;4771
	jr nc,L_4783		;4772   ; el jugador de visitante: el primero
	ld a,(0de09h)		;4774   ; ...el disparo del segundo mando
	and 010h		;4777
	jr nz,L_4790		;4779   ; de local: el segundo cambia al visitante...
	ld a,(0de07h)		;477b   ; ...o el del primero
	and 010h		;477e
	ret z			;4780   ; ...y el primero al local
	jr L_479E		;4781
L_4783:
	ld a,(0de09h)		;4783   ; el disparo del segundo mando: p14:9C61
	and 010h		;4786
	jr nz,L_479E		;4788   ; el segundo: el local
L_478A:
	ld a,(0de07h)		;478a   ; el disparo del primero: p14:9BCC
	and 010h		;478d
	ret z			;478f   ; sin disparo, nada
L_4790:
	call bancos_13_14_15		;4790   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 09bcch		;4793   ; el cambio del visitante (p14:9BCC)
	call bancos_1_2_3		;4796   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	ld a,001h		;4799   ; al paso 1
	jp pon_paso		;479b   ; pon_paso: el paso del estado (0xDE01) = A
L_479E:
	call bancos_13_14_15		;479e   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 09c61h		;47a1   ; el del local (p14:9C61)
	call bancos_1_2_3		;47a4   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	ld a,002h		;47a7   ; al paso 2
	jp pon_paso		;47a9   ; pon_paso: el paso del estado (0xDE01) = A
L_47AC:
	call 064a5h		;47ac   ; p01:64A5
L_47AF:
	ld a,005h		;47af   ; al estado 5, paso 4: el partido
	ld (0de00h),a		;47b1   ; guarda el estado del juego (indice del despachador principal)
	dec a			;47b4   ; paso 4
	jp pon_paso		;47b5   ; pon_paso: el paso del estado (0xDE01) = A
L_47B8:
	dec b			;47b8   ; paso 0: el fundido
	jp nz,L_4818		;47b9
	ld a,(0de03h)		;47bc   ; cada 32 cuadros...
	and 01fh		;47bf
	ret nz			;47c1
	call L_49D7		;47c2   ; ...funde la paleta (p00:49D7) y la pone
	ld hl,0e400h		;47c5   ; apunta a el bufer de un dibujo a 4 bits antes de la VRAM
	call pon_paleta		;47c8   ; pon_paleta: fichas de 3 bytes [color][rojo-azul][verde] hasta 0xFF, con p00:4BF0
	ld hl,0e401h		;47cb   ; mira si ya son negros los 13 colores
	ld b,00dh		;47ce
	xor a			;47d0
L_47D1:
	or (hl)			;47d1   ; los dos bytes de cada color...
	inc hl			;47d2
	or (hl)			;47d3
	or a			;47d4
	ret nz			;47d5   ; ...alguno no es 0: sigue
	inc hl			;47d6
	inc hl			;47d7
	djnz L_47D1		;47d8   ; los 13
	call 06991h		;47da   ; del todo negra: p01:6991, el color 0 a negro...
	xor a			;47dd
	ld de,00703h		;47de   ; el color 0 = 0x0703
	call pon_color		;47e1   ; pon_color: el color A de la paleta a D (rojo-azul) y E (verde), por R#16, y su copia en 0xDDC0 + 2 x A
	call kanji_de_los_datos		;47e4   ; ...los caracteres, el texto de 0x7CD1...
	ld hl,07cd1h		;47e7
	call texto		;47ea   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld hl,0d380h		;47ed   ; ...y dos numeros de 10 cifras: 0xD380 y 0xD47F
	ld de,04850h		;47f0   ; en (0x50, 0x48)
	call diez_caracteres		;47f3   ; diez_caracteres: 10 caracteres seguidos de HL en (D, E)
	ld hl,0d47fh		;47f6   ; apunta a la ficha del local (255 bytes de p13:731F; en TEAM EDIT, el paso del dialogo de guardar)
	ld de,0a850h		;47f9   ; en (0x50, 0xA8)
	call diez_caracteres		;47fc   ; diez_caracteres: 10 caracteres seguidos de HL en (D, E)
	call 060ach		;47ff   ; p01:60AC
	ld a,(0de02h)		;4802   ; con el bit 4 de 0xDE02, el texto de 0x7C79 y al paso siguiente
	and 010h		;4805   ; sin PENNANT, al paso 5
	jr z,L_4812		;4807
	ld hl,07c79h		;4809
	call texto		;480c   ; el texto de 0x7C79
	jp paso_siguiente		;480f   ; paso_siguiente: al paso siguiente del estado (0xDE01 + 1)
L_4812:
	ld a,005h		;4812   ; si no, al paso 5
	ld (0de01h),a		;4814   ; guarda el paso dentro del estado
	ret			;4817
L_4818:
	djnz L_486C		;4818   ; paso 2: sin el bit 4 de 0xDE02, al paso 5
	ld a,(0de02h)		;481a   ; lee las marcas del modo: bit 6 un jugador, 5 dos jugadores, 4 PENNANT (contra el ordenador), 3 el ordenador solo
	and 010h		;481d
	jr z,L_4812		;481f
	ld a,(0de07h)		;4821   ; espera al disparo (bit 4 de 0xDE07)
	and 010h		;4824
	ret z			;4826   ; sin disparo, nada
	call kanji_de_la_tabla		;4827   ; caracteres (p00:52C7), p15:AC1A y p15:A792
	call bancos_13_14_15		;482a   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 0ac1ah		;482d   ; la jornada siguiente (p15:AC1A)...
	call 0a792h		;4830   ; ...y el campeon (p15:A792)
	call bancos_1_2_3		;4833   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	ld a,(0dd9dh)		;4836   ; 0xDD9D: el texto de 0x7CB9 y al paso 9
	or a			;4839
	jr nz,L_4860		;483a   ; con campeon: p00:4860
	ld hl,07c8ah		;483c   ; si no, el de 0x7C8A, o el de 0x7CA8 sin 0xDD8E
	ld a,(0dd8eh)		;483f   ; lee los soportes que hay: bit 0 el disco, bit 1 el Game Master 2
	or a			;4842
	jr nz,L_4848		;4843   ; sin soportes, 0x7CA8
	ld hl,07ca8h		;4845
L_4848:
	call texto		;4848   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	xor a			;484b   ; las marcas 0xDD91-0xDD93 a cero
	ld (0dd91h),a		;484c
	ld (0dd92h),a		;484f
	ld (0dd93h),a		;4852
	ld a,007h		;4855   ; el color 7 a 0x77 0x07 y al paso siguiente
	ld de,07707h		;4857
	call pon_color		;485a   ; pon_color: el color A de la paleta a D (rojo-azul) y E (verde), por R#16, y su copia en 0xDDC0 + 2 x A
	jp paso_siguiente		;485d   ; paso_siguiente: al paso siguiente del estado (0xDE01 + 1)
L_4860:
	ld hl,07cb9h		;4860
	call texto		;4863   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld a,009h		;4866
	ld (0de01h),a		;4868   ; guarda el paso dentro del estado
	ret			;486b
L_486C:
	jr L_48AD		;486c
L_486E:
	ld a,(0de06h)		;486e   ; espera al disparo recien pulsado
	and 010h		;4871
	ret z			;4873   ; sin disparo, nada
L_4874:
	call apaga_pantalla		;4874   ; un partido nuevo: pantalla apagada y borrada...
	call borra_pantalla		;4877   ; borra_pantalla: esconde los sprites, apaga la pantalla, rellena la VRAM de 0, R#23 = 0 y la enciende
	ld de,0e195h		;487a   ; ...0xE194-0xEDE7 a cero (marcadores, entradas y todo el partido)...
	ld hl,0e194h		;487d   ; apunta a las carreras del visitante (BCD; 0x99 acaba el partido)
	ld bc,00c53h		;4880   ; 0xC54 bytes
	ld (hl),000h		;4883
	ldir		;4885
	call 06770h		;4887   ; ...p01:6770, los colores de equipo (p00:550E), el color 15 a 0x70 0x00...
	call L_550E		;488a   ; p00:550E
	ld a,00fh		;488d
	ld de,07000h		;488f   ; el color 15 = 0x7000
	call pon_color		;4892   ; pon_color: el color A de la paleta a D (rojo-azul) y E (verde), por R#16, y su copia en 0xDDC0 + 2 x A
	call L_59AD		;4895   ; ...la fuente y la pantalla encendida
	call enciende_pantalla		;4898   ; enciende_pantalla: R#1 con el bit 6 (BL) a 1 (WRTVDP)
	ld a,009h		;489b   ; el despachador 0xD74C a 9, paso 0...
	ld (0d74ch),a		;489d   ; guarda el despachador de los menus (y 0xD74D)
	call paso_cero		;48a0   ; paso_cero: el paso del estado a 0
	ld a,005h		;48a3   ; ...estado 5 (el partido) y calla todo (sonido 1)
	ld (0de00h),a		;48a5   ; guarda el estado del juego (indice del despachador principal)
	ld a,001h		;48a8
	jp sonido		;48aa   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_48AD:
	djnz L_48FB		;48ad
	ld a,(0dd8eh)		;48af   ; paso 3: sin 0xDD8E, a esperar el disparo
	or a			;48b2
	jr z,L_486E		;48b3   ; sin soportes, p00:486E
	call bancos_13_14_15		;48b5   ; p15:AAE1 con DE = 0xB840...
	ld de,0b840h		;48b8
	call 0aae1h		;48bb   ; SI / NO (p15:AAE1) en (0x40, 0xB8)
	call bancos_1_2_3		;48be   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	ld a,(0dd91h)		;48c1   ; ...hasta que marque 0xDD91
	or a			;48c4
	ret z			;48c5   ; sin elegir, nada
	ld a,(0dd93h)		;48c6   ; 0xDD93: partido nuevo
	or a			;48c9
	jr nz,L_4874		;48ca   ; SI (0xDD93 = 1)? partido nuevo
	ld a,(0de02h)		;48cc   ; copia 0xDE02 a 0xD73F
	ld (0d73fh),a		;48cf
	ld a,001h		;48d2   ; 0xDD90 = 1
	ld (0dd90h),a		;48d4
	ld a,(0dd0eh)		;48d7   ; con 0xDD0E = 0xFF y sin nada en H.SAVE (0xFFA7 = ret) se salta
	cp 0ffh		;48da
	jr nz,L_48E6		;48dc   ; el Game Master 2 esta: p00:48E6
	ld a,(0ffa7h)		;48de
	cp 0c9h		;48e1
	jp z,L_4967		;48e3   ; tampoco disco (H.PHYD en ret): p00:4967
L_48E6:
	call 0bdd4h		;48e6   ; p03:BDD4, el texto de 0x7BDD, 0xD2B0 = 0 y al paso siguiente
	ld hl,07bddh		;48e9   ; el texto de 0x7BDD
	call texto		;48ec   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	xor a			;48ef
	ld (0d2b0h),a		;48f0   ; guarda el paso de MEDIA SELECT y de la grabacion
	call paso_siguiente		;48f3   ; paso_siguiente: al paso siguiente del estado (0xDE01 + 1)
	ld a,001h		;48f6   ; calla todo (sonido 1)
	jp sonido		;48f8   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_48FB:
	djnz L_490E		;48fb   ; paso 4: p13:6F79 hasta que marque 0xD2B1; entonces al menu
	call bancos_13_14_15		;48fd   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 06f79h		;4900   ; la grabacion (p13:6F79)
	call bancos_1_2_3		;4903   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	ld a,(0d2b1h)		;4906   ; lee como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	or a			;4909
	ret z			;490a   ; sin acabar, nada
	jp vuelve_al_menu		;490b   ; vuelve_al_menu: el menu: estado, despachador de menus y paso a 0
L_490E:
	djnz L_493F		;490e   ; paso 5: espera los botones 1 o 2 (bits 4-5) de cualquier mando
	ld a,(0de07h)		;4910   ; lee los botones pulsados del mando 1 / cursores
	and 030h		;4913
	jr nz,L_491D		;4915   ; sin el primero, el segundo
	ld a,(0de09h)		;4917   ; lee los botones pulsados (segundo mando)
	and 030h		;491a
	ret z			;491c   ; ninguno: nada
L_491D:
	ld a,(0de02h)		;491d   ; sin el bit 4 de 0xDE02, al menu
	and 010h		;4920
	jp z,vuelve_al_menu		;4922   ; vuelve_al_menu: el menu: estado, despachador de menus y paso a 0
	ld a,031h		;4925   ; el sonido 0x31, pantalla borrada, p00:526E y p14:9E0E; al paso 6
	call sonido		;4927   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	call borra_pantalla		;492a   ; borra_pantalla: esconde los sprites, apaga la pantalla, rellena la VRAM de 0, R#23 = 0 y la enciende
	call L_526E		;492d   ; p00:526E
	call bancos_13_14_15		;4930   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 09e0eh		;4933   ; la escena del campeon (p14:9E0E)
	call bancos_1_2_3		;4936   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	ld a,006h		;4939   ; al paso 6
	ld (0de01h),a		;493b   ; guarda el paso dentro del estado
	ret			;493e
L_493F:
	djnz L_4958		;493f   ; paso 6: p14:9E2F hasta que marque 0xED2F...
	call bancos_13_14_15		;4941   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 09e2fh		;4944   ; la escena (p14:9E2F)
	call bancos_1_2_3		;4947   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	ld a,(0ed2fh)		;494a
	or a			;494d   ; sin acabar, nada
	ret z			;494e
	ld hl,00000h		;494f   ; ...0xD74C y 0xD74D a cero y al paso siguiente
	ld (0d74ch),hl		;4952   ; guarda el despachador de los menus (y 0xD74D) y el byte siguiente (16 bits)
	jp paso_siguiente		;4955   ; paso_siguiente: al paso siguiente del estado (0xDE01 + 1)
L_4958:
	djnz L_4976		;4958   ; paso 7: espera los botones 1 o 2
	ld a,(0de07h)		;495a   ; lee los botones pulsados del mando 1 / cursores
	and 030h		;495d
	jr nz,L_4967		;495f   ; con el primero, si no el segundo
	ld a,(0de09h)		;4961   ; lee los botones pulsados (segundo mando)
	and 030h		;4964
	ret z			;4966   ; ninguno: nada
L_4967:
	ld a,001h		;4967   ; el sonido de la eleccion, el bit 6 de 0xDE02 a 0 y al menu
	call calla_y_espera		;4969   ; calla_y_espera: calla la musica (0x81) y apunta la siguiente en 0xED9A
	ld hl,0de02h		;496c   ; apunta a las marcas del modo: bit 6 un jugador, 5 dos jugadores, 4 PENNANT (contra el ordenador), 3 el ordenador solo
	ld a,(hl)			;496f   ; sin el bit 6 (un jugador)
	and 0bfh		;4970
	ld (hl),a			;4972
	jp vuelve_al_menu		;4973   ; vuelve_al_menu: el menu: estado, despachador de menus y paso a 0
L_4976:
	djnz L_4992		;4976   ; paso 8: p14:9F76 hasta 0xED2F; despachador a cero y al paso 7
	call bancos_13_14_15		;4978   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 09f76h		;497b   ; la escena final (p14:9F76)
	call bancos_1_2_3		;497e   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	ld a,(0ed2fh)		;4981
	or a			;4984
	ret z			;4985   ; sin acabar, nada
	ld hl,00000h		;4986
	ld (0d74ch),hl		;4989   ; guarda el despachador de los menus (y 0xD74D) y el byte siguiente (16 bits)
	ld a,007h		;498c   ; al paso 7
	ld (0de01h),a		;498e   ; guarda el paso dentro del estado
	ret			;4991
L_4992:
	djnz L_49C0		;4992   ; paso 9: SNSMAT fila 6 bit 5 (F1) sin pulsar...
	ld a,006h		;4994
	call 00141h		;4996   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	and 020h		;4999
	ret nz			;499b   ; pulsada: nada
	ld a,(0dd9dh)		;499c   ; ...0xDD9D = 1 o 2 elige
	dec a			;499f
	jr z,L_49A6		;49a0   ; 1: p00:49A6
	dec a			;49a2
	jp z,L_491D		;49a3   ; 2: p00:491D
L_49A6:
	ld a,031h		;49a6   ; el sonido 0x31, pantalla borrada, p00:5222 y p14:9F22; al paso 8
	call sonido		;49a8   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	call borra_pantalla		;49ab   ; borra_pantalla: esconde los sprites, apaga la pantalla, rellena la VRAM de 0, R#23 = 0 y la enciende
	call L_5222		;49ae   ; p00:5222
	call bancos_13_14_15		;49b1   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 09f22h		;49b4   ; la escena del final (p14:9F22)
	call bancos_1_2_3		;49b7   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	ld a,008h		;49ba   ; al paso 8
	ld (0de01h),a		;49bc   ; guarda el paso dentro del estado
	ret			;49bf
L_49C0:
	call 066b3h		;49c0   ; p01:66B3 hasta que el bit 7 de 0xE1D1 lo marque
	ld a,(0e1d1h)		;49c3   ; lee la marca de acabado de los pasos; en el lanzamiento, su paso (p03:A525)
	rla			;49c6   ; sin el bit 7, nada
	ret nc			;49c7
	ld hl,06003h		;49c8   ; copia los 45 bytes de p07:6003 a 0xE400 (con 7-8-9, p00:535A)
	ld de,0e400h		;49cb   ; apunta a el bufer de un dibujo a 4 bits antes de la VRAM
	ld bc,0002dh		;49ce   ; 45 bytes (15 colores)
	call L_535A		;49d1
	jp L_4540		;49d4   ; y al paso siguiente
L_49D7:
	ld hl,0e401h		;49d7   ; funde la paleta de 0xE400: los 13 colores...
	ld b,00dh		;49da   ; 13 colores
L_49DC:
	ld e,(hl)			;49dc   ; E = rojo-azul, D = verde
	inc hl			;49dd
	ld d,(hl)			;49de
	rr e		;49df   ; el nibble bajo de E (azul) pasa a A
	rra			;49e1   ; 4 bits de E a A...
	rr e		;49e2
	rra			;49e4
	rr e		;49e5
	rra			;49e7
	rr e		;49e8
	rra			;49ea
	and 0f0h		;49eb   ; el rojo, uno menos si no es 0
	jr z,L_49F1		;49ed
	sub 010h		;49ef
L_49F1:
	ld c,a			;49f1
	ld a,e			;49f2   ; ...el azul (nibble bajo de E) baja uno...
	and 00fh		;49f3
	jr z,L_49F8		;49f5
	dec a			;49f7
L_49F8:
	ld e,a			;49f8
	ld a,c			;49f9   ; vuelven a su sitio rojo y azul
	rla			;49fa
	rl e		;49fb
	rla			;49fd
	rl e		;49fe
	rla			;4a00
	rl e		;4a01
	rla			;4a03
	rl e		;4a04
	ld a,d			;4a06   ; el verde, uno menos si no es 0
	and 00fh		;4a07
	jr z,L_4A0C		;4a09
	dec a			;4a0b
L_4A0C:
	ld d,a			;4a0c
	dec hl			;4a0d   ; guarda el color fundido
	ld (hl),e			;4a0e
	inc hl			;4a0f
	ld (hl),d			;4a10
	inc hl			;4a11
	inc hl			;4a12
	djnz L_49DC		;4a13
	ret			;4a15
L_4A16:
	ld a,001h		;4a16   ; 0xED9B = 1 y estado 6
	ld (0ed9bh),a		;4a18
	ld a,006h		;4a1b
	ld (0de00h),a		;4a1d   ; guarda el estado del juego (indice del despachador principal)
	call 08461h		;4a20   ; p02:8461
	ld a,(0e19bh)		;4a23   ; en la baja, el disparo del primer mando; en la alta, el del segundo
	rra			;4a26
	jp c,L_4790		;4a27
	jp L_479E		;4a2a
L_4A2D:
	ld hl,0de04h		;4a2d   ; estado 6: la cuenta de 0xDE04...
	dec (hl)			;4a30
	ret nz			;4a31
	ld a,030h		;4a32   ; ...el sonido 0x30, p01:668F y al estado 7
	call sonido		;4a34   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	call 0668fh		;4a37
	ld a,007h		;4a3a
	ld (0de00h),a		;4a3c   ; guarda el estado del juego (indice del despachador principal)
	jp paso_cero		;4a3f   ; paso_cero: el paso del estado a 0
L_4A42:
	call 06608h		;4a42   ; la vuelta de los estados 0-2: el mando (p01:6608) y la tecla de 0xE333 (p01:65F6)
	ld hl,0e333h		;4a45
	call 065f6h		;4a48
	ld a,e			;4a4b   ; sin nada pulsado, nada
	or d			;4a4c
	ret z			;4a4d
	ld hl,0de04h		;4a4e   ; algo pulsado: la cuenta del estado a cero
	ld (hl),000h		;4a51
	ld l,(hl)			;4a53
	ld de,0e191h		;4a54
	ld b,(hl)			;4a57   ; B = el paso de antes (0xDE04 = 0 ya)
	djnz L_4A83		;4a58
	and 030h		;4a5a   ; en el rotulo, solo los botones 1 y 2 (bits 4-5) arrancan
	jr z,L_4A97		;4a5c
	ld a,(0e190h)		;4a5e   ; 0xDE02 segun el modo: 1PLAYER 0x40...
	or a			;4a61
	ld b,040h		;4a62
	jr z,L_4A72		;4a64
	dec a			;4a66
	ld b,060h		;4a67   ; ...2PLAYERS 0x60...
	jr z,L_4A72		;4a69
	dec a			;4a6b
	ld b,010h		;4a6c   ; ...PENNANT 0x10...
	jr z,L_4A72		;4a6e
	ld b,008h		;4a70   ; ...y los demas 0x08
L_4A72:
	ld a,b			;4a72
	ld (0de02h),a		;4a73   ; guarda las marcas del modo: bit 6 un jugador, 5 dos jugadores, 4 PENNANT (contra el ordenador), 3 el ordenador solo
	ld (hl),003h		;4a76   ; al estado 0, paso 3
	inc hl			;4a78
	xor a			;4a79
	ld c,a			;4a7a
	ld (0e332h),a		;4a7b   ; 0xE332 = 0
	ld (hl),c			;4a7e
	dec c			;4a7f
	jp 06577h		;4a80   ; p01:6577
L_4A83:
	ld (hl),001h		;4a83   ; cualquier otra cosa: calla todo y vuelve al modo 1PLAYER
	ld a,001h		;4a85
	call sonido		;4a87   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	xor a			;4a8a
	ld (0eff4h),a		;4a8b   ; guarda el tono libre del canal 4 (bit 0 baja, bit 7 empieza)
	ld (0e190h),a		;4a8e   ; guarda el modo de juego (0 1PLAYER, 1 2PLAYERS, 2 PENNANT, 3 TEAM EDIT, 4 WATCH, 5 MEDIA SELECT)
	ld (0e332h),a		;4a91
	jp 0651ch		;4a94   ; p01:651C
L_4A97:
	ld a,(de)			;4a97   ; cambia el bit 0 de 0xE191
	xor 001h		;4a98
	ld (de),a			;4a9a
	ret			;4a9b
L_4A9C:
	call vram_para_leer		;4a9c   ; lee BC bytes de la VRAM HL a DE
	call L_4AAF		;4a9f
	ex af,af'			;4aa2
	ld a,(00006h)		;4aa3   ; el puerto de datos del VDP (0x0006 de la BIOS)
	ld c,a			;4aa6
	ex af,af'			;4aa7
L_4AA8:
	inir		;4aa8   ; de 256 en 256
	dec a			;4aaa
	jr nz,L_4AA8		;4aab
	ex de,hl			;4aad
	ret			;4aae
L_4AAF:
	ex de,hl			;4aaf   ; prepara la cuenta: A vueltas de B bytes (B = C)
	ld a,c			;4ab0
	or a			;4ab1
	ld a,b			;4ab2
	ld b,c			;4ab3
	ret z			;4ab4   ; C = 0: B vueltas de 256
	inc a			;4ab5   ; si no, una vuelta mas para los C sueltos
	ret			;4ab6
copia_a_vram:		; copia BC bytes de HL a la VRAM DE
	ex de,hl			;4ab7   ; HL = la direccion de la VRAM
	call vram_para_escribir		;4ab8   ; vram_para_escribir: pone la direccion HL de la VRAM (17 bits, R#14) para escribir
	call L_4AAF		;4abb   ; A vueltas de B bytes
	ex af,af'			;4abe
	ld a,(00007h)		;4abf   ; el puerto de datos del VDP (0x0007 de la BIOS)
	ld c,a			;4ac2
	ex af,af'			;4ac3
L_4AC4:
	otir		;4ac4   ; de 256 en 256 (o B al final)
	dec a			;4ac6
	jr nz,L_4AC4		;4ac7
	ret			;4ac9
L_4ACA:
	push de			;4aca   ; rellena BC bytes de la VRAM HL con A
	push af			;4acb
	call vram_para_escribir		;4acc   ; vram_para_escribir: pone la direccion HL de la VRAM (17 bits, R#14) para escribir
	ld d,c			;4acf   ; D = C: los bytes sueltos...
	ld a,c			;4ad0
	or a			;4ad1
	jr z,L_4AD5		;4ad2
	inc b			;4ad4   ; ...y una vuelta mas si los hay
L_4AD5:
	ld a,(00007h)		;4ad5
	ld c,a			;4ad8
	pop af			;4ad9
L_4ADA:
	out (c),a		;4ada   ; escribe A una vez por byte
	dec d			;4adc
	jr nz,L_4ADA		;4add
	djnz L_4ADA		;4adf
	pop de			;4ae1
	ret			;4ae2
byte_a_vram:		; escribe A en la VRAM HL
	push bc			;4ae3
	push af			;4ae4
	call vram_para_escribir		;4ae5   ; la direccion...
	ld a,(00007h)		;4ae8
	ld c,a			;4aeb
	pop af			;4aec
	out (c),a		;4aed   ; ...y el byte
	pop bc			;4aef
	ret			;4af0
vram_para_escribir:		; pone la direccion HL de la VRAM (17 bits, R#14) para escribir
	push bc			;4af1
	ld a,(00007h)		;4af2   ; el puerto de control del VDP
	inc a			;4af5
	ld c,a			;4af6
	ld a,h			;4af7   ; los 2 bits altos de la direccion (A14-A15)...
	rlca			;4af8
	rlca			;4af9
	and 003h		;4afa
	di			;4afc
	out (c),a		;4afd
	ld a,08eh		;4aff   ; ...a R#14
	out (c),a		;4b01
	ld a,l			;4b03   ; los 8 bajos...
	out (c),a		;4b04
	ld a,h			;4b06   ; ...y los 6 de en medio con el bit 6 a 1: escribir
	and 03fh		;4b07
	or 040h		;4b09
	out (c),a		;4b0b
	pop bc			;4b0d
	ei			;4b0e
	ret			;4b0f
vram_para_leer:		; pone la direccion HL de la VRAM (R#14) para leer
	push bc			;4b10
	ld a,(00007h)		;4b11
	inc a			;4b14
	ld c,a			;4b15
	ld a,h			;4b16   ; los 2 bits altos de la direccion a R#14...
	rlca			;4b17
	rlca			;4b18
	and 003h		;4b19
	di			;4b1b
	out (c),a		;4b1c
	ld a,08eh		;4b1e
	out (c),a		;4b20
	ld a,l			;4b22   ; ...los 8 bajos...
	out (c),a		;4b23
	ld a,h			;4b25   ; ...y los 6 de en medio con el bit 6 a 0: leer
	and 03fh		;4b26
	out (c),a		;4b28
	pop bc			;4b2a
	ei			;4b2b
	ret			;4b2c
rachas_con_destino:		; rachas con el destino de la VRAM delante (2 bytes en DE)
	ld c,000h		;4b2d   ; C = 0: los bytes tal cual
	ex de,hl			;4b2f
	ld e,(hl)			;4b30   ; el destino nuevo, de los 2 bytes del origen
	inc hl			;4b31
	ld d,(hl)			;4b32
	inc hl			;4b33
	ex de,hl			;4b34
rachas_a_vram:		; descomprime las rachas de DE a la VRAM HL (0 acaba, 0x80 trae otro destino)
	call vram_para_escribir		;4b35   ; vram_para_escribir: pone la direccion HL de la VRAM (17 bits, R#14) para escribir
	exx			;4b38   ; el puerto de datos en C', para no tocar BC
	ld a,(00007h)		;4b39
	ld c,a			;4b3c
	exx			;4b3d
L_4B3E:
	ld a,(de)			;4b3e   ; la cuenta: 0 acaba
	and a			;4b3f
	ret z			;4b40
	inc de			;4b41
	ld b,a			;4b42   ; B = la cuenta con el bit 7
	and 07fh		;4b43
	cp b			;4b45
	jr z,L_4B57		;4b46   ; bit 7 a 0: una racha (un byte repetido)
	and a			;4b48   ; 0x80 justo: otro destino
	jr z,rachas_con_destino		;4b49
	ld b,a			;4b4b   ; 0x81-0xFF: B bytes tal cual
L_4B4C:
	call L_4B8F		;4b4c   ; un byte (girado si C lo pide)...
	exx			;4b4f
	out (c),a		;4b50   ; ...a la VRAM
	exx			;4b52
	djnz L_4B4C		;4b53
	jr L_4B3E		;4b55
L_4B57:
	call L_4B8F		;4b57   ; la racha: el byte...
L_4B5A:
	exx			;4b5a   ; ...B veces
	out (c),a		;4b5b
	exx			;4b5d
	djnz L_4B5A		;4b5e
	jr L_4B3E		;4b60
rachas:		; descomprime las rachas de DE a la VRAM HL (C = 0: sin girar)
	ld c,000h		;4b62   ; C = 0: sin girar
	jr rachas_a_vram		;4b64
L_4B66:
	call L_4B72		;4b66   ; C filas de 16x16 puntos (128 bytes cada una)
	ld a,020h		;4b69   ; la fila siguiente, 32 bytes mas alla
	call de_mas_a		;4b6b   ; de_mas_a: DE = DE + A
	dec c			;4b6e
	jr nz,L_4B66		;4b6f
	ret			;4b71
L_4B72:
	push de			;4b72   ; un bloque de 16 lineas de 16 bytes, girado en espejo...
L_4B73:
	ld b,010h		;4b73
L_4B75:
	ld a,(hl)			;4b75   ; ...cada byte del reves...
	call L_4B94		;4b76
	ex de,hl			;4b79
	call byte_a_vram		;4b7a   ; ...a la VRAM DE...
	ex de,hl			;4b7d
	inc de			;4b7e
	inc hl			;4b7f
	djnz L_4B75		;4b80
	ld a,e			;4b82   ; ...y la linea anterior (32 bytes mas atras)
	sub 020h		;4b83
	ld e,a			;4b85
	jr nc,L_4B89		;4b86
	dec d			;4b88
L_4B89:
	bit 4,e		;4b89   ; hasta 16 lineas
	jr z,L_4B73		;4b8b
	pop de			;4b8d
	ret			;4b8e
L_4B8F:
	ld a,(de)			;4b8f   ; un byte del origen; con el bit 0 de C, del reves
	inc de			;4b90
	bit 0,c		;4b91
	ret z			;4b93
L_4B94:
	push bc			;4b94   ; da la vuelta a los 8 bits de A
	ld c,a			;4b95
	ld b,008h		;4b96
L_4B98:
	rr c		;4b98
	rla			;4b9a
	djnz L_4B98		;4b9b
	pop bc			;4b9d
	ret			;4b9e
borra_pantalla:		; esconde los sprites, apaga la pantalla, rellena la VRAM de 0, R#23 = 0 y la enciende
	call esconde_sprites		;4b9f   ; esconde_sprites: escribe 0xD8 (Y = 216: no se pinta ninguno) en la VRAM 0xF600, el primer atributo de sprite
L_4BA2:
	call apaga_pantalla		;4ba2   ; apaga_pantalla: R#1 con el bit 6 (BL) a 0 (WRTVDP)
	ld hl,00000h		;4ba5   ; rellena la pagina 0 entera con el color 0 (HMMV 256x256)...
	ld bc,00000h		;4ba8
	xor a			;4bab
	ld d,000h		;4bac
	call rellena		;4bae   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
	ld b,000h		;4bb1   ; ...R#23 (el desplazamiento vertical) a 0...
	ld c,017h		;4bb3
	call 00047h		;4bb5   ; BIOS WRTVDP - Writes data in the VDP-register
enciende_pantalla:		; R#1 con el bit 6 (BL) a 1 (WRTVDP)
	ld a,(0f3e0h)		;4bb8   ; R#1 (copia en 0xF3E0) con el bit 6 a 1: pantalla encendida
	or 040h		;4bbb
	ld b,a			;4bbd
	ld c,001h		;4bbe
	call 00047h		;4bc0   ; BIOS WRTVDP - Writes data in the VDP-register
	jr enciende_sprites		;4bc3   ; y los sprites tambien
apaga_pantalla:		; R#1 con el bit 6 (BL) a 0 (WRTVDP)
	ld a,(0f3e0h)		;4bc5   ; R#1 con el bit 6 a 0: pantalla negra
	and 0bfh		;4bc8
	ld b,a			;4bca
	ld c,001h		;4bcb
	call 00047h		;4bcd   ; BIOS WRTVDP - Writes data in the VDP-register
	jr apaga_sprites		;4bd0   ; y los sprites apagados
esconde_sprites:		; escribe 0xD8 (Y = 216: no se pinta ninguno) en la VRAM 0xF600, el primer atributo de sprite
	ld hl,0f600h		;4bd2
	ld a,0d8h		;4bd5   ; Y = 216 en el primer atributo: no se pinta ninguno
	jp byte_a_vram		;4bd7   ; byte_a_vram: escribe A en la VRAM HL
apaga_sprites:		; R#8 con el bit 1 (SPD) a 1: no se pintan sprites
	ld a,(0ffe7h)		;4bda   ; R#8 (copia en 0xFFE7) con el bit 1 a 1: sin sprites
	or 002h		;4bdd
	ld b,a			;4bdf
	ld c,008h		;4be0
	jp 00047h		;4be2   ; BIOS WRTVDP - Writes data in the VDP-register
enciende_sprites:		; R#8 con el bit 1 (SPD) a 0
	ld a,(0ffe7h)		;4be5   ; R#8 con el bit 1 a 0: con sprites
	and 0fdh		;4be8
	ld b,a			;4bea
	ld c,008h		;4beb
	jp 00047h		;4bed   ; BIOS WRTVDP - Writes data in the VDP-register
pon_color:		; el color A de la paleta a D (rojo-azul) y E (verde), por R#16, y su copia en 0xDDC0 + 2 x A
	push bc			;4bf0
	push hl			;4bf1
	ld b,a			;4bf2   ; B = el numero de color
	ld a,(00007h)		;4bf3   ; el puerto de control...
	inc a			;4bf6
	ld c,a			;4bf7
	di			;4bf8
	out (c),b		;4bf9   ; ...R#16 = el color
	ld a,090h		;4bfb
	out (c),a		;4bfd
	inc c			;4bff   ; el puerto de la paleta
	out (c),d		;4c00   ; rojo y azul...
	push af			;4c02   ; (una pausa para el VDP)
	pop af			;4c03
	out (c),e		;4c04   ; ...y verde
	ld hl,0ddc0h		;4c06   ; la copia en RAM de la paleta, 2 bytes por color
	ld a,b			;4c09
	add a,a			;4c0a
	call hl_mas_a		;4c0b   ; hl_mas_a: HL = HL + A
	ld (hl),d			;4c0e
	inc hl			;4c0f
	ld (hl),e			;4c10
	dec c			;4c11
	ld hl,0f680h		;4c12   ; y otra en la VRAM 0xF680 + 2 x color
	ld a,b			;4c15
	add a,a			;4c16
	add a,l			;4c17
	ld l,a			;4c18
	call vram_para_escribir		;4c19   ; vram_para_escribir: pone la direccion HL de la VRAM (17 bits, R#14) para escribir
	dec c			;4c1c
	out (c),d		;4c1d
	out (c),e		;4c1f
	pop hl			;4c21
	pop bc			;4c22
	ei			;4c23
	ret			;4c24
L_4C25:
	ld hl,04c39h		;4c25   ; la paleta de arranque: 16 colores de 0x4C39
	ld b,010h		;4c28
	ld a,000h		;4c2a
L_4C2C:
	ld d,(hl)			;4c2c   ; rojo-azul y verde de cada uno
	inc hl			;4c2d
	ld e,(hl)			;4c2e
	inc hl			;4c2f
	push af			;4c30
	call pon_color		;4c31   ; uno a uno
	pop af			;4c34
	inc a			;4c35
	djnz L_4C2C		;4c36
	ret			;4c38

; ----------------------------------------------------------------------
; DATOS resto_4C39: lo apuntan con el banco puesto p00:4C25 (0x4C39); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p00:4C25 (32 bytes)
;   0x4c39..0x4c59  (32 bytes)
DATA_resto_4C39:
	defb 000h,000h,000h,000h,011h,006h,033h,007h,017h,001h,027h,003h,051h,001h,027h,006h	; 4c39  ......3...'.Q.'.
	defb 071h,001h,073h,003h,061h,006h,064h,006h,011h,004h,065h,002h,055h,005h,077h,007h	; 4c49  q.s.a.d...e.U.w.

; ======================================================================
; CODIGO 0x4c59..0x51b2  (1369 bytes)
; ======================================================================


pon_paleta:		; fichas de 3 bytes [color][rojo-azul][verde] hasta 0xFF, con p00:4BF0
	ld a,(hl)			;4c59   ; el color (0xFF acaba)
	inc hl			;4c5a
	inc a			;4c5b
	ret z			;4c5c
	dec a			;4c5d
	ld d,(hl)			;4c5e   ; rojo-azul y verde
	inc hl			;4c5f
	ld e,(hl)			;4c60
	inc hl			;4c61
	call pon_color		;4c62   ; pon_color: el color A de la paleta a D (rojo-azul) y E (verde), por R#16, y su copia en 0xDDC0 + 2 x A
	jr pon_paleta		;4c65
espera_vdp:		; espera a que el VDP acabe la orden (S#2 bit 0, CE)
	ld a,002h		;4c67   ; S#2...
	call lee_estado		;4c69   ; lee_estado: A = el registro de estado A del VDP (R#15)
	rra			;4c6c   ; ...bit 0 (CE): el VDP aun esta con una orden
	jp c,espera_vdp		;4c6d   ; espera_vdp: espera a que el VDP acabe la orden (S#2 bit 0, CE)
	ret			;4c70
lee_estado:		; A = el registro de estado A del VDP (R#15)
	push bc			;4c71
	push hl			;4c72
	ld hl,(00006h)		;4c73   ; los puertos del VDP de la BIOS (0x0006 lectura, 0x0007 escritura) + 1: los de control
	inc h			;4c76
	inc l			;4c77
	ld c,h			;4c78
	di			;4c79
	out (c),a		;4c7a   ; R#15 = el estado que se quiere leer
	ld a,08fh		;4c7c
	out (c),a		;4c7e
	ld c,l			;4c80
	in a,(c)		;4c81   ; lo lee
	push af			;4c83
	xor a			;4c84   ; y R#15 vuelve a 0, el que espera la BIOS
	ld c,h			;4c85
	out (c),a		;4c86
	ld a,08fh		;4c88
	out (c),a		;4c8a
	pop af			;4c8c
	pop hl			;4c8d
	pop bc			;4c8e
	ei			;4c8f
	ret			;4c90
linea:		; orden LINE (0x70): una linea horizontal desde (H, L) de B puntos (0 = 256) del color C
	call espera_vdp		;4c91   ; espera_vdp: espera a que el VDP acabe la orden (S#2 bit 0, CE)
	push bc			;4c94   ; guarda el largo (BC)
	ld a,(00007h)		;4c95   ; C = el puerto del VDP de 0x0007 + 1: el de control
	inc a			;4c98
	ld c,a			;4c99
	ld a,024h		;4c9a   ; R#36 en adelante con autoincremento (R#17 = 36)
	di			;4c9c   ; sin interrupciones mientras se escriben los registros
	out (c),a		;4c9d
	ld a,091h		;4c9f   ; R#17 (0x91 = 17 con el bit 7: sin autoincremento no)
	out (c),a		;4ca1
	inc c			;4ca3   ; C + 2: el puerto de los registros (0x9B)
	inc c			;4ca4
	out (c),h		;4ca5   ; DX = H...
	xor a			;4ca7
	out (c),a		;4ca8   ; R#37 = 0
	out (c),l		;4caa   ; ...DY = L
	out (c),a		;4cac   ; R#39 = 0 (pagina 0)
	pop hl			;4cae
	out (c),h		;4caf   ; el largo: R#40 = B (de BC)...
	xor a			;4cb1
	cp h			;4cb2   ; ...0 vale 256
	jr nz,L_4CB6		;4cb3
	inc a			;4cb5   ; 0 se cambia por 1
L_4CB6:
	out (c),a		;4cb6   ; ...R#41 = 1 si B es 0 (256)
	xor a			;4cb8
	out (c),a		;4cb9   ; R#42 y R#43 (NY) a 0
	out (c),a		;4cbb
	out (c),l		;4cbd   ; R#44: el color (C de BC)
	out (c),a		;4cbf   ; R#45 = 0: el lado largo en horizontal
	ld a,070h		;4cc1   ; LINE, en horizontal (ARG = 0)
	out (c),a		;4cc3
	ei			;4cc5   ; interrupciones otra vez
	ret			;4cc6
linea_vertical:		; orden LINE (0x70): una linea vertical desde (H, L) de B puntos del color C
	call espera_vdp		;4cc7   ; espera_vdp: espera a que el VDP acabe la orden (S#2 bit 0, CE)
	push bc			;4cca   ; guarda el largo
	ld a,(00007h)		;4ccb   ; C = el puerto de control
	inc a			;4cce
	ld c,a			;4ccf
	ld a,024h		;4cd0   ; R#36 en adelante con autoincremento
	di			;4cd2   ; sin interrupciones
	out (c),a		;4cd3
	ld a,091h		;4cd5   ; R#17
	out (c),a		;4cd7
	inc c			;4cd9   ; C = 0x9B
	inc c			;4cda
	out (c),h		;4cdb   ; DX, DY
	xor a			;4cdd
	out (c),a		;4cde
	out (c),l		;4ce0   ; DY
	out (c),a		;4ce2
	pop hl			;4ce4
	out (c),h		;4ce5   ; el largo: R#40 = B (0 vale 256)
	xor a			;4ce7
	cp h			;4ce8
	jr nz,L_4CEC		;4ce9
	inc a			;4ceb
L_4CEC:
	out (c),a		;4cec   ; R#41
	xor a			;4cee
	out (c),a		;4cef
	out (c),a		;4cf1
	out (c),l		;4cf3   ; R#44: el color (C de BC)
	inc a			;4cf5   ; ARG = 1: el lado largo en vertical
	out (c),a		;4cf6
	ld a,070h		;4cf8   ; LINE
	out (c),a		;4cfa
	ei			;4cfc   ; interrupciones otra vez
	ret			;4cfd
marco:		; un marco de lineas: HL la esquina, DE el tamano
	ld b,e			;4cfe   ; el lado de arriba (vertical: B = E)...
	call L_4D16		;4cff
	ld b,d			;4d02   ; ...el de la izquierda...
	call L_4D20		;4d03
	push hl			;4d06   ; ...el de la derecha...
	ld a,l			;4d07   ; L + E: el lado de la derecha
	add a,e			;4d08
	ld l,a			;4d09
	ld b,d			;4d0a
	call L_4D20		;4d0b
	pop hl			;4d0e
	ld a,h			;4d0f   ; H + D: el lado de abajo
	add a,d			;4d10
	ld h,a			;4d11
	ld b,e			;4d12
	jp L_4D16		;4d13
L_4D16:
	push hl			;4d16   ; conserva HL, DE y BC
	push de			;4d17
	push bc			;4d18
	call linea_vertical		;4d19   ; linea_vertical: orden LINE (0x70): una linea vertical desde (H, L) de B puntos del color C
	pop bc			;4d1c
	pop de			;4d1d
	pop hl			;4d1e
	ret			;4d1f
L_4D20:
	push hl			;4d20   ; conserva HL, DE y BC
	push de			;4d21
	push bc			;4d22
	call linea		;4d23   ; linea: orden LINE (0x70): una linea horizontal desde (H, L) de B puntos (0 = 256) del color C
	pop bc			;4d26
	pop de			;4d27
	pop hl			;4d28
	ret			;4d29
rellena:		; orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
	ex af,af'			;4d2a   ; el color, aparte
	call espera_vdp		;4d2b   ; espera_vdp: espera a que el VDP acabe la orden (S#2 bit 0, CE)
	push bc			;4d2e   ; guarda el tamano
	ld a,(00007h)		;4d2f   ; C = el puerto de control
	inc a			;4d32
	ld c,a			;4d33
	ld a,024h		;4d34   ; R#36 en adelante: DX, DY (D = la pagina), NX, NY, color, ARG, orden
	di			;4d36   ; sin interrupciones
	out (c),a		;4d37
	ld a,091h		;4d39   ; R#17
	out (c),a		;4d3b
	inc c			;4d3d   ; C = 0x9B
	inc c			;4d3e
	out (c),h		;4d3f   ; DX = H
	xor a			;4d41
	out (c),a		;4d42
	out (c),l		;4d44   ; DY = L, la pagina D
	out (c),d		;4d46
	pop hl			;4d48   ; HL = el tamano
	out (c),h		;4d49   ; NX = H de BC (0 vale 256)
	cp h			;4d4b
	jr nz,L_4D4F		;4d4c
	inc a			;4d4e
L_4D4F:
	out (c),a		;4d4f
	xor a			;4d51
	out (c),l		;4d52   ; NY = L (0 vale 256)
	cp l			;4d54
	jr nz,L_4D58		;4d55
	inc a			;4d57
L_4D58:
	out (c),a		;4d58
	ex af,af'			;4d5a   ; el color
	out (c),a		;4d5b
	xor a			;4d5d   ; R#45 = 0 (ARG)
	out (c),a		;4d5e
	ld a,0c0h		;4d60   ; HMMV: rellena
	out (c),a		;4d62
	ei			;4d64   ; interrupciones otra vez
	ret			;4d65
copia_rectangulo:		; orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
	ex af,af'			;4d66
	call espera_vdp		;4d67   ; espera_vdp: espera a que el VDP acabe la orden (S#2 bit 0, CE)
	push bc			;4d6a   ; guarda el tamano
	ld a,(00007h)		;4d6b   ; C = el puerto de control
	inc a			;4d6e
	ld c,a			;4d6f
	ld a,020h		;4d70   ; R#32 en adelante: SX, SY, DX, DY, NX, NY, ARG, orden
	di			;4d72   ; sin interrupciones
	out (c),a		;4d73
	ld a,091h		;4d75   ; R#17
	out (c),a		;4d77
	inc c			;4d79   ; C = 0x9B
	inc c			;4d7a
	out (c),h		;4d7b   ; SX = H
	xor a			;4d7d
	out (c),a		;4d7e
	out (c),l		;4d80   ; SY = L
	ex af,af'			;4d82   ; la pagina de origen (bits 0-1 de A')
	ld l,a			;4d83
	and 003h		;4d84
	out (c),a		;4d86
	out (c),d		;4d88   ; DX = D, DY = E...
	xor a			;4d8a
	out (c),a		;4d8b
	out (c),e		;4d8d
	ld a,l			;4d8f   ; ...con la pagina de destino (bits 2-3 de A')
	rra			;4d90
	rra			;4d91
	and 003h		;4d92
	out (c),a		;4d94
	pop hl			;4d96   ; HL = el tamano
	out (c),h		;4d97   ; NX y NY
	xor a			;4d99
	out (c),a		;4d9a   ; R#41 = 0
	out (c),l		;4d9c
	out (c),a		;4d9e   ; R#43 = 0, R#44 = 0, R#45 = 0
	out (c),a		;4da0
	out (c),a		;4da2
	ld a,0d0h		;4da4   ; HMMM: copia el rectangulo
	out (c),a		;4da6
	ei			;4da8   ; interrupciones otra vez
	ret			;4da9
rectangulo_desde_ram:		; orden HMMC (0xF0) del VDP: el rectangulo DE, BC de tamano, con los bytes de HL
	ex af,af'			;4daa   ; HMMC desde la RAM HL: DX = D, DY = E, NX y NY de BC, color A'
	call espera_vdp		;4dab   ; espera_vdp: espera a que el VDP acabe la orden (S#2 bit 0, CE)
	push bc			;4dae   ; guarda el tamano
	ld a,(00007h)		;4daf   ; C = el puerto de control
	inc a			;4db2
	ld c,a			;4db3
	ld a,024h		;4db4
	di			;4db6   ; sin interrupciones
	out (c),a		;4db7
	ld a,091h		;4db9   ; R#17: desde R#36
	out (c),a		;4dbb
	inc c			;4dbd   ; C = 0x9B
	inc c			;4dbe
	out (c),d		;4dbf   ; DX = D
	xor a			;4dc1
	out (c),a		;4dc2
	out (c),e		;4dc4   ; DY = E
	ex af,af'			;4dc6
	out (c),a		;4dc7   ; la pagina (A')
	pop de			;4dc9   ; DE = el tamano
	out (c),d		;4dca   ; NX = D
	xor a			;4dcc
	out (c),a		;4dcd
	out (c),e		;4dcf   ; NY = E
	out (c),a		;4dd1
	ld a,(hl)			;4dd3   ; el primer byte va en R#44
	inc hl			;4dd4
	out (c),a		;4dd5
	xor a			;4dd7   ; R#45 = 0
	out (c),a		;4dd8
	ld a,0f0h		;4dda   ; HMMC
	out (c),a		;4ddc
	dec c			;4dde   ; C = el puerto de control
	dec c			;4ddf
	ld a,0ach		;4de0   ; R#44 sin autoincremento...
	out (c),a		;4de2
	ld a,091h		;4de4   ; R#17 = 44 sin autoincremento (0x80 + 44)
	out (c),a		;4de6
	inc c			;4de8   ; C = 0x9B
	inc c			;4de9
L_4DEA:
	ld a,002h		;4dea   ; ...y cada byte cuando el VDP lo pide (S#2: TR, bit 7)
	call lee_estado		;4dec   ; lee_estado: A = el registro de estado A del VDP (R#15)
	rra			;4def   ; bit 0 (CE): sin el, acabado
	ret nc			;4df0   ; CE a 0: acabado
	add a,a			;4df1   ; el bit 7 (TR): el VDP espera un byte
	add a,a			;4df2
	jr nc,L_4DEA		;4df3
	ld a,(hl)			;4df5   ; el byte siguiente a R#44
	inc hl			;4df6
	out (c),a		;4df7
	jr L_4DEA		;4df9
copia_logica:		; orden LMMM (0x90 + operacion) del VDP: copia el rectangulo HL a DE, BC de tamano; las paginas en los bits 4-7 de A' y la operacion logica en los 0-3
	ex af,af'			;4dfb
	call espera_vdp		;4dfc   ; espera_vdp: espera a que el VDP acabe la orden (S#2 bit 0, CE)
	push bc			;4dff   ; guarda el tamano
	ld a,(00007h)		;4e00   ; C = el puerto de control
	inc a			;4e03
	ld c,a			;4e04
	ld a,020h		;4e05   ; R#32 en adelante
	di			;4e07   ; sin interrupciones
	out (c),a		;4e08
	ld a,091h		;4e0a   ; R#17: desde R#32
	out (c),a		;4e0c
	inc c			;4e0e   ; C = 0x9B
	inc c			;4e0f
	out (c),h		;4e10   ; SX = H
	xor a			;4e12
	out (c),a		;4e13
	out (c),l		;4e15   ; SY = L
	ex af,af'			;4e17   ; las paginas en los bits 4-7 de A'...
	rlca			;4e18
	rlca			;4e19
	ld l,a			;4e1a
	and 003h		;4e1b   ; la pagina de origen
	out (c),a		;4e1d
	out (c),d		;4e1f   ; DX = D
	xor a			;4e21
	out (c),a		;4e22
	out (c),e		;4e24   ; DY = E
	ld a,l			;4e26
	ld e,a			;4e27
	rlca			;4e28   ; la pagina de destino
	rlca			;4e29
	and 003h		;4e2a
	out (c),a		;4e2c
	pop hl			;4e2e   ; HL = el tamano
	out (c),h		;4e2f   ; NX = H
	xor a			;4e31
	out (c),a		;4e32
	out (c),l		;4e34   ; NY = L
	out (c),a		;4e36
	out (c),a		;4e38   ; R#44 = 0, R#45 = 0
	out (c),a		;4e3a
	ld a,e			;4e3c   ; ...y la operacion logica en los bits 0-3
	rra			;4e3d
	rra			;4e3e
	and 00fh		;4e3f
	or 090h		;4e41   ; LMMM: copia con operacion logica (TIMP: sin el color 0)
	out (c),a		;4e43   ; la orden
	ei			;4e45   ; interrupciones otra vez
	ret			;4e46
caracteres_de_un_bit:		; pinta B caracteres de un bit por punto de HL, con el color C, desde DE
	call L_4E76		;4e47   ; un caracter...
	call siguiente_columna		;4e4a   ; ...y 8 puntos a la derecha
	djnz caracteres_de_un_bit		;4e4d
	ret			;4e4f
L_4E50:
	ld b,008h		;4e50   ; un caracter de un bit a 4 bits en 0xDE10: 8 filas
	ld de,0de10h		;4e52
L_4E55:
	push bc			;4e55
	push hl			;4e56
	ex de,hl			;4e57
	ld a,(de)			;4e58   ; la fila: 8 puntos en 8 bits
	ld d,a			;4e59
	ld b,004h		;4e5a   ; 4 bytes por fila
L_4E5C:
	ld a,c			;4e5c   ; dos puntos por byte: el bit a 1 da el color C...
	rl d		;4e5d   ; el bit de la izquierda
	jr c,L_4E62		;4e5f
	xor a			;4e61   ; ...el 0, el color 0
L_4E62:
	rld		;4e62   ; entra por la derecha de (HL)
	ld a,c			;4e64
	rl d		;4e65   ; el segundo punto
	jr c,L_4E6A		;4e67
	xor a			;4e69
L_4E6A:
	rld		;4e6a
	inc hl			;4e6c   ; el byte siguiente del bufer
	djnz L_4E5C		;4e6d
	ex de,hl			;4e6f   ; HL = el caracter otra vez
	pop hl			;4e70
	inc hl			;4e71   ; la fila siguiente del caracter
	pop bc			;4e72
	djnz L_4E55		;4e73   ; las 8 filas
	ret			;4e75
L_4E76:
	push bc			;4e76   ; un caracter de un bit en la posicion DE (x, y)
	push de			;4e77
	push hl			;4e78
	push de			;4e79
	call L_4E50		;4e7a   ; pasado a 4 bits en 0xDE10
	pop de			;4e7d
	ld b,d			;4e7e   ; la direccion de SCREEN 5: y x 128 + x / 2...
	ld d,e			;4e7f
	ld e,b			;4e80
	srl d		;4e81   ; / 2...
	rr e		;4e83
	ld a,d			;4e85   ; ...en la pagina 1 (0x8000 en adelante)
	add a,080h		;4e86
	ld d,a			;4e88
	ld hl,0de10h		;4e89
	ld b,008h		;4e8c
L_4E8E:
	push bc			;4e8e   ; 8 filas de 4 bytes...
	ld bc,00004h		;4e8f   ; 4 bytes
	call copia_a_vram		;4e92   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	ex de,hl			;4e95
	ld bc,00080h		;4e96   ; ...cada una 128 bytes mas abajo
	add hl,bc			;4e99
	ex de,hl			;4e9a
	pop bc			;4e9b
	djnz L_4E8E		;4e9c
	pop hl			;4e9e
	ld bc,00008h		;4e9f   ; el caracter siguiente, 8 bytes despues
	add hl,bc			;4ea2
	pop de			;4ea3   ; los registros como estaban
	pop bc			;4ea4
	ret			;4ea5
texto:		; pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	call guarda_y_13_14_15		;4ea6   ; texto con [x y] delante, mascara 0xFF: pinta
	jr L_4EBA		;4ea9
texto_c0:		; como texto, con C = 0
	call guarda_y_13_14_15		;4eab   ; con [x y] delante, mascara 0: borra (todo caracter 0)
	jr L_4EBE		;4eae
L_4EB0:
	call guarda_y_13_14_15		;4eb0   ; con [x y] delante y la mascara C de quien llama
	jr L_4EC0		;4eb3
texto_en_de:		; pinta el texto HL en la posicion DE (sin [x y] delante)
	call guarda_y_13_14_15		;4eb5   ; en la posicion DE, sin [x y] delante
	jr L_4EC4		;4eb8
L_4EBA:
	ld c,0ffh		;4eba   ; mascara 0xFF: el caracter tal cual
	jr L_4EC0		;4ebc
L_4EBE:
	ld c,000h		;4ebe   ; mascara 0: borra
L_4EC0:
	ld d,(hl)			;4ec0   ; [x y]: D = x, E = y
	inc hl			;4ec1
	ld e,(hl)			;4ec2
	inc hl			;4ec3
L_4EC4:
	ld a,(hl)			;4ec4   ; el caracter
	inc hl			;4ec5   ; el siguiente
	ld b,a			;4ec6
	inc b			;4ec7   ; 0xFF acaba y devuelve los bancos
	jp z,devuelve_reparto		;4ec8   ; devuelve_reparto: vuelve a poner el reparto guardado en 0xED46-0xED48
	inc b			;4ecb   ; 0xFE trae otra posicion
	jr z,L_4EBA		;4ecc
	cp 0fdh		;4ece   ; 0xFD es medio espacio
	jr z,L_4EE6		;4ed0
	and c			;4ed2   ; el caracter con la mascara
	push af			;4ed3
	call caracter		;4ed4   ; el caracter, de la fuente de la pagina 1
	pop af			;4ed7
	cp 00ch		;4ed8   ; 0x0C y 0x0D (estrechos) solo avanzan 4 puntos
	jr z,L_4EF6		;4eda
	cp 00dh		;4edc
	jr z,L_4EF6		;4ede
	ld a,d			;4ee0   ; los demas, 8
	add a,008h		;4ee1
	ld d,a			;4ee3
	jr L_4EC4		;4ee4
L_4EE6:
	push hl			;4ee6   ; medio espacio: un rectangulo 4x8 de color 0
	push de			;4ee7
	push bc			;4ee8
	ld bc,00408h		;4ee9   ; 4 x 8
	ex de,hl			;4eec
	xor a			;4eed
	ld d,000h		;4eee
	call rellena		;4ef0   ; de color 0
	pop bc			;4ef3   ; los registros como estaban
	pop de			;4ef4
	pop hl			;4ef5
L_4EF6:
	ld a,d			;4ef6   ; 4 puntos a la derecha
	add a,004h		;4ef7
	ld d,a			;4ef9
	jr L_4EC4		;4efa
lista_de_caracteres:		; pinta la lista de caracteres HL (0xFF acaba, 0xFE baja de linea) desde DE
	push de			;4efc   ; una lista de caracteres de la fuente de 0x38 (p00:4F44)
L_4EFD:
	ld a,(hl)			;4efd
	inc hl			;4efe
	ld c,a			;4eff
	inc a			;4f00   ; 0xFF acaba
	jr z,L_4F1A		;4f01
	inc a			;4f03   ; 0xFE: la linea siguiente, con [dx] de sangria
	jr nz,L_4F11		;4f04
	pop de			;4f06
	ld a,(hl)			;4f07
	inc hl			;4f08
	add a,d			;4f09
	ld d,a			;4f0a
	ld a,008h		;4f0b   ; 8 puntos mas abajo
	add a,e			;4f0d
	ld e,a			;4f0e
	jr lista_de_caracteres		;4f0f
L_4F11:
	ld a,c			;4f11   ; el caracter y 8 puntos a la derecha
	call L_4F44		;4f12
	call siguiente_columna		;4f15   ; siguiente_columna: D += 8; si da la vuelta, E += 8
	jr L_4EFD		;4f18
L_4F1A:
	pop de			;4f1a
	ret			;4f1b
caracter:		; pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	push bc			;4f1c   ; el caracter A de la fuente de la fila 0 de la pagina 1
	ld c,000h		;4f1d
L_4F1F:
	push hl			;4f1f
	push de			;4f20
	call L_4F60		;4f21   ; su sitio en la hoja de la fuente
	ld bc,00808h		;4f24   ; 8x8 puntos...
	ld a,001h		;4f27   ; ...de la pagina 1 a la 0 (HMMM)
	call copia_rectangulo		;4f29   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
	pop de			;4f2c
	pop hl			;4f2d
	pop bc			;4f2e
	ret			;4f2f
L_4F30:
	push bc			;4f30   ; lo mismo con la fuente de la fila 0x28
	ld c,028h		;4f31
	jr L_4F1F		;4f33
L_4F35:
	push bc			;4f35   ; con la de la fila 0x30
	ld c,030h		;4f36
	jr L_4F1F		;4f38
L_4F3A:
	push bc			;4f3a   ; con la de la fila 0x68
	ld c,068h		;4f3b
	jr L_4F1F		;4f3d
L_4F3F:
	push bc			;4f3f   ; con la de la fila 0xA8
	ld c,0a8h		;4f40
	jr L_4F1F		;4f42
L_4F44:
	push bc			;4f44   ; el caracter A de la fuente de la fila 0x38, de la pagina 1...
	push hl			;4f45
	push de			;4f46
	call L_4F56		;4f47
	ld bc,00808h		;4f4a
	ld a,005h		;4f4d   ; ...con las paginas 1 a 1 (A' = 5)
	call copia_rectangulo		;4f4f   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
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
	ld b,a			;4f60   ; en la hoja de 32 caracteres por fila: x = (A & 0x1F) x 8...
	and 01fh		;4f61
	add a,a			;4f63
	add a,a			;4f64
	add a,a			;4f65
	ld h,a			;4f66
	ld a,b			;4f67   ; ...y = (A >> 5) x 8 + C
	and 0e0h		;4f68
	rrca			;4f6a
	rrca			;4f6b
	add a,c			;4f6c
	ld l,a			;4f6d
	ret			;4f6e
siguiente_columna:		; D += 8; si da la vuelta, E += 8
	ld a,d			;4f6f   ; x += 8...
	add a,008h		;4f70
	ld d,a			;4f72
	ret nz			;4f73   ; ...y si da la vuelta, la fila de abajo
	ld a,e			;4f74
	add a,008h		;4f75
	ld e,a			;4f77
	ret			;4f78
bufer_a_vram:		; B caracteres de 8x8 del bufer HL a la VRAM DE
	push bc			;4f79   ; B caracteres de 8x8 del bufer HL a la VRAM DE
	call L_4F8E		;4f7a
	ld a,004h		;4f7d   ; 4 bytes (8 puntos) a la derecha...
	add a,e			;4f7f
	cp 080h		;4f80   ; ...hasta el borde (128 bytes por linea)...
	jr nz,L_4F89		;4f82
	ld a,004h		;4f84   ; ...y entonces 8 lineas mas abajo
	add a,d			;4f86
	ld d,a			;4f87
	xor a			;4f88
L_4F89:
	ld e,a			;4f89
	pop bc			;4f8a
	djnz bufer_a_vram		;4f8b
	ret			;4f8d
L_4F8E:
	push de			;4f8e   ; un caracter: 8 filas de 4 bytes...
	ld b,008h		;4f8f
L_4F91:
	push bc			;4f91
	ld bc,00004h		;4f92
	call copia_a_vram		;4f95   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	ex de,hl			;4f98
	ld bc,00080h		;4f99   ; ...cada una 128 bytes mas abajo
	add hl,bc			;4f9c
	ex de,hl			;4f9d
	pop bc			;4f9e
	djnz L_4F91		;4f9f
	pop de			;4fa1
	ret			;4fa2
dibujos:		; pinta la lista de dibujos HL ([n] y fichas de 6 bytes) con las paletas de la tabla DE
	ld b,(hl)			;4fa3   ; B = cuantas fichas
	inc hl			;4fa4
L_4FA5:
	push bc			;4fa5
	push de			;4fa6
	ld a,(hl)			;4fa7   ; C = [paleta-tipo]
	ld c,a			;4fa8
	ex de,hl			;4fa9
	and 0f0h		;4faa   ; el nibble alto elige la paleta...
	rrca			;4fac
	rrca			;4fad
	rrca			;4fae
	rrca			;4faf
	call palabra_a		;4fb0   ; ...en la tabla de DE
	push de			;4fb3
	push bc			;4fb4
	ld a,c			;4fb5   ; los bits 1-2: 2, 4 u 8 colores...
	and 006h		;4fb6
	add a,a			;4fb8
	jr nz,L_4FBD		;4fb9
	ld a,002h		;4fbb
L_4FBD:
	ld c,a			;4fbd
	ld b,000h		;4fbe
	ld de,0ec00h		;4fc0   ; ...copiados a 0xEC00
	ldir		;4fc3
	pop bc			;4fc5
	pop hl			;4fc6
	inc hl			;4fc7
	ld e,(hl)			;4fc8   ; DE = la direccion de la VRAM...
	inc hl			;4fc9
	ld d,(hl)			;4fca
	inc hl			;4fcb
	ld b,(hl)			;4fcc   ; ...B = cuantos caracteres...
	inc hl			;4fcd
	ld a,(hl)			;4fce   ; ...HL = el dibujo
	inc hl			;4fcf
	push hl			;4fd0
	ld h,(hl)			;4fd1
	ld l,a			;4fd2
	call dibujo		;4fd3   ; lo pinta
	pop hl			;4fd6
	pop de			;4fd7
	inc hl			;4fd8   ; la ficha siguiente
	pop bc			;4fd9
	djnz L_4FA5		;4fda
	ret			;4fdc
dibujo:		; pinta un dibujo de B caracteres (tipo C & 0x0F: 1, 2 o 3 bits por punto) en el bufer 0xE400 y de ahi a la VRAM
	ld a,c			;4fdd   ; el tipo: el nibble bajo de C
	and 00fh		;4fde
	jr z,L_4FF2		;4fe0   ; 0: un bit por punto
	dec a			;4fe2
	jr z,L_5008		;4fe3   ; 1: un bit, al reves
	dec a			;4fe5
	jr z,L_504B		;4fe6   ; 2: dos bits
	dec a			;4fe8
	jr z,L_5061		;4fe9   ; 3: dos bits, al reves
	dec a			;4feb
	jp z,L_50AC		;4fec   ; 4: tres bits; 5: tres bits, al reves
	jp L_50C2		;4fef
L_4FF2:
	push bc			;4ff2
	push de			;4ff3
	exx			;4ff4
	ld hl,0e400h		;4ff5   ; el bufer de 4 bits, en el HL' de reserva
	exx			;4ff8
L_4FF9:
	push bc			;4ff9   ; B caracteres pasados a 4 bits
	call L_501E		;4ffa
	pop bc			;4ffd
	djnz L_4FF9		;4ffe
	pop de			;5000
	pop bc			;5001
	ld hl,0e400h		;5002   ; y del bufer a la VRAM
	jp bufer_a_vram		;5005   ; bufer_a_vram: B caracteres de 8x8 del bufer HL a la VRAM DE
L_5008:
	push bc			;5008
	push de			;5009
	exx			;500a
	ld hl,0e400h		;500b   ; apunta a el bufer de un dibujo a 4 bits antes de la VRAM
	exx			;500e
L_500F:
	push bc			;500f
	call L_501E		;5010
	pop bc			;5013
	djnz L_500F		;5014
	pop de			;5016
	pop bc			;5017
	ld hl,0e400h		;5018   ; al reves: de derecha a izquierda (p00:513B)
	jp L_513B		;501b
L_501E:
	ld b,008h		;501e   ; 8 filas de un byte
L_5020:
	ld e,(hl)			;5020
	inc hl			;5021
	push bc			;5022
	call L_502A		;5023   ; 8 puntos: 4 bytes de 4 bits
	pop bc			;5026
	djnz L_5020		;5027
	ret			;5029
L_502A:
	ld b,004h		;502a
L_502C:
	xor a			;502c   ; un bit...
	rl e		;502d
	rla			;502f
	exx			;5030
	ld e,a			;5031   ; ...elige uno de los 2 colores de 0xEC00...
	ld d,0ech		;5032
	ld a,(de)			;5034
	add a,a			;5035
	add a,a			;5036
	add a,a			;5037
	add a,a			;5038   ; ...en el nibble alto
	ld c,a			;5039
	exx			;503a
	xor a			;503b   ; el bit siguiente...
	rl e		;503c
	rla			;503e
	exx			;503f
	ld e,a			;5040
	ld d,0ech		;5041
	ld a,(de)			;5043
	or c			;5044   ; ...en el nibble bajo
	ld (hl),a			;5045   ; al bufer
	inc hl			;5046
	exx			;5047
	djnz L_502C		;5048
	ret			;504a
L_504B:
	push bc			;504b
	push de			;504c
	exx			;504d
	ld hl,0e400h		;504e   ; apunta a el bufer de un dibujo a 4 bits antes de la VRAM
	exx			;5051
L_5052:
	push bc			;5052
	call L_5077		;5053
	pop bc			;5056
	djnz L_5052		;5057
	pop de			;5059
	pop bc			;505a
	ld hl,0e400h		;505b   ; apunta a el bufer de un dibujo a 4 bits antes de la VRAM
	jp bufer_a_vram		;505e   ; bufer_a_vram: B caracteres de 8x8 del bufer HL a la VRAM DE
L_5061:
	push bc			;5061
	push de			;5062
	exx			;5063
	ld hl,0e400h		;5064   ; apunta a el bufer de un dibujo a 4 bits antes de la VRAM
	exx			;5067
L_5068:
	push bc			;5068
	call L_5077		;5069
	pop bc			;506c
	djnz L_5068		;506d
	pop de			;506f
	pop bc			;5070
	ld hl,0e400h		;5071   ; apunta a el bufer de un dibujo a 4 bits antes de la VRAM
	jp L_513B		;5074
L_5077:
	ld b,008h		;5077   ; 8 filas de dos bytes
L_5079:
	push bc			;5079
	call L_5081		;507a
	pop bc			;507d
	djnz L_5079		;507e
	ret			;5080
L_5081:
	ld b,004h		;5081   ; cada fila: el plano bajo en E, el alto en D
	ld e,(hl)			;5083
	inc hl			;5084
	ld d,(hl)			;5085
	inc hl			;5086
L_5087:
	xor a			;5087   ; dos bits (uno de cada plano)...
	rl d		;5088
	rla			;508a
	rl e		;508b
	rla			;508d
	exx			;508e
	ld e,a			;508f
	ld d,0ech		;5090   ; ...eligen uno de los 4 colores...
	ld a,(de)			;5092
	add a,a			;5093
	add a,a			;5094
	add a,a			;5095
	add a,a			;5096
	ld c,a			;5097
	exx			;5098
	xor a			;5099   ; ...y otros dos para el nibble bajo
	rl d		;509a
	rla			;509c
	rl e		;509d
	rla			;509f
	exx			;50a0
	ld e,a			;50a1
	ld d,0ech		;50a2
	ld a,(de)			;50a4
	or c			;50a5
	ld (hl),a			;50a6   ; al bufer
	inc hl			;50a7
	exx			;50a8
	djnz L_5087		;50a9
	ret			;50ab
L_50AC:
	push bc			;50ac
	push de			;50ad
	exx			;50ae
	ld hl,0e400h		;50af   ; apunta a el bufer de un dibujo a 4 bits antes de la VRAM
	exx			;50b2
L_50B3:
	push bc			;50b3
	call L_50D8		;50b4
	pop bc			;50b7
	djnz L_50B3		;50b8
	pop de			;50ba
	pop bc			;50bb
	ld hl,0e400h		;50bc   ; apunta a el bufer de un dibujo a 4 bits antes de la VRAM
	jp bufer_a_vram		;50bf   ; bufer_a_vram: B caracteres de 8x8 del bufer HL a la VRAM DE
L_50C2:
	push bc			;50c2
	push de			;50c3
	exx			;50c4
	ld hl,0e400h		;50c5   ; apunta a el bufer de un dibujo a 4 bits antes de la VRAM
	exx			;50c8
L_50C9:
	push bc			;50c9
	call L_50D8		;50ca
	pop bc			;50cd
	djnz L_50C9		;50ce
	pop de			;50d0
	pop bc			;50d1
	ld hl,0e400h		;50d2   ; apunta a el bufer de un dibujo a 4 bits antes de la VRAM
	jp L_513B		;50d5
L_50D8:
	ld b,008h		;50d8   ; 8 filas de tres bytes
L_50DA:
	push bc			;50da
	call L_50E2		;50db
	pop bc			;50de
	djnz L_50DA		;50df
	ret			;50e1
L_50E2:
	ld b,004h		;50e2   ; cada fila: tres planos en E, D y C
	ld e,(hl)			;50e4
	inc hl			;50e5
	ld d,(hl)			;50e6
	inc hl			;50e7
	ld c,(hl)			;50e8
	inc hl			;50e9
L_50EA:
	xor a			;50ea   ; tres bits eligen uno de los 8 colores...
	rl c		;50eb   ; el plano de C...
	rla			;50ed
	rl d		;50ee   ; ...el de D...
	rla			;50f0
	rl e		;50f1   ; ...y el de E: tres bits
	rla			;50f3
	exx			;50f4
	ld e,a			;50f5
	ld d,0ech		;50f6   ; el color en 0xEC00 + bits
	ld a,(de)			;50f8
	add a,a			;50f9
	add a,a			;50fa
	add a,a			;50fb
	add a,a			;50fc
	ld c,a			;50fd
	exx			;50fe   ; ...y otros tres el nibble bajo
	xor a			;50ff
	rl c		;5100   ; los tres bits del punto siguiente
	rla			;5102
	rl d		;5103
	rla			;5105
	rl e		;5106
	rla			;5108
	exx			;5109
	ld e,a			;510a
	ld d,0ech		;510b
	ld a,(de)			;510d
	or c			;510e   ; dos puntos en un byte
	ld (hl),a			;510f   ; al bufer
	inc hl			;5110
	exx			;5111
	djnz L_50EA		;5112
	ret			;5114
L_5115:
	push de			;5115   ; un caracter del bufer, al reves: 8 filas...
	ld a,(00007h)		;5116
	ld c,a			;5119
	ld b,008h		;511a
L_511C:
	push bc			;511c
	ex de,hl			;511d
	call vram_para_escribir		;511e   ; vram_para_escribir: pone la direccion HL de la VRAM (17 bits, R#14) para escribir
	ex de,hl			;5121
	ld b,004h		;5122
L_5124:
	ld a,(hl)			;5124   ; ...de 4 bytes leidos hacia atras, con los nibbles cambiados
	dec hl			;5125
	rrca			;5126
	rrca			;5127
	rrca			;5128
	rrca			;5129
	out (c),a		;512a
	djnz L_5124		;512c
	ld c,008h		;512e   ; la fila siguiente del bufer...
	add hl,bc			;5130
	ex de,hl			;5131
	ld c,080h		;5132   ; ...y de la VRAM
	add hl,bc			;5134
	ex de,hl			;5135
	pop bc			;5136
	djnz L_511C		;5137
	pop de			;5139
	ret			;513a
L_513B:
	inc hl			;513b   ; HL al final de la primera fila
	inc hl			;513c
	inc hl			;513d
L_513E:
	push bc			;513e   ; un caracter al reves...
	call L_5115		;513f
	ld a,004h		;5142   ; ...y 8 puntos a la derecha (o 8 lineas abajo al llegar al borde)
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
	ld a,(0e1cbh)		;5153   ; sin 0xE1CB, el dibujo de 0xBA9B o, con 0xE1FE, el de 0xBA8E (p15)
	or a			;5156
	jr z,L_5168		;5157
	ld a,(0e19bh)		;5159   ; con 0xE1CB, segun la entrada (0xE19B / 2): la 7.a va a 0x96EE...
	rra			;515c
	and 07fh		;515d
	cp 006h		;515f
	jr z,L_5180		;5161
	ld hl,07925h		;5163   ; ...las demas al de p13:7925
	jr L_5174		;5166
L_5168:
	ld hl,0ba9bh		;5168
	ld a,(0e1feh)		;516b   ; lee el lado por el que batea (0 si IX+6 de su ficha es 0x20, si no 1): elige las tablas del otro lado
	or a			;516e
	jr z,L_5174		;516f
	ld hl,0ba8eh		;5171
L_5174:
	call bancos_13_14_15		;5174   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
L_5177:
	ld de,051b2h		;5177   ; los colores en la tabla de 0x51B2
	call dibujos		;517a   ; dibujos: pinta la lista de dibujos HL ([n] y fichas de 6 bytes) con las paletas de la tabla DE
	jp bancos_1_2_3		;517d   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5180:
	ld hl,096eeh		;5180
	jr L_51AD		;5183
L_5185:
	ld hl,094bbh		;5185   ; los de p11, cada par con o sin 0xE1FE
	ld a,(0e1feh)		;5188   ; lee el lado por el que batea (0 si IX+6 de su ficha es 0x20, si no 1): elige las tablas del otro lado
	or a			;518b
	jr z,L_51AD		;518c
	ld hl,094aeh		;518e
	jr L_51AD		;5191
L_5193:
	ld hl,09401h		;5193   ; p11:9401, o 0x93F4 con 0xE1FE
	ld a,(0e1feh)		;5196   ; lee el lado por el que batea (0 si IX+6 de su ficha es 0x20, si no 1): elige las tablas del otro lado
	or a			;5199
	jr z,L_51AD		;519a
	ld hl,093f4h		;519c
	jr L_51AD		;519f
L_51A1:
	ld hl,095a8h		;51a1
	ld a,(0e1feh)		;51a4   ; lee el lado por el que batea (0 si IX+6 de su ficha es 0x20, si no 1): elige las tablas del otro lado
	or a			;51a7
	jr z,L_51AD		;51a8
	ld hl,095bbh		;51aa
L_51AD:
	call bancos_10_11_12		;51ad   ; bancos_10_11_12: pone los bancos 10, 11 y 12 (los graficos) y sus copias
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
	call bancos_7_8_9		;51be   ; bancos_7_8_9: pone los bancos 7, 8 y 9 (los graficos) y sus copias
	ld de,0602bh		;51c1
	ld hl,060aeh		;51c4
	call dibujos		;51c7   ; dibujos: pinta la lista de dibujos HL ([n] y fichas de 6 bytes) con las paletas de la tabla DE
	jp bancos_1_2_3		;51ca   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_51CD:
	call bancos_10_11_12		;51cd   ; 64 bytes de p11:8719 a los dibujos de sprite 0x40-0x47 (VRAM 0xFA00)
	ld hl,08719h		;51d0
	ld de,0fa00h		;51d3
	ld bc,00040h		;51d6
	call copia_a_vram		;51d9   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	jp bancos_1_2_3		;51dc   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_51DF:
	ld a,(0e218h)		;51df   ; segun 0xE218 contra IX+7, el dibujo de p11:8699 o el de 0x86D9...
	cp (ix+007h)		;51e2
	ld hl,08699h		;51e5
	jr c,L_51ED		;51e8
	ld hl,086d9h		;51ea
L_51ED:
	call bancos_10_11_12		;51ed   ; bancos_10_11_12: pone los bancos 10, 11 y 12 (los graficos) y sus copias
	ld de,0fa00h		;51f0   ; ...a los dibujos de sprite 0x40-0x47
	ld bc,00040h		;51f3
	call copia_a_vram		;51f6   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	jp bancos_1_2_3		;51f9   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_51FC:
	call L_5202		;51fc
	jp bancos_13_14_15		;51ff   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
L_5202:
	call bancos_10_11_12		;5202   ; rachas de p12:BBFE a los dibujos de sprite 0x00-0x0B...
	ld de,0bbfeh		;5205
	ld hl,0f800h		;5208
	call rachas		;520b   ; rachas: descomprime las rachas de DE a la VRAM HL (C = 0: sin girar)
	ld de,0bc2fh		;520e   ; ...y de p12:BC2F a los 0x0C en adelante
	ld hl,0f860h		;5211
	call rachas		;5214   ; rachas: descomprime las rachas de DE a la VRAM HL (C = 0: sin girar)
	ld a,008h		;5217   ; el color 8 a 0x73 0x07
	ld de,07307h		;5219
	call pon_color		;521c   ; pon_color: el color A de la paleta a D (rojo-azul) y E (verde), por R#16, y su copia en 0xDDC0 + 2 x A
	jp bancos_1_2_3		;521f   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5222:
	call L_5561		;5222   ; la paleta de p07:6000 (p00:5561) y, con 10-11-12...
	call bancos_10_11_12		;5225   ; bancos_10_11_12: pone los bancos 10, 11 y 12 (los graficos) y sus copias
	ld de,0a01fh		;5228   ; ...los dibujos de la lista p12:A05F
	ld hl,0a05fh		;522b
	call dibujos		;522e   ; dibujos: pinta la lista de dibujos HL ([n] y fichas de 6 bytes) con las paletas de la tabla DE
	ld hl,0b163h		;5231   ; 1248 bytes de dibujos de sprite (p12:B163) desde el 0x00
	ld de,0f800h		;5234
	ld bc,004e0h		;5237
	call copia_a_vram		;523a   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	ld hl,09feah		;523d   ; la lista de caracteres de p11:9FEA en (0x00, 0x80)
	ld de,00080h		;5240
	call lista_de_caracteres		;5243   ; lista_de_caracteres: pinta la lista de caracteres HL (0xFF acaba, 0xFE baja de linea) desde DE
	ld de,0e800h		;5246   ; 160 bytes de p11:9F4A al bufer 0xE800...
	ld hl,09f4ah		;5249
	ld bc,000a0h		;524c
	ldir		;524f
	ld de,04030h		;5251   ; ...y de ahi a la pantalla (p00:55CD)
	ld hl,0e800h		;5254   ; apunta a el bufer de las rachas descomprimidas en RAM
	ld bc,0100ah		;5257
	call bloque_de_fuente		;525a   ; bloque_de_fuente: B caracteres por fila y C filas de la fuente de la fila 0x28
	ld de,08080h		;525d   ; copia de la pagina 1 (0x40, 0x48) a (0x80, 0x80): 128 x 24 puntos
	ld hl,04048h		;5260
	ld bc,08018h		;5263
	ld a,004h		;5266
	call copia_rectangulo		;5268   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
	jp bancos_1_2_3		;526b   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_526E:
	call L_5561		;526e   ; la paleta, y con 10-11-12 las listas de dibujos de p12:A82F y p12:AD72...
	call bancos_10_11_12		;5271   ; bancos_10_11_12: pone los bancos 10, 11 y 12 (los graficos) y sus copias
	ld de,0a7efh		;5274
	ld hl,0a82fh		;5277
	call dibujos		;527a   ; dibujos: pinta la lista de dibujos HL ([n] y fichas de 6 bytes) con las paletas de la tabla DE
	ld de,0ad58h		;527d
	ld hl,0ad72h		;5280
	call dibujos		;5283   ; dibujos: pinta la lista de dibujos HL ([n] y fichas de 6 bytes) con las paletas de la tabla DE
	ld hl,0b643h		;5286   ; ...128 bytes de dibujos de sprite (p12:B643)...
	ld de,0f800h		;5289
	ld bc,00080h		;528c
	call copia_a_vram		;528f   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	ld hl,0a7b8h		;5292   ; ...la lista de caracteres de p12:A7B8...
	ld de,00080h		;5295
	call lista_de_caracteres		;5298   ; lista_de_caracteres: pinta la lista de caracteres HL (0xFF acaba, 0xFE baja de linea) desde DE
	ld de,0e800h		;529b   ; ...y 160 bytes de p12:A718 al bufer y a la pantalla
	ld hl,0a718h		;529e
	ld bc,000a0h		;52a1
	ldir		;52a4
	ld de,04030h		;52a6
	ld hl,0e800h		;52a9   ; apunta a el bufer de las rachas descomprimidas en RAM
	ld bc,0100ah		;52ac
	call bloque_de_fuente		;52af   ; bloque_de_fuente: B caracteres por fila y C filas de la fuente de la fila 0x28
	jp bancos_1_2_3		;52b2   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
kanji_de_los_datos:		; los 17 kanji de p09:B942 en la casilla (0xF8, 0x18) de la hoja: los codigos 0x7F-0x8F
	call bancos_7_8_9		;52b5   ; 17 caracteres de un bit (p09:B942) en la VRAM 0xF818, color 0x0D
	ld de,0f818h		;52b8
	ld hl,0b942h		;52bb
	ld bc,0110dh		;52be
	call caracteres_de_un_bit		;52c1   ; caracteres_de_un_bit: pinta B caracteres de un bit por punto de HL, con el color C, desde DE
	jp bancos_1_2_3		;52c4   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
kanji_de_la_tabla:		; los 11 kanji de p09:B9DA en (0, 0x28) de la hoja: los codigos 0xA0-0xAA
	call bancos_7_8_9		;52c7   ; 11 caracteres de un bit (p09:B9DA) en (0x28, 0x00)...
	ld de,00028h		;52ca
L_52CD:
	ld hl,0b9dah		;52cd
	ld bc,00b0dh		;52d0
	call caracteres_de_un_bit		;52d3   ; caracteres_de_un_bit: pinta B caracteres de un bit por punto de HL, con el color C, desde DE
	jp bancos_1_2_3		;52d6   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
kanji_del_menu:		; los 11 kanji de p09:B9DA en (0x10, 0x20) de la hoja: los codigos 0x82-0x8C
	call bancos_7_8_9		;52d9   ; ...o en (0x20, 0x10)
	ld de,01020h		;52dc
	jr L_52CD		;52df
L_52E1:
	call L_52E7		;52e1
	jp bancos_13_14_15		;52e4   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
L_52E7:
	call bancos_7_8_9		;52e7   ; con 7-8-9: la lista de dibujos de p09:B07A...
	ld de,0b066h		;52ea
	ld hl,0b07ah		;52ed
	call dibujos		;52f0   ; dibujos: pinta la lista de dibujos HL ([n] y fichas de 6 bytes) con las paletas de la tabla DE
	ld hl,0b6b9h		;52f3   ; ...los caracteres de p09:B6B9 en (0x70, 0x28)...
	ld de,02870h		;52f6
	call lista_de_caracteres		;52f9   ; lista_de_caracteres: pinta la lista de caracteres HL (0xFF acaba, 0xFE baja de linea) desde DE
	ld a,00fh		;52fc   ; ...y los colores 15 y 12
	ld de,07000h		;52fe
	call pon_color		;5301   ; pon_color: el color A de la paleta a D (rojo-azul) y E (verde), por R#16, y su copia en 0xDDC0 + 2 x A
	ld a,00ch		;5304
	ld de,06006h		;5306
	call pon_color		;5309   ; pon_color: el color A de la paleta a D (rojo-azul) y E (verde), por R#16, y su copia en 0xDDC0 + 2 x A
	jp bancos_1_2_3		;530c   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_530F:
	call bancos_13_14_15		;530f   ; con 13-14-15: 256 bytes de p14:8FD1 a los dibujos de sprite 0xE0...
	ld de,0ff00h		;5312
	ld hl,08fd1h		;5315
	ld bc,00100h		;5318
	call copia_a_vram		;531b   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	ld de,090d1h		;531e   ; ...la lista de dibujos de p14:90DB...
	ld hl,090dbh		;5321
	call dibujos		;5324   ; dibujos: pinta la lista de dibujos HL ([n] y fichas de 6 bytes) con las paletas de la tabla DE
	ld de,0f800h		;5327   ; ...y 1280 bytes de p14:8AD1 desde el 0x00
	ld hl,08ad1h		;532a
	ld bc,00500h		;532d
	call copia_a_vram		;5330   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	jp bancos_1_2_3		;5333   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5336:
	call bancos_13_14_15		;5336   ; 384 bytes de p14:8951 a los dibujos de sprite 0x40 en adelante
	ld de,0fa00h		;5339
	ld hl,08951h		;533c
	ld bc,00180h		;533f
	call copia_a_vram		;5342   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	jp bancos_1_2_3		;5345   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5348:
	call bancos_13_14_15		;5348   ; 512 bytes de p14:8751 a los dibujos de sprite 0x00 en adelante
	ld de,0f800h		;534b
	ld hl,08751h		;534e
	ld bc,00200h		;5351
	call copia_a_vram		;5354   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	jp bancos_1_2_3		;5357   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_535A:
	call bancos_7_8_9		;535a   ; copia con 7-8-9 puesto (HL, DE y BC de quien llama)
	ldir		;535d
	jp bancos_1_2_3		;535f   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5362:
	ld hl,0e800h		;5362   ; 0xE800 = 0, 1, 2 ... 0x1D: una tira de numeros de caracter...
	ld b,01eh		;5365
	xor a			;5367
L_5368:
	ld (hl),a			;5368
	inc hl			;5369
	inc a			;536a
	djnz L_5368		;536b
	ld de,04020h		;536d   ; ...a la pantalla en (0x20, 0x40)
	ld hl,0e800h		;5370   ; apunta a el bufer de las rachas descomprimidas en RAM
	ld bc,00f02h		;5373
	call bloque_de_fuente		;5376   ; bloque_de_fuente: B caracteres por fila y C filas de la fuente de la fila 0x28
	jp bancos_1_2_3		;5379   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_537C:
	call L_538E		;537c   ; rachas de p12:BBC3 a los dibujos de sprite 0xA0 en adelante
	call bancos_10_11_12		;537f   ; bancos_10_11_12: pone los bancos 10, 11 y 12 (los graficos) y sus copias
	ld de,0bbc3h		;5382
	ld hl,0fd00h		;5385
	call rachas		;5388   ; rachas: descomprime las rachas de DE a la VRAM HL (C = 0: sin girar)
	jp bancos_1_2_3		;538b   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_538E:
	call bancos_10_11_12		;538e   ; rachas de p10:76BE a los dibujos de sprite 0xC0 en adelante
	ld de,076beh		;5391
	ld hl,0fe00h		;5394
	call rachas		;5397   ; rachas: descomprime las rachas de DE a la VRAM HL (C = 0: sin girar)
	jp bancos_1_2_3		;539a   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_539D:
	call bancos_10_11_12		;539d   ; rachas a los dibujos de sprite 0xB0 (p12:BC3C), 0x70 (p10:79AD)...
	ld de,0bc3ch		;53a0
	ld hl,0fd80h		;53a3
	call rachas		;53a6   ; rachas: descomprime las rachas de DE a la VRAM HL (C = 0: sin girar)
	ld de,079adh		;53a9
	ld hl,0fb80h		;53ac
	call rachas		;53af   ; rachas: descomprime las rachas de DE a la VRAM HL (C = 0: sin girar)
	ld de,07b90h		;53b2   ; ...0xE0 (p10:7B90) y 0xC4 (p11:9380)...
	ld hl,0ff00h		;53b5
	call rachas		;53b8   ; rachas: descomprime las rachas de DE a la VRAM HL (C = 0: sin girar)
	ld de,09380h		;53bb
	ld hl,0fe20h		;53be
	call rachas		;53c1   ; rachas: descomprime las rachas de DE a la VRAM HL (C = 0: sin girar)
	ld a,00dh		;53c4   ; ...y el dibujo de 64 bytes 0x0D a los 0xF8
	call dibujo_64		;53c6   ; dibujo_64: el dibujo de 64 bytes A (p11:8759 + 64 A)
	jp bancos_1_2_3		;53c9   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_53CC:
	call bancos_10_11_12		;53cc   ; rachas de p11:814B con su destino delante
	ld de,0814bh		;53cf
	call rachas_con_destino		;53d2   ; rachas_con_destino: rachas con el destino de la VRAM delante (2 bytes en DE)
	jp bancos_1_2_3		;53d5   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_53D8:
	call bancos_10_11_12		;53d8   ; bancos_10_11_12: pone los bancos 10, 11 y 12 (los graficos) y sus copias
	ld de,079adh		;53db
	ld hl,0fb80h		;53de
	call rachas		;53e1   ; rachas: descomprime las rachas de DE a la VRAM HL (C = 0: sin girar)
	jp bancos_1_2_3		;53e4   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_53E7:
	call bancos_10_11_12		;53e7   ; 128 bytes de p10:782D a los dibujos de sprite 0xC0
	ld de,0fe00h		;53ea
	ld hl,0782dh		;53ed
	call copia_a_vram		;53f0   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	xor a			;53f3
L_53F4:
	call bancos_10_11_12		;53f4   ; 128 bytes de p10:78AD a los 0xD0
	ld de,0fe80h		;53f7
	ld hl,078adh		;53fa
	call copia_a_vram		;53fd   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	jp bancos_1_2_3		;5400   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5403:
	call bancos_10_11_12		;5403   ; 0xED9F = 1 mientras se copian 128 bytes de p10:792D a los 0xE0
	ld a,001h		;5406
	ld (0ed9fh),a		;5408
	ld de,0ff00h		;540b
	ld hl,0792dh		;540e
	call copia_a_vram		;5411   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	xor a			;5414
	ld (0ed9fh),a		;5415
	jp bancos_1_2_3		;5418   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_541B:
	call L_5427		;541b
	jp bancos_13_14_15		;541e   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
L_5421:
	call L_546B		;5421
	jp bancos_13_14_15		;5424   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
L_5427:
	call apaga_pantalla		;5427   ; con la pantalla apagada: rachas de p11:8AD9 a los dibujos de sprite 0x00...
	call bancos_10_11_12		;542a   ; bancos_10_11_12: pone los bancos 10, 11 y 12 (los graficos) y sus copias
	ld hl,0f800h		;542d
	ld de,08ad9h		;5430
	call rachas		;5433   ; rachas: descomprime las rachas de DE a la VRAM HL (C = 0: sin girar)
	call bancos_7_8_9		;5436   ; ...la paleta de p07:6000, el color 13 a 0x77 0x07...
	ld hl,06000h		;5439
	call pon_paleta		;543c   ; pon_paleta: fichas de 3 bytes [color][rojo-azul][verde] hasta 0xFF, con p00:4BF0
	ld a,00dh		;543f
	ld de,07707h		;5441
	call pon_color		;5444   ; pon_color: el color A de la paleta a D (rojo-azul) y E (verde), por R#16, y su copia en 0xDDC0 + 2 x A
	ld de,0a5d8h		;5447   ; ...la lista de dibujos de p09:A619...
	ld hl,0a619h		;544a
	call dibujos		;544d   ; dibujos: pinta la lista de dibujos HL ([n] y fichas de 6 bytes) con las paletas de la tabla DE
	ld hl,0e800h		;5450   ; ...las rachas de p09:AFC4 al bufer 0xE800...
	ld de,0afc4h		;5453
	call rachas_a_ram		;5456   ; rachas_a_ram: descomprime las rachas de DE en la RAM HL
	ld de,08068h		;5459   ; ...y de ahi a la pantalla, 16 x 11 caracteres desde (0x80, 0x68)
	ld hl,0e800h		;545c   ; apunta a el bufer de las rachas descomprimidas en RAM
	ld bc,0100bh		;545f
	call bloque_de_fuente		;5462   ; bloque_de_fuente: B caracteres por fila y C filas de la fuente de la fila 0x28
	call bancos_1_2_3		;5465   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	jp enciende_pantalla		;5468   ; enciende_pantalla: R#1 con el bit 6 (BL) a 1 (WRTVDP)
L_546B:
	call bancos_10_11_12		;546b   ; rachas de p11:8FE3 a los dibujos de sprite 0x00
	ld hl,0f800h		;546e
	ld de,08fe3h		;5471
	call rachas		;5474   ; rachas: descomprime las rachas de DE a la VRAM HL (C = 0: sin girar)
	jp bancos_1_2_3		;5477   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_547A:
	call bancos_7_8_9		;547a   ; con 7-8-9: tres listas de dibujos (p07:6053, p07:6323, p07:69CA)
	ld de,0602bh		;547d
	ld hl,06053h		;5480
	call dibujos		;5483   ; dibujos: pinta la lista de dibujos HL ([n] y fichas de 6 bytes) con las paletas de la tabla DE
	ld de,062e5h		;5486
	ld hl,06323h		;5489
	call dibujos		;548c   ; dibujos: pinta la lista de dibujos HL ([n] y fichas de 6 bytes) con las paletas de la tabla DE
	ld de,069a4h		;548f
	ld hl,069cah		;5492
	call dibujos		;5495   ; dibujos: pinta la lista de dibujos HL ([n] y fichas de 6 bytes) con las paletas de la tabla DE
	jp bancos_1_2_3		;5498   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_549B:
	call bancos_7_8_9		;549b   ; dos listas de dibujos de p08 (0x8412 y 0x8B40)
	ld hl,08412h		;549e
	ld de,083e0h		;54a1
	call dibujos		;54a4   ; dibujos: pinta la lista de dibujos HL ([n] y fichas de 6 bytes) con las paletas de la tabla DE
	ld hl,08b40h		;54a7
	ld de,08b21h		;54aa
	call dibujos		;54ad   ; dibujos: pinta la lista de dibujos HL ([n] y fichas de 6 bytes) con las paletas de la tabla DE
	jp bancos_1_2_3		;54b0   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_54B3:
	call bancos_7_8_9		;54b3   ; seis listas de dibujos: p07:6CC3, 73D6, 75EC, 78B3, 7EF1 y p09:B759
	ld hl,06cc3h		;54b6
	ld de,06c87h		;54b9
	call dibujos		;54bc   ; dibujos: pinta la lista de dibujos HL ([n] y fichas de 6 bytes) con las paletas de la tabla DE
	ld hl,073d6h		;54bf
	ld de,073c4h		;54c2
	call dibujos		;54c5   ; dibujos: pinta la lista de dibujos HL ([n] y fichas de 6 bytes) con las paletas de la tabla DE
	ld hl,075ech		;54c8
	ld de,075b7h		;54cb
	call dibujos		;54ce   ; dibujos: pinta la lista de dibujos HL ([n] y fichas de 6 bytes) con las paletas de la tabla DE
	ld hl,078b3h		;54d1
	ld de,07881h		;54d4
	call dibujos		;54d7   ; dibujos: pinta la lista de dibujos HL ([n] y fichas de 6 bytes) con las paletas de la tabla DE
	ld hl,07ef1h		;54da
	ld de,07ed2h		;54dd
	call dibujos		;54e0   ; dibujos: pinta la lista de dibujos HL ([n] y fichas de 6 bytes) con las paletas de la tabla DE
	ld hl,0b759h		;54e3
	ld de,0b747h		;54e6
	call dibujos		;54e9   ; dibujos: pinta la lista de dibujos HL ([n] y fichas de 6 bytes) con las paletas de la tabla DE
	jp bancos_1_2_3		;54ec   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_54EF:
	call bancos_7_8_9		;54ef   ; la lista de dibujos de p08:8B53
	ld hl,08b53h		;54f2
	ld de,08b21h		;54f5
	call dibujos		;54f8   ; dibujos: pinta la lista de dibujos HL ([n] y fichas de 6 bytes) con las paletas de la tabla DE
	jp bancos_1_2_3		;54fb   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_54FE:
	add a,a			;54fe   ; la ficha A de 4 bytes de la tabla HL: [paletas][lista] para p00:4FA3
	add a,a			;54ff
	call hl_mas_a		;5500   ; hl_mas_a: HL = HL + A
	ld e,(hl)			;5503
	inc hl			;5504
	ld d,(hl)			;5505
	inc hl			;5506
	ld a,(hl)			;5507
	inc hl			;5508
	ld h,(hl)			;5509
	ld l,a			;550a
	jp dibujos		;550b   ; dibujos: pinta la lista de dibujos HL ([n] y fichas de 6 bytes) con las paletas de la tabla DE
L_550E:
	call bancos_7_8_9		;550e   ; la paleta de p07:6000...
	ld hl,06000h		;5511
	call pon_paleta		;5514   ; pon_paleta: fichas de 3 bytes [color][rojo-azul][verde] hasta 0xFF, con p00:4BF0
	ld a,(0d70ah)		;5517   ; ...el color 11 del equipo de 0xD70A...
	and 00fh		;551a
	ld hl,0bfdeh		;551c
	add a,a			;551f
	call hl_mas_a		;5520   ; hl_mas_a: HL = HL + A
	ld a,00bh		;5523
	ld d,(hl)			;5525
	inc hl			;5526
	ld e,(hl)			;5527
	call pon_color		;5528   ; pon_color: el color A de la paleta a D (rojo-azul) y E (verde), por R#16, y su copia en 0xDDC0 + 2 x A
	ld hl,0d70bh		;552b   ; ...y el color 8: con el bit 4 de 0xDE02 y sin el 5...
	ld a,(0de02h)		;552e   ; lee las marcas del modo: bit 6 un jugador, 5 dos jugadores, 4 PENNANT (contra el ordenador), 3 el ordenador solo
	bit 4,a		;5531
	jr z,L_554C		;5533
	bit 5,a		;5535
	jr nz,L_554C		;5537
	ld a,(0d6dch)		;5539   ; ...el del equipo de 0xE195 o de 0xE197 segun el bit 0 de 0xD6DC
	rra			;553c
	ld a,(0e197h)		;553d
	jr nc,L_5545		;5540
	ld a,(0e195h)		;5542
L_5545:
	dec a			;5545
	ld hl,0d70ah		;5546   ; apunta a los 6 equipos elegidos (0xFF libre)
	call hl_mas_a		;5549   ; hl_mas_a: HL = HL + A
L_554C:
	ld a,(hl)			;554c   ; su color en la tabla p09:BFDE
	and 00fh		;554d
	ld hl,0bfdeh		;554f
	add a,a			;5552
	call hl_mas_a		;5553   ; hl_mas_a: HL = HL + A
	ld a,008h		;5556
	ld d,(hl)			;5558
	inc hl			;5559
	ld e,(hl)			;555a
	call pon_color		;555b   ; pon_color: el color A de la paleta a D (rojo-azul) y E (verde), por R#16, y su copia en 0xDDC0 + 2 x A
	jp bancos_1_2_3		;555e   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5561:
	call bancos_7_8_9		;5561   ; la paleta de p07:6000
	ld hl,06000h		;5564
	call pon_paleta		;5567   ; pon_paleta: fichas de 3 bytes [color][rojo-azul][verde] hasta 0xFF, con p00:4BF0
	jp bancos_1_2_3		;556a   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
palabra_a:		; HL = la palabra A de la tabla HL
	add a,a			;556d   ; la palabra A de la tabla: HL + 2A...
	call hl_mas_a		;556e   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;5571   ; ...y se lee
	inc hl			;5572
	ld h,(hl)			;5573
	ld l,a			;5574
	ret			;5575
L_5576:
	call bancos_7_8_9		;5576   ; rachas de p08:9220 al bufer 0xE800...
	ld hl,0e800h		;5579   ; apunta a el bufer de las rachas descomprimidas en RAM
	ld de,09220h		;557c
	call rachas_a_ram		;557f   ; rachas_a_ram: descomprime las rachas de DE en la RAM HL
	ld de,00000h		;5582   ; ...y de ahi 32 x 27 caracteres a (0, 0) (p00:55F0)
	ld hl,0e800h		;5585   ; apunta a el bufer de las rachas descomprimidas en RAM
	ld bc,0201bh		;5588
	call L_55F0		;558b
	jp bancos_1_2_3		;558e   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5591:
	call 0988ah		;5591   ; p02:988A y las rachas de p08:9178 a 8 x 12 caracteres en (0xB8, 0x08)
	call bancos_7_8_9		;5594   ; bancos_7_8_9: pone los bancos 7, 8 y 9 (los graficos) y sus copias
	ld de,09178h		;5597
	ld hl,0e800h		;559a   ; apunta a el bufer de las rachas descomprimidas en RAM
	call rachas_a_ram		;559d   ; rachas_a_ram: descomprime las rachas de DE en la RAM HL
	ld de,0b808h		;55a0
	ld hl,0e800h		;55a3   ; apunta a el bufer de las rachas descomprimidas en RAM
	ld bc,0080ch		;55a6
	call L_5636		;55a9
	jp bancos_1_2_3		;55ac   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_55AF:
	call 09897h		;55af   ; p02:9897 y las rachas de p08:91CC a 8 x 12 caracteres en (0x08, 0x08)
	call bancos_7_8_9		;55b2   ; bancos_7_8_9: pone los bancos 7, 8 y 9 (los graficos) y sus copias
	ld de,091cch		;55b5
	ld hl,0e800h		;55b8   ; apunta a el bufer de las rachas descomprimidas en RAM
	call rachas_a_ram		;55bb   ; rachas_a_ram: descomprime las rachas de DE en la RAM HL
	ld de,00808h		;55be
	ld hl,0e800h		;55c1   ; apunta a el bufer de las rachas descomprimidas en RAM
	ld bc,0080ch		;55c4
	call L_5636		;55c7
	jp bancos_1_2_3		;55ca   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
bloque_de_fuente:		; B caracteres por fila y C filas de la fuente de la fila 0x28
	ld a,b			;55cd   ; B caracteres por fila y C filas de la fuente de la fila 0x28 desde HL, en DE
	ld (0e340h),a		;55ce   ; guarda variable de paso (cada rutina la usa a su manera)
	ld a,d			;55d1
	ld (0e341h),a		;55d2
L_55D5:
	ld a,(hl)			;55d5   ; un caracter...
	inc hl			;55d6
	call L_4F30		;55d7
	ld a,d			;55da   ; ...8 puntos a la derecha
	add a,008h		;55db
	ld d,a			;55dd
	djnz L_55D5		;55de
	dec c			;55e0   ; al acabar la fila...
	ret z			;55e1
	ld a,e			;55e2   ; ...8 mas abajo y de vuelta a la x del principio
	add a,008h		;55e3
	ld e,a			;55e5
	ld a,(0e341h)		;55e6
	ld d,a			;55e9
	ld a,(0e340h)		;55ea   ; lee variable de paso (cada rutina la usa a su manera)
	ld b,a			;55ed
	jr bloque_de_fuente		;55ee
L_55F0:
	ld a,b			;55f0   ; lo mismo con la fuente de la fila 0x30
	ld (0e340h),a		;55f1   ; guarda variable de paso (cada rutina la usa a su manera)
	ld a,d			;55f4
	ld (0e341h),a		;55f5
L_55F8:
	ld a,(hl)			;55f8
	inc hl			;55f9
	call L_4F35		;55fa   ; un caracter de la fila 0x30
	ld a,d			;55fd
	add a,008h		;55fe
	ld d,a			;5600
	djnz L_55F8		;5601
	dec c			;5603   ; al acabar la fila, la siguiente
	ret z			;5604
	ld a,e			;5605   ; la fila siguiente, 8 mas abajo
	add a,008h		;5606
	ld e,a			;5608
	ld a,(0e341h)		;5609
	ld d,a			;560c
	ld a,(0e340h)		;560d   ; lee variable de paso (cada rutina la usa a su manera)
	ld b,a			;5610
	jr L_55F0		;5611
L_5613:
	ld a,b			;5613   ; lo mismo con la fuente de la fila 0x68
	ld (0e340h),a		;5614   ; guarda variable de paso (cada rutina la usa a su manera)
	ld a,d			;5617
	ld (0e341h),a		;5618
L_561B:
	ld a,(hl)			;561b
	inc hl			;561c
	call L_4F3A		;561d   ; un caracter...
	ld a,d			;5620
	add a,008h		;5621
	ld d,a			;5623
	djnz L_561B		;5624
	dec c			;5626   ; ...y la fila siguiente
	ret z			;5627
	ld a,e			;5628
	add a,008h		;5629
	ld e,a			;562b
	ld a,(0e341h)		;562c
	ld d,a			;562f
	ld a,(0e340h)		;5630   ; lee variable de paso (cada rutina la usa a su manera)
	ld b,a			;5633
	jr L_5613		;5634
L_5636:
	ld a,b			;5636   ; lo mismo con la fuente de la fila 0xA8
	ld (0e340h),a		;5637   ; guarda variable de paso (cada rutina la usa a su manera)
	ld a,d			;563a
	ld (0e341h),a		;563b
L_563E:
	ld a,(hl)			;563e
	inc hl			;563f
	call L_4F3F		;5640   ; un caracter...
	ld a,d			;5643
	add a,008h		;5644
	ld d,a			;5646
	djnz L_563E		;5647
	dec c			;5649   ; ...y la fila siguiente
	ret z			;564a
	ld a,e			;564b
	add a,008h		;564c
	ld e,a			;564e
	ld a,(0e341h)		;564f
	ld d,a			;5652
	ld a,(0e340h)		;5653   ; lee variable de paso (cada rutina la usa a su manera)
	ld b,a			;5656
	jr L_5636		;5657
rachas_a_ram:		; descomprime las rachas de DE en la RAM HL
	ld a,(de)			;5659   ; la cuenta: 0 acaba
	and a			;565a
	ret z			;565b
	inc de			;565c
	ld b,a			;565d   ; bit 7 a 0: una racha
	and 07fh		;565e
	cp b			;5660
	jr z,L_566F		;5661
	and a			;5663   ; 0x80 justo: nada
	jr z,rachas_a_ram		;5664
	ld b,a			;5666
L_5667:
	ld a,(de)			;5667   ; 0x81-0xFF: B bytes tal cual
	inc de			;5668
	ld (hl),a			;5669
	inc hl			;566a
	djnz L_5667		;566b
	jr rachas_a_ram		;566d
L_566F:
	ld a,(de)			;566f   ; la racha: un byte B veces
	inc de			;5670
L_5671:
	ld (hl),a			;5671
	inc hl			;5672
	djnz L_5671		;5673
	jr rachas_a_ram		;5675
L_5677:
	call bancos_10_11_12		;5677   ; rachas a la VRAM 0x6C00: las de p10:604D...
	ld hl,06c00h		;567a
	ld a,(0e1feh)		;567d   ; lee el lado por el que batea (0 si IX+6 de su ficha es 0x20, si no 1): elige las tablas del otro lado
	or a			;5680
	jr nz,L_568E		;5681
	ld de,0604dh		;5683
	call rachas		;5686   ; rachas: descomprime las rachas de DE a la VRAM HL (C = 0: sin girar)
	ld hl,07c4bh		;5689   ; ...y 640 bytes de p10:7C4B...
	jr L_5697		;568c
L_568E:
	ld de,06808h		;568e   ; ...o, con 0xE1FE, las de p10:6808 y los 640 bytes de p10:7ECB
	call rachas		;5691   ; rachas: descomprime las rachas de DE a la VRAM HL (C = 0: sin girar)
	ld hl,07ecbh		;5694
L_5697:
	ld de,07880h		;5697   ; a la VRAM 0x7880
	ld bc,00280h		;569a
	call copia_a_vram		;569d   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	jp bancos_1_2_3		;56a0   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_56A3:
	ld hl,000f1h		;56a3   ; copia en la pagina 1: 5 x 1 puntos de (0xF1, 0x00) a (0xF0, 0x00)
	ld de,000f0h		;56a6
	ld bc,00005h		;56a9
	ld a,004h		;56ac
	jp copia_rectangulo		;56ae   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
L_56B1:
	ld a,(0e1d3h)		;56b1   ; la postura del lanzador: la linea 0xF9 + 0xE1D3 de la pagina 0 (128 bytes) a la linea 0xFB de la pagina 1, los dibujos de sprite 0xB0-0xBF
	add a,0f9h		;56b4
	ld l,a			;56b6
	ld h,000h		;56b7
	ld de,000fbh		;56b9
	ld bc,00001h		;56bc
	ld a,004h		;56bf
	jp copia_rectangulo		;56c1   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
L_56C4:
	call bancos_10_11_12		;56c4   ; los 7 dibujos de 128 bytes del juego 0xE1EB & 3 (p10:6FBE)...
	ld hl,07c00h		;56c7   ; ...a la VRAM 0x7C80 en adelante
	ld (0e340h),hl		;56ca   ; guarda variable de paso (cada rutina la usa a su manera) y el byte siguiente (16 bits)
	ld a,(0e1ebh)		;56cd   ; lee el estilo del lanzador (bits)
	and 003h		;56d0
	ld hl,06fbeh		;56d2
	call palabra_a		;56d5   ; palabra_a: HL = la palabra A de la tabla HL
	ld b,007h		;56d8
L_56DA:
	push bc			;56da
	ld e,(hl)			;56db   ; cada uno...
	inc hl			;56dc
	ld d,(hl)			;56dd
	inc hl			;56de
	push hl			;56df
	ld hl,(0e340h)		;56e0   ; ...128 bytes mas abajo
	ld bc,00080h		;56e3
	add hl,bc			;56e6
	ld (0e340h),hl		;56e7   ; guarda variable de paso (cada rutina la usa a su manera) y el byte siguiente (16 bits)
	ex de,hl			;56ea
	ld a,(0e1ebh)		;56eb   ; con el bit 2 de 0xE1EB, girado en espejo (p00:4B66)
	and 004h		;56ee
	jr nz,L_570A		;56f0
	call copia_a_vram		;56f2   ; si no, tal cual
L_56F5:
	pop hl			;56f5
	pop bc			;56f6
	djnz L_56DA		;56f7
	ld hl,000ffh		;56f9   ; copia media linea (128 x 1) de (0, 0xFF) de la pagina 0 a (0x80, 0xF9) de la pagina 1
	ld de,080f9h		;56fc
	ld bc,08001h		;56ff
	ld a,004h		;5702
	call copia_rectangulo		;5704   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
	jp bancos_1_2_3		;5707   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_570A:
	ld a,010h		;570a
	call de_mas_a		;570c   ; de_mas_a: DE = DE + A
	ld c,004h		;570f
	call L_4B66		;5711
	jr L_56F5		;5714
dibujo_64:		; el dibujo de 64 bytes A (p11:8759 + 64 A)
	push hl			;5716   ; el dibujo de 64 bytes A (p11:8759 + 64 A)...
	push de			;5717
	push bc			;5718
	ld de,08759h		;5719
	ld bc,0ffc0h		;571c
	call L_5746		;571f
	ld c,040h		;5722   ; ...a los dibujos de sprite 0xF8 (VRAM 0xFFC0)
	call copia_a_vram		;5724   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	call bancos_1_2_3		;5727   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	pop bc			;572a
	pop de			;572b
	pop hl			;572c
	ret			;572d
L_572E:
	push hl			;572e   ; el dibujo de 128 bytes A (p11:8499 + 128 A)...
	push de			;572f
	push bc			;5730
	ld de,08499h		;5731
	ld bc,0fac0h		;5734
	call L_574E		;5737
	ld c,080h		;573a   ; ...a los dibujos de sprite 0x58 (VRAM 0xFAC0)
	call copia_a_vram		;573c   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	call bancos_1_2_3		;573f   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	pop bc			;5742
	pop de			;5743
	pop hl			;5744
	ret			;5745
L_5746:
	call bancos_10_11_12		;5746   ; HL = DE + 64 A...
	ld l,a			;5749
	ld h,000h		;574a
	jr L_5755		;574c
L_574E:
	call bancos_10_11_12		;574e   ; HL = DE + 128 A
	ld l,a			;5751
	ld h,000h		;5752
	add hl,hl			;5754
L_5755:
	add hl,hl			;5755   ; x 64
	add hl,hl			;5756
	add hl,hl			;5757
	add hl,hl			;5758
	add hl,hl			;5759
	add hl,hl			;575a
	add hl,de			;575b
	ld d,b			;575c   ; DE = el destino
	ld e,c			;575d
	ld b,000h		;575e
	ret			;5760
L_5761:
	call bancos_10_11_12		;5761   ; la ficha 0xE1F6 de 11 bytes de p10:6000 (0x6000 + 11 x n)
	ld a,(0e1f6h)		;5764   ; lee la formacion del campo (0-6)
	ld (0e340h),a		;5767   ; guarda variable de paso (cada rutina la usa a su manera)
	ld l,a			;576a   ; 11 x 0xE1F6: 2n...
	ld h,000h		;576b
	ld c,a			;576d
	ld b,h			;576e
	add hl,hl			;576f
	ld d,h			;5770
	ld e,l			;5771
	add hl,hl			;5772   ; ...8n + 2n + n
	add hl,hl			;5773
	add hl,de			;5774
	add hl,bc			;5775
	ld de,06000h		;5776   ; + 0x6000
	add hl,de			;5779
	ld a,(hl)			;577a   ; [bits altos: color; bajos: cuantos]
	ld (0e341h),a		;577b
	and 00fh		;577e
	ld b,a			;5780
	ld c,b			;5781
	inc hl			;5782
L_5783:
	push bc			;5783   ; cada media linea i...
	ld a,c			;5784
	sub b			;5785
	ld b,a			;5786
	ld a,(0e341h)		;5787   ; ...el destino: la linea 0xF0 (o 0xF5 con los bits altos) de la pagina 1, los dibujos de sprite...
	ld c,0f0h		;578a
	and c			;578c
	jr z,L_5791		;578d
	ld c,0f5h		;578f
L_5791:
	call L_57AD		;5791   ; ...(128 (i & 1), 0xF0 + i / 2)...
	ld b,(hl)			;5794   ; ...el byte b de la ficha...
	inc hl			;5795
	push hl			;5796
	ex de,hl			;5797
	ld c,0d8h		;5798   ; ...da el origen en la pagina 0: (128 (b & 1), 0xD8 + b / 2), el almacen del bateador...
	call L_57AD		;579a
	ex de,hl			;579d
	ld bc,08001h		;579e   ; ...y se copian 128 x 1 puntos (64 bytes: 2 dibujos de sprite)
	ld a,004h		;57a1
	call copia_rectangulo		;57a3   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
	pop hl			;57a6
	pop bc			;57a7
	djnz L_5783		;57a8
	jp bancos_1_2_3		;57aa   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_57AD:
	ld a,b			;57ad   ; D = (B & 1) x 0x80, E = B / 2 + C
	and 001h		;57ae
	rrc a		;57b0
	ld d,a			;57b2
	ld a,b			;57b3
	srl a		;57b4
	add a,c			;57b6
	ld e,a			;57b7
	ret			;57b8
L_57B9:
	ld hl,0547ch		;57b9   ; un rectangulo de color 0x11 en (0x54, 0x7C), 0x58 x 0x18
	ld bc,l5818h		;57bc
	ld a,011h		;57bf
	ld d,000h		;57c1
	jp rellena		;57c3   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
L_57C6:
	call bancos_7_8_9		;57c6   ; con 7-8-9: la paleta de p09:BE86...
	ld hl,0be86h		;57c9
	call pon_paleta		;57cc   ; pon_paleta: fichas de 3 bytes [color][rojo-azul][verde] hasta 0xFF, con p00:4BF0
	ld hl,0bce6h		;57cf   ; ...13 caracteres de un bit (p09:BCE6) con el color 1 en (0x08, 0x38)...
	ld de,00838h		;57d2
	ld bc,00d01h		;57d5
	call caracteres_de_un_bit		;57d8   ; caracteres_de_un_bit: pinta B caracteres de un bit por punto de HL, con el color C, desde DE
	ld hl,0bd4eh		;57db   ; ...13 con el color 2 (p09:BD4E) en (0x70, 0x38)...
	ld de,07038h		;57de
	ld bc,00d02h		;57e1
	call caracteres_de_un_bit		;57e4   ; caracteres_de_un_bit: pinta B caracteres de un bit por punto de HL, con el color C, desde DE
	ld hl,0bdb6h		;57e7   ; ...26 con el color 3 (p09:BDB6) en (0xD8, 0x38)...
	ld de,0d838h		;57ea
	ld bc,01a03h		;57ed
	call caracteres_de_un_bit		;57f0   ; caracteres_de_un_bit: pinta B caracteres de un bit por punto de HL, con el color C, desde DE
	ld de,04070h		;57f3   ; ...y la lista de caracteres de p09:BCA5 en (0x40, 0x70)
	ld hl,0bca5h		;57f6
	call lista_de_caracteres		;57f9   ; lista_de_caracteres: pinta la lista de caracteres HL (0xFF acaba, 0xFE baja de linea) desde DE
	jp bancos_1_2_3		;57fc   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
sonido:		; pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	di			;57ff   ; los bancos del sonido sin tocar sus copias, con las interrupciones cerradas
	push hl			;5800
	push de			;5801
	push bc			;5802
	push ix		;5803
	push af			;5805
	ld a,004h		;5806
	ld (07000h),a		;5808   ; el mapper: pone en 0x6000 el banco de A
	inc a			;580b
	ld (09000h),a		;580c   ; el mapper: pone en 0x8000 el banco de A
	inc a			;580f
	ld (0b000h),a		;5810   ; el mapper: pone en 0xA000 el banco de A
	pop af			;5813
	push af			;5814
	call 06003h		;5815   ; el motor pide el sonido A (p04:6003)
L_5818:
	ld a,(0ddf1h)		;5818   ; devuelve los bancos que habia
	ld (07000h),a		;581b   ; el mapper: pone en 0x6000 el banco de A
	ld a,(0ddf2h)		;581e   ; lee la copia del banco de 0x8000
	ld (09000h),a		;5821   ; el mapper: pone en 0x8000 el banco de A
	ld a,(0ddf3h)		;5824   ; lee la copia del banco de 0xA000
	ld (0b000h),a		;5827   ; el mapper: pone en 0xA000 el banco de A
	pop af			;582a
	pop ix		;582b
	pop bc			;582d
	pop de			;582e
	pop hl			;582f
	ei			;5830
	ret			;5831
L_5832:
	call bancos_13_14_15		;5832   ; p13:6D0E
	call 06d0eh		;5835
	jp bancos_1_2_3		;5838   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_583B:
	ld a,0e0h		;583b   ; los sprites 18 y 19 (atributos 0xE148, 0xE14C) fuera de la pantalla
	ld (0e148h),a		;583d
	ld (0e14ch),a		;5840
	ld a,(0e1f7h)		;5843   ; la base de la formacion: 0xE19D, o 0xEC76 sin 0xE1F7
	or a			;5846
	ld a,(0e19dh)		;5847   ; lee el mando del bateador o los corredores
	jr nz,L_584F		;584a
	ld a,(0ec76h)		;584c
L_584F:
	ld c,000h		;584f   ; 0 o 3: C = 0; 1: C = 3; 2: C = 4
	and 003h		;5851
	jr z,L_5860		;5853
	cp 003h		;5855
	jr z,L_5860		;5857
	ld c,003h		;5859
	rra			;585b
	jr c,L_5860		;585c
	ld c,004h		;585e
L_5860:
	ld a,(0e1f3h)		;5860   ; con 0xE1F3 = 2 se suma
	cp 002h		;5863
	jr nz,L_5868		;5865
	add a,c			;5867
L_5868:
	ld b,a			;5868   ; si la formacion no cambia, no se vuelve a pintar el campo
	ld a,(0e1f6h)		;5869   ; lee la formacion del campo (0-6)
	cp b			;586c
	jp z,L_5877		;586d
	ld a,b			;5870
	ld (0e1f6h),a		;5871   ; la formacion nueva (0xE1F6) y sus puntos del campo (p00:5761)
	call L_5761		;5874
L_5877:
	call bancos_10_11_12		;5877   ; las fichas de sprite de los jugadores de campo: p11:9911, o 0x991F con 0xE1FE
	ld hl,09911h		;587a
	ld a,(0e1feh)		;587d   ; lee el lado por el que batea (0 si IX+6 de su ficha es 0x20, si no 1): elige las tablas del otro lado
	or a			;5880
	jr z,L_5886		;5881
	ld hl,0991fh		;5883
L_5886:
	ld a,(0e1f6h)		;5886   ; la lista de la formacion 0xE1F6: [n] y fichas de 4 bytes
	call palabra_a		;5889   ; palabra_a: HL = la palabra A de la tabla HL
	ld b,(hl)			;588c
	inc hl			;588d
	ld de,0e100h		;588e   ; a los atributos desde el sprite 0
L_5891:
	ld a,(0e1f9h)		;5891   ; la y, mas el desplazamiento de 0xE1F9
	ld c,a			;5894
	ld a,(hl)			;5895
	inc hl			;5896
	add a,c			;5897
	ld (de),a			;5898
	inc de			;5899
	ld a,(0e1f5h)		;589a   ; la x, mas el de 0xE1F5 (p00:5961 copia x y dibujo)
	ld c,a			;589d
	ld a,(hl)			;589e
	call L_5961		;589f
	jr z,L_58BD		;58a2   ; el indice de color: 0 o 7 se queda (el contorno)...
	ld a,(0edd0h)		;58a4   ; ...cualquier otro, el de la camiseta: 0x18 el local, 0x1B el visitante...
	or a			;58a7
	ld a,(0e19bh)		;58a8   ; lee la media entrada (bit 0: 0 la alta, 1 la baja; 0x11 = la baja de la 9.a)
	jr z,L_58B6		;58ab   ; ...y al reves con 0xEDD0
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
	inc hl			;58bd   ; color a la ficha
	ld (de),a			;58be
	inc de			;58bf
	djnz L_5891		;58c0
	jp bancos_1_2_3		;58c2   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_58C5:
	call L_56A3		;58c5   ; la pagina 1 (p00:56A3) y 20 fichas de sprite de p11:9D12 (o 0x9D62 con 0xE1FE) desde el sprite 0
	call bancos_10_11_12		;58c8   ; bancos_10_11_12: pone los bancos 10, 11 y 12 (los graficos) y sus copias
	ld hl,09d12h		;58cb
	ld a,(0e1feh)		;58ce   ; lee el lado por el que batea (0 si IX+6 de su ficha es 0x20, si no 1): elige las tablas del otro lado
	or a			;58d1
	jr z,L_58D7		;58d2
	ld hl,09d62h		;58d4
L_58D7:
	ld de,0e100h		;58d7   ; apunta a los atributos de sprite (32 fichas de 4 bytes [y][x][dibujo][color])
	ld b,014h		;58da
	jr L_5891		;58dc
L_58DE:
	call bancos_10_11_12		;58de   ; los sprites 20 y 21 (0xE150, 0xE154) fuera...
	ld a,0e0h		;58e1
	ld (0e150h),a		;58e3
	ld (0e154h),a		;58e6
	ld a,(0e1d3h)		;58e9   ; ...salvo en el juego 2 con el bit 1 de 0xE1EB: 2 fichas de p11:9F3A o 0x9F42
	cp 002h		;58ec
	jr nz,L_5908		;58ee
	ld a,(0e1ebh)		;58f0   ; lee el estilo del lanzador (bits)
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
	ld a,(0e1ebh)		;5908   ; 4 fichas del juego 0xE1EB & 3 (p11:9DB2), grupo 0xE1D3, a los sprites 22-25
	and 003h		;590b
	ld hl,09db2h		;590d
	call palabra_a		;5910   ; palabra_a: HL = la palabra A de la tabla HL
	ld de,0e158h		;5913
	ld a,(0e1d3h)		;5916   ; lee el paso del movimiento del lanzador
	or a			;5919
	rla			;591a
	rla			;591b
	rla			;591c
	rla			;591d
	call hl_mas_a		;591e   ; hl_mas_a: HL = HL + A
	ld b,004h		;5921
	call L_5929		;5923
	jp bancos_1_2_3		;5926   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5929:
	ld a,(hl)			;5929   ; la y + 0x48
	inc hl			;592a
	add a,048h		;592b
	ld (de),a			;592d
	inc de			;592e
	ld a,(0e1ebh)		;592f   ; la x, al reves con el bit 2 de 0xE1EB...
	and 004h		;5932
	ld a,(hl)			;5934
	jr z,L_5939		;5935
	neg		;5937
L_5939:
	ld c,a			;5939
	ld a,(0e1e1h)		;593a   ; ...mas 0xE1E1
	call L_5961		;593d
	jr z,L_595B		;5940   ; el indice de color: 0 o 7 se queda; cualquier otro, el de la camiseta
	ld a,(0edd0h)		;5942
	or a			;5945
	ld a,(0e19bh)		;5946   ; lee la media entrada (bit 0: 0 la alta, 1 la baja; 0x11 = la baja de la 9.a)
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
	inc hl			;5961   ; la x mas C, el dibujo, y Z si el indice de color de la ficha es 0 o 7
	add a,c			;5962   ; la x mas C
	ld (de),a			;5963
	inc de			;5964
	ld a,(hl)			;5965   ; el dibujo
	inc hl			;5966
	ld (de),a			;5967
	inc de			;5968
	ld a,(hl)			;5969   ; el color de la ficha
	or a			;596a
	ret z			;596b
	cp 007h		;596c
	ret			;596e
L_596F:
	ld a,(0e190h)		;596f   ; segun el modo (0xE190), p15:A43B o p13:6000
	call despacha		;5972   ; despacha: salta a la palabra A de la tabla que va pegada detras del `call`

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
	call bancos_13_14_15		;597f   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 0a43bh		;5982
	jp bancos_1_2_3		;5985   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5988:
	call bancos_13_14_15		;5988   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 06000h		;598b
	jp bancos_1_2_3		;598e   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
carga_la_fuente:		; carga la fuente: 161 caracteres de un bit (0xFAF6 = 1 mientras tanto)
	ld a,001h		;5991   ; 0xFAF6 = 1 mientras se carga la fuente: 161 caracteres de un bit (p12:B6C3), color 0x0D, en (0, 0) de la pagina 1
	ld (0faf6h),a		;5993   ; guarda ACPAGE de la BIOS: la pagina en la que se pinta
	call bancos_10_11_12		;5996   ; bancos_10_11_12: pone los bancos 10, 11 y 12 (los graficos) y sus copias
	ld de,00000h		;5999
	ld hl,0b6c3h		;599c
	ld bc,0a10dh		;599f
	call caracteres_de_un_bit		;59a2   ; caracteres_de_un_bit: pinta B caracteres de un bit por punto de HL, con el color C, desde DE
	call bancos_1_2_3		;59a5   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	xor a			;59a8
	ld (0faf6h),a		;59a9   ; guarda ACPAGE de la BIOS: la pagina en la que se pinta
	ret			;59ac
L_59AD:
	call bancos_10_11_12		;59ad   ; la fuente con el color 4 (p00:59BF), con 10-11-12, y vuelta a 1-2-3...
	call L_59BF		;59b0
	jp bancos_1_2_3		;59b3   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_59B6:
	call bancos_10_11_12		;59b6   ; ...o a 13-14-15
	call L_59BF		;59b9
	jp bancos_13_14_15		;59bc   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
L_59BF:
	ld de,00028h		;59bf   ; 161 caracteres de un bit (p12:B6C3) en (0x00, 0x28) con el color 4...
	ld hl,0b6c3h		;59c2
	ld bc,0a104h		;59c5
	call caracteres_de_un_bit		;59c8   ; caracteres_de_un_bit: pinta B caracteres de un bit por punto de HL, con el color C, desde DE
	ld a,004h		;59cb   ; ...y el color 4 a 0x70 0x03
	ld de,07003h		;59cd
	jp pon_color		;59d0   ; pon_color: el color A de la paleta a D (rojo-azul) y E (verde), por R#16, y su copia en 0xDDC0 + 2 x A
L_59D3:
	call 088a9h		;59d3   ; p02:88A9 y p00:59EB con 7-8-9
	call bancos_7_8_9		;59d6   ; bancos_7_8_9: pone los bancos 7, 8 y 9 (los graficos) y sus copias
	call L_59EB		;59d9
	jp bancos_1_2_3		;59dc   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_59DF:
	ld a,(0e19bh)		;59df   ; el valor del equipo que batea: 0xED45 en la baja, 0xED44 en la alta
	rra			;59e2
	ld a,(0ed44h)		;59e3   ; lee el jugador del visitante al bate (13 en adelante: lanzador)
	ret nc			;59e6
	ld a,(0ed45h)		;59e7   ; lee el jugador del local al bate
	ret			;59ea
L_59EB:
	call L_5A13		;59eb   ; la fila de 0xBA2A que toca (0xE1FF) segun la ficha IX
	call L_59DF		;59ee   ; el valor del equipo que batea...
	ld hl,0bab2h		;59f1
	cp 00dh		;59f4   ; ...desde 13 se usa la fila fija de 0xBAB2
	jr nc,L_5A0F		;59f6
	ld a,(ix+007h)		;59f8   ; con IX+7 de 2 en adelante, la tabla de 0xBA8A...
	cp 002h		;59fb
	jr c,L_5A0F		;59fd
	sub 002h		;59ff
	ld hl,0ba8ah		;5a01
	call palabra_a		;5a04   ; palabra_a: HL = la palabra A de la tabla HL
	ld a,(ix+008h)		;5a07   ; ...y en ella la fila IX+8 / 2
	srl a		;5a0a
	call palabra_a		;5a0c   ; palabra_a: HL = la palabra A de la tabla HL
L_5A0F:
	ld (0ed2ch),hl		;5a0f   ; 0xED2C = la fila de 8 bytes elegida
	ret			;5a12
L_5A13:
	call L_59DF		;5a13   ; 0xE1FF: la fila de 16 de 0xBA2A...
	cp 00dh		;5a16
	jr nc,L_5A32		;5a18
	ld a,(ix+00ah)		;5a1a   ; ...segun IX+10: 0 y 1 la primera, y de 2 a 6 las siguientes (hasta la 5)
	cp 002h		;5a1d
	jr c,L_5A32		;5a1f
	dec a			;5a21
	cp 006h		;5a22
	jr c,L_5A28		;5a24
	ld a,005h		;5a26
L_5A28:
	rlca			;5a28   ; x 16
	rlca			;5a29
	rlca			;5a2a
	rlca			;5a2b
	and 0f0h		;5a2c
L_5A2E:
	ld (0e1ffh),a		;5a2e
	ret			;5a31
L_5A32:
	xor a			;5a32   ; desde 13, la primera
	jr L_5A2E		;5a33
L_5A35:
	call 088a9h		;5a35   ; p02:88A9 y p00:5A41 con 7-8-9
	call bancos_7_8_9		;5a38   ; bancos_7_8_9: pone los bancos 7, 8 y 9 (los graficos) y sus copias
	call L_5A41		;5a3b
	jp bancos_1_2_3		;5a3e   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5A41:
	call L_5A64		;5a41   ; E = un valor al azar de la fila de 0xBA2A
	ld a,(0e1fbh)		;5a44   ; D = el byte 8 - (0xE1FB - 1) de la fila de 0xED2C
	dec a			;5a47
	ld b,a			;5a48
	ld a,008h		;5a49
	sub b			;5a4b
	ld hl,(0ed2ch)		;5a4c
	call hl_mas_a		;5a4f   ; hl_mas_a: HL = HL + A
	ld d,(hl)			;5a52
	call L_5A75		;5a53   ; D mas el de 0x5A85 segun 0xE1FA (sin pasar de 255)
	call L_5AE0		;5a56   ; mas 16 en la 8.a entrada
	call L_5AEE		;5a59   ; mas o menos 16 segun la ficha IX y lo de 0xE231
	call L_5AB9		;5a5c   ; los ajustes de E
	call L_5A8B		;5a5f   ; y los de 0xECE0
	ex de,hl			;5a62   ; vuelve con HL = (E, D)
	ret			;5a63
L_5A64:
	ld a,(0e1ffh)		;5a64   ; la fila 0xE1FF de 0xBA2A...
	ld b,a			;5a67
	ld a,r		;5a68   ; ...y en ella una al azar (R & 0x0F)
	and 00fh		;5a6a
	add a,b			;5a6c
	ld hl,0ba2ah		;5a6d
	call hl_mas_a		;5a70   ; hl_mas_a: HL = HL + A
	ld e,(hl)			;5a73
	ret			;5a74
L_5A75:
	ld a,(0e1fah)		;5a75   ; 0xE1FA - 1 elige el ajuste de 0x5A85...
	dec a			;5a78
	ld c,a			;5a79
	ld b,000h		;5a7a
	ld hl,05a85h		;5a7c
	add hl,bc			;5a7f
	ld a,(hl)			;5a80
	add a,d			;5a81   ; ...que se suma a D si no pasa de 255
	ret c			;5a82
	ld d,a			;5a83
	ret			;5a84

; ----------------------------------------------------------------------
; DATOS resto_5A85: lo apuntan con el banco puesto p00:5A7C (0x5A85); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p00:5A7C (6 bytes)
;   0x5a85..0x5a8b  (6 bytes)
DATA_resto_5A85:
	defb 020h,018h,000h,000h,010h,008h	; 5a85

; ======================================================================
; CODIGO 0x5a8b..0x5e74  (1001 bytes)
; ======================================================================


L_5A8B:
	ld a,(0ece0h)		;5a8b   ; segun 0xECE0: 1 nada...
	dec a			;5a8e
	ret z			;5a8f
	dec a			;5a90   ; ...2: D - 0x30 y E + 2 (hasta 11)...
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
	sub 030h		;5aa1   ; D - 0x30 (desde 0)
	ld d,a			;5aa3
	ret nc			;5aa4
	ld d,000h		;5aa5
	ret			;5aa7
L_5AA8:
	call L_5AB2		;5aa8   ; ...3: D + 0x30 y E - 2 (desde 0)
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
	ld a,e			;5ab9   ; segun E: 0-3 D sube al azar (0x30-0xAF), 4-5 nada, 6-9 D baja un octavo, 10 y mas D a la mitad
	cp 004h		;5aba
	jr c,L_5AC8		;5abc
	cp 006h		;5abe
	ret c			;5ac0
	cp 00ah		;5ac1
	jr c,L_5AD6		;5ac3
	srl d		;5ac5
	ret			;5ac7
L_5AC8:
	ld a,r		;5ac8   ; un valor al azar 0x30-0xAF...
	and 07fh		;5aca
	add a,030h		;5acc
	jr c,L_5AD3		;5ace
	add a,d			;5ad0   ; ...se suma a D (hasta 255)
	ld d,a			;5ad1
	ret nc			;5ad2
L_5AD3:
	ld d,0ffh		;5ad3
	ret			;5ad5
L_5AD6:
	ld a,d			;5ad6
	srl d		;5ad7   ; D / 8...
	srl d		;5ad9
	srl d		;5adb
	sub d			;5add   ; ...D - D / 8
	ld d,a			;5ade
	ret			;5adf
L_5AE0:
	ld a,(0e19bh)		;5ae0   ; en la 8.a entrada (0xE19B / 2 = 7)...
	srl a		;5ae3
	cp 007h		;5ae5
	ret nz			;5ae7
L_5AE8:
	ld a,d			;5ae8   ; ...D + 16 (hasta 255)
	add a,010h		;5ae9
	ret c			;5aeb
	ld d,a			;5aec
	ret			;5aed
L_5AEE:
	ld c,(ix+000h)		;5aee   ; segun los bits 0-1 de IX+0 y si hay alguno en 0xE231...
	call L_5B0D		;5af1   ; hay alguien en las fichas de 0xE231?
	ld b,a			;5af4
	ld a,c			;5af5
	and 003h		;5af6   ; los bits 0-1 de IX+0: 0 y 3 cambian D
	jr z,L_5B07		;5af8
	cp 003h		;5afa
	ret nz			;5afc
	ld a,b			;5afd
	or a			;5afe
	jr z,L_5AE8		;5aff
L_5B01:
	ld a,d			;5b01   ; D - 16 (desde 0)
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
	xor a			;5b0d   ; A = el OR de IX+11 de las 4 fichas de 0xE231 (0 si ninguna)
	ld ix,0e231h		;5b0e   ; apunta a las 4 fichas de 16 bytes de los corredores (0xE23C = su estado)
	or (ix+00bh)		;5b12   ; OR con las marcas
	or (ix+01bh)		;5b15
	or (ix+02bh)		;5b18
	or (ix+03bh)		;5b1b
	ret			;5b1e
colores_de_sprites:		; los colores de los 32 sprites: compara el indice (4.o byte) de cada atributo y descomprime los que cambian (p09:BC05)
	ld de,0ec96h		;5b1f   ; los colores de los 32 sprites: compara el indice de color de cada atributo (0xE17F hacia atras)...
	ld hl,0e17fh		;5b22
	ld b,020h		;5b25
L_5B27:
	ld a,(de)			;5b27   ; ...con el que ya estaba (0xEC96 hacia atras)
	cp (hl)			;5b28
	ld a,(hl)			;5b29
	ld c,a			;5b2a
	dec hl			;5b2b
	dec hl			;5b2c
	dec hl			;5b2d
	dec hl			;5b2e
	jr z,L_5B65		;5b2f   ; si es el mismo, no se toca
	ld (de),a			;5b31   ; apunta el nuevo
	push hl			;5b32
	push bc			;5b33
	push de			;5b34
	ld a,b			;5b35   ; el bufer del sprite: 0xDEF0 + 16 x n
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
	call bancos_7_8_9		;5b4d   ; con 7-8-9: las rachas del dibujo (p09:BC05)...
	add a,a			;5b50
	ld hl,0bc05h		;5b51
	call hl_mas_a		;5b54   ; hl_mas_a: HL = HL + A
	ld e,(hl)			;5b57
	inc hl			;5b58
	ld d,(hl)			;5b59
	ld h,b			;5b5a
	ld l,c			;5b5b
	call rachas_a_ram		;5b5c   ; ...descomprimidas en su bufer
	call bancos_1_2_3		;5b5f   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	pop de			;5b62
	pop bc			;5b63
	pop hl			;5b64
L_5B65:
	dec de			;5b65   ; el sprite anterior
	djnz L_5B27		;5b66
	ret			;5b68
L_5B69:
	call bancos_10_11_12		;5b69   ; B = el byte A de p12:BC78
	ld hl,0bc78h		;5b6c
	call hl_mas_a		;5b6f   ; hl_mas_a: HL = HL + A
	ld b,(hl)			;5b72
	jp bancos_1_2_3		;5b73   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5B76:
	call bancos_7_8_9		;5b76   ; una tira de 8 mosaicos del fondo: la lista de 0xE1A6 (p08:9432)
	ld a,(0e1a6h)		;5b79
	ld hl,09432h		;5b7c
	call palabra_a		;5b7f   ; palabra_a: HL = la palabra A de la tabla HL
	ld b,008h		;5b82
L_5B84:
	push bc			;5b84
	push hl			;5b85
	ld a,(0ec41h)		;5b86   ; la posicion 0xEC41 en la lista (apuntada en 0xE1B2)...
	ld (0e1b2h),a		;5b89
	ld e,a			;5b8c
	ld d,000h		;5b8d
	add hl,de			;5b8f
	ld l,(hl)			;5b90   ; ...da el mosaico: x 16...
	ld h,d			;5b91
	add hl,hl			;5b92
	add hl,hl			;5b93
	add hl,hl			;5b94
	add hl,hl			;5b95
	ld de,(0ec43h)		;5b96   ; ...mas la base de 0xEC43
	add hl,de			;5b9a
	ld de,0de10h		;5b9b   ; en el bufer 0xDE10 + 0xEC40...
	ld a,(0ec40h)		;5b9e
	ld c,a			;5ba1
	call de_mas_a		;5ba2   ; de_mas_a: DE = DE + A
	ld a,004h		;5ba5   ; ...4 bytes mas a la derecha cada vez
	add a,c			;5ba7
	ld (0ec40h),a		;5ba8
	call L_5BB9		;5bab   ; copia el mosaico
	ld hl,0ec41h		;5bae   ; la posicion siguiente
	inc (hl)			;5bb1
	pop hl			;5bb2
	pop bc			;5bb3
	djnz L_5B84		;5bb4
	jp bancos_1_2_3		;5bb6   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5BB9:
	ld c,004h		;5bb9   ; un mosaico: 4 filas de 4 bytes...
L_5BBB:
	ld b,004h		;5bbb
L_5BBD:
	ld a,(hl)			;5bbd
	ld (de),a			;5bbe
	inc hl			;5bbf
	inc de			;5bc0
	djnz L_5BBD		;5bc1
	ld a,01ch		;5bc3   ; ...en un bufer de 32 bytes de ancho
	call de_mas_a		;5bc5   ; de_mas_a: DE = DE + A
	dec c			;5bc8
	ret z			;5bc9
	jr L_5BBB		;5bca
L_5BCC:
	call bancos_7_8_9		;5bcc   ; DE = la palabra A de p09:BB1A y A = el byte 0xE1F0 de p09:BBC4
	ld hl,0bb1ah		;5bcf
	call palabra_a		;5bd2   ; palabra_a: HL = la palabra A de la tabla HL
	ex de,hl			;5bd5
	ld a,(0e1f0h)		;5bd6   ; lee (la velocidad - 80) / 2
	ld hl,0bbc4h		;5bd9
	call hl_mas_a		;5bdc   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;5bdf
	ex de,hl			;5be0
	jp bancos_1_2_3		;5be1   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
diez_caracteres:		; 10 caracteres seguidos de HL en (D, E)
	ld b,00ah		;5be4   ; 10 caracteres seguidos de HL
b_caracteres:		; B caracteres seguidos de HL en (D, E)
	ld a,(hl)			;5be6
	inc hl			;5be7
	call caracter		;5be8   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	call siguiente_columna		;5beb   ; siguiente_columna: D += 8; si da la vuelta, E += 8
	djnz b_caracteres		;5bee
	ret			;5bf0
numero:		; pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
	ld c,000h		;5bf1   ; B parejas de cifras BCD; C = 0 mientras sean ceros a la izquierda
L_5BF3:
	dec b			;5bf3   ; la ultima pareja siempre se pinta
	jr nz,L_5BF8		;5bf4
	ld c,0ffh		;5bf6
L_5BF8:
	inc b			;5bf8
	ld a,(hl)			;5bf9   ; la cifra alta: 0 a la izquierda va en blanco
	rra			;5bfa
	rra			;5bfb
	rra			;5bfc
	rra			;5bfd
	and 00fh		;5bfe
	jr nz,L_5C07		;5c00
	call L_5C20		;5c02
	jr L_5C0A		;5c05
L_5C07:
	call una_cifra		;5c07   ; una_cifra: una cifra; si no es 0, ya no hay ceros a la izquierda
L_5C0A:
	ld a,(hl)			;5c0a   ; la baja
	inc hl			;5c0b
	call una_cifra		;5c0c   ; una_cifra: una cifra; si no es 0, ya no hay ceros a la izquierda
	djnz L_5BF3		;5c0f
	ret			;5c11
una_cifra:		; una cifra; si no es 0, ya no hay ceros a la izquierda
	and 00fh		;5c12   ; una cifra: si no es 0, ya no hay ceros a la izquierda
	jr z,L_5C18		;5c14
	ld c,0ffh		;5c16
L_5C18:
	add a,001h		;5c18   ; el caracter de la cifra (1-10), o 0 si es cero a la izquierda
	and c			;5c1a
	call caracter		;5c1b   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	jr L_5C2F		;5c1e
L_5C20:
	push bc			;5c20   ; un hueco de 8x8 en color 0
	push de			;5c21
	push hl			;5c22
	ex de,hl			;5c23
	ld bc,00808h		;5c24
	xor a			;5c27
	ld d,a			;5c28
	call rellena		;5c29   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
	pop hl			;5c2c
	pop de			;5c2d
	pop bc			;5c2e
L_5C2F:
	ld a,d			;5c2f   ; 8 puntos a la derecha
	add a,008h		;5c30
	ld d,a			;5c32
	ret			;5c33
cifras_bcd:		; B cifras BCD con ceros, empezando por la baja si B es impar
	ld c,b			;5c34   ; B cifras BCD con ceros, empezando por la baja si B es impar
	ld a,b			;5c35
	and 0feh		;5c36
	ld b,a			;5c38
	rr c		;5c39
	jr c,L_5C45		;5c3b
L_5C3D:
	ld a,(hl)			;5c3d
	rra			;5c3e   ; la cifra alta
	rra			;5c3f
	rra			;5c40
	rra			;5c41
	call L_5C4D		;5c42
L_5C45:
	ld a,(hl)			;5c45   ; la baja
	inc hl			;5c46
	call L_5C4D		;5c47
	djnz L_5C3D		;5c4a
	ret			;5c4c
L_5C4D:
	and 00fh		;5c4d   ; una cifra: el caracter 1-10
	add a,001h		;5c4f
	call caracter		;5c51   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	jr L_5C2F		;5c54
L_5C56:
	ld c,000h		;5c56   ; tres cifras con los ceros a la izquierda en blanco
	ld a,(hl)			;5c58
	call una_cifra		;5c59   ; una_cifra: una cifra; si no es 0, ya no hay ceros a la izquierda
	ld c,000h		;5c5c
	ld a,(hl)			;5c5e
	and 00fh		;5c5f
	jr z,L_5C65		;5c61
	ld c,0ffh		;5c63
L_5C65:
	inc hl			;5c65
	ld a,(hl)			;5c66   ; la cifra alta del byte siguiente
	rra			;5c67
	rra			;5c68
	rra			;5c69
	rra			;5c6a
	call una_cifra		;5c6b   ; una_cifra: una cifra; si no es 0, ya no hay ceros a la izquierda
	ld c,0ffh		;5c6e
	ld a,(hl)			;5c70   ; y la baja
	jr una_cifra		;5c71
pide_colores_sprite:		; pide copiar los colores de sprite (0xED09 = 1)
	ld a,001h		;5c73   ; pide copiar los colores de sprite (0xED09 = 1)
	jr L_5C79		;5c75
L_5C77:
	ld a,002h		;5c77   ; pide copiar todo con rotacion (0xED09 = 2)
L_5C79:
	ld (0ed09h),a		;5c79   ; guarda la peticion de copiar sprites a la VRAM (1 colores, 2 todo)
	ret			;5c7c
esconde_atributos:		; pone las 32 fichas de sprite de 0xE100 fuera de la pantalla
	ld hl,0e100h		;5c7d   ; apunta a los atributos de sprite (32 fichas de 4 bytes [y][x][dibujo][color])
	ld b,020h		;5c80
L_5C82:
	ld a,(0e1a2h)		;5c82   ; Y = X = 0xD7 + 0xE1A2 y dibujo 0 en los 32 atributos
	add a,0d7h		;5c85
	ld e,a			;5c87
	xor a			;5c88
L_5C89:
	ld (hl),e			;5c89   ; y, x y dibujo...
	inc hl			;5c8a
	ld (hl),e			;5c8b
	inc hl			;5c8c
	ld (hl),e			;5c8d
	inc hl			;5c8e
	ld (hl),a			;5c8f   ; ...color 0
	inc hl			;5c90
	djnz L_5C89		;5c91
	ret			;5c93
L_5C94:
	call bancos_13_14_15		;5c94   ; DE = la palabra A de la tabla p15:ABF2
	ld hl,0abf2h		;5c97
	call hl_mas_a		;5c9a   ; hl_mas_a: HL = HL + A
	ld e,(hl)			;5c9d
	inc hl			;5c9e
	ld d,(hl)			;5c9f
	jp bancos_1_2_3		;5ca0   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5CA3:
	call bancos_13_14_15		;5ca3   ; DE = la palabra de (HL) con 13-14-15
	ld e,(hl)			;5ca6
	inc hl			;5ca7
	ld d,(hl)			;5ca8
	jp bancos_1_2_3		;5ca9   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
arranca_sonido:		; el arranque del motor de sonido (p04:6000) con los bancos 4-5-6
	ld a,004h		;5cac
	ld (07000h),a		;5cae   ; el mapper: pone en 0x6000 el banco de A
	inc a			;5cb1
	ld (09000h),a		;5cb2   ; el mapper: pone en 0x8000 el banco de A
	inc a			;5cb5
	ld (0b000h),a		;5cb6   ; el mapper: pone en 0xA000 el banco de A
	call 06000h		;5cb9
	ld a,(0ddf1h)		;5cbc   ; lee la copia del banco de 0x6000
	ld (07000h),a		;5cbf   ; el mapper: pone en 0x6000 el banco de A
	ld a,(0ddf2h)		;5cc2   ; lee la copia del banco de 0x8000
	ld (09000h),a		;5cc5   ; el mapper: pone en 0x8000 el banco de A
	ld a,(0ddf3h)		;5cc8   ; lee la copia del banco de 0xA000
	ld (0b000h),a		;5ccb   ; el mapper: pone en 0xA000 el banco de A
	ret			;5cce
L_5CCF:
	ld a,00dh		;5ccf
	ld (07000h),a		;5cd1   ; el mapper: pone en 0x6000 el banco de A
	inc a			;5cd4
	ld (09000h),a		;5cd5   ; el mapper: pone en 0x8000 el banco de A
	inc a			;5cd8
	ld (0b000h),a		;5cd9   ; el mapper: pone en 0xA000 el banco de A
	call L_5D23		;5cdc
	ld a,001h		;5cdf
	ld (07000h),a		;5ce1   ; el mapper: pone en 0x6000 el banco de A
	inc a			;5ce4
	ld (09000h),a		;5ce5   ; el mapper: pone en 0x8000 el banco de A
	inc a			;5ce8
	ld (0b000h),a		;5ce9   ; el mapper: pone en 0xA000 el banco de A
	ret			;5cec
L_5CED:
	call bancos_13_14_15		;5ced   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 09348h		;5cf0
	jp bancos_1_2_3		;5cf3   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5CF6:
	call bancos_13_14_15		;5cf6   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 09557h		;5cf9
	jp bancos_1_2_3		;5cfc   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5CFF:
	call bancos_13_14_15		;5cff   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 095bbh		;5d02
	jp bancos_1_2_3		;5d05   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5D08:
	call bancos_13_14_15		;5d08   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 0b0ach		;5d0b
	jp bancos_1_2_3		;5d0e   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5D11:
	call bancos_13_14_15		;5d11   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 0b158h		;5d14
	jp bancos_1_2_3		;5d17   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5D1A:
	call bancos_13_14_15		;5d1a   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 0b25fh		;5d1d
	jp bancos_1_2_3		;5d20   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5D23:
	call bancos_13_14_15		;5d23   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 084afh		;5d26
	jp bancos_1_2_3		;5d29   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5D2C:
	call bancos_13_14_15		;5d2c   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 083d7h		;5d2f
	jp bancos_1_2_3		;5d32   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5D35:
	call bancos_13_14_15		;5d35   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 0b693h		;5d38
	jp bancos_1_2_3		;5d3b   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5D3E:
	call bancos_13_14_15		;5d3e   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 06940h		;5d41
	jp bancos_1_2_3		;5d44   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5D47:
	call bancos_13_14_15		;5d47   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 06a13h		;5d4a
	jp bancos_1_2_3		;5d4d   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5D50:
	call bancos_13_14_15		;5d50   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 06aech		;5d53
	jp bancos_1_2_3		;5d56   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5D59:
	call bancos_13_14_15		;5d59   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 08000h		;5d5c
	jp bancos_1_2_3		;5d5f   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5D62:
	call bancos_13_14_15		;5d62   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 0a4f8h		;5d65
	jp bancos_1_2_3		;5d68   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5D6B:
	call bancos_13_14_15		;5d6b   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 085e0h		;5d6e
	jp bancos_1_2_3		;5d71   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5D74:
	call bancos_13_14_15		;5d74   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 0a8ach		;5d77
	jp bancos_1_2_3		;5d7a   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
si_no_13:		; con los bancos 1-2-3, cambia SI / NO (p03:BCDE); vuelve a 13-14-15
	call bancos_1_2_3		;5d7d   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	call 0bcdeh		;5d80
	jp bancos_13_14_15		;5d83   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
L_5D86:
	call bancos_13_14_15		;5d86   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 06187h		;5d89
	jp bancos_1_2_3		;5d8c   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5D8F:
	call bancos_13_14_15		;5d8f   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 06b93h		;5d92   ; quita_recuadro: devuelve lo de detras del recuadro
	jp bancos_1_2_3		;5d95   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5D98:
	call bancos_13_14_15		;5d98   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 08654h		;5d9b
	jp bancos_1_2_3		;5d9e   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5DA1:
	call bancos_13_14_15		;5da1   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	ldir		;5da4
	jp bancos_1_2_3		;5da6   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5DA9:
	call bancos_13_14_15		;5da9   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 0bb48h		;5dac
	jp bancos_1_2_3		;5daf   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5DB2:
	call bancos_13_14_15		;5db2   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
	call 06d8dh		;5db5
	jp bancos_1_2_3		;5db8   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5DBB:
	call bancos_1_2_3		;5dbb   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
	call 06543h		;5dbe
	jp bancos_13_14_15		;5dc1   ; bancos_13_14_15: pone los bancos 13, 14 y 15 y sus copias
sonidos_del_partido:		; en el estado 5-4 (el partido): la tecla F5, la cuenta de 0xED99 y el sonido de fondo segun 0xE23C
	ld a,(0ed9fh)		;5dc4   ; mientras se copian sprites (0xED9F) no
	or a			;5dc7
	ret nz			;5dc8
	ld hl,0de00h		;5dc9   ; solo en el partido: estado 5, paso 4
	ld a,(hl)			;5dcc
	cp 005h		;5dcd
	ret nz			;5dcf
	inc hl			;5dd0
	ld a,(hl)			;5dd1
	cp 004h		;5dd2
	ret nz			;5dd4
	call L_5E8C		;5dd5   ; la musica que espera (p00:5E8C) y la tecla F5 (p00:5E47)
	call L_5E47		;5dd8
	ld a,(0effah)		;5ddb   ; con la musica quitada (0xEFFA) nada mas
	or a			;5dde
	ret nz			;5ddf
	ld a,(0ef3bh)		;5de0   ; 0xEF3B: el motor dice que musica suena...
	or a			;5de3
	jr z,L_5DEA		;5de4
	ld (0e33dh),a		;5de6   ; ...y se apunta en 0xE33D
	ret			;5de9
L_5DEA:
	ld a,(0e33dh)		;5dea   ; calla: si la ultima era una de las del partido (0x3D, 0x3E, 0x3F, 0x42-0x45)...
	cp 03dh		;5ded   ; la musica del partido: 0x3D, 0x3E, 0x3F y 0x42-0x45
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
	ld hl,0e23ch		;5e08   ; ...se elige otra segun 0xE23C de las 4 fichas de 0xE231 (los bits 0-2)
	ld ix,0e340h		;5e0b   ; apunta a variable de paso (cada rutina la usa a su manera)
	ld de,00010h		;5e0f
	ld b,004h		;5e12
L_5E14:
	ld a,(hl)			;5e14
	and 007h		;5e15
	ld (ix+000h),a		;5e17
	add hl,de			;5e1a
	inc ix		;5e1b
	djnz L_5E14		;5e1d
	ld hl,0e340h		;5e1f   ; la mayor de las cuatro...
	ld b,003h		;5e22
L_5E24:
	ld a,(hl)			;5e24
	inc hl			;5e25
	cp (hl)			;5e26
	call nc,L_5E41		;5e27   ; ...(burbuja: la deja al final)
	djnz L_5E24		;5e2a
	ld a,(0e19bh)		;5e2c   ; la tabla del equipo que batea: 0x5E74 en la alta, 0x5E7A en la baja
	rra			;5e2f
	ld de,05e74h		;5e30
	jr nc,L_5E38		;5e33
	ld de,05e7ah		;5e35
L_5E38:
	ld a,(hl)			;5e38   ; el sonido de esa posicion, y a tocarlo
	ex de,hl			;5e39
	call hl_mas_a		;5e3a   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;5e3d
	jp 06003h		;5e3e
L_5E41:
	ld c,(hl)			;5e41   ; cambia el byte de HL con el de antes
	ld (hl),a			;5e42
	dec hl			;5e43
	ld (hl),c			;5e44
	inc hl			;5e45
	ret			;5e46
L_5E47:
	ld a,(0eddbh)		;5e47   ; la tecla F5 (SNSMAT fila 7, bit 1), salvo con 0xEDDB
	or a			;5e4a
	ret nz			;5e4b
	ld a,007h		;5e4c
	call 00141h		;5e4e   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	bit 1,a		;5e51
	ld hl,0effbh		;5e53   ; apunta a la tecla F5 estaba suelta
	jr z,L_5E5B		;5e56
	ld (hl),001h		;5e58   ; suelta: 0xEFFB = 1
	ret			;5e5a
L_5E5B:
	ld a,(hl)			;5e5b   ; al pulsarla (despues de soltarla)...
	or a			;5e5c
	ret z			;5e5d
	dec hl			;5e5e   ; ...cambia 0xEFFA: musica quitada o puesta
	ld a,001h		;5e5f
	xor (hl)			;5e61
	ld (hl),a			;5e62
	jr z,L_5E6F		;5e63
	ld a,046h		;5e65   ; quitada: el sonido 0x46 (silencio)
	call 06003h		;5e67
	xor a			;5e6a
	ld (0effbh),a		;5e6b   ; guarda la tecla F5 estaba suelta
	ret			;5e6e
L_5E6F:
	inc hl			;5e6f   ; puesta: otra vez la del partido
	ld (hl),000h		;5e70
	jr L_5E08		;5e72

; ----------------------------------------------------------------------
; DATOS resto_5E74: lo apuntan con el banco puesto p00:5E30 (0x5E74), p00:5E35
;   (0x5E7A); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p00:5E30, p00:5E35 (12 bytes)
;   0x5e74..0x5e80  (12 bytes)
DATA_resto_5E74:
	defb 033h,033h,034h,035h,036h,036h,037h,037h,038h,039h,03ah,03ah	; 5e74  3345667789::

; ======================================================================
; CODIGO 0x5e80..0x5fb5  (309 bytes)
; ======================================================================


calla_y_espera:		; calla la musica (0x81) y apunta la siguiente en 0xED9A
	ld hl,0ed99h		;5e80   ; calla la musica (0x81) y apunta la siguiente en 0xED9A con 0x68 cuadros de espera
	ld (hl),068h		;5e83
	inc hl			;5e85
	ld (hl),a			;5e86
	ld a,081h		;5e87
	jp sonido		;5e89   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_5E8C:
	ld hl,0ed99h		;5e8c   ; la espera de 0xED99...
	ld a,(hl)			;5e8f
	or a			;5e90
	ret z			;5e91
	dec (hl)			;5e92
	ret nz			;5e93
	ld a,080h		;5e94   ; ...al acabar: corta (0x80) y toca la de 0xED9A
	call 06003h		;5e96
	ld a,(0ed9ah)		;5e99   ; lee la siguiente musica
	jp 06003h		;5e9c
L_5E9F:
	call bancos_7_8_9		;5e9f   ; la velocidad de HL (x, y) a DE con el modulo A: con 7-8-9 por las tablas
	ld (0e350h),a		;5ea2
	ld b,000h		;5ea5   ; B = 1 si la x no cambia...
	ld a,d			;5ea7
	sub h			;5ea8
	jr nz,L_5EAD		;5ea9
	ld b,001h		;5eab
L_5EAD:
	ld c,000h		;5ead   ; ...C = 2 si la y no cambia
	ld a,e			;5eaf
	sub l			;5eb0
	jr nz,L_5EB5		;5eb1
	ld c,002h		;5eb3
L_5EB5:
	ld a,b			;5eb5
	or c			;5eb6
	ld (0e35ch),a		;5eb7
	call L_5F04		;5eba   ; el angulo (0-0x3F en un cuadrante) y los signos
	ld d,000h		;5ebd
	ld a,(0e351h)		;5ebf
	ld e,a			;5ec2
	ld d,000h		;5ec3
	ld a,e			;5ec5   ; coseno: la entrada 0x3F - angulo de la tabla de senos...
	sub 03fh		;5ec6
	neg		;5ec8
	ld hl,0bf96h		;5eca
	push hl			;5ecd
	add hl,de			;5ece
	ld c,(hl)			;5ecf
	pop hl			;5ed0
	ld e,a			;5ed1
	add hl,de			;5ed2   ; ...y seno: la entrada angulo
	ld a,(hl)			;5ed3
	ld (0e352h),a		;5ed4
	ld e,c			;5ed7   ; la componente x = modulo x coseno / 32...
	call L_5F53		;5ed8
	ld a,(0e353h)		;5edb   ; ...con su signo
	and a			;5ede
	call nz,menos_de		;5edf   ; menos_de: DE = -DE
	push de			;5ee2
	ld a,(0e352h)		;5ee3   ; la y = modulo x seno / 32, con su signo
	ld e,a			;5ee6
	call L_5F53		;5ee7
	ld a,(0e354h)		;5eea
	and a			;5eed
	call nz,menos_de		;5eee   ; menos_de: DE = -DE
	pop hl			;5ef1
	ld a,(0e35ch)		;5ef2   ; si la x o la y no cambian, su componente a cero
	rra			;5ef5
	jr nc,L_5EFB		;5ef6
	ld de,00000h		;5ef8
L_5EFB:
	rra			;5efb
	jr nc,L_5F01		;5efc
	ld hl,00000h		;5efe
L_5F01:
	jp bancos_1_2_3		;5f01   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
L_5F04:
	ld a,l			;5f04   ; el angulo de HL a DE: dx (en 0xE353 el signo)...
	ld (0e340h),a		;5f05   ; apunta HL en 0xE340-0xE341
	ld a,h			;5f08
	ld (0e341h),a		;5f09
	ld hl,0e353h		;5f0c
	ld (hl),000h		;5f0f
	ld a,(0e340h)		;5f11   ; lee variable de paso (cada rutina la usa a su manera)
	sub e			;5f14   ; dx = l - e (positivo)
	jr nc,L_5F1A		;5f15
	neg		;5f17
	inc (hl)			;5f19
L_5F1A:
	and 0f0h		;5f1a   ; ...en el nibble alto...
	ld e,a			;5f1c
	inc hl			;5f1d
	ld (hl),000h		;5f1e
	ld a,(0e341h)		;5f20   ; ...dy (en 0xE354 el signo)...
	sub d			;5f23
	jr nc,L_5F29		;5f24
	neg		;5f26
	inc (hl)			;5f28
L_5F29:
	ld d,a			;5f29   ; ...en el bajo
	ld a,d			;5f2a
	rra			;5f2b
	rra			;5f2c
	rra			;5f2d
	rra			;5f2e
	and 00fh		;5f2f
	add a,e			;5f31
	ld hl,0be96h		;5f32   ; la tabla de direcciones de p09:BE96 da el angulo...
	call hl_mas_a		;5f35   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;5f38
	ld (0e351h),a		;5f39   ; ...en 0xE351
	ld c,a			;5f3c
	ld hl,(0e353h)		;5f3d   ; y el rumbo en 0xE357: el angulo con signo y el bit 7 si dy es negativo
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
	ld a,(0e350h)		;5f53   ; DE = E x 0xE350 / 32 (la componente)
	ld h,a			;5f56   ; H = el modulo
	call L_5F65		;5f57
	xor a			;5f5a
	add hl,hl			;5f5b   ; HL x 8: el byte alto da / 32
	adc a,a			;5f5c
	add hl,hl			;5f5d
	adc a,a			;5f5e
	add hl,hl			;5f5f
	adc a,a			;5f60
	ld l,h			;5f61
	ld h,a			;5f62
	ex de,hl			;5f63   ; en DE
	ret			;5f64
L_5F65:
	ld b,008h		;5f65   ; HL = H x E (8 x 8 bits)
	ld l,000h		;5f67
	ld d,l			;5f69
L_5F6A:
	add hl,hl			;5f6a
	jr nc,L_5F6E		;5f6b
	add hl,de			;5f6d
L_5F6E:
	djnz L_5F6A		;5f6e
	ret			;5f70
menos_hl:		; HL = -HL
	ld a,l			;5f71   ; HL = -HL
	cpl			;5f72
	ld l,a			;5f73
	ld a,h			;5f74
	cpl			;5f75
	ld h,a			;5f76
	inc hl			;5f77
	ret			;5f78
menos_de:		; DE = -DE
	ld a,e			;5f79   ; DE = -DE
	cpl			;5f7a
	ld e,a			;5f7b
	ld a,d			;5f7c
	cpl			;5f7d
	ld d,a			;5f7e
	inc de			;5f7f
	ret			;5f80
L_5F81:
	call bancos_7_8_9		;5f81   ; con 7-8-9: DE = C x seno(B) y HL = C x coseno(B) (p09:BF96)
	ld a,b			;5f84
	ld hl,0bf96h		;5f85
	call hl_mas_a		;5f88   ; hl_mas_a: HL = HL + A
	ld e,c			;5f8b
	ld a,(hl)			;5f8c
	call multiplica		;5f8d   ; multiplica: HL = A x E (8 x 8 bits)
	ex de,hl			;5f90
	push de			;5f91
	ld a,03fh		;5f92
	sub b			;5f94
	ld hl,0bf96h		;5f95
	call hl_mas_a		;5f98   ; hl_mas_a: HL = HL + A
	ld e,c			;5f9b
	ld a,(hl)			;5f9c
	call multiplica		;5f9d   ; multiplica: HL = A x E (8 x 8 bits)
	pop de			;5fa0
	jp bancos_1_2_3		;5fa1   ; bancos_1_2_3: pone los bancos 1, 2 y 3 (y sus copias en 0xDDF1-0xDDF3); conserva AF y HL
multiplica:		; HL = A x E (8 x 8 bits)
	push bc			;5fa4   ; HL = A x E: 8 vueltas de desplazar y sumar
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
; DATOS resto_5FB5: lo apuntan con el banco puesto p03:BBF7 (0x5FB5), p03:BC00
;   (0x5FC6), p03:BC06 (0x5FD0), p14:8600 (0x5FD0), p03:BC0D (0x5FDE),
;   p14:8628 (0x5FDE); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p03:BBF7, p03:BC00, p03:BC06, p14:8600, p03:BC0D,
;   p14:8628 (60 bytes)
;   0x5fb5..0x5ff1  (60 bytes)
DATA_resto_5FB5:
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
