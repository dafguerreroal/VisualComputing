import processing.video.*;
Movie myMovie;
PImage image;
PShader texShader;

void setup() {
  size(882,260, P3D);    
  myMovie = new Movie(this, "426.mp4");  
  myMovie.loop();  
  texShader = loadShader("mascara.glsl");
}

void draw() {
  background(255);
  image(myMovie, 10, 10,426,240);
  gaussianBlur();
  //edgeDetection();
  //sharpen();
  filter(texShader);
  image(myMovie, 446, 10,426,240);
}

void gaussianBlur() {
  //shader(texShader);
  texShader.set("c0", 0.0625);
  texShader.set("c1", 0.125);
  texShader.set("c2", 0.0625);
  texShader.set("c3", 0.125);
  texShader.set("c4", 0.25);
  texShader.set("c5", 0.125);
  texShader.set("c6", 0.0625);
  texShader.set("c7", 0.125);
  texShader.set("c8", 0.0625);
}

void edgeDetection() {   
  //shader(texShader);
  texShader.set("c0", -1.0);
  texShader.set("c1", -1.0);
  texShader.set("c2", -1.0);
  texShader.set("c3", -1.0);
  texShader.set("c4", 8.0);
  texShader.set("c5", -1.0);
  texShader.set("c6", -1.0);
  texShader.set("c7", -1.0);
  texShader.set("c8", -1.0);
}

void sharpen(){
  //shader(texShader);
  texShader.set("c0", 0.0);
  texShader.set("c1", -1.0);
  texShader.set("c2", 0);
  texShader.set("c3", -1.0);
  texShader.set("c4", 5.0);
  texShader.set("c5", -1.0);
  texShader.set("c6", 0.0);
  texShader.set("c7", -1.0);
  texShader.set("c8", 0.0);
}

void movieEvent(Movie m) {
  m.read();
}
