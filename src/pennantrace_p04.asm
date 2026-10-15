; ==========================================================================
; THE PRO YAKYUU GEKITOTSU PENNANT RACE - Konami (1988) - MSX2 - MegaROM RC-757 de 128 KB (Konami SCC) - banco 04 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ======================================================================
; CODIGO 0x6000..0x600c  (12 bytes)
; ======================================================================


L_6000:
	jp 0b15eh		;6000
L_6003:
	ld (0effch),a		;6003
	jp 0b193h		;6006
L_6009:
	jp 0b41eh		;6009

; ----------------------------------------------------------------------
; DATOS sonidos: 72 punteros, uno por sonido del 1 al 0x48, a su cabecera
;   (p06:B204: 0x600A + 2 x numero); lo leen p06:B204 (144 bytes)
;   0x600c..0x609c  (144 bytes)
DATA_sonidos:
	defw 0609ch,060aeh,060b4h,060bah,060c0h,060c6h,060cch,060d2h	; 600c
	defw 060d8h,060deh,060e4h,060eah,060f0h,060f6h,060fch,06102h	; 601c
	defw 06108h,0610eh,06114h,0611ah,06120h,06126h,0612ch,06132h	; 602c
	defw 06138h,0613eh,06144h,0614ah,06150h,06156h,0615ch,06162h	; 603c
	defw 06168h,0616eh,06172h,06184h,0618ah,06190h,06196h,0619ch	; 604c
	defw 061aeh,061b4h,061bah,061c0h,061c8h,061dah,061e8h,061f6h	; 605c
	defw 06208h,0621ah,06228h,06236h,06244h,06252h,06260h,0626eh	; 606c
	defw 0627ch,0628ah,06298h,062a6h,062b4h,062c2h,062d0h,062d8h	; 607c
	defw 062e6h,062f4h,06302h,06310h,0631eh,0632ch,0633ah,06340h	; 608c

; ----------------------------------------------------------------------
; DATOS cabecera_609C: cabecera de sonido (p06:B211): [canales FF][prioridad
;   FE] y 8 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (18 bytes)
;   0x609c..0x60ae  (18 bytes)
DATA_cabecera_609C:
	defb 0ffh,0feh	; 609c
	defb 025h,09dh	; 609e
	defb 025h,09dh	; 60a0
	defb 025h,09dh	; 60a2
	defb 025h,09dh	; 60a4
	defb 025h,09dh	; 60a6
	defb 025h,09dh	; 60a8
	defb 025h,09dh	; 60aa
	defb 025h,09dh	; 60ac

; ----------------------------------------------------------------------
; DATOS cabecera_60AE: cabecera de sonido (p06:B211): [canales 30][prioridad
;   10] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x60ae..0x60b4  (6 bytes)
DATA_cabecera_60AE:
	defb 030h,010h	; 60ae
	defb 0e4h,09ch	; 60b0
	defb 026h,09dh	; 60b2

; ----------------------------------------------------------------------
; DATOS cabecera_60B4: cabecera de sonido (p06:B211): [canales 30][prioridad
;   10] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x60b4..0x60ba  (6 bytes)
DATA_cabecera_60B4:
	defb 030h,010h	; 60b4
	defb 052h,09dh	; 60b6
	defb 0a8h,09dh	; 60b8

; ----------------------------------------------------------------------
; DATOS cabecera_60BA: cabecera de sonido (p06:B211): [canales 30][prioridad
;   10] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x60ba..0x60c0  (6 bytes)
DATA_cabecera_60BA:
	defb 030h,010h	; 60ba
	defb 0e8h,09dh	; 60bc
	defb 048h,09eh	; 60be

; ----------------------------------------------------------------------
; DATOS cabecera_60C0: cabecera de sonido (p06:B211): [canales 30][prioridad
;   41] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x60c0..0x60c6  (6 bytes)
DATA_cabecera_60C0:
	defb 030h,041h	; 60c0
	defb 085h,09eh	; 60c2
	defb 0cch,09eh	; 60c4

; ----------------------------------------------------------------------
; DATOS cabecera_60C6: cabecera de sonido (p06:B211): [canales 30][prioridad
;   42] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x60c6..0x60cc  (6 bytes)
DATA_cabecera_60C6:
	defb 030h,042h	; 60c6
	defb 0fah,09eh	; 60c8
	defb 000h,09fh	; 60ca

; ----------------------------------------------------------------------
; DATOS cabecera_60CC: cabecera de sonido (p06:B211): [canales 30][prioridad
;   51] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x60cc..0x60d2  (6 bytes)
DATA_cabecera_60CC:
	defb 030h,051h	; 60cc
	defb 006h,0a0h	; 60ce
	defb 03ah,0a0h	; 60d0

; ----------------------------------------------------------------------
; DATOS cabecera_60D2: cabecera de sonido (p06:B211): [canales 30][prioridad
;   40] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x60d2..0x60d8  (6 bytes)
DATA_cabecera_60D2:
	defb 030h,040h	; 60d2
	defb 086h,0a0h	; 60d4
	defb 0b0h,0a0h	; 60d6

; ----------------------------------------------------------------------
; DATOS cabecera_60D8: cabecera de sonido (p06:B211): [canales 30][prioridad
;   10] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x60d8..0x60de  (6 bytes)
DATA_cabecera_60D8:
	defb 030h,010h	; 60d8
	defb 0cbh,0a0h	; 60da
	defb 0eeh,0a0h	; 60dc

; ----------------------------------------------------------------------
; DATOS cabecera_60DE: cabecera de sonido (p06:B211): [canales 30][prioridad
;   41] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x60de..0x60e4  (6 bytes)
DATA_cabecera_60DE:
	defb 030h,041h	; 60de
	defb 046h,0a1h	; 60e0
	defb 085h,0a1h	; 60e2

; ----------------------------------------------------------------------
; DATOS cabecera_60E4: cabecera de sonido (p06:B211): [canales 30][prioridad
;   40] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x60e4..0x60ea  (6 bytes)
DATA_cabecera_60E4:
	defb 030h,040h	; 60e4
	defb 0bfh,0a1h	; 60e6
	defb 0d3h,0a1h	; 60e8

; ----------------------------------------------------------------------
; DATOS cabecera_60EA: cabecera de sonido (p06:B211): [canales 30][prioridad
;   40] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x60ea..0x60f0  (6 bytes)
DATA_cabecera_60EA:
	defb 030h,040h	; 60ea
	defb 002h,0a2h	; 60ec
	defb 020h,0a2h	; 60ee

; ----------------------------------------------------------------------
; DATOS cabecera_60F0: cabecera de sonido (p06:B211): [canales 30][prioridad
;   51] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x60f0..0x60f6  (6 bytes)
DATA_cabecera_60F0:
	defb 030h,051h	; 60f0
	defb 040h,0a2h	; 60f2
	defb 04ch,0a2h	; 60f4

; ----------------------------------------------------------------------
; DATOS cabecera_60F6: cabecera de sonido (p06:B211): [canales 30][prioridad
;   52] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x60f6..0x60fc  (6 bytes)
DATA_cabecera_60F6:
	defb 030h,052h	; 60f6
	defb 058h,0a2h	; 60f8
	defb 061h,0a2h	; 60fa

; ----------------------------------------------------------------------
; DATOS cabecera_60FC: cabecera de sonido (p06:B211): [canales 30][prioridad
;   51] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x60fc..0x6102  (6 bytes)
DATA_cabecera_60FC:
	defb 030h,051h	; 60fc
	defb 06ah,0a2h	; 60fe
	defb 073h,0a2h	; 6100

; ----------------------------------------------------------------------
; DATOS cabecera_6102: cabecera de sonido (p06:B211): [canales 30][prioridad
;   51] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x6102..0x6108  (6 bytes)
DATA_cabecera_6102:
	defb 030h,051h	; 6102
	defb 07ch,0a2h	; 6104
	defb 088h,0a2h	; 6106

; ----------------------------------------------------------------------
; DATOS cabecera_6108: cabecera de sonido (p06:B211): [canales 30][prioridad
;   51] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x6108..0x610e  (6 bytes)
DATA_cabecera_6108:
	defb 030h,051h	; 6108
	defb 094h,0a2h	; 610a
	defb 0a0h,0a2h	; 610c

; ----------------------------------------------------------------------
; DATOS cabecera_610E: cabecera de sonido (p06:B211): [canales 30][prioridad
;   51] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x610e..0x6114  (6 bytes)
DATA_cabecera_610E:
	defb 030h,051h	; 610e
	defb 018h,0a3h	; 6110
	defb 032h,0a3h	; 6112

; ----------------------------------------------------------------------
; DATOS cabecera_6114: cabecera de sonido (p06:B211): [canales 30][prioridad
;   51] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x6114..0x611a  (6 bytes)
DATA_cabecera_6114:
	defb 030h,051h	; 6114
	defb 075h,0a3h	; 6116
	defb 07eh,0a3h	; 6118

; ----------------------------------------------------------------------
; DATOS cabecera_611A: cabecera de sonido (p06:B211): [canales 30][prioridad
;   51] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x611a..0x6120  (6 bytes)
DATA_cabecera_611A:
	defb 030h,051h	; 611a
	defb 087h,0a3h	; 611c
	defb 090h,0a3h	; 611e

; ----------------------------------------------------------------------
; DATOS cabecera_6120: cabecera de sonido (p06:B211): [canales 30][prioridad
;   51] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x6120..0x6126  (6 bytes)
DATA_cabecera_6120:
	defb 030h,051h	; 6120
	defb 0f3h,0a3h	; 6122
	defb 0fch,0a3h	; 6124

; ----------------------------------------------------------------------
; DATOS cabecera_6126: cabecera de sonido (p06:B211): [canales 30][prioridad
;   51] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x6126..0x612c  (6 bytes)
DATA_cabecera_6126:
	defb 030h,051h	; 6126
	defb 005h,0a4h	; 6128
	defb 00eh,0a4h	; 612a

; ----------------------------------------------------------------------
; DATOS cabecera_612C: cabecera de sonido (p06:B211): [canales 30][prioridad
;   51] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x612c..0x6132  (6 bytes)
DATA_cabecera_612C:
	defb 030h,051h	; 612c
	defb 061h,0a4h	; 612e
	defb 06dh,0a4h	; 6130

; ----------------------------------------------------------------------
; DATOS cabecera_6132: cabecera de sonido (p06:B211): [canales 30][prioridad
;   51] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x6132..0x6138  (6 bytes)
DATA_cabecera_6132:
	defb 030h,051h	; 6132
	defb 079h,0a4h	; 6134
	defb 085h,0a4h	; 6136

; ----------------------------------------------------------------------
; DATOS cabecera_6138: cabecera de sonido (p06:B211): [canales 30][prioridad
;   51] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x6138..0x613e  (6 bytes)
DATA_cabecera_6138:
	defb 030h,051h	; 6138
	defb 0fbh,0a4h	; 613a
	defb 029h,0a5h	; 613c

; ----------------------------------------------------------------------
; DATOS cabecera_613E: cabecera de sonido (p06:B211): [canales 30][prioridad
;   51] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x613e..0x6144  (6 bytes)
DATA_cabecera_613E:
	defb 030h,051h	; 613e
	defb 07ah,0a5h	; 6140
	defb 0a9h,0a5h	; 6142

; ----------------------------------------------------------------------
; DATOS cabecera_6144: cabecera de sonido (p06:B211): [canales 30][prioridad
;   51] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x6144..0x614a  (6 bytes)
DATA_cabecera_6144:
	defb 030h,051h	; 6144
	defb 0f1h,0a5h	; 6146
	defb 018h,0a6h	; 6148

; ----------------------------------------------------------------------
; DATOS cabecera_614A: cabecera de sonido (p06:B211): [canales 30][prioridad
;   52] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x614a..0x6150  (6 bytes)
DATA_cabecera_614A:
	defb 030h,052h	; 614a
	defb 03fh,0a6h	; 614c
	defb 067h,0a6h	; 614e

; ----------------------------------------------------------------------
; DATOS cabecera_6150: cabecera de sonido (p06:B211): [canales 30][prioridad
;   60] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x6150..0x6156  (6 bytes)
DATA_cabecera_6150:
	defb 030h,060h	; 6150
	defb 093h,0a6h	; 6152
	defb 0a8h,0a6h	; 6154

; ----------------------------------------------------------------------
; DATOS cabecera_6156: cabecera de sonido (p06:B211): [canales 30][prioridad
;   50] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x6156..0x615c  (6 bytes)
DATA_cabecera_6156:
	defb 030h,050h	; 6156
	defb 0bdh,0a6h	; 6158
	defb 0c3h,0a6h	; 615a

; ----------------------------------------------------------------------
; DATOS cabecera_615C: cabecera de sonido (p06:B211): [canales 30][prioridad
;   40] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x615c..0x6162  (6 bytes)
DATA_cabecera_615C:
	defb 030h,040h	; 615c
	defb 0c9h,0a6h	; 615e
	defb 0cfh,0a6h	; 6160

; ----------------------------------------------------------------------
; DATOS cabecera_6162: cabecera de sonido (p06:B211): [canales 30][prioridad
;   40] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x6162..0x6168  (6 bytes)
DATA_cabecera_6162:
	defb 030h,040h	; 6162
	defb 0d5h,0a6h	; 6164
	defb 0dbh,0a6h	; 6166

; ----------------------------------------------------------------------
; DATOS cabecera_6168: cabecera de sonido (p06:B211): [canales 30][prioridad
;   40] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x6168..0x616e  (6 bytes)
DATA_cabecera_6168:
	defb 030h,040h	; 6168
	defb 0e1h,0a6h	; 616a
	defb 0e7h,0a6h	; 616c

; ----------------------------------------------------------------------
; DATOS cabecera_616E: cabecera de sonido (p06:B211): [canales 20][prioridad
;   40] y 1 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (4 bytes)
;   0x616e..0x6172  (4 bytes)
DATA_cabecera_616E:
	defb 020h,040h	; 616e
	defb 0edh,0a6h	; 6170

; ----------------------------------------------------------------------
; DATOS cabecera_6172: cabecera de sonido (p06:B211): [canales FF][prioridad
;   E0] y 8 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (18 bytes)
;   0x6172..0x6184  (18 bytes)
DATA_cabecera_6172:
	defb 0ffh,0e0h	; 6172
	defb 0f3h,0a6h	; 6174
	defb 00eh,0a7h	; 6176
	defb 01bh,0a7h	; 6178
	defb 05dh,0a7h	; 617a
	defb 081h,0a7h	; 617c
	defb 094h,0a7h	; 617e
	defb 0a7h,0a7h	; 6180
	defb 0b7h,0a7h	; 6182

; ----------------------------------------------------------------------
; DATOS cabecera_6184: cabecera de sonido (p06:B211): [canales 30][prioridad
;   20] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x6184..0x618a  (6 bytes)
DATA_cabecera_6184:
	defb 030h,020h	; 6184
	defb 045h,0a8h	; 6186
	defb 08eh,0a8h	; 6188

; ----------------------------------------------------------------------
; DATOS cabecera_618A: cabecera de sonido (p06:B211): [canales 30][prioridad
;   40] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x618a..0x6190  (6 bytes)
DATA_cabecera_618A:
	defb 030h,040h	; 618a
	defb 0b7h,0a8h	; 618c
	defb 0bdh,0a8h	; 618e

; ----------------------------------------------------------------------
; DATOS cabecera_6190: cabecera de sonido (p06:B211): [canales 30][prioridad
;   10] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x6190..0x6196  (6 bytes)
DATA_cabecera_6190:
	defb 030h,010h	; 6190
	defb 0c3h,0a8h	; 6192
	defb 0e6h,0a8h	; 6194

; ----------------------------------------------------------------------
; DATOS cabecera_6196: cabecera de sonido (p06:B211): [canales 30][prioridad
;   12] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x6196..0x619c  (6 bytes)
DATA_cabecera_6196:
	defb 030h,012h	; 6196
	defb 009h,0a9h	; 6198
	defb 00fh,0a9h	; 619a

; ----------------------------------------------------------------------
; DATOS cabecera_619C: cabecera de sonido (p06:B211): [canales FF][prioridad
;   10] y 8 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (18 bytes)
;   0x619c..0x61ae  (18 bytes)
DATA_cabecera_619C:
	defb 0ffh,010h	; 619c
	defb 099h,0a9h	; 619e
	defb 0feh,0a9h	; 61a0
	defb 029h,0aah	; 61a2
	defb 089h,0aah	; 61a4
	defb 0fch,0aah	; 61a6
	defb 018h,0abh	; 61a8
	defb 037h,0abh	; 61aa
	defb 053h,0abh	; 61ac

; ----------------------------------------------------------------------
; DATOS cabecera_61AE: cabecera de sonido (p06:B211): [canales 30][prioridad
;   40] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x61ae..0x61b4  (6 bytes)
DATA_cabecera_61AE:
	defb 030h,040h	; 61ae
	defb 06bh,0abh	; 61b0
	defb 093h,0abh	; 61b2

; ----------------------------------------------------------------------
; DATOS cabecera_61B4: cabecera de sonido (p06:B211): [canales 30][prioridad
;   40] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x61b4..0x61ba  (6 bytes)
DATA_cabecera_61B4:
	defb 030h,040h	; 61b4
	defb 0a8h,0abh	; 61b6
	defb 0ceh,0abh	; 61b8

; ----------------------------------------------------------------------
; DATOS cabecera_61BA: cabecera de sonido (p06:B211): [canales 30][prioridad
;   40] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x61ba..0x61c0  (6 bytes)
DATA_cabecera_61BA:
	defb 030h,040h	; 61ba
	defb 0edh,0abh	; 61bc
	defb 037h,0ach	; 61be

; ----------------------------------------------------------------------
; DATOS cabecera_61C0: cabecera de sonido (p06:B211): [canales C8][prioridad
;   50] y 3 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (8 bytes)
;   0x61c0..0x61c8  (8 bytes)
DATA_cabecera_61C0:
	defb 0c8h,050h	; 61c0
	defb 0e6h,0ach	; 61c2
	defb 009h,0adh	; 61c4
	defb 02ch,0adh	; 61c6

