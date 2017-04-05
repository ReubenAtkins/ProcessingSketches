var img;
var countX = 0;
var countY = 0;
function preload() {
  img = loadImage("assets/asset1.png");
}
function setup() {
  createCanvas(600, 600);
  background(0);
  image(img, 0, 0);
}

function draw() {
  background(0);
  image(img, countX%width, countY%height);
  countX+=random(-10, 10);
  countY+=random(-10, 10);
  
}