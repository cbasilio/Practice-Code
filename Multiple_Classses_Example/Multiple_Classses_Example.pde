class BlueHole {
  PVector loc;
  float sz;
  
  BlueHole() {
    loc= new PVector(random(width), random(height));
    sz= 1;
  }
  void display () {
    fill(0,0,255);
    ellipse(loc.x, loc.y, sz,sz);
  }
  
  void consumes(BouncyBall food) {
    if(loc.dist(food.loc) < sz/2 + food.sz/2) {
      //food.teleport();
      sz+=food.sz/100;
    }
  }
}

