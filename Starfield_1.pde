Particles [] starfield = new Particles[200];

void setup() {
  size(800,800);
  for (int i = 0; i < starfield.length; i++) {
    starfield[i] = new NormalParticle();
  }
  starfield[0] = new OddBall();
  starfield[1] = new jumbo();
}

void draw() {
  background(0);
  for (int i = 0; i < starfield.length; i++) {
    starfield[i].show();
    starfield[i].leap();
  }
}

class NormalParticle implements Particles{
  double x, y, speed, angle;
  
  NormalParticle() {
    angle = random(0, TWO_PI);
    x = width/2;
    y = height/2;
    speed = random(0,25);
  }
  
  public void leap() {
    x = x + Math.cos(angle)*speed;
    y = y + Math.sin(angle)*speed;
  }
  
  public void show() {
    ellipse((float)x,(float)y,8,8);
  }
}

class OddBall implements Particles {
  double x, y, angle, speed;
  
  OddBall() {
    x = width/2;
    y = height/2;
    angle = random(0,PI);
    speed = 10;
  }
  
  public void leap() {
    x = x + Math.cos(angle)*10;
    y = y + Math.sin(angle)*10;
  }
  
  public void show() {
    ellipse((float)x,(float)y,8,8);
  }
}

class jumbo extends NormalParticle {
  public void show() {
    ellipse((float)x,(float)y,16,16);
  }
}

interface Particles {
  public void show();
  public void leap();
}
