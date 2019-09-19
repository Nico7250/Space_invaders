long timer; // Used in calculation for bullet delay
int bulletDelay = 250; // The delay between shots

// Uses Player as parent, this is used for calculation of bullet spawn location
public class Bullet {
  PImage playerBullet;
  float playerBulletX;
  float playerBulletY;
  Player parent;

  Bullet(Player p, float x, float y) {
    parent = p;
    playerBullet = loadImage("PlayerBullet.png");
    playerBulletX = x ;
    playerBulletY = y;
  }

  void move() {
    playerBulletY -= 3;
  }

  // Adds a bullet to the arraylist bullets
  void shoot() {
    if (player1Space) {
      if (millis() - timer >= bulletDelay) { // Calculates delay between shots
        timer = millis();
        Bullet bullet = new Bullet(player, parent.spaceShipX, parent.spaceShipY-35); // Spawns bullet at spaceShip location
        bullets.add(bullet);
      }
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
    image(playerBullet, playerBulletX, playerBulletY);
  }

  // Deletes bullets when out of screen so that the game wont lagg as much and eventually crash
  void deleteBulletOutOfBound() {
    Iterator<Bullet> shoot = bullets.iterator();
    while (shoot.hasNext()) {
      Bullet b = shoot.next();
      if (b.playerBulletY <=1) {
        shoot.remove();
      }
    }
  }
}

// Detects collision between alien and player shot
void bulletDetect() {
  for (int i = bullets.size() -1; i >= 0; i--) { // Using a decrementing loop / counting backwards to -
    Bullet bullet = bullets.get(i);              // - avoid infinity loop due to how arrayList works
    for (int j = aliens.size() -1; j >= 0; j--) {
      Alien alien = aliens.get(j);
      float d = dist(alien.alienLocX, alien.alienLocY, bullet.playerBulletX, bullet.playerBulletY);
      if (d < 20 + 20) {
        bullets.remove(i);
        aliens.remove(j);
        rules.score1 += 1000; // Increses score everytime an alien is killed
        alien.moveSpeedUp(); // Increses the movement speed of all aliens when alien is killed
      }
    }
  }
}
