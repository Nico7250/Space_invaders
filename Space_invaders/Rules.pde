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

  void winLoseCondition() {
    if (score1 >= 50000) {
      stage = 6;
      rules.score1 = 0;
      alien.removeAll();
    } 
    for (Player player : players) {
      if (player.health==0)
      {
        alien.removeAll();
        stage=7;
        player.removeAllBullets();
      }
    }
  }

  void powerUp() {
    if (frameCount % 78 == 0) {
      fill(213, 123, 76);
      ellipse(x, y, 8, 8);
      while (y < height) {
        y ++;
      }
    }
  }
}
