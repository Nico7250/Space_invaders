import java.util.Iterator;

Alien alien;
Player player;
Bullet bullet;

int stage = 1;

float[] stars = new float[1000];
float[] stars2 = new float[1000];
float[] stars3 = new float [1000];

ArrayList <Alien> aliens;
ArrayList <Bullet> bullets;


void setup() {
  fullScreen();
  frameRate(60);
  //size(700,700);
  
  aliens = new ArrayList<Alien>();
  bullets = new ArrayList<Bullet>();
  
  player = new Player("spaceShip.png");
  bullet = new Bullet(player, player.spaceShipX, player.spaceShipY);
  //aliens.add(new Alien());
  createFleet();
  createStars();
}

void draw() {
   if (stage == 0){
      background(54,57,63);
      //textFont(zigBlack);
      textAlign(CENTER);
      textSize(36);
      text("$PACE INVADER$", width/2, height/5);
   }
     else if(stage == 1){
  background(0);
  displayStars();
  
  bullet.shoot();
  for (Bullet bullet : bullets) {
    bullet.displayBullet();
    bullet.move();
  }
  
 for (Alien alien : aliens) {
    alien.displayAlien();
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
