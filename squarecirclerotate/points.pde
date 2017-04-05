class squareLines {
 int x = 100;
 int y = 100;
 int z = 100;
 int cubey = 100;
 float[] polarX = new float[8];
 float[] polarY = new float[8];
 float[] polarZ = new float[8];
 
 
 squareLines(int r) {
   x = r;
 }
 void update() {
   for (int i = 0; i < 8; i++) {
     polarX[i] = 3*sin(radians(frameCount*(1+i/4)))*cos(radians(frameCount*(1+i/2)));

     polarY[i] = 3*sin(radians(frameCount*(1+i/4)))*cos(radians(frameCount*(1+i/2)));

     polarZ[i] = 3*sin(radians(frameCount*(1+i/4)))*cos(radians(frameCount*(1+i/2)));
   }
   
   
 }
 void display() {
     pushMatrix();
  translate(.5*width, .5*height, 0);

  beginShape(QUADS);
  
  //1
  vertex(cubey+polarX[0], cubey+polarY[0], cubey+polarZ[0]);
  vertex(-cubey+polarX[1], cubey+polarY[1], cubey+polarZ[1]);
  vertex(-cubey+polarX[2], -cubey+polarY[2], cubey+polarZ[2]);
  vertex(cubey+polarX[3], -cubey+polarY[3], cubey+polarZ[3]);
  //2
  vertex(cubey+polarX[0], cubey+polarY[0], cubey+polarZ[0]);
  vertex(cubey+polarX[3], -cubey+polarY[3], cubey+polarZ[3]);
  vertex(cubey+polarX[4], -cubey+polarY[4], -cubey+polarZ[4]);
  vertex(cubey+polarX[5], cubey+polarY[5], -cubey+polarZ[5]);
  //3
  vertex(cubey+polarX[4], -cubey+polarY[4], -cubey+polarZ[4]);
  vertex(cubey+polarX[5], cubey+polarY[5], -cubey+polarZ[5]);
  vertex(-cubey+polarX[6], cubey+polarY[6], -cubey+polarZ[6]);
  vertex(-cubey+polarX[7], -cubey+polarY[7], -cubey+polarZ[7]);
  //4
  vertex(cubey+polarX[3], -cubey+polarY[3], cubey+polarZ[3]);
  vertex(cubey+polarX[4], -cubey+polarY[4], -cubey+polarZ[4]);
  vertex(-cubey+polarX[7], -cubey+polarY[7], -cubey+polarZ[7]);
  vertex(-cubey+polarX[2], -cubey+polarY[2], cubey+polarZ[2]);
  //5
  vertex(-cubey+polarX[1], cubey+polarY[1], cubey+polarZ[1]);
  vertex(cubey+polarX[0], cubey+polarY[0], cubey+polarZ[0]);
  vertex(cubey+polarX[5], cubey+polarY[5], -cubey+polarZ[5]);
  vertex(-cubey+polarX[6], cubey+polarY[6], -cubey+polarZ[6]);
  //6
  vertex(-cubey+polarX[2], -cubey+polarY[2], cubey+polarZ[2]);
  vertex(-cubey+polarX[7], -cubey+polarY[7], -cubey+polarZ[7]);
  vertex(-cubey+polarX[6], cubey+polarY[6], -cubey+polarZ[6]);
  vertex(-cubey+polarX[1], cubey+polarY[1], cubey+polarZ[1]);

   rotateY(radians(frameCount));
   rotateX(radians(frameCount));
  


  endShape();
  popMatrix();
   
 }
}