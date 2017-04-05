var star;
function setup() {
  createCanvas(width, height);
  star = new Stars(.5*width, .5*height, 10, 10, 5);

}

function draw() {
  background(0);
  star.update();
  
  
}