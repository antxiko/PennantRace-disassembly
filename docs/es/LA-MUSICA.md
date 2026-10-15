# La música

26 piezas. El motor de sonido (banco 6, con las partituras en el 5 y la
tabla de 72 sonidos en `p04:600C`) lleva ocho canales: los tres del PSG y los
cinco del SCC. La cabecera de cada sonido dice qué canales usa: las músicas
usan 6 u 8 y los efectos solo dos, el 3 del PSG y el 1 del SCC. Un canal toma
un sonido nuevo si su prioridad no es menor que la del que suena
(`p06:B305`).

Durante el partido, la música de fondo depende de la base más adelantada que
esté ocupada y de quién batea (`p00:5E74`, `p00:5E7A`): ocho temas, más los
de la séptima entrada. El home run son dos peticiones seguidas: la 0x2C (PSG y
un canal del SCC) y la 0x3F (los otros tres del SCC). F5 quita y pone la
música.

Las piezas no se han reescrito: se ejecuta el propio motor del cartucho en un
Z80 de Python (`tools/musica.py`) y lo que escribe en el PSG y en el SCC se
pasa a sonido. Cada una se ha cotejado con openMSX (`tools/omsx_psg.tcl`,
`tools/coteja_psg.py`): el estado de los dos chips coincide cuadro a cuadro.
Siete coinciden con el «tono libre» del canal 4 apagado (`0xEFF4`): es un
silbido que el juego enciende por su cuenta durante el partido y que esas
piezas no usan. Los efectos no van.

## 0x28: La presentación

<audio controls preload="none" src="../audio/musica_28.mp3?v=4adcf3e0"></audio>

Lo pide p15:BBD8. 3,6 s. Cotejada: 218 cuadros iguales.

## 0x2D: El título y la demostración

<audio controls preload="none" src="../audio/musica_2D.mp3?v=b814b4a5"></audio>

Lo pide p00:44DD, p15:AB3B. 63,2 s y vuelve al cuadro 1998. Cotejada: 3790 cuadros iguales.

## 0x23: Al elegir el modo

<audio controls preload="none" src="../audio/musica_23.mp3?v=5d0f175a"></audio>

Lo pide p00:45C8. 2,9 s. Cotejada: 176 cuadros iguales.

## 0x2E: Los menús de PENNANT

<audio controls preload="none" src="../audio/musica_2E.mp3?v=bc7be881"></audio>

Lo pide p13:622A, p15:A548. 51,2 s y vuelve al cuadro 1921. Cotejada: 3073 cuadros iguales.

## 0x2F: Antes del partido: lanzadores y orden

<audio controls preload="none" src="../audio/musica_2F.mp3?v=4db6ae48"></audio>

Lo pide p00:463A. 38,4 s y vuelve al cuadro 1153. Cotejada: 2305 cuadros iguales con el tono libre apagado.

## 0x33: Batea el visitante: bases vacías

<audio controls preload="none" src="../audio/musica_33.mp3?v=de169fd4"></audio>

Lo pide p00:5E74; 0x32, la de empezar el partido en p00:466E, es la misma. 33,6 s y vuelve al cuadro 865. Cotejada: 2017 cuadros iguales con el tono libre apagado.

## 0x34: Batea el visitante: corredor en primera

<audio controls preload="none" src="../audio/musica_34.mp3?v=72b2625c"></audio>

19,2 s y vuelve al cuadro 577. Cotejada: 1153 cuadros iguales.

## 0x35: Batea el visitante: corredor en segunda

<audio controls preload="none" src="../audio/musica_35.mp3?v=db24cb00"></audio>

16,0 s y vuelve al cuadro 481. Cotejada: 961 cuadros iguales.

## 0x36: Batea el visitante: corredor en tercera

<audio controls preload="none" src="../audio/musica_36.mp3?v=111cc7c1"></audio>

32,0 s y vuelve al cuadro 961. Cotejada: 1921 cuadros iguales con el tono libre apagado.

## 0x37: Batea el local: bases vacías

<audio controls preload="none" src="../audio/musica_37.mp3?v=bb2161b9"></audio>

