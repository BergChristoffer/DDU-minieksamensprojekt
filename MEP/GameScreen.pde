Cannon cannon;
Bullet bullet;
Target target;
int score, oldScore;
int seconds = 10;
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

    text("score " + score, 10, 75);
    bullet.display();
    cannon.display();

    if (hit) {
      score++ ;
      scoreUpdater();
      hit = false;
    }

    if (score == oldScore + 2 && questionIndex != questions.size()) {
      oldScore = score;
      drawQuiz();
      quizOpen = true;
    }

    if (rightAnswer) {
      score = score + 1;
      oldScore = score;
      amountOfCorrectAnswers++;
      insertAmountOfCorrectAnswers();
      quizOpen = false;
      rightAnswer = false;
    }

    if (wrongAnswer) {
      quizOpen = false;
      wrongAnswer = false;
    }

    if (noMoreQuestions) {

      if (frameCount >= 60 && seconds <= 10) {
        seconds--;
        frameCount = 0;
      } else if (noMoreQuestions && seconds <= 0) {
        gameOver = true;
      }
      if ( seconds > 0) {
        fill(0);
        text("time left " + seconds + " seconds", 10, 125);
      }
    }




    if (!quizOpen)
    {
      if (!gameOver)
      {
        target.dissapear();
        target.display();
        bullet.update();
        cannon.readUserInput();
      } else {
        fill(0);
        text("GAME OVER", width/2-50, height/2);
        text("Correct Answers: " + amountOfCorrectAnswers + " / " + questions.size(), width/2-50, height/2 + 50);
      }
    }
  }
}
