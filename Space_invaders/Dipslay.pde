void createStars(){
 for (int i=0; i<1000; i++) {
    stars[i] = (random(0, width));
    stars2[i] = (random(0, height));
    stars3[i] = (random(0, 4));
  } 
}

void displayStars(){
  for (int i = 0; i<1000; i++) {
    rect(stars[i], stars2[i], stars3[i], stars3[i]);
  }
}
