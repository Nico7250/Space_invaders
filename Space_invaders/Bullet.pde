long timer; // Used in calculation for bullet delay
int bulletDelay = 250; // The delay between shots

// Uses Player as parent, this is used for calculation of bullet spawn location
public class Bullet {
  PImage playerBullet;
  PVector position;

  Bullet(float x, float y) {
    playerBullet = loadImage("../Resources/PlayerBullet.png");
    position = new PVector(x, y);
  }

  void move() {
    position.y -= 3;
  }

  // Adds a bullet to the arraylist bullets
  void shoot(float x, float y) {
      if (millis() - timer >= bulletDelay) { // Calculates delay between shots
        timer = millis();
        Bullet bullet = new Bullet(x, y-35); // Spawns bullet at spaceShip location
        bullets.add(bullet);
      }
    }

  // Removes all bullet, this is to be used when leveling up
  void removeAll() {
    for (int i = bullets.size() -1; i >= 0; i--) {
      Bullet bullet = bullets.get(i);
      bullets.remove(i);
    }
  }

  void displayBullet() {
    imageMode(CENTER);
    playerBullet.resize(24, 38);
    image(playerBullet, position.x, position.y);
  }

  // Deletes bullets when out of screen so that the game wont lagg as much and eventually crash
  void deleteBulletOutOfBound() {
    Iterator<Bullet> shoot = bullets.iterator();
    while (shoot.hasNext()) {
      Bullet b = shoot.next();
      if (b.position.y <=1) {
        shoot.remove();
      }
    }
  }
}
