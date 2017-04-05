class Stars{ 
  float x;
  float y;
  float angle = TWO_PI/5;
  float halfAngle = angle/2.0;
  float scale;
  float speed;
  float repeater;
  color c = color(255, 255, map(noise(frameCount*.1), 0, 1, 0, 255));
  
  Stars(float x1, float y1, float scale1, float speed1, float repeater1) {
    x = x1;
    y=y1;
    speed = speed1;
    scale = scale1;
    repeater = repeater1;

  }
  void display() {  
    //push to allow a rotate to make star around 0,0
    pushMatrix();
    noStroke();
    c = color(255, int(random(170,255)), 0, 200);
    //alternative color scheme, bit less random, 
    //c = color(255, int(map(noise(frameCount*.001), 0, 1, 170, 255)), 0, 200);
    if (frameCount%(map(noise(frameCount*.1*scale), 0, 1, 0, 100)) < 5) {
      c = (255);
    } 
    //5 of them, 6*30 = 150, thus each one for "30" frames or counts, cycle through which star is showing
    if ((frameCount*speed+repeater*30)%180 > 30) {
      c = color(255, 0, 0, 0);
    }
    fill(c);
    beginShape();
    translate(x, y);
    rotate(frameCount*scale*.01);
    for(float a = 0; a < TWO_PI; a+= angle) {
    float sx = 0+cos(a)*7*scale;
    float sy = 0+sin(a)*7*scale;
    vertex(sx, sy);
    sx = cos(a+halfAngle)*3*scale;
    sy = sin(a+halfAngle)*3*scale;
    vertex(sx, sy);
    //star algorithm from processing.org, modified to be scalable and only 5pt stars
    }
    endShape();
    
    popMatrix();
    
  }
  void update() {
    y += speed;
    //buffer height so no in the middle of screen disappearances 
    if (y > height+30) {
      y = -30;
    }
    
  }
  
}