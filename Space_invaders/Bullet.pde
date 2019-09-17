

public class Bullet{
  PImage playerBullet;
  float playerBulletX;
  float playerBulletY;
  Player parent;
  
  Bullet(Player p){
    parent = p;
    playerBullet = loadImage("PlayerBullet.png"); 
    playerBulletX = parent.spaceShipX;
    playerBulletY = parent.spaceShipY - 55;
  }
  
  void displayBullet(){
    imageMode(CENTER);
    playerBullet.resize(24, 38);
    image(playerBullet, playerBulletX, playerBulletY);
    
  }
  
}
