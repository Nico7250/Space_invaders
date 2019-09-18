Alien alien;
Player player;
Bullet bullet;
import java.util.Iterator;

int stage = 1;

float[] stars = new float[1000];
float[] stars2 = new float[1000];
float[] stars3 = new float [1000];

ArrayList <Alien> aliens;
ArrayList <Bullet> bullets;


void setup() {
  fullScreen();
  //size(800,800);
  frameRate(60);
  //alien = new Alien();
  aliens = new ArrayList<Alien>();
  bullets = new ArrayList<Bullet>();
  player = new Player("spaceShip.png");
  bullet = new Bullet(player, player.spaceShipX, player.spaceShipY);
  aliens.add(new Alien());
  createFleet();
  createStars();
}

void draw() {
   if (stage == 0){
      background(54,57,63);
      textAlign(CENTER);
      textSize(36);
      text("$PACE INVADER$",height/6,width/1);
   }
     else if(stage == 1){
  background(0);
  displayStars();
  for (Alien alien : aliens) {
    alien.displayAlien();
  }
  bullet.shoot();
  for (Bullet bullet : bullets) {
    bullet.displayBullet();
    bullet.move();
  }

  player.displayPlayer();
  player.movePlayer();
  player.playerConstrain();
  textAlign(CENTER);
  textSize(32);
  text(frameRate, 200, 200);
  
    bullet.deleteBulletOutOfBound();
     }

}
