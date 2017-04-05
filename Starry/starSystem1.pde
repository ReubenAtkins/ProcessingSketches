class starSystem {
  ArrayList<Stars> plist = new ArrayList<Stars>();
  
  starSystem() {
    float r1;
    float r2;
    float r3;
    float r4;
    float r5;
    
    for (int i = 0; i < 150; i++) {
      r1 = random(width);
      r2 = random(height);
      r3 = random(.1, 2);
      r5 = random(1, 10);;
      
      //1 seed star, 5 more stars behind it
      plist.add(new Stars(r1, r2, r3, r5, 5));
       for (int j = 0 ; j < 5; j++) {
         plist.add(new Stars(r1, r2+r3*7*j, r3, r5, 4-j));
       }
       
      
    }
    

  }
  void display() {
  for(int i = plist.size()-1; i >=0 ; i--) {
    Stars s = plist.get(i);
    s.update();
    s.display();
    }
    
  }
  
  
  
}