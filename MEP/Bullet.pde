int radius;
PVector location, force, acceleration, velocity, gravity;
float topspeed;

class Bullet{
  Bullet(){
    acceleration = new PVector(0,0);
    location = new PVector(cannon.location.x,cannon.location.y);
    velocity = new PVector(0,0);
    gravity = new PVector(0,10);
    radius = 30;
    topspeed=20;
  }
  
  void applyforce(){
   PVector mouse = new PVector(mouseX,mouseY);
   PVector dir = PVector.sub(mouse,location);
   velocity.limit(topspeed);
   if(cannon.shoot==true){
      dir.mult(0.004);
      acceleration = dir;
      location.add(velocity);
      if(location.x<100&&location.y>300){
      velocity.add(acceleration);
      }
    }
  }
  
  void edgeCollide() {
    if (location.x > width||location.x<0) {
      location.x = cannon.location.x;
      location.y = cannon.location.y;
      velocity.mult(0);
      cannon.shoot=false;
    }
    if(location.y>height){
      location.x=cannon.location.x;
      location.y=cannon.location.y;
      velocity.mult(0);
      cannon.shoot=false;
    }
  }
  
    void applyGravity(PVector force)
  {
    PVector f = PVector.div(force,radius);
    if(location.x>80||location.y<280){
    velocity.add(f);
    }
  }
  
  void update(){
    applyforce();
    edgeCollide();
    applyGravity(gravity);
  }
    
  void display(){
    fill(255,255,0);
    ellipse(location.x,location.y,radius, radius);
  }
  
  
  
  
}
