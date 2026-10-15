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
	ld a,(0d74ch)		;6000   ; PENNANT y los menus: en el paso 8 con soporte (0xDD8E), la lectura (p13:6FFE)...
	cp 008h		;6003   ; en otro paso, la tabla de pasos
	jr nz,L_604A		;6005
	ld a,(0dd8eh)		;6007   ; lee los soportes que hay: bit 0 el disco, bit 1 el Game Master 2
	and 003h		;600a   ; sin disco ni Game Master 2, p13:6041
	jr z,L_6041		;600c
	call L_6FFE		;600e   ; lee la partida (p13:6FFE)
	ld a,(0d2b1h)		;6011   ; ...hasta que 0xD2B1 diga como fue...
	or a			;6014
	ret z			;6015
	dec a			;6016   ; mal (2): al menu (p13:6086)
	jr nz,$+111		;6017
	ld (0e1d1h),a		;6019   ; ...leida: 0xE1D1 = 0...
	ld a,(0dd8fh)		;601c   ; lee el soporte elegido: 0 la RAM, 1 el disco, 2 el Game Master 2
	or a			;601f
	jr z,L_6041		;6020   ; en RAM: p13:6041
	ld a,(0d73fh)		;6022   ; ...el modo guardado, los 6 nombres de equipo (p13:62D7) a 0xDAAE y 0x24 al final...
	ld (0de02h),a		;6025   ; guarda las marcas del modo: bit 6 un jugador, 5 dos jugadores, 4 PENNANT (contra el ordenador), 3 el ordenador solo
	ld hl,062d7h		;6028
	ld de,0daaeh		;602b   ; los 6 nombres de serie (66 bytes)...
	ld bc,00042h		;602e
	ldir		;6031
	ld a,024h		;6033   ; ...y un '$' al final de la lista
	ld (de),a			;6035
	ld a,006h		;6036   ; ...0xD2B2 = 6, p14:81FC y a seguir (p13:64DF)
	ld (0d2b2h),a		;6038   ; guarda cuantos nombres hay en la lista de equipos (los 6 de serie y los grabados)
	call 081fch		;603b
	jp L_64DF		;603e
L_6041:
	ld a,(0dd90h)		;6041   ; con 0xDD90, a seguir
	or a			;6044   ; sin 0xDD90, al menu (p13:606B)
	jr z,$+38		;6045
	jp L_64DF		;6047
L_604A:
	call 04220h		;604a   ; el paso del despachador 0xD74C

; ----------------------------------------------------------------------
; DATOS tabla_604D: 15 destinos del despachador p00:4220 (call en p13:604A, el
;   indice en A): 60D8, 6148, 61B3, 6319, 6383, 63F4, 6487, 63BB, 6FFE, 64DF,
;   6606, 662A, 6650, 64DF, 6081; lo leen p13:604A (30 bytes)
;   0x604d..0x606b  (30 bytes)
DATA_tabla_604D:
	defw 060d8h,06148h,061b3h,06319h,06383h,063f4h,06487h,063bbh	; 604d	la tabla de pasos de los menus de PENNANT
	defw 06ffeh,064dfh,06606h,0662ah,06650h,064dfh,06081h	; 605d

; ======================================================================
; CODIGO 0x606b..0x6115  (170 bytes)
; ======================================================================


L_606B:
	ld hl,0d74ch		;606b   ; el aviso: paso 14, 128 cuadros, p15:BA82 y el texto de p13:7D19
	ld (hl),00eh		;606e
	inc hl			;6070
	ld (hl),000h		;6071   ; el subpaso a 0
	ld hl,0d2e1h		;6073   ; apunta a la espera de los avisos
	ld (hl),080h		;6076   ; 128 cuadros
	call 0ba82h		;6078   ; borra_recuadro: borra el recuadro
	ld hl,07d19h		;607b   ; el texto de 0x7D19
	jp 04ea6h		;607e   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
L_6081:
	ld hl,0d2e1h		;6081   ; la espera...
	dec (hl)			;6084   ; hasta 0, nada
	ret nz			;6085
L_6086:
	xor a			;6086   ; ...y vuelta al menu: estado 0, 32 cuadros
	ld (0d74ch),a		;6087   ; guarda el despachador de los menus (y 0xD74D)
	ld (0de00h),a		;608a   ; guarda el estado del juego (indice del despachador principal)
	ld (0de01h),a		;608d   ; guarda el paso dentro del estado
	ld a,020h		;6090
	ld (0de04h),a		;6092   ; guarda la cuenta atras del estado
	ret			;6095
L_6096:
	ld hl,0d74ch		;6096   ; el paso anterior
	dec (hl)			;6099   ; el subpaso a 0
	inc hl			;609a
	ld (hl),000h		;609b
	ret			;609d
L_609E:
	call paso_siguiente_13		;609e   ; tres pasos mas...
L_60A1:
	call paso_siguiente_13		;60a1   ; ...dos...
L_60A4:
	call paso_siguiente_13		;60a4   ; ...uno...
paso_siguiente_13:		; el paso siguiente con el subpaso a 0
	ld hl,0d74ch		;60a7   ; ...el paso siguiente con el subpaso a 0
	inc (hl)			;60aa
	inc hl			;60ab   ; el subpaso...
	ld (hl),000h		;60ac   ; ...a 0
	ret			;60ae
subpaso_siguiente:		; el subpaso siguiente (0xD74D + 1)
	ld hl,0d74dh		;60af   ; el subpaso siguiente
	inc (hl)			;60b2
	ret			;60b3
L_60B4:
	call L_6BFB		;60b4   ; p13:6BFB y el paso de la opcion (0xD759 + 3)
	jr L_60BE		;60b7
L_60B9:
	push bc			;60b9   ; p13:6B93 y lo mismo
	call quita_recuadro		;60ba   ; quita_recuadro: devuelve lo de detras del recuadro
	pop bc			;60bd
L_60BE:
	ld a,(0d759h)		;60be   ; la opcion + 3...
	add a,003h		;60c1
	ld (0d74ch),a		;60c3   ; guarda el despachador de los menus (y 0xD74D)
	xor a			;60c6   ; ...con el subpaso a 0
	ld (0d74dh),a		;60c7
	ret			;60ca
L_60CB:
	ld a,(0d759h)		;60cb   ; el paso 0xD759 + 10
	add a,00ah		;60ce
	ld (0d74ch),a		;60d0   ; guarda el despachador de los menus (y 0xD74D)
	xor a			;60d3
	ld (0d74dh),a		;60d4   ; el subpaso a 0
	ret			;60d7
L_60D8:
	call 04b9fh		;60d8   ; el principio: borra la pantalla y los pasos...
	xor a			;60db   ; 0xD74C-0xD75B a 0 (16 bytes)
	ld hl,0d74ch		;60dc   ; apunta a el despachador de los menus (y 0xD74D)
	ld de,0d74dh		;60df
	ld (hl),a			;60e2
	ld bc,0000fh		;60e3
	ldir		;60e6
	ld (0da6bh),a		;60e8   ; 0xDA6B y la opcion a 0
	ld (0d759h),a		;60eb   ; guarda la opcion del menu de PENNANT
	ld a,(0dd8fh)		;60ee   ; ...sin partida guardada ni leida, directo (C = 1)...
	or a			;60f1
	jr nz,L_6102		;60f2
	ld a,(0dd90h)		;60f4
	or a			;60f7
	jr nz,L_6102		;60f8
	ld c,001h		;60fa   ; la eleccion es 1
	call paso_siguiente_13		;60fc   ; paso_siguiente_13: el paso siguiente con el subpaso a 0
	jp L_6157		;60ff
L_6102:
	ld hl,06115h		;6102   ; ...si no, el texto de 0x6115 y las marcas de 0xDD91-0xDD93 a cero
	call 04ea6h		;6105   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	xor a			;6108   ; 0xDD91, 0xDD92 y 0xDD93 a 0
	ld (0dd91h),a		;6109
	ld (0dd92h),a		;610c
	ld (0dd93h),a		;610f
	jp paso_siguiente_13		;6112   ; paso_siguiente_13: el paso siguiente con el subpaso a 0

; ----------------------------------------------------------------------
; DATOS texto_6115: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; se solapan 4 bloques: (texto_6125 6125-6148) (texto_6130
;   6130-6148) (texto_613D 613D-6148); lo leen p13:6105, p13:615E, p13:6164,
;   p13:616A, p13:6205 (51 bytes)
;   0x6115..0x6148  (51 bytes)
DATA_texto_6115:
	defb 050h,038h,01eh,01ah,013h,00fh,021h,013h,000h,021h,013h,01ah,013h,011h,022h,0feh	; 6115  P8....!..!....".	los textos de la eleccion ([x y], letras y 0xFF)
	defb 060h,060h,011h,01dh,01ch,022h,017h,01ch,023h,013h,0feh,060h,070h,01ch,013h,025h	; 6125  ``..."..#..`p..%
	defb 000h,021h,013h,00fh,021h,01dh,01ch,0feh,062h,010h,066h,00dh,067h,068h,069h,06ah	; 6135  .!..!...b.f.ghij
	defb 00eh,06bh,0ffh	; 6145

; ======================================================================
; CODIGO 0x6148..0x6193  (75 bytes)
; ======================================================================


L_6148:
	ld de,06050h		;6148   ; la eleccion de p15:AAE1 con DE = 0x6050, hasta 0xDD91...
	call 0aae1h		;614b
	ld a,(0dd91h)		;614e   ; sin acabar (0xDD91), nada
	or a			;6151
	ret z			;6152
	ld a,(0dd93h)		;6153   ; C = SI / NO (0xDD93)
	ld c,a			;6156
L_6157:
	ld a,c			;6157   ; ...0xD750 = la eleccion, borra los tres textos...
	ld (0d750h),a		;6158
	ld hl,06115h		;615b   ; los tres textos borrados (color 0)
	call 04eabh		;615e   ; texto_c0: como texto, con C = 0
	ld hl,06125h		;6161
	call 04eabh		;6164   ; texto_c0: como texto, con C = 0
	ld hl,06130h		;6167
	call 04eabh		;616a   ; texto_c0: como texto, con C = 0
	call 04bd2h		;616d   ; ...sprites fuera y la flecha (p13:6187)...
	call L_6187		;6170
	ld a,(0d750h)		;6173   ; ...con eleccion, al paso siguiente; si no, 0xD2B0 = 0 y cinco pasos mas
	or a			;6176
	jp nz,paso_siguiente_13		;6177   ; paso_siguiente_13: el paso siguiente con el subpaso a 0
	xor a			;617a   ; NO: 0xD2B0 = 0 y tres pasos mas
	ld (0d2b0h),a		;617b   ; guarda el paso de MEDIA SELECT y de la grabacion
	call L_60A1		;617e
	call L_60A4		;6181
	jp L_60A4		;6184
L_6187:
	ld de,0f800h		;6187   ; a los dibujos 0x00-0x03 de los sprites
	ld hl,06193h		;618a
	ld bc,00020h		;618d
	jp 04ab7h		;6190   ; copia_a_vram: copia BC bytes de HL a la VRAM DE

; ----------------------------------------------------------------------
; DATOS copia_6193: 32 bytes que p00:4AB7 copia tal cual a la VRAM 0xF800; lo
;   leen p13:6190 (32 bytes)
;   0x6193..0x61b3  (32 bytes)
DATA_copia_6193:
	defb 000h,03eh,05dh,06bh,06bh,06bh,05dh,03eh,000h,000h,000h,000h,000h,000h,000h,000h	; 6193  .>]kkk]>........	los 32 bytes del dibujo de la flecha
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 61a3  ................	datos sin lector a la vista

; ======================================================================
; CODIGO 0x61b3..0x61b9  (6 bytes)
; ======================================================================


L_61B3:
	ld a,(0d74dh)		;61b3   ; el subpaso de 0xD74D
	call 04220h		;61b6   ; la tabla de subpasos (p13:61B9)

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
	ld hl,0d6e1h		;61bd   ; la pantalla de PENNANT: 0xD6E1 = 1, lineas y marcos...
	ld (hl),001h		;61c0
	ld hl,00050h		;61c2   ; una linea en la y 0x50, color 0x0D
	ld c,00dh		;61c5
	ld b,000h		;61c7
	call 04c91h		;61c9   ; linea: orden LINE (0x70) del VDP desde HL
	ld hl,008c6h		;61cc   ; un marco desde (0xC6, 0x08) de 0xF2 x 0x0C
	ld c,00dh		;61cf
	ld de,0f20ch		;61d1
	call 04cfeh		;61d4   ; marco: un marco de lineas: HL la esquina, DE el tamano
	ld hl,03ec6h		;61d7   ; cuatro lineas verticales de 12 en la y 0xC6: x 0x3E, 0x76, 0xA6 y 0xCC
	ld c,00dh		;61da
	ld b,00ch		;61dc
	call 04cc7h		;61de   ; linea_vertical: orden LINE (0x70) del VDP, el lado largo en vertical
	ld hl,076c6h		;61e1
	ld c,00dh		;61e4
	ld b,00ch		;61e6
	call 04cc7h		;61e8   ; linea_vertical: orden LINE (0x70) del VDP, el lado largo en vertical
	ld hl,0a6c6h		;61eb
	ld c,00dh		;61ee
	ld b,00ch		;61f0
	call 04cc7h		;61f2   ; linea_vertical: orden LINE (0x70) del VDP, el lado largo en vertical
	ld hl,0ccc6h		;61f5
	ld c,00dh		;61f8
	ld b,00ch		;61fa
	call 04cc7h		;61fc   ; linea_vertical: orden LINE (0x70) del VDP, el lado largo en vertical
	call 059b6h		;61ff   ; la fuente, los textos de 0x613D y 0x6294 y el cuadro de 0x6C9D
	ld hl,0613dh		;6202   ; el texto de 0x613D borrado y el de 0x6294
	call 04eabh		;6205   ; texto_c0: como texto, con C = 0
	ld hl,06294h		;6208
	call 04ea6h		;620b   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	call L_6C9D		;620e   ; la opcion (p13:6C9D)
	jp subpaso_siguiente		;6211   ; subpaso_siguiente: el subpaso siguiente (0xD74D + 1)
L_6214:
	ld hl,062d7h		;6214   ; una temporada nueva: los 6 nombres de equipo a 0xDAAE...
	ld de,0daaeh		;6217   ; apunta a los nombres de los equipos (11 letras cada uno)
	ld bc,00042h		;621a
	ldir		;621d   ; 66 bytes
	ld a,024h		;621f
	ld (de),a			;6221   ; el '$' del final de la lista
	ld a,006h		;6222   ; ...0xD2B2 = 6, p14:81FC, el sonido 0x2E...
	ld (0d2b2h),a		;6224   ; guarda cuantos nombres hay en la lista de equipos (los 6 de serie y los grabados)
	call 081fch		;6227   ; el directorio (p14:81FC)
	ld a,02eh		;622a   ; el sonido 0x2E
	call 057ffh		;622c   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	ld hl,00101h		;622f   ; ...la jornada 1 de 1 (0xD753)...
	ld (0d753h),hl		;6232   ; guarda los partidos de cada pareja en PENNANT (1-26) y el byte siguiente (16 bits)
	ld de,0dd81h		;6235   ; 0xDD80-0xDD85 a 0xFF: sin campeon
	ld hl,0dd80h		;6238
	ld (hl),0ffh		;623b
	ld bc,00005h		;623d
	ldir		;6240
	ld de,0d6e4h		;6242   ; 0xD6E3-0xD706 a 0: la tabla de partidos
	ld hl,0d6e3h		;6245
	ld (hl),000h		;6248
	ld bc,00023h		;624a
	ldir		;624d
	ld hl,0d70ah		;624f   ; apunta a los 6 equipos elegidos (0xFF libre)
	ld (hl),0ffh		;6252   ; 0xD70A-0xD70F a 0xFF: ningun equipo elegido
	ld de,0d70bh		;6254
	ld bc,00005h		;6257
	ldir		;625a
	call lista_de_jugadores		;625c   ; ...la tabla (p13:6A0D) y 0xDA6C-0xDAAD en blanco
	ld hl,0da6ch		;625f
	ld (hl),020h		;6262   ; 0xDA6C-0xDAAD en blanco (0x42 espacios)
	ld de,0da6dh		;6264
	ld bc,00041h		;6267
	ldir		;626a
L_626C:
	call L_6272		;626c
	jp paso_siguiente_13		;626f   ; paso_siguiente_13: el paso siguiente con el subpaso a 0
L_6272:
	ld de,0f600h		;6272   ; el cursor: 3 bytes de atributo (0x6291) a la VRAM 0xF600...
	ld hl,06291h		;6275
	ld bc,00003h		;6278   ; al sprite 0 (0xF600)
	call 04ab7h		;627b   ; copia_a_vram: copia BC bytes de HL a la VRAM DE
	ld hl,0f604h		;627e   ; ...el siguiente fuera (0xD8)...
	ld a,0d8h		;6281
	call 04ae3h		;6283   ; byte_a_vram: escribe A en la VRAM HL
	ld hl,0f400h		;6286   ; ...y el color 7 a sus 16 lineas
	ld a,007h		;6289
	ld bc,00010h		;628b
	jp 04acah		;628e

; ----------------------------------------------------------------------
; DATOS copia_6291: 3 bytes que p00:4AB7 copia tal cual a la VRAM 0xF600; lo
;   leen p13:627B (3 bytes)
;   0x6291..0x6294  (3 bytes)
DATA_copia_6291:
	defb 0e0h,000h,000h	; 6291	los atributos del cursor (y, x y dibujo)

; ----------------------------------------------------------------------
; DATOS texto_6294: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; se solapan 2 bloques: (texto_62D1 62D1-62D7); lo leen
;   p13:620B, p13:64AD (67 bytes)
;   0x6294..0x62d7  (67 bytes)
DATA_texto_6294:
	defb 040h,000h,01ah,013h,00fh,015h,023h,013h,000h,021h,013h,01ah,013h,011h,022h,017h	; 6294  @.....#..!....".	los textos de la pantalla de PENNANT
	defb 01dh,01ch,0feh,068h,054h,022h,013h,00fh,01bh,021h,0feh,00ah,0c8h,01eh,01ah,00fh	; 62a4  ...hT"...!......
	defb 027h,013h,020h,0feh,042h,0c8h,021h,013h,01ah,013h,011h,022h,0feh,0d0h,0c8h,011h	; 62b4  '. .B.!...."....
	defb 01ah,013h,00fh,020h,0feh,07ah,0c8h,011h,01dh,023h,01ch,022h,0feh,0aeh,0c8h,013h	; 62c4  ... .z...#."....
	defb 01ch,012h,0ffh	; 62d4

; ----------------------------------------------------------------------
; DATOS nombres_de_equipo: los 6 nombres de equipo, 11 letras en ASCII cada
;   uno (FLYERS, RIDERS, KOBE LINES, BRENDS, PROGRAMS, DARKS): p13:6028 copia
;   los 0x42 bytes a 0xDAAE; lo leen p13:6028 (66 bytes)
;   0x62d7..0x6319  (66 bytes)
DATA_nombres_de_equipo:
	defb 046h,04ch,059h,045h,052h,053h,020h,020h,020h,020h,020h	; 62d7  FLYERS	los nombres de los 6 equipos de serie (11 letras ASCII cada uno)
	defb 052h,049h,044h,045h,052h,053h,020h,020h,020h,020h,020h	; 62e2  RIDERS
	defb 04bh,04fh,042h,045h,020h,04ch,049h,04eh,045h,053h,020h	; 62ed  KOBE LINES
	defb 042h,052h,045h,04eh,044h,053h,020h,020h,020h,020h,020h	; 62f8  BRENDS
	defb 050h,052h,04fh,047h,052h,041h,04dh,053h,020h,020h,020h	; 6303  PROGRAMS	datos sin lector a la vista
	defb 044h,041h,052h,04bh,053h,020h,020h,020h,020h,020h,020h	; 630e  DARKS

; ======================================================================
; CODIGO 0x6319..0x631f  (6 bytes)
; ======================================================================


L_6319:
	ld a,(0d74dh)		;6319   ; el subpaso de 0xD74D
	call 04220h		;631c   ; la tabla de subpasos (p13:631F)

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
	call L_6BFB		;6323   ; el cuadro de la jornada, el texto de p13:7CEF y el numero de jugadores (p13:6B50)
	call L_6B66		;6326   ; el recuadro (p13:6B66)
	ld hl,07cefh		;6329
	call 04ea6h		;632c   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	call L_6B50		;632f   ; el numero (p13:6B50)
	ld hl,0d2e1h		;6332   ; apunta a la espera de los avisos
	ld (hl),008h		;6335   ; 8 cuadros
	jp subpaso_siguiente		;6337   ; subpaso_siguiente: el subpaso siguiente (0xD74D + 1)
