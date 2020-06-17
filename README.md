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
**Procesamiento por software:**
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


| 1 | 0 | -1|
|---|---|---|
| 0 | 0 | 0 |
| -1 | 0 | 1|


| 0 | -1 | 0 |
|---|---|---|
| -1 | 4 | -1 |
| 0 | -1 | 0|


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


**Procesamiento por hardware:**

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


* **Resultados**:

**Gray Scale**:
+ ![Gray Scale](/Resultados/out_grey.JPG)


**Convolution Masks**:
+ ![Convolution Masks](/Resultados/out_masks.JPG)


**Ascii**:
+ ![Gray Scale](/Resultados/out_ascii_software.JPG)














```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/dafguerreroal/VisualComputing/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://help.github.com/categories/github-pages-basics/) or [contact support](https://github.com/contact) and we’ll help you sort it out.
