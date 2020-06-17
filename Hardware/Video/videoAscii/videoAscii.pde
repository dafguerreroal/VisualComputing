import processing.video.*;

Movie myMovie;
PShader ascii;

void setup() {
  size(852,240, P3D);
  
  //LOAD IN VIDEO
  myMovie = new Movie(this, "426.mp4");
  myMovie.loop();

  //LOAD IN SHADERS
  ascii = loadShader("ascii.glsl");
  ascii.set("iResolution", float(width), float(height));
     
}

void draw() {
  image(myMovie, 0, 0, 426,240);
  filter(ascii);  
  image(myMovie, 436, 0, 426,240); 
}

void movieEvent(Movie m) {
  m.read();
}
