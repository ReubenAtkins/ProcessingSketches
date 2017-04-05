PImage img, sorted;
pixelSorter sorter;

void setup() {
  size(400, 400);
  img = loadImage("marco.jpg");
  sorted = new PImage(img.width, img.height, RGB);
  sorted = img.get();
  sorter = new pixelSorter(sorted);
  //println(frameRate);
    sorter.sort();
  
  
  
  
}

void draw() {
  //sorter.update();
  
//image(sorted, 0, 0);
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
 // float ratio;
  
  
  
  pixelSorter(PImage sorting_) {
    index = 0;
    sorting = new PImage(sorting_.width, sorting_.height, RGB);
    sorting = sorting_.get();
    sorting.loadPixels();
    c = new color[sorting.width][sorting.height];
    //ratio = height*(sorting.width/sorting.height);
    //putting colors of images into 2d array so i can easily move own and up columns
    for(int x = 0; x < sorting.width; x++) {
      for (int y = 0; y < sorting.width; y++) {
        c[x][y] = sorting.pixels[y*sorting.width+x];
        
        
      }
    }
    sorting.updatePixels();

    
            
    
  }
  void sort() {
    //println(sorting.width, sorting.height);
    // can be computationally intensive, so set a limit on # of iterations to run and then save and exit
   // if(iterations < 15) {
    sorting.loadPixels();
    for (int x=0; x<sorting.width; x++) {
       int xSortStart = x;
       //randomly selected an x, goign through each y value, 
       //randomly selecting a column height now
      // int PixelsToChange = (int)random(1, sorting.height-y);
      int PixelsToChange = sorting.height;
      for(int i = 0; i < PixelsToChange; i++) {
      //  brightness can't be less than 0, so -1 since the first value will always be higher
      float record = -1;
      //starting pixel
      int pixRecord = i;
         for(int j = i; j < PixelsToChange;j++) {
         
         color temp = c[xSortStart][j];
         //organizing the pixels appropriately
         //determining which pixel to replace
         float brightness = red(temp)+blue(temp)+green(temp);
         if(brightness > record) {
             record = brightness;
             pixRecord = j;
             
             }
           }
         //c[xSortStart][pixRecord] = temp;
         //Swap sort right here
         color temp1 = c[xSortStart][i];
         c[xSortStart][i]=c[xSortStart][pixRecord];
         c[xSortStart][pixRecord] = temp1;
         
       }
       
       
      } 
      sorting.updatePixels();
      update();
    
  /*  }
   
      else {
      saveFrame();
      noLoop();
      
    }
    */
    
  }
  void update() {
    sorting.loadPixels();
    for(int x = 0; x < sorting.width; x++) {
      for(int y = 0; y < sorting.height; y++) {
        sorting.pixels[y*sorting.width+x] = c[x][y];
        }
      
    }
    sorting.updatePixels();
    //println(sorting.height +" "+sorting.width);
    iterations++;
    
  }
  void display() {
    image(sorting, 0, 0);
    
  }
    
   
  
}