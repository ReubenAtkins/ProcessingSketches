import rita.*;
RiMarkov trumpz;
IntDict counts;
String[] results;
//PrintWriter out = new PrintWriter("testing7.txt");
//String results;
void setup() {
  
  //results = new String[10];
  //size(1200, 400);
  textSize(15);
  trumpz = new RiMarkov(2);
  trumpz.loadFrom("rainbow.txt", this);
  background(0);
  fullScreen();
/* for(int i = 0; i < 10; i++) {
   results[i] = trumpz.generateSentence();
   
 }
 */
  results = trumpz.generateSentences(15);
 
}

void draw() {
  for(int i = 0; i < 10; i++) {
    text(results[i], 15, i*30+150);
  }
  if(keyPressed) {
    if (key == 'v' || key == 'V') {
       saveFrame(); 
    }
    if(key == 'z' || key == 'Z') {
      results = trumpz.generateSentences(15);
      background(0);
    }
  }
  
}