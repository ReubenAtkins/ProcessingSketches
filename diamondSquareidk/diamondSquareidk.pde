//diamond-square algorithm
diamondSquare d;
ArrayList <diamondPt> ds;
void setup() {
  size(300, 300);
  d = new diamondSquare();
  ds = new ArrayList<diamondPt>();
/*  for(int x = 0; x < width; x++) {
    for(int y = 0; y < height; y++) {
      PVector temp = new PVector(x, y);
      ds.add(new diamondPt(temp));
    }
  }
  */
}

void draw() {
  
  
}


class diamondSquare {
  color bPt1, bPt2, bPt3, bPt4;
  
  diamondSquare() {
    bPt1 = randomColor();
    bPt2 = randomColor();
    bPt3 = randomColor();
    bPt4 = randomColor();
  }
  color randomColor() {
    color randCol = color(random(255), random(255), random(255));
    return randCol;
  } 
}
class diamondPt {
  PVector loc1, loc2, loc3, loc4;
  diamondPt(PVector tLoc1, PVector tLoc2, PVector tLoc3, PVector tLoc4) {
    loc1 = tLoc1;
    loc2 = tLoc2;
    loc3 = tLoc3;
    loc4 = tLoc4;
  }
}