import processing.video.*;
Movie movie;
PImage image;
PShader shaderLuma;

void setup() {
  size(872,260, P3D);
  movie = new Movie(this, "426.mp4");
  movie.loop();  
  shaderLuma = loadShader("luma.glsl");
}

void draw() {
  background(255);
  image(movie, 10,10, 426, 240);
  filter(shaderLuma);
  image(movie, 436, 10, 426, 240);
}

void movieEvent(Movie m) {
  m.read();
}