L_633A:
	call L_6C85		;633a   ; elegir el numero de jugadores (0xD6E1, 1-6): con otra opcion, a ella...
	call L_6C81		;633d   ; el boton 2 (p13:6C81)
	ld a,(0d759h)		;6340   ; lee la opcion del menu de PENNANT
	or a			;6343
	jp nz,L_60B9		;6344   ; si la opcion no es esta, a la suya
	ld a,(0de06h)		;6347   ; ...izquierda o derecha, cada 8 cuadros si se mantiene...
	and 003h		;634a
	jr nz,L_6359		;634c   ; recien pulsada: en seguida
	ld a,(0de07h)		;634e   ; lee los botones pulsados del mando 1 / cursores
	and 003h		;6351   ; mantenida: cada 8 cuadros
	ret z			;6353
	ld hl,0d2e1h		;6354   ; apunta a la espera de los avisos
	dec (hl)			;6357
	ret nz			;6358
L_6359:
	ld hl,0d2e1h		;6359   ; ...la derecha: uno menos (de 1 a 6)...
	ld (hl),008h		;635c
	rra			;635e   ; bit 0 (izquierda)
	jr c,L_636C		;635f
	ld hl,0d6e1h		;6361   ; apunta a el numero de jugadores de PENNANT (1-6)
	ld a,(hl)			;6364   ; la derecha: uno menos; de 1 pasa a 6
	dec a			;6365
	jr nz,L_6377		;6366
	ld a,006h		;6368
	jr L_6377		;636a
L_636C:
	ld hl,0d6e1h		;636c   ; ...la izquierda: uno mas (de 6 a 1)...
	ld a,(hl)			;636f
	inc a			;6370   ; uno mas; de 6 pasa a 1
	cp 007h		;6371
	jr c,L_6377		;6373
	ld a,001h		;6375
L_6377:
	ld (hl),a			;6377   ; ...lo pinta y el sonido 0x26
	call L_6B50		;6378
	call L_6BFB		;637b   ; el cuadro de la jornada
	ld a,026h		;637e
	jp 057ffh		;6380   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_6383:
	call L_6C85		;6383   ; elegir equipo: con otra opcion, a ella...
	ld a,(0d759h)		;6386   ; lee la opcion del menu de PENNANT
	dec a			;6389   ; si la opcion no es la 1, a la suya
	jp nz,L_60BE		;638a
	call L_6938		;638d   ; ...la flecha y la tabla...
	call lista_de_jugadores		;6390   ; lista_de_jugadores: la lista de jugadores desde 0xDAAE
	call cuantos_equipos		;6393   ; si ya estan todos elegidos (0xDA6B), el boton 2
	ld a,(0da6bh)		;6396
	cp b			;6399
	jp z,L_6C81		;639a
	ld a,(0de06h)		;639d   ; ...con el boton, el equipo elegido (p13:6AB5)
	and 010h		;63a0
	ret z			;63a2   ; sin boton, nada
	call L_6AB5		;63a3
	call L_6B17		;63a6   ; y se marca en la lista (p13:6B17)
	call cuantos_equipos		;63a9   ; cuantos_equipos: B = cuantos equipos juegan: 0xD6E1, o 6 con uno solo
	ld a,(0da6bh)		;63ac
	cp b			;63af   ; todos: p13:63B5
	jr z,L_63B5		;63b0
	jp L_6922		;63b2   ; si no, la opcion siguiente
L_63B5:
	call L_6C81		;63b5
	jp lista_de_jugadores		;63b8   ; lista_de_jugadores: la lista de jugadores desde 0xDAAE
L_63BB:
	ld a,(0d74dh)		;63bb
	call 04220h		;63be   ; la tabla de subpasos (p13:63C1)

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
	ld hl,0f600h		;63c5   ; sin cursor y 0xD758 = 0
	ld a,0e0h		;63c8   ; el sprite 0 fuera (y = 0xE0)
	call 04ae3h		;63ca   ; byte_a_vram: escribe A en la VRAM HL
	xor a			;63cd
	ld (0d758h),a		;63ce
	jp subpaso_siguiente		;63d1   ; subpaso_siguiente: el subpaso siguiente (0xD74D + 1)
L_63D4:
	call L_6C85		;63d4   ; la opcion 4: el cursor de la lista (p13:6BDC, p13:6C49) y con el boton se elige
	ld a,(0d759h)		;63d7   ; lee la opcion del menu de PENNANT
	sub 004h		;63da
	jp nz,L_60B4		;63dc   ; si la opcion no es la 4, a la suya
	call L_6BDC		;63df   ; el cursor (p13:6BDC y p13:6C49)
	call L_6C49		;63e2
	ld a,(0de06h)		;63e5   ; lee los botones recien pulsados del mando 1 / cursores
	and 010h		;63e8
	ret z			;63ea   ; sin boton, nada
	call L_6C6E		;63eb   ; el elegido (p13:6C6E) se marca
	call L_6B17		;63ee
	jp lista_de_jugadores		;63f1   ; lista_de_jugadores: la lista de jugadores desde 0xDAAE
L_63F4:
	ld a,(0d74dh)		;63f4
	call 04220h		;63f7   ; la tabla de subpasos (p13:63FA)

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
	call L_6B66		;63fe   ; el cuadro de los partidos: el texto de 0x6412 y el numero (p13:6462)
	ld hl,06412h		;6401   ; el texto de 0x6412
	call 04ea6h		;6404   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	call L_6462		;6407   ; el numero (p13:6462)
	ld hl,0d2e1h		;640a   ; 8 cuadros
	ld (hl),008h		;640d
	jp subpaso_siguiente		;640f   ; subpaso_siguiente: el subpaso siguiente (0xD74D + 1)

; ----------------------------------------------------------------------
; DATOS texto_6412: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p13:6404 (8 bytes)
;   0x6412..0x641a  (8 bytes)
DATA_texto_6412:
	defb 064h,088h,082h,000h,083h,000h,081h,0ffh	; 6412  d.......	el texto de los partidos

; ======================================================================
; CODIGO 0x641a..0x648d  (115 bytes)
; ======================================================================


L_641A:
	call L_6C85		;641a   ; elegir el numero de partidos (0xD753, 1-26): con otra opcion, a ella...
	call L_6C81		;641d   ; el boton 2
	ld a,(0d759h)		;6420   ; lee la opcion del menu de PENNANT
	sub 002h		;6423
	jp nz,L_60B9		;6425   ; si la opcion no es la 2, a la suya
	ld a,(0de06h)		;6428   ; lee los botones recien pulsados del mando 1 / cursores
	and 003h		;642b
	jr nz,L_643A		;642d   ; recien pulsada: en seguida
	ld a,(0de07h)		;642f   ; lee los botones pulsados del mando 1 / cursores
	and 003h		;6432
	ret z			;6434   ; mantenida: cada 8 cuadros
	ld hl,0d2e1h		;6435   ; apunta a la espera de los avisos
	dec (hl)			;6438
	ret nz			;6439
L_643A:
	ld hl,0d2e1h		;643a   ; ...cada 8 cuadros: abajo uno menos (de 1 a 26)...
	ld (hl),008h		;643d
	rra			;643f   ; bit 0 (abajo?) segun el bit que sale: uno menos o uno mas
	ld a,(0d753h)		;6440   ; lee los partidos de cada pareja en PENNANT (1-26)
	jr c,L_644E		;6443
	cp 001h		;6445   ; de 1 pasa a 26
	jr nz,L_644B		;6447
	ld a,01bh		;6449
L_644B:
	dec a			;644b
	jr L_6454		;644c
L_644E:
	cp 01ah		;644e   ; ...arriba uno mas (de 26 a 1)...
	jr nz,L_6453		;6450
	xor a			;6452   ; de 26 pasa a 1
L_6453:
	inc a			;6453
L_6454:
	ld hl,0d753h		;6454   ; ...en BCD en 0xD754 y el sonido 0x26
	ld (hl),a			;6457   ; en 0xD753...
	inc hl			;6458
	call L_646D		;6459   ; ...y en BCD en 0xD754
	ld (hl),a			;645c
	ld a,026h		;645d
	call 057ffh		;645f   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_6462:
	ld hl,0d754h		;6462   ; el numero de partidos (BCD de 0xD754) en (0x70, 0x98)
	ld de,07098h		;6465   ; en (0x98, 0x70), una cifra BCD de dos digitos
	ld b,001h		;6468
	jp 05bf1h		;646a   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
L_646D:
	push bc			;646d   ; A en BCD (decenas x 16 + unidades)
	ld b,00ah		;646e
	ld c,000h		;6470
L_6472:
	inc c			;6472   ; C = las decenas: restar 10 mientras quepa
	sub b			;6473
	jr z,L_647C		;6474
	jp p,L_6472		;6476
	dec c			;6479   ; la ultima resta sobraba
	add a,00ah		;647a
L_647C:
	sla c		;647c   ; las decenas a la mitad alta...
	sla c		;647e
	sla c		;6480
	sla c		;6482
	add a,c			;6484   ; ...mas las unidades
	pop bc			;6485
	ret			;6486
L_6487:
	ld a,(0d74dh)		;6487
	call 04220h		;648a   ; la tabla de subpasos (p13:648D)

; ----------------------------------------------------------------------
; DATOS tabla_648D: 2 destinos del despachador p00:4220 (call en p13:648A, el
;   indice en A): 6491, 64B4; lo leen p13:648A (4 bytes)
;   0x648d..0x6491  (4 bytes)
DATA_tabla_648D:
	defw 06491h,064b4h	; 648d  -> L_6491 L_64B4

; ======================================================================
; CODIGO 0x6491..0x6594  (259 bytes)
; ======================================================================


L_6491:
	call L_6C85		;6491   ; la opcion 3: con el boton y todos los equipos elegidos, el texto de p13:62D1
	ld a,(0d759h)		;6494   ; lee la opcion del menu de PENNANT
	sub 003h		;6497
	jp nz,L_60BE		;6499   ; si la opcion no es la 3, a la suya
	ld a,(0de06h)		;649c   ; lee los botones recien pulsados del mando 1 / cursores
	and 010h		;649f
	ret z			;64a1   ; sin boton, nada
	call cuantos_equipos		;64a2   ; cuantos_equipos: B = cuantos equipos juegan: 0xD6E1, o 6 con uno solo
	ld a,(0da6bh)		;64a5
	cp b			;64a8   ; si no estan todos los equipos, nada
	ret nz			;64a9
	ld hl,062d1h		;64aa   ; el texto de 0x62D1
	call 04ea6h		;64ad   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	jp subpaso_siguiente		;64b0   ; subpaso_siguiente: el subpaso siguiente (0xD74D + 1)
L_64B3:
	ret			;64b3
L_64B4:
	call L_6BA1		;64b4   ; empezar: p13:6BA1, copia los equipos de 0xD70A a 0xD72A...
	ld de,0d72ah		;64b7   ; los 6 elegidos a 0xD72A
	ld hl,0d70ah		;64ba   ; apunta a los 6 equipos elegidos (0xFF libre)
	ld bc,00006h		;64bd
	ldir		;64c0
	ld hl,0de02h		;64c2   ; ...dos jugadores (bit 5 de 0xDE02) salvo con 1: entonces solo uno...
	set 5,(hl)		;64c5
	ld a,(0d6e1h)		;64c7   ; lee el numero de jugadores de PENNANT (1-6)
	dec a			;64ca
	jr nz,L_64D9		;64cb
	res 5,(hl)		;64cd   ; con uno solo, sin dos jugadores
	ld a,001h		;64cf   ; ...0xE1D1 = 1 y 0xD6DC = 0
	ld (0e1d1h),a		;64d1   ; guarda la marca de acabado de los pasos; en el lanzamiento, su paso (p03:A525)
	xor a			;64d4
	ld (0d6dch),a		;64d5   ; guarda el equipo del jugador en PENNANT (bit 0)
	ret			;64d8
L_64D9:
	ld a,00dh		;64d9   ; con mas, al paso 13
	ld (0d74ch),a		;64db   ; guarda el despachador de los menus (y 0xD74D)
	ret			;64de
L_64DF:
	call 04b9fh		;64df   ; la siguiente jornada: con un jugador, 0xE1D1 = 1 y fuera
	ld a,(0d6e1h)		;64e2   ; con varios jugadores, p13:64EF
	dec a			;64e5
	jp nz,L_64EF		;64e6
	ld a,001h		;64e9
	ld (0e1d1h),a		;64eb   ; guarda la marca de acabado de los pasos; en el lanzamiento, su paso (p03:A525)
	ret			;64ee
L_64EF:
	xor a			;64ef   ; los pasos a cero, el paso 9...
	ld hl,0d74ch		;64f0   ; apunta a el despachador de los menus (y 0xD74D)
	ld de,0d74dh		;64f3   ; 0xD74C-0xD75B a 0
	ld (hl),a			;64f6
	ld bc,0000fh		;64f7
	ldir		;64fa
	ld (0da6bh),a		;64fc   ; 0xDA6B y la opcion a 0
	ld (0d759h),a		;64ff   ; guarda la opcion del menu de PENNANT
	ld a,009h		;6502   ; el paso 9
	ld (0d74ch),a		;6504   ; guarda el despachador de los menus (y 0xD74D)
	ld de,0e340h		;6507   ; ...guarda los equipos de 0xD70A en 0xE340 y los pone a 0xFF...
	ld hl,0d70ah		;650a   ; apunta a los 6 equipos elegidos (0xFF libre)
	ld bc,00006h		;650d
	ldir		;6510   ; 6 bytes a 0xE340
	ld de,0d70bh		;6512
	ld hl,0d70ah		;6515   ; apunta a los 6 equipos elegidos (0xFF libre)
	ld (hl),0ffh		;6518   ; 0xD70A-0xD70F a 0xFF
	ld bc,00005h		;651a
	ldir		;651d
	ld de,0d719h		;651f   ; ...0xD718-0xD729 a 0xFF...
	ld hl,0d718h		;6522
	ld (hl),0ffh		;6525   ; 0xD718-0xD729 a 0xFF (18 bytes)
	ld bc,00011h		;6527
	ldir		;652a
	call L_65BE		;652c   ; ...quien juega con quien (p13:65BE)...
	call cuantos_equipos		;652f   ; cuantos_equipos: B = cuantos equipos juegan: 0xD6E1, o 6 con uno solo
	ld c,002h		;6532   ; ...los numeros 2, 3... en columna...
	ld de,04c6ch		;6534   ; en (0x6C, 0x4C), de 12 en 12
L_6537:
	ld a,c			;6537
	call 04f1ch		;6538   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld a,e			;653b
	add a,00ch		;653c
	ld e,a			;653e
	inc c			;653f
	djnz L_6537		;6540
	call L_6187		;6542   ; ...la flecha, el texto de p13:A710 y la tabla de la jornada...
	ld hl,0a710h		;6545
	call 04ea6h		;6548   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld hl,00050h		;654b   ; una linea en la y 0x50
	ld c,00dh		;654e
	ld b,000h		;6550
	call 04c91h		;6552   ; linea: orden LINE (0x70) del VDP desde HL
	ld hl,008c6h		;6555   ; un marco
	ld c,00dh		;6558
	ld de,0f20ch		;655a
	call 04cfeh		;655d   ; marco: un marco de lineas: HL la esquina, DE el tamano
	ld hl,04ec6h		;6560   ; cuatro lineas verticales en la y 0xC6: x 0x4E, 0x7E, 0xAE y 0xDE
	ld c,00dh		;6563
	ld b,00ch		;6565
	call 04cc7h		;6567   ; linea_vertical: orden LINE (0x70) del VDP, el lado largo en vertical
	ld hl,07ec6h		;656a
	ld c,00dh		;656d
	ld b,00ch		;656f
	call 04cc7h		;6571   ; linea_vertical: orden LINE (0x70) del VDP, el lado largo en vertical
	ld hl,0aec6h		;6574
	ld c,00dh		;6577
	ld b,00ch		;6579
	call 04cc7h		;657b   ; linea_vertical: orden LINE (0x70) del VDP, el lado largo en vertical
	ld hl,0dec6h		;657e
	ld c,00dh		;6581
	ld b,00ch		;6583
	call 04cc7h		;6585   ; linea_vertical: orden LINE (0x70) del VDP, el lado largo en vertical
	ld hl,06594h		;6588   ; ...el texto de 0x6594, p13:6811 y el cursor
	call 04ea6h		;658b   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	call L_6811		;658e   ; la opcion (p13:6811)
	jp L_626C		;6591   ; y el cursor

; ----------------------------------------------------------------------
; DATOS texto_6594: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; se solapan 2 bloques: (texto_65B8 65B8-65BE); lo leen
;   p13:658B, p13:6814, p13:667D (42 bytes)
;   0x6594..0x65be  (42 bytes)
DATA_texto_6594:
	defb 030h,020h,024h,017h,021h,017h,022h,01dh,020h,021h,0feh,030h,038h,016h,01dh,01bh	; 6594  0 $.!.". !.08...	los textos de la pantalla de la jornada
	defb 013h,0feh,00ah,0c8h,024h,017h,021h,017h,022h,01dh,020h,021h,0feh,052h,0c8h,016h	; 65a4  ....$.!.". !.R..
	defb 01dh,01bh,013h,0feh,082h,0c8h,013h,01ch,012h,0ffh	; 65b4  ..........

; ======================================================================
; CODIGO 0x65be..0x6656  (152 bytes)
; ======================================================================


L_65BE:
	ld hl,0e340h		;65be   ; los emparejamientos: para cada equipo (0xE340) a 0xD718...
	ld de,0d718h		;65c1   ; a 0xD718, uno por equipo
	call cuantos_equipos		;65c4   ; cuantos_equipos: B = cuantos equipos juegan: 0xD6E1, o 6 con uno solo
L_65C7:
	ld a,(hl)			;65c7
	ld c,a			;65c8   ; C = el equipo
	exx			;65c9
	call indice_de_equipo		;65ca   ; ...su fila de la tabla de 0xD6E3 (6 bytes)...
	ld l,c			;65cd
	ld h,000h		;65ce
	add hl,hl			;65d0
	ld d,h			;65d1
	ld e,l			;65d2
	add hl,hl			;65d3
	add hl,de			;65d4
	ld de,0d6e3h		;65d5   ; HL = 0xD6E3 + 6 x su indice
	add hl,de			;65d8
	call cuantos_equipos		;65d9   ; cuantos_equipos: B = cuantos equipos juegan: 0xD6E1, o 6 con uno solo
	ld e,000h		;65dc   ; E = el rival que se mira
L_65DE:
	ld a,(0d6deh)		;65de   ; ...si ya ha jugado con todos los demas (0xD6DE - 1 veces)...
	dec a			;65e1
	cp (hl)			;65e2   ; con todos los partidos jugados contra ese (0xD6DE - 1)...
	jr c,L_65E9		;65e3
	ld a,e			;65e5   ; ...o si es el mismo, sigue mirando
	cp c			;65e6
	jr nz,L_65F5		;65e7   ; si queda alguno por jugar, libre
L_65E9:
	inc hl			;65e9
	inc e			;65ea
	djnz L_65DE		;65eb
	exx			;65ed
	ld a,c			;65ee   ; todos jugados: el equipo se queda
	ld (de),a			;65ef
L_65F0:
	inc hl			;65f0
	inc de			;65f1
	djnz L_65C7		;65f2
	ret			;65f4
L_65F5:
	exx			;65f5
	ld a,0ffh		;65f6   ; 0xFF: libre
	ld (de),a			;65f8
	jr L_65F0		;65f9
indice_de_equipo:		; C = el indice del equipo A en 0xD72A
	ld c,000h		;65fb   ; C = el indice del equipo A en 0xD72A
	ld hl,0d72ah		;65fd
L_6600:
	cp (hl)			;6600   ; busca A en la lista; C cuenta
	ret z			;6601
	inc hl			;6602
	inc c			;6603
	jr L_6600		;6604
L_6606:
	call L_67FA		;6606   ; la jornada, opcion 0: el visitante: con el boton...
	ld a,(0d759h)		;6609   ; lee la opcion del menu de PENNANT
	or a			;660c
	jp nz,L_60CB		;660d   ; si la opcion no es la 0, a la suya
	call L_6846		;6610   ; el cursor (p13:6846)
	xor a			;6613
	call L_68A8		;6614   ; la lista con los que le quedan (p13:68A8)
	ld a,(0de06h)		;6617   ; lee los botones recien pulsados del mando 1 / cursores
	and 010h		;661a
	ret z			;661c   ; sin boton, nada
	call L_66C4		;661d   ; ...el elegido (p13:66C4) y los dos nombres
	call L_6737		;6620
	xor a			;6623
	call L_68A8		;6624   ; la lista otra vez
	jp L_60CB		;6627
L_662A:
	call L_67FA		;662a   ; opcion 1: el local (p13:66F6)
	ld a,(0d759h)		;662d   ; lee la opcion del menu de PENNANT
	dec a			;6630
	jp nz,L_60CB		;6631   ; si la opcion no es la 1, a la suya
	call L_6846		;6634
	ld a,001h		;6637
	call L_68A8		;6639   ; la lista del local
	ld a,(0de06h)		;663c   ; lee los botones recien pulsados del mando 1 / cursores
	and 010h		;663f
	ret z			;6641   ; sin boton, nada
	call L_66F6		;6642
	call L_6737		;6645
	ld a,001h		;6648
	call L_68A8		;664a
	jp L_60CB		;664d
