PImage image, imgBlur, imgED, imgS;

void setup() {
  //size(231,345);
  //image = loadImage("snake.JPG");
  size(1850, 470);
  image = loadImage("data/Lenna.jpg");
  imgBlur = loadImage("data/Lenna.jpg");
  imgED = loadImage("data/Lenna.jpg");
  imgS = loadImage("data/Lenna.jpg");
  image.resize(450, 450);
  imgBlur.resize(450, 450);
  imgED.resize(450, 450);
  imgS.resize(450, 450);
}

void draw() {
  background(255);
  image(image, 10, 10);
  image(imgBlur, 470, 10);
  image(imgED, 930, 10);
  image(imgS, 1390, 10);
}

void blur() {
  double convolution[] = vectorGauss();
  int imgv[] = new int[imgBlur.width * imgBlur.height];
  imgBlur.loadPixels();

  for (int i = 0; i <  imgBlur.width * imgBlur.height; i++) {
    color c = imgBlur.pixels[i];
    imgv[i] = c;
  }

  for (int i = 0; i < imgv.length; i++) {
    float r = 0;
    float g = 0;
    float b = 0;
    for (int k = -convolution.length/2; k < convolution.length/2; k++) {
      if (i+k < imgv.length && i+k > 0) {
        r += red(imgv[i+k])*(float)(convolution[k+convolution.length/2]);
        g += green(imgv[i+k])*(float)(convolution[k+convolution.length/2]);
        b += blue(imgv[i+k])*(float)(convolution[k+convolution.length/2]);
      }
    }
    imgBlur.pixels[i] = color(r, g, b);
  }
  imgBlur.updatePixels();
}

double[] vectorGauss() {
  float e = 2.7182818284;
  int sigma = 3;
  float pi = 3.14159265359;
  int kernel = 15; 
  double gauss[] = new double[kernel];

  // Se llena la matriz de convolucion gaussiana
  float sum = 0;
  float s = pow(sigma, 2);
  for (int i = -kernel/2; i < kernel/2; i++) {
    gauss[i+int(kernel/2)] = (1/(2*pi*s)) * (Math.pow(e, (-(i*i)/(2*s))));
    sum += gauss[i+int(kernel/2)];
  }

  // Normalizacion
  for (int i = 0; i < kernel; i++) {
    gauss[i] /=sum;
  }

  return gauss;
}

void edgeDetection() {  
  double convolution[] =  {1, 0, -1, 0, 0, 0, -1, 0, 1};
  double convolution1[] = {0, 1, 0, 1, -4, 1, 0, 1, 0};
  double convolution2[] = {-1, -1, -1, -1, 8, -1, -1, -1, -1};

  int imgv[] = new int[imgED.width * imgED.height];
  imgED.loadPixels();

  for (int i = 0; i <  imgED.width * imgED.height; i++) {
    color c = imgED.pixels[i];
    imgv[i] = c;
  }

  for (int i = 0; i < imgv.length; i++) {
    float r = 0;
    float g = 0;
    float b = 0;
    for (int k = -convolution.length/2; k < convolution.length/2; k++) {
      if (i+k < imgv.length && i+k > 0) {
        r += red(imgv[i+k])*(float)(convolution[k+convolution.length/2]);
        g += green(imgv[i+k])*(float)(convolution[k+convolution.length/2]);
        b += blue(imgv[i+k])*(float)(convolution[k+convolution.length/2]);
      }
    }
    for (int k = -convolution.length/2; k < convolution.length/2; k++) {
      if (i+k < imgv.length && i+k > 0) {
        r += red(imgv[i+k])*(float)(convolution1[k+convolution1.length/2]);
        g += green(imgv[i+k])*(float)(convolution1[k+convolution1.length/2]);
        b += blue(imgv[i+k])*(float)(convolution1[k+convolution1.length/2]);
      }
    }
    for (int k = -convolution.length/2; k < convolution.length/2; k++) {
      if (i+k < imgv.length && i+k > 0) {
        r += red(imgv[i+k])*(float)(convolution2[k+convolution2.length/2]);
        g += green(imgv[i+k])*(float)(convolution2[k+convolution2.length/2]);
        b += blue(imgv[i+k])*(float)(convolution2[k+convolution2.length/2]);
      }
    }
    imgED.pixels[i] = color(r, g, b);
  }
  imgED.updatePixels();
}

void sharpen() {
  double convolution[] = {0, -1, 0, -1, 5, -1, 0, -1, 0};
  int imgv[] = new int[imgS.width * imgS.height];
  imgBlur.loadPixels();

  for (int i = 0; i <  imgS.width * imgS.height; i++) {
    color c = imgS.pixels[i];
    imgv[i] = c;
  }

  for (int i = 0; i < imgv.length; i++) {
    float r = 0;
    float g = 0;
    float b = 0;
    for (int k = -convolution.length/2; k < convolution.length/2; k++) {
      if (i+k < imgv.length && i+k > 0) {
        r += red(imgv[i+k])*(float)(convolution[k+convolution.length/2]);
        g += green(imgv[i+k])*(float)(convolution[k+convolution.length/2]);
        b += blue(imgv[i+k])*(float)(convolution[k+convolution.length/2]);
      }
    }
    imgS.pixels[i] = color(r, g, b);
  }
  imgS.updatePixels();
}

void keyPressed() {
  if (key == 'b')
    blur();
  if (key == 'e')
    edgeDetection();
  if (key == 's')
    sharpen();
}
