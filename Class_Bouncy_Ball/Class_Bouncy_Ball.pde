collidingBall[] balls= new collidingBall[5];
void setup() {
  size(1000, 800);
  for (int i=0; i < balls.length; i++) {
    balls[i]= new collidingBall(random(5, 50), random(.5, 19));
  }
}
void draw() {
  background(0, 0, 200);
  for ( int i=0; i < balls.length; i++) {
    balls[i].display();
    balls[i].move();
    balls[i].bounce();
    for ( int j= 0; j< balls.length; j++) {
      if (i!=j) {
        balls[i].collideWith(balls[j]);
      }
    }
  }
}
class collidingBall{
  PVector loc, vel;
  float sz;
  float speed;
  
  collidingBall(float tempsz, float tempspeed) {
    sz= tempsz;
    loc= new PVector(random(sz,width-sz), random(sz, height-sz));
    vel= PVector.random2D();
    speed= tempspeed;
    vel.mult(speed);
  }
  void display() {
    fill(0);
    ellipse(loc.x, loc.y, sz,sz);
  }
  
  void move() {
    loc.add(vel);
  }

void bounce() {
  if (loc.x + sz/2 > width || loc.x -sz/2< 0) {
    vel.x *=-1;
  }
  if (loc.y + sz/2 > height || loc.y - sz/2< 0) {
    vel.y *= -1;
  }
}
void collideWith(collidingBall OtherBall) {
  if( loc.dist(OtherBall.loc) < sz/2 + OtherBall.sz/2) {
    vel= PVector.sub(loc, OtherBall.loc);
    vel.normalize();
    vel.setMag(speed);
  }
}
}
