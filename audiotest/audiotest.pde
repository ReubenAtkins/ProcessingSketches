import processing.sound.*;
//change mic output 
FFT fft;
AudioIn in;
int bands = 512;
float[] spectrum = new float[bands];

void setup() {
  size(512, 360);
  background(255);
    
  // Create an Input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  
  // start the Audio Input
  in.start();
  
  // patch the AudioIn
  fft.input(in);
}      

void draw() { 
  background(255);
  fft.analyze(spectrum);
  

  for(int i = 0; i < bands; i+=2){
  // The result of the FFT is normalized
  // draw the line for frequency band i scaling it up by 5 to get more amplitude.
  pushMatrix();
  println(spectrum[i]);
  translate(i, .5*height);
  ellipse(40, 40, spectrum[i]*3000, spectrum[i]*3000);
  color c = color(map(spectrum[i]*100, 0, 1, 0, 255));
  fill(c);
  popMatrix();
  } 
}