public class Rules {
  int score;

  Rules() {
    score = 0;
  }

  void calculateScore() {
    score += millis()/60/60;
  }

  void winLoseCondition() {
    // Win condition
    if (score >= 50000) {
      stage = 6;
      rules.score = 0;
      alien.removeAll();
    } 
    // Lose condition
    for (Player player : players) {
      if (player.health==0)
      {
        alien.removeAll();
        stage=7;
        player.removeAllBullets();
      }
    }
  }
}
