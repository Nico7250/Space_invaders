int buttonSizeX = 250;
int buttonSizeY = 100;
PImage player1;

void stage0() {
  createMenuBackground();
  textAlign(CENTER);
  textSize(72);
  text("$PACE INVADER$", width/2, height/5);
  textSize(14);
  text("Press 'ESC' to exit game.", width/2, height/1.1);
  rectMode(CENTER);

  displayButton("Play", width/2, height/3, 0, 0, 128);
  displayButton ("Difficulty", width/2, height /1.75, 0, 0, 128);
  displayButton("How to play", width/2, height /1.25, 0, 0, 128);
}
void stage1() {
  createMenuBackground();
  displayButton("1 player", width/2, height/3, 0, 0, 128);
  displayButton("2 player", width/2, height/1.75, 0, 0, 128);
  displayButton("Back", width/2, height/1.25, 0, 0, 128);
}

void stage2() {
  createMenuBackground();
  displayButton("Easy", width/2, height/3, 0, 0, 128);
  displayButton ("Hard", width/2, height /1.75, 0, 0, 128);
  displayButton("Extreme", width/2, height /1.25, 0, 0, 128);
}

void stage3() {
  createMenuBackground();
  line(width/2, height/1.001, width/2, height/1000);
  displayButton("Back", width/15, height/1.05, 0, 0, 128);
  textAlign(CENTER);
  fill(50, 200, 100);
  textSize(46);
  text("How To Play", width/2, height /12);
  textSize(32);
  text("Player 1:", width/5, height/7.5);
  textSize(25);
  text("Movement: Arrow Keys", width/5, height/6);
  text("Interact/shoot: SPACEBAR", width/5, height/4.5);
  textSize(32);
  text("Player 2:", width/1.25, height/7.5);
  textSize(25);
  text("Movement: W, A, S, D", width/1.25, height/6);
  text("Interact/shoot: CTRL", width/1.25, height/4.5);
  player1 = loadImage("spaceShip.png");
}

void stage4() {
  createBackground();
  for (Player player : players) {
    player.displayBullets();
  }
  // player.displayBullets();

  for (Alien alien : aliens) {
    alien.displayAlien();
    //alien.alienShoot();
    alien.alienMove();
    alien.displayBullets();
    for (Player player : players) {
      if (alien.playerDetectHit(player)){
        player.health--;
        println("Hit");
      }
    }
  }
  int alientoshoot = GetAlienToShoot();
  if(alientoshoot>-1)
    aliens.get(alientoshoot).alienShoot(); //<>//
  text("Player 1 Score:" + rules.score1, width/10, height/10);
  text("Player 2 Score:" + rules.score2, width/1.1, height/10);
  textAlign(CENTER);
  textSize(32);
  text(frameRate, width/1.05, height/1.03);

  //rules.powerUp();
  for (Player player : players) {
    player.displayPlayer();
    player.movePlayer();
    player.playerConstrain();

    player.deleteBulletOutOfBound();
    if(alien.playerDetectHit(player))
      player.health--;
    alien.bulletDetectHit(player.bullets);
    player.playerHit();
  }

  rules.powerUp();
  rules.calculateScore(); //<>//
  rules.winLoseCondition();

  if (alien.levelUp()) {
    if (aliens.size() == 0) {
      for (Player player : players) {
        player.removeAllBullets();
      }      
      //player.removeAllBullets();
      createFleet();
      for (Alien alien : aliens) {
        alien.moveSpeed *= 2;
      }
    }
  }
}


void stage5() {
  stage4();
}

void stage6() {
  /*PImage win;
  createMenuBackground();
  win = loadImage("../Resources/youWin.png");
  image(win, width / 2, height /2);*/
  alien.levelUp();
}

void stage7() {
  PImage lose;
  createMenuBackground();
  lose = loadImage("../Resources/youLose.png");
  image(lose, width/2, height /2);
}


void displayButton(String text, float x, float y, int r, int g, int b) {
  fill(r, g, b);
  stroke(255);
  strokeWeight(2);
  rect(x, y, buttonSizeX, buttonSizeY);
  fill(255);
  textAlign(CENTER);
  textSize(24);
  text(text, x, y + 24, buttonSizeX, buttonSizeY);
}

void createMenuBackground() {
  background(54, 57, 63);
  displayStars();
}

void createBackground() {
  background(0);
  displayStars();
}

void createStars() {
  for (int i=0; i<1000; i++) {
    stars[i] = (random(0, width));
    stars2[i] = (random(0, height));
    stars3[i] = (random(0, 4));
  }
}

void displayStars() {
  for (int i = 0; i<1000; i++) {
    rect(stars[i], stars2[i], stars3[i], stars3[i]);
  }
}