; ----------------------------------------------------------------------
; DATOS cabecera_61C8: cabecera de sonido (p06:B211): [canales FF][prioridad
;   E0] y 8 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (18 bytes)
;   0x61c8..0x61da  (18 bytes)
DATA_cabecera_61C8:
	defb 0ffh,0e0h	; 61c8
	defb 01ch,06ch	; 61ca
	defb 0e1h,06ch	; 61cc
	defb 05ch,06eh	; 61ce
	defb 0f2h,06eh	; 61d0
	defb 069h,070h	; 61d2
	defb 053h,071h	; 61d4
	defb 0c4h,072h	; 61d6
	defb 0e6h,073h	; 61d8

; ----------------------------------------------------------------------
; DATOS cabecera_61DA: cabecera de sonido (p06:B211): [canales CF][prioridad
;   02] y 6 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (14 bytes)
;   0x61da..0x61e8  (14 bytes)
DATA_cabecera_61DA:
	defb 0cfh,002h	; 61da
	defb 013h,075h	; 61dc
	defb 0f8h,075h	; 61de
	defb 006h,077h	; 61e0
	defb 0fbh,077h	; 61e2
	defb 0d3h,078h	; 61e4
	defb 0c2h,079h	; 61e6

; ----------------------------------------------------------------------
; DATOS cabecera_61E8: cabecera de sonido (p06:B211): [canales CF][prioridad
;   01] y 6 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (14 bytes)
;   0x61e8..0x61f6  (14 bytes)
DATA_cabecera_61E8:
	defb 0cfh,001h	; 61e8
	defb 0c5h,075h	; 61ea
	defb 0f4h,076h	; 61ec
	defb 0e7h,077h	; 61ee
	defb 0c2h,078h	; 61f0
	defb 0b1h,079h	; 61f2
	defb 07ah,07ah	; 61f4

; ----------------------------------------------------------------------
; DATOS cabecera_61F6: cabecera de sonido (p06:B211): [canales FF][prioridad
;   90] y 8 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (18 bytes)
;   0x61f6..0x6208  (18 bytes)
DATA_cabecera_61F6:
	defb 0ffh,090h	; 61f6
	defb 08ch,07ah	; 61f8
	defb 09dh,07ah	; 61fa
	defb 0b5h,07ah	; 61fc
	defb 0c1h,07ah	; 61fe
	defb 0dbh,07ah	; 6200
	defb 0efh,07ah	; 6202
	defb 00ch,07bh	; 6204
	defb 063h,07bh	; 6206

; ----------------------------------------------------------------------
; DATOS cabecera_6208: cabecera de sonido (p06:B211): [canales FF][prioridad
;   90] y 8 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (18 bytes)
;   0x6208..0x621a  (18 bytes)
DATA_cabecera_6208:
	defb 0ffh,090h	; 6208
	defb 0b8h,07bh	; 620a
	defb 01bh,07ch	; 620c
	defb 09bh,07ch	; 620e
	defb 0c2h,07ch	; 6210
	defb 071h,07dh	; 6212
	defb 0f0h,07dh	; 6214
	defb 068h,07eh	; 6216
	defb 005h,07fh	; 6218

; ----------------------------------------------------------------------
; DATOS cabecera_621A: cabecera de sonido (p06:B211): [canales CF][prioridad
;   02] y 6 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (14 bytes)
;   0x621a..0x6228  (14 bytes)
DATA_cabecera_621A:
	defb 0cfh,002h	; 621a
	defb 0a0h,07fh	; 621c
	defb 0cch,07fh	; 621e
	defb 005h,080h	; 6220
	defb 028h,080h	; 6222
	defb 07ch,080h	; 6224
	defb 065h,081h	; 6226

; ----------------------------------------------------------------------
; DATOS cabecera_6228: cabecera de sonido (p06:B211): [canales CF][prioridad
;   02] y 6 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (14 bytes)
;   0x6228..0x6236  (14 bytes)
DATA_cabecera_6228:
	defb 0cfh,002h	; 6228
	defb 0a0h,07fh	; 622a
	defb 0cch,07fh	; 622c
	defb 005h,080h	; 622e
	defb 028h,080h	; 6230
	defb 07ch,080h	; 6232
	defb 065h,081h	; 6234

; ----------------------------------------------------------------------
; DATOS cabecera_6236: cabecera de sonido (p06:B211): [canales CF][prioridad
;   02] y 6 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (14 bytes)
;   0x6236..0x6244  (14 bytes)
DATA_cabecera_6236:
	defb 0cfh,002h	; 6236
	defb 091h,083h	; 6238
	defb 0aah,083h	; 623a
	defb 0cch,083h	; 623c
	defb 0e3h,083h	; 623e
	defb 01bh,084h	; 6240
	defb 0a7h,084h	; 6242

; ----------------------------------------------------------------------
; DATOS cabecera_6244: cabecera de sonido (p06:B211): [canales CF][prioridad
;   02] y 6 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (14 bytes)
;   0x6244..0x6252  (14 bytes)
DATA_cabecera_6244:
	defb 0cfh,002h	; 6244
	defb 02eh,085h	; 6246
	defb 044h,085h	; 6248
	defb 063h,085h	; 624a
	defb 079h,085h	; 624c
	defb 0b3h,085h	; 624e
	defb 01ch,086h	; 6250

; ----------------------------------------------------------------------
; DATOS cabecera_6252: cabecera de sonido (p06:B211): [canales CF][prioridad
;   02] y 6 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (14 bytes)
;   0x6252..0x6260  (14 bytes)
DATA_cabecera_6252:
	defb 0cfh,002h	; 6252
	defb 07ch,086h	; 6254
	defb 09bh,086h	; 6256
	defb 0c7h,086h	; 6258
	defb 0e7h,086h	; 625a
	defb 03bh,087h	; 625c
	defb 025h,088h	; 625e

; ----------------------------------------------------------------------
; DATOS cabecera_6260: cabecera de sonido (p06:B211): [canales CF][prioridad
;   02] y 6 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (14 bytes)
;   0x6260..0x626e  (14 bytes)
DATA_cabecera_6260:
	defb 0cfh,002h	; 6260
	defb 00dh,089h	; 6262
	defb 033h,089h	; 6264
	defb 069h,089h	; 6266
	defb 094h,089h	; 6268
	defb 0c0h,089h	; 626a
	defb 07bh,08ah	; 626c

; ----------------------------------------------------------------------
; DATOS cabecera_626E: cabecera de sonido (p06:B211): [canales CF][prioridad
;   02] y 6 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (14 bytes)
;   0x626e..0x627c  (14 bytes)
DATA_cabecera_626E:
	defb 0cfh,002h	; 626e
	defb 018h,08bh	; 6270
	defb 02bh,08bh	; 6272
	defb 048h,08bh	; 6274
	defb 05dh,08bh	; 6276
	defb 09fh,08bh	; 6278
	defb 03ch,08ch	; 627a

; ----------------------------------------------------------------------
; DATOS cabecera_627C: cabecera de sonido (p06:B211): [canales CF][prioridad
;   02] y 6 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (14 bytes)
;   0x627c..0x628a  (14 bytes)
DATA_cabecera_627C:
	defb 0cfh,002h	; 627c
	defb 0d3h,08ch	; 627e
	defb 0e6h,08ch	; 6280
	defb 010h,08dh	; 6282
	defb 025h,08dh	; 6284
	defb 060h,08dh	; 6286
	defb 03fh,08eh	; 6288

; ----------------------------------------------------------------------
; DATOS cabecera_628A: cabecera de sonido (p06:B211): [canales CF][prioridad
;   02] y 6 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (14 bytes)
;   0x628a..0x6298  (14 bytes)
DATA_cabecera_628A:
	defb 0cfh,002h	; 628a
	defb 018h,08fh	; 628c
	defb 03ch,08fh	; 628e
	defb 06bh,08fh	; 6290
	defb 090h,08fh	; 6292
	defb 0d7h,08fh	; 6294
	defb 0c8h,090h	; 6296

; ----------------------------------------------------------------------
; DATOS cabecera_6298: cabecera de sonido (p06:B211): [canales CF][prioridad
;   02] y 6 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (14 bytes)
;   0x6298..0x62a6  (14 bytes)
DATA_cabecera_6298:
	defb 0cfh,002h	; 6298
	defb 09bh,07fh	; 629a
	defb 0c7h,07fh	; 629c
	defb 000h,080h	; 629e
	defb 023h,080h	; 62a0
	defb 077h,080h	; 62a2
	defb 060h,081h	; 62a4

; ----------------------------------------------------------------------
; DATOS cabecera_62A6: cabecera de sonido (p06:B211): [canales CF][prioridad
;   02] y 6 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (14 bytes)
;   0x62a6..0x62b4  (14 bytes)
DATA_cabecera_62A6:
	defb 0cfh,002h	; 62a6
	defb 008h,089h	; 62a8
	defb 02eh,089h	; 62aa
	defb 064h,089h	; 62ac
	defb 08fh,089h	; 62ae
	defb 0bbh,089h	; 62b0
	defb 076h,08ah	; 62b2

; ----------------------------------------------------------------------
; DATOS cabecera_62B4: cabecera de sonido (p06:B211): [canales CF][prioridad
;   30] y 6 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (14 bytes)
;   0x62b4..0x62c2  (14 bytes)
DATA_cabecera_62B4:
	defb 0cfh,030h	; 62b4
	defb 0feh,091h	; 62b6
	defb 01ch,092h	; 62b8
	defb 03bh,092h	; 62ba
	defb 05bh,092h	; 62bc
	defb 09ch,092h	; 62be
	defb 013h,093h	; 62c0

; ----------------------------------------------------------------------
; DATOS cabecera_62C2: cabecera de sonido (p06:B211): [canales CF][prioridad
;   30] y 6 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (14 bytes)
;   0x62c2..0x62d0  (14 bytes)
DATA_cabecera_62C2:
	defb 0cfh,030h	; 62c2
	defb 07dh,093h	; 62c4
	defb 091h,093h	; 62c6
	defb 0b2h,093h	; 62c8
	defb 0c8h,093h	; 62ca
	defb 008h,094h	; 62cc
	defb 0c7h,094h	; 62ce

; ----------------------------------------------------------------------
; DATOS cabecera_62D0: cabecera de sonido (p06:B211): [canales 07][prioridad
;   50] y 3 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (8 bytes)
;   0x62d0..0x62d8  (8 bytes)
DATA_cabecera_62D0:
	defb 007h,050h	; 62d0
	defb 082h,095h	; 62d2
	defb 038h,096h	; 62d4
	defb 0ech,096h	; 62d6

; ----------------------------------------------------------------------
; DATOS cabecera_62D8: cabecera de sonido (p06:B211): [canales CF][prioridad
;   50] y 6 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (14 bytes)
;   0x62d8..0x62e6  (14 bytes)
DATA_cabecera_62D8:
	defb 0cfh,050h	; 62d8
	defb 093h,097h	; 62da
	defb 0c4h,097h	; 62dc
	defb 0d6h,097h	; 62de
	defb 0eah,097h	; 62e0
	defb 023h,098h	; 62e2
	defb 058h,098h	; 62e4

; ----------------------------------------------------------------------
; DATOS cabecera_62E6: cabecera de sonido (p06:B211): [canales CF][prioridad
;   50] y 6 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (14 bytes)
;   0x62e6..0x62f4  (14 bytes)
DATA_cabecera_62E6:
	defb 0cfh,050h	; 62e6
	defb 090h,098h	; 62e8
	defb 0cbh,098h	; 62ea
	defb 006h,099h	; 62ec
	defb 088h,099h	; 62ee
	defb 09ah,099h	; 62f0
	defb 02fh,09ah	; 62f2

; ----------------------------------------------------------------------
; DATOS cabecera_62F4: cabecera de sonido (p06:B211): [canales CF][prioridad
;   40] y 6 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (14 bytes)
;   0x62f4..0x6302  (14 bytes)
DATA_cabecera_62F4:
	defb 0cfh,040h	; 62f4
	defb 0bdh,09ah	; 62f6
	defb 0dah,09ah	; 62f8
	defb 0eeh,09ah	; 62fa
	defb 000h,09bh	; 62fc
	defb 012h,09bh	; 62fe
	defb 02eh,09bh	; 6300

; ----------------------------------------------------------------------
; DATOS cabecera_6302: cabecera de sonido (p06:B211): [canales CF][prioridad
;   40] y 6 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (14 bytes)
;   0x6302..0x6310  (14 bytes)
DATA_cabecera_6302:
	defb 0cfh,040h	; 6302
	defb 048h,09bh	; 6304
	defb 059h,09bh	; 6306
	defb 069h,09bh	; 6308
	defb 07bh,09bh	; 630a
	defb 08dh,09bh	; 630c
	defb 0a9h,09bh	; 630e

; ----------------------------------------------------------------------
; DATOS cabecera_6310: cabecera de sonido (p06:B211): [canales CF][prioridad
;   20] y 6 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (14 bytes)
;   0x6310..0x631e  (14 bytes)
DATA_cabecera_6310:
	defb 0cfh,020h	; 6310
	defb 0c4h,09bh	; 6312
	defb 0d8h,09bh	; 6314
	defb 0ech,09bh	; 6316
	defb 001h,09ch	; 6318
	defb 016h,09ch	; 631a
	defb 035h,09ch	; 631c

; ----------------------------------------------------------------------
; DATOS cabecera_631E: cabecera de sonido (p06:B211): [canales CF][prioridad
;   40] y 6 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (14 bytes)
;   0x631e..0x632c  (14 bytes)
DATA_cabecera_631E:
	defb 0cfh,040h	; 631e
	defb 052h,09ch	; 6320
	defb 066h,09ch	; 6322
	defb 07eh,09ch	; 6324
	defb 093h,09ch	; 6326
	defb 0a8h,09ch	; 6328
	defb 0c7h,09ch	; 632a

; ----------------------------------------------------------------------
; DATOS cabecera_632C: cabecera de sonido (p06:B211): [canales CF][prioridad
;   02] y 6 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (14 bytes)
;   0x632c..0x633a  (14 bytes)
DATA_cabecera_632C:
	defb 0cfh,002h	; 632c
	defb 0e3h,09ch	; 632e
	defb 0e3h,09ch	; 6330
	defb 0e3h,09ch	; 6332
	defb 0e3h,09ch	; 6334
	defb 0e3h,09ch	; 6336
	defb 0e3h,09ch	; 6338

; ----------------------------------------------------------------------
; DATOS cabecera_633A: cabecera de sonido (p06:B211): [canales 30][prioridad
;   40] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x633a..0x6340  (6 bytes)
DATA_cabecera_633A:
	defb 030h,040h	; 633a
	defb 06ch,0ach	; 633c
	defb 0b6h,0ach	; 633e

; ----------------------------------------------------------------------
; DATOS cabecera_6340: cabecera de sonido (p06:B211): [canales 30][prioridad
;   11] y 2 punteros, uno por canal encendido (bit 7 = el primero de 0xEE00);
;   lo leen p06:B217 (6 bytes)
;   0x6340..0x6346  (6 bytes)
DATA_cabecera_6340:
	defb 030h,011h	; 6340
	defb 055h,0a9h	; 6342
	defb 077h,0a9h	; 6344

; ----------------------------------------------------------------------
; DATOS sonido_6346: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x02,
;   0x03, 0x06, 0x09, 0x0D, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16 y 24 mas
;   (tools/partituras.py); lo leen p06:B51E (12 bytes)
;   0x6346..0x6352  (12 bytes)
DATA_sonido_6346:
	defb 0d6h,063h,0d6h,063h,0d6h,063h,0f6h,063h,0f6h,063h,016h,064h	; 6346  .c.c.c.c.c.d

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6352..0x6354  (2 bytes)
DATA_6352:
	defb 036h,064h	; 6352

; ----------------------------------------------------------------------
; DATOS sonido_6354: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x0A,
;   0x0B, 0x2E, 0x2F, 0x31 (tools/partituras.py); lo leen p06:B51E (4 bytes)
;   0x6354..0x6358  (4 bytes)
DATA_sonido_6354:
	defb 036h,064h,056h,064h	; 6354

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6358..0x635a  (2 bytes)
DATA_6358:
	defb 056h,064h	; 6358

; ----------------------------------------------------------------------
; DATOS sonido_635A: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x05,
;   0x07, 0x0A, 0x0C, 0x23, 0x28, 0x29, 0x2A, 0x2B, 0x2D, 0x30, 0x35 y 2 mas
;   (tools/partituras.py); lo leen p06:B51E (8 bytes)
;   0x635a..0x6362  (8 bytes)
DATA_sonido_635A:
	defb 056h,064h,076h,064h,096h,064h,0b6h,064h	; 635a  Vdvd.d.d

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6362..0x636c  (10 bytes)
DATA_6362:
	defb 0d6h,064h,0d6h,064h,0d6h,064h,0d6h,064h,0d6h,064h	; 6362  .d.d.d.d.d

; ----------------------------------------------------------------------
; DATOS sonido_636C: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x02,
;   0x05, 0x07, 0x0D, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15 y 30 mas
;   (tools/partituras.py); lo leen p06:B51E (6 bytes)
;   0x636c..0x6372  (6 bytes)
DATA_sonido_636C:
	defb 0d6h,064h,0f6h,064h,016h,065h	; 636c

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6372..0x6380  (14 bytes)
DATA_6372:
	defb 036h,065h,036h,065h,036h,065h,036h,065h,036h,065h,036h,065h,036h,065h	; 6372  6e6e6e6e6e6e6e

; ----------------------------------------------------------------------
; DATOS sonido_6380: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x04,
;   0x07, 0x0D, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x17, 0x18, 0x1C, 0x1E y 11 mas
;   (tools/partituras.py); lo leen p06:B51E (2 bytes)
;   0x6380..0x6382  (2 bytes)
DATA_sonido_6380:
	defb 036h,065h	; 6380

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6382..0x6384  (2 bytes)
DATA_6382:
	defb 056h,065h	; 6382

; ----------------------------------------------------------------------
; DATOS sonido_6384: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x08
;   (tools/partituras.py); lo leen p06:B51E (2 bytes)
;   0x6384..0x6386  (2 bytes)
DATA_sonido_6384:
	defb 056h,065h	; 6384

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6386..0x638a  (4 bytes)
DATA_6386:
	defb 076h,065h,076h,065h	; 6386

