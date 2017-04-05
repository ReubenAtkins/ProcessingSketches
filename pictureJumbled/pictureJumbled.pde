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
      if(x*img.height % 2 == 0 && location < img.width*img.height -20 && location > 3) {
        
        
        img.pixels[location] = img.pixels[location+2];
        img.pixels[location+1] = img.pixels[location-2];
      }
      else { 
        
       // img.pixels[location]=img.pixels[location+2];
    }
    
    
    if(y*img.height % 2 == 0 && location < img.width * img.height - img.width*2 && location > img.width) {
      img.pixels[location] = img.pixels[location+img.width*2];
      img.pixels[location+img.width] = img.pixels[location-img.width];
      
    }
    
      
      
    }
    
  }
  img.updatePixels();
  
  }
  if(keyPressed == true) {
    if (key == 'v' || key == 'V') {
      saveFrame();
      
    }
  }
}