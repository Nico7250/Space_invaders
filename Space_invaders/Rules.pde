// Classe to cointain rules such as win condition and points


public class Rules {
int score1;
int score2;
int highScore;


  Rules() {
    score1 = 0;
    score2 = 0;
  }
  
  void calculateScore(){
    score1 += millis()/60/60;
  }
  
  void winCondition(){
   if (score1 >= 10000){
   }
  }
}
