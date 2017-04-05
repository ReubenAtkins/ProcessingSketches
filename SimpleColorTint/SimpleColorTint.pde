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
     color temp = img.pixels[location];
     float blue = randomGaussian()*255;
     float green = blue(temp);
     float red = green(temp);
     img.pixels[location] = color(red, green, blue);
      
      
    }
    
  }
  img.updatePixels();
  
  }
}