import de.bezier.data.sql.*;
import java.security.*;
import controlP5.*;

ControlP5 cp5;
SQLite db;
Textarea questionText;
Textarea answer1;
Textarea answer2;
Textarea answer3;
GameScreen gamescreen;


void setup() {
  size(1300, 800);
  drawStartScreen();

  gamescreen = new GameScreen();
}

void draw() {
  background(200);
  fill(0);

  if (studentText)
    showStudent();

  if (game)
    gamescreen.draw();
}
