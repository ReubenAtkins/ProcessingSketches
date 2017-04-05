int cubey = 50;
squareLines test;

void setup() { 
  size(600, 600, P3D);
  background(0);  
  test = new squareLines(100);
  
}

void draw() { 
 background(0);
  
  test.update();
  test.display();

 
  
  
}