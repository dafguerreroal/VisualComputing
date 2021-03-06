## Motivación

El taller realizado busca abarcar la tematica de procesamiento de imagen vista en el curso de Computación Visual de la Universidad Nacional de Colombia.

## Integrantes
* Jonathan Ricardo Galvis -> [jrgalvisg](https://github.com/jrgalvisg)
* David Fernando Guerrero -> [dafguerreroal](https://github.com/dafguerreroal)

### Objetivos
* Convertir una imagen y un video a su escala de grises.
* Aplicar algunas mascaras de convolucion a una imagen y un video.
* Convertir una imagen  y un video a su equivalente en ascii.
* Desplegar el histograma de intensidad para una imagen
* Medir la eficiencia computacional para las operaciones realizadas a los videos.

## Metodologia
### Procesamiento por software:
*  **Conversión a escala de grises**: 

**Imagen**: 

Se aplica la escala de grises a una imagen recorriendo la imagen pixel a pixel aplicando dos técnicas, la primera es usando el promedio ponderado de los 3 colores RGB de cada pixel y  se reemplaza este  valor promedio en el nuevo pixel obteniendo asi la escala de grises de la fotografia.  la segunda hace  uso de la ponderación de colores Luma Y' 601, la cual al corregir el ponderado de color a valores más cercanos a los percibidos por el ojo humano (que tiene una mayor sensitividad a la luminancia), permite una mejora principalmente en zonas de alta luminosidad en las imágenes.

**Video**: 

Se toma un video extrayendo sus frames para poder ser tratados como imagenes independientes, se les aplican los filtros de escala de grises y se guardan en un vector del tamaño del video y es este vector el que se dibujara en el canvas.


*  **Máscaras de convolución**: 

**Imagen**: 

Se  aplican  3 mascaras de convolución recorriendo la imagen pixel a pixel, aplicando a cada uno la matriz de convolución respectiva, las mascaras usadas fueron:

*GaussianBlur: El desenfoque gaussiano es un efecto de suavizado para mapas de bits generado por software de edición gráfica, se uso el siguiente Kernel:


| 1 | 2 | 1 |
|---|---|---|
| 2 | 4 | 2 |
| 1 | 2 | 1 |

*Edge detection: Tiene como objetivo la identificación de puntos en una imagen digital en la que el brillo de la imagen cambia drásticamente o, más formalmente tiene discontinuidades, se usaron los siguientes Kernels:

------------

| 1 | 0 | -1|
|---|---|---|
| 0 | 0 | 0 |
| -1 | 0 | 1|

------------

| 0 | -1 | 0 |
|---|---|---|
| -1 | 4 | -1 |
| 0 | -1 | 0|

------------

| -1 | -1 | -1 |
|---|---|---|
| -1 | 5 | -1 |
| -1 | -1 | -1|

*Sharpen: Tecnica para aumentar la nitidez aparente de una imagen,se uso el siguiente Kernel:


| 0 | -1 | 0 |
|---|---|---|
| -1 | 5 | -1 |
| 0 | -1 | 0|

**Video**: 

Se toma un video extrayendo sus frames para poder ser tratados como imagenes independientes, se les aplican los kernel de  las mascaras escogidas, se guardan en un vector del tamaño del video y es este vector el que se dibujara en el canvas.

*  **ASCII**: 

**Imagen**:

Se pasa la imagen a escala de grises usando luma para tomar la intensidad de su color, con esta escala de grises se mapean los 256 posibles valores a caracteres monoespaciados previamente definidos y se reescala la imagen  a su tamaño original debido a que esta se deforma por el tamaño de los caracteres.

**Video**:

Se toma un video extrayendo sus frames para poder ser tratados como imagenes independientes, se les aplica la escala de grises luma  para tomar la intensidad de su color, con esta escala de grises se mapean los 256 posibles valores a caracteres monoespaciados previamente definidos, se guardan en un vector del tamaño del video y es este vector el que se dibujara en el canvas.

* **Histograma de intensidad**: 

Se agrega un histograma a una imagen  que nos va a representar  distribución de frecuencia de los niveles de gris con el número de valores de negro puro que se muestran a la izquierda y el número de valores de blanco puro representados a la derecha.

* **Medir la eficiencia computacional para las operaciones realizadas a los videos**:

La eficiencia medida computacionalmente en el caso de los efectos por software logra llegar hasta los 14fps con una imagen de 160.

### Procesamiento por hardware:

*  **Conversión a escala de grises**:

**Imagen**: 

Se crean dos shaders diferentes, El primero  tendra definido una operacion que calculara el promedio del RGB del pixel y este resultado se pasa como textura de salida y se sobreescribe en la imagen de salida, el segundo shader tiene definida una operación punto a punto entre un vector luma de tres posicion con el RGB del pixel, este resultado se pasa como textura de salida y se sobreescribe en la imagen de salida

**Video**: 

Se usa  el shader de luma  y se opera  cada frame  del video como una imagen..


*  **Máscaras de convolución**: 

**Imagen**: 

Se creo un shader que recibe nueve valores que van a ser operados con los valores de las texturas de la imagen, los nueve valores que se reciben, variaran dependiendo del efecto que se quiera conseguir.

**Video**: 

Se toma un video extrayendo sus frames para poder ser tratados como imagenes independientes, se les aplica el mismo shader que se uso para las imagenes, se guardan en un vector del tamaño del video y es este vector el que se dibujara en el canvas.

*  **ASCII**: 

**Imagen**:

Para la implementacion de ASCII por hardware, se uso como base el siguiente [shader](https://github.com/georgehenryrowe/ShadersForProcessing3/blob/master/data/ascii.glsl)  este shader pasa la imagen a blanco y negro y mapea los valores a caracteres por medio de la funcion "character"

**Video**:

Se toma un video extrayendo sus frames para poder ser tratados como imagenes independientes, se les aplica el mismo [shader](https://github.com/georgehenryrowe/ShadersForProcessing3/blob/master/data/ascii.glsl) usado para las imagenes, se guardan en un vector del tamaño del video y es este vector el que se dibujara en el canvas.

* **Medir la eficiencia computacional para las operaciones realizadas a los videos**:

La eficiencia medida computacionalmente en el caso de los efectos por hardware logra llegar hasta los 60 fps por lo que podemos notar una gran mejora en el rendimiento respecto a hacerlo por software.

## Resultados

**Gray Scale**:

Imagen Original -- Escala de grises con promedio -- Escala de grises con Luma

+ ![Gray Scale Image](/Resultados/out_grey.JPG)
+ ![Gray Scale Video](/Resultados/grey.gif)


**Convolution Masks**:

Imagen Original -- GaussianBlur -- EdgeDetection -- Sharpen

+ ![Convolution Masks Image](/Resultados/out_masks.JPG)
+ ![Convolution Masks Blur](/Resultados/blur.gif)
+ ![Convolution Masks Edge](/Resultados/edge.gif)
+ ![Convolution Masks Sharpen](/Resultados/sharpen.gif)

**Histrogram**:
+ ![Gray Scale](/Resultados/out_histogram.JPG)

**Ascii Software**:
+ ![Gray Scale Image](/Resultados/out_ascii_software.JPG)
+ ![Gray Scale Video](/Resultados/ascii2.gif)

**Ascii Shaders**:
+ ![Gray Scale Image](/Resultados/out_ascii_hardware.JPG)
+ ![Gray Scale Video](/Resultados/ascii1.gif)

## Conclusiones:

- Lo primero que se puede observar respecto a la medida de eficiencia computacional, se refleja con mayor facilidad en el procesamiento de video, mas especificamente en la conversión a caracteres ascii. El procesamiento por software refleja un máximo de 14 fps en un video de 160*90, mientras que el procesamiento por hardware, haciendo uso de shaders, refleja un máximo de 60 fps.
- En ambos casos, procesamiento por software o por harware se evidencia un gasto computacional bastante notorio y el aumnento en el tamaño de las imagenes o los videos es proporcional a dicho gasto mencionado.
- Para videos de mas de 240p el procesamiento para escala de grises y máscaras de convolución por software, tiene un costo computacional tan alto que durante el proceso el vídeo tiende a relentizarse, efecto lag dados los bajos fps.
- La conversión a caracteres ascii para imagenes de un tamaño considerable toma un tiempo de ejecución bastante alto en comparación con el proceso por shaders, en donde se puede ver un resultado mas inmediato.