Lo pide p00:5E7A. 30,4 s y vuelve al cuadro 865. Cotejada: 1825 cuadros iguales con el tono libre apagado.

## 0x38: Batea el local: corredor en primera

<audio controls preload="none" src="../audio/musica_38.mp3?v=45f54dad"></audio>

25,6 s y vuelve al cuadro 769. Cotejada: 1537 cuadros iguales.

## 0x39: Batea el local: corredor en segunda

<audio controls preload="none" src="../audio/musica_39.mp3?v=66742abe"></audio>

32,0 s y vuelve al cuadro 961. Cotejada: 1921 cuadros iguales con el tono libre apagado.

## 0x3A: Batea el local: corredor en tercera

<audio controls preload="none" src="../audio/musica_3A.mp3?v=2cb80405"></audio>

26,7 s y vuelve al cuadro 801. Cotejada: 1601 cuadros iguales con el tono libre apagado.

## 0x3B: La séptima entrada, alta

<audio controls preload="none" src="../audio/musica_3B.mp3?v=7f2a02f1"></audio>

Lo pide p02:94E3. 37,8 s y vuelve al cuadro 1115. Cotejada: 2267 cuadros iguales.

## 0x3C: La séptima entrada, baja

<audio controls preload="none" src="../audio/musica_3C.mp3?v=8146116f"></audio>

Lo pide p02:94ED. 34,6 s y vuelve al cuadro 1115. Cotejada: 2075 cuadros iguales con el tono libre apagado.

## 0x3D: La pelota en juego, alta

<audio controls preload="none" src="../audio/musica_3D.mp3?v=a7a9d795"></audio>

Lo pide p01:6003. 10,2 s. Cotejada: 611 cuadros iguales.

## 0x3E: La pelota en juego, baja

<audio controls preload="none" src="../audio/musica_3E.mp3?v=597d30bb"></audio>

Lo pide p01:6003. 6,3 s. Cotejada: 379 cuadros iguales.

## 0x2C: Home run (0x2C con 0x3F, p02:9357)

<audio controls preload="none" src="../audio/musica_2C.mp3?v=9baba99f"></audio>

14,1 s. Cotejada: 843 cuadros iguales (cada mitad por separado).

## 0x42: Out

<audio controls preload="none" src="../audio/musica_42.mp3?v=69b7637b"></audio>

Lo pide p01:6171, p03:B131. 3,8 s. Cotejada: 229 cuadros iguales.

## 0x45: Cogida al vuelo

<audio controls preload="none" src="../audio/musica_45.mp3?v=6c28f39d"></audio>

Lo pide p03:AE58. 4,3 s. Cotejada: 259 cuadros iguales.

## 0x43: Base por bolas

<audio controls preload="none" src="../audio/musica_43.mp3?v=5411e68b"></audio>

Lo pide p01:61BD. 3,6 s. Cotejada: 215 cuadros iguales.

## 0x44: Carrera

<audio controls preload="none" src="../audio/musica_44.mp3?v=d882ad0e"></audio>

Lo pide p02:8FA3. 4,1 s. Cotejada: 247 cuadros iguales.

## 0x40: Fin de la media entrada, con corredores

<audio controls preload="none" src="../audio/musica_40.mp3?v=e0cbe0cc"></audio>

Lo pide p02:9466. 3,4 s. Cotejada: 205 cuadros iguales.

## 0x41: Fin de la media entrada, sin corredores

<audio controls preload="none" src="../audio/musica_41.mp3?v=fca860af"></audio>

Lo pide p02:945F. 4,4 s. Cotejada: 266 cuadros iguales.

## 0x30: Cambio de lanzador

<audio controls preload="none" src="../audio/musica_30.mp3?v=e5b00249"></audio>

Lo pide p00:4A32. 11,1 s. Cotejada: 668 cuadros iguales.

## 0x31: El campeón y el final

<audio controls preload="none" src="../audio/musica_31.mp3?v=15b63dfd"></audio>

Lo pide p00:4925, p00:49A6. 76,8 s y vuelve al cuadro 2049. Cotejada: 3968 cuadros iguales de 4609; luego el juego la corta.
