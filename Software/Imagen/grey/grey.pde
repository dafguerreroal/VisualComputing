PImage image;
PImage greyAVG;
PImage greyLUMA;

int tamX = 630;

void setup(){
  size(1910, 645);
  
  image = loadImage("data/Lenna.jpg");
  greyAVG = createImage(image.width, image.height, RGB);
  greyLUMA = createImage(image.width, image.height, RGB);
}

void draw(){
  background(255);
  
  image(image, 5, 10);
  image.loadPixels();
  
  for (int i = 0; i <  image.width * image.height; i++) {
    color c = image.pixels[i];
    //obtener las canales de color
    float avg = (red(c) + green(c) + blue(c)) / 3;
    float luma = (0.299*red(c)) + (0.587*green(c)) + (0.114*blue(c));
    greyAVG.pixels[i] = color(avg, avg, avg);
    greyLUMA.pixels[i] = color(luma, luma, luma);
  }
  
  image(greyAVG, tamX+10, 10);
  image(greyLUMA, tamX*2+15, 10);
}
