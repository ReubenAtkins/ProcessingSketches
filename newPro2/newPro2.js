
function setup() {
  createCanvas(windowWidth, windowHeight);
  background(0);

}

function draw() {
  background(0);
  
  for (var i = 0; i < windowWidth; i+=10) 
  {
    push();
   
    for (var j = 0 ; j < windowHeight; j+=10) 
    {
      translate(i, j);
      fill(i, j, 255);
      //rectMode("");
      
      rect(0, 0, 10, 10);
      
      
    }
    pop();
    
   
  }
  

  
  
}