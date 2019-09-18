long timer; // Used in calculation for bullet delay
int wait = 500; // The delay between shots

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
      if (millis() - timer >= wait) { // Calculates delay between shots
        timer = millis();
        Bullet bullet = new Bullet(player, parent.spaceShipX, parent.spaceShipY-35); // Spawns bullet at spaceShip location
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
    Iterator<Bullet> shoot = bullets.iterator();
  while (shoot.hasNext()) {
    Bullet b = shoot.next();
    if (b.playerBulletY <=1){
    shoot.remove();
    }
  }
  }
}
