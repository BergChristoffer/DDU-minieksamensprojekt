int radius;
PVector location, force, acceleration, velocity, gravity, dir;
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
  
  void applyForce(){
   PVector mouse = new PVector(mouseX,mouseY);
   dir = PVector.sub(mouse,location);
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
  
    void applyGravity(PVector force){
    PVector f = PVector.div(force,radius);
    if(location.x>80||location.y<280){
    velocity.add(f);
    }
  }
  
    void showForce(){
      PVector textloc = new PVector(120,35);
      float force = dir.mag();
      force=(force*100)/1000;
      int fr = round(force);
      fill(0);
      textSize(30);
      if(cannon.shoot==false){
        text("Force:",10,35);
        if(mouseX>150&&force<100){
          text(fr+"%", textloc.x,textloc.y);
        }
        if(mouseX<150){
          text(0+"%",textloc.x,textloc.y);}
        if(force>=100){text(100+"%",textloc.x,textloc.y);{
        }
      }
    }
  }
  
  void update(){
    applyForce();
    edgeCollide();
    applyGravity(gravity);
    showForce();
  }
    
  void display(){
    fill(255,255,0);
    ellipse(location.x,location.y,radius, radius);
  }
  
  
  
  
}
