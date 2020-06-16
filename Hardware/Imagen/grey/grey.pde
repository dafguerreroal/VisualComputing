PImage  original;
PShape  shOriginal;
PShape  shLuma;
PShape  shAvg;
PShader textShaderLuma;
PShader textShaderAvg;

void setup(){
  size(1390, 470, P3D);
  original = loadImage("data/Lenna.jpg");
  
  shOriginal = createShape(RECT, 10, 10, 450,450);
  shOriginal.setTexture(original);
  
  shAvg = createShape(RECT, 470, 10, 450,450);
  shAvg.setTexture(original);
  
  shLuma = createShape(RECT, 930, 10, 450,450);
  shLuma.setTexture(original);
}

void draw(){
  background(255);
  
  textShaderAvg = loadShader("data/avg.glsl");
  shader(textShaderAvg);
  avg();
  resetShader();
  
  textShaderLuma = loadShader("data/luma.glsl");
  shader(textShaderLuma);
  luma();
  resetShader();
 
  shape(shOriginal);
}

void luma(){
  shader(textShaderLuma);
  shape(shLuma);
}

void avg(){
  shader(textShaderAvg);
  shape(shAvg);
}
