

public class Alien {
  PImage alien;
  float alienLocX;

  Alien() {
    alien = loadImage("alien.png");
    alienLocX = 0;
  }

  void displayAlien() {
    imageMode(CENTER);
    alien.resize(width/18,height/18);
    image(alien, alienLocX, height/2);
  }
}

void createFleet() {
  int alienWidth = width/18;
  int avalibleSpaceX = width - alienWidth/2;
  int numberAliensX = (avalibleSpaceX /(2 * alienWidth));

  for (int alienNumber = 1; alienNumber < numberAliensX; alienNumber += 1) {
    alien = new Alien();
    int alienX = (alienWidth + 2 * alienWidth) * alienNumber;
    alien.alienLocX = alienX;
    println(alienNumber);
    aliens.add(alien);
  }
}
