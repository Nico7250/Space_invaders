long timer;
int wait = 500;

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

  void shoot() {
    if (player1Space) {
      if (millis() - timer >= wait) {
        timer = millis();
        Bullet bullet = new Bullet(player, parent.spaceShipX, parent.spaceShipY-35);
        bullets.add(bullet);
      }
    }
  }

  void displayBullet() {
    imageMode(CENTER);
    playerBullet.resize(24, 38);
    image(playerBullet, playerBulletX, playerBulletY);
  }

  void deleteBulletOutOfBound() {
  }
}
