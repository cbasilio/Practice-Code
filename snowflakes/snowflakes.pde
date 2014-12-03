//declare variables
int count= 1000;
PImage snowflake;
PVector[] loc= new PVector[count];
PVector[] vel= new PVector[count];
PVector[] acc= new PVector[count];
float[] sz= new float[count];
float[] theta= new float[count];

void setup() {
  size(1000, 900);
  snowflake= loadImage("snowflake.png");
  for (int i=0; i< count; i++) {
    sz[i]= random(5, 50);
    loc[i]= new PVector(random(width), random(-height*1.5, -sz[i]/2));
    vel[i]=new PVector(0, random(1));
    acc[i]=new PVector(0, .5);
    theta[i]= random(TWO_PI);
  } 
  noStroke();
  fill(255,200);
}
  void draw() {
    background(0);
    for(int i= 0; i< count; i++) {
    vel[i].add(acc[i]);
    loc[i].add(vel[i]);
    vel[i].limit(4);
    pushMatrix();
    translate(loc[i].x, loc[i].y);
    rotate(theta[i]);
    image(snowflake, 0, 0, sz[i], sz[i]);
    popMatrix();
    acc[i].x = random(-.05, .05);
    if (loc[i].y - sz[i]/2 > height) {
      loc[i].set(random(width), random(-height, -sz[i]/2));
      vel[i].set(0, 1);
    }
  }
  }

