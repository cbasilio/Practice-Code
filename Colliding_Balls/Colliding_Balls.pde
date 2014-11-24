//declare variables
PVector loc1, vel1, acc1 ;
PVector loc2, vel2, acc2;
int sz= 50;
int sz2= 40;
void setup() {
  size( 1000, 800);
  //initialize variables
  loc1 = new PVector(width/2, height/2);
  vel1= PVector.random2D();
  acc1=new PVector(0, 0);
  loc2 = new PVector(width*.25, height*.25);
  vel2= PVector.random2D();
  acc2= new PVector(0, 0);
}

void draw() {
  background(0);
  vel1.add(acc1);
  loc1.add(vel1);
  vel2.add(acc2);
  loc2.add(vel2);

  if (loc1.dist(loc2) < sz/2+ sz2/2) {        
    if (loc1.x < loc2.x) {     
      vel1.x = -abs(vel1.x);
      vel2.x= abs(vel2.x);
    } else {                 
      vel1.x = abs(vel1.x);
      vel2.x= -abs(vel2.x);
    }
    if (loc1.y < loc2.y) {    
      vel1.y = -abs(vel1.y);
      vel2.y= abs(vel2.y);
    } else {
      vel1.y = abs(vel1.y);
      vel2.y= -abs(vel2.y);
    }
  }
  ellipse(loc1.x, loc1.y, sz, sz);
  ellipse(loc2.x, loc2.y, sz2, sz2);
  if (loc1.x + sz/2 > width || loc1.x - sz/2 < 0) {
    vel1.x *= -1;
  }
  if (loc1.y + sz/2 > height || loc1.y - sz/2 < 0) {
    vel1.y *= -1;
  }
  if (loc2.x + sz2/2 > width || loc2.x - sz2/2 < 0) {
    vel2.x *= -1;
  }
  if (loc2.y + sz2/2 > height || loc2.y - sz2/2 < 0) {
    vel2.y *= -1;
  }
}
void mouseReleased() {
  loc2.set(mouseX, mouseY);
}

