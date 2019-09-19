// Sets boolean variable for the different player actions (key)
// The point of this, is to make it possible to click more than one button at once
boolean player1Left;
boolean player1Right;
boolean player1Up;
boolean player1Down;
boolean player1Shoot;
boolean player2Left;
boolean player2Right;
boolean player2Up;
boolean player2Down;
boolean player2Shoot;

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
    player1Shoot = true;
    println("space");
  }
    if (key == 'a') {
    player2Left = true;
  }
  if (key == 'd') {
    player2Right = true;
  }
  if (key == 'w') {
    player2Up = true;
  }
  if (key == 's') {
    player2Down = true;
  }
  if (keyCode == SHIFT) {
    player2Shoot = true;
  }
  if (key == 'o' || key == 'O') {
    stage = 0;
  }
  if (key == ENTER) {
    stage = 1;
  }
  if (key == 'j' || key == 'J') {
    stage = 1;
  }
  if (key == 'k' || key == 'K') {
    stage = 2;
  }
  if (key == 'l' || key == 'L') {
    stage = 3;
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
    player1Shoot = false;
  }
  if (key == 'a') {
    player2Left = false;
  }
  if (key == 'd') {
    player2Right = false;
  }
  if (key == 'w') {
    player2Up = false;
  }
  if (key == 's') {
    player2Down = false;
  }
  if (keyCode == SHIFT) {
    player2Shoot = false;
  }
}
