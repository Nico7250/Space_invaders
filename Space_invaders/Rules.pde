// Classe to cointain rules such as win condition and points


public class Rules {
  int score1;
  int score2;
  int highScore;
  float x;
  float y;


  Rules() {
    score1 = 0;
    score2 = 0;
    x = -height;
    y = random(width);
  }

  void calculateScore() {
    score1 += millis()/60/60;
  }

  void winCondition() {
    if (score1 >= 10000) {
      println("you Win");
    }
  }

  void powerUp() {
    if (millis() % 78 == 0) {
      ellipse(x, y, 8, 8);
      while (y < height) {
        y --;
      }
    }
  }
}
