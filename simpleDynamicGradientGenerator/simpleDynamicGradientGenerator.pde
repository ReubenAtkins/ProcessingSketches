
void setup() {
  size(400, 400);
  
  
}

void draw() {
  //background(255);
  loadPixels();
 //   if(mousePressed == true) {
  for(int x = 0; x < width; x++) {
    for(int y = 0; y < height; y++) {
      int location = y*width+x;        
        pixels[location] = color(map(mouseX, 0, 400, 0, 255), map(y, 0, 400, 0, 255), map(mouseX*mouseY, 0, 400*400, 0, 255));
        //pixels[location+2];
        
      

      
      
    }
    
  }
  updatePixels();
  
 // }
  
  
}