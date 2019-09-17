Alien alien;
Player player;
Bullet bullet;

void setup(){
  fullScreen();
  //size(800,800);
  frameRate(60);
  alien = new Alien();
  player = new Player("spaceShip.png");
  bullet = new Bullet(player);
  
}



void draw(){
  background(54, 57, 63);
  alien.displayAlien();
  bullet.displayBullet();
  player.displayPlayer();
  player.movePlayer();
  player.playerConstrain();
}
