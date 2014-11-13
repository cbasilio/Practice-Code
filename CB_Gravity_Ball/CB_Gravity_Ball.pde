int x=400;
int y=400;
int sz=50;
int yspeed=1;

void setup() {
  size(800,600);
}

void draw() {
  background(0);
  x=400;
  y=400;
  sz=50;
  ellipse(x,y,sz,sz);
  velx+= gravity;
  x+= velx;
  y+=vely;
  if(y>10) {
    y+=yspeed;
  }
  if(y+sz/2>height || y-sz/2<0) {
    yspeed*=1;
  }
}
