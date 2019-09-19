
public class Alien {
  PImage alien;
  public float alienLocX;
  public float alienLocY;
  float moveSpeedY;
  float moveSpeed;
  float moveSpeed2;
  float moveSpeed3;

  Alien(float x, float y) {
    alien = loadImage("alien.png");
    alienLocX = x;
    alienLocY = y;
    moveSpeedY = 0;
    moveSpeed = 1.5;
    moveSpeed2 = 3.5;
    moveSpeed3 = 7.5;
  }

  void displayAlien() {
    imageMode(CENTER);
    alien.resize(100, 50);
    image(alien, alienLocX, alienLocY);
  }

  void moveSpeedUp() {
    for (Alien alien : aliens) {
      alien.moveSpeed *= 1.03;
    }
  }

  boolean levelUp() {
    if (aliens.size() == 0) {
      return true;
    } else {
      return false;
    }
  }

  void alienMove() {
    alienLocX += moveSpeed;
    alienLocY += moveSpeedY;
    if (alienLocX < 50) {

      for (Alien alien : aliens) {
        alien.alienLocY += 25;
        alienLocX = 50;
        alien.moveSpeed *= -1;
        //alien.moveSpeed += 0.75;
      }
    }
    if (alienLocX > width-50) {
      for (Alien alien : aliens) {
        alien.alienLocY += 25;
        alienLocX = width - 50;
        alien.moveSpeed *= -1;
      }
    }
  }
}


int getNumberAliensX() {
  int alienWidth = width/18;
  int avalibleSpaceX = width -2 *alienWidth;
  int numberAliensX = (avalibleSpaceX /(2 * alienWidth));

  println("alien numbere x" + numberAliensX);
  return numberAliensX;
}

int getNumberRows() {
  int alienHeight = 50;
  int shipHeight = 97;

  int avalibleSpaceY = (height - (3 * alienHeight) - shipHeight);
  int numberRows = int(avalibleSpaceY / (2 * alienHeight));

  return numberRows;
}


void createAlien(int alienNumber, int rowNumber) {
  int alienWidth = width/18;
  int alienHeight = 50;

  alien = new Alien(0, 50);
  int alienX = alienWidth + 2 * alienWidth * alienNumber;
  int alienY = alienHeight +2 * alienHeight * rowNumber;
  alien.alienLocY = alienY;
  alien.alienLocX = alienX;
  println(alienNumber);
  aliens.add(alien);
}


void createFleet() {
  int numberAliensX = getNumberAliensX();
  int numberRows = getNumberRows();

  for (int rowNumber = 0; rowNumber < numberRows; rowNumber += 1) {
    for (int alienNumber = 0; alienNumber < numberAliensX; alienNumber += 1) {
      createAlien(alienNumber, rowNumber);
    }
  }
}
