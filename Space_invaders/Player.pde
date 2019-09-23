public class Player { //<>//
  boolean left;
  boolean right;
  boolean up;
  boolean down;
  boolean shoot;
  int akeyLeft;
  int akeyRight; 
  int akeyUp;
  int akeyDown;
  int akeyShoot;
  int scaleX;
  int scaleY;
  int shipMoveSpeed = 5;
  int score = 0;
  int health = 3;
  int bulletDelay = 250; // The delay between shots
  long bulletTimer; // Used in calculation for bullet delay
  PImage spaceShip;
  PVector position;
  ArrayList <Bullet> bullets;
  String bulletImage;

  // With the PImage as a input string, it is possible to make 2 players with different spaceships
  Player(String playerImage, float x, float y, int px, int py, String bulletimage) {

    spaceShip = loadImage(playerImage);
    position = new PVector(x, y);
    bullets = new ArrayList<Bullet>();
    bulletImage = bulletimage;
    scaleX = px;
    scaleY = py;
  }

  void setActionKeys(int left, int right, int up, int down, int shoot) {
    akeyLeft = left;
    akeyRight = right;
    akeyUp = up;
    akeyDown = down;
    akeyShoot = shoot;
  }

  void pkeyReleased(int rKeycode) {

    if (rKeycode==akeyLeft) {
      left = false;
    }
    if (rKeycode==akeyRight) {
      right = false;
    }
    if (rKeycode==akeyUp) {
      up = false;
    }
    if (rKeycode==akeyDown) {
      down = false;
    }
    if (rKeycode==akeyShoot) {
      shoot = false;
    }
  }

  void pkeyPressed(int rKeycode) {
    if (rKeycode==akeyLeft) {
      left = true;
    }
    if (rKeycode==akeyRight) {
      right = true;
    }
    if (rKeycode==akeyUp) {
      up = true;
    }
    if (rKeycode==akeyDown) {
      down = true;
    }
    if (rKeycode==akeyShoot) {
      shoot = true;
    }
  }
  // Moves spaceship on the x and y-axis, also possible to move diagonally
  void movePlayer() {
    if (left) {
      position.x += -shipMoveSpeed;
    }
    if (right) {
      position.x += shipMoveSpeed;
    }
    if (up) {
      position.y += -shipMoveSpeed;
    }
    if (down) {
      position.y += shipMoveSpeed;
    }
    if (shoot) {
      shoot(position.x, position.y);
    }
  }

  void displayBullets()
  {
    for (Bullet bullet : bullets) {
      bullet.displayBullet();
      bullet.move();
    }
  }
  void removeAllBullets() { //<>//
    for (int i = bullets.size() -1; i >= 0; i--) {
      bullets.remove(i);
    }
  }
  // Deletes bullets when out of screen so that the game wont lagg as much and eventually crash
  void deleteBulletOutOfBound() {
    Iterator<Bullet> shoot = bullets.iterator();
    while (shoot.hasNext()) {
      Bullet b = shoot.next(); //<>//
      if (b.position.y <=1) {
        shoot.remove();
      }
    }
  }

  void shoot(float x, float y) {
    if (millis() - bulletTimer >= bulletDelay) { // Calculates delay between shots
      bulletTimer = millis();
      Bullet bullet = new Bullet(x, y-35, 3, bulletImage); // Spawns bullet at spaceShip location
      bullets.add(bullet);
    }
  }

  // Constraints the player to the screen size, aka it is not possible to move out of the screen
  void playerConstrain() {
    position.x = constrain(position.x, 60, width-60);
    position.y = constrain(position.y, height-height/6, height-60);
  }

  void displayPlayer() {
    imageMode(CENTER);
    spaceShip.resize(scaleX, scaleY);
    image(spaceShip, position.x, position.y);
  }

  void playerHit() {
    for (int i = aliens.size() - 1; i >=0; i--) {
      Alien alien = aliens.get(i);
      float d = dist(position.x, position.y, alien.position.x, alien.position.y);
      if (d < 40 + 40) {
        health --;
      }
    }
  }
}
