//Trump tweet data generator
ArrayList<String> listy = new ArrayList<String>();
Boolean candidacy = false;
Boolean winner = false;
Boolean presidency = false;
PFont bold;
PFont normz;
color white = color(255, 150);
color red = color(255, 0, 0);
Regression firstSegment = new Regression(white);
Regression secondSegment = new Regression(white);
Regression thirdSegment = new Regression(white);
Regression total = new Regression(red);
Boolean first = true;
Boolean second = true;
Boolean third = false;

void setup() {
  size(1300, 400);
  bold = createFont("Arial Bold", 16);
  normz = createFont("Arial", 10);
  textFont(bold);
  String[] lines = loadStrings("trumpData.txt");
  //listy += split(lines, " ");
  for(int i = 0; i < lines.length; i++) {
    String tokens = lines[i];
    String toke[] = 
    tokens.split(":", 2);
    for(int j = 0; j < toke.length; j++) {
      listy.add(toke[j]);
    }
    
  }
  println(listy.size()/2);
 /* int max = 0;
  for(int i = 0; i < listy.size(); i++) {
    if(i%2==1 && listy.get(i) != "0") {
    String temp = listy.get(i);
    println(temp);
    if(temp.contains("Mon Apr 04")) {
      println("TESTING!");
    }
    //if(max < Integer.parseInt(temp)) {
      //max = Integer.parseInt(temp);
    //}
    
  }
  
   }
  // println(max + "MAX");
   println(listy.size());
   */
   background(50);
}

void draw() {
  
textFont(bold);

float count = 0;
  for(int i = 0; i < listy.size(); i++) {
    if(i%2==0) {
    int temp = Integer.parseInt(listy.get(i));
 
      if(i != 0 && temp != 0) {
        stroke(190, 50, 50);
        strokeWeight(1);
        //line(1290-(i/2)/2.5, height, 1290-(i/2)/2.5, height-(temp*.001));    
        line(1290-count, height, 1290-count, height-(temp*.001));
        count+=.4255;
       // println(temp + "       "+(temp*.001));
       total.add(1290-count, height-temp*.001);
           if(first == false) {
             firstSegment.add(1290-count, height-temp*.001);
               
            }
            if(second == false) {
              secondSegment.add(1290-count, height-temp*.001);
              
            }
            if(third == false) {
              thirdSegment.add(1290-count, height-temp*.001);
            }
      }   
    }
    if(listy.get(i).contains("Nov 07")) {
      first = false;
      second = true;
    }
    if(listy.get(i).contains("Jan 20")) {
      second = false;
      third = true;
    }

    
 
  }

  

  sideGraph();
  textFields();
  thirdSegment.sketch();
  firstSegment.sketch();
  secondSegment.sketch();
  total.sketch();
    saveKey();
  noLoop();

}
public void sideGraph() {
  
      for(int i = 0; i < 10; i++) {
    textFont(normz);
    textAlign(LEFT);
    stroke(255);
    line(0, i*(400/10), 20, i*(400/10));
    text((10-i)*40000+" Likes",5, i*(400/10)+15);
  }
}
public void saveKey() {
    if(keyPressed == true) {
    if(key == 'v') {
      saveFrame();
  }
  }
  save("DANIELISACOOLKID2");
}
public void textFields() {
    for(int i = 0; i < listy.size(); i++) {
       if(listy.get(i).contains("Fri Jan 20") && presidency == false) {
      //fill(255);
      //ellipse(1300-(i/2)/2.5, 300, 10, 10);
      presidency = true;
      stroke(0, 0, 200, 100);
      strokeWeight(5);
     // textFont("arial bold");
      textSize(18);
      textAlign(CENTER);
      text("Jan. 20th.", 1290-(i/2)/2.5, 100);
      line(1143, 110, 1143, height);
     //1143.6279 400
      
    }
    if(listy.get(i).contains("Nov 07") && winner == false) {
     // ellipse(1300-(i/2)/2.5, 300, 10, 10);
      stroke(00, 0, 200, 100);
      strokeWeight(5);
      textAlign(CENTER);
      text("Nov. 7th", 1290-(i/2)/2.5, 100);
      line(986.1905, 110, 986.1905, height);
      //986.1905 400
      winner = true;
    }
    if(listy.get(i).contains("Jul 19") && candidacy == false) {
     // ellipse(1300-(i/2)/2.5, 300, 10, 10);
      stroke(00, 0, 200, 100);
      strokeWeight(5);
      textAlign(CENTER);
      text("Jul 19th", 1290-(i/2)/2.5, 100);
      //442.4171 400
      line(442.4171, 110, 442.4171, height);
      candidacy = true;
     // println("found!");
     // println(1290-(i/2/2.5));
    //  println(listy.size()/2);
    }
  }
  
}