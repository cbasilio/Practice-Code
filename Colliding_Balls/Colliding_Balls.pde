//declare variables
PVector loc, vel, acc, mouse;
int sz= 60;
void setup() {
  size( 1000, 800);
  //initialize variables
  loc = new PVector(width/2, height/2);
  vel= PVector.random2D();
  acc=new PVector(0, 0);
  mouse= new PVector();
}

void draw() {
  mouse.set(mouseX, mouseY);
  background(0);

  vel.add(acc);
  loc.add(vel);

  if (loc.dist(mouse) < sz/2) {        
    if (loc.x < mouse.x) {     
      vel.x = -abs(vel.x);
    } else {                 
      vel.x = abs(vel.x);
    }
    if (loc.y < mouse.y) {    
      vel.y = -abs(vel.y);
    } else {
      vel.y = abs(vel.y);
    }
  }
  ellipse(loc.x, loc.y, sz, sz);
  if (loc.x + sz/2 > width || loc.x - sz/2 < 0) {
    vel.x *= -1;
  }
  if (loc.y + sz/2 > height || loc.y - sz/2 < 0) {
    vel.y *= -1;
  }
}

