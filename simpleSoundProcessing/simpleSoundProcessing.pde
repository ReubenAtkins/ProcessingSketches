import processing.sound.*;
Amplitude amp;
AudioIn in;
int x = 0;
void setup() {
size(400, 400);  
background(255);
amp = new Amplitude(this);
in = new AudioIn(this, 0);
in.start();
amp.input(in);
  
}

void draw() {
  line(x, height/2, x, height/2+amp.analyze()*300);
  x++;
  if(amp.analyze() > .05) {
    
    ellipse(random(width), random(height), amp.analyze()*30, amp.analyze()*30);
    
  }
  if (x > width) {
    x = 0;
    background(255);
   
  }
  
  
}