Bubbles bubble[] = new Bubbles[50];
int lives = 100;
void setup() {
  for(int i = 0; i < bubble.length; i++) {
    bubble[i] = new Bubbles(int(random(width)), int(random(height)));
    
  }
 // bubble[0] = new Bubbles();
  size(600, 600);
}

void draw() {
  background(0);
  text(lives, 20, 30);
  if (lives > 0) {
  for (int i = 0; i < bubble.length; i++) {
    bubble[i].update();
   bubble[i].display(); 
   bubble[i].mouseOver(mouseX, mouseY);
   for (int j = 0; j < bubble.length; j++) {
     if (i != j && j > i) {
     bubble[i].collision(bubble[j]);
     }
   }
  }
  }
  else if(lives <= 0) { text("GAME OVER", width/2-10, height/2); }
  
  
  
  
}