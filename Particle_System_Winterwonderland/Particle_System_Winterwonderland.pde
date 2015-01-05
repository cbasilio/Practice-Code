// Goal = Create Cool Snow Stuff
ArrayList<Snow> particles= new ArrayList<Snow>();
PVector loc, vel, acc, wind;
float sz, lifespan;
PImage b; 


void setup() {
  size(displayWidth, displayHeight);
  //Winter Wonderland Setting
  b= loadImage("Winter.jpg");
  b.resize(displayWidth, displayHeight);
}

void draw() {
  //if(mousePressed) 
  {
    particles.add(new Snow());
  }
  image(b, 0, 0);

  //set instructions
  textSize(32);
  text("Hold the Mouse", 10, 30);
  fill(0, 102, 153);

  for (int i= particles.size ()-1; i>=0; i--) {
    Snow currentSnow= particles.get(i);
    currentSnow.display();
    currentSnow.move();
    if ( currentSnow.isDead()) {
      particles.remove(i);
    }
  }
}

class Snow {
  //initialize variables
  PVector loc, vel, acc, wind;
  float sz, lifespan;


  Snow() {
    loc=new PVector(random(0, displayWidth), random(0, displayHeight)); //Position
    vel= new PVector(random(-3, 3), random(-4, -2)); //speed
    acc= new PVector(0, .1); // quickness
    sz=10; //size of each ball 
    lifespan = 225; //Life of each ball
    wind = new PVector(-1, 0); //variable for moving everything to the left
  }

  void display() { // Shows the ball
    noStroke();
    fill(255, 250, 250, lifespan);
    ellipse(loc.x, loc.y, sz, sz);
  }

  void move() { // Expresses all movements of ball
    vel.add(acc);
    loc.add(vel);
    lifespan-= 1.0;
    if (mousePressed== true) { //Leftward Movement
      vel.add(wind);
    }
  }

  boolean isDead() { //R.I.P
    if (loc.y -sz/2 > height) {
      return true;
    } else {
      return false;
    }
  }
}

