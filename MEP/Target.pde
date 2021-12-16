
boolean hit;
class Target {
  PVector location, velocity;
  float radius, stroke;
  Target() {
    location = new PVector(random(300, 1200), random(250, 700));
    velocity = new PVector(0,0);
    radius=100;
    stroke=10;
    hit=false;
  }


  void dissapear() {
    if (bullet.location.x>location.x-radius/2-stroke&&bullet.location.x<location.x+radius/2+stroke&&bullet.location.y>location.y-radius/2-stroke&&bullet.location.y<location.y+radius/2+stroke) {
      hit=true;
      location = new PVector(random(300, 1200), random(250, 700));
    }
    if (keyPressed==true) {
      if (key==' ') {
        hit=false;
      }
    }
  }
  
  
  void update(){
    location.add(velocity);
    if(hit){
    velocity = new PVector(random(-5,5),random(-5,5));
    }
    if(location.x>width-50||location.x<300){velocity.x=velocity.x*-1;}
    if(location.y>height-50||location.y<250){velocity.y=velocity.y*-1;}
  }

  void display() {
    if (hit==false) {
      fill(255);
      strokeWeight(stroke*2);
      stroke(255, 0, 0);
      ellipse(location.x, location.y, radius, radius);
      fill(255, 0, 0);
      strokeWeight(0);
      ellipse(location.x, location.y, radius-60, radius-60);
    }
  }
}
