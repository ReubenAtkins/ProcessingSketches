boolean growing = false;
float rScl = 1;
color blah;
void setup() {
  size(500, 500);
  background(0);
}


void draw() {
  /*
  if(frameCount > 120 && frameCount < 240) {
     saveFrame(); 
  }
  */

//noStroke();
  //background(0);
  fill(1, 50);
  rect(0, 0, width, height);
  noStroke();
  //Center circle
  //color blah = color(random(255), random(255), random(255));
  GrowingCalcs();
  if(frameCount % 10 == 0) {
    blah = color(random(255), random(255), random(255), 255);
  }
  fill(blah);
  ellipse(.5*width, .5*height, 15, 15);
  for(int i = 0; i < 5; i++) {
    
    float centerX = rScl*25*cos(radians(frameCount*3+i*72));
    float centerY = rScl*25*sin(radians(frameCount*3+i*72));
    //println(centerX + " " + centerY);
    fill(map(centerX, rScl*25*-1, rScl*25, 0, 255), 0, map(centerY, rScl*25*-1, rScl*25, 0, 255));
    ellipse(.5*width+centerX, .5*height+centerY, 8, 8);
   }
    pushMatrix();
    translate(.5*width, .5*height);
    //other circles
  for(int i = 0; i < 12; i++) {
    //main circles
    float x = 165*cos(radians(frameCount+i*30));
    float y = 165*sin(radians(frameCount+i*30));
    fill(blah);
    ellipse(x, y, 15, 15);
    for(int j = 0; j < 5; j++) {
      //smaller rotating circles
      pushMatrix();
      translate(x, y);
      float smallX = rScl*25*cos(radians(frameCount*3+j*72));
      float smallY = rScl*25*sin(radians(frameCount*3+j*72));
      fill(map(smallX, rScl*25*-1, rScl*25, 0, 255), map(x, -165, 165, 255, 0),map(smallY, rScl*25*-1, rScl*25, 0, 255));
     // println(rScl);
      ellipse(smallX, smallY, 8, 8);
      
      
      
      popMatrix();
    }
   
  }
  popMatrix();
 }
 //growing their radius
void GrowingCalcs() {
    if(growing) {
    rScl+=.05;
    if (rScl >= 4) {
      growing = !growing;
    }
  }else {
    rScl -= .05;
    if(rScl < .6) {
      growing = !growing;
    }
  }
}