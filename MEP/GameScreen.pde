Cannon cannon;
Bullet bullet;
Target target;
int score;
class GameScreen{
  GameScreen(){
  cannon=new Cannon();
  bullet = new Bullet();
  target = new Target();
  }
  
void draw(){
background(200);
if(hit==true&&cannon.shoot==true){
  score=score+1;
  hit=false;
}
target.dissapear();
target.display();
bullet.update();
bullet.display();
cannon.display();
cannon.shoot();
if(hit==true){
println(score);}
}
}
