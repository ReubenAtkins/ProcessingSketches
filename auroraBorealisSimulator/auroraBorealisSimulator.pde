float[] dx;
float[] dy;
float timedx;
float zChange;
float theta =1;
final int aOL = 100;
float period = 600/PI;
//aol = amount of lines
void setup() {
  size(600, 600, P3D);
  background(50);
  dx = new float[aOL];
  dy = new float[aOL];
  zChange = 14;
  camera(-300, 600, (height/2.0) / tan(PI*30.0 / 180.0)+600, 
         0, 0, 0, 
         0, 1, 0);
}


void draw() {
   /*camera(300+300*sin(radians(frameCount*.5)), 300+300*cos(radians(frameCount*.5)), (height/2.0) / tan(PI*30.0 / 180.0), 
         width, height, 0, 
         0, 1, 0);
         
      */
        camera(-300, 600, (height/2.0) / tan(PI*30.0 / 180.0)+600, 
         0, 0, 0, 
         0, 1, 0);
         //println(cos(radians(frameCount)));
      
  background(0);
/*  stroke(255, 255, 0); ellipse(width/2, height/2, 50, 50);
    stroke(255,0,0); line(0,0,0, 1000,0,0); // x axis
  stroke(0,255,0); line(0,0,0, 0,1000,0); // ... y
  stroke(0,0,255); line(0,0,0, 0,0,1000); // ... z
  stroke(255);
 pushMatrix();
  translate(600, 600, 300);
  box(600, 10, 900);
  popMatrix();
  */
  stroke(255, 5);
  for(int i = 0; i < dx.length; i++) {
    dx[i] = 100*sin(radians(3*(frameCount+i)));
    dy[i] = 100*cos(radians(.5*(frameCount+i)));
    if(i != 0) {
      line(dx[i-1], dy[i-1],-zChange*(i-1),
           dx[i], dy[i],-zChange*(i));
           stroke(255, map(noise(i*.1+theta), 0, 1, 0, 255));
           strokeWeight(map(noise(i*.1+frameCount*.01), 0, 1, 0, 5));
      line(dx[i], dy[i],-zChange*(i), dx[i], dy[i]-9300, -zChange*(i));
     //println(dx[i] +"               " + dx[i-1]+ "        "+ i*xChange);
    //  println(dx[i-1]+i*yChange);
    }
  }
  theta+=.01;
 
  
  
  
}