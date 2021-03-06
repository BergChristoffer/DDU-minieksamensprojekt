class Cannon {
  PImage img;
  float angle;
  float w, h;
  PVector location;
  boolean shoot;
  Cannon() {
    img = loadImage("kanon.png");
    location = new PVector(30, 770);
    w=img.width;
    h=img.height;
    shoot=false;
  }
  void readUserInput() {
    if (mousePressed==true&&shoot==false&&mouseX>90) {
      shoot=true;
    }
    angle=atan2(location.x-mouseX, location.y-mouseY);
  }

  void display()
  {
    imageMode(CENTER);
    pushMatrix();
    translate(location.x, location.y);
    rotate(-angle-HALF_PI);
    image(img, 0, 0);
    popMatrix();
    imageMode(CORNER);
  }
}
