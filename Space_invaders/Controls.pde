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
  if (key == '<') {
    player2Shoot = true;
  }
  if (key == 'o' || key == 'O') {
    stage = 0;
  }
  if (keyCode == BACKSPACE) {
    stage = stage-1;
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
  if (key == '<') {
    player2Shoot = false;
  }
}

void mousePressed() {
  if (stage == 0) {
    float detectPlay = dist(mouseX, mouseY, width/2, height/3);
    if (detectPlay < (buttonSizeX/2.5) + (buttonSizeY/2.5)) {
      stage = 1;
    }
    float detectDifficulty = dist(mouseX, mouseY, width/2, height/1.75);
    if (detectDifficulty < (buttonSizeX/2.5) + (buttonSizeY/2.5)) {
      stage = 2;
    }
  } else if (stage == 1) {
    float detect1Player = dist(mouseX, mouseY, width/2, height/3);
    if (detect1Player < (buttonSizeX/2.5) + (buttonSizeY/2.5)) {
      stage = 3;
    }
    float detect2Player = dist(mouseX, mouseY, width/2, height/1.75);
    if (detect2Player < (buttonSizeX/2.5) + (buttonSizeY/2.5)) {
      stage = 4;
    }
    float detectBack = dist(mouseX, mouseY, width/2, height/1.25);
    if (detectBack < (buttonSizeX/2.5) + (buttonSizeY/2.5)) {
      stage = stage -1;
    }
  } else if (stage == 2) {
    float detectEasy = dist(mouseX, mouseY, width/2, height/3);
    if (detectEasy < (buttonSizeX/2.5) + (buttonSizeY/2.5)) {
      for (Alien alien : aliens){
      alien.moveSpeed = 1.5;
      stage = 0;
      }
    }
    float detectHard = dist(mouseX, mouseY, width/2, height/1.75);
    if (detectHard < (buttonSizeX/2.5) + (buttonSizeY/2.5)) {
      for (Alien alien : aliens){
      alien.moveSpeed = 3.5;
      }
      stage = 0;
    }
     float detectExtreme = dist(mouseX, mouseY, width/2, height/1.25);
    if (detectExtreme < (buttonSizeX/2.5) + (buttonSizeY/2.5)) {
      for (Alien alien : aliens){
      alien.moveSpeed = 7.5;
      }
      stage = 0;
    }
  }
}
