boolean player1LEFT;
boolean player1RIGHT;


void keyReleased(){
  
  if (keyCode == LEFT){
  player1LEFT = false;
  }
  if (keyCode == RIGHT){
    player1RIGHT = false;
  }
}

void keyPressed() {
 
  if (keyCode == LEFT){
  player1LEFT = true;
  }
  if (keyCode == RIGHT){
    player1RIGHT = true;
  }
}
