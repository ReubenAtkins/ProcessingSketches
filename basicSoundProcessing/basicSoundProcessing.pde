import processing.sound.*;
Amplitude amp;
AudioIn in;

void setup() {
size(400, 400);  
background(255);
amp = new Amplitude(this);
in = new AudioIn(this, 0);
in.start();
amp.input(in);
  
}

void draw() {
 background(254, 1);
 noStroke();
  if(amp.analyze() > .05) {
    
    fill(map(amp.analyze(), 0, .01, 255, 1), 150);
    println(amp.analyze());
    ellipse(width/2, height/2, amp.analyze() * 300, amp.analyze()*300);
    
  }

  
  
}