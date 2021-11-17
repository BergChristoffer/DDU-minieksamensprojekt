class Cannon{
  PImage img;
  float angle;
  float w,h;
  PVector location;
  Cannon(){
    img = loadImage("kanon.png");
    location = new PVector(50,335);
    w=img.width;
    h=img.height;
  }
  void display()
  {
    imageMode(CENTER);
    pushMatrix();
    angle=atan2(location.x-mouseX,location.y-mouseY);
    translate(location.x,location.y);
    rotate(-angle-HALF_PI);
    image(img,0,0);
    popMatrix();
    imageMode(CORNER);
  }
}
