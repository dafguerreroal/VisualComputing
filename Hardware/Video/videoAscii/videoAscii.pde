import processing.video.*;

Movie myMovie;
PShader ascii;

void setup() {
  size(1920,540, P3D);
  
  //LOAD IN VIDEO
  myMovie = new Movie(this, "426.mp4");
  myMovie.loop();

  //LOAD IN SHADERS
  ascii = loadShader("ascii.glsl");
  ascii.set("iResolution", float(width), float(height));
     
}

void draw() {
  image(myMovie, 0, 0, 960,540);
  filter(ascii);  
  image(myMovie, 960, 0, 960,540); 
}

void movieEvent(Movie m) {
  m.read();
}
