
boolean hit;
class Target {
  PVector location;
  float radius, stroke;
  Target() {
    location = new PVector(random(300, 1200), random(250, 700));
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
