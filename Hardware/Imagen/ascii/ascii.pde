PShader ascii;
PImage image;

void setup() {
  size(1260, 630, P3D);
 
  //LOAD IN SHADERS
  ascii = loadShader("data/ascii.glsl");
  ascii.set("iResolution", float(width), float(height));
    
  image = loadImage("data/Lenna.jpg");  
}

void draw() {
  image(image,0,0);
  filter(ascii);
  image(image, 630, 0);
}