; ----------------------------------------------------------------------
; DATOS sonido_638A: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x07,
;   0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x11, 0x13, 0x14, 0x15, 0x16, 0x17 y 8 mas
;   (tools/partituras.py); lo leen p06:B51E (4 bytes)
;   0x638a..0x638e  (4 bytes)
DATA_sonido_638A:
	defb 076h,065h,076h,065h	; 638a

; ----------------------------------------------------------------------
; DATOS sin identificar  0x638e..0x6390  (2 bytes)
DATA_638E:
	defb 096h,065h	; 638e

; ----------------------------------------------------------------------
; DATOS sonido_6390: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x2D,
;   0x3B, 0x3C, 0x42, 0x43, 0x45 (tools/partituras.py); lo leen p06:B51E (4
;   bytes)
;   0x6390..0x6394  (4 bytes)
DATA_sonido_6390:
	defb 096h,065h,0b6h,065h	; 6390

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6394..0x6396  (2 bytes)
DATA_6394:
	defb 0d6h,065h	; 6394

; ----------------------------------------------------------------------
; DATOS sonido_6396: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x02,
;   0x07, 0x10, 0x11, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x2B, 0x2C y 22 mas
;   (tools/partituras.py); lo leen p06:B51E (4 bytes)
;   0x6396..0x639a  (4 bytes)
DATA_sonido_6396:
	defb 0d6h,065h,0f6h,065h	; 6396

; ----------------------------------------------------------------------
; DATOS sin identificar  0x639a..0x639c  (2 bytes)
DATA_639A:
	defb 016h,066h	; 639a

; ----------------------------------------------------------------------
; DATOS sonido_639C: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x2D
;   (tools/partituras.py); lo leen p06:B51E (2 bytes)
;   0x639c..0x639e  (2 bytes)
DATA_sonido_639C:
	defb 016h,066h	; 639c

; ----------------------------------------------------------------------
; DATOS sin identificar  0x639e..0x63a8  (10 bytes)
DATA_639E:
	defb 036h,066h,036h,066h,036h,066h,036h,066h,036h,066h	; 639e  6f6f6f6f6f

; ----------------------------------------------------------------------
; DATOS sonido_63A8: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x28,
;   0x2B, 0x47 (tools/partituras.py); lo leen p06:B51E (2 bytes)
;   0x63a8..0x63aa  (2 bytes)
DATA_sonido_63A8:
	defb 036h,066h	; 63a8

; ----------------------------------------------------------------------
; DATOS sin identificar  0x63aa..0x63d6  (44 bytes)
DATA_63AA:
	defb 056h,066h,056h,066h,056h,066h,056h,066h,056h,066h,056h,066h,056h,066h,056h,066h	; 63aa  VfVfVfVfVfVfVfVf
	defb 056h,066h,056h,066h,056h,066h,056h,066h,056h,066h,056h,066h,056h,066h,056h,066h	; 63ba  VfVfVfVfVfVfVfVf
	defb 056h,066h,056h,066h,056h,066h,056h,066h,056h,066h,056h,066h	; 63ca  VfVfVfVfVfVf

; ----------------------------------------------------------------------
; DATOS sonido_63D6: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x02,
;   0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D y 56 mas
;   (tools/partituras.py); lo leen p06:B51E (576 bytes)
;   0x63d6..0x6616  (576 bytes)
DATA_sonido_63D6:
	defb 000h,0f8h,0f0h,0e8h,0e0h,0d8h,0d0h,0c8h,0c0h,0b8h,0b0h,0a8h,0a0h,098h,090h,088h	; 63d6  ................
	defb 080h,078h,070h,068h,060h,058h,050h,048h,040h,038h,030h,028h,020h,018h,010h,008h	; 63e6  .xph`XPH@80( ...
	defb 000h,04eh,062h,06dh,075h,07ah,07dh,07eh,07fh,07eh,07dh,07ah,075h,06dh,062h,04eh	; 63f6  .Nbmuz}~.~}zumbN
	defb 000h,0b1h,09dh,092h,08ah,085h,082h,081h,080h,081h,082h,085h,08ah,092h,09dh,0b1h	; 6406  ................
	defb 000h,019h,031h,047h,05ah,06ah,075h,07dh,07fh,07dh,075h,06ah,05ah,047h,031h,019h	; 6416  ..1GZju}.}ujZG1.
	defb 000h,0e7h,0cfh,0b9h,0a6h,096h,08bh,083h,080h,083h,08bh,096h,0a6h,0b9h,0cfh,0e7h	; 6426  ................
	defb 000h,0e0h,0c0h,0a0h,080h,0a0h,0c0h,0e0h,000h,020h,040h,060h,07fh,060h,040h,020h	; 6436  ......... @`.`@
	defb 000h,0e0h,0c0h,0a0h,080h,0a0h,0c0h,0e0h,000h,020h,040h,060h,07fh,060h,040h,020h	; 6446  ......... @`.`@
	defb 000h,019h,031h,047h,05ah,06ah,075h,07dh,07fh,07dh,075h,06ah,05ah,047h,031h,019h	; 6456  ..1GZju}.}ujZG1.
	defb 080h,090h,0a0h,0b0h,0c0h,0d0h,0e0h,0f0h,000h,010h,020h,030h,040h,050h,060h,070h	; 6466  .......... 0@P`p
	defb 000h,019h,031h,047h,05ah,06ah,075h,07dh,07fh,07dh,075h,06ah,05ah,047h,031h,019h	; 6476  ..1GZju}.}ujZG1.
	defb 080h,0a0h,0c0h,0e0h,000h,020h,040h,060h,080h,0a0h,0c0h,0e0h,000h,020h,040h,060h	; 6486  ..... @`..... @`
	defb 001h,02ah,040h,050h,05ch,068h,070h,078h,07fh,078h,070h,068h,05ch,050h,040h,02ah	; 6496  .*@P\hpx.xph\P@*
	defb 0ffh,0d6h,0c0h,0b0h,0a4h,098h,090h,088h,081h,088h,090h,098h,0a4h,0b0h,0c0h,0d6h	; 64a6  ................
	defb 000h,040h,07fh,040h,001h,0c0h,081h,0c0h,001h,040h,07fh,040h,001h,0c0h,001h,040h	; 64b6  .@.@.....@.@...@
	defb 001h,0e0h,001h,020h,001h,0f0h,001h,010h,001h,0ffh,0ffh,0ffh,0ffh,040h,040h,040h	; 64c6  ... .........@@@
	defb 000h,0f0h,0e0h,0d0h,0c0h,0b0h,0a0h,090h,080h,080h,080h,080h,080h,080h,080h,080h	; 64d6  ................
	defb 080h,080h,080h,080h,080h,080h,080h,080h,07fh,070h,060h,050h,040h,030h,020h,010h	; 64e6  .........p`P@0 .
	defb 000h,030h,050h,060h,070h,060h,050h,030h,000h,0d0h,0b0h,0a0h,090h,0a0h,0b0h,0d0h	; 64f6  .0P`p`P0........
	defb 000h,040h,060h,070h,060h,040h,000h,0c0h,0a0h,090h,0a0h,0c0h,000h,070h,000h,090h	; 6506  .@`p`@.......p..
	defb 030h,050h,050h,030h,000h,000h,010h,040h,060h,070h,060h,030h,0f0h,0e0h,0e0h,000h	; 6516  0PP0...@`p`0....
	defb 020h,020h,010h,0c0h,0a0h,090h,0a0h,0c0h,000h,000h,0d0h,0b0h,0b0h,0d0h,000h,000h	; 6526    ..............
	defb 000h,070h,050h,020h,050h,070h,030h,000h,050h,07fh,060h,010h,030h,040h,000h,0b0h	; 6536  .pP Pp0.P.`.0@..
	defb 010h,060h,000h,0e0h,0f0h,000h,0b0h,090h,0c0h,010h,0e0h,0a0h,0c0h,0f0h,0c0h,0a0h	; 6546  .`..............
	defb 000h,020h,030h,040h,050h,060h,068h,070h,078h,070h,068h,060h,050h,040h,030h,020h	; 6556  . 0@P`hpxph`P@0
	defb 000h,0e0h,0d0h,0c0h,0b0h,0a0h,098h,090h,088h,090h,098h,0a0h,0b0h,0c0h,0d0h,0e0h	; 6566  ................
	defb 080h,0b0h,0c0h,010h,01ah,02ah,02ch,01ah,000h,0e0h,0d0h,0e0h,022h,053h,070h,075h	; 6576  .....*,....."Spu
	defb 070h,031h,0eah,080h,088h,08ah,08ch,08eh,000h,07fh,075h,073h,062h,000h,0c0h,090h	; 6586  p1........usb...
	defb 000h,000h,000h,000h,000h,070h,070h,000h,000h,080h,080h,080h,000h,000h,000h,000h	; 6596  .....pp.........
	defb 070h,070h,070h,000h,080h,080h,000h,000h,000h,000h,070h,070h,000h,000h,080h,080h	; 65a6  ppp.......pp....
	defb 000h,000h,000h,080h,000h,070h,070h,070h,000h,000h,000h,080h,000h,000h,000h,080h	; 65b6  .....ppp........
	defb 080h,080h,080h,000h,080h,000h,000h,000h,000h,080h,080h,080h,000h,080h,080h,080h	; 65c6  ................
	defb 070h,070h,070h,070h,070h,070h,070h,070h,080h,080h,080h,080h,080h,080h,080h,080h	; 65d6  pppppppp........
	defb 070h,070h,070h,080h,080h,080h,070h,070h,070h,070h,080h,080h,080h,080h,080h,080h	; 65e6  ppp...pppp......
	defb 0a0h,090h,090h,090h,0a0h,0a0h,0b0h,0b0h,0c0h,0c0h,0d0h,0d0h,0e0h,0e0h,0f0h,0f0h	; 65f6  ................
	defb 000h,000h,010h,010h,020h,020h,030h,030h,040h,040h,050h,050h,060h,060h,060h,050h	; 6606  ....  00@@PP```P

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6616..0x6636  (32 bytes)
DATA_6616:
	defb 000h,040h,07fh,040h,001h,0c0h,081h,0c0h,001h,040h,07fh,040h,001h,0c0h,001h,040h	; 6616  .@.@.....@.@...@
	defb 001h,0e0h,001h,020h,001h,0f0h,001h,010h,001h,0ffh,0ffh,0ffh,0ffh,040h,040h,040h	; 6626  ... .........@@@

