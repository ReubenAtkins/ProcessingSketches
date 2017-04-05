// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/JUDYkxU6J0o

PImage img;
PImage sorted;
int index = 0;

void setup() {
  size(600, 600);

  img = loadImage("screen-0638.jpg");
  sorted = createImage(img.width, img.height, RGB);
  sorted = img.get();
}

void draw() {
 // println(frameRate);

  sorted.loadPixels();

  // Selection sort!
  for (int n = 0; n < 100; n++) {
    float record = -1;
    int selectedPixel = index;
    for (int j = index; j < sorted.pixels.length; j++) {
      color pix = sorted.pixels[j];
      float b = hue(pix);
      if (b > record) {
        selectedPixel = j;
        record = b;
      }
    }

    // Swap selectedPixel with i
    color temp = sorted.pixels[index];
    sorted.pixels[index] = sorted.pixels[selectedPixel];
    sorted.pixels[selectedPixel] = temp;

    if (index < sorted.pixels.length -1) {
      index++;
    }
    else {
     // sorted.saveFrame();
      noLoop();
      
    }
  }


  sorted.updatePixels();

  background(0);
  //image(img, 0, 0);
  image(sorted, 0, 0);
}