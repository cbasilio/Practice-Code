BouncyBall[] balls= new BouncyBall[150];
BlueHole h;

void setup(){
  size(1000,800);
  h= new BlueHole();
  for( int i=0; i< balls.length; i++) {
    balls[i] = new BouncyBall(random(5,60), random(.1,10));
  }
}
void draw() {
  background(0);
  
  for (int i=0; i <balls.length; i++) {
    h.consumes(balls[i]);
    balls[i].display();
    balls[i].isSuckedIn(h);
    balls[i].move();
    balls[i].wallBounce();
  }
  h.display();
}
