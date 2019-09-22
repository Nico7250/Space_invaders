// Checks for key pressed and makes boolean variable true
void keyPressed() {
  for (Player player : players) {
    player.pkeyPressed(keyCode);
  }
  if (keyCode == ESC) {
    exit();
  }
  if (keyCode == BACKSPACE) {
    stage = 0;
  }
}

// Checks for key released and makes boolean variable false
void keyReleased() {
  for (Player player : players) {
    player.pkeyReleased(keyCode);
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
    float detectHowTo = dist(mouseX, mouseY, width/2, height/1.25);
    if (detectHowTo < (buttonSizeX / 2.5) + (buttonSizeY/2.5)) {
      stage = 3;
    }
  } else if (stage == 1) {
    float detect1Player = dist(mouseX, mouseY, width/2, height/3);
    if (detect1Player < (buttonSizeX/2.5) + (buttonSizeY/2.5)) {
      stage = 4;
      players = new ArrayList<Player>();
      Player player =new Player("../Resources/spaceShip.png", width/2, height, 120, 97, null);
      player.setActionKeys(LEFT, RIGHT, UP, DOWN, 32);
      players.add(player);
    }
    float detect2Player = dist(mouseX, mouseY, width/2, height/1.75);
    if (detect2Player < (buttonSizeX/2.5) + (buttonSizeY/2.5)) {
      players = new ArrayList<Player>();
      Player player =new Player("../Resources/spaceShip.png", width/2, height, 120, 97, null);
      player.setActionKeys(LEFT, RIGHT, UP, DOWN, 32);
      players.add(player);
      player =new Player("../Resources/spaceShip2.png", width/4, height, 118, 115, null /*"player2Bullet.png"*/);
      player.setActionKeys((int) 'A', (int)'D', (int)'W', (int)'S', (int)'Q');
      players.add(player);      
      stage = 5;
    }
    float detectBack = dist(mouseX, mouseY, width/2, height/1.25);
    if (detectBack < (buttonSizeX/2.5) + (buttonSizeY/2.5)) {
      stage = 0;
    }
  } else if (stage == 2) {
    float detectEasy = dist(mouseX, mouseY, width/2, height/3);
    if (detectEasy < (buttonSizeX/2.5) + (buttonSizeY/2.5)) {
      for (Alien alien : aliens) {
        alien.moveSpeed = 1.5;
        stage = 0;
      }
    }
    float detectHard = dist(mouseX, mouseY, width/2, height/1.75);
    if (detectHard < (buttonSizeX/2.5) + (buttonSizeY/2.5)) {
      for (Alien alien : aliens) {
        alien.moveSpeed = 3.5;
      }
      stage = 0;
    }
    float detectExtreme = dist(mouseX, mouseY, width/2, height/1.25);
    if (detectExtreme < (buttonSizeX/2.5) + (buttonSizeY/2.5)) {
      for (Alien alien : aliens) {
        alien.moveSpeed = 7.5;
      }
      stage = 0;
    }
  } else if (stage == 3) {
    float detectBack = dist(mouseX, mouseY, width/15, height/1.05);
    if (detectBack < (buttonSizeX/2.5) + (buttonSizeY/2.5)) {
      stage = 0;
    }
  }
}
