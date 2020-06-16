PImage img;
PImage greyImg;

void setup(){
  size(1290, 650);
  img = loadImage("data/Lenna.jpg");
  greyImg = createImage(img.width, img.height, RGB);
}


void draw(){
  background(255);
  
  image(img, 650, 10);
  img.loadPixels();
  int[] hist = new int[256];
  
  // Calculate the histogram
  for (int i = 0; i < img.width * img.height; i++) {
    color c = img.pixels[i];
    int bright = int((0.299*red(c)) + (0.587*green(c)) + (0.114*blue(c))/(img.width * img.height));
    greyImg.pixels[i] = color(bright, bright, bright);
    hist[bright]++;
  }
  image(greyImg, 10, 10);
  
  // Find the largest value in the histogram
  int histMax = max(hist);
  
  stroke(255);
  // Draw half of the histogram (skip every second value)
  for (int i = 0; i < img.width; i += 2) {
    // Map i (from 0..img.width) to a location in the histogram (0..255)
    int which = int(map(i, 0, img.width, 0, 255));
    // Convert the histogram value to a location between 
    // the bottom and the top of the picture
    int y = int(map(hist[which], 0, histMax, img.height, 0));
    line(i, greyImg.height+10, i, y+10);
  }
  
}
