int count= 180;
//declare variables
PVector[] loc= new PVector[count];
PVector[] vel= new PVector[count];
PVector[] acc= new PVector[count];
float[] sz= new float[count];

void setup(){
  size(1000, 800);
  //initialize variables
  for (int i = 0; i <count; i++) {
    sz[i] = random(10, 50);
    loc[i]= new PVector(random(sz[i], width-sz[i]), random(sz[i], height- sz[i]));
    vel[i] = PVector.random2D();
    acc[i]= new PVector(0, 0);
  }
}


  void draw() {
    background(0, 0, 255);
    for (int i=0; i< count; i++) {
      vel[i].add(acc[i]);
      loc[i].add(vel[i]);

      for (int j= 0; j< count; j++) {
        if (i!=j) {
          if (loc[i].dist(loc[j]) < sz[i]/2 + sz[j]/2) { //...if it is...
            if (loc[i].x < loc[j].x) {    //if ball 1 is to the left of ball 2...
              vel[i].x = -abs(vel[i].x);
              vel[j].x = abs(vel[j].x);
            } else {
              vel[i].x = abs(vel[i].x);
              vel[j].x = -abs(vel[j].x);
            }
            if (loc[i].y < loc[j].y) {    //if ball 1 is to the left of ball 2...
              vel[i].y = -abs(vel[i].y);
              vel[j].y = abs(vel[j].y);
            } else {
              vel[i].y = abs(vel[i].y);
              vel[j].y = -abs(vel[j].y);
      }
      }
      }
      }
fill(0);
      //draw the ball
      ellipse(loc[i].x, loc[i].y, sz[i], sz[i]);

      //bounce the ball
      if (loc[i].x + sz[i]/2 > width || loc[i].x - sz[i]/2 < 0) {
        vel[i].x *= -1;
      }
      if (loc[i].y + sz[i]/2 > height || loc[i].y - sz[i]/2 < 0) {
        vel[i].y *= -1;
      }
    }
  }


