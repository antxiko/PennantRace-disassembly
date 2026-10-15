# Aviso legal y atribución

*(Also available [in English](LEGAL-NOTICE.md).)*

## De quién es cada cosa

**El cartucho no es nuestro.** *The Pro Yakyuu Gekitotsu Pennant Race* lo
publicó **Konami** para MSX2 en 1988; su número de catálogo es **RC-757** y es
un MegaROM de 128 KB con el SCC. Todos los derechos sobre el cartucho siguen
siendo de sus titulares.

**Lo que sí es nuestro** son las herramientas de este repositorio, los
comentarios del listado, el análisis y la documentación. Eso se publica con la
licencia de `LICENSE`.

## Qué hay en este repositorio

Los ficheros `src/pennantrace_pNN.asm` (uno por banco) son el desensamblado
comentado del cartucho. Se publican para la **preservación, el estudio y la
documentación** de un título que es parte de la historia del software del MSX.

La imagen del cartucho (`.rom`) **no** se distribuye aquí. Quien quiera volver
a montar el listado tiene que poner la suya, y el `Makefile` comprueba su
sha256 antes de hacer nada.

Las imágenes que produce `tools/pantallas.py` no son ilustraciones traídas de
fuera: se dibujan leyendo las propias tablas del cartucho, en las direcciones
que dice el listado. Las músicas salen de ejecutar el propio motor de sonido
del cartucho. Las dos cosas son parte de la prueba de que la lectura del
binario es correcta: si estuviera mal, saldría ruido.

## En qué se apoya

En nada de nadie. Todo lo que se afirma aquí sale de leer este binario o de
medirlo corriendo, y cada afirmación lleva su evidencia al lado: la
instrucción que lee un dato, la tabla que cierra exactamente donde tiene que
cerrar, o la medida hecha en el emulador. Lo que no está cerrado se dice que no
lo está.

## Si eres uno de los autores

Si trabajaste en *The Pro Yakyuu Gekitotsu Pennant Race* o tienes derechos
sobre el cartucho, y preferirías que este material no estuviera publicado,
**dilo y se retira, sin discusión**. La intención de este trabajo es justo la
contraria de perjudicarte: es dejar constancia de cómo se hizo.
