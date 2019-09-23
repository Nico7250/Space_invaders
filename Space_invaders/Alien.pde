public class Alien { //<>//
  float moveSpeedY;
  float moveSpeed;
  PImage alien;
  ArrayList <Bullet> alienBullets;
  PVector position;
  Alien(float x, float y) {
    alien = loadImage("../Resources/alien.png");
    position = new PVector(x, y);
    moveSpeedY = 0;
    moveSpeed = 1.5;
    alienBullets = new ArrayList<Bullet>();
  }

  void displayAlien() {
    imageMode(CENTER);
    alien.resize(100, 50);
    image(alien, position.x, position.y);
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
    position.x += moveSpeed;
    position.y += moveSpeedY;

    if (position.x < 50) {
      for (Alien alien : aliens) {
        alien.position.y += 25; // Moves all aliens a row down when boarder is hit
        position.x = 50;
        alien.moveSpeed *= -1;
      }
    }
    if (position.x > width-50) {
      for (Alien alien : aliens) {
        alien.position.y += 25; // Moves all aliens a row down when boarder is hit
        position.x = width - 50;
        alien.moveSpeed *= -1;
      }
    }
  }

  void alienShoot() {
    Bullet bullet = new Bullet(position.x, position.y+10, -5, "../Resources/bullet2.png"); // Spawns bullet at spaceShip location
    alienBullets.add(bullet);
  }

  void displayBullets() {
    for (Bullet bullet : alienBullets) {
      bullet.displayBullet();
      bullet.move();
    }
  }

  boolean playerDetectHit(Player player) {
    for (int i = alienBullets.size()-1; i>=0; i--) {
      Bullet bullet = alienBullets.get(i);     
      float d = dist(player.position.x, player.position.y, bullet.position.x, bullet.position.y);
      if (d < 20 + 30) {
        alienBullets.remove(i);
        return true;
      }
    }
    return false;
  }
  // Detects collision between alien and player shot
  void alienDetectHit(ArrayList <Bullet> bullets) {
    for (int i = bullets.size() -1; i >= 0; i--) { // Using a decrementing loop / counting backwards to -
      Bullet bullet = bullets.get(i);              // - avoid infinity loop due to how arrayList works
      for (int j = aliens.size() -1; j >= 0; j--) {
        Alien alien = aliens.get(j);
        float d = dist(alien.position.x, alien.position.y, bullet.position.x, bullet.position.y);
        if (d < 20 + 20) {
          bullets.remove(i);
          aliens.remove(j);
          rules.score += 100; // Increses score everytime an alien is killed
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

int GetAlienToShoot() {
  if (frameCount % 75 == 0) { // Calculates delay between shots
    return (int)random(0, aliens.size());
  }
  return -1;
}

void createAlien(int alienNumber, int rowNumber) {
  int alienWidth = width/18;
  int alienHeight = 50;

  alien = new Alien(0, 50);
  int alienX = alienWidth + 2 * alienWidth * alienNumber;
  int alienY = alienHeight +2 * alienHeight * rowNumber;
  alien.position.y = alienY;
  alien.position.x = alienX;
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
