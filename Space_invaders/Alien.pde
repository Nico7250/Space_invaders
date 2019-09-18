

public class Alien {
  PImage alien;
  public float alienLocX;

  Alien() {
    alien = loadImage("alien.png");
    alienLocX = 0;
  }

  void displayAlien() {
    imageMode(CENTER);
    alien.resize(width/20,height/20);
    image(alien, alienLocX, height/2);
  }
}

void createFleet() {
  // alien = new Alien();
  float alienWidth = 100;
  //float avalibleSpaceX = width + alienWidth;
  float numberAliensX = int(width /(0.5 * alienWidth));

  for (int alienNumber = 1; alienNumber < numberAliensX; alienNumber += 1) {
    alien = new Alien();
    float alienX = alienWidth + 1.25 * alienWidth * alienNumber;
    alienX = constrain(alienX, 60, width-60);
    alien.alienLocX = alienX;
    println(alienNumber);
    aliens.add(alien);
  }
}
