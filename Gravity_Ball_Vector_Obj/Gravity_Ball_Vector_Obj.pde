GravityBall[] g= new GravityBall[2000];

void setup() {
  size(1000, 800);
  for (int i = 0; i< g.length; i++) {
    g[i]= new GravityBall();
  }
}
void draw() {
  background(0, 0, 255);
  for (int i=0; i< g.length; i++) {
    g[i].display();
    g[i].move();
    g[i].bounce();
  }
}

class GravityBall {
  PVector loc, vel, acc;
  float sz;

  GravityBall() {
    sz=5;
    loc= new PVector(random(sz, width-sz), random(height/2));
    vel= new PVector(0, 0);
    acc= new PVector(0, .5);
  }

  void display() {
    fill(0);
    ellipse(loc.x, loc.y, sz, sz);
  }

  void move() {
    vel.add(acc);
    loc.add(vel);
  }
  void bounce() {
    if (loc.y> height- sz/2) {
      loc.y= height-sz/2;
      vel.y= -abs(vel.y);
    }
  }
}

