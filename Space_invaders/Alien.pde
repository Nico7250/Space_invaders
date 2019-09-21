public class Alien {
  PImage alien;
  public float alienLocX;
  public float alienLocY;
  float moveSpeedY;
  float moveSpeed;
  float moveSpeed2;
  float moveSpeed3;

  Alien(float x, float y) {
    alien = loadImage("../Resources/alien.png");
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

  // Increses movement speeed of all aliens (used for speeding up all aliens when one is killed
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
        alien.alienLocY += 25; // Moves all aliens a row down when boarder is hit
        alienLocX = 50;
        alien.moveSpeed *= -1;
      }
    }
    if (alienLocX > width-50) {
      for (Alien alien : aliens) {
        alien.alienLocY += 25; // Moves all aliens a row down when boarder is hit
        alienLocX = width - 50;
        alien.moveSpeed *= -1;
      }
    }
  }

  // Detects collision between alien and player shot
  void bulletDetectHit() {
    for (int i = bullets.size() -1; i >= 0; i--) { // Using a decrementing loop / counting backwards to -
      Bullet bullet = bullets.get(i);              // - avoid infinity loop due to how arrayList works
      for (int j = aliens.size() -1; j >= 0; j--) {
        Alien alien = aliens.get(j);
        float d = dist(alien.alienLocX, alien.alienLocY, bullet.position.x, bullet.position.y);
        if (d < 20 + 20) {
          bullets.remove(i);
          aliens.remove(j);
          rules.score1 += 100; // Increses score everytime an alien is killed
          alien.moveSpeedUp(); // Increses the movement speed of all aliens when alien is killed
        }
      }
    }
  }
  
    void removeAll() {
    for (int i = aliens.size() -1; i >= 0; i--) {
      Alien alien = aliens.get(i);
      aliens.remove(i);
    }
  }
}


/* Functions below are all made for calculating the amount of aliens
 the screen can fit on the x and y-axis according to the alien sprites size
 and finaly a function for 'spawning' all the aliens
 */
int getNumberAliensX() {
  int alienWidth = width/18;
  int avalibleSpaceX = width -2 *alienWidth;
  int numberAliensX = (avalibleSpaceX /(2 * alienWidth));
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
