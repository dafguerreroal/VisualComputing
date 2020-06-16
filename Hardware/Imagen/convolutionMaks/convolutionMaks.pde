PImage label;
PShape shBlur;
PShape shEdge;
PShape shSharpen;
PShape shOriginal;
PShader texShader;

int maskSelector = 0;
String[] maskNames = {"gaussianBlur", "edgeDetection", "sharpen"};

void setup() {
  size(1850, 470, P3D);
  label = loadImage("data/Lenna.jpg");
  
  shOriginal = createShape(RECT, 10, 10, 450, 450);
  shOriginal.setTexture(label);
  shBlur = createShape(RECT, 470, 10, 450, 450);
  shBlur.setTexture(label);
  shSharpen = createShape(RECT, 930, 10, 450, 450);
  shSharpen.setTexture(label);
  shEdge = createShape(RECT, 1390, 10, 450, 450);
  shEdge.setTexture(label);
}

void draw() {
  background(255);
  texShader = loadShader("data/mascara.glsl");
  shader(texShader);
  gaussianBlur();
  sharpen();
  edgeDetection();
  resetShader();
  shape(shOriginal);
}

void gaussianBlur() {
  shader(texShader);
  texShader.set("c0", 0.0625);
  texShader.set("c1", 0.125);
  texShader.set("c2", 0.0625);
  texShader.set("c3", 0.125);
  texShader.set("c4", 0.25);
  texShader.set("c5", 0.125);
  texShader.set("c6", 0.0625);
  texShader.set("c7", 0.125);
  texShader.set("c8", 0.0625);
  println("Máscara " + maskNames[0] + " : " + frameRate + " fps");
  shape(shBlur);
}

void edgeDetection() {   
  shader(texShader);
  texShader.set("c0", -1.0);
  texShader.set("c1", -1.0);
  texShader.set("c2", -1.0);
  texShader.set("c3", -1.0);
  texShader.set("c4", 8.0);
  texShader.set("c5", -1.0);
  texShader.set("c6", -1.0);
  texShader.set("c7", -1.0);
  texShader.set("c8", -1.0);
  println("Máscara " + maskNames[1] + " : " + frameRate + " fps");
  shape(shEdge);
}

void sharpen(){
  shader(texShader);
  texShader.set("c0", 0.0);
  texShader.set("c1", -1.0);
  texShader.set("c2", 0);
  texShader.set("c3", -1.0);
  texShader.set("c4", 5.0);
  texShader.set("c5", -1.0);
  texShader.set("c6", 0.0);
  texShader.set("c7", -1.0);
  texShader.set("c8", 0.0);
  println("Máscara " + maskNames[2] + " : " + frameRate + " fps");
  shape(shSharpen);
}