L_6650:
	ld a,(0d74dh)		;6650
	call 04220h		;6653   ; la tabla de subpasos (p13:6656)

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
	call L_67FA		;665a   ; opcion 2: con el boton y los dos elegidos, al subpaso siguiente
	ld a,(0d759h)		;665d   ; lee la opcion del menu de PENNANT
	sub 002h		;6660
	jp nz,L_60CB		;6662   ; si la opcion no es la 2, a la suya
	ld a,(0de06h)		;6665   ; lee los botones recien pulsados del mando 1 / cursores
	and 010h		;6668
	ret z			;666a   ; sin boton, nada
	ld hl,(0d70ah)		;666b   ; lee los 6 equipos elegidos (0xFF libre) y el byte siguiente (16 bits)
	ld a,h			;666e
	inc a			;666f   ; sin visitante (0xFF), nada
	ret z			;6670
	ld a,l			;6671
	inc a			;6672
	ret z			;6673   ; sin local, nada
	jp subpaso_siguiente		;6674   ; subpaso_siguiente: el subpaso siguiente (0xD74D + 1)
L_6677:
	call L_6761		;6677   ; el orden de la jornada (p13:6761), el texto de 0x65B8 y 0xE1D1 = 1
	ld hl,065b8h		;667a   ; el texto de 0x65B8
	call 04ea6h		;667d   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld a,001h		;6680   ; 0xE1D1 = 1: hecho
	ld (0e1d1h),a		;6682   ; guarda la marca de acabado de los pasos; en el lanzamiento, su paso (p03:A525)
	ret			;6685
L_6686:
	ld a,(0d74fh)		;6686   ; B' = el equipo de la fila del cursor (0xD72A + 0xD74F)
	ld c,a			;6689
	ld b,000h		;668a
	ld hl,0d72ah		;668c   ; el equipo de la fila en 0xD72A
	add hl,bc			;668f
	ld a,(hl)			;6690
	exx			;6691   ; en B'
	ld b,a			;6692
	exx			;6693
	ret			;6694
L_6695:
	call indice_de_equipo		;6695   ; los rivales que le quedan: su fila de 0xD6E3...
	ld l,c			;6698   ; HL = 0xD6E3 + 6 x el indice
	ld h,000h		;6699
	add hl,hl			;669b
	ld b,h			;669c
	ld c,l			;669d
	add hl,hl			;669e
	add hl,bc			;669f
	ld bc,0d6e3h		;66a0
	add hl,bc			;66a3
	ld b,006h		;66a4   ; los 6
L_66A6:
	ld a,(0d6deh)		;66a6   ; ...los que ya ha jugado bastante (0xD6DE - 1) van a 0xFF...
	dec a			;66a9
	cp (hl)			;66aa   ; si ya ha jugado bastante con ese, 0xFF
	jr c,L_66B5		;66ab
	ld a,0ffh		;66ad
	ld (de),a			;66af
L_66B0:
	inc hl			;66b0
	inc de			;66b1
	djnz L_66A6		;66b2
	ret			;66b4
L_66B5:
	push hl			;66b5   ; ...los demas con su numero
	ld a,006h		;66b6   ; el equipo 6 - B de 0xD72A
	sub b			;66b8
	ld hl,0d72ah		;66b9
	call 04216h		;66bc   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;66bf
	pop hl			;66c0
	ld (de),a			;66c1
	jr L_66B0		;66c2
L_66C4:
	call L_6686		;66c4   ; el visitante elegido: no el mismo que el local...
	ld bc,(0d70ah)		;66c7   ; lee los 6 equipos elegidos (0xFF libre) y el byte siguiente (16 bits)
	cp b			;66cb   ; el que ya es visitante o local, no
	ret z			;66cc
	cp c			;66cd
	ret z			;66ce
	push af			;66cf   ; ...y que le quede ese rival...
	ld hl,0d718h		;66d0   ; la lista de rivales: 0xD718 o, con local, 0xD724
	ld a,(0d70bh)		;66d3
	inc a			;66d6
	jr z,L_66DC		;66d7
	ld hl,0d724h		;66d9
L_66DC:
	pop af			;66dc
	ld b,006h		;66dd
L_66DF:
	cp (hl)			;66df   ; si esta en la lista (ya no puede jugar con el), no
	inc hl			;66e0
	ret z			;66e1
	djnz L_66DF		;66e2
	ld hl,0d70ah		;66e4   ; ...0xD70A = el, sus rivales a 0xD71E y su nombre a 0xDA6C
	ld (hl),a			;66e7   ; el visitante
	ld de,0d71eh		;66e8   ; sus rivales a 0xD71E
	call L_6695		;66eb
	ld de,0da6ch		;66ee   ; el nombre a 0xDA6C
	exx			;66f1
	ld a,b			;66f2
	exx			;66f3
	jr L_6726		;66f4
L_66F6:
	call L_6686		;66f6   ; el local: lo mismo con 0xD70B, 0xD724 y 0xDA77
	ld bc,(0d70ah)		;66f9   ; lee los 6 equipos elegidos (0xFF libre) y el byte siguiente (16 bits)
	cp b			;66fd   ; el que ya es visitante o local, no
	ret z			;66fe
	cp c			;66ff
	ret z			;6700
	push af			;6701
	ld hl,0d718h		;6702   ; la lista: 0xD718 o, con visitante, 0xD71E
	ld a,(0d70ah)		;6705   ; lee los 6 equipos elegidos (0xFF libre)
	inc a			;6708
	jr z,L_670E		;6709
	ld hl,0d71eh		;670b
L_670E:
	pop af			;670e
	ld b,006h		;670f
L_6711:
	cp (hl)			;6711   ; si esta en la lista, no
	inc hl			;6712
	ret z			;6713
	djnz L_6711		;6714
	ld hl,0d70bh		;6716
	ld (hl),a			;6719   ; el local
	ld de,0d724h		;671a   ; sus rivales a 0xD724
	call L_6695		;671d
	ld de,0da77h		;6720   ; el nombre a 0xDA77
	exx			;6723
	ld a,b			;6724
	exx			;6725
L_6726:
	call por_once		;6726   ; el nombre de 11 letras de 0xDAAE + 11 x n y el sonido 0x27
	ld bc,0daaeh		;6729   ; apunta a los nombres de los equipos (11 letras cada uno)
	add hl,bc			;672c   ; 0xDAAE + 11 x el equipo
	ld bc,0000bh		;672d   ; 11 letras
	ldir		;6730
	ld a,027h		;6732   ; el sonido 0x27
	jp 057ffh		;6734   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_6737:
	ld hl,0da6ch		;6737   ; los dos nombres (o espacios) en la pantalla y las marcas
	ld de,08020h		;673a
	ld a,(0d70ah)		;673d   ; el visitante en (0x20, 0x80); sin el, el blanco de 0x6AAB
	inc a			;6740
	jr nz,L_6746		;6741
	ld hl,06aabh		;6743
L_6746:
	call 0a651h		;6746   ; diez_letras_2: 10 letras ASCII en la fuente
	ld hl,0da77h		;6749   ; el local en (0x38, 0x80)
	ld de,08038h		;674c
	ld a,(0d70bh)		;674f
	inc a			;6752
	jr nz,L_6758		;6753
	ld hl,06aabh		;6755
L_6758:
	call 0a651h		;6758   ; diez_letras_2: 10 letras ASCII en la fuente
	call L_6874		;675b   ; la fila siguiente y la opcion siguiente
	jp L_6800		;675e
L_6761:
	call cuantos_equipos		;6761   ; el orden de la jornada: los dos que juegan primero...
	dec b			;6764   ; con dos equipos, solo recolocar
	dec b			;6765
	jr z,L_6783		;6766
	ld de,0d70ch		;6768
	ld hl,0e340h		;676b   ; apunta a variable de paso (cada rutina la usa a su manera)
L_676E:
	ld a,(0d70ah)		;676e   ; los de 0xE340 que no son ni el visitante...
	cp (hl)			;6771
	jr z,L_677A		;6772
	ld a,(0d70bh)		;6774   ; ...ni el local...
	cp (hl)			;6777
	jr nz,L_677D		;6778
L_677A:
	inc hl			;677a
	jr L_676E		;677b
L_677D:
	ld c,00fh		;677d   ; ...van detras, desde 0xD70C
	ldi		;677f
	djnz L_676E		;6781
L_6783:
	ld de,0d70ah		;6783   ; ...y se recoloca 0xE340 y las fichas de 15 bytes de 0xD680 a la vez
	ld hl,0e340h		;6786   ; cada puesto de 0xD70A contra el de 0xE340
	call cuantos_equipos		;6789   ; cuantos_equipos: B = cuantos equipos juegan: 0xD6E1, o 6 con uno solo
	exx			;678c
	ld c,000h		;678d   ; C' = el puesto
	exx			;678f
L_6790:
	push hl			;6790
	push bc			;6791
	ld a,(de)			;6792
	cp (hl)			;6793   ; si coincide, sigue
	jr z,L_67A7		;6794
	ld c,000h		;6796
L_6798:
	inc c			;6798   ; si no, C = cuanto mas adelante esta...
	inc hl			;6799
	cp (hl)			;679a
	jr nz,L_6798		;679b
	ld a,c			;679d
	exx			;679e
	ld b,a			;679f
	exx			;67a0
	call L_67BC		;67a1   ; ...y se cambian los dos equipos y sus fichas
	call L_67D5		;67a4
L_67A7:
	pop bc			;67a7
	pop hl			;67a8
	inc hl			;67a9
	inc de			;67aa
	exx			;67ab
	inc c			;67ac
	exx			;67ad
	djnz L_6790		;67ae   ; todos
	ld hl,0da77h		;67b0   ; el nombre del local a 0xD740
	ld de,0d740h		;67b3
	ld bc,0000bh		;67b6
	ldir		;67b9
	ret			;67bb
L_67BC:
	exx			;67bc   ; cambia dos equipos de 0xE340
	ld a,c			;67bd   ; B = C' + B': el otro puesto
	add a,b			;67be
	ld b,a			;67bf
	push bc			;67c0
	ld hl,0e340h		;67c1   ; apunta a variable de paso (cada rutina la usa a su manera)
	ld d,h			;67c4
	ld e,l			;67c5
	call 04216h		;67c6   ; HL = 0xE340 + B
	ld a,c			;67c9
	call 0421bh		;67ca   ; DE = 0xE340 + C
	ld a,(de)			;67cd   ; los cambia
	ld b,(hl)			;67ce
	ld (hl),a			;67cf
	ld a,b			;67d0
	ld (de),a			;67d1
	pop bc			;67d2
	exx			;67d3
	ret			;67d4
L_67D5:
	exx			;67d5   ; cambia sus fichas de 15 bytes en 0xD680
	push bc			;67d6
	ld a,b			;67d7
	call L_6B0A		;67d8   ; HL = la ficha B (15 x B + 0xD680)
	ld bc,0d680h		;67db
	add hl,bc			;67de
	ex de,hl			;67df
	pop bc			;67e0
	push bc			;67e1
	ld a,c			;67e2
	call L_6B0A		;67e3   ; la ficha C
	ld bc,0d680h		;67e6
	add hl,bc			;67e9
	pop bc			;67ea
	ld b,00fh		;67eb   ; 15 bytes
L_67ED:
	push bc			;67ed
	ld a,(de)			;67ee   ; los cambia
	ld b,(hl)			;67ef   ; un byte de cada ficha...
	ld (hl),a			;67f0
	ld a,b			;67f1
	ld (de),a			;67f2   ; ...cambiados
	inc hl			;67f3
	inc de			;67f4
	pop bc			;67f5
	djnz L_67ED		;67f6   ; los 15
	exx			;67f8
	ret			;67f9
L_67FA:
	ld a,(0de06h)		;67fa   ; con el boton 2, la opcion siguiente (0xD759, de 0 a 2)...
	and 020h		;67fd
	ret z			;67ff   ; sin el boton 2, nada
L_6800:
	ld a,(0d759h)		;6800   ; lee la opcion del menu de PENNANT
	inc a			;6803
	cp 003h		;6804   ; despues de la 2, la 0
	jr nz,L_6809		;6806
	xor a			;6808
L_6809:
	ld (0d759h),a		;6809   ; ...el sonido 0x26...
	ld a,026h		;680c
	call 057ffh		;680e   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_6811:
	ld hl,06594h		;6811   ; ...y su texto (la tabla 0x6828)
	call 04ea6h		;6814   ; el texto comun de 0x6594
	ld a,(0d759h)		;6817   ; lee la opcion del menu de PENNANT
	ld hl,06828h		;681a
	add a,a			;681d   ; la palabra de la opcion...
	call 04216h		;681e   ; hl_mas_a: HL = HL + A
	ld e,(hl)			;6821
	inc hl			;6822
	ld d,(hl)			;6823
	ex de,hl			;6824   ; ...es su texto
	jp 04ea6h		;6825   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto

; ----------------------------------------------------------------------
; DATOS textos_6828: 3 punteros a textos elegidos por 0xD759 (p13:6825 salta a
;   p00:4EA6); lo leen p13:681E (6 bytes)
;   0x6828..0x682e  (6 bytes)
DATA_textos_6828:
	defw 0682eh,06839h,06840h	; 6828  -> DATA_texto_682E DATA_texto_6839 DATA_texto_6840	los textos de las 3 opciones (punteros y textos)

; ----------------------------------------------------------------------
; DATOS texto_682E: texto 0 de la tabla 0x6828 ([x y] y caracteres hasta
;   0xFF), que se pinta con p00:4EA6; lo leen p13:681E (11 bytes)
;   0x682e..0x6839  (11 bytes)
DATA_texto_682E:
	defb 00ah,0c8h,0c4h,0b7h,0c1h,0b7h,0c2h,0bdh,0c0h,0c1h,0ffh	; 682e  ...........

; ----------------------------------------------------------------------
; DATOS texto_6839: texto 1 de la tabla 0x6828 ([x y] y caracteres hasta
;   0xFF), que se pinta con p00:4EA6; lo leen p13:681E (7 bytes)
;   0x6839..0x6840  (7 bytes)
DATA_texto_6839:
	defb 052h,0c8h,0b6h,0bdh,0bbh,0b3h,0ffh	; 6839

; ----------------------------------------------------------------------
; DATOS texto_6840: texto 2 de la tabla 0x6828 ([x y] y caracteres hasta
;   0xFF), que se pinta con p00:4EA6; lo leen p13:681E (6 bytes)
;   0x6840..0x6846  (6 bytes)
DATA_texto_6840:
	defb 082h,0c8h,0b3h,0bch,0b2h,0ffh	; 6840

; ======================================================================
; CODIGO 0x6846..0x689c  (86 bytes)
; ======================================================================


L_6846:
	ld a,(0de06h)		;6846   ; la fila del cursor (0xD74F) con arriba y abajo, sin pasar de los equipos (p13:6B5B)
	and 010h		;6849
	ret nz			;684b   ; con el boton 1, nada
	ld hl,0d74fh		;684c   ; apunta a la fila del cursor de las listas
	ld a,(0de06h)		;684f   ; lee los botones recien pulsados del mando 1 / cursores
	rra			;6852
	jr c,L_6868		;6853   ; arriba: p13:6868
	rra			;6855
	jr nc,L_6882		;6856   ; abajo: si no esta en la ultima fila, una mas
	call cuantos_equipos		;6858   ; cuantos_equipos: B = cuantos equipos juegan: 0xD6E1, o 6 con uno solo
	ld a,b			;685b
	dec a			;685c
	cp (hl)			;685d
	jr z,L_6882		;685e
	inc (hl)			;6860
	ld a,026h		;6861   ; el sonido 0x26
	call 057ffh		;6863   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	jr L_6882		;6866
L_6868:
	ld a,(hl)			;6868   ; si no esta en la primera, una menos
	or a			;6869
	jr z,L_6882		;686a
	dec (hl)			;686c
	ld a,026h		;686d
	call 057ffh		;686f   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	jr L_6882		;6872
L_6874:
	call cuantos_equipos		;6874   ; la fila siguiente (da la vuelta)
	ld a,(0d74fh)		;6877   ; lee la fila del cursor de las listas
	inc a			;687a
	cp b			;687b
	jr c,L_687F		;687c
	xor a			;687e   ; despues de la ultima, la primera
L_687F:
	ld (0d74fh),a		;687f   ; guarda la fila del cursor de las listas
L_6882:
	ld a,(0d74fh)		;6882   ; el cursor en su fila: los 2 bytes de 0x689C a la VRAM 0xF600
	ld hl,0689ch		;6885
	add a,a			;6888   ; la entrada de 2 bytes de 0x689C
	call 04216h		;6889   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;688c
	inc hl			;688d
	ld e,(hl)			;688e
	ld hl,0f600h		;688f
	call 04ae3h		;6892   ; la y al atributo del sprite 0...
	ld a,e			;6895
	ld hl,0f601h		;6896
	jp 04ae3h		;6899   ; ...y la x

; ----------------------------------------------------------------------
; DATOS pares_689C: 6 pares de bytes (0xD74F x 2, p13:6889): el primero va a
;   la VRAM 0xF600 y el segundo a la 0xF601 (p00:4AE3); lo leen p13:6885 (12
;   bytes)
;   0x689c..0x68a8  (12 bytes)
DATA_pares_689C:
	defb 06ch,040h	; 689c	la y y la x del cursor en cada fila (6 entradas)
	defb 078h,040h	; 689e
	defb 084h,040h	; 68a0
	defb 090h,040h	; 68a2
	defb 09ch,040h	; 68a4
	defb 0a8h,040h	; 68a6

; ======================================================================
; CODIGO 0x68a8..0x69ed  (325 bytes)
; ======================================================================


L_68A8:
	or a			;68a8   ; la lista de equipos con los que ya no puede jugar en otro color: los del local...
	jr nz,L_68B9		;68a9   ; A = 1: los del visitante
	ld hl,0d718h		;68ab   ; la lista del visitante: 0xD718, o 0xD724 si ya hay local
	ld a,(0d70bh)		;68ae
	inc a			;68b1
	jr z,L_68C5		;68b2
	ld hl,0d724h		;68b4
	jr L_68C5		;68b7
L_68B9:
	ld hl,0d718h		;68b9   ; la del local: 0xD718, o 0xD71E si ya hay visitante
	ld a,(0d70ah)		;68bc   ; lee los 6 equipos elegidos (0xFF libre)
	inc a			;68bf
	jr z,L_68C5		;68c0
	ld hl,0d71eh		;68c2
L_68C5:
	ld (0e350h),hl		;68c5   ; cada equipo de 0xD72A: su nombre (0xDAAE + 11 n)...
	ld de,05c6ch		;68c8   ; desde (0x6C, 0x5C)
	call cuantos_equipos		;68cb   ; cuantos_equipos: B = cuantos equipos juegan: 0xD6E1, o 6 con uno solo
	ld c,000h		;68ce
L_68D0:
	push de			;68d0
	push bc			;68d1
	ld hl,0d72ah		;68d2   ; el equipo C de 0xD72A
	ld b,000h		;68d5
	add hl,bc			;68d7
	ld a,(hl)			;68d8
	call por_once		;68d9   ; su nombre: 0xDAAE + 11 x el equipo
	ld bc,0daaeh		;68dc   ; apunta a los nombres de los equipos (11 letras cada uno)
	add hl,bc			;68df
	pop bc			;68e0
	push bc			;68e1
	call L_68EF		;68e2   ; se pinta (p13:68EF)
	pop bc			;68e5
	inc c			;68e6
	pop de			;68e7
	ld a,e			;68e8   ; 12 mas abajo
	add a,00ch		;68e9
	ld e,a			;68eb
	djnz L_68D0		;68ec
	ret			;68ee
L_68EF:
	exx			;68ef   ; ...en el color 4 (+0xA0) si esta elegido o no le quedan partidos...
	ld c,0a0h		;68f0   ; el color 4 (+0xA0) para los elegidos
	ld hl,0d70ah		;68f2   ; apunta a los 6 equipos elegidos (0xFF libre)
	cp (hl)			;68f5   ; el visitante
	jr z,L_6909		;68f6
	inc hl			;68f8
	cp (hl)			;68f9   ; o el local
	jr z,L_6909		;68fa
	ld hl,(0e350h)		;68fc   ; o los de la lista de rivales
	ld b,006h		;68ff
L_6901:
	cp (hl)			;6901   ; si esta, en el color 4
	jr z,L_6909		;6902
	inc hl			;6904
	djnz L_6901		;6905
	ld c,000h		;6907   ; si no, el color normal
L_6909:
	ld a,c			;6909
	exx			;690a
	ld c,a			;690b
	ld b,00ah		;690c   ; 10 letras
L_690E:
	push bc			;690e   ; ...10 letras (p14:9834 da la letra, 0 en blanco)
	call 09834h		;690f   ; letra_ascii: una letra ASCII a la fuente
	or a			;6912
	jr z,L_6916		;6913
	add a,c			;6915   ; + el color (0 sigue en blanco)
L_6916:
	call 04f1ch		;6916   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld a,d			;6919   ; la x 8 mas
	add a,008h		;691a
	ld d,a			;691c
	inc hl			;691d
	pop bc			;691e
	djnz L_690E		;691f
	ret			;6921
