float locx;
float locy;
float velx;
float vely;
float accx;
float accy;

int sz=30;

void setup() {
  size(1000, 800);
  locx= width/2;
  locy= height/2;
  velx=0;
  vely=0;
  accx= random(-.1, .1);
  accy= random(-.1, .1);
}

void draw() {
  accx= random(-.1, .1);
  accy= random(-.1, .1);
  fill(frameCount%360);

  velx+=accx;
  vely+=accy;
  
  locx+=velx;
  locy+=vely;

  ellipse(locx, locy, sz, sz);

  if (locx-sz/2>width) {
    locx=-sz/2;
  }
  if (locx + sz/2 < 0) {      
    locx = width + sz/2;
  }

  if (locy - sz/2 > height) {
    locy = -sz/2;
  }

  if (locy + sz/2 < 0) {         
    locy = height + sz/2;
  }
}

