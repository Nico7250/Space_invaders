Alien alien;
Player player;
Bullet bullet;

float[] stars = new float[1000];
float[] stars2 = new float[1000];
float[] stars3 = new float [1000];

ArrayList <Alien> aliens;
ArrayList <Bullet> bullets;


void setup() {
  fullScreen();
  frameRate(60);
  
  aliens = new ArrayList<Alien>();
  bullets = new ArrayList<Bullet>();
  
  player = new Player("spaceShip.png");
  bullet = new Bullet(player, player.spaceShipX, player.spaceShipY);
  aliens.add(new Alien());
  createFleet();
  createStars();
}

void draw() {
  background(0);
  for (int i = 0; i<1000; i++) {
    rect(stars[i], stars2[i], stars3[i], stars3[i]);
  }
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
}