L_6922:
	ld hl,0d74fh		;6922   ; la siguiente fila de jugador (0xD2B2 filas), da la vuelta
	ld a,(0d2b2h)		;6925   ; lee cuantos nombres hay en la lista de equipos (los 6 de serie y los grabados)
	dec a			;6928   ; en la ultima fila...
	cp (hl)			;6929
	jr nz,L_6935		;692a
	xor a			;692c   ; ...la ventana y el cursor a 0
	ld (0d751h),a		;692d
	ld (0d74fh),a		;6930   ; guarda la fila del cursor de las listas
	jr L_69A3		;6933
L_6935:
	inc (hl)			;6935
	jr L_69A3		;6936
L_6938:
	ld a,(0d2b2h)		;6938   ; el cursor de la lista de jugadores: 0xD2B2 filas (o 0xD2B2 - 6)...
	ld (0e360h),a		;693b   ; 0xE360 = todas las filas
	jr L_6948		;693e
L_6940:
	ld a,(0d2b2h)		;6940   ; lee cuantos nombres hay en la lista de equipos (los 6 de serie y los grabados)
	sub 006h		;6943   ; sin los 6 de serie
	ld (0e360h),a		;6945
L_6948:
	ld a,(0de06h)		;6948   ; ...arriba y abajo de 2 en 2, izquierda y derecha cambian de columna...
	and 010h		;694b
	ret nz			;694d   ; con el boton 1, nada
	ld hl,0d74fh		;694e   ; apunta a la fila del cursor de las listas
	ld a,(0de06h)		;6951   ; lee los botones recien pulsados del mando 1 / cursores
	rra			;6954
	jr c,L_6993		;6955   ; bit 0 (arriba): dos filas menos
	rra			;6957
	jr c,L_697F		;6958   ; bit 1 (abajo): dos mas
	rra			;695a
	jr c,L_6973		;695b   ; bit 2 (izquierda): una menos si esta en la derecha
	rra			;695d
	jr nc,L_69A3		;695e   ; bit 3 (derecha): una mas si esta en la izquierda
	ld a,(hl)			;6960
	rra			;6961
	jr c,L_69A3		;6962
	ld a,(0e360h)		;6964   ; y si no es la ultima
	dec a			;6967
	cp (hl)			;6968
	jr z,L_69A3		;6969
	inc (hl)			;696b
	ld a,026h		;696c   ; el sonido 0x26
	call 057ffh		;696e   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	jr L_69A3		;6971
L_6973:
	ld a,(hl)			;6973
	rra			;6974
	jr nc,L_69A3		;6975
	dec (hl)			;6977
	ld a,026h		;6978   ; el sonido 0x26
	call 057ffh		;697a   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	jr L_69A3		;697d
L_697F:
	ld a,(0e360h)		;697f   ; abajo: si quedan dos filas mas
	dec a			;6982
	sub (hl)			;6983
	jr c,L_69A3		;6984
	cp 002h		;6986
	jr c,L_69A3		;6988
	inc (hl)			;698a   ; dos mas
	inc (hl)			;698b
	ld a,026h		;698c
	call 057ffh		;698e   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	jr L_69A3		;6991
L_6993:
	dec (hl)			;6993   ; arriba: si no baja de 0
	dec (hl)			;6994
	ld a,(hl)			;6995
	inc (hl)			;6996
	inc (hl)			;6997
	bit 7,a		;6998
	jr nz,L_69A3		;699a
	dec (hl)			;699c   ; dos menos
	dec (hl)			;699d
	ld a,026h		;699e
	call 057ffh		;69a0   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_69A3:
	ld hl,0d751h		;69a3   ; ...la ventana de 16 filas (0xD751) sigue al cursor...
	ld a,(0d74fh)		;69a6   ; lee la fila del cursor de las listas
	cp (hl)			;69a9   ; el cursor por encima de la ventana: la ventana sube dos
	jr nc,L_69B3		;69aa
	ld hl,0d751h		;69ac
	dec (hl)			;69af
	dec (hl)			;69b0
	jr L_69C3		;69b1
L_69B3:
	ld a,(0d751h)		;69b3
	ld hl,0d74fh		;69b6   ; apunta a la fila del cursor de las listas
	add a,00fh		;69b9   ; por debajo (16 filas): baja dos
	cp (hl)			;69bb
	jr nc,L_69C3		;69bc
	ld hl,0d751h		;69be
	inc (hl)			;69c1
	inc (hl)			;69c2
L_69C3:
	ld a,(0d74fh)		;69c3   ; ...y el cursor en su sitio (la tabla 0x69ED; 0x30 menos en TEAM EDIT)
	ld hl,0d751h		;69c6
	sub (hl)			;69c9   ; la fila dentro de la ventana...
	ld hl,069edh		;69ca   ; ...su entrada de 2 bytes de 0x69ED
	add a,a			;69cd
	call 04216h		;69ce   ; hl_mas_a: HL = HL + A
	ld e,030h		;69d1   ; en TEAM EDIT (modo 3), 0x30 mas arriba
	ld a,(0e190h)		;69d3   ; lee el modo de juego (0 1PLAYER, 1 2PLAYERS, 2 PENNANT, 3 TEAM EDIT, 4 WATCH, 5 MEDIA SELECT)
	cp 003h		;69d6
	jr z,L_69DC		;69d8
	ld e,000h		;69da
L_69DC:
	ld a,(hl)			;69dc   ; la y...
	sub e			;69dd
	inc hl			;69de
	ld e,(hl)			;69df   ; ...y la x
L_69E0:
	ld hl,0f600h		;69e0
	call 04ae3h		;69e3   ; al atributo del sprite 0
	ld a,e			;69e6
	ld hl,0f601h		;69e7
	jp 04ae3h		;69ea   ; byte_a_vram: escribe A en la VRAM HL

; ----------------------------------------------------------------------
; DATOS pares_69ED: 16 pares de bytes ((A - 0xD751) x 2, p13:69CE) que
;   p13:69DC escribe en la VRAM 0xF600/0xF601; lo leen p13:69CA (32 bytes)
;   0x69ed..0x6a0d  (32 bytes)
DATA_pares_69ED:
	defb 060h,01ch	; 69ed	la y y la x del cursor en cada fila de la ventana (16 entradas)
	defb 060h,084h	; 69ef
	defb 06ch,01ch	; 69f1
	defb 06ch,084h	; 69f3
	defb 078h,01ch	; 69f5
	defb 078h,084h	; 69f7
	defb 084h,01ch	; 69f9
	defb 084h,084h	; 69fb
	defb 090h,01ch	; 69fd
	defb 090h,084h	; 69ff
	defb 09ch,01ch	; 6a01
	defb 09ch,084h	; 6a03
	defb 0a8h,01ch	; 6a05
	defb 0a8h,084h	; 6a07
	defb 0b4h,01ch	; 6a09
	defb 0b4h,084h	; 6a0b

; ======================================================================
; CODIGO 0x6a0d..0x6aab  (158 bytes)
; ======================================================================


lista_de_jugadores:		; la lista de jugadores desde 0xDAAE
	ld bc,0daaeh		;6a0d   ; la lista de jugadores: desde 0xDAAE (los nombres de equipo)...
	push bc			;6a10
	jr L_6A17		;6a11
L_6A13:
	ld bc,0daf0h		;6a13   ; ...o desde 0xDAF0 (los de la partida)
	push bc			;6a16
L_6A17:
	ld a,(0d751h)		;6a17   ; desde la fila de la ventana (0xD751), 11 bytes cada uno...
	ld (0d752h),a		;6a1a   ; 0xD752 = la fila que se pinta
	call por_once		;6a1d   ; el nombre de esa fila: 11 x n + BC
	pop bc			;6a20
	add hl,bc			;6a21
	ld de,02860h		;6a22   ; ...en (0x60, 0x28), o en 0x30 en TEAM EDIT...
	ld a,(0e190h)		;6a25   ; lee el modo de juego (0 1PLAYER, 1 2PLAYERS, 2 PENNANT, 3 TEAM EDIT, 4 WATCH, 5 MEDIA SELECT)
	cp 003h		;6a28
	jr nz,L_6A2E		;6a2a
	ld e,030h		;6a2c   ; en TEAM EDIT, y 0x30
L_6A2E:
	ld b,008h		;6a2e   ; ...8 filas de dos columnas (la segunda 0x68 a la derecha)...
L_6A30:
	push bc			;6a30
	push de			;6a31
	push de			;6a32
	call L_6A5E		;6a33   ; la izquierda
	pop de			;6a36
	ld a,(hl)			;6a37   ; si es el final (0x24), acaba
	cp 024h		;6a38   ; ...0x24 acaba la lista
	jr z,L_6A51		;6a3a
	ld a,d			;6a3c   ; la derecha, 0x68 mas alla
	add a,068h		;6a3d
	ld d,a			;6a3f
	call L_6A5E		;6a40
	pop de			;6a43
	ld a,(hl)			;6a44
	cp 024h		;6a45
	jr z,L_6A5C		;6a47
	ld a,e			;6a49   ; 12 mas abajo
	add a,00ch		;6a4a
	ld e,a			;6a4c
	pop bc			;6a4d
	djnz L_6A30		;6a4e   ; 8 filas
	ret			;6a50
L_6A51:
	ld a,d			;6a51   ; una columna vacia: espacios
	add a,068h		;6a52
	ld d,a			;6a54
	ld hl,06aabh		;6a55   ; el blanco de 0x6AAB
	call L_6A5E		;6a58
	pop de			;6a5b
L_6A5C:
	pop bc			;6a5c
	ret			;6a5d
L_6A5E:
	ld (0e340h),hl		;6a5e   ; un nombre: en el color 4 si esta entre los elegidos de 0xD70A...
	xor a			;6a61   ; 0xE342 = 0: no elegido
	ld (0e342h),a		;6a62
	ld hl,0d70ah		;6a65   ; apunta a los 6 equipos elegidos (0xFF libre)
	ld b,006h		;6a68
	ld a,(0d2b2h)		;6a6a   ; con nombres grabados, se miran 6 - ...
	cp 006h		;6a6d
	jr z,L_6A72		;6a6f
	sub b			;6a71
L_6A72:
	ld a,(0d752h)		;6a72
L_6A75:
	cp (hl)			;6a75   ; si la fila esta entre los elegidos, 0xE342 = 1
	jr nz,L_6A7E		;6a76
	ld hl,0e342h		;6a78
	inc (hl)			;6a7b
	jr L_6A81		;6a7c
L_6A7E:
	inc hl			;6a7e
	djnz L_6A75		;6a7f
L_6A81:
	ld hl,(0e340h)		;6a81   ; lee variable de paso (cada rutina la usa a su manera) y el byte siguiente (16 bits)
	ld b,00ah		;6a84
L_6A86:
	push bc			;6a86   ; ...10 letras (p14:9834)...
	call 09834h		;6a87   ; letra_ascii: una letra ASCII a la fuente
	or a			;6a8a
	jr z,L_6A97		;6a8b   ; 0: espacio, se pinta tal cual
	ld c,a			;6a8d
	ld a,(0e342h)		;6a8e
	or a			;6a91
	ld a,c			;6a92
	jr z,L_6A97		;6a93
	add a,0a0h		;6a95   ; elegido: el color 4
L_6A97:
	call 04f1ch		;6a97   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld a,d			;6a9a   ; la x 8 mas
	add a,008h		;6a9b
	ld d,a			;6a9d
	inc hl			;6a9e
	pop bc			;6a9f
	djnz L_6A86		;6aa0
	inc hl			;6aa2   ; salta la marca del final (11.a)
	ld a,(0d752h)		;6aa3   ; la fila siguiente
	inc a			;6aa6
	ld (0d752h),a		;6aa7
	ret			;6aaa

; ----------------------------------------------------------------------
; DATOS diez_espacios: 10 espacios en ASCII que p15:A651 pinta (B = 10): borra
;   un nombre; lo leen p13:6743 (10 bytes)
;   0x6aab..0x6ab5  (10 bytes)
DATA_diez_espacios:
	defb 020h,020h,020h,020h,020h,020h,020h,020h,020h,020h	; 6aab	10 espacios y la marca

; ======================================================================
; CODIGO 0x6ab5..0x6bd8  (291 bytes)
; ======================================================================


L_6AB5:
	call cuantos_equipos		;6ab5   ; elegir el equipo de la fila: si ya esta elegido nada...
	ld hl,0d70ah		;6ab8   ; apunta a los 6 equipos elegidos (0xFF libre)
	ld a,(0d74fh)		;6abb   ; lee la fila del cursor de las listas
	push bc			;6abe
L_6ABF:
	cp (hl)			;6abf   ; si ya esta elegido, nada
	jr z,L_6AEA		;6ac0
	inc hl			;6ac2
	djnz L_6ABF		;6ac3
	pop bc			;6ac5
	ld c,a			;6ac6   ; ...el primer hueco de 0xD70A...
	ld hl,0d70ah		;6ac7   ; apunta a los 6 equipos elegidos (0xFF libre)
	ld e,000h		;6aca
L_6ACC:
	ld a,(hl)			;6acc   ; el primer hueco libre (0xFF)
	inc a			;6acd
	jr z,L_6AD5		;6ace
	inc e			;6ad0
	inc hl			;6ad1
	djnz L_6ACC		;6ad2
	ret			;6ad4   ; ninguno, nada
L_6AD5:
	ld (hl),c			;6ad5   ; ...lo ocupa, copia el nombre a 0xDA6C + 11 n y uno mas en 0xDA6B
	ld a,e			;6ad6
	call por_once		;6ad7   ; el sitio del nombre: 0xDA6C + 11 x el hueco
	ld bc,0da6ch		;6ada
	add hl,bc			;6add
	ex de,hl			;6ade
	ld a,(0d74fh)		;6adf   ; lee la fila del cursor de las listas
	call L_6AEC		;6ae2   ; el nombre de la fila
	ld hl,0da6bh		;6ae5   ; uno mas elegido (0xDA6B)
	inc (hl)			;6ae8
	ret			;6ae9
L_6AEA:
	pop bc			;6aea
	ret			;6aeb
L_6AEC:
	call por_once		;6aec   ; el nombre de 11 letras de 0xDAAE + 11 x A y el sonido 0x27
	ld bc,0daaeh		;6aef   ; apunta a los nombres de los equipos (11 letras cada uno)
	add hl,bc			;6af2
	ld bc,0000bh		;6af3   ; 11 letras
	ldir		;6af6
	ld a,027h		;6af8   ; el sonido 0x27
	jp 057ffh		;6afa   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
por_once:		; HL = A x 11
	ld l,a			;6afd   ; HL = A x 11
	ld h,000h		;6afe
	ld b,h			;6b00   ; BC = A
	ld c,l			;6b01
	add hl,hl			;6b02   ; x 3...
	add hl,bc			;6b03
	add hl,hl			;6b04   ; ...x 12...
	add hl,hl			;6b05
	and a			;6b06
	sbc hl,bc		;6b07   ; ...- A
	ret			;6b09
L_6B0A:
	ld l,a			;6b0a   ; HL = A x 15
	ld h,000h		;6b0b
	ld b,h			;6b0d   ; BC = A
	ld c,l			;6b0e
	add hl,hl			;6b0f   ; x 16...
	add hl,hl			;6b10
	add hl,hl			;6b11
	add hl,hl			;6b12
	and a			;6b13
	sbc hl,bc		;6b14   ; ...- A
	ret			;6b16
L_6B17:
	ld ix,0d70ah		;6b17   ; los 6 equipos elegidos (o espacios) en columna desde (0x10, 0x58)
	ld hl,0da6ch		;6b1b
	ld de,05810h		;6b1e   ; desde (0x10, 0x58)
	ld b,006h		;6b21
L_6B23:
	push bc			;6b23
	push de			;6b24
	push hl			;6b25
	ld a,(ix+000h)		;6b26   ; el equipo del hueco...
	inc ix		;6b29
	inc a			;6b2b   ; ...0xFF: el blanco de 0x6AAB
	jr nz,L_6B31		;6b2c
	ld hl,06aabh		;6b2e
L_6B31:
	ld b,00ah		;6b31   ; 10 letras
L_6B33:
	push bc			;6b33
	call 09834h		;6b34   ; letra_ascii: una letra ASCII a la fuente
	call 04f1ch		;6b37   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)
	ld a,d			;6b3a   ; la x 8 mas
	add a,008h		;6b3b
	ld d,a			;6b3d
	inc hl			;6b3e
	pop bc			;6b3f
	djnz L_6B33		;6b40
	pop hl			;6b42
	ld de,0000bh		;6b43   ; el nombre siguiente (11 bytes)
	add hl,de			;6b46
	pop de			;6b47
	ld a,e			;6b48   ; 10 mas abajo
	add a,00ah		;6b49
	ld e,a			;6b4b
	pop bc			;6b4c
	djnz L_6B23		;6b4d
	ret			;6b4f
L_6B50:
	ld hl,0d6e1h		;6b50   ; el numero de jugadores (0xD6E1) en (0x98, 0x78)
	ld b,001h		;6b53
	ld de,07898h		;6b55   ; en (0x98, 0x78), una cifra
	jp 05bf1h		;6b58   ; numero: pinta B cifras BCD de HL (sin ceros a la izquierda) desde DE
cuantos_equipos:		; B = cuantos equipos juegan: 0xD6E1, o 6 con uno solo
	ld a,(0d6e1h)		;6b5b   ; B = cuantos equipos juegan: 0xD6E1, o 6 con uno solo
	cp 001h		;6b5e
	jr nz,L_6B64		;6b60
	ld a,006h		;6b62   ; con uno solo, 6
L_6B64:
	ld b,a			;6b64
	ret			;6b65
L_6B66:
	ld hl,0f600h		;6b66   ; el cursor fuera y un recuadro guardando lo de detras...
	ld a,0e0h		;6b69   ; el sprite 0 fuera (y = 0xE0)
	call 04ae3h		;6b6b   ; byte_a_vram: escribe A en la VRAM HL
L_6B6E:
	ld hl,02480h		;6b6e   ; ...(0x30 x 0xB0 en (0x80, 0x24))
	ld de,02480h		;6b71   ; se guarda en la pagina 1 (a 4: la misma posicion en otra pagina)
	ld bc,0b030h		;6b74
	ld a,004h		;6b77
	call 04d66h		;6b79   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
	ld hl,02480h		;6b7c   ; se borra a color 0
	ld bc,0b030h		;6b7f
	xor a			;6b82
	ld d,000h		;6b83
	call 04d2ah		;6b85   ; rellena: orden HMMV (0xC0) del VDP: rellena el rectangulo HL (x, y), BC de tamano, con el color A'
	ld hl,02480h		;6b88   ; y un marco de color 0x0D de 0x2E x 0xAE
	ld c,00dh		;6b8b
	ld de,0ae2eh		;6b8d
	jp 04cfeh		;6b90   ; marco: un marco de lineas: HL la esquina, DE el tamano
quita_recuadro:		; devuelve lo de detras del recuadro
	ld hl,02480h		;6b93   ; devuelve lo de detras del recuadro
	ld de,02480h		;6b96   ; 0x30 x 0xB0 de la pagina 1 a la 0
	ld bc,0b030h		;6b99
	ld a,001h		;6b9c
	jp 04d66h		;6b9e   ; copia_rectangulo: orden HMMM (0xD0) del VDP: copia el rectangulo HL (x, y) a DE, BC de tamano; las paginas en A'
L_6BA1:
	ld bc,00004h		;6ba1   ; una temporada nueva: el marcador de 0x6BD8...
	ld de,0e194h		;6ba4   ; los 4 bytes de 0x6BD8 al marcador (0xE194)
	ld hl,06bd8h		;6ba7
	ldir		;6baa
	ld hl,0d680h		;6bac   ; ...0xD680-0xD6D9 a cero, 0xD6DE = los partidos...
	ld de,0d681h		;6baf   ; 0x5A bytes a cero
	ld (hl),000h		;6bb2
	ld bc,00059h		;6bb4
	ldir		;6bb7
	ld a,(0d753h)		;6bb9   ; lee los partidos de cada pareja en PENNANT (1-26)
	ld (0d6deh),a		;6bbc   ; los partidos de cada pareja a 0xD6DE
	ld de,0d680h		;6bbf   ; ...y la ficha de 15 bytes de cada equipo con su nombre (11 letras)
	ld hl,0da6ch		;6bc2
	call cuantos_equipos		;6bc5   ; cuantos_equipos: B = cuantos equipos juegan: 0xD6E1, o 6 con uno solo
L_6BC8:
	push bc			;6bc8   ; el nombre (11 letras) y 4 bytes mas en cada ficha
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
; DATOS inicio_e194: 4 bytes que p13:6BAA copia a 0xE194; lo leen p13:6BA7 (4
;   bytes)
;   0x6bd8..0x6bdc  (4 bytes)
DATA_inicio_e194:
	defb 000h,001h,000h,002h	; 6bd8	el marcador de una temporada nueva (4 bytes)

; ======================================================================
; CODIGO 0x6bdc..0x6c31  (85 bytes)
; ======================================================================


