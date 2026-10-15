# The Pro Yakyuu Gekitotsu Pennant Race (RC-757) — desensamblado comentado

*(Also available [in English](README.md).)*

**[→ Leerlo en la web](https://antxiko.github.io/PennantRace-disassembly/es/)**

Desensamblado completo y comentado de *The Pro Yakyuu Gekitotsu Pennant Race*
(THEプロ野球 激突ペナントレース), el béisbol de Konami para MSX2 (1988): RC-757,
MegaROM de 128 KB con el SCC.

Seis equipos de serie, partidos contra el ordenador o entre dos, una liga de
hasta seis jugadores (PENNANT) y un editor de equipos (TEAM EDIT) que graba en
disco o en la SRAM del Game Master 2.

| | |
|---|---|
| binario explicado | **100 %**, 131.072 de 131.072 bytes |
| código trazado | 50.191 bytes |
| datos identificados | 80.881 bytes |
| rutinas | 2.933, **ninguna floja** |
| densidad de comentario | **43,7 %** |
| imágenes dibujadas | 29, 8 de ellas animadas (GIF); cotejadas con la VRAM de openMSX en todo lo que sale en sus volcados |
| músicas | 26, cotejadas con openMSX |
| textos | 100, sacados de la ROM |
| tests | 12 |

## Reproducirlo

El cartucho no se distribuye. Pon tu copia en la raíz como `pennantrace.rom`
(sha256 `6576a4cfdd38…`) y:

    make verify    # reensambla los 16 bancos y los compara byte a byte
    make sanity    # comprueba el trazado
    make web       # genera la web

## Las imágenes y la música

Ninguna imagen es una captura: se dibujan leyendo las tablas del cartucho y
están cotejadas contra la VRAM de openMSX; cada una dice cuánto coincide. Las
músicas salen de ejecutar su propio motor de sonido y coinciden con openMSX
cuadro a cuadro.

Ver [AVISO-LEGAL.md](AVISO-LEGAL.md) y [LICENSE](LICENSE).
