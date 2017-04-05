PImage img, sort;
int index = 0;


void setup() {
  size(400, 400);
  img = loadImage("Scan0009.jpg");
  if(img.height > img.width) {
    img.resize(height, 0);
    
  }
  else {
    img.resize(0, width);
    
    
  }
  sort = img.get();
  sort.loadPixels();
 // System.out.println(img.height +" "+img.width);
  
  
}

void draw() {

  image(sort, 0, 0);
  float record = -1;
  int selectedPixel = index;
 

    for(int y = index; y < sort.pixels.length; y++) {
      
      color temp = sort.pixels[y];
      float h = brightness(temp);
      if (h > record) {
        record = h;
        selectedPixel = y;
        
        
      }
   
    }
    color temp = sort.pixels[index];
    sort.pixels[index]=sort.pixels[selectedPixel];
    sort.pixels[selectedPixel] = temp;
    if (index < sort.pixels.length -1) {
      index++;
    }

}