L_6BDC:
	ld a,(0de06h)		;6bdc   ; elegir la fila (0xD758) con arriba y abajo
	and 010h		;6bdf   ; con el boton 1, nada
	ret nz			;6be1
	call cuantos_equipos		;6be2   ; cuantos_equipos: B = cuantos equipos juegan: 0xD6E1, o 6 con uno solo
	dec b			;6be5
	ld hl,0d758h		;6be6   ; 0xD758: la fila
	ld a,(0de06h)		;6be9   ; lee los botones recien pulsados del mando 1 / cursores
	rra			;6bec   ; arriba: una menos
	jr c,L_6BF7		;6bed
	rra			;6bef   ; abajo: una mas hasta la ultima
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
	call cuantos_equipos		;6bfb   ; con menos de 6 jugadores, borra a los que sobran (p13:6C71) y repinta
	push bc			;6bfe
	ld a,b			;6bff
	cp 006h		;6c00   ; con 6, no hay nada que borrar
	jr z,L_6C15		;6c02
	ld a,006h		;6c04   ; los huecos de B a 5...
	sub b			;6c06
	ld c,b			;6c07
	ld b,a			;6c08
L_6C09:
	push bc			;6c09
	ld a,c			;6c0a
	call L_6C71		;6c0b   ; ...se borran (p13:6C71)
	pop bc			;6c0e
	inc c			;6c0f
	djnz L_6C09		;6c10
	call L_6B17		;6c12   ; y los nombres se pintan otra vez
L_6C15:
	ld hl,06c31h		;6c15   ; el texto de 0x6C31 y los numeros 2, 3... de cada fila
	call 04ea6h		;6c18   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	pop bc			;6c1b
	ld de,04810h		;6c1c   ; desde (0x10, 0x48)
	ld c,002h		;6c1f
L_6C21:
	ld a,c			;6c21
	push bc			;6c22
	push de			;6c23
	call 04f1ch		;6c24   ; el caracter del numero
	pop de			;6c27
	ld a,e			;6c28   ; 10 mas abajo
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
	defb 048h,010h,000h,0feh,048h,01ah,000h,0feh,048h,024h,000h,0feh,048h,02eh,000h,0feh	; 6c31  H...H...H$..H...	el texto de la lista de jugadores
	defb 048h,038h,000h,0feh,048h,042h,000h,0ffh	; 6c41  H8..HB..

; ======================================================================
; CODIGO 0x6c49..0x6c68  (31 bytes)
; ======================================================================


L_6C49:
	ld a,(0d758h)		;6c49   ; la flecha de la fila 0xD758 (x = 0x48, y de 0x6C68)...
	ld hl,06c68h		;6c4c   ; la y de la fila (tabla 0x6C68)
	call 04216h		;6c4f   ; hl_mas_a: HL = HL + A
	ld d,048h		;6c52
	ld e,(hl)			;6c54
	ld a,(0d758h)		;6c55   ; ...parpadea con el bit 2 del reloj
	inc a			;6c58   ; el caracter n + 2 (el numero de la fila)...
	add a,001h		;6c59
	ld c,a			;6c5b
	ld a,(0de03h)		;6c5c   ; ...o 0 (en blanco) cuando el bit 2 del reloj esta a 0
	and 004h		;6c5f
	jr nz,L_6C64		;6c61
	ld c,a			;6c63
L_6C64:
	ld a,c			;6c64
	jp 04f1ch		;6c65   ; caracter: pinta el caracter A de la fuente en la posicion DE (orden HMMM de 8x8)

; ----------------------------------------------------------------------
; DATOS columnas_6C68: 6 bytes, uno por 0xD758 (p13:6C4F): la x de la flecha
;   (con D = 0x48); lo leen p13:6C4C (6 bytes)
;   0x6c68..0x6c6e  (6 bytes)
DATA_columnas_6C68:
	defb 010h,01ah,024h,02eh,038h,042h	; 6c68	la y de las 6 filas

; ======================================================================
; CODIGO 0x6c6e..0x6cb4  (70 bytes)
; ======================================================================


L_6C6E:
	ld a,(0d758h)		;6c6e   ; borra el equipo de la fila 0xD758...
L_6C71:
	ld hl,0d70ah		;6c71   ; ...(0xFF en 0xD70A + n) y uno menos en 0xDA6B
	call 04216h		;6c74   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;6c77   ; si ya estaba libre, nada
	inc a			;6c78
	ret z			;6c79
	ld (hl),0ffh		;6c7a   ; libre (0xFF)...
	ld hl,0da6bh		;6c7c
	dec (hl)			;6c7f   ; ...y uno menos elegido
	ret			;6c80
L_6C81:
	ld e,010h		;6c81   ; con el boton 1, la opcion siguiente...
	jr L_6C87		;6c83
L_6C85:
	ld e,020h		;6c85   ; ...o con el boton 2
L_6C87:
	ld a,(0de06h)		;6c87   ; lee los botones recien pulsados del mando 1 / cursores
	and e			;6c8a
	ret z			;6c8b   ; sin el boton, nada
	ld a,(0d759h)		;6c8c   ; la opcion siguiente (0xD759, de 0 a 4) y el sonido 0x26
	inc a			;6c8f
	cp 005h		;6c90
	jr nz,L_6C95		;6c92   ; despues de la 4, la 0
	xor a			;6c94
L_6C95:
	ld (0d759h),a		;6c95   ; guarda la opcion del menu de PENNANT
	ld a,026h		;6c98   ; el sonido 0x26
	call 057ffh		;6c9a   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_6C9D:
	ld hl,06ce6h		;6c9d   ; el texto de 0x6CE6 y el de la opcion (tabla 0x6CB4)
	call 04ea6h		;6ca0   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld a,(0d759h)		;6ca3   ; lee la opcion del menu de PENNANT
	ld hl,06cb4h		;6ca6   ; la palabra de la opcion en 0x6CB4...
	add a,a			;6ca9
	call 04216h		;6caa   ; hl_mas_a: HL = HL + A
	ld e,(hl)			;6cad
	inc hl			;6cae
	ld d,(hl)			;6caf
	ex de,hl			;6cb0   ; ...es su texto
	jp 04ea6h		;6cb1   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto

; ----------------------------------------------------------------------
; DATOS textos_6CB4: 5 punteros a textos elegidos por 0xD759 (p13:6CB1 salta a
;   p00:4EA6); lo leen p13:6CAA (10 bytes)
;   0x6cb4..0x6cbe  (10 bytes)
DATA_textos_6CB4:
	defw 06cbeh,06cc7h,06cd8h,06ce0h,06cd0h	; 6cb4	los textos de las 5 opciones (punteros y textos)

; ----------------------------------------------------------------------
; DATOS texto_6CBE: texto 0 de la tabla 0x6CB4 ([x y] y caracteres hasta
;   0xFF), que se pinta con p00:4EA6; lo leen p13:6CAA (9 bytes)
;   0x6cbe..0x6cc7  (9 bytes)
DATA_texto_6CBE:
	defb 00ah,0c8h,0beh,0bah,0afh,0c7h,0b3h,0c0h,0ffh	; 6cbe  .........

; ----------------------------------------------------------------------
; DATOS texto_6CC7: texto 1 de la tabla 0x6CB4 ([x y] y caracteres hasta
;   0xFF), que se pinta con p00:4EA6; lo leen p13:6CAA (9 bytes)
;   0x6cc7..0x6cd0  (9 bytes)
DATA_texto_6CC7:
	defb 042h,0c8h,0c1h,0b3h,0bah,0b3h,0b1h,0c2h,0ffh	; 6cc7  B........

; ----------------------------------------------------------------------
; DATOS texto_6CD0: texto 4 de la tabla 0x6CB4 ([x y] y caracteres hasta
;   0xFF), que se pinta con p00:4EA6; lo leen p13:6CAA (8 bytes)
;   0x6cd0..0x6cd8  (8 bytes)
DATA_texto_6CD0:
	defb 0d0h,0c8h,0b1h,0bah,0b3h,0afh,0c0h,0ffh	; 6cd0  ........

; ----------------------------------------------------------------------
; DATOS texto_6CD8: texto 2 de la tabla 0x6CB4 ([x y] y caracteres hasta
;   0xFF), que se pinta con p00:4EA6; lo leen p13:6CAA (8 bytes)
;   0x6cd8..0x6ce0  (8 bytes)
DATA_texto_6CD8:
	defb 07ah,0c8h,0b1h,0bdh,0c3h,0bch,0c2h,0ffh	; 6cd8  z.......

; ----------------------------------------------------------------------
; DATOS texto_6CE0: texto 3 de la tabla 0x6CB4 ([x y] y caracteres hasta
;   0xFF), que se pinta con p00:4EA6; lo leen p13:6CAA (6 bytes)
;   0x6ce0..0x6ce6  (6 bytes)
DATA_texto_6CE0:
	defb 0aeh,0c8h,0b3h,0bch,0b2h,0ffh	; 6ce0

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
	ld a,(0d2b0h)		;6d0e   ; MEDIA SELECT: el paso de 0xD2B0
	call 04220h		;6d11   ; la tabla de pasos (p13:6D14)

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
	ld a,(0dd8eh)		;6d1e   ; paso 0: sin el soporte 3, 0xDD8F = el soporte y a grabar...
	cp 003h		;6d21
	jr z,L_6D31		;6d23   ; los dos: p13:6D31
	ld (0dd8fh),a		;6d25   ; guarda el soporte elegido: 0 la RAM, 1 el disco, 2 el Game Master 2
	xor a			;6d28   ; 0xD2B1 a 0
	ld (0d2b1h),a		;6d29   ; guarda como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	call L_6D61		;6d2c   ; dos pasos mas
	jr L_6D53		;6d2f
L_6D31:
	call 0845bh		;6d31   ; ...con el 3, p14:845B y la pregunta SI / NO (p00:5D7D)
	xor a			;6d34
	ld (0d2b1h),a		;6d35   ; 0xD2B1 a 0
	inc a			;6d38   ; 0xDD0C = 1 y SI / NO
	ld (0dd0ch),a		;6d39
	call 05d7dh		;6d3c   ; si_no_13: con los bancos 1-2-3, cambia SI / NO (p03:BCDE); vuelve a 13-14-15
	jr L_6D61		;6d3f
L_6D41:
	ld a,(0de06h)		;6d41   ; paso 1: el boton 1 elige (0xDD8F = 0xDD0C + 1)
	and 013h		;6d44   ; sin boton, nada
	ret z			;6d46
	bit 4,a		;6d47   ; sin el boton 1: cambia SI / NO
	jp z,05d7dh		;6d49   ; si_no_13: con los bancos 1-2-3, cambia SI / NO (p03:BCDE); vuelve a 13-14-15
	ld a,(0dd0ch)		;6d4c   ; el soporte = la eleccion + 1
	inc a			;6d4f
	ld (0dd8fh),a		;6d50   ; guarda el soporte elegido: 0 la RAM, 1 el disco, 2 el Game Master 2
L_6D53:
	ld a,001h		;6d53   ; calla, p15:BA66 y el texto de p13:7BDD
	call 057ffh		;6d55   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	call 0ba66h		;6d58   ; recuadro_15: el recuadro: borrado y un marco
	ld hl,07bddh		;6d5b
	call 04ea6h		;6d5e   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
L_6D61:
	ld hl,0d2b0h		;6d61   ; al paso siguiente
	inc (hl)			;6d64
	ret			;6d65
L_6D66:
	call 0814bh		;6d66   ; paso 2: p14:814B; si no fue bien, el aviso de p13:7C22 y 128 cuadros
	ld a,(0d2b1h)		;6d69   ; mal: p13:6D88
	cp 002h		;6d6c
	jr z,L_6D88		;6d6e
	call 0ba66h		;6d70   ; bien: el recuadro y el texto de 0x7C22
	ld hl,07c22h		;6d73
	call 04ea6h		;6d76   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld a,080h		;6d79   ; 128 cuadros
	ld (0d2e1h),a		;6d7b   ; guarda la espera de los avisos
	ld a,001h		;6d7e   ; 0xD2B1 = 1
	ld (0d2b1h),a		;6d80   ; guarda como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	call L_6D61		;6d83   ; dos pasos mas
	jr L_6D61		;6d86
L_6D88:
	call L_6D8D		;6d88   ; bien: el texto de exito
	jr L_6D61		;6d8b
L_6D8D:
	call 0ba66h		;6d8d   ; el texto segun el soporte (p13:7BEA o 0x7C06) y SI / NO
	ld a,(0dd8fh)		;6d90   ; lee el soporte elegido: 0 la RAM, 1 el disco, 2 el Game Master 2
	dec a			;6d93   ; el disco: 0x7BEA; el Game Master 2: 0x7C06
	ld hl,07beah		;6d94
	jr z,L_6D9C		;6d97
	ld hl,07c06h		;6d99
L_6D9C:
	call 04ea6h		;6d9c   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	xor a			;6d9f   ; 0xD2B1 a 0
	ld (0d2b1h),a		;6da0   ; guarda como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	inc a			;6da3   ; 0xDD0C = 1 y SI / NO
	ld (0dd0ch),a		;6da4
	jp 05d7dh		;6da7   ; si_no_13: con los bancos 1-2-3, cambia SI / NO (p03:BCDE); vuelve a 13-14-15
L_6DAA:
	ld a,(0de06h)		;6daa   ; paso: con el boton 1, segun la eleccion...
	and 013h		;6dad
	ret z			;6daf   ; sin boton, nada
	bit 4,a		;6db0   ; sin el boton 1, cambia SI / NO
	jp z,05d7dh		;6db2   ; si_no_13: con los bancos 1-2-3, cambia SI / NO (p03:BCDE); vuelve a 13-14-15
	ld a,(0dd8fh)		;6db5   ; lee el soporte elegido: 0 la RAM, 1 el disco, 2 el Game Master 2
	dec a			;6db8   ; con el disco, se quita el recuadro
	call z,quita_recuadro		;6db9   ; quita_recuadro: devuelve lo de detras del recuadro
	ld a,(0dd0ch)		;6dbc
	dec a			;6dbf   ; SI: p13:6DD6 y al paso siguiente
	jr nz,L_6DC7		;6dc0
	call L_6DD6		;6dc2
	jr L_6D61		;6dc5
L_6DC7:
	xor a			;6dc7   ; ...NO: al paso 2 con el texto de 0x7BDD
	ld (0d2b1h),a		;6dc8   ; guarda como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	ld a,002h		;6dcb
	ld (0d2b0h),a		;6dcd   ; guarda el paso de MEDIA SELECT y de la grabacion
	ld hl,07bddh		;6dd0
	jp 04ea6h		;6dd3   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
L_6DD6:
	ld a,(0dd8fh)		;6dd6   ; el texto de p13:7CFA y 64 cuadros
	dec a			;6dd9   ; con el disco, se quita el recuadro
	call z,quita_recuadro		;6dda   ; quita_recuadro: devuelve lo de detras del recuadro
	call 0ba66h		;6ddd   ; recuadro_15: el recuadro: borrado y un marco
	ld hl,07cfah		;6de0
	call 04ea6h		;6de3   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld a,040h		;6de6   ; 64 cuadros
	ld (0d2e1h),a		;6de8   ; guarda la espera de los avisos
	ret			;6deb
L_6DEC:
	ld hl,0d2e1h		;6dec   ; la espera y 0xD2B1 = 1
	dec (hl)			;6def   ; hasta 0, nada
	ret nz			;6df0
	ld a,001h		;6df1
	ld (0d2b1h),a		;6df3   ; guarda como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	ret			;6df6
L_6DF7:
	ld a,(0d2b0h)		;6df7   ; el paso de 0xD2B0
	call 04220h		;6dfa   ; la tabla de pasos (p13:6DFD)

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
	xor a			;6e07   ; paso 0 de la grabacion: si alguno de los dos equipos es uno editado (0x41), calla
	ld (0d2b1h),a		;6e08   ; guarda como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	ld a,(0d68ah)		;6e0b   ; un equipo editado ('A' en la 11.a letra) en el visitante...
	cp 041h		;6e0e
	jr z,L_6E19		;6e10
	ld a,(0d74ah)		;6e12   ; ...o en el local
	cp 041h		;6e15
	jr nz,L_6E1E		;6e17
L_6E19:
	ld a,001h		;6e19   ; calla (el sonido 1)
	call 057ffh		;6e1b   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_6E1E:
	jr L_6E70		;6e1e
L_6E20:
	call 08000h		;6e20   ; paso: graba (p14:8000); si fue bien, el texto y dos pasos
	ld a,(0d2b1h)		;6e23   ; lee como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	cp 002h		;6e26   ; mal: p13:6E6C
	jr nz,L_6E6C		;6e28
	call L_6D8D		;6e2a   ; bien: el texto y dos pasos mas
	call L_6E70		;6e2d
	jr L_6E67		;6e30
L_6E32:
	call 08054h		;6e32   ; paso: lee (p14:8054); si fue mal, 0xD2B1 = 1...
	ld a,(0d2b1h)		;6e35   ; lee como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	cp 002h		;6e38   ; mal: 128 cuadros
	jr z,L_6E67		;6e3a
	ld a,001h		;6e3c   ; bien: 0xD2B1 = 1
	ld (0d2b1h),a		;6e3e   ; guarda como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	ld a,(0de02h)		;6e41   ; ...en PENNANT con el jugador en el local, cambia las dos fichas de equipo
	bit 4,a		;6e44   ; sin PENNANT, nada mas
	ret z			;6e46
	bit 5,a		;6e47
	ret nz			;6e49   ; dos jugadores, nada mas
	ld a,(0d6dch)		;6e4a   ; lee el equipo del jugador en PENNANT (bit 0)
	rra			;6e4d
	ret nc			;6e4e   ; con el jugador de visitante, nada mas
	ld hl,0d380h		;6e4f   ; de local: se cambian las dos fichas
	ld de,0d47fh		;6e52   ; apunta a la ficha del local (255 bytes de p13:731F; en TEAM EDIT, el paso del dialogo de guardar)
	ld bc,000ffh		;6e55
L_6E58:
	push bc			;6e58   ; cambia 255 bytes de 0xD380 con 0xD47F
	ld c,(hl)			;6e59   ; un byte de cada una...
	ld a,(de)			;6e5a
	ld (hl),a			;6e5b   ; ...cambiados
	ld a,c			;6e5c
	ld (de),a			;6e5d
	inc hl			;6e5e
	inc de			;6e5f
	pop bc			;6e60
	dec bc			;6e61   ; los 255
	ld a,b			;6e62
	or c			;6e63
	jr nz,L_6E58		;6e64
	ret			;6e66
L_6E67:
	ld a,080h		;6e67   ; 128 cuadros de espera
	ld (0d2e1h),a		;6e69   ; guarda la espera de los avisos
L_6E6C:
	xor a			;6e6c
	ld (0d2b1h),a		;6e6d   ; guarda como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
L_6E70:
	ld hl,0d2b0h		;6e70   ; al paso siguiente
	inc (hl)			;6e73
	ret			;6e74
L_6E75:
	ld a,(0de06h)		;6e75   ; la pregunta: SI, el texto de p13:7CFA y 64 cuadros; NO, al paso de 0xE340
	and 013h		;6e78
	ret z			;6e7a   ; sin boton, nada
	bit 4,a		;6e7b   ; sin el boton 1, cambia SI / NO
	jp z,05d7dh		;6e7d   ; si_no_13: con los bancos 1-2-3, cambia SI / NO (p03:BCDE); vuelve a 13-14-15
	call quita_recuadro		;6e80   ; quita_recuadro: devuelve lo de detras del recuadro
	ld a,(0dd0ch)		;6e83   ; NO: p13:6E99
	dec a			;6e86
	jr nz,L_6E99		;6e87
	call 0ba66h		;6e89   ; SI: el recuadro y el texto de 0x7CFA
	ld hl,07cfah		;6e8c
	call 04ea6h		;6e8f   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld a,040h		;6e92   ; 64 cuadros
	ld (0d2e1h),a		;6e94   ; guarda la espera de los avisos
	jr L_6E70		;6e97
L_6E99:
	xor a			;6e99
	ld (0d2b1h),a		;6e9a   ; guarda como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	ld a,(0e340h)		;6e9d   ; el paso guardado en 0xE340
	ld (0d2b0h),a		;6ea0   ; guarda el paso de MEDIA SELECT y de la grabacion
	ret			;6ea3
L_6EA4:
	ld hl,0d2e1h		;6ea4   ; la espera y 0xD2B1 = 2
	dec (hl)			;6ea7   ; hasta 0, nada
	ret nz			;6ea8
	ld a,002h		;6ea9
	ld (0d2b1h),a		;6eab   ; guarda como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	ret			;6eae
L_6EAF:
	ld de,0d380h		;6eaf   ; la ficha del visitante (0xD380) por el nombre de 0xD680...
	ld hl,0d680h		;6eb2
	jr L_6EBD		;6eb5
L_6EB7:
	ld de,0d47fh		;6eb7   ; ...o la del local (0xD47F) por el de 0xD740
	ld hl,0d740h		;6eba
L_6EBD:
	ld (0e340h),de		;6ebd   ; busca el nombre entre los 6 de serie (0xDAAE, 11 letras cada uno)...
	ld c,000h		;6ec1   ; C = el numero del equipo de serie
	push hl			;6ec3
	ld de,0daaeh		;6ec4   ; el primero (0xDAAE)
	ld b,00bh		;6ec7
L_6EC9:
	ld a,(de)			;6ec9   ; las 11 letras iguales: es este
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
	ld de,0dab9h		;6ed7   ; el segundo (0xDAB9)
	ld b,00bh		;6eda
