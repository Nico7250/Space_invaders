
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

void stage0() {
  background(54, 57, 63);
  displayStars();
  textAlign(CENTER);
  textSize(72);
  text("$PACE INVADER$", width/2, height/5);
  textSize(14);
  text("Press 'ESC' to exit game.", width/2, height/1.1);
  text("Press 'ENTER' to start game.", width/2, height/1.12);
  rectMode(CENTER);

  displayButton("Play", width/2, height/3, 0, 0, 128, 250, 100);
  displayButton ("Difficulty", width/2, height /1.75, 0, 0, 128, 250, 100);
  displayButton("How to play", width/2, height /1.25, 0, 0, 128, 250, 100);
}

void stage1() {
  background(0);
  displayStars();

  bullet.shoot();
  for (Bullet bullet : bullets) {
    bullet.displayBullet();
    bullet.move();
  }

  for (Alien alien : aliens) {
    alien.displayAlien();
    alien.alienMove();
  }

  player.displayPlayer();
  player.movePlayer();
  player.playerConstrain();
  text("Player 1 Score:" + score1, width/10, height/10);
  text("Player 2 Score:" + score2, width/1.1, height/10);
  textAlign(CENTER);
  textSize(32);
  text(frameRate, width/1.05, height/1.03);

  bullet.deleteBulletOutOfBound();
  bulletDetect();
}



void stage2() {
}


void stage3() {
}






void displayButton(String text, float x, float y, int r, int g, int b, int buttonSizeX, int buttonSizeY) {
  fill(r, g, b);
  stroke(255);
  strokeWeight(2);
  rect(x, y, buttonSizeX, buttonSizeY);
  fill(255);
  textAlign(CENTER);
  textSize(24);
  text(text, x, y + 24, buttonSizeX, buttonSizeY);
}
