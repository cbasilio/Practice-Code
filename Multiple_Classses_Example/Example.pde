class BouncyBall{
  PVector loc, vel, acc;
  float sz;
  float speed;
  
  BouncyBall(float tempsz, float tempspeed) {
    sz= tempsz;
    speed= tempspeed;
    loc= new PVector(random(sz,width-sz), random(sz, height-sz));
    vel= PVector.random2D();
    vel.setMag(speed);
  }
  
  void display() {
    fill(255);
    ellipse(loc.x, loc.y,sz,sz);
  }
  void move() {
    vel.add(acc);
    loc.add(vel);
  }
  void wallBounce() {
    if (loc.x+ sz/2 > width) {
      vel.x= -abs(vel.x);
    }
    if(loc.x - sz/2< 0) {
      vel.x= abs(vel.x);
    }
    if (loc.y + sz/2 > height) {
      vel.y = -abs(vel.y);
    }
    if(loc.y - sz/2 < 0) {
      vel.y = abs(vel.y);
    }
  }
  void collideWith(BouncyBall other) {
    if( loc.dist(other.loc) < sz/2 + other.sz/2) {
      vel=PVector.sub(loc,other.loc);
      vel.setMag(speed);
    }
  }
  void goAway() {
    loc.set( width*10, height*10);
    vel.set(0,0);
  }
 // void teleport() {
   // loc.set(mouseX,mouseY);
    //vel= PVector.random2D();
  //}
  
  void isSuckedIn(BlueHole doom) {
    acc= PVector.sub(doom.loc,loc);
    acc.setMag(.1);
  }
}
    
  
