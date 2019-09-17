

public class Bullet{
  PImage playerBullet;
  float playerBulletX;
  float playerBulletY;
  Player parent;
  
  Bullet(Player p){
    parent = p;
    playerBullet = loadImage("PlayerBullet.png");
    // Sets bullets X-locations to the same as players X-location
    playerBulletX = parent.spaceShipX;
    // Sets bullets Y-locations to the same as players Y-location and moves it up a bit
    playerBulletY = parent.spaceShipY-35;
  }
  
  void displayBullet(){
    imageMode(CENTER);
    playerBullet.resize(24, 38);
    image(playerBullet, playerBulletX, playerBulletY);
  }
  
}
