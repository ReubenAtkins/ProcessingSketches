float[] y1 = new float[120];
float[] y2 = new float[120];
float theta2 = .19;
float theta1 = .02;
void setup() {
 size(600, 600);
 background(0);
 frameRate(120);
}
void draw() {
  if(keyPressed) {
    if(key == 'v') {
      saveFrame();
    }
  }
  fill(1, 5);
  rect(0, 0, 600, 600);
 // background(0);
  stroke(map(noise(theta2*2), 0, 1, 0, 255), 
         map(noise(theta1*2), .5, 1, 255, 0), 
         map(noise(frameCount*.1), 0, .5, 0, 255));

  bigCurve();
  smallCurve();
  for(int i = 0; i < y1.length-1; i++) {
      stroke(map(noise(theta2*2), 0, 1, 0, 255), 
         map(noise(theta1*2), .5, 1, 255, 0), 
         map(noise(frameCount*.1), 0, .5, 0, 255));
    line(i*8, height/2+y1[i]+y2[i], (i+1)*8,height/2+y1[i+1]+y2[i+1]);
    line(i*8, height/2+y1[i]*-1+y2[i]*-1, (i+1)*8, height/2+-1*y1[i+1]+y2[i+1]*-1);
    line(i*8, height/2+y1[i]*-1+y2[i], (i+1)*8, height/2+-1*y1[i+1]+y2[i+1]);
    line(i*8, height/2+y1[i]+y2[i]*-1, (i+1)*8, height/2+y1[i+1]+y2[i+1]*-1);
      stroke(map(noise(theta2*2), 0, 1, 255, 0), 
         map(noise(theta1), .5, 1, 0, 255), 
         map(noise(frameCount*.1), 0, .5, 0, 255), 
         15);
    line(i*8, height/2+y1[i]+y2[i]*-1, (i+1)*8, height/2+y1[i+1]+y2[i+1]);
    line(i*8, height/2+y1[i]*-1+y2[i]*-1, (i+1)*8, height/2+y1[i+1]*-1+y2[i+1]);
    //line(i*8, height/2+y1[i], (i+1)*8, height/2+y1[i+1]);
    //line(i*8, height/2+y2[i], (i+1)*8, height/2+y2[i+1]);
  }
  
}

void bigCurve() {
  theta1+=.02;
  float dx1 = theta1;
  for(int i = 0; i < y1.length; i++) {
    y1[i] = noise(theta1*.01)*250*sin(3+dx1);
    dx1+=.17;
  }
  
}

void smallCurve() {
  theta2+=.029;
  float dx2 = theta2;
  for(int i = 0; i < y2.length; i++) {
    y2[i] = noise(theta2*.1+i*.001+frameCount*.001)*275*sin(3+dx2);
    dx2+=.031;
  }
  
}