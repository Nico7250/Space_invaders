import java.util.Iterator;

Alien alien;
Player player;
Bullet bullet;

int stage = 0;

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
      displayStars();
      //textFont(zigBlack);
      textAlign(CENTER);
      textSize(72);
      text("$PACE INVADER$", width/2, height/5);
      textSize(14);
      text("Press 'ESC' to exit game.",width/2,height/1.1);
      text("Press 'ENTER' to start game.",width/2,height/1.12);
      rectMode(CENTER);
      rect(width/2,height/3,250,100);
      rect(width/2,height/1.75,250,100);
      rect(width/2,height/1.25,250,100);
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
