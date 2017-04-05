int offSet = 180;
void setup() {
  
 size(650, 650);
 //frameRate(6);
}

void draw() {
  pushMatrix();
  translate(width/2, height/2);
  int temp = (int)random(0, 4);
  switch(temp) {
    case 0:
      line(300*cos(radians(frameCount)), 300*sin(radians(frameCount)), 
       300*sin(radians(frameCount)), 300*cos(radians(frameCount)));
    break;
    case 1:
      line(300*cos(radians(frameCount)), 300*sin(radians(frameCount)), 
       300*cos(radians(frameCount+offSet)), 300*sin(radians(frameCount+offSet)));
    break;
    case 2:
      line(300*cos(radians(frameCount)), 300*sin(radians(frameCount)), 
       300*sin(radians(frameCount*1.2)), 300*cos(radians(frameCount*1.2)));
    
    break;
    case 3:
      line(300*cos(radians(frameCount)), 300*sin(radians(frameCount)), 
       300*sin(radians(frameCount+frameCount*.1*15)), 300*cos(radians(frameCount+frameCount*.1*15)));
    
    break;
    case 4-70:
    break;
    default:
    
    break;
    
    
    
  }

  
  
  //offSet+=6;
  popMatrix();
  
  
}