; ----------------------------------------------------------------------
; DATOS sonido_6636: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x23,
;   0x28, 0x2B, 0x2C, 0x2D, 0x2E, 0x2F, 0x30, 0x31, 0x32, 0x33, 0x34 y 17 mas
;   (tools/partituras.py); lo leen p06:B51E (712 bytes)
;   0x6636..0x68fe  (712 bytes)
DATA_sonido_6636:
	defb 001h,02ah,040h,050h,05ch,068h,070h,078h,07fh,078h,070h,068h,05ch,050h,040h,02ah	; 6636  .*@P\hpx.xph\P@*
	defb 0ffh,0d6h,0c0h,0b0h,0a4h,098h,090h,088h,081h,088h,090h,098h,0a4h,0b0h,0c0h,0d6h	; 6646  ................
	defb 06eh,066h,074h,066h,081h,066h,096h,066h,0afh,066h,0beh,066h,015h,067h,06ch,067h	; 6656  nftf.f.f.f.f.glg
	defb 0abh,067h,0eah,067h,035h,068h,090h,068h,0e1h,001h,0e4h,000h,007h,0ffh,0e3h,001h	; 6666  .g.g5h.h........
	defb 0e4h,000h,08ah,000h,0e1h,004h,006h,005h,004h,003h,0ffh,0e1h,001h,0e4h,014h,007h	; 6676  ................
	defb 0e2h,001h,072h,000h,0e1h,002h,0e4h,010h,003h,002h,0e1h,001h,0e4h,006h,002h,0ffh	; 6686  ..r.............
	defb 0e2h,001h,0e5h,00ah,000h,042h,0c1h,0b0h,0e8h,0e1h,001h,0e4h,008h,008h,007h,006h	; 6696  .....B..........
	defb 005h,004h,003h,002h,002h,001h,001h,000h,0ffh,0e2h,001h,0e5h,009h,003h,000h,093h	; 66a6  ................
	defb 0d0h,096h,000h,097h,000h,098h,000h,0ffh,0e2h,001h,0b3h,080h,0a4h,000h,0a4h,0d0h	; 66b6  ................
	defb 0a5h,060h,0a6h,080h,0a7h,040h,053h,0b0h,054h,030h,055h,000h,055h,0a0h,056h,0d0h	; 66c6  .`...@S.T0U.U.V.
	defb 057h,0a0h,043h,080h,044h,000h,044h,0d0h,045h,060h,046h,080h,047h,040h,033h,0b0h	; 66d6  W.C.D.D.E`F.G@3.
	defb 034h,030h,035h,000h,035h,0a0h,036h,0d0h,037h,0a0h,023h,080h,024h,000h,024h,0d0h	; 66e6  405.5.6.7.#.$.$.
	defb 025h,060h,026h,080h,027h,040h,013h,0b0h,014h,030h,015h,000h,015h,0a0h,016h,0d0h	; 66f6  %`&.'@...0......
	defb 017h,0a0h,003h,080h,004h,000h,004h,0d0h,005h,060h,006h,080h,007h,040h,0ffh,0e2h	; 6706  .........`...@..
	defb 001h,083h,080h,084h,000h,084h,0d0h,085h,060h,086h,080h,087h,040h,053h,0b0h,054h	; 6716  ........`...@S.T
	defb 030h,055h,000h,055h,0a0h,056h,0d0h,057h,0a0h,043h,080h,044h,000h,044h,0d0h,045h	; 6726  0U.U.V.W.C.D.D.E
	defb 060h,046h,080h,047h,040h,033h,0b0h,034h,030h,035h,000h,035h,0a0h,036h,0d0h,037h	; 6736  `F.G@3.405.5.6.7
	defb 0a0h,023h,080h,024h,000h,024h,0d0h,025h,060h,026h,080h,027h,040h,013h,0b0h,014h	; 6746  .#.$.$.%`&.'@...
	defb 030h,015h,000h,015h,0a0h,016h,0d0h,017h,0a0h,003h,080h,004h,000h,004h,0d0h,005h	; 6756  0...............
	defb 060h,006h,080h,007h,040h,0ffh,0e2h,001h,080h,026h,060h,024h,070h,027h,060h,024h	; 6766  `...@....&`$p'`$
	defb 070h,026h,060h,024h,050h,025h,070h,026h,070h,025h,070h,027h,070h,025h,070h,027h	; 6776  p&`$P%p&p%p'p%p'
	defb 070h,025h,070h,027h,070h,025h,070h,027h,070h,025h,070h,027h,070h,025h,070h,027h	; 6786  p%p'p%p'p%p'p%p'
	defb 070h,025h,070h,027h,070h,025h,070h,028h,070h,026h,070h,029h,070h,027h,070h,02ah	; 6796  p%p'p%p(p&p)p'p*
	defb 070h,028h,070h,02bh,0ffh,0e2h,001h,060h,026h,040h,024h,050h,027h,040h,024h,050h	; 67a6  p(p+...`&@$P'@$P
	defb 026h,040h,024h,030h,025h,050h,026h,050h,025h,050h,027h,050h,025h,050h,027h,050h	; 67b6  &@$0%P&P%P'P%P'P
	defb 025h,050h,027h,050h,025h,050h,027h,050h,025h,050h,027h,050h,025h,050h,027h,050h	; 67c6  %P'P%P'P%P'P%P'P
	defb 025h,050h,027h,050h,025h,050h,028h,050h,026h,050h,029h,050h,027h,050h,02ah,050h	; 67d6  %P'P%P(P&P)P'P*P
	defb 028h,050h,02bh,0ffh,0e1h,002h,0e4h,000h,005h,0e4h,00fh,005h,0e4h,002h,005h,0e4h	; 67e6  (P+.............
	defb 004h,005h,0e4h,000h,004h,0e4h,00fh,004h,0e4h,002h,004h,0e4h,004h,004h,0e4h,000h	; 67f6  ................
	defb 003h,0e4h,00fh,003h,0e4h,002h,003h,0e4h,004h,003h,0e4h,000h,002h,0e4h,00fh,002h	; 6806  ................
	defb 0e4h,002h,002h,0e4h,004h,002h,0e4h,000h,001h,0e4h,00fh,001h,0e4h,002h,002h,0e4h	; 6816  ................
	defb 004h,002h,0e4h,000h,001h,0e4h,00fh,001h,0e4h,002h,001h,0e4h,004h,001h,0ffh,0e2h	; 6826  ................
	defb 001h,0a3h,077h,0a4h,062h,0a5h,08ch,0a7h,006h,0a4h,044h,0a5h,066h,0a6h,0d5h,0a8h	; 6836  ..w.b.....D.f...
	defb 0a5h,000h,000h,053h,077h,054h,062h,055h,08ch,057h,006h,054h,044h,055h,066h,056h	; 6846  ...SwTbU.W.TDUfV
	defb 0d5h,058h,0a5h,000h,000h,023h,077h,024h,062h,025h,08ch,027h,006h,024h,044h,025h	; 6856  .X...#w$b%.'.$D%
	defb 066h,026h,0d5h,028h,0a5h,000h,000h,013h,077h,014h,062h,015h,08ch,017h,006h,014h	; 6866  f&.(....w.b.....
	defb 044h,015h,066h,016h,0d5h,018h,0a5h,000h,000h,003h,077h,004h,062h,005h,08ch,007h	; 6876  D.f.......w.b...
	defb 006h,004h,044h,005h,066h,006h,0d5h,008h,0a5h,0ffh,0e2h,001h,080h,024h,060h,022h	; 6886  ..D.f........$`"
	defb 070h,025h,060h,022h,070h,024h,060h,022h,050h,023h,070h,025h,070h,023h,070h,025h	; 6896  p%`"p$`"P#p%p#p%
	defb 070h,023h,070h,025h,070h,023h,070h,025h,070h,023h,070h,025h,070h,023h,070h,025h	; 68a6  p#p%p#p%p#p%p#p%
	defb 070h,023h,070h,025h,070h,023h,070h,025h,070h,023h,070h,025h,070h,023h,070h,025h	; 68b6  p#p%p#p%p#p%p#p%
	defb 070h,023h,070h,025h,070h,023h,070h,025h,070h,023h,070h,025h,070h,023h,070h,025h	; 68c6  p#p%p#p%p#p%p#p%
	defb 070h,023h,070h,025h,070h,023h,070h,025h,070h,023h,070h,025h,070h,023h,070h,025h	; 68d6  p#p%p#p%p#p%p#p%
	defb 070h,023h,070h,025h,070h,023h,070h,025h,070h,023h,070h,025h,070h,023h,070h,026h	; 68e6  p#p%p#p%p#p%p#p&
	defb 070h,024h,070h,027h,070h,025h,070h,028h	; 68f6  p$p'p%p(

; ----------------------------------------------------------------------
; DATOS sin identificar  0x68fe..0x6903  (5 bytes)
DATA_68FE:
	defb 070h,026h,070h,029h,0ffh	; 68fe

; ----------------------------------------------------------------------
; DATOS sonido_6903: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x2D,
;   0x2E, 0x2F, 0x30, 0x31 (tools/partituras.py); lo leen p06:B51E (16 bytes)
;   0x6903..0x6913  (16 bytes)
DATA_sonido_6903:
	defb 01bh,069h,031h,069h,03dh,069h,049h,069h,066h,069h,083h,069h,0a0h,069h,0b6h,069h	; 6903  .i1i=iIifi.i.i.i

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6913..0x6917  (4 bytes)
DATA_6913:
	defb 0c5h,069h,0d9h,069h	; 6913

; ----------------------------------------------------------------------
; DATOS sonido_6917: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x2C,
;   0x2D, 0x36, 0x3A, 0x3D, 0x3E, 0x42, 0x43, 0x44, 0x45
;   (tools/partituras.py); lo leen p06:B51E (37 bytes)
;   0x6917..0x693c  (37 bytes)
DATA_sonido_6917:
	defb 00ch,06ah,04bh,06ah,0e1h,003h,0e4h,002h,00ah,0e4h,000h,00ah,0e1h,006h,0e4h,001h	; 6917  .jKj............
	defb 009h,0e4h,000h,008h,007h,006h,005h,004h,003h,0ffh,0e1h,004h,0e4h,000h,00bh,00ah	; 6927  ................
	defb 009h,008h,007h,006h,005h	; 6937

; ----------------------------------------------------------------------
; DATOS sin identificar  0x693c..0x693d  (1 bytes)
DATA_693C:
	defb 0ffh	; 693c

; ----------------------------------------------------------------------
; DATOS sonido_693D: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x2D,
;   0x2E, 0x2F, 0x30, 0x31 (tools/partituras.py); lo leen p06:B51E (118 bytes)
;   0x693d..0x69b3  (118 bytes)
DATA_sonido_693D:
	defb 0e1h,004h,0e4h,000h,009h,008h,007h,006h,005h,004h,003h,0ffh,0e2h,001h,093h,000h	; 693d  ................
	defb 085h,000h,076h,000h,067h,000h,0e2h,003h,058h,000h,049h,000h,03ah,000h,02bh,000h	; 694d  ..v.g...X.I.:.+.
	defb 01ch,000h,00dh,000h,00eh,000h,00fh,000h,0ffh,0e2h,001h,0a3h,000h,095h,000h,086h	; 695d  ................
	defb 000h,077h,000h,0e2h,003h,068h,000h,059h,000h,04ah,000h,03bh,000h,02ch,000h,01dh	; 696d  .w...h.Y.J...,..
	defb 000h,00eh,000h,00fh,000h,0ffh,0e2h,001h,053h,000h,045h,000h,046h,000h,037h,000h	; 697d  ........S.E.F.7.
	defb 0e2h,003h,038h,000h,029h,000h,02ah,000h,01bh,000h,01ch,000h,00dh,000h,00eh,000h	; 698d  ..8.).*.........
	defb 00fh,000h,0ffh,0e1h,002h,0e4h,002h,00ah,0e4h,000h,00ah,0e1h,004h,0e4h,001h,009h	; 699d  ................
	defb 0e4h,000h,008h,007h,006h,005h	; 69ad

; ----------------------------------------------------------------------
; DATOS sin identificar  0x69b3..0x69b6  (3 bytes)
DATA_69B3:
	defb 004h,003h,0ffh	; 69b3

; ----------------------------------------------------------------------
; DATOS sonido_69B6: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x2D,
;   0x2E, 0x31 (tools/partituras.py); lo leen p06:B51E (14 bytes)
;   0x69b6..0x69c4  (14 bytes)
DATA_sonido_69B6:
	defb 0e2h,001h,092h,080h,0e3h,001h,0e4h,000h,081h,0f0h,072h,050h,073h,000h	; 69b6  ..........rPs.

; ----------------------------------------------------------------------
; DATOS sin identificar  0x69c4..0x6a0c  (72 bytes)
DATA_69C4:
	defb 0ffh,0e1h,002h,0e4h,002h,008h,0e4h,000h,007h,0e1h,004h,0e4h,001h,006h,0e4h,000h	; 69c4  ................
	defb 005h,004h,003h,002h,0ffh,0e2h,001h,020h,024h,030h,027h,030h,022h,030h,025h,040h	; 69d4  ....... $0'0"0%@
	defb 020h,040h,023h,040h,020h,040h,023h,040h,020h,040h,023h,040h,020h,040h,023h,040h	; 69e4   @#@ @#@ @#@ @#@
	defb 020h,040h,023h,040h,020h,040h,023h,040h,020h,040h,023h,040h,020h,040h,023h,040h	; 69f4   @#@ @#@ @#@ @#@
	defb 022h,030h,025h,020h,024h,010h,027h,0ffh	; 6a04  "0% $.'.

; ----------------------------------------------------------------------
; DATOS sonido_6A0C: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x2C,
;   0x2D, 0x36, 0x3A, 0x3D, 0x3E, 0x42, 0x43, 0x44, 0x45
;   (tools/partituras.py); lo leen p06:B51E (142 bytes)
;   0x6a0c..0x6a9a  (142 bytes)
DATA_sonido_6A0C:
	defb 0e2h,001h,080h,025h,060h,023h,070h,026h,060h,023h,070h,025h,060h,023h,050h,024h	; 6a0c  ...%`#p&`#p%`#P$
	defb 070h,026h,070h,024h,070h,026h,070h,024h,070h,026h,070h,024h,070h,026h,070h,024h	; 6a1c  p&p$p&p$p&p$p&p$
	defb 070h,026h,070h,024h,070h,026h,070h,024h,070h,026h,070h,024h,070h,026h,070h,024h	; 6a2c  p&p$p&p$p&p$p&p$
	defb 070h,027h,070h,025h,070h,028h,070h,026h,070h,029h,070h,027h,070h,02ah,0ffh,0e2h	; 6a3c  p'p%p(p&p)p'p*..
	defb 001h,080h,024h,060h,022h,070h,025h,060h,022h,070h,024h,060h,022h,050h,023h,070h	; 6a4c  ..$`"p%`"p$`"P#p
	defb 025h,070h,023h,070h,025h,070h,023h,070h,025h,070h,023h,070h,025h,070h,023h,070h	; 6a5c  %p#p%p#p%p#p%p#p
	defb 025h,070h,023h,070h,025h,070h,023h,070h,025h,070h,023h,070h,025h,070h,023h,070h	; 6a6c  %p#p%p#p%p#p%p#p
	defb 026h,070h,024h,070h,027h,070h,025h,070h,028h,070h,026h,070h,029h,0ffh,0a2h,06ah	; 6a7c  &p$p'p%p(p&p)..j
	defb 0b5h,06ah,0c8h,06ah,0dbh,06ah,0eeh,06ah,001h,06bh,014h,06bh,027h,06bh	; 6a8c  .j.j.j.j.k.k'k

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6a9a..0x6a9c  (2 bytes)
DATA_6A9A:
	defb 03ah,06bh	; 6a9a

; ----------------------------------------------------------------------
; DATOS sonido_6A9C: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x2D
;   (tools/partituras.py); lo leen p06:B51E (2 bytes)
;   0x6a9c..0x6a9e  (2 bytes)
DATA_sonido_6A9C:
	defb 03ah,06bh	; 6a9c

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6a9e..0x6aa0  (2 bytes)
DATA_6A9E:
	defb 04dh,06bh	; 6a9e

; ----------------------------------------------------------------------
; DATOS sonido_6AA0: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x2D
;   (tools/partituras.py); lo leen p06:B51E (18 bytes)
;   0x6aa0..0x6ab2  (18 bytes)
DATA_sonido_6AA0:
	defb 04dh,06bh,0e2h,004h,050h,035h,040h,035h,030h,035h,020h,035h,010h,035h,010h,035h	; 6aa0  Mk..P5@505 5.5.5
	defb 010h,035h	; 6ab0

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6ab2..0x6ab5  (3 bytes)
DATA_6AB2:
	defb 000h,035h,0ffh	; 6ab2

; ----------------------------------------------------------------------
; DATOS sonido_6AB5: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x2D
;   (tools/partituras.py); lo leen p06:B51E (10 bytes)
;   0x6ab5..0x6abf  (10 bytes)
DATA_sonido_6AB5:
	defb 0e2h,004h,050h,032h,040h,032h,030h,032h,020h,032h	; 6ab5  ..P2@202 2

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6abf..0x6ac8  (9 bytes)
DATA_6ABF:
	defb 010h,032h,010h,032h,010h,032h,000h,032h,0ffh	; 6abf  .2.2.2.2.

; ----------------------------------------------------------------------
; DATOS sonido_6AC8: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x2D
;   (tools/partituras.py); lo leen p06:B51E (29 bytes)
;   0x6ac8..0x6ae5  (29 bytes)
DATA_sonido_6AC8:
	defb 0e2h,004h,050h,02fh,040h,02fh,030h,02fh,020h,02fh,010h,02fh,010h,02fh,010h,02fh	; 6ac8  ..P/@/0/ /./././
	defb 000h,02fh,0ffh,0e2h,004h,050h,02ch,040h,02ch,030h,02ch,020h,02ch	; 6ad8  ./...P,@,0, ,

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6ae5..0x6aee  (9 bytes)
DATA_6AE5:
	defb 010h,02ch,010h,02ch,010h,02ch,000h,02ch,0ffh	; 6ae5  .,.,.,.,.

; ----------------------------------------------------------------------
; DATOS sonido_6AEE: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x2D
;   (tools/partituras.py); lo leen p06:B51E (16 bytes)
;   0x6aee..0x6afe  (16 bytes)
DATA_sonido_6AEE:
	defb 0e2h,004h,050h,02ah,040h,02ah,030h,02ah,020h,02ah,010h,02ah,010h,02ah,010h,02ah	; 6aee  ..P*@*0* *.*.*.*

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6afe..0x6b01  (3 bytes)
DATA_6AFE:
	defb 000h,02ah,0ffh	; 6afe

; ----------------------------------------------------------------------
; DATOS sonido_6B01: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x2D
;   (tools/partituras.py); lo leen p06:B51E (16 bytes)
;   0x6b01..0x6b11  (16 bytes)
DATA_sonido_6B01:
	defb 0e2h,004h,050h,028h,040h,028h,030h,028h,020h,028h,010h,028h,010h,028h,010h,028h	; 6b01  ..P(@(0( (.(.(.(

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6b11..0x6b14  (3 bytes)
DATA_6B11:
	defb 000h,028h,0ffh	; 6b11

; ----------------------------------------------------------------------
; DATOS sonido_6B14: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x2D
;   (tools/partituras.py); lo leen p06:B51E (16 bytes)
;   0x6b14..0x6b24  (16 bytes)
DATA_sonido_6B14:
	defb 0e2h,004h,050h,025h,040h,025h,030h,025h,020h,025h,010h,025h,010h,025h,010h,025h	; 6b14  ..P%@%0% %.%.%.%

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6b24..0x6b27  (3 bytes)
DATA_6B24:
	defb 000h,025h,0ffh	; 6b24

; ----------------------------------------------------------------------
; DATOS sonido_6B27: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x2D
;   (tools/partituras.py); lo leen p06:B51E (35 bytes)
;   0x6b27..0x6b4a  (35 bytes)
DATA_sonido_6B27:
	defb 0e2h,004h,050h,023h,040h,023h,030h,023h,020h,023h,010h,023h,010h,023h,010h,023h	; 6b27  ..P#@#0# #.#.#.#
	defb 000h,023h,0ffh,0e2h,004h,050h,01fh,040h,01fh,030h,01fh,020h,01fh,010h,01fh,010h	; 6b37  .#...P.@.0. ....
	defb 01fh,010h,01fh	; 6b47

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6b4a..0x6b4d  (3 bytes)
DATA_6B4A:
	defb 000h,01fh,0ffh	; 6b4a

; ----------------------------------------------------------------------
; DATOS sonido_6B4D: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x2D
;   (tools/partituras.py); lo leen p06:B51E (16 bytes)
;   0x6b4d..0x6b5d  (16 bytes)
DATA_sonido_6B4D:
	defb 0e2h,004h,050h,01ch,040h,01ch,030h,01ch,020h,01ch,010h,01ch,010h,01ch,010h,01ch	; 6b4d  ..P.@.0. .......

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6b5d..0x6b68  (11 bytes)
DATA_6B5D:
	defb 000h,01ch,0ffh,078h,06bh,078h,06bh,078h,06bh,078h,06bh	; 6b5d  ...xkxkxkxk

; ----------------------------------------------------------------------
; DATOS sonido_6B68: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x2D
;   (tools/partituras.py); lo leen p06:B51E (2 bytes)
;   0x6b68..0x6b6a  (2 bytes)
DATA_sonido_6B68:
	defb 078h,06bh	; 6b68

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6b6a..0x6b6c  (2 bytes)
DATA_6B6A:
	defb 08bh,06bh	; 6b6a

; ----------------------------------------------------------------------
; DATOS sonido_6B6C: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x2D
;   (tools/partituras.py); lo leen p06:B51E (4 bytes)
;   0x6b6c..0x6b70  (4 bytes)
DATA_sonido_6B6C:
	defb 08bh,06bh,09eh,06bh	; 6b6c

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6b70..0x6b72  (2 bytes)
DATA_6B70:
	defb 0b1h,06bh	; 6b70

; ----------------------------------------------------------------------
; DATOS sonido_6B72: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x2D
;   (tools/partituras.py); lo leen p06:B51E (22 bytes)
;   0x6b72..0x6b88  (22 bytes)
DATA_sonido_6B72:
	defb 0b1h,06bh,0c4h,06bh,0d7h,06bh,0e2h,004h,050h,054h,040h,054h,030h,054h,020h,054h	; 6b72  .k.k.k..PT@T0T T
	defb 010h,054h,010h,054h,010h,054h	; 6b82

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6b88..0x6b8b  (3 bytes)
DATA_6B88:
	defb 000h,054h,0ffh	; 6b88

; ----------------------------------------------------------------------
; DATOS sonido_6B8B: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x2D
;   (tools/partituras.py); lo leen p06:B51E (6 bytes)
;   0x6b8b..0x6b91  (6 bytes)
DATA_sonido_6B8B:
	defb 0e2h,004h,050h,04ah,040h,04ah	; 6b8b

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6b91..0x6b9e  (13 bytes)
DATA_6B91:
	defb 030h,04ah,020h,04ah,010h,04ah,010h,04ah,010h,04ah,000h,04ah,0ffh	; 6b91  0J J.J.J.J.J.

; ----------------------------------------------------------------------
; DATOS sonido_6B9E: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x2D
;   (tools/partituras.py); lo leen p06:B51E (16 bytes)
;   0x6b9e..0x6bae  (16 bytes)
DATA_sonido_6B9E:
	defb 0e2h,004h,050h,046h,040h,046h,030h,046h,020h,046h,010h,046h,010h,046h,010h,046h	; 6b9e  ..PF@F0F F.F.F.F

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6bae..0x6bb1  (3 bytes)
DATA_6BAE:
	defb 000h,046h,0ffh	; 6bae

; ----------------------------------------------------------------------
; DATOS sonido_6BB1: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x2D
;   (tools/partituras.py); lo leen p06:B51E (6 bytes)
;   0x6bb1..0x6bb7  (6 bytes)
DATA_sonido_6BB1:
	defb 0e2h,004h,050h,03fh,040h,03fh	; 6bb1

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6bb7..0x6bc4  (13 bytes)
DATA_6BB7:
	defb 030h,03fh,020h,03fh,010h,03fh,010h,03fh,010h,03fh,000h,03fh,0ffh	; 6bb7  0? ?.?.?.?.?.

; ----------------------------------------------------------------------
; DATOS sonido_6BC4: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x2D
;   (tools/partituras.py); lo leen p06:B51E (6 bytes)
;   0x6bc4..0x6bca  (6 bytes)
DATA_sonido_6BC4:
	defb 0e2h,004h,050h,03bh,040h,03bh	; 6bc4

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6bca..0x6bd7  (13 bytes)
DATA_6BCA:
	defb 030h,03bh,020h,03bh,010h,03bh,010h,03bh,010h,03bh,000h,03bh,0ffh	; 6bca  0. ..........

; ----------------------------------------------------------------------
; DATOS sonido_6BD7: datos de sonido (ordenes 0xD0-0xFE de p06:B92F, notas por
;   debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos 0x2D
;   (tools/partituras.py); lo leen p06:B51E (19 bytes)
;   0x6bd7..0x6bea  (19 bytes)
DATA_sonido_6BD7:
	defb 0e2h,004h,050h,038h,040h,038h,030h,038h,020h,038h,010h,038h,010h,038h,010h,038h	; 6bd7  ..P8@808 8.8.8.8
	defb 000h,038h,0ffh	; 6be7

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6bea..0x6c1c  (50 bytes)
DATA_6BEA:
	defb 002h,06ch,002h,06ch,002h,06ch,002h,06ch,002h,06ch,002h,06ch,002h,06ch,002h,06ch	; 6bea  .l.l.l.l.l.l.l.l
	defb 002h,06ch,002h,06ch,002h,06ch,002h,06ch,0ffh,01bh,06ch,01bh,06ch,01bh,06ch,01bh	; 6bfa  .l.l.l.l..l.l.l.
	defb 06ch,01bh,06ch,01bh,06ch,01bh,06ch,01bh,06ch,01bh,06ch,01bh,06ch,01bh,06ch,01bh	; 6c0a  l.l.l.l.l.l.l.l.
	defb 06ch,0ffh	; 6c1a

; ----------------------------------------------------------------------
; DATOS partitura_6C1C: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x2D (tools/partituras.py); lo leen p06:B51E (197 bytes)
;   0x6c1c..0x6ce1  (197 bytes)
DATA_partitura_6C1C:
	defb 0feh,004h,0d0h,0e9h,001h,033h,032h,033h,0e9h,007h,016h,0e9h,003h,030h,0e9h,004h	; 6c1c  .....323.....0..
	defb 030h,0e9h,007h,016h,0e9h,003h,030h,0e9h,004h,030h,0e9h,007h,012h,0fbh,002h,030h	; 6c2c  0.....0..0.....0
	defb 06ch,0e9h,003h,030h,0e9h,004h,030h,0e9h,006h,0b8h,0d0h,0e9h,007h,001h,031h,001h	; 6c3c  l..0..0.......1.
	defb 031h,001h,0e9h,001h,032h,033h,0e9h,007h,030h,031h,031h,0fbh,003h,046h,06ch,0e9h	; 6c4c  1...23..011..Fl.
	defb 001h,0d1h,072h,073h,0fbh,004h,05bh,06ch,0e9h,007h,0d1h,023h,023h,023h,0d0h,001h	; 6c5c  ..rs..[l...###..
	defb 031h,001h,031h,001h,0e9h,001h,0d1h,072h,073h,0e9h,007h,0d0h,030h,031h,031h,0fbh	; 6c6c  1.1....rs...011.
	defb 003h,06bh,06ch,0e9h,001h,0d1h,072h,073h,0fbh,008h,07fh,06ch,0e9h,007h,0d1h,023h	; 6c7c  .kl...rs...l...#
	defb 013h,0d0h,001h,031h,001h,031h,001h,0e9h,003h,030h,0e9h,004h,030h,0e9h,007h,030h	; 6c8c  ...1.1...0..0..0
	defb 031h,031h,0fbh,003h,08eh,06ch,0d1h,0e9h,001h,072h,073h,0fbh,004h,0a2h,06ch,0e9h	; 6c9c  11...l...rs...l.
	defb 007h,0d1h,023h,023h,023h,0e9h,007h,0d1h,021h,0d0h,031h,001h,031h,001h,0e9h,001h	; 6cac  ..###...!.1.1...
	defb 032h,033h,0e9h,007h,030h,031h,031h,0fbh,002h,0b3h,06ch,001h,031h,001h,031h,001h	; 6cbc  23..011...l.1.1.
	defb 0e9h,001h,032h,033h,0e9h,007h,030h,031h,031h,001h,031h,001h,031h,001h,030h,030h	; 6ccc  ..23..011.1.1.00
	defb 0d1h,023h,0fdh,046h,06ch	; 6cdc

; ----------------------------------------------------------------------
; DATOS partitura_6CE1: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x2D (tools/partituras.py); lo leen p06:B51E (379 bytes)
;   0x6ce1..0x6e5c  (379 bytes)
DATA_partitura_6CE1:
	defb 0feh,001h,0e9h,001h,0c6h,0eah,00bh,0d5h,090h,0a0h,0b0h,0e9h,007h,0eah,00dh,0ebh	; 6ce1  ................
	defb 002h,053h,0d4h,003h,0d5h,070h,060h,070h,0d4h,000h,043h,000h,0d5h,0b0h,0d4h,000h	; 6cf1  .S...p`p..C.....
	defb 040h,071h,070h,070h,071h,071h,0eah,006h,0d0h,0e9h,004h,0c0h,0eeh,005h,070h,090h	; 6d01  @qppqq........p.
	defb 070h,090h,070h,090h,070h,090h,070h,090h,070h,090h,0e9h,003h,070h,0efh,0feh,001h	; 6d11  p.p.p.p.p...p...
	defb 0e9h,007h,0ebh,070h,070h,0eah,00eh,0d3h,001h,0eah,008h,0d2h,001h,0eah,00eh,0d4h	; 6d21  ...pp...........
	defb 071h,0eah,009h,0d2h,001h,0fbh,004h,026h,06dh,0eah,00eh,0d3h,001h,0eah,009h,0d2h	; 6d31  q......&m.......
	defb 001h,0eah,00eh,0d4h,0b1h,0eah,009h,0d3h,0b1h,0eah,00eh,0d4h,091h,0eah,009h,0d3h	; 6d41  ................
	defb 091h,0eah,00eh,0d4h,041h,0eah,009h,0d3h,041h,0eah,00eh,0d4h,0b1h,0eah,009h,0d3h	; 6d51  ....A...A.......
	defb 0b1h,0eah,00eh,0d4h,071h,0eah,009h,0d3h,0b1h,0fbh,006h,05ah,06dh,0eah,00eh,0d4h	; 6d61  ....q......Zm...
	defb 0b1h,0eah,009h,0d3h,0b1h,0eah,00eh,0d4h,091h,0eah,009h,0d3h,091h,0eah,00eh,0d4h	; 6d71  ................
	defb 071h,0eah,009h,0d3h,071h,0eah,00eh,0d4h,021h,0eah,009h,0d3h,021h,0eah,00eh,0d3h	; 6d81  q...q...!...!...
	defb 001h,0eah,009h,0d2h,001h,0eah,00eh,0d4h,0b1h,0eah,009h,0d3h,0b1h,0eah,00eh,0d4h	; 6d91  ................
	defb 091h,0eah,009h,0d3h,091h,0eah,00eh,0d4h,071h,0eah,009h,0d3h,071h,0eah,00eh,0d3h	; 6da1  ........q...q...
	defb 001h,0eah,009h,0d2h,001h,0eah,00eh,0d4h,071h,0eah,009h,0d2h,001h,0fbh,004h,0aeh	; 6db1  ........q.......
	defb 06dh,0eah,00eh,0d3h,001h,0eah,009h,0d2h,001h,0eah,00eh,0d4h,0b1h,0eah,009h,0d3h	; 6dc1  m...............
	defb 0b1h,0eah,00eh,0d4h,091h,0eah,009h,0d3h,091h,0eah,00eh,0d4h,041h,0eah,009h,0d3h	; 6dd1  ............A...
	defb 041h,0eah,00eh,0d4h,0b1h,0eah,009h,0d3h,0b1h,0eah,00eh,0d4h,071h,0eah,009h,0d3h	; 6de1  A...........q...
	defb 0b1h,0fbh,002h,0e2h,06dh,0eah,00eh,0d4h,021h,0eah,008h,0d2h,021h,0eah,00eh,0d5h	; 6df1  ....m...!...!...
	defb 091h,0eah,008h,0d2h,021h,0fbh,002h,0f6h,06dh,0eah,00dh,0d4h,071h,0eah,008h,0d2h	; 6e01  ....!...m...q...
	defb 021h,0eah,00eh,0d4h,021h,0eah,008h,0d2h,021h,0fbh,002h,00ah,06eh,0eah,00dh,0d4h	; 6e11  !...!...!...n...
	defb 021h,0eah,008h,0d2h,021h,0eah,00eh,0d4h,091h,0eah,008h,0d2h,021h,0fbh,002h,01eh	; 6e21  !...!.......!...
	defb 06eh,0eah,00eh,0d4h,071h,0eah,008h,0d2h,021h,0eah,00eh,0d5h,021h,0eah,008h,0d2h	; 6e31  n...q...!...!...
	defb 021h,0eah,00eh,0d4h,071h,0eah,008h,0d2h,021h,0feh,001h,0feh,004h,0e9h,001h,0d1h	; 6e41  !...q...!.......
	defb 073h,072h,073h,072h,073h,072h,073h,072h,0fdh,01fh,06dh	; 6e51  srsrsrsr..m

; ----------------------------------------------------------------------
; DATOS partitura_6E5C: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x2D (tools/partituras.py); lo leen p06:B51E (150 bytes)
;   0x6e5c..0x6ef2  (150 bytes)
DATA_partitura_6E5C:
	defb 0feh,001h,0e9h,009h,0c0h,0feh,004h,0e9h,007h,0d1h,007h,007h,013h,013h,007h,0feh	; 6e5c  ................
	defb 008h,0e9h,007h,0d0h,003h,003h,003h,0e9h,001h,022h,003h,0e9h,007h,0d1h,0b0h,0d0h	; 6e6c  ........."......
	defb 000h,020h,043h,043h,043h,040h,030h,040h,070h,093h,073h,052h,040h,031h,041h,053h	; 6e7c  . CCC@0@p.sR@1AS
	defb 043h,023h,003h,0d1h,0b3h,0b3h,0b3h,0e9h,001h,0d0h,002h,0d1h,0b3h,0e9h,007h,0a0h	; 6e8c  C#..............
	defb 0b0h,0d0h,000h,023h,023h,023h,020h,000h,020h,040h,053h,093h,072h,020h,011h,021h	; 6e9c  ...### . @S.r .!
	defb 043h,0d1h,073h,043h,073h,0d0h,003h,003h,003h,0e9h,001h,022h,003h,0e9h,007h,0d1h	; 6eac  C.sCs......"....
	defb 0b0h,0d0h,000h,020h,043h,043h,003h,040h,030h,040h,070h,043h,073h,052h,040h,031h	; 6ebc  ... CC.@0@pCsR@1
	defb 041h,027h,0d1h,0b7h,0d0h,093h,0d1h,090h,060h,090h,0d0h,020h,063h,023h,0d0h,0b3h	; 6ecc  A'......`.. c#..
	defb 0d1h,0b0h,070h,0b0h,0d0h,020h,073h,023h,020h,010h,020h,030h,040h,030h,040h,050h	; 6edc  ..p.. s# . 0@0@P
	defb 063h,0b3h,07fh,0fdh,06bh,06eh	; 6eec

; ----------------------------------------------------------------------
; DATOS partitura_6EF2: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x2D (tools/partituras.py); lo leen p06:B51E (375 bytes)
;   0x6ef2..0x7069  (375 bytes)
DATA_partitura_6EF2:
	defb 0feh,001h,0f8h,00bh,0e9h,001h,0c6h,0d2h,0eah,007h,090h,0a0h,0b0h,0e9h,007h,0eah	; 6ef2  ................
	defb 00bh,0ebh,03ah,015h,0d3h,000h,0e9h,001h,0ech,0eah,002h,0d4h,0b1h,091h,081h,071h	; 6f02  ..:............q
	defb 06bh,0e9h,007h,0ebh,03ah,021h,0eah,00bh,0d4h,070h,060h,070h,0d3h,000h,0ebh,038h	; 6f12  k...:!...p`p...8
	defb 031h,041h,0c1h,000h,0d4h,0b0h,0d3h,000h,040h,070h,0c0h,070h,070h,070h,0c0h,070h	; 6f22  1A......@p.ppp.p
	defb 0c0h,071h,0f8h,026h,0eah,00eh,0ebh,068h,031h,0d5h,051h,041h,021h,0f8h,013h,0e9h	; 6f32  .q.&...h1.QA!...
	defb 007h,0ebh,070h,070h,0eah,00eh,0d4h,001h,0eah,008h,0d2h,001h,0eah,00dh,0d5h,071h	; 6f42  ..pp...........q
	defb 0eah,008h,0d2h,001h,0fbh,004h,046h,06fh,0eah,00dh,0d4h,001h,0eah,008h,0d2h,001h	; 6f52  ......Fo........
	defb 0eah,00dh,0d5h,0b1h,0eah,008h,0d3h,0b1h,0eah,00dh,0d5h,091h,0eah,008h,0d3h,091h	; 6f62  ................
	defb 0eah,00dh,0d5h,041h,0eah,008h,0d3h,041h,0eah,00dh,0d5h,0b1h,0eah,008h,0d3h,0b1h	; 6f72  ...A...A........
	defb 0eah,00dh,0d5h,071h,0eah,008h,0d3h,0b1h,0fbh,006h,07ah,06fh,0eah,00dh,0d5h,0b1h	; 6f82  ...q......zo....
	defb 0eah,008h,0d3h,0b1h,0eah,00dh,0d5h,091h,0eah,008h,0d3h,091h,0eah,00dh,0d5h,071h	; 6f92  ...............q
	defb 0eah,008h,0d3h,071h,0eah,00dh,0d5h,021h,0eah,008h,0d3h,021h,0eah,00dh,0d4h,001h	; 6fa2  ...q...!...!....
	defb 0eah,008h,0d2h,001h,0eah,00dh,0d5h,0b1h,0eah,008h,0d3h,0b1h,0eah,00dh,0d5h,091h	; 6fb2  ................
	defb 0eah,008h,0d3h,091h,0eah,00dh,0d5h,071h,0eah,008h,0d3h,071h,0eah,00eh,0d4h,001h	; 6fc2  .......q...q....
	defb 0eah,008h,0d2h,001h,0eah,00dh,0d5h,071h,0eah,008h,0d2h,001h,0fbh,004h,0ceh,06fh	; 6fd2  .......q.......o
	defb 0eah,00dh,0d4h,001h,0eah,008h,0d2h,001h,0eah,00dh,0d5h,0b1h,0eah,008h,0d3h,0b1h	; 6fe2  ................
	defb 0eah,00dh,0d5h,091h,0eah,008h,0d3h,091h,0eah,00dh,0d5h,041h,0eah,008h,0d3h,041h	; 6ff2  ...........A...A
	defb 0eah,00dh,0d5h,0b1h,0eah,008h,0d3h,0b1h,0eah,00dh,0d5h,071h,0eah,008h,0d3h,0b1h	; 7002  ...........q....
	defb 0fbh,002h,002h,070h,0eah,00eh,0d4h,021h,0eah,008h,0d2h,021h,0eah,00eh,0d5h,091h	; 7012  ...p...!...!....
	defb 0eah,008h,0d2h,021h,0fbh,002h,016h,070h,0eah,00dh,0d4h,071h,0eah,008h,0d2h,021h	; 7022  ...!...p...q...!
	defb 0eah,00eh,0d4h,021h,0eah,008h,0d2h,021h,0fbh,002h,02ah,070h,0eah,00dh,0d4h,021h	; 7032  ...!...!..*p...!
	defb 0eah,008h,0d2h,021h,0eah,00eh,0d5h,091h,0eah,008h,0d2h,021h,0fbh,002h,03eh,070h	; 7042  ...!.......!..>p
	defb 0eah,00eh,0d4h,071h,0eah,008h,0d2h,021h,0eah,00eh,0d4h,021h,0eah,008h,0d2h,021h	; 7052  ...q...!...!...!
	defb 0fbh,002h,052h,070h,0fdh,03fh,06fh	; 7062

; ----------------------------------------------------------------------
; DATOS partitura_7069: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x2D (tools/partituras.py); lo leen p06:B51E (234 bytes)
;   0x7069..0x7153  (234 bytes)
DATA_partitura_7069:
	defb 0feh,001h,0e9h,009h,0c0h,0feh,004h,0e9h,007h,0f8h,028h,0d1h,037h,037h,033h,033h	; 7069  ..........(.7733
	defb 037h,0feh,001h,0f8h,013h,0e9h,007h,0eah,008h,0ebh,048h,07dh,0d2h,003h,003h,003h	; 7079  7.........H}....
	defb 0e9h,001h,022h,003h,0e9h,007h,0d3h,0b0h,0d2h,000h,020h,043h,043h,043h,040h,030h	; 7089  .."....... CCC@0
	defb 040h,070h,0ebh,048h,041h,0f2h,00fh,0f1h,053h,092h,0c0h,0f3h,0f0h,073h,052h,000h	; 7099  @p.HA...S....sR.
	defb 0d3h,0b1h,0d2h,001h,0ebh,007h,023h,0d2h,02fh,0ebh,048h,07dh,0d3h,0b3h,0b3h,0b3h	; 70a9  ......#./.H}....
	defb 0e9h,001h,0d2h,002h,0d3h,0b3h,0e9h,007h,0a0h,0b0h,0d2h,000h,023h,023h,023h,020h	; 70b9  ............###
	defb 000h,020h,040h,0ebh,048h,041h,0f2h,00fh,0f1h,053h,072h,0c0h,0f3h,0f0h,053h,022h	; 70c9  . @.HA...Sr...S"
	defb 0d3h,0b0h,0a1h,0b1h,0ebh,007h,023h,0eah,007h,0d2h,07fh,0e9h,007h,0eah,008h,0ebh	; 70d9  ......#.........
	defb 048h,07dh,0d2h,003h,003h,003h,0e9h,001h,022h,003h,0e9h,007h,0d3h,0b0h,0d2h,000h	; 70e9  H}......".......
	defb 020h,043h,043h,043h,040h,030h,040h,070h,0ebh,048h,041h,0f2h,00fh,0f1h,053h,092h	; 70f9   CCC@0@p.HA...S.
	defb 0c0h,0f3h,0f0h,073h,052h,000h,0d3h,0b1h,0d2h,001h,0ebh,007h,023h,0d2h,02fh,0ebh	; 7109  ...sR.......#./.
	defb 048h,07dh,0d2h,061h,0c1h,0d3h,090h,060h,090h,0d2h,020h,061h,0c1h,021h,0c1h,0d2h	; 7119  H}.a...`.. a.!..
	defb 071h,0c1h,0d3h,0b0h,070h,0b0h,0d2h,020h,071h,0c1h,021h,0c1h,0d3h,090h,080h,090h	; 7129  q...p.. q.!.....
	defb 0b0h,0d2h,000h,0d3h,0b0h,0d2h,000h,010h,0eah,00ah,021h,0c1h,071h,0c1h,02bh,0feh	; 7139  ..........!.q.+.
	defb 001h,0feh,004h,0d1h,0f8h,028h,033h,0fdh,07ah,070h	; 7149  .....(3.zp

; ----------------------------------------------------------------------
; DATOS partitura_7153: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x2D (tools/partituras.py); lo leen p06:B51E (369 bytes)
;   0x7153..0x72c4  (369 bytes)
DATA_partitura_7153:
	defb 0feh,001h,0f8h,002h,0e9h,001h,0ech,0eah,007h,0c6h,0d1h,090h,0a0h,0b0h,0e9h,007h	; 7153  ................
	defb 0eah,007h,0ebh,034h,041h,0d0h,002h,0c0h,0d1h,070h,060h,070h,0d0h,000h,041h,0c1h	; 7163  ...4A....p`p..A.
	defb 000h,0d1h,0b0h,0d0h,000h,040h,070h,0c0h,070h,070h,070h,0c0h,070h,0c0h,0f8h,005h	; 7173  .....@p.ppp.p...
	defb 0e9h,004h,0eah,009h,070h,090h,070h,090h,070h,090h,070h,0fbh,002h,088h,071h,0e9h	; 7183  ....p.p.p.p...q.
	defb 001h,092h,0feh,001h,0f8h,00ah,0e9h,007h,0ebh,070h,070h,0eah,00ah,0d2h,001h,0d3h	; 7193  .........pp.....
	defb 041h,071h,041h,0fbh,004h,09eh,071h,0f8h,013h,0ech,0d2h,0eah,001h,041h,0eah,002h	; 71a3  AqA...q......A..
	defb 041h,0eah,003h,041h,0eah,004h,047h,0eah,005h,040h,0eah,004h,040h,0eah,003h,051h	; 71b3  A..A..G..@..@..Q
	defb 0eah,002h,051h,0eah,004h,051h,0eah,006h,057h,0eah,004h,050h,0eah,002h,050h,0f8h	; 71c3  ..Q..Q..W..P..P.
	defb 00ah,0ebh,070h,070h,0eah,00ah,0d3h,0b1h,051h,071h,051h,0fbh,004h,0d7h,071h,0f8h	; 71d3  ..pp....QqQ...q.
	defb 013h,0ech,0d2h,0eah,001h,051h,0eah,002h,051h,0eah,003h,051h,0eah,004h,057h,0eah	; 71e3  .....Q..Q..Q..W.
	defb 005h,050h,0eah,003h,050h,0eah,002h,041h,0eah,003h,041h,0eah,004h,041h,0eah,006h	; 71f3  .P..P..A..A..A..
	defb 047h,0eah,004h,040h,0eah,002h,040h,0feh,001h,0f8h,013h,0e9h,007h,0eah,008h,0ebh	; 7203  G..@..@.........
	defb 000h,033h,0f2h,00fh,0f1h,052h,0eah,008h,0d2h,005h,0ebh,00ch,030h,0e9h,001h,003h	; 7213  .3...R......0...
	defb 004h,004h,0e9h,007h,0ebh,000h,033h,005h,0e9h,001h,0ebh,00ch,030h,003h,004h,004h	; 7223  ......3.....0...
	defb 0e9h,007h,0ebh,000h,033h,045h,0e9h,001h,0ebh,00ch,030h,003h,004h,004h,0e9h,007h	; 7233  ....3E....0.....
	defb 0ebh,000h,033h,005h,0ebh,00ch,030h,0e9h,001h,003h,004h,004h,0e9h,007h,0ebh,000h	; 7243  ..3...0.........
	defb 033h,043h,073h,052h,040h,031h,041h,02fh,0feh,001h,0feh,004h,0e9h,007h,0d1h,0f8h	; 7253  3CsR@1A/........
	defb 028h,031h,0feh,001h,0f8h,013h,0ech,0d3h,0eah,002h,061h,0eah,003h,061h,0eah,004h	; 7263  (1........a..a..
	defb 061h,0eah,005h,061h,0eah,006h,061h,0eah,005h,061h,0eah,004h,061h,0feh,001h,0feh	; 7273  a..a..a..a..a...
	defb 004h,0d1h,0f8h,028h,031h,0feh,001h,0f8h,013h,0d3h,0eah,002h,0b1h,0eah,003h,0b1h	; 7283  ...(1...........
	defb 0eah,004h,0b1h,0eah,005h,0b1h,0eah,006h,0b1h,0eah,005h,0b1h,0eah,004h,0b1h,0ebh	; 7293  ................
	defb 028h,032h,0eah,00bh,0d3h,021h,020h,020h,021h,020h,020h,023h,063h,0ebh,028h,072h	; 72a3  (2...!  !  #c.(r
	defb 0eah,00bh,0d2h,071h,021h,0d3h,0b1h,0d2h,021h,0ebh,027h,071h,0d3h,077h,0fdh,095h	; 72b3  ...q!...!.'q.w..
	defb 071h	; 72c3

; ----------------------------------------------------------------------
; DATOS partitura_72C4: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x2D (tools/partituras.py); lo leen p06:B51E (290 bytes)
;   0x72c4..0x73e6  (290 bytes)
DATA_partitura_72C4:
	defb 0feh,001h,0f8h,029h,0e9h,001h,0eah,00ch,0ebh,02ah,020h,0d2h,0c6h,090h,0a0h,0b0h	; 72c4  ...).....* .....
	defb 0e9h,007h,0eah,00ch,0d1h,000h,0e9h,001h,0ech,0eah,001h,0d2h,0b1h,091h,081h,071h	; 72d4  ...............q
	defb 06bh,0e9h,007h,0ebh,02ah,020h,0eah,00ch,0d2h,070h,060h,070h,0d1h,000h,040h,0ech	; 72e4  k...* ...p`p..@.
	defb 0eah,001h,042h,0ebh,02ah,020h,0eah,00ch,000h,0d2h,0b0h,0d1h,000h,040h,070h,0c0h	; 72f4  ..B.* .......@p.
	defb 070h,070h,070h,0c0h,070h,0c0h,071h,051h,041h,021h,0feh,001h,0f8h,029h,0e9h,007h	; 7304  ppp.p.qQA!...)..
	defb 0eah,00eh,0ebh,048h,07dh,0d2h,043h,043h,043h,0e9h,001h,052h,043h,0e9h,007h,030h	; 7314  ...H}.CCC..RC..0
	defb 040h,050h,073h,073h,073h,070h,060h,070h,0b0h,0ebh,048h,061h,0f2h,00fh,0f1h,053h	; 7324  @Psssp`p..Ha...S
	defb 0d1h,002h,0c0h,0f3h,0f0h,0d2h,0b3h,092h,040h,031h,041h,0feh,001h,0feh,004h,0f8h	; 7334  ........@1A.....
	defb 028h,0d1h,053h,033h,043h,033h,0feh,001h,0f8h,002h,0eah,00dh,0ebh,048h,07dh,0d2h	; 7344  (.S3C3.......H}.
	defb 023h,023h,023h,0e9h,001h,042h,023h,0e9h,007h,010h,020h,040h,053h,053h,053h,050h	; 7354  ###..B#... @SSSP
	defb 040h,050h,070h,0ebh,048h,061h,0f2h,00fh,0f1h,053h,0b2h,0c0h,0f3h,0f0h,093h,072h	; 7364  @Pp.Ha...S.....r
	defb 020h,011h,021h,0feh,001h,0feh,004h,0f8h,028h,0d1h,053h,033h,043h,033h,0feh,001h	; 7374   .!.....(.S3C3..
	defb 0f8h,002h,0e9h,007h,0eah,00eh,0ebh,048h,07dh,0d2h,043h,043h,043h,0e9h,001h,052h	; 7384  .......H}.CCC..R
	defb 043h,0e9h,007h,030h,040h,050h,073h,073h,073h,070h,060h,070h,0b0h,0d1h,002h,0c0h	; 7394  C..0@Psssp`p....
	defb 0d2h,0b2h,0c0h,092h,070h,061h,071h,0feh,001h,0feh,004h,0f8h,028h,0d1h,053h,033h	; 73a4  ....paq.....(.S3
	defb 043h,033h,0feh,001h,0f8h,002h,0d2h,091h,0c1h,020h,0d3h,090h,0d2h,020h,060h,091h	; 73b4  C3....... ... `.
	defb 0c1h,021h,0c1h,0b1h,0c1h,020h,0d3h,0b0h,0d2h,020h,070h,0b1h,0c1h,071h,0c1h,020h	; 73c4  .!... ... p..q.
	defb 010h,020h,030h,040h,030h,040h,050h,061h,0c1h,0b1h,0c1h,0ebh,047h,071h,07fh,0fdh	; 73d4  . 0@0@Pa....Gq..
	defb 00eh,073h	; 73e4

; ----------------------------------------------------------------------
; DATOS partitura_73E6: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x2D (tools/partituras.py); lo leen p06:B51E (301 bytes)
;   0x73e6..0x7513  (301 bytes)
DATA_partitura_73E6:
	defb 0feh,001h,0e9h,001h,0cch,0e9h,007h,0eah,006h,0ebh,011h,012h,0d1h,000h,0c2h,0d2h	; 73e6  ................
	defb 070h,060h,070h,0d1h,000h,040h,0c2h,000h,0d2h,0b0h,0d1h,0e9h,001h,009h,0ebh,02ah	; 73f6  p`p..@.........*
	defb 020h,0eah,00dh,0e9h,007h,0d2h,020h,0c0h,020h,020h,020h,0c0h,020h,0c0h,021h,001h	; 7406   ..... .   . .!.
	defb 0d3h,0b1h,091h,0e9h,001h,0cdh,0e9h,007h,0eah,004h,0eeh,001h,0ebh,000h,012h,0d2h	; 7416  ................
	defb 043h,043h,043h,0e9h,001h,052h,043h,0e9h,007h,030h,040h,050h,073h,073h,073h,070h	; 7426  CCC..RC..0@Psssp
	defb 060h,070h,0b0h,0f2h,00fh,0f1h,053h,0d1h,003h,0f3h,0f0h,0d2h,0b2h,0c0h,092h,040h	; 7436  `p....S........@
	defb 0e9h,001h,03ch,0e9h,007h,0f8h,023h,0ebh,068h,021h,0eah,00bh,0d4h,0b2h,070h,061h	; 7446  ..<...#.h!....pa
	defb 071h,091h,0d5h,071h,061h,071h,0e9h,001h,0ceh,0e9h,007h,0f8h,02bh,0ebh,000h,012h	; 7456  q..qaq......+...
	defb 0eah,004h,0d2h,023h,023h,023h,0e9h,001h,042h,023h,0e9h,007h,010h,020h,040h,053h	; 7466  ...###..B#... @S
	defb 053h,053h,050h,040h,050h,070h,0f2h,00fh,0f1h,053h,0b3h,0f3h,0f0h,092h,0c0h,072h	; 7476  SSP@Pp...S.....r
	defb 020h,0e9h,001h,01ch,0e9h,007h,0f8h,028h,0ebh,068h,021h,0eah,00ah,0d4h,042h,0d3h	; 7486   ......(.h!...B.
	defb 000h,0d4h,0b1h,091h,0eah,00bh,071h,0d5h,051h,041h,021h,0e9h,001h,0cdh,0e9h,007h	; 7496  ......q.QA!.....
	defb 0eah,005h,0eeh,001h,0ebh,000h,012h,0d2h,043h,043h,043h,0e9h,001h,052h,043h,0e9h	; 74a6  ........CCC..RC.
	defb 007h,030h,040h,050h,073h,073h,073h,070h,060h,070h,0b0h,0d1h,002h,0c0h,0d2h,0b2h	; 74b6  .0@Psssp`p......
	defb 0c0h,092h,070h,0e9h,001h,06ch,0e9h,007h,0ebh,068h,021h,0eah,00bh,0d4h,022h,040h	; 74c6  ..p..l...h!..."@
	defb 021h,071h,041h,021h,0d5h,0b1h,071h,0e9h,001h,0cdh,0e9h,007h,0eah,005h,0ebh,000h	; 74d6  !qA!..q.........
	defb 022h,0d2h,091h,0c1h,020h,0d3h,090h,0d2h,020h,060h,091h,0c1h,021h,0c1h,0b1h,0c1h	; 74e6  "... ... `..!...
	defb 020h,0d3h,0b0h,0d2h,020h,070h,0b1h,0c1h,071h,0c1h,020h,010h,020h,030h,040h,030h	; 74f6   ... p..q. . 0@0
	defb 040h,050h,061h,0c1h,0b1h,0c1h,07bh,0e9h,001h,0cfh,0fdh,019h,074h	; 7506  @Pa...{.....t

; ----------------------------------------------------------------------
; DATOS partitura_7513: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x2E, 0x2F (tools/partituras.py); lo leen p06:B51E (178 bytes)
;   0x7513..0x75c5  (178 bytes)
DATA_partitura_7513:
	defb 0feh,004h,0e9h,004h,0d1h,065h,070h,070h,070h,070h,070h,070h,070h,070h,070h,070h	; 7513  .....epppppppppp
	defb 070h,070h,070h,070h,070h,070h,070h,070h,0fbh,002h,017h,075h,065h,070h,070h,070h	; 7523  pppppppp...ueppp
	defb 070h,070h,070h,0fbh,002h,02fh,075h,065h,063h,0d0h,000h,000h,030h,030h,031h,031h	; 7533  ppp../uec...0011
	defb 033h,031h,0fbh,007h,043h,075h,030h,030h,031h,031h,033h,031h,0fbh,003h,04dh,075h	; 7543  31..Cu001131..Mu
	defb 030h,030h,031h,031h,033h,031h,0fbh,003h,057h,075h,030h,030h,031h,031h,033h,031h	; 7553  001131..Wu001131
	defb 0fbh,007h,061h,075h,030h,030h,031h,031h,033h,031h,030h,030h,031h,031h,033h,031h	; 7563  ..au001131001131
	defb 030h,030h,031h,031h,033h,030h,030h,0fbh,002h,077h,075h,033h,030h,030h,031h,031h	; 7573  0011300..wu30011
	defb 031h,033h,031h,0fbh,007h,084h,075h,030h,030h,031h,031h,033h,031h,0fbh,003h,08eh	; 7583  131...u001131...
	defb 075h,030h,030h,031h,031h,033h,031h,0fbh,003h,098h,075h,030h,030h,031h,031h,033h	; 7593  u001131...u00113
	defb 031h,0fbh,007h,0a2h,075h,030h,030h,031h,031h,033h,031h,030h,030h,031h,031h,033h	; 75a3  1...u00113100113
	defb 031h,030h,030h,031h,031h,033h,030h,030h,0fbh,002h,0b8h,075h,033h,030h,030h,031h	; 75b3  10011300...u3001
	defb 031h,031h	; 75c3

; ----------------------------------------------------------------------
; DATOS partitura_75C5: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x2E, 0x2F (tools/partituras.py); lo leen p06:B51E (51 bytes)
;   0x75c5..0x75f8  (51 bytes)
DATA_partitura_75C5:
	defb 0feh,004h,0d0h,0e9h,004h,033h,031h,030h,030h,030h,030h,030h,030h,0fbh,002h,0cah	; 75c5  .....31000000...
	defb 075h,033h,031h,0fbh,003h,0d6h,075h,030h,030h,030h,030h,030h,030h,033h,031h,030h	; 75d5  u31...u000000310
	defb 030h,030h,030h,030h,030h,0fbh,002h,0e2h,075h,033h,031h,0fbh,002h,0eeh,075h,033h	; 75e5  00000...u31...u3
	defb 0fdh,07fh,075h	; 75f5

; ----------------------------------------------------------------------
; DATOS partitura_75F8: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x2E, 0x2F (tools/partituras.py); lo leen p06:B51E (252 bytes)
;   0x75f8..0x76f4  (252 bytes)
DATA_partitura_75F8:
	defb 0feh,004h,0e9h,008h,0d0h,078h,0e9h,007h,0feh,001h,0e9h,004h,0eah,009h,0ebh,007h	; 75f8  .....x..........
	defb 0f5h,0d2h,053h,041h,0feh,004h,075h,0feh,001h,079h,061h,053h,041h,0feh,004h,071h	; 7608  ..SA..u..yaSA..q
	defb 0feh,001h,051h,061h,073h,061h,0feh,004h,071h,0feh,001h,051h,041h,033h,021h,0feh	; 7618  ..Qasa..q..QA3!.
	defb 004h,071h,0feh,001h,0c3h,0feh,004h,071h,0feh,001h,0c7h,0ebh,005h,0f5h,0eah,00ah	; 7628  .q.....q........
	defb 0d4h,051h,051h,041h,051h,043h,071h,003h,071h,053h,091h,003h,091h,053h,0a1h,023h	; 7638  .QQAQCq.qS...S.#
	defb 0a1h,053h,0a1h,0d5h,0a3h,0d4h,0a1h,053h,091h,003h,091h,0fbh,002h,04fh,076h,053h	; 7648  .S.....S.....OvS
	defb 0a1h,0d5h,0a3h,0d4h,0a1h,023h,0a1h,053h,0a1h,043h,071h,003h,071h,053h,091h,003h	; 7658  .....#.S.Cq.qS..
	defb 091h,053h,0a1h,023h,0a1h,053h,0a1h,0d5h,0a3h,0d4h,0a1h,003h,051h,0d5h,093h,0d4h	; 7668  .S.#.S......Q...
	defb 051h,0d5h,073h,0d4h,051h,003h,051h,0feh,004h,071h,0feh,001h,0c1h,091h,0feh,004h	; 7678  Q.s.Q.Q..q......
	defb 071h,0feh,001h,0c1h,091h,0feh,004h,073h,0feh,001h,0e9h,004h,0eah,00ah,0ebh,005h	; 7688  q......s........
	defb 0f5h,0d4h,051h,051h,041h,051h,043h,071h,003h,071h,053h,091h,003h,091h,053h,0a1h	; 7698  ..QQAQCq.qS...S.
	defb 023h,0a1h,053h,0a1h,0d5h,0a3h,0d4h,0a1h,053h,091h,003h,091h,0fbh,002h,0b0h,076h	; 76a8  #.S.....S......v
	defb 053h,0a1h,0d5h,0a3h,0d4h,0a1h,023h,0a1h,053h,0a1h,043h,071h,003h,071h,053h,091h	; 76b8  S.....#.S.Cq.qS.
	defb 003h,091h,053h,0a1h,023h,0a1h,053h,0a1h,0d5h,0a3h,0d4h,0a1h,003h,051h,0d5h,093h	; 76c8  ..S.#.S......Q..
	defb 0d4h,051h,0d5h,073h,0d4h,051h,003h,051h,0feh,004h,071h,0feh,001h,0c1h,091h,0feh	; 76d8  .Q.s.Q.Q..q.....
	defb 004h,071h,0feh,001h,0c1h,091h,0feh,004h,071h,0feh,001h,0c9h	; 76e8  .q......q...

; ----------------------------------------------------------------------
; DATOS partitura_76F4: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x2E, 0x2F (tools/partituras.py); lo leen p06:B51E (18 bytes)
;   0x76f4..0x7706  (18 bytes)
DATA_partitura_76F4:
	defb 0feh,004h,0d0h,0e9h,004h,07bh,07bh,075h,075h,07bh,07bh,07bh,075h,075h,073h,0fdh	; 76f4  .....{{uu{{{uus.
	defb 090h,076h	; 7704

; ----------------------------------------------------------------------
; DATOS partitura_7706: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x2E, 0x2F (tools/partituras.py); lo leen p06:B51E (225 bytes)
;   0x7706..0x77e7  (225 bytes)
DATA_partitura_7706:
	defb 0feh,004h,0e9h,004h,0f8h,028h,0d1h,045h,0feh,001h,0eah,008h,0ebh,042h,010h,0d4h	; 7706  .....(.E.....B..
	defb 079h,061h,053h,041h,0feh,004h,0d1h,045h,0feh,001h,0eah,009h,0d5h,079h,061h,053h	; 7716  yaSA...E.....yaS
	defb 041h,0feh,004h,0d1h,045h,0feh,001h,0d5h,073h,061h,0feh,004h,0d1h,045h,0feh,001h	; 7726  A...E...sa...E..
	defb 0d5h,033h,021h,0feh,004h,0d1h,045h,049h,0feh,001h,0eah,008h,0ebh,025h,0f5h,0d4h	; 7736  .3!...EI.....%..
	defb 051h,051h,041h,051h,043h,071h,003h,071h,053h,091h,003h,091h,053h,0a1h,023h,0a1h	; 7746  QQAQCq.qS...S.#.
	defb 053h,0a1h,0d5h,0a3h,0d4h,0a1h,053h,091h,003h,091h,0fbh,002h,05ch,077h,053h,0a1h	; 7756  S.....S.....\wS.
	defb 0d5h,0a3h,0d4h,0a1h,023h,0a1h,053h,0a1h,043h,071h,003h,071h,053h,091h,003h,091h	; 7766  ....#.S.Cq.qS...
	defb 053h,0a1h,023h,0a1h,053h,0a1h,0d5h,0a3h,0d4h,0a1h,003h,051h,0d5h,093h,0d4h,051h	; 7776  S.#.S......Q...Q
	defb 0d5h,073h,0d4h,051h,003h,051h,053h,091h,003h,091h,053h,0feh,001h,0e9h,004h,0eah	; 7786  .s.Q.QS...S.....
	defb 008h,0ebh,025h,0f5h,0d4h,051h,051h,041h,051h,043h,071h,003h,071h,053h,091h,003h	; 7796  ..%..QQAQCq.qS..
	defb 091h,053h,0a1h,023h,0a1h,053h,0a1h,0d5h,0a3h,0d4h,0a1h,053h,091h,003h,091h,0fbh	; 77a6  .S.#.S.....S....
	defb 002h,0b1h,077h,053h,0a1h,0d5h,0a3h,0d4h,0a1h,023h,0a1h,053h,0a1h,043h,071h,003h	; 77b6  ..wS.....#.S.Cq.
	defb 071h,053h,091h,003h,091h,053h,0a1h,023h,0a1h,053h,0a1h,0d5h,0a3h,0d4h,0a1h,003h	; 77c6  qS...S.#.S......
	defb 051h,0d5h,093h,0d4h,051h,0d5h,073h,0d4h,051h,003h,051h,053h,091h,003h,091h,051h	; 77d6  Q...Q.s.Q.QS...Q
	defb 0c9h	; 77e6

; ----------------------------------------------------------------------
; DATOS partitura_77E7: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x2E, 0x2F (tools/partituras.py); lo leen p06:B51E (20 bytes)
;   0x77e7..0x77fb  (20 bytes)
DATA_partitura_77E7:
	defb 0feh,004h,0e9h,004h,0f8h,028h,0d1h,04bh,04bh,045h,045h,04bh,04bh,04bh,045h,045h	; 77e7  .....(.KKEEKKKEE
	defb 043h,0fdh,091h,077h	; 77f7

; ----------------------------------------------------------------------
; DATOS partitura_77FB: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x2E, 0x2F (tools/partituras.py); lo leen p06:B51E (199 bytes)
;   0x77fb..0x78c2  (199 bytes)
DATA_partitura_77FB:
	defb 0feh,001h,0f8h,013h,0e9h,004h,0eah,007h,0ebh,027h,0f5h,0d2h,003h,011h,029h,011h	; 77fb  .........'....).
	defb 003h,0d3h,0b1h,0fbh,002h,006h,078h,0d2h,003h,011h,023h,011h,003h,0d3h,0b1h,0a3h	; 780b  ......x...#.....
	defb 091h,071h,0c3h,0d2h,001h,0c7h,0f8h,007h,0eah,007h,0ebh,023h,022h,0d2h,050h,0eah	; 781b  .q.........#".P.
	defb 008h,070h,0eah,009h,051h,041h,051h,041h,0c3h,045h,031h,0c3h,035h,051h,0c3h,059h	; 782b  .p..QAQA.E1.5Q.Y
	defb 021h,021h,041h,051h,003h,011h,023h,011h,003h,001h,001h,0d3h,0b1h,0d2h,001h,0fbh	; 783b  !!AQ..#.........
	defb 002h,03fh,078h,041h,0c3h,045h,031h,0c3h,035h,051h,0c3h,059h,021h,021h,041h,051h	; 784b  .?xA.E1.5Q.Y!!AQ
	defb 0d2h,003h,001h,001h,021h,041h,043h,041h,041h,051h,071h,0feh,004h,0f8h,028h,0d1h	; 785b  ....!ACAAQq...(.
	defb 045h,045h,043h,0feh,001h,0f8h,007h,0e9h,004h,0eah,007h,0ebh,023h,022h,0d2h,050h	; 786b  EEC.........#".P
	defb 0eah,006h,070h,0eah,009h,051h,041h,051h,041h,0c3h,045h,031h,0c3h,035h,051h,0c3h	; 787b  ..p..QAQA.E1.5Q.
	defb 059h,021h,021h,041h,051h,003h,011h,023h,011h,003h,001h,001h,0d3h,0b1h,0d2h,001h	; 788b  Y!!AQ..#........
	defb 0fbh,002h,090h,078h,041h,0c3h,045h,031h,0c3h,035h,051h,0c3h,059h,021h,021h,041h	; 789b  ...xA.E1.5Q.Y!!A
	defb 051h,0d2h,003h,001h,001h,001h,021h,043h,041h,041h,051h,071h,0feh,004h,0f8h,028h	; 78ab  Q.....!CAAQq...(
	defb 0d1h,045h,045h,043h,0feh,001h,0c7h	; 78bb

; ----------------------------------------------------------------------
; DATOS partitura_78C2: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x2E, 0x2F (tools/partituras.py); lo leen p06:B51E (17 bytes)
;   0x78c2..0x78d3  (17 bytes)
DATA_partitura_78C2:
	defb 0feh,001h,0e9h,004h,0cbh,0cbh,0c5h,0c5h,0cbh,0cbh,0cbh,0c5h,0c5h,0c3h,0fdh,06eh	; 78c2  ...............n
	defb 078h	; 78d2

; ----------------------------------------------------------------------
; DATOS partitura_78D3: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x2E, 0x2F (tools/partituras.py); lo leen p06:B51E (222 bytes)
;   0x78d3..0x79b1  (222 bytes)
DATA_partitura_78D3:
	defb 0feh,001h,0f8h,013h,0e9h,004h,0eah,00ah,0ebh,047h,0f5h,0d2h,053h,061h,079h,061h	; 78d3  .........G..Saya
	defb 053h,041h,0fbh,002h,0dfh,078h,053h,061h,073h,061h,053h,041h,033h,021h,001h,0c3h	; 78e3  SA...xSasaSA3!..
	defb 051h,0c7h,0eah,00ch,0ebh,028h,042h,0d2h,051h,051h,041h,051h,071h,0c3h,075h,091h	; 78f3  Q....(B.QQAQq.u.
	defb 0c3h,095h,0d1h,001h,0c3h,0d2h,0a9h,0a1h,0a1h,091h,071h,053h,061h,073h,061h,053h	; 7903  ..........qSasaS
	defb 051h,051h,041h,051h,0fbh,002h,00eh,079h,071h,0c3h,075h,091h,0c3h,095h,0d1h,001h	; 7913  QQAQ...yq.u.....
	defb 0c3h,0d2h,0a9h,0a1h,0a1h,0d1h,001h,0d2h,0a1h,093h,091h,091h,0a1h,0b1h,0d1h,003h	; 7923  ................
	defb 001h,001h,021h,041h,051h,0e9h,002h,0c4h,0eah,003h,000h,020h,040h,0d1h,0eah,007h	; 7933  ..!AQ...... @...
	defb 053h,0c4h,0eah,003h,000h,020h,040h,0eah,007h,053h,0c3h,0feh,001h,0f8h,013h,0e9h	; 7943  S.... @..S......
	defb 004h,0eah,00ch,0ebh,048h,042h,0d2h,051h,051h,041h,051h,071h,0c3h,075h,091h,0c3h	; 7953  ....HB.QQAQq.u..
	defb 095h,0d1h,001h,0c3h,0d2h,0a9h,0a1h,0a1h,091h,071h,053h,061h,073h,061h,053h,051h	; 7963  .........qSasaSQ
	defb 051h,041h,051h,0fbh,002h,06dh,079h,071h,0c3h,075h,091h,0c3h,095h,0d1h,001h,0c3h	; 7973  QAQ..myq.u......
	defb 0d2h,0a9h,0a1h,0a1h,0d1h,001h,0d2h,0a1h,093h,091h,091h,0a1h,0b1h,0d1h,003h,001h	; 7983  ................
	defb 001h,021h,041h,051h,0e9h,002h,0c4h,0eah,003h,000h,020h,040h,0d2h,0eah,007h,053h	; 7993  .!AQ...... @...S
	defb 0c4h,0eah,003h,000h,020h,040h,0e9h,008h,0eah,007h,050h,0e9h,004h,0c9h	; 79a3  .... @....P...

; ----------------------------------------------------------------------
; DATOS partitura_79B1: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x2E, 0x2F (tools/partituras.py); lo leen p06:B51E (17 bytes)
;   0x79b1..0x79c2  (17 bytes)
DATA_partitura_79B1:
	defb 0feh,001h,0e9h,004h,0cbh,0cbh,0c5h,0c5h,0cbh,0cbh,0cbh,0c5h,0c5h,0c3h,0fdh,04eh	; 79b1  ...............N
	defb 079h	; 79c1

; ----------------------------------------------------------------------
; DATOS partitura_79C2: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x2E, 0x2F (tools/partituras.py); lo leen p06:B51E (184 bytes)
;   0x79c2..0x7a7a  (184 bytes)
DATA_partitura_79C2:
	defb 0feh,001h,0e9h,004h,0eah,004h,0eeh,001h,0c2h,0ebh,000h,012h,0d2h,053h,061h,079h	; 79c2  .............Say
	defb 061h,053h,041h,0fbh,002h,0cfh,079h,053h,061h,073h,061h,053h,041h,033h,021h,001h	; 79d2  aSA...ySasaSA3!.
	defb 0c3h,051h,0c7h,0eah,005h,0d2h,051h,051h,041h,051h,071h,0c3h,075h,091h,0c3h,095h	; 79e2  .Q....QQAQq.u...
	defb 0d1h,001h,0c3h,0d2h,0a9h,0a1h,0a1h,091h,071h,053h,061h,073h,061h,053h,051h,051h	; 79f2  ........qSasaSQQ
	defb 041h,051h,0fbh,002h,0fbh,079h,071h,0c3h,075h,091h,0c3h,095h,0d1h,001h,0c0h,0ebh	; 7a02  AQ...yq.u.......
	defb 028h,042h,0efh,0eah,00bh,0d3h,055h,075h,095h,053h,051h,051h,061h,071h,093h,091h	; 7a12  (B....Uu.SQQaq..
	defb 091h,0a1h,0b1h,0d2h,005h,0d3h,005h,053h,0feh,001h,0e9h,004h,0eeh,001h,0eah,005h	; 7a22  .......S........
	defb 0ebh,000h,012h,0c2h,0d2h,051h,051h,041h,051h,071h,0c3h,075h,091h,0c3h,095h,0d1h	; 7a32  .....QQAQq.u....
	defb 001h,0c3h,0d2h,0a9h,0a1h,0a1h,091h,071h,053h,061h,073h,061h,053h,051h,051h,041h	; 7a42  .......qSasaSQQA
	defb 051h,0fbh,002h,04ah,07ah,071h,0c3h,075h,091h,0c3h,095h,0d1h,001h,0c0h,0ebh,028h	; 7a52  Q..Jzq.u.......(
	defb 042h,0efh,0eah,00bh,0d3h,055h,075h,095h,053h,051h,051h,061h,071h,093h,091h,091h	; 7a62  B....Uu.SQQaq...
	defb 0a1h,0b1h,0d2h,005h,0d3h,005h,053h,0c7h	; 7a72  ......S.

; ----------------------------------------------------------------------
; DATOS partitura_7A7A: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x2E, 0x2F (tools/partituras.py); lo leen p06:B51E (18 bytes)
;   0x7a7a..0x7a8c  (18 bytes)
DATA_partitura_7A7A:
	defb 0feh,001h,0d1h,0e9h,004h,0cbh,0cbh,0c5h,0c5h,0cbh,0cbh,0cbh,0c5h,0c5h,0c3h,0fdh	; 7a7a  ................
	defb 02ah,07ah	; 7a8a

; ----------------------------------------------------------------------
; DATOS partitura_7A8C: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x30 (tools/partituras.py); lo leen p06:B51E (17 bytes)
;   0x7a8c..0x7a9d  (17 bytes)
DATA_partitura_7A8C:
	defb 0feh,004h,0d0h,0e9h,006h,077h,077h,073h,073h,077h,077h,077h,073h,073h,073h,07fh	; 7a8c  .....wwsswwwsss.
	defb 0ffh	; 7a9c

; ----------------------------------------------------------------------
; DATOS partitura_7A9D: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x30 (tools/partituras.py); lo leen p06:B51E (24 bytes)
;   0x7a9d..0x7ab5  (24 bytes)
DATA_partitura_7A9D:
	defb 0feh,001h,0e9h,008h,0eah,00ch,0ebh,003h,002h,0d3h,092h,092h,0d2h,002h,002h,022h	; 7a9d  ..............."
	defb 052h,042h,042h,0fbh,002h,0a7h,07ah,0ffh	; 7aad  RBB...z.

; ----------------------------------------------------------------------
; DATOS partitura_7AB5: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x30 (tools/partituras.py); lo leen p06:B51E (12 bytes)
;   0x7ab5..0x7ac1  (12 bytes)
DATA_partitura_7AB5:
	defb 0feh,002h,0e0h,020h,0f9h,070h,0aeh,0fch,002h,0b9h,07ah,0ffh	; 7ab5  ... .p....z.

; ----------------------------------------------------------------------
; DATOS partitura_7AC1: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x30 (tools/partituras.py); lo leen p06:B51E (26 bytes)
;   0x7ac1..0x7adb  (26 bytes)
DATA_partitura_7AC1:
	defb 0feh,001h,0f8h,00dh,0e9h,008h,0eah,00bh,0ebh,012h,002h,0d2h,002h,002h,0d2h,042h	; 7ac1  ...............B
	defb 042h,052h,092h,072h,072h,0fbh,002h,0cch,07ah,0ffh	; 7ad1  BR.rr...z.

; ----------------------------------------------------------------------
; DATOS partitura_7ADB: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x30 (tools/partituras.py); lo leen p06:B51E (19 bytes)
;   0x7adb..0x7aee  (19 bytes)
DATA_partitura_7ADB:
	defb 0feh,004h,0d1h,0e9h,006h,0f8h,028h,047h,047h,043h,043h,047h,047h,047h,043h,043h	; 7adb  ......(GGCCGGGCC
	defb 043h,04fh,0ffh	; 7aeb

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7aee..0x7aef  (1 bytes)
DATA_7AEE:
	defb 0ffh	; 7aee

; ----------------------------------------------------------------------
; DATOS partitura_7AEF: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x30 (tools/partituras.py); lo leen p06:B51E (29 bytes)
;   0x7aef..0x7b0c  (29 bytes)
DATA_partitura_7AEF:
	defb 0feh,001h,0f8h,023h,0e9h,008h,0eah,00fh,0ebh,00bh,020h,0d4h,052h,062h,072h,092h	; 7aef  ...#...... .Rbr.
	defb 022h,072h,002h,042h,052h,062h,072h,092h,022h,072h,002h,002h,0ffh	; 7aff  "r.BRbr."r...

; ----------------------------------------------------------------------
; DATOS partitura_7B0C: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x30 (tools/partituras.py); lo leen p06:B51E (87 bytes)
;   0x7b0c..0x7b63  (87 bytes)
DATA_partitura_7B0C:
	defb 0feh,001h,0f8h,002h,0e9h,008h,0eah,00ch,0ebh,032h,004h,0d2h,090h,050h,090h,0d1h	; 7b0c  .........2...P..
	defb 000h,0d2h,090h,0d1h,000h,040h,030h,040h,090h,040h,000h,050h,040h,020h,0d2h,091h	; 7b1c  .....@0@.@.P@ ..
	defb 0b0h,0d1h,000h,0d2h,040h,070h,0d1h,000h,040h,070h,0d1h,090h,050h,090h,0d0h,000h	; 7b2c  ....@p..@p..P...
	defb 0d1h,090h,0d0h,000h,040h,030h,040h,090h,040h,000h,050h,040h,020h,0d1h,091h,0b0h	; 7b3c  ....@0@.@.P@ ...
	defb 0eah,009h,0f8h,023h,0d0h,001h,0d1h,0e9h,001h,0c2h,040h,050h,060h,070h,080h,090h	; 7b4c  ...#......@P`p..
	defb 0a0h,0b0h,0e9h,006h,0d0h,002h,0ffh	; 7b5c

; ----------------------------------------------------------------------
; DATOS partitura_7B63: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x30 (tools/partituras.py); lo leen p06:B51E (85 bytes)
;   0x7b63..0x7bb8  (85 bytes)
DATA_partitura_7B63:
	defb 0feh,001h,0e9h,008h,0eah,009h,0ebh,032h,004h,0d2h,050h,000h,050h,090h,060h,090h	; 7b63  .......2..P.P.`.
	defb 0d1h,000h,0d2h,0b0h,0d1h,000h,040h,000h,0d2h,090h,0d1h,020h,000h,0d2h,090h,051h	; 7b73  ......@.... ...Q
	defb 050h,040h,000h,040h,070h,0d1h,000h,040h,0eah,009h,0d2h,050h,000h,050h,090h,060h	; 7b83  P@.@p..@...P.P.`
	defb 090h,0d1h,000h,0d2h,0b0h,0d1h,000h,040h,000h,0d2h,090h,0d1h,020h,000h,0d2h,090h	; 7b93  .......@.... ...
	defb 051h,050h,041h,0eah,008h,0e9h,001h,0c2h,080h,090h,0a0h,0b0h,0d1h,000h,020h,030h	; 7ba3  QPA........... 0
	defb 040h,0e9h,006h,042h,0ffh	; 7bb3

; ----------------------------------------------------------------------
; DATOS partitura_7BB8: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x31 (tools/partituras.py); lo leen p06:B51E (99 bytes)
;   0x7bb8..0x7c1b  (99 bytes)
DATA_partitura_7BB8:
	defb 0feh,004h,0e9h,004h,0d0h,047h,037h,047h,037h,047h,037h,047h,037h,047h,037h,047h	; 7bb8  .....G7G7G7G7G7G
	defb 037h,047h,037h,047h,020h,0d1h,070h,070h,070h,070h,070h,070h,070h,0fbh,002h,0bch	; 7bc8  7G7G .ppppppp...
	defb 07bh,0d0h,047h,037h,047h,035h,041h,047h,037h,047h,035h,041h,047h,037h,047h,035h	; 7bd8  {.G7G5AG7G5AG7G5
	defb 041h,047h,037h,047h,020h,0d1h,070h,070h,070h,070h,070h,070h,070h,0fbh,002h,0d9h	; 7be8  AG7G .ppppppp...
	defb 07bh,0d0h,04fh,04fh,04fh,047h,0d1h,070h,070h,070h,070h,070h,070h,070h,070h,0d0h	; 7bf8  {.OOOG.pppppppp.
	defb 04fh,04fh,04fh,0d1h,070h,070h,070h,070h,0d0h,033h,033h,0d1h,070h,070h,070h,070h	; 7c08  OOO.pppp.33.pppp
	defb 0fdh,0bch,07bh	; 7c18

; ----------------------------------------------------------------------
; DATOS partitura_7C1B: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x31 (tools/partituras.py); lo leen p06:B51E (128 bytes)
;   0x7c1b..0x7c9b  (128 bytes)
DATA_partitura_7C1B:
	defb 0feh,001h,0e9h,008h,0ebh,028h,042h,0eah,00dh,0eah,00eh,0ebh,028h,062h,0d4h,023h	; 7c1b  .....(B.....(b.#
	defb 0d5h,093h,0fbh,004h,029h,07ch,0d4h,073h,022h,070h,093h,042h,090h,023h,0d5h,093h	; 7c2b  ....)|.s"p.B.#..
	defb 0b3h,0d4h,013h,0d4h,023h,0d5h,093h,0fbh,004h,03eh,07ch,0d4h,073h,022h,070h,093h	; 7c3b  ....#....>|.s"p.
	defb 042h,090h,023h,0d5h,093h,0d4h,023h,063h,0ebh,028h,072h,0eah,00dh,0d5h,073h,023h	; 7c4b  B.#...#c.(r...s#
	defb 073h,022h,070h,093h,043h,093h,042h,090h,0a3h,063h,0a3h,062h,0a0h,0b3h,063h,0b3h	; 7c5b  s"p.C.B..c.b..c.
	defb 0eah,00eh,0eeh,004h,0d4h,023h,043h,0d5h,0b3h,0d4h,043h,0d5h,0b2h,0d4h,040h,063h	; 7c6b  .....#C...C...@c
	defb 013h,063h,012h,060h,073h,023h,073h,022h,070h,093h,043h,013h,0d5h,093h,0d4h,077h	; 7c7b  .c.`s#s"p.C....w
	defb 067h,047h,023h,063h,0ebh,027h,071h,077h,067h,047h,093h,013h,0efh,0fdh,024h,07ch	; 7c8b  gG#c.'qwgG....$|

; ----------------------------------------------------------------------
; DATOS partitura_7C9B: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x31 (tools/partituras.py); lo leen p06:B51E (39 bytes)
;   0x7c9b..0x7cc2  (39 bytes)
DATA_partitura_7C9B:
	defb 0feh,004h,0e9h,008h,0d0h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h	; 7c9b  ................
	defb 003h,003h,003h,003h,0d1h,023h,0fbh,004h,09fh,07ch,027h,027h,027h,023h,023h,027h	; 7cab  .....#...|'''##'
	defb 027h,027h,023h,023h,0fdh,09fh,07ch	; 7cbb

; ----------------------------------------------------------------------
; DATOS partitura_7CC2: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x31 (tools/partituras.py); lo leen p06:B51E (175 bytes)
;   0x7cc2..0x7d71  (175 bytes)
DATA_partitura_7CC2:
	defb 0feh,004h,0e9h,008h,0feh,001h,0f8h,013h,0ebh,024h,041h,0eah,00ah,0d2h,023h,013h	; 7cc2  .........$A...#.
	defb 0d3h,0b3h,093h,067h,023h,063h,0b5h,0b0h,0b0h,0d2h,015h,010h,010h,0d3h,093h,043h	; 7cd2  ...g#c.........C
	defb 063h,073h,0d2h,023h,013h,0d3h,0b3h,093h,067h,027h,0b5h,0b0h,0b0h,0d2h,015h,020h	; 7ce2  cs.#....g'.....
	defb 040h,027h,0d3h,023h,063h,0ebh,027h,071h,0eah,00ah,0eeh,001h,0d2h,029h,0f8h,007h	; 7cf2  @'.#c.'q.....)..
	defb 0d3h,021h,0eah,009h,021h,0eah,007h,021h,0f8h,013h,0eah,00ah,0d2h,019h,0f8h,007h	; 7d02  .!..!..!........
	defb 0d3h,011h,0eah,009h,011h,0eah,007h,011h,0f8h,007h,0eah,00ah,0d3h,017h,067h,0d2h	; 7d12  ..............g.
	defb 047h,027h,0eah,00ah,0f8h,013h,0d3h,0b9h,0f8h,007h,0d3h,071h,0eah,009h,071h,0eah	; 7d22  G'.........q..q.
	defb 007h,071h,0f8h,013h,0eah,00ah,0d2h,019h,0f8h,007h,0d3h,091h,0eah,009h,091h,0eah	; 7d32  .q..............
	defb 007h,091h,0f8h,013h,0eah,00ah,0d2h,027h,0f8h,007h,0d3h,023h,073h,0f8h,013h,0d2h	; 7d42  .......'...#s...
	defb 097h,043h,013h,0ebh,027h,071h,0eah,00ah,0d2h,023h,072h,020h,063h,023h,043h,073h	; 7d52  .C..'q...#r c#Cs
	defb 063h,023h,023h,072h,020h,023h,063h,073h,0b3h,093h,093h,0efh,0fdh,0c6h,07ch	; 7d62  c##r #cs......|

; ----------------------------------------------------------------------
; DATOS partitura_7D71: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x31 (tools/partituras.py); lo leen p06:B51E (127 bytes)
;   0x7d71..0x7df0  (127 bytes)
DATA_partitura_7D71:
	defb 0feh,001h,0e9h,008h,0f8h,013h,0ebh,028h,082h,0eah,00dh,0eah,00eh,0ebh,028h,072h	; 7d71  .......(......(r
	defb 0d4h,023h,0d5h,093h,0fbh,004h,081h,07dh,0d4h,073h,022h,070h,093h,042h,090h,023h	; 7d81  .#.....}.s"p.B.#
	defb 0d5h,093h,0b3h,0d4h,013h,0d4h,023h,0d5h,093h,0fbh,004h,096h,07dh,0d4h,073h,022h	; 7d91  ......#.....}.s"
	defb 070h,093h,042h,090h,023h,0d5h,093h,0d4h,023h,063h,0ebh,028h,072h,0eah,00eh,0d4h	; 7da1  p.B.#...#c.(r...
	defb 073h,023h,073h,022h,070h,093h,043h,093h,042h,090h,0a3h,063h,0a3h,062h,0a0h,0b3h	; 7db1  s#s"p.C.B..c.b..
	defb 063h,0b3h,0d4h,023h,043h,0d5h,0b3h,0d4h,043h,0d5h,0b2h,0d4h,040h,063h,013h,063h	; 7dc1  c..#C...C...@c.c
	defb 012h,060h,073h,023h,073h,022h,070h,093h,043h,013h,0d5h,093h,0eah,00dh,0ebh,027h	; 7dd1  .`s#s"p.C......'
	defb 071h,0d4h,077h,067h,047h,023h,063h,077h,067h,047h,093h,013h,0fdh,07ch,07dh	; 7de1  q.wgG#cwgG...|}

; ----------------------------------------------------------------------
; DATOS partitura_7DF0: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x31 (tools/partituras.py); lo leen p06:B51E (120 bytes)
;   0x7df0..0x7e68  (120 bytes)
DATA_partitura_7DF0:
	defb 0feh,001h,0e9h,008h,0f8h,007h,0ebh,028h,042h,0eah,00ch,0eah,00eh,0d3h,025h,071h	; 7df0  .......(B.....%q
	defb 065h,0d4h,091h,0d3h,021h,0b3h,093h,073h,060h,020h,0b3h,072h,0b0h,0d2h,013h,0d3h	; 7e00  e...!..s` .r....
	defb 092h,0d2h,010h,023h,013h,0d3h,0b3h,093h,025h,071h,065h,0d4h,091h,0d3h,021h,0b3h	; 7e10  ...#....%qe...!.
	defb 093h,073h,060h,020h,0b5h,090h,070h,0d2h,015h,020h,010h,063h,023h,0d3h,093h,063h	; 7e20  .s` ..p.. .c#..c
	defb 0ebh,027h,071h,0eah,00bh,0d3h,0b7h,077h,097h,047h,067h,0a7h,0b7h,063h,023h,077h	; 7e30  .'q....w.Gg..c#w
	defb 0b7h,097h,0d2h,017h,02bh,073h,047h,013h,0d3h,093h,0feh,004h,0f8h,028h,0d1h,057h	; 7e40  ....+sG......(.W
	defb 057h,057h,053h,053h,057h,057h,057h,0feh,001h,0e9h,008h,0f8h,007h,0ebh,028h,042h	; 7e50  WWSSWWW.......(B
	defb 0eah,00ch,0d3h,093h,043h,0fdh,0fbh,07dh	; 7e60  ....C..}

; ----------------------------------------------------------------------
; DATOS partitura_7E68: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x31 (tools/partituras.py); lo leen p06:B51E (157 bytes)
;   0x7e68..0x7f05  (157 bytes)
DATA_partitura_7E68:
	defb 0feh,001h,0e9h,008h,0f8h,013h,0ebh,028h,032h,0eah,00ch,0f2h,00fh,0f1h,043h,0f3h	; 7e68  .......(2.....C.
	defb 0f0h,0f2h,00fh,0f1h,043h,0ebh,028h,031h,0d2h,065h,0b1h,095h,021h,061h,0d1h,023h	; 7e78  ....C.(1.e..!a.#
	defb 013h,0d2h,0b3h,090h,060h,073h,022h,070h,093h,042h,090h,067h,025h,0d3h,091h,0d2h	; 7e88  ....`s"p.B.g%...
	defb 065h,0b1h,095h,021h,061h,0d1h,023h,013h,0d2h,0b3h,090h,060h,075h,060h,040h,095h	; 7e98  e..!a.#....`u`@.
	defb 0b0h,0d1h,010h,02fh,0f3h,0f0h,0f8h,015h,0ebh,027h,071h,0eah,00dh,0f2h,00fh,0f1h	; 7ea8  .../.....'q.....
	defb 043h,0d3h,0b9h,0b1h,0d2h,011h,021h,045h,011h,017h,0d3h,0a5h,0d2h,015h,062h,010h	; 7eb8  C.....!E......b.
	defb 045h,021h,025h,0d3h,0b1h,0d2h,049h,0d3h,0b1h,0d2h,041h,071h,065h,011h,067h,079h	; 7ec8  E!%...I...Aqe.gy
	defb 071h,0b1h,0d1h,021h,015h,0d2h,091h,097h,0f8h,013h,0ebh,027h,071h,0eah,00ch,0b3h	; 7ed8  q..!.......'q...
	defb 0d1h,022h,0d2h,070h,093h,063h,073h,0b3h,093h,063h,0b3h,0d1h,022h,0d2h,0b0h,093h	; 7ee8  .".p.cs..c.."...
	defb 0d1h,013h,0d2h,0b3h,0d1h,043h,023h,013h,0f3h,0f0h,0fdh,077h,07eh	; 7ef8  .....C#....w~

; ----------------------------------------------------------------------
; DATOS partitura_7F05: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x31 (tools/partituras.py); lo leen p06:B51E (150 bytes)
;   0x7f05..0x7f9b  (150 bytes)
DATA_partitura_7F05:
	defb 0feh,001h,0e9h,004h,0ebh,000h,022h,0eah,006h,0eeh,001h,0c2h,0e9h,008h,0f2h,00fh	; 7f05  ......".........
	defb 0f1h,043h,0f3h,0f0h,0f2h,00fh,0f1h,043h,0e9h,008h,0d2h,065h,0b1h,095h,021h,061h	; 7f15  .C.....C...e..!a
	defb 0d1h,023h,013h,0d2h,0b3h,090h,060h,073h,022h,070h,093h,042h,090h,067h,025h,0d3h	; 7f25  .#....`s"p.B.g%.
	defb 091h,0d2h,065h,0b1h,095h,021h,061h,0d1h,023h,013h,0d2h,0b3h,090h,060h,075h,060h	; 7f35  ..e..!a.#....`u`
	defb 040h,095h,0b0h,0d1h,010h,02fh,0f3h,0f0h,0ebh,000h,022h,0eah,006h,0f2h,00fh,0f1h	; 7f45  @..../....".....
	defb 043h,0d3h,0b9h,0b1h,0d2h,011h,021h,045h,011h,017h,0d3h,0a5h,0d2h,015h,062h,010h	; 7f55  C.....!E......b.
	defb 045h,021h,025h,0d3h,0b1h,0d2h,049h,0d3h,0b1h,0d2h,041h,071h,065h,011h,067h,079h	; 7f65  E!%...I...Aqe.gy
	defb 071h,0b1h,0d1h,021h,015h,0d2h,091h,097h,0b3h,0d1h,022h,0d2h,070h,093h,063h,073h	; 7f75  q..!......".p.cs
	defb 0b3h,093h,063h,0b3h,0d1h,022h,0d2h,0b0h,093h,0d1h,013h,0d2h,0b3h,0d1h,043h,023h	; 7f85  ..c.."........C#
	defb 013h,0f3h,0f0h,0fdh,017h,07fh	; 7f95

; ----------------------------------------------------------------------
; DATOS partitura_7F9B: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3B (tools/partituras.py); lo leen p06:B51E (5 bytes)
;   0x7f9b..0x7fa0  (5 bytes)
DATA_partitura_7F9B:
	defb 0feh,002h,0f9h,02bh,082h	; 7f9b

; ----------------------------------------------------------------------
; DATOS partitura_7FA0: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x32, 0x33, 0x3B (tools/partituras.py); lo leen p06:B51E (39 bytes)
;   0x7fa0..0x7fc7  (39 bytes)
DATA_partitura_7FA0:
	defb 0feh,002h,0feh,004h,0d0h,0e9h,006h,093h,093h,097h,087h,087h,083h,083h,087h,087h	; 7fa0  ................
	defb 087h,083h,083h,087h,0fbh,002h,0aah,07fh,093h,093h,097h,093h,093h,097h,093h,093h	; 7fb0  ................
	defb 093h,093h,097h,097h,0fdh,0aah,07fh	; 7fc0

; ----------------------------------------------------------------------
; DATOS partitura_7FC7: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x3B (tools/partituras.py); lo leen p06:B51E (5 bytes)
;   0x7fc7..0x7fcc  (5 bytes)
DATA_partitura_7FC7:
	defb 0feh,002h,0f9h,04eh,082h	; 7fc7

; ----------------------------------------------------------------------
; DATOS partitura_7FCC: partitura de canal (ordenes 0xD0-0xFE de p06:B92F,
;   notas por debajo, 0xFF acaba) que lee el motor de p06 al tocar los sonidos
;   0x32, 0x33, 0x3B (tools/partituras.py); lo leen p06:B51E (52 bytes)
;   0x7fcc..0x8000  (52 bytes)
DATA_partitura_7FCC:
	defb 0feh,004h,0d0h,0e9h,006h,083h,083h,087h,0feh,001h,0eah,00ch,0ebh,017h,0f5h,0d5h	; 7fcc  ................
	defb 047h,047h,097h,097h,067h,067h,047h,047h,047h,047h,093h,093h,097h,0b7h,037h,043h	; 7fdc  GG..ggGGGG....7C
	defb 043h,047h,0feh,004h,0d0h,083h,083h,087h,083h,083h,087h,083h,083h,083h,083h,087h	; 7fec  CG..............
	defb 087h,0fdh,0d4h,07fh	; 7ffc
