float xstart, xnoise, ystart, ynoise;
float xstartNoise, ystartNoise;

void setup(){
  size(800,300);
  smooth();
  background(0);
  frameRate(40);
  
  xstartNoise = random(30);
  ystartNoise = random(30);
  xstart = random(10);
  ystart = random(10);
}

void draw(){
  background(0);
  
  xstartNoise += 0.1;
  ystartNoise += 0.1;
  xstart += (noise(xstartNoise) * mouseX/width) - 0.3;
  ystart += (noise(ystartNoise) * mouseY/height) - 0.3;
  
  xnoise = xstart;
  ynoise = ystart;
  
  for(int y = 0; y <= height; y += 5){
    ynoise += 0.1;
    xnoise = xstart;
    for(int x = 0; x <= width; x += 5){
      xnoise += 0.1;
      drawGrid(x, y, noise(xnoise, ynoise));
    }
  }
}

void drawGrid(float x, float y, float noiseFactor){
  pushMatrix();
    translate(x,y);
    rotate(noiseFactor * radians(540));
    noStroke();
    float edgeSize = noiseFactor * 15;
    float grey = 100 + (noiseFactor * 120);
    float alph = 100 + (noiseFactor * 120);
    fill(grey, alph);
    ellipse(0,0, edgeSize, edgeSize);
  popMatrix();
}

void keyPressed() {
  if ( key == ' ' ) {
    save( "Grid.png" );
  }
}