L_6EDC:
	ld a,(de)			;6edc
	cp (hl)			;6edd   ; letra a letra
	jr nz,L_6EE7		;6ede   ; distinta: el siguiente
	inc hl			;6ee0
	inc de			;6ee1
	djnz L_6EDC		;6ee2
	pop hl			;6ee4
	jr L_6F31		;6ee5   ; igual: este (C = 1)
L_6EE7:
	pop hl			;6ee7
	push hl			;6ee8
	inc c			;6ee9
	ld de,0dac4h		;6eea   ; el tercero (0xDAC4)
	ld b,00bh		;6eed
L_6EEF:
	ld a,(de)			;6eef
	cp (hl)			;6ef0   ; letra a letra
	jr nz,L_6EFA		;6ef1   ; distinta: el siguiente
	inc hl			;6ef3
	inc de			;6ef4
	djnz L_6EEF		;6ef5
	pop hl			;6ef7
	jr L_6F31		;6ef8   ; igual: C = 2
L_6EFA:
	pop hl			;6efa
	push hl			;6efb
	inc c			;6efc
	ld de,0dacfh		;6efd   ; el cuarto (0xDACF)
	ld b,00bh		;6f00
L_6F02:
	ld a,(de)			;6f02
	cp (hl)			;6f03   ; letra a letra
	jr nz,L_6F0D		;6f04   ; distinta: el siguiente
	inc hl			;6f06
	inc de			;6f07
	djnz L_6F02		;6f08
	pop hl			;6f0a
	jr L_6F31		;6f0b   ; igual: C = 3
L_6F0D:
	pop hl			;6f0d
	push hl			;6f0e
	inc c			;6f0f
	ld de,0dadah		;6f10   ; el quinto (0xDADA)
	ld b,00bh		;6f13
L_6F15:
	ld a,(de)			;6f15
	cp (hl)			;6f16   ; letra a letra
	jr nz,L_6F20		;6f17   ; distinta: el siguiente
	inc hl			;6f19
	inc de			;6f1a
	djnz L_6F15		;6f1b
	pop hl			;6f1d
	jr L_6F31		;6f1e   ; igual: C = 4
L_6F20:
	pop hl			;6f20
	push hl			;6f21
	inc c			;6f22
	ld de,0dae5h		;6f23   ; el sexto (0xDAE5)
	ld b,00bh		;6f26
L_6F28:
	ld a,(de)			;6f28
	cp (hl)			;6f29
	jr nz,L_6F47		;6f2a   ; ninguno: los editados
	inc hl			;6f2c
	inc de			;6f2d
	djnz L_6F28		;6f2e
	pop hl			;6f30
L_6F31:
	ld a,c			;6f31   ; ...y copia su ficha de 255 bytes de la tabla 0x731F
	ld hl,0731fh		;6f32
	add a,a			;6f35   ; la palabra C de la tabla p13:731F: su ficha
	call 04216h		;6f36   ; hl_mas_a: HL = HL + A
	ld e,(hl)			;6f39
	inc hl			;6f3a
	ld d,(hl)			;6f3b
	ex de,hl			;6f3c
	ld de,(0e340h)		;6f3d   ; a la ficha del visitante o del local
	ld bc,000ffh		;6f41   ; 255 bytes
	ldir		;6f44
	ret			;6f46
L_6F47:
	pop hl			;6f47   ; si no, entre los dos editados (0xDAF0, 0xDAFB)...
	push hl			;6f48
	ld de,0daf0h		;6f49
	ld bc,00b00h		;6f4c   ; el primero de los editados (0xDAF0)
L_6F4F:
	ld a,(de)			;6f4f
	cp (hl)			;6f50   ; letra a letra
	jr nz,L_6F5A		;6f51   ; distinta: el segundo
	inc hl			;6f53
	inc de			;6f54
	djnz L_6F4F		;6f55
	pop hl			;6f57
	jr L_6F68		;6f58   ; igual: C = 0
L_6F5A:
	pop hl			;6f5a
	ld de,0dafbh		;6f5b   ; el segundo (0xDAFB)
	inc c			;6f5e
	ld b,00bh		;6f5f
L_6F61:
	ld a,(de)			;6f61
	cp (hl)			;6f62
	ret nz			;6f63   ; ninguno: nada
	inc hl			;6f64
	inc de			;6f65
	djnz L_6F61		;6f66
L_6F68:
	ld hl,0d780h		;6f68   ; ...su ficha de 0xD780 + 256 x n
	ld d,c			;6f6b   ; 0xD780 + 256 x C
	ld e,000h		;6f6c
	add hl,de			;6f6e
	ld de,(0e340h)		;6f6f   ; lee variable de paso (cada rutina la usa a su manera) y el byte siguiente (16 bits)
	ld bc,000ffh		;6f73   ; 255 bytes
	ldir		;6f76
	ret			;6f78
L_6F79:
	ld a,(0d2b0h)		;6f79   ; leer: el paso de 0xD2B0
	call 04220h		;6f7c   ; la tabla de pasos (p13:6F7F)

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
	xor a			;6f89   ; paso 0: 0xD2B1 = 0, calla y al paso siguiente
	ld (0d2b1h),a		;6f8a   ; guarda como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	ld a,001h		;6f8d   ; calla (el sonido 1)
	call 057ffh		;6f8f   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
L_6F92:
	ld hl,0d2b0h		;6f92   ; apunta a el paso de MEDIA SELECT y de la grabacion
	inc (hl)			;6f95
	ret			;6f96
L_6F97:
	call 080f4h		;6f97   ; paso: lee (p14:80F4); bien, el texto; mal, el aviso de p13:7C22 y 160 cuadros
	ld a,(0d2b1h)		;6f9a   ; lee como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	cp 002h		;6f9d   ; mal: p13:6FA6
	jr nz,L_6FA6		;6f9f
	call L_6D8D		;6fa1   ; bien: el texto y al siguiente
	jr L_6F92		;6fa4
L_6FA6:
	xor a			;6fa6
	ld (0d2b1h),a		;6fa7   ; guarda como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	ld a,004h		;6faa   ; el paso 4
	ld (0d2b0h),a		;6fac   ; guarda el paso de MEDIA SELECT y de la grabacion
	call 0ba66h		;6faf   ; el recuadro y el texto de 0x7C22
	ld hl,07c22h		;6fb2
	call 04ea6h		;6fb5   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
	ld a,0a0h		;6fb8   ; 160 cuadros
	ld (0d2e1h),a		;6fba   ; guarda la espera de los avisos
	ret			;6fbd
L_6FBE:
	ld a,(0de06h)		;6fbe   ; la pregunta: SI repite, NO vuelve
	and 013h		;6fc1
	ret z			;6fc3   ; sin boton, nada
	bit 4,a		;6fc4   ; sin el boton 1, cambia SI / NO
	jp z,05d7dh		;6fc6   ; si_no_13: con los bancos 1-2-3, cambia SI / NO (p03:BCDE); vuelve a 13-14-15
	ld a,(0dd0ch)		;6fc9
	dec a			;6fcc
	jr nz,L_6FDC		;6fcd   ; NO: p13:6FDC
	xor a			;6fcf   ; SI: otra vez desde el paso 4
	ld (0d2b1h),a		;6fd0   ; guarda como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	call L_6DD6		;6fd3
	ld a,004h		;6fd6
	ld (0d2b0h),a		;6fd8   ; guarda el paso de MEDIA SELECT y de la grabacion
	ret			;6fdb
L_6FDC:
	ld a,(0dd8fh)		;6fdc   ; lee el soporte elegido: 0 la RAM, 1 el disco, 2 el Game Master 2
	dec a			;6fdf   ; con el disco, se quita el recuadro
	call z,quita_recuadro		;6fe0   ; quita_recuadro: devuelve lo de detras del recuadro
	xor a			;6fe3   ; al paso 0
	ld (0d2b0h),a		;6fe4   ; guarda el paso de MEDIA SELECT y de la grabacion
	ret			;6fe7
L_6FE8:
	ld hl,0d2e1h		;6fe8   ; la espera y 0xD2B1 = 2
	dec (hl)			;6feb
	ret nz			;6fec   ; hasta 0, nada
	ld a,002h		;6fed
	ld (0d2b1h),a		;6fef   ; guarda como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	ret			;6ff2
L_6FF3:
	ld hl,0d2e1h		;6ff3   ; la espera y 0xD2B1 = 1
	dec (hl)			;6ff6
	ret nz			;6ff7   ; hasta 0, nada
	ld a,001h		;6ff8
	ld (0d2b1h),a		;6ffa   ; guarda como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	ret			;6ffd
L_6FFE:
	ld a,(0d2b0h)		;6ffe   ; la lectura en el paso 8: el paso de 0xD2B0
	call 04220h		;7001   ; la tabla de pasos (p13:7004)

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
	xor a			;700e   ; paso 0: calla, el recuadro y el texto de p13:7D41
	ld (0d2b1h),a		;700f   ; guarda como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	ld a,001h		;7012   ; calla (el sonido 1)
	call 057ffh		;7014   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	call 0ba66h		;7017   ; recuadro_15: el recuadro: borrado y un marco
	ld hl,07d41h		;701a   ; el texto de 0x7D41
	call 04ea6h		;701d   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
L_7020:
	ld hl,0d2b0h		;7020   ; apunta a el paso de MEDIA SELECT y de la grabacion
	inc (hl)			;7023
	ret			;7024
L_7025:
	call 080a8h		;7025   ; paso: lee (p14:80A8); bien, el texto; mal, el aviso de p13:7D09 y 128 cuadros
	ld a,(0d2b1h)		;7028   ; lee como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	cp 002h		;702b
	jr nz,L_7034		;702d   ; mal: p13:7034
	call L_6D8D		;702f   ; bien: el texto y al siguiente
	jr L_7020		;7032
L_7034:
	ld a,080h		;7034   ; 128 cuadros
	ld (0d2e1h),a		;7036   ; guarda la espera de los avisos
	xor a			;7039
	ld (0d2b1h),a		;703a   ; guarda como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	ld a,003h		;703d   ; el paso 3
	ld (0d2b0h),a		;703f   ; guarda el paso de MEDIA SELECT y de la grabacion
	call 0ba66h		;7042   ; recuadro_15: el recuadro: borrado y un marco
	ld hl,07d09h		;7045   ; el texto de 0x7D09
	jp 04ea6h		;7048   ; texto: pinta el texto HL ([x y] y caracteres hasta 0xFF) con los bancos 13-14-15 y devuelve el reparto
L_704B:
	ld a,(0de06h)		;704b   ; la pregunta: SI vuelve a intentar, NO vuelve
	and 013h		;704e
	ret z			;7050   ; sin boton, nada
	bit 4,a		;7051   ; sin el boton 1, cambia SI / NO
	jp z,05d7dh		;7053   ; si_no_13: con los bancos 1-2-3, cambia SI / NO (p03:BCDE); vuelve a 13-14-15
	ld a,(0dd0ch)		;7056
	or a			;7059
	jr z,L_7072		;705a   ; NO: p13:7072
	ld a,001h		;705c   ; SI: calla, 128 cuadros y el paso 4
	call 057ffh		;705e   ; sonido: pide el sonido A al motor (p04:6003) con los bancos 4-5-6 y vuelve al reparto de antes
	xor a			;7061
	ld (0d2b1h),a		;7062   ; guarda como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	ld a,080h		;7065
	ld (0d2e1h),a		;7067   ; guarda la espera de los avisos
	ld a,004h		;706a
	ld (0d2b0h),a		;706c   ; guarda el paso de MEDIA SELECT y de la grabacion
	jp L_6DD6		;706f
L_7072:
	ld a,(0dd8fh)		;7072   ; lee el soporte elegido: 0 la RAM, 1 el disco, 2 el Game Master 2
	dec a			;7075   ; con el disco, se quita el recuadro
	call z,quita_recuadro		;7076   ; quita_recuadro: devuelve lo de detras del recuadro
	xor a			;7079   ; al paso 0
	ld (0d2b0h),a		;707a   ; guarda el paso de MEDIA SELECT y de la grabacion
	ret			;707d
L_707E:
	ld hl,0d2e1h		;707e   ; la espera y 0xD2B1 = 1
	dec (hl)			;7081
	ret nz			;7082   ; hasta 0, nada
	ld a,001h		;7083
	ld (0d2b1h),a		;7085   ; guarda como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	ret			;7088
L_7089:
	ld hl,0d2e1h		;7089   ; la espera, los menus a cero y 0xD2B1 = 2
	dec (hl)			;708c
	ret nz			;708d   ; hasta 0, nada
	ld hl,00000h		;708e   ; el despachador y el subpaso a 0
	ld (0d74ch),hl		;7091   ; guarda el despachador de los menus (y 0xD74D) y el byte siguiente (16 bits)
	ld a,002h		;7094
	ld (0d2b1h),a		;7096   ; guarda como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	ret			;7099
L_709A:
	ld bc,00400h		;709a   ; busca el Game Master 2: los 4 slots (y sus subslots si estan expandidos)...
	ld hl,0fcc1h		;709d
L_70A0:
	push bc			;70a0
	push hl			;70a1
	ld a,(hl)			;70a2   ; el slot n (EXPTBL 0xFCC1 + n)
	bit 7,a		;70a3   ; con el bit 7, es expandido: los 4 subslots
	jr nz,L_70AD		;70a5
	ld a,c			;70a7   ; si no, el slot tal cual
	call L_70CD		;70a8
	jr L_70B0		;70ab
L_70AD:
	call L_70BD		;70ad
L_70B0:
	pop hl			;70b0
	pop bc			;70b1
	ret c			;70b2   ; carry: encontrado
	inc hl			;70b3
	inc c			;70b4
	djnz L_70A0		;70b5   ; los 4 slots
	ld a,0ffh		;70b7   ; ...si no esta, 0xDD0E = 0xFF
	ld (0dd0eh),a		;70b9   ; guarda el slot del Game Master 2 (0xFF si no esta)
	ret			;70bc
L_70BD:
	and 080h		;70bd   ; los 4 subslots del slot C
	or c			;70bf   ; el slot con la marca de expandido
	ld b,004h		;70c0
L_70C2:
	push bc			;70c2
	call L_70CD		;70c3   ; cada subslot
	pop bc			;70c6
	ret c			;70c7
	add a,004h		;70c8   ; el subslot siguiente (+4)
	djnz L_70C2		;70ca
	ret			;70cc
L_70CD:
	ld (0dd0eh),a		;70cd   ; carry si el slot A lleva 'YZ' en 0x4010-0x4011 (RDSLT): el Game Master 2
	ld hl,04010h		;70d0   ; 0x4010 del slot
	call 0000ch		;70d3   ; BIOS RDSLT - Reads the value of an address in another slot
	cp 059h		;70d6   ; 'Y'
	jr nz,L_70EC		;70d8
	ld hl,04011h		;70da   ; 0x4011
	ld a,(0dd0eh)		;70dd   ; lee el slot del Game Master 2 (0xFF si no esta)
	call 0000ch		;70e0   ; BIOS RDSLT - Reads the value of an address in another slot
	cp 05ah		;70e3   ; 'Z'
	jr nz,L_70EC		;70e5
	ld a,(0dd0eh)		;70e7   ; lee el slot del Game Master 2 (0xFF si no esta)
	scf			;70ea   ; esta: carry
	ret			;70eb
L_70EC:
	ld a,(0dd0eh)		;70ec   ; lee el slot del Game Master 2 (0xFF si no esta)
	and a			;70ef   ; no esta: sin carry
	ret			;70f0
L_70F1:
	ld a,(0fd9ah)		;70f1   ; grabar el equipo en el Game Master 2: H.KEYI fuera mientras tanto...
	ld (0d2a9h),a		;70f4   ; guarda el primer byte de H.TIMI (o H.KEYI) guardado mientras se usa el disco
	ld a,0c9h		;70f7   ; H.KEYI en ret
	ld (0fd9ah),a		;70f9   ; guarda el gancho H.KEYI de la BIOS
	call L_727A		;70fc   ; ...su directorio (p13:727A); con 0x22 equipos o mas, no cabe...
	ld a,(0d2b2h)		;70ff   ; lee cuantos nombres hay en la lista de equipos (los 6 de serie y los grabados)
	cp 022h		;7102   ; con 0x22 nombres o mas no cabe: mal
	jp nc,L_7274		;7104
	ld bc,07164h		;7107   ; los 4 bytes de 0x7164
	ld hl,0d380h		;710a   ; apunta a la ficha del visitante (255 bytes de p13:731F: nombre de 11 letras y jugadores)
	call L_71D4		;710d   ; la ficha de grabacion (p13:71D4)
	call 0839eh		;7110   ; ...p14:839E y le llama con C = 0x0A (p13:721D)
	call L_721D		;7113   ; graba (C = 0x0A)
	ld a,(0d2a9h)		;7116   ; H.KEYI como estaba
	ld (0fd9ah),a		;7119   ; guarda el gancho H.KEYI de la BIOS
	ret			;711c
L_711D:
	ld a,(0fd9ah)		;711d   ; grabar la partida (PENAN): la ficha de 0xD280 con 'PENAN' y la cola de 0x7219
	ld (0d2a9h),a		;7120   ; guarda el primer byte de H.TIMI (o H.KEYI) guardado mientras se usa el disco
	ld a,0c9h		;7123
	ld (0fd9ah),a		;7125   ; H.KEYI en ret
	ld bc,07219h		;7128
	ld hl,0713eh		;712b   ; el nombre 'PENAN' de 0x713E y los 4 bytes de 0x7219
	ld de,0d280h		;712e   ; apunta a la ficha de 0xD280 (nombre de 5 letras, 8 ceros y 4 bytes; p13:71B8)
	call ficha_d280		;7131   ; ficha_d280: la ficha de 0xD280: 5 letras de HL, 8 ceros, los 4 bytes de BC y el slot
	call L_721D		;7134   ; graba
	ld a,(0d2a9h)		;7137   ; lee el primer byte de H.TIMI (o H.KEYI) guardado mientras se usa el disco
	ld (0fd9ah),a		;713a   ; H.KEYI como estaba
	ret			;713d

; ----------------------------------------------------------------------
; DATOS penan: 'PENAN' en ASCII: p13:71C0 copia 5 bytes a la ficha de 0xD280;
;   lo leen p13:712B (5 bytes)
;   0x713e..0x7143  (5 bytes)
DATA_penan:
	defb 050h,045h,04eh,041h,04eh	; 713e	el nombre de la partida en el Game Master 2 ('PENAN')

; ======================================================================
; CODIGO 0x7143..0x7164  (33 bytes)
; ======================================================================


L_7143:
	ld a,(0fd9ah)		;7143   ; leer el equipo de 0xD680 (C = 0x0B)
	ld (0d2a9h),a		;7146   ; guarda el primer byte de H.TIMI (o H.KEYI) guardado mientras se usa el disco
	ld a,0c9h		;7149
	ld (0fd9ah),a		;714b   ; guarda el gancho H.KEYI de la BIOS
	ld bc,07164h		;714e   ; los 4 bytes de 0x7164 y el nombre de 0xD680
	ld hl,0d680h		;7151
	ld de,0d280h		;7154   ; apunta a la ficha de 0xD280 (nombre de 5 letras, 8 ceros y 4 bytes; p13:71B8)
	call ficha_d280		;7157   ; ficha_d280: la ficha de 0xD280: 5 letras de HL, 8 ceros, los 4 bytes de BC y el slot
	call L_724C		;715a   ; lee (C = 0x0B)
	ld a,(0d2a9h)		;715d   ; lee el primer byte de H.TIMI (o H.KEYI) guardado mientras se usa el disco
	ld (0fd9ah),a		;7160   ; guarda el gancho H.KEYI de la BIOS
	ret			;7163

; ----------------------------------------------------------------------
; DATOS cola_7164: 4 bytes que p13:71CD copia (BC = 4) detras del nombre en la
;   ficha de 0xD280; lo leen p13:7107 (4 bytes)
;   0x7164..0x7168  (4 bytes)
DATA_cola_7164:
	defb 080h,0d3h,0ffh,000h	; 7164	los 4 bytes de la ficha de un equipo

; ======================================================================
; CODIGO 0x7168..0x7189  (33 bytes)
; ======================================================================


L_7168:
	ld a,(0fd9ah)		;7168   ; leer el de 0xD740
	ld (0d2a9h),a		;716b   ; guarda el primer byte de H.TIMI (o H.KEYI) guardado mientras se usa el disco
	ld a,0c9h		;716e
	ld (0fd9ah),a		;7170   ; guarda el gancho H.KEYI de la BIOS
	ld bc,07189h		;7173   ; los 4 bytes de 0x7189 y el nombre de 0xD740
	ld hl,0d740h		;7176
	ld de,0d280h		;7179   ; apunta a la ficha de 0xD280 (nombre de 5 letras, 8 ceros y 4 bytes; p13:71B8)
	call ficha_d280		;717c   ; ficha_d280: la ficha de 0xD280: 5 letras de HL, 8 ceros, los 4 bytes de BC y el slot
	call L_724C		;717f   ; lee
	ld a,(0d2a9h)		;7182   ; lee el primer byte de H.TIMI (o H.KEYI) guardado mientras se usa el disco
	ld (0fd9ah),a		;7185   ; guarda el gancho H.KEYI de la BIOS
	ret			;7188

