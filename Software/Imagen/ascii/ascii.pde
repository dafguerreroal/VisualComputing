PImage image, imgASCII, imgAux;
PFont font;

String contenido = "";

void setup() {
  font = loadFont("CourierNewPSMT-12.vlw");
  //size(231,345);
  //image = loadImage("snake.JPG");
  size(1890, 630);
  image = loadImage("data/Lenna.jpg");
  imgASCII = loadImage("data/Lenna.jpg");
  imgAux = loadImage("data/Lenna.jpg");
}

void draw() {
  background(0);
  image(image, 0, 0);
  textFont(font, 2);
  text(contenido, image.width*2, 0);
  imgASCII.resize(550, 300);
  imgASCII.loadPixels();
  //String gscale2 = "abcdefghi ";
  //String gscale2 = "abcdefghijklmnopqrst";
  String gscale2 = " .,:;i1tfLCG08@";

  //........
  imgASCII.loadPixels();
  for (int i = 0; i <  image.width * image.height; i++) {
    color c = imgAux.pixels[i];
    int grey = int((0.299*red(c)) + (0.587*green(c)) + (0.114*blue(c)));
    imgAux.pixels[i] = color(grey, grey, grey);
  }
  imgAux.updatePixels();
  image(imgAux, image.width, 0);
  //........
  
  for (int i = 0; i <  imgASCII.width * imgASCII.height; i++) {
    color c = imgASCII.pixels[i];
    if (i % imgASCII.width == 0) {
      contenido += "\n";
    }
    int grey = int((0.299*red(c)) + (0.587*green(c)) + (0.114*blue(c)));
    imgASCII.pixels[i] = color(grey, grey, grey);
    contenido += gscale2.toCharArray()[int(map(grey, 0, 255, 0, gscale2.toCharArray().length-1))];
  }  
}
