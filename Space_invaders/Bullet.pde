
// Uses Player as parent, this is used for calculation of bullet spawn location
public class Bullet {
  PImage playerBullet;
  PVector position;
  int moveSpeed;
  Bullet(float x, float y, int speed, String image) {
    if (image == null)
      playerBullet = loadImage("../Resources/PlayerBullet.png");
    else
      playerBullet = loadImage("../Resources/"+image);
    position = new PVector(x, y);
    moveSpeed = speed;
  }

  void move() {
    position.y -= moveSpeed;
  }

  void displayBullet() {
    imageMode(CENTER);
    playerBullet.resize(24, 38);
    image(playerBullet, position.x, position.y);
  }
}
