function Stars(x1, y1, scale1, speed1, repeater1) {
    this.x = x1;
    this.y=y1;
    this.speed = speed1;
    this.scale = scale1;
    this.repeater = repeater1;
    this.c = color(255, 255, map(noise(frameCount*.1), 0, 1, 0, 255));
    this.angle = TWO_PI/5;
    this.halfAngle = angle/2.0;
    this.repeater = repeater1;

  
  this.display = function() {  
    //push to allow a rotate to make star around 0,0
    pushMatrix();
    noStroke();
    this.c = color(255, int(random(170,255)), 0, 200);
    //alternative color scheme, bit less random, 
    //c = color(255, int(map(noise(frameCount*.001), 0, 1, 170, 255)), 0, 200);
    if (frameCount%(map(noise(frameCount*.1*scale), 0, 1, 0, 100)) < 5) {
      this.c = (255);
    } 
    //5 of them, 6*30 = 150, thus each one for "30" frames or counts, cycle through which star is showing
    if ((frameCount*speed+repeater*30)%180 > 30) {
      this.c = color(255, 0, 0, 0);
    }
    fill(this.c);
    beginShape();
    translate(this.x, this.y);
    rotate(frameCount*this.scale*.01);
    for(var a = 0; a < TWO_PI; a+= angle) {
    this.sx = 0+cos(a)*7*this.scale;
    this.sy = 0+sin(a)*7*this.scale;
    vertex(this.sx, this.sy);
    this.sx = cos(a+halfAngle)*3*this.scale;
    this.sy = sin(a+halfAngle)*3*this.scale;
    vertex(this.sx, this.sy);
    //star algorithm from processing.org, modified to be scalable and only 5pt stars
    }
    endShape();
    
    popMatrix();
    
  }
  this.update = function() {
    y += speed;
    //buffer height so no in the middle of screen disappearances 
    if (y > height+30) {
      y = -30;
    }
    
  }
  
}