
boolean player1Left;
boolean player1Right;
boolean player1Up;
boolean player1Down;
//char space = " ";

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
  /*if (key == "g"){
    
  }*/
  
}



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
