// Perlin Noise

int cols, rows;
int scl =25;
int w = 2000;
int h = 1600;

float flying = 0;

int alturaMax = 80;

float[][] terrain;

 PImage img ;

void setup(){
  size(600,600,P3D);

  cols = w/scl;
  rows = h/scl;
  terrain = new float[cols][rows];
  textureMode(IMAGE);
  img = loadImage("texture/grass.jpg");
}

void draw(){
  
  println(scl);
  flying -= 0.02;
  float yoff = flying;
  for (int y = 0; y < rows; y++){
      float xoff = 0;
    for(int x = 0; x < cols; x++){
      terrain[x][y] = map( noise(xoff,yoff), 0, 1 , -alturaMax,alturaMax);
      xoff += 0.2;
    }
    yoff += 0.2;
  }
  
  background(0);
  stroke(255);
    fill(255);
  text("Scale: " + scl , width /2 - 25, 15);
  text("Tecla up : Scale++ " , width -150, 15);
  text("Tecla down : Scale-- " , width -150, 30);
  noFill();
  lights();
  noStroke();
  translate(width/2, height /2);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  for (int y = 0; y < rows-1; y++){
    beginShape(TRIANGLE_STRIP);
    texture(img);
    for(int x = 0; x < cols; x++){
      vertex(x*scl, y*scl, terrain[x][y] , x ,y );
      vertex(x*scl, (y+1)*scl, terrain[x][y+1], x,y);
    }
    endShape();
  }

  delay(50);
}

void keyPressed() {
  if(key == 'a'){
    //z++;
   background(0);
  }else if (key == 's'){
    //z--;
   background(0);
  }
      if ( key == CODED) {
        if ( keyCode == UP) { 
          scl++; 
          cols = w/scl;
          rows = h/scl;
          terrain = new float[cols][rows];
        }else if ( keyCode == DOWN) { 
          if(scl > 1) {
            scl--; 
            cols = w/scl;
            rows = h/scl;
            terrain = new float[cols][rows];
          }
        }

      }
}
