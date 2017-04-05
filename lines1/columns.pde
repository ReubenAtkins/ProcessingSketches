class Columns {
  float x,y,z;
  ArrayList<Particles> plist = new ArrayList<Particles>();
  Columns() {
    int i = 0;
    while(i < width) {
      float r = random(.5, 5);
      plist.add(new Particles(i+r, random(height), r));
      
      
      i+=r;
      
      
    }
    
  }
  void display() {
    for (int i = plist.size()-1; i >=0; i--) {
      Particles p = plist.get(i);
      p.go();
      
    }
    
    
  }
  
  
  
}