; ----------------------------------------------------------------------
; DATOS cola_7189: 4 bytes que p13:71CD copia (BC = 4) detras del nombre en la
;   ficha de 0xD280; lo leen p13:7173 (4 bytes)
;   0x7189..0x718d  (4 bytes)
DATA_cola_7189:
	defb 07fh,0d4h,0ffh,000h	; 7189	los 4 bytes de la ficha del otro equipo

; ======================================================================
; CODIGO 0x718d..0x7219  (140 bytes)
; ======================================================================


L_718D:
	ld a,(0fd9ah)		;718d   ; leer la partida PENAN; si no fue mal, 0xD2B1 = 1
	ld (0d2a9h),a		;7190   ; guarda el primer byte de H.TIMI (o H.KEYI) guardado mientras se usa el disco
	ld a,0c9h		;7193
	ld (0fd9ah),a		;7195   ; guarda el gancho H.KEYI de la BIOS
	ld bc,07219h		;7198   ; los 4 bytes de 0x7219 y 'PENAN'
	ld hl,0713eh		;719b
	ld de,0d280h		;719e   ; apunta a la ficha de 0xD280 (nombre de 5 letras, 8 ceros y 4 bytes; p13:71B8)
	call ficha_d280		;71a1   ; ficha_d280: la ficha de 0xD280: 5 letras de HL, 8 ceros, los 4 bytes de BC y el slot
	call L_724C		;71a4   ; lee
	ld hl,0d2b1h		;71a7   ; apunta a como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	ld a,(hl)			;71aa
	cp 002h		;71ab   ; si no fue mal, bien (1)
	jr z,L_71B1		;71ad
	ld (hl),001h		;71af
L_71B1:
	ld a,(0d2a9h)		;71b1   ; H.KEYI como estaba
	ld (0fd9ah),a		;71b4   ; guarda el gancho H.KEYI de la BIOS
	ret			;71b7
ficha_d280:		; la ficha de 0xD280: 5 letras de HL, 8 ceros, los 4 bytes de BC y el slot
	push bc			;71b8   ; la ficha de 0xD280: 5 letras de HL, 8 ceros, los 4 bytes de BC y el slot propio (0xD2AA)
	ld (0d2a5h),de		;71b9   ; guarda el FCB en uso (puntero) y el byte siguiente (16 bits)
	ld bc,00005h		;71bd   ; 5 letras
	ldir		;71c0
	xor a			;71c2
	ld b,008h		;71c3   ; 8 ceros
L_71C5:
	ld (de),a			;71c5
	inc de			;71c6
	djnz L_71C5		;71c7
	pop hl			;71c9
	ld bc,00004h		;71ca   ; los 4 bytes de BC
	ldir		;71cd
	ld a,(0d2aah)		;71cf   ; el slot propio (0xD2AA)
	ld (de),a			;71d2
	ret			;71d3
L_71D4:
	push bc			;71d4   ; la ficha con el nombre del equipo sin los ceros de delante (5 letras)
	ld de,0d280h		;71d5   ; apunta a la ficha de 0xD280 (nombre de 5 letras, 8 ceros y 4 bytes; p13:71B8)
	ld (0d2a5h),de		;71d8   ; guarda el FCB en uso (puntero) y el byte siguiente (16 bits)
	push de			;71dc
	push hl			;71dd   ; 0xD280-0xD285 a 0
	ld h,d			;71de
	ld l,e			;71df
	inc de			;71e0
	ld (hl),000h		;71e1
	ld bc,00005h		;71e3
	ldir		;71e6
	pop hl			;71e8
	pop de			;71e9
	ld bc,00b00h		;71ea   ; cuenta los ceros de delante del nombre (hasta 11)
L_71ED:
	ld a,(hl)			;71ed   ; un cero...
	or a			;71ee
	jr nz,L_71F5		;71ef
	inc hl			;71f1
	inc c			;71f2   ; ...uno mas
	djnz L_71ED		;71f3   ; hasta 11
L_71F5:
	ld a,c			;71f5
	ld c,005h		;71f6   ; se copian 5 letras...
	cp 006h		;71f8   ; ...o las 11 - ceros si son menos
	jr c,L_7200		;71fa
	ld a,00bh		;71fc
	sub c			;71fe
	ld c,a			;71ff
L_7200:
	ld b,000h		;7200
	ldir		;7202
	ld de,0d285h		;7204   ; 8 ceros desde 0xD285
	xor a			;7207
	ld b,008h		;7208
L_720A:
	ld (de),a			;720a
	inc de			;720b
	djnz L_720A		;720c
	pop hl			;720e
	ld bc,00004h		;720f   ; los 4 bytes de BC
	ldir		;7212
	ld a,(0d2aah)		;7214   ; y el slot propio
	ld (de),a			;7217
	ret			;7218

; ----------------------------------------------------------------------
; DATOS cola_7219: 4 bytes que p13:71CD copia (BC = 4) detras del nombre en la
;   ficha de 0xD280; lo leen p13:7128 (4 bytes)
;   0x7219..0x721d  (4 bytes)
DATA_cola_7219:
	defb 080h,0d6h,0cbh,000h	; 7219	los 4 bytes de la ficha de la partida

; ======================================================================
; CODIGO 0x721d..0x731f  (258 bytes)
; ======================================================================


L_721D:
	ld de,(0d2a5h)		;721d   ; graba: el Game Master 2 en la pagina 2 (ENASLT)...
	ld b,001h		;7221   ; B = 1
	ld a,(0dd0eh)		;7223   ; lee el slot del Game Master 2 (0xFF si no esta)
	ld h,080h		;7226   ; en la pagina 2 (0x8000)
	call 00024h		;7228   ; BIOS ENASLT - Switches to specified slot and page definitively | ENASLT: el Game Master 2 en la pagina 2
	ld a,004h		;722b   ; ...su banco 4 en 0x8000...
	ld (08000h),a		;722d   ; su banco 4 en 0x8000
	ld c,00ah		;7230   ; ...y `call 0x8000` con C = 0x0A y DE = la ficha...
	ld de,(0d2a5h)		;7232   ; lee el FCB en uso (puntero) y el byte siguiente (16 bits)
	call 08000h		;7236   ; la rutina del Game Master 2 (en su slot)
	push af			;7239   ; ...el cartucho propio otra vez en la pagina 2...
	ld a,(0d2aah)		;723a   ; el cartucho propio (0xD2AA) otra vez en la pagina 2
	ld h,080h		;723d
	call 00024h		;723f   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;7242
	or a			;7243   ; ...A distinto de 0: mal (0xD2B1 = 2); si no, 0xD2B1 = 1
	jr nz,L_7274		;7244
	ld a,001h		;7246   ; bien: 0xD2B1 = 1
	ld (0d2b1h),a		;7248   ; guarda como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	ret			;724b
L_724C:
	ld de,(0d2a5h)		;724c   ; lee: igual con C = 0x0B
	ld a,(0dd0eh)		;7250   ; el Game Master 2 en la pagina 2
	ld h,080h		;7253
	call 00024h		;7255   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;7258
	ld (08000h),a		;725a   ; su banco 4
	ld c,00bh		;725d   ; C = 0x0B: leer
	ld de,(0d2a5h)		;725f   ; lee el FCB en uso (puntero) y el byte siguiente (16 bits)
	call 08000h		;7263   ; la rutina del Game Master 2
	push af			;7266
	ld a,(0d2aah)		;7267
	ld h,080h		;726a   ; el cartucho propio otra vez
	call 00024h		;726c   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;726f
	and a			;7270
	jr nz,L_7274		;7271   ; A distinto de 0: mal
	ret			;7273
L_7274:
	ld a,002h		;7274   ; mal: 0xD2B1 = 2
	ld (0d2b1h),a		;7276   ; guarda como acabo el paso: 1 bien, 2 mal (o vuelta al menu)
	ret			;7279
L_727A:
	di			;727a   ; el directorio del Game Master 2: H.TIMI fuera, p14:843F...
	ld a,(0fd9fh)		;727b   ; lee el gancho H.TIMI de la BIOS (0xC3 = jp a la interrupcion del juego, 0xC9 = ret)
	ld (0d2a9h),a		;727e   ; guarda el primer byte de H.TIMI (o H.KEYI) guardado mientras se usa el disco
	ld a,0c9h		;7281
	ld (0fd9fh),a		;7283   ; guarda el gancho H.TIMI de la BIOS (0xC3 = jp a la interrupcion del juego, 0xC9 = ret)
	call 0843fh		;7286   ; el FCB de busqueda (p14:843F)
	ld de,0d2b4h		;7289   ; ...0xD2B3-0xD37E a cero y la lista en 0xD2B3...
	ld hl,0d2b3h		;728c
	ld bc,000cch		;728f   ; 0xCD bytes a 0
	ld (hl),000h		;7292
	ldir		;7294
	ld hl,0d28dh		;7296   ; el DMA en 0xD2B3 (+0x0D del FCB)
	ld bc,0d2b3h		;7299
	ld (hl),c			;729c
	inc hl			;729d
	ld (hl),b			;729e
	ld de,0d280h		;729f   ; apunta a la ficha de 0xD280 (nombre de 5 letras, 8 ceros y 4 bytes; p13:71B8)
	ld (0d2a5h),de		;72a2   ; guarda el FCB en uso (puntero) y el byte siguiente (16 bits)
	ld a,(0dd0eh)		;72a6   ; ...le llama con C = 5...
	ld h,080h		;72a9   ; el Game Master 2 en la pagina 2
	call 00024h		;72ab   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;72ae   ; su banco 4
	ld (08000h),a		;72b0
	ld c,005h		;72b3   ; C = 5: el directorio
	ld de,(0d2a5h)		;72b5   ; lee el FCB en uso (puntero) y el byte siguiente (16 bits)
	call 08000h		;72b9   ; la rutina del Game Master 2
	push af			;72bc
	ld a,(0d2aah)		;72bd
	ld h,080h		;72c0   ; el cartucho propio otra vez
	call 00024h		;72c2   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;72c5
	ld a,(0d2a9h)		;72c6   ; lee el primer byte de H.TIMI (o H.KEYI) guardado mientras se usa el disco
	ld (0fd9fh),a		;72c9   ; H.TIMI como estaba
	ei			;72cc
	ld a,006h		;72cd   ; ...y cuenta los equipos de la lista (de 8 en 8 bytes)
	ld (0d2b2h),a		;72cf   ; guarda cuantos nombres hay en la lista de equipos (los 6 de serie y los grabados)
	ld de,0d2b3h		;72d2
L_72D5:
	ld a,(de)			;72d5   ; cada entrada de 8 bytes: 0 acaba
	or a			;72d6
	jr z,L_7316		;72d7
	push hl			;72d9
	push de			;72da
	ld hl,00006h		;72db   ; +6 y +7 de la entrada...
	add hl,de			;72de
	ld a,(hl)			;72df
	inc a			;72e0
	inc hl			;72e1
	ld a,(hl)			;72e2
	pop de			;72e3
	pop hl			;72e4
	jr nz,L_72EA		;72e5   ; ...los de un equipo (0xFF y 0)
	or a			;72e7
	jr z,L_72F1		;72e8
L_72EA:
	ld a,008h		;72ea   ; si no, la entrada siguiente
	call 0421bh		;72ec   ; de_mas_a: DE = DE + A
	jr L_72D5		;72ef
L_72F1:
	ld hl,0d2b2h		;72f1   ; uno mas: su nombre (5 letras, p14:8423) en la lista...
	inc (hl)			;72f4
	ld a,(hl)			;72f5
	dec a			;72f6
	call 08423h		;72f7   ; su sitio en la lista
	ex de,hl			;72fa
	ld bc,00005h		;72fb   ; 5 letras
	ldir		;72fe
	ex de,hl			;7300
	ld b,005h		;7301
L_7303:
	ld (hl),020h		;7303   ; el resto con espacios
	inc hl			;7305
	djnz L_7303		;7306
	ld (hl),041h		;7308   ; y la marca 'A' de editado
	ld a,(0d2b2h)		;730a   ; ...hasta 0x22 equipos
	cp 022h		;730d
	jr nc,L_7316		;730f   ; 0x22 o mas: se acaba
	inc de			;7311   ; la entrada siguiente (5 + 3)
	inc de			;7312
	inc de			;7313
	jr L_72D5		;7314
L_7316:
	ld a,(0d2b2h)		;7316   ; 0x24 acaba la lista
	call 08423h		;7319   ; el sitio de despues del ultimo
	ld (hl),024h		;731c
	ret			;731e

; ----------------------------------------------------------------------
; DATOS fichas_de_equipo: 6 punteros (uno por equipo, p13:6F35) a su ficha de
;   255 bytes; lo leen p13:6F32 (12 bytes)
;   0x731f..0x732b  (12 bytes)
DATA_fichas_de_equipo:
	defw 07727h,0732bh,0742ah,07628h,07529h,07826h	; 731f	las 6 fichas de equipo de serie: 6 punteros a 255 bytes

; ----------------------------------------------------------------------
; DATOS equipo_1: ficha del equipo 1: 255 bytes que p13:6F44 copia con ldir
;   (BC = 0xFF) a donde apunta 0xE340: la cabecera y los jugadores, cada uno
;   con su nombre en la fuente; lo leen p13:6F44 (255 bytes)
;   0x732b..0x742a  (255 bytes)
DATA_equipo_1:
	defb 020h,017h,012h,013h,020h,021h,000h,000h,000h,000h,000h,042h,050h,031h,00eh,056h	; 732b   ... !.....BP1.V
	defb 000h,020h,003h,009h,008h,000h,006h,00ah,007h,02eh,038h,03dh,000h,000h,000h,01ah	; 733b  . ........8=....
	defb 004h,002h,001h,002h,002h,00ah,002h,034h,05ch,03ch,00ch,02bh,000h,020h,004h,003h	; 734b  .......4\<.+. ..
	defb 007h,004h,009h,008h,009h,042h,029h,052h,02ah,000h,000h,01ah,004h,004h,004h,005h	; 735b  .....B)R*.......
	defb 006h,009h,003h,03ch,04fh,02ah,000h,000h,000h,020h,004h,003h,005h,004h,003h,004h	; 736b  ...<O*... ......
	defb 007h,034h,00ch,02ah,038h,000h,000h,01ah,003h,00ah,001h,003h,001h,007h,006h,03eh	; 737b  .4.*8..........>
	defb 056h,034h,00ch,05ch,000h,020h,004h,005h,009h,002h,005h,008h,003h,042h,00ch,000h	; 738b  V4.\. .......B..
	defb 042h,000h,000h,01ah,003h,006h,005h,000h,00ah,009h,005h,02ch,050h,048h,040h,00eh	; 739b  B..........,PH@.
	defb 038h,020h,003h,006h,008h,002h,003h,006h,006h,02ah,056h,03ch,051h,00eh,038h,01ah	; 73ab  8 .......*V<Q.8.
	defb 003h,008h,001h,000h,007h,005h,003h,044h,057h,04fh,02dh,000h,000h,020h,003h,005h	; 73bb  .......DWO-.. ..
	defb 007h,002h,001h,005h,007h,050h,030h,02dh,02bh,000h,000h,01ah,004h,001h,002h,002h	; 73cb  .....P0-+.......
	defb 009h,007h,003h,044h,05ah,02ah,033h,00ch,00eh,020h,023h,002h,007h,002h,002h,005h	; 73db  ...DZ*3.. #.....
	defb 006h,006h,006h,009h,009h,009h,042h,00dh,050h,038h,00ch,02eh,01ah,012h,002h,004h	; 73eb  ......B.P8......
	defb 001h,003h,001h,00ah,009h,003h,003h,00ah,001h,046h,02bh,030h,000h,000h,000h,020h	; 73fb  .........F+0...
	defb 023h,002h,005h,001h,003h,003h,006h,005h,002h,006h,006h,006h,044h,00ch,053h,035h	; 740b  #...........D.S5
	defb 000h,000h,01ah,023h,002h,005h,006h,004h,007h,001h,004h,005h,003h,00ah,001h	; 741b  ...#...........

; ----------------------------------------------------------------------
; DATOS equipo_2: ficha del equipo 2: 255 bytes que p13:6F44 copia con ldir
;   (BC = 0xFF) a donde apunta 0xE340: la cabecera y los jugadores, cada uno
;   con su nombre en la fuente; lo leen p13:6F44 (255 bytes)
;   0x742a..0x7529  (255 bytes)
DATA_equipo_2:
	defb 019h,01dh,010h,013h,000h,01ah,017h,01ch,013h,021h,000h,053h,05fh,032h,02bh,000h	; 742a  .........!.S_2+.
	defb 000h,01ah,003h,004h,001h,000h,006h,006h,004h,048h,02eh,031h,00ch,000h,000h,020h	; 743a  .........H.1...
	defb 003h,005h,004h,000h,007h,006h,001h,029h,034h,04ch,000h,000h,000h,020h,003h,009h	; 744a  .......)4L... ..
	defb 001h,000h,00ah,004h,002h,02dh,02eh,04bh,03ch,000h,000h,01ah,003h,00ah,009h,002h	; 745a  .....-.K<.......
	defb 003h,003h,004h,038h,02eh,03ch,050h,000h,000h,01ah,003h,001h,004h,000h,009h,004h	; 746a  ...8.<P.........
	defb 007h,03eh,034h,041h,048h,04ch,000h,020h,003h,003h,002h,000h,009h,005h,001h,046h	; 747a  .>4AHL. .......F
	defb 00dh,00eh,029h,02ah,000h,020h,002h,006h,00ah,000h,006h,005h,003h,02ah,038h,04ch	; 748a  ..)*. .......*8L
	defb 03ch,00ch,000h,01ah,002h,009h,009h,000h,008h,002h,001h,042h,03dh,030h,047h,000h	; 749a  <..........B=0G.
	defb 000h,01ah,002h,00ah,00ah,000h,008h,000h,005h,038h,051h,048h,000h,000h,000h,020h	; 74aa  .........8QH...
	defb 003h,001h,006h,000h,004h,002h,009h,02dh,02bh,034h,00ch,000h,000h,020h,002h,008h	; 74ba  .......-+4... ..
	defb 007h,000h,005h,003h,006h,044h,02eh,02ch,000h,000h,000h,01ah,003h,005h,004h,000h	; 74ca  .....D.,........
	defb 002h,003h,002h,033h,056h,041h,048h,04ch,000h,020h,012h,002h,004h,001h,003h,001h	; 74da  ...3VAHL. ......
	defb 005h,00ah,002h,00ah,00ah,001h,03dh,000h,038h,00ch,000h,000h,020h,023h,002h,006h	; 74ea  ......=.8... #..
	defb 006h,003h,009h,003h,004h,005h,006h,004h,002h,04bh,03ch,047h,039h,000h,000h,020h	; 74fa  .........K<G9..
	defb 023h,002h,005h,001h,002h,006h,004h,006h,001h,006h,003h,001h,035h,000h,047h,000h	; 750a  #...........5.G.
	defb 000h,000h,01ah,023h,002h,006h,001h,003h,003h,007h,002h,009h,004h,00ah,00ah	; 751a  ...#...........

; ----------------------------------------------------------------------
; DATOS equipo_4: ficha del equipo 4: 255 bytes que p13:6F44 copia con ldir
;   (BC = 0xFF) a donde apunta 0xE340: la cabecera y los jugadores, cada uno
;   con su nombre en la fuente; lo leen p13:6F44 (255 bytes)
;   0x7529..0x7628  (255 bytes)
DATA_equipo_4:
	defb 01eh,020h,01dh,015h,020h,00fh,01bh,021h,000h,000h,000h,03eh,00eh,04bh,03eh,05fh	; 7529  . .. ..!...>.K>_
	defb 030h,01ah,003h,006h,006h,003h,002h,006h,006h,052h,034h,00ch,035h,038h,000h,020h	; 7539  0........R4.58.
	defb 004h,001h,003h,002h,004h,00ah,001h,033h,044h,00ch,051h,039h,056h,020h,003h,00ah	; 7549  .......3D.Q9V ..
	defb 00ah,003h,001h,005h,002h,02dh,02bh,02ch,035h,000h,000h,01ah,003h,007h,001h,004h	; 7559  .....-+,5.......
	defb 005h,003h,004h,050h,038h,00eh,056h,000h,000h,020h,003h,005h,007h,004h,001h,004h	; 7569  ...P8.V.. ......
	defb 007h,029h,036h,056h,044h,00ch,051h,01ah,003h,005h,001h,002h,008h,007h,006h,050h	; 7579  .)6VD.Q........P
	defb 056h,030h,000h,000h,000h,01ah,003h,008h,007h,002h,008h,002h,004h,034h,044h,03ch	; 7589  V0...........4D<
	defb 000h,000h,000h,020h,003h,005h,008h,000h,007h,003h,006h,053h,02bh,03ch,00ch,000h	; 7599  ... .......S+<..
	defb 000h,020h,003h,007h,008h,002h,006h,006h,003h,02ah,056h,030h,000h,000h,000h,020h	; 75a9  . .......*V0...
	defb 003h,004h,009h,000h,00ah,008h,009h,029h,056h,03ch,00ch,02dh,029h,01ah,003h,008h	; 75b9  .......)V<.-)...
	defb 003h,002h,002h,007h,004h,032h,00eh,051h,000h,000h,000h,020h,003h,006h,001h,000h	; 75c9  .....2.Q... ....
	defb 005h,003h,00ah,034h,00ch,05ch,056h,044h,00dh,020h,023h,002h,007h,001h,002h,007h	; 75d9  ...4.\VD. #.....
	defb 007h,007h,007h,008h,002h,002h,050h,035h,03ch,029h,000h,000h,01ah,012h,002h,004h	; 75e9  ......P5<)......
	defb 006h,002h,004h,008h,00ah,001h,002h,007h,006h,045h,05fh,030h,035h,000h,000h,01ah	; 75f9  .........E_05...
	defb 023h,002h,004h,006h,003h,004h,009h,003h,00ah,003h,006h,008h,032h,056h,045h,00dh	; 7609  #...........2VE.
	defb 029h,000h,020h,023h,002h,005h,001h,004h,002h,006h,005h,003h,006h,001h,001h	; 7619  ). #...........

