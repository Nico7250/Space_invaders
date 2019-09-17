

public class Bullet{
  PImage playerBullet;
  float playerBulletX;
  float playerBulletY;
  Player parent;
  
  Bullet(Player p, float x, float y){
    parent = p;
    playerBullet = loadImage("PlayerBullet.png");
    // Sets bullets X-locations to the same as players X-location
    playerBulletX = x ;
    // Sets bullets Y-locations to the same as players Y-location and moves it up a bit
    playerBulletY = y;
  }
  
  void move(){
   playerBulletY -= 1; 
  }
  
  void shoot(){
    if (player1Space){
     Bullet bullet = new Bullet(player, parent.spaceShipX, parent.spaceShipY-35);
     bullets.add(bullet);
    }
  }
  
  void displayBullet(){
    imageMode(CENTER);
    playerBullet.resize(24, 38);
    image(playerBullet, playerBulletX, playerBulletY);
  }
  
}
