PImage img;
void setup() {
  size(800, 800);
  img = loadImage("Scan0009.jpg");
  if(img.height > img.width) {
    img.resize(height, 0);
    
  }
  else {
    img.resize(0, width);
    
    
  }
 // System.out.println(img.height +" "+img.width);
  
  
}

void draw() {

  image(img, 0, 0);
  img.loadPixels();
  if(mousePressed == true) {
  for(int x = 0; x < img.width; x++) {
    for(int y = 0; y < img.height; y++) {
      int location = y*img.width+x;
      if(x*img.height % 2 == 0 && location < img.width*img.height -3) {
        
        
        img.pixels[location] = img.pixels[location+2];
        
      }
      else { 
        
       // img.pixels[location]=color(255,255,255);
    }
      
      
    }
    
  }
  img.updatePixels();
  
  }
}