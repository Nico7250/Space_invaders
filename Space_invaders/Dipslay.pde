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

void stage0(){
  background(54, 57, 63);
    displayStars();
    textAlign(CENTER);
    textSize(72);
    text("$PACE INVADER$", width/2, height/5);
    textSize(14);
    text("Press 'ESC' to exit game.", width/2, height/1.1);
    text("Press 'ENTER' to start game.", width/2, height/1.12);
    rectMode(CENTER);
    rect(width/2, height/3, 250, 100);
    rect(width/2, height/1.75, 250, 100);
    rect(width/2, height/1.25, 250, 100);
}
