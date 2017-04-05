PImage img, sorted;
pixelSorter sorter;

void setup() {
  size(1536, 1943);
  img = loadImage("Scan0009.jpg");
  sorted = new PImage(img.width, img.height, RGB);
  sorted = img.get();
  sorter = new pixelSorter(sorted);
  println(frameRate);
  
  
  
  
}

void draw() {
  //image(sorted, 0, 0);
  sorter.sort();
  sorter.display();
  saveKeyed();
  
}
void saveKeyed() {
   if(keyPressed) {
   if (key == 'v' || key == 'V') {
      saveFrame();
      
    }
    if(key == 'z' || key == 'Z') {
      noLoop();
    }
  }
  
}
class pixelSorter {
  int index;
  int location;
  PImage sorting;
  color[][] c;
  int iterations = 0;
  
  
  
  pixelSorter(PImage sorting_) {
    index = 0;
    sorting = new PImage(sorting_.width, sorting_.height, RGB);
    sorting = sorting_.get();
    sorting.loadPixels();
    c = new color[sorting.width][sorting.height];
    //putting colors of images into 2d array so i can easily move own and up columns
    for(int x = 0; x < sorting.width; x++) {
      for (int y = 0; y < sorting.width; y++) {
        c[x][y] = sorting.pixels[y*sorting.width+x];
        
        
      }
    }
    sorting.updatePixels();
   // println(c[1][1]);
    
            
    
  }
  void sort() {
    if(iterations < 15) {
    sorting.loadPixels();
    for (int y=0; y<sorting.height-1; y++) {
       int xSortStart = (int)random(0, width);
       int PixelsToChange = (int)random(1, sorting.height-y);
       for(int i = 0; i < PixelsToChange; i++) {
         float record = brightness(c[xSortStart][y+i]);
         int pixRecord = y+i;
         for(int j = i; j < PixelsToChange;j++) {
         
         color temp = c[xSortStart][y+j];
         //organizing the pixels appropriately
         float brightness = brightness(temp);
         if(brightness > record) {
             record = brightness;
             pixRecord = y+j;
             
             }
           }
         c[xSortStart][y+i]=c[xSortStart][pixRecord];
         
       }
       
       
      } 
      sorting.updatePixels();
      update();
      
    }
    else {
      saveFrame();
      noLoop();
      
    }
  }
  void update() {
    sorting.loadPixels();
    for(int x = 0; x < sorting.width; x++) {
      for(int y = 0; y < sorting.height; y++) {
        sorting.pixels[y*sorting.width+x] = c[x][y];
        }
      
    }
    sorting.updatePixels();
    iterations++;
    
  }
  void display() {
    image(sorting, 0, 0);
    
  }
    
   
  
}