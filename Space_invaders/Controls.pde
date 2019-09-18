// Sets boolean variable for the different player actions (key)
// The point of this, is to make it possible to click more than one button at once
boolean player1Left;
boolean player1Right;
boolean player1Up;
boolean player1Down;
boolean player1Space;

// Checks for key pressed and makes boolean variable true
void keyPressed() {

  if (keyCode == LEFT) {
    player1Left = true;
  }
  if (keyCode == RIGHT) {
    player1Right = true;
  }
  if (keyCode == UP) {
    player1Up = true;
  }
  if (keyCode == DOWN) {
    player1Down = true;
  }
  if (keyCode == ESC) {
    exit();
  }
  if (key == ' ') {
    player1Space = true;
    println("space");
  }
  if (key == ENTER){
    stage = 1;
  }
}

// Checks for key released and makes boolean variable false
void keyReleased() {

  if (keyCode == LEFT) {
    player1Left = false;
  }
  if (keyCode == RIGHT) {
    player1Right = false;
  }
  if (keyCode == UP) {
    player1Up = false;
  }
  if (keyCode == DOWN) {
    player1Down = false;
  }
  if (key == ' ') {
    player1Space = false;
  }
}
