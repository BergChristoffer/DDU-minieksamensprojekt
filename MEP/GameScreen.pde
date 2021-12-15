Cannon cannon;
Bullet bullet;
Target target;
int score, oldScore;
Boolean game = false;
Boolean quizOpen = false;
Boolean gameOver = false;

class GameScreen {


  GameScreen() {
    cannon=new Cannon();
    bullet = new Bullet();
    target = new Target();
  }

  void draw() {
    background(200);
    if (hit) {
      score++ ;
      scoreUpdater();
      hit = false;
    }

    if (score == oldScore + 2) {
      oldScore = score;
      drawQuiz();
      quizOpen = true;
    }

    if (rightAnswer) {
      score = score + 1;
      oldScore = score;
      quizOpen = false;
      rightAnswer = false;
    }

    if (wrongAnswer) {
      quizOpen = false;
      wrongAnswer = false;
    }

    text("score " + score, 10, 75);
    bullet.display();
    cannon.display();


    if (!quizOpen)
    {
      if (!gameOver)
      {
        target.dissapear();
        target.display();
        bullet.update();
        cannon.readUserInput();
      } else {
        text("GAME OVER", width/2-50, height/2);
      }
    }
  }
}
