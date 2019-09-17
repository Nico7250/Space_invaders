<<<<<<< HEAD
boolean player1Left;
boolean player1Right;
boolean player1Up;
boolean player1Down;
=======
//import Player;

boolean player1LEFT;
boolean player1RIGHT;
>>>>>>> ceaa3ed0d4c2b4d5fe98a062960df84245b701a5


void keyReleased(){
  
  if (keyCode == LEFT){
  player1Left = false;
  }
  if (keyCode == RIGHT){
    player1Right = false;
  }
  if (keyCode == UP){
    player1Up = false;
  }
  if (keyCode == DOWN){
    player1Down = false;
  }
}

void keyPressed() {
 
  if (keyCode == LEFT){
  player1Left = true;
  }
  if (keyCode == RIGHT){
    player1Right = true;
  }
   if (keyCode == UP){
    player1Up = true;
  }
  if (keyCode == DOWN){
    player1Down = true;
  }
  if (keyCode == ESC){
  exit();
  }
}
