class Regression {
  ArrayList<PVector> segment = new ArrayList<PVector>();
  float m, y;
  color c;
  Regression(color c1) {
    c = c1;
    
   
  }
  void add(float x, float y) {
    segment.add(new PVector(x, y));
    
  }
  void print() {
    for(int i = 0; i < segment.size(); i++) {
      
      PVector temp = segment.get(i);
      println(temp.x + "       " + temp.y);
    }
  }
  void slope() {
    float a = 0; float b = 0; float c = 0; float d = 0;
    float b1 = 0; float b2 = 0;
    for(int i = 0; i < segment.size(); i++) {
      PVector temp = segment.get(i);
      a+=(temp.x * temp.y);
      b1 += temp.x;
      b2 += temp.y;
      c+=(temp.x*temp.x);
      d+= temp.x;
     
    }
    b = b1*b2;
    d = d*d;
    c*=segment.size();
    a*= segment.size();
    m=(a-b)/(c-d);
    
  }
  void intercept() {
    float e = 0;
    float f = 0;
    for(int i = 0; i < segment.size(); i++) {
      PVector temp = segment.get(i);
      e += temp.y;
      f += temp.x;
    }
    f*=m;
    y=(e-f)/(segment.size());
    
  }
  void sketch() {
    slope();
    intercept();
    PVector first = segment.get(0);
    PVector last = segment.get(segment.size()-1);
    strokeWeight(1.5);
    stroke(c);
    
    line(first.x, first.x*m+y,last.x, last.x*m+y);
    
    
  }
  
}