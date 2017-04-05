IntDict counts;
void setup() {
  //size(600, 600);
  background(0);
  fullScreen();
  counts = new IntDict();
  String[] lines = loadStrings("rainbow.txt");
  String allwords = join(lines, "\n");
  String[] tokens = splitTokens(allwords,".?!,;: \n\"");
  for(int i = 0; i < tokens.length; i++) {
    String word = tokens[i].toLowerCase();
    if(counts.hasKey(word)) {
      counts.increment(word);
    }else {
      counts.set(word, 1);
    }
    
  }
  /*
  String[] keys = counts.keyArray();
  for(String keyz: keys) {
    float x= random(width);
    float y = random(height);
    text(keyz, x, y);
  }
  */
  counts.sortValuesReverse();
  //counts.remove("and");
  //counts.remove("the");
  //counts.remove("of");
  String[] keys = counts.keyArray();
  for(int i = keys.length -1; i >= 0; i--) {
  String keyz = keys[i];
    if(counts.get(keyz) < 2) {
      counts.remove(keyz);
    }
  }
  
  println(counts);
  
}

void draw() {
  String[] keys = counts.keyArray();
  int countz = 0;
 
  for(int i = 0; i < keys.length; i++) {

    rect(i*15, 0, 15, 1*counts.get(keys[i]));
    String txt = String.format(keys[i] + " " + counts.get(keys[i]));
    text(txt, i*15, height - i*10);
    countz++;
  }
  
}