; ----------------------------------------------------------------------
; DATOS equipo_3: ficha del equipo 3: 255 bytes que p13:6F44 copia con ldir
;   (BC = 0xFF) a donde apunta 0xE340: la cabecera y los jugadores, cada uno
;   con su nombre en la fuente; lo leen p13:6F44 (255 bytes)
;   0x7628..0x7727  (255 bytes)
DATA_equipo_3:
	defb 010h,020h,013h,01ch,012h,021h,000h,000h,000h,000h,000h,029h,04ah,050h,02eh,056h	; 7628  . ...!.....)JP.V
	defb 000h,020h,003h,001h,009h,002h,006h,005h,002h,04bh,000h,02eh,000h,000h,000h,01ah	; 7638  . .......K......
	defb 003h,006h,005h,003h,008h,004h,003h,02fh,050h,047h,056h,000h,000h,01ah,004h,003h	; 7648  ......./PGV.....
	defb 001h,004h,002h,002h,006h,044h,00ch,051h,047h,056h,000h,020h,004h,001h,004h,004h	; 7658  .....D.QGV. ....
	defb 00ah,000h,009h,02ch,035h,044h,00dh,052h,037h,020h,003h,00ah,009h,003h,006h,005h	; 7668  ...,5D.R7 ......
	defb 005h,044h,00ch,04fh,034h,00ch,051h,020h,003h,007h,008h,002h,009h,008h,003h,02fh	; 7678  .D.O4.Q ......./
	defb 00ch,05eh,030h,053h,000h,01ah,003h,005h,005h,002h,002h,004h,004h,045h,00dh,032h	; 7688  .^0S.........E.2
	defb 000h,000h,000h,01ah,003h,004h,006h,000h,007h,009h,003h,03bh,05fh,02eh,056h,041h	; 7698  ............_.VA
	defb 056h,020h,003h,003h,003h,002h,003h,003h,002h,038h,00ch,034h,00ch,050h,056h,01ah	; 76a8  V .......8.4.PV.
	defb 003h,002h,002h,002h,006h,004h,007h,029h,051h,030h,00ch,052h,02ah,020h,002h,00ah	; 76b8  .......)Q0.R* ..
	defb 009h,002h,001h,005h,003h,02bh,00eh,053h,056h,000h,000h,01ah,003h,004h,003h,000h	; 76c8  .....+.SV.......
	defb 008h,008h,00ah,044h,00dh,00eh,029h,051h,000h,020h,023h,002h,006h,001h,003h,002h	; 76d8  ...D..)Q. #.....
	defb 005h,00ah,003h,00ah,004h,009h,033h,056h,03ch,035h,000h,000h,01ah,023h,002h,007h	; 76e8  ......3V<5...#..
	defb 001h,002h,002h,008h,008h,002h,004h,00ah,005h,031h,00ch,056h,047h,02ah,000h,020h	; 76f8  .........1.VG*.
	defb 023h,002h,005h,006h,003h,001h,003h,005h,004h,008h,008h,008h,04ch,049h,039h,05ch	; 7708  #...........LI9\
	defb 000h,000h,020h,012h,002h,005h,001h,003h,008h,002h,006h,007h,00ah,006h,001h	; 7718  .. ............

; ----------------------------------------------------------------------
; DATOS equipo_0: ficha del equipo 0: 255 bytes que p13:6F44 copia con ldir
;   (BC = 0xFF) a donde apunta 0xE340: la cabecera y los jugadores, cada uno
;   con su nombre en la fuente; lo leen p13:6F44 (255 bytes)
;   0x7727..0x7826  (255 bytes)
DATA_equipo_0:
	defb 014h,01ah,027h,013h,020h,021h,000h,000h,000h,000h,000h,044h,057h,056h,03ch,049h	; 7727  ..'. !.....DWV<I
	defb 000h,020h,003h,009h,008h,003h,005h,00ah,00ah,043h,02ch,056h,000h,000h,000h,020h	; 7737  . .......C,V...
	defb 003h,00ah,001h,004h,003h,009h,003h,03ch,049h,02fh,05ch,05fh,03ch,01ah,004h,005h	; 7747  .......<I/\_<...
	defb 003h,004h,008h,008h,006h,036h,00ch,053h,000h,000h,000h,020h,004h,004h,008h,006h	; 7757  .....6.S... ....
	defb 001h,006h,001h,02ah,00eh,030h,00ch,051h,000h,01ah,004h,001h,008h,005h,005h,007h	; 7767  ...*.0.Q........
	defb 003h,042h,050h,029h,00eh,000h,000h,020h,004h,002h,001h,004h,001h,005h,005h,038h	; 7777  .BP)... .......8
	defb 02ah,02eh,00ch,00eh,000h,020h,003h,009h,004h,003h,00ah,008h,003h,035h,02eh,02ah	; 7787  *.... .......5.*
	defb 046h,00eh,030h,01ah,003h,007h,002h,004h,004h,007h,006h,04bh,035h,02fh,00eh,03ch	; 7797  F.0........K5/.<
	defb 000h,01ah,003h,009h,005h,006h,002h,009h,002h,04fh,02ah,03bh,00ch,056h,000h,020h	; 77a7  .........O*..V.
	defb 003h,008h,006h,003h,007h,00ah,004h,029h,051h,042h,03ch,053h,035h,020h,003h,008h	; 77b7  .......)QB<S5 ..
	defb 005h,004h,004h,009h,007h,044h,02dh,031h,02bh,051h,044h,01ah,003h,005h,009h,004h	; 77c7  .....D-1+QD.....
	defb 006h,008h,001h,034h,03bh,00ch,056h,02eh,02ah,020h,023h,002h,007h,001h,002h,004h	; 77d7  ...4..V.* #.....
	defb 003h,005h,004h,00ah,00ah,00ah,048h,04fh,00eh,034h,00ch,05dh,01ah,023h,002h,006h	; 77e7  ......HO.4.].#..
	defb 001h,003h,008h,00ah,008h,006h,004h,009h,002h,044h,05bh,05fh,02eh,00eh,000h,01ah	; 77f7  .........D[_....
	defb 012h,002h,005h,001h,003h,007h,002h,005h,001h,00ah,00ah,002h,034h,05dh,048h,05fh	; 7807  ............4]H_
	defb 03ch,000h,020h,023h,002h,005h,001h,003h,007h,001h,002h,00ah,00ah,001h,00ah	; 7817  <. #...........

; ----------------------------------------------------------------------
; DATOS equipo_5: ficha del equipo 5: 255 bytes que p13:6F44 copia con ldir
;   (BC = 0xFF) a donde apunta 0xE340: la cabecera y los jugadores, cada uno
;   con su nombre en la fuente; lo leen p13:6F44 (255 bytes)
;   0x7826..0x7925  (255 bytes)
DATA_equipo_5:
	defb 012h,00fh,020h,019h,021h,000h,000h,000h,000h,000h,000h,02ah,054h,033h,02fh,000h	; 7826  .. .!......*T3/.
	defb 000h,020h,004h,001h,001h,002h,002h,009h,001h,047h,03ah,02ah,000h,000h,000h,020h	; 7836  . .......G:*...
	defb 003h,003h,001h,000h,009h,004h,009h,034h,05eh,02bh,02eh,00ch,02fh,020h,003h,001h	; 7846  .......4^+../ ..
	defb 002h,004h,003h,002h,003h,04bh,029h,02ah,000h,000h,000h,01ah,004h,006h,005h,006h	; 7856  .....K)*........
	defb 001h,000h,003h,03dh,02eh,00ch,02ch,000h,000h,020h,003h,008h,001h,003h,002h,003h	; 7866  ...=..,.. ......
	defb 002h,039h,029h,02fh,000h,000h,000h,01ah,003h,003h,005h,000h,006h,007h,006h,044h	; 7876  .9)/...........D
	defb 030h,02ah,000h,000h,000h,020h,002h,00ah,00ah,000h,009h,003h,005h,048h,04eh,034h	; 7886  0*... .......HN4
	defb 000h,000h,000h,01ah,003h,002h,001h,002h,001h,000h,00ah,03dh,02eh,00ch,038h,000h	; 7896  ...........=..8.
	defb 000h,020h,003h,001h,001h,002h,003h,004h,003h,02eh,048h,02dh,000h,000h,000h,01ah	; 78a6  . ........H-....
	defb 002h,008h,006h,000h,008h,008h,002h,042h,000h,051h,000h,000h,000h,020h,003h,001h	; 78b6  .......B.Q... ..
	defb 006h,000h,00ah,003h,006h,02dh,00eh,038h,000h,000h,000h,020h,003h,002h,002h,000h	; 78c6  .....-.8... ....
	defb 005h,004h,005h,02dh,00eh,03ah,02eh,000h,000h,020h,023h,002h,005h,001h,003h,005h	; 78d6  ...-.:... #.....
	defb 006h,008h,004h,00ah,002h,002h,02bh,02ch,042h,04fh,000h,000h,01ah,023h,002h,004h	; 78e6  ......+,BO...#..
	defb 001h,003h,002h,00ah,004h,007h,008h,008h,003h,029h,02eh,038h,00ch,000h,000h,020h	; 78f6  .........).8...
	defb 012h,002h,004h,001h,003h,008h,002h,002h,003h,005h,007h,004h,033h,02fh,00ch,033h	; 7906  ............3/.3
	defb 02eh,000h,020h,023h,002h,007h,001h,003h,001h,008h,00ah,00ah,004h,001h,001h	; 7916  .. #...........

; ----------------------------------------------------------------------
; DATOS lista_7925: 3 fichas de dibujo de 6 bytes [paleta-tipo][VRAM lo
;   hi][caracteres][puntero] detras del numero (p00:4FA3, paletas en 0x51B2);
;   lo leen p00:5174 (19 bytes)
;   0x7925..0x7938  (19 bytes)
DATA_lista_7925:
	defb 003h,002h,02ah,03eh,00bh,038h	; 7925
	defb 079h,002h,02ah,042h,00bh,0e8h	; 792b
	defb 079h,002h,02ah,046h,00bh,098h	; 7931
	defb 07ah	; 7937

; ----------------------------------------------------------------------
; DATOS dibujo_7938: 11 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 0 de la lista 0x7925 (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:5174 (176 bytes)
;   0x7938..0x79e8  (176 bytes)
DATA_dibujo_7938:
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0fch,003h,0f0h,00fh,0f0h,00fh,0e0h,01fh,0e0h,01fh	; 7938  ................
	defb 0ffh,000h,0ffh,000h,080h,07fh,000h,0ffh,07eh,0ffh,033h,0ffh,033h,0ffh,033h,0ffh	; 7948  ........~.3.3.3.
	defb 0ffh,000h,0ffh,000h,000h,0ffh,000h,0ffh,078h,0ffh,030h,0ffh,030h,0ffh,030h,0ffh	; 7958  ........x.0.0.0.
	defb 0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,01ch,0ffh,026h,0ffh,026h,0ffh,026h,0ffh	; 7968  ..........&.&.&.
	defb 0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,0e7h,0ffh,042h,0ffh,066h,0ffh,024h,0ffh	; 7978  ..........B.f.$.
	defb 0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,007h,0ffh,003h,0ffh,003h,0ffh,003h,0ffh	; 7988  ................
	defb 0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,0e1h,0ffh,032h,0ffh,032h,0ffh,032h,0ffh	; 7998  ..........2.2.2.
	defb 0ffh,000h,000h,0ffh,000h,0ffh,000h,0ffh,0c7h,0ffh,063h,0ffh,063h,0ffh,063h,0ffh	; 79a8  ..........c.c.c.
	defb 0ffh,000h,0ffh,000h,000h,0ffh,000h,0ffh,08fh,0ffh,006h,0ffh,006h,0ffh,006h,0ffh	; 79b8  ................
	defb 0ffh,000h,0ffh,000h,001h,0feh,000h,0ffh,00fh,0ffh,00fh,0ffh,00fh,0ffh,00eh,0ffh	; 79c8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,03fh,0c0h,00fh,0f0h,00fh,0f0h,007h,0f8h,007h,0f8h	; 79d8  ......?.........

; ----------------------------------------------------------------------
; DATOS dibujo_79E8: 11 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 1 de la lista 0x7925 (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:5174 (176 bytes)
;   0x79e8..0x7a98  (176 bytes)
DATA_dibujo_79E8:
	defb 0e0h,01fh,0e0h,01fh,0e0h,01fh,0f0h,00fh,0f0h,00fh,0fch,003h,0ffh,000h,0ffh,000h	; 79e8  ................
	defb 03eh,0ffh,030h,0ffh,030h,0ffh,030h,0ffh,078h,0ffh,000h,0ffh,080h,07fh,0ffh,000h	; 79f8  >.0.0.0.x.......
	defb 030h,0ffh,030h,0ffh,032h,0ffh,032h,0ffh,07eh,0ffh,000h,0ffh,000h,0ffh,0ffh,000h	; 7a08  0.0.2.2.~.......
	defb 026h,0ffh,03eh,0ffh,026h,0ffh,026h,0ffh,067h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 7a18  &.>.&.&.g.......
	defb 03ch,0ffh,018h,0ffh,018h,0ffh,018h,0ffh,03ch,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 7a28  <.......<.......
	defb 003h,0ffh,003h,0ffh,003h,0ffh,003h,0ffh,007h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 7a38  ................
	defb 0e2h,0ffh,033h,0ffh,032h,0ffh,032h,0ffh,0e6h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 7a48  ..3.2.2.........
	defb 063h,0ffh,0e3h,0ffh,063h,0ffh,063h,0ffh,077h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 7a58  c...c.c.w.......
	defb 006h,0ffh,006h,0ffh,026h,0ffh,026h,0ffh,0efh,0ffh,000h,0ffh,000h,0ffh,0ffh,000h	; 7a68  ....&.&.........
	defb 00eh,0ffh,00ch,0ffh,040h,0ffh,05ch,0ffh,0dch,0ffh,000h,0ffh,001h,0feh,0ffh,000h	; 7a78  ....@.\.........
	defb 007h,0f8h,007h,0f8h,007h,0f8h,00fh,0f0h,00fh,0f0h,03fh,0c0h,0ffh,000h,0ffh,000h	; 7a88  ..........?.....

; ----------------------------------------------------------------------
; DATOS dibujo_7A98: 11 caracteres de 8x8 a 2 bits por punto (16 bytes cada
;   uno), ficha 2 de la lista 0x7925 (p00:4FA3, tipo 2 en p00:4FDD); lo leen
;   p00:5174 (176 bytes)
;   0x7a98..0x7b48  (176 bytes)
DATA_dibujo_7A98:
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 7a98  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 7aa8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 7ab8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 7ac8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 7ad8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 7ae8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 7af8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 7b08  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 7b18  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 7b28  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 7b38  ................

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
; DATOS textos_7BBA: 2 textos seguidos ([x y] y caracteres hasta 0xFF; 0xFE
;   trae otra posicion) antes de 0x7BEA; se solapan 4 bloques: (texto_7BDD
;   7BDD-7BEA) (texto_7BDD 7BDD-7BEA) (texto_7BDD 7BDD-7BEA); lo leen
;   p13:6D94, p00:48EC, p13:6D5E, p13:6DD3 (48 bytes)
;   0x7bba..0x7bea  (48 bytes)
DATA_textos_7BBA:
	defb 058h,034h,022h,013h,00fh,01bh,000h,012h,00fh,022h,00fh,055h,0feh,058h,040h,021h	; 7bba  X4"......".U.X@!
	defb 00fh,024h,013h,034h,047h,035h,02eh,0feh,068h,04ch,042h,02ah,0feh,068h,058h,02ah	; 7bca  .$.4G5..hLB*.hX*
	defb 02ah,02ch,0ffh,058h,034h,021h,00fh,024h,013h,039h,05dh,02bh,03bh,00ch,035h,0ffh	; 7bda  *,.X4!.$.9]+..5.

; ----------------------------------------------------------------------
; DATOS resto_7BEA: lo apuntan con el banco puesto p13:6D94 (0x7BEA); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p13:6D94 (28 bytes)
;   0x7bea..0x7c06  (28 bytes)
DATA_resto_7BEA:
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
; DATOS textos_7C33: 3 textos seguidos ([x y] y caracteres hasta 0xFF; 0xFE
;   trae otra posicion) (DE = 0x7C33); lo leen p03:B6C1 (70 bytes)
;   0x7c33..0x7c79  (70 bytes)
DATA_textos_7C33:
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
; DATOS textos_7C8A: 2 textos seguidos ([x y] y caracteres hasta 0xFF; 0xFE
;   trae otra posicion) (HL = 0x7C8A); se solapan 2 bloques: (texto_7CA8
;   7CA8-7CB9); lo leen p00:483C, p00:4848 (47 bytes)
;   0x7c8a..0x7cb9  (47 bytes)
DATA_textos_7C8A:
	defb 050h,0b8h,06eh,00eh,076h,00ch,034h,03bh,000h,02dh,054h,051h,0feh,050h,0c8h,066h	; 7c8a  P.n.v.4..-TQ.P.f
	defb 00dh,067h,068h,069h,06ah,00eh,06bh,055h,03ah,03ah,00ch,031h,051h,0ffh,048h,0b8h	; 7c9a  .ghij.kU::.1Q.H.
	defb 01eh,023h,021h,016h,000h,021h,01eh,00fh,011h,013h,000h,019h,013h,027h,0ffh	; 7caa  .#!..!.......'.

; ----------------------------------------------------------------------
; DATOS texto_7CB9: texto (p00:4EA6, con 13-14-15 puesto por p00:439C): [x y]
;   y caracteres de la fuente hasta 0xFF; 0xFE trae otra posicion, 0xFD es
;   medio espacio; lo leen p00:4863 (15 bytes)
;   0x7cb9..0x7cc8  (15 bytes)
DATA_texto_7CB9:
	defb 048h,0b8h,01eh,023h,021h,016h,000h,000h,014h,002h,000h,019h,013h,027h,0ffh	; 7cb9  H..#!........'.

; ----------------------------------------------------------------------
; DATOS texto_suelto_7CC8: con forma de texto ([x y], caracteres y 0xFF), pero
;   ninguna instruccion ni palabra lo apunta: SIN LECTOR A LA VISTA; lo leen
;   nadie (9 bytes)
;   0x7cc8..0x7cd1  (9 bytes)
DATA_texto_suelto_7CC8:
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
; DATOS textos_7DA9: 4 textos seguidos ([x y] y caracteres hasta 0xFF; 0xFE
;   trae otra posicion) (DE = 0x7DA9 / 0x7DB4 segun A); lo leen p00:4559 (41
;   bytes)
;   0x7da9..0x7dd2  (41 bytes)
DATA_textos_7DA9:
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
; DATOS texto_suelto_7E11: con forma de texto ([x y], caracteres y 0xFF), pero
;   ninguna instruccion ni palabra lo apunta: SIN LECTOR A LA VISTA; lo leen
;   nadie (13 bytes)
;   0x7e11..0x7e1e  (13 bytes)
DATA_texto_suelto_7E11:
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
; DATOS texto_7E49: texto ([x y] y caracteres hasta 0xFF): p01:644E lo pinta
;   con p00:4EA6; lo leen p01:6446 (5 bytes)
;   0x7e49..0x7e4e  (5 bytes)
DATA_texto_7E49:
	defb 0e0h,078h,098h,099h,0ffh	; 7e49

; ----------------------------------------------------------------------
; DATOS texto_7E4E: texto ([x y] y caracteres hasta 0xFF): p01:644E lo pinta
;   con p00:4EA6; lo leen p01:644B, p01:644E (5 bytes)
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
; DATOS resto_7E61: lo apuntan con el banco puesto p14:9467 (0x7E61); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p14:9467 (8 bytes)
;   0x7e61..0x7e69  (8 bytes)
DATA_resto_7E61:
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
; DATOS texto_suelto_7E78: con forma de texto ([x y], caracteres y 0xFF), pero
;   ninguna instruccion ni palabra lo apunta: SIN LECTOR A LA VISTA; lo leen
;   nadie (14 bytes)
;   0x7e78..0x7e86  (14 bytes)
DATA_texto_suelto_7E78:
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
