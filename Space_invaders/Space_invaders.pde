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
  //size(800,800);
  frameRate(60);
  //alien = new Alien();
  aliens = new ArrayList<Alien>();
  bullets = new ArrayList<Bullet>();
  player = new Player("spaceShip.png");
  bullet = new Bullet(player, player.spaceShipX, player.spaceShipY);
  aliens.add(new Alien());
  //createFleet();

  for (int i=0; i<1000; i++) {
    stars[i] = (random(0, width));
    stars2[i] = (random(0, height));
    stars3[i] = (random(0, 4));
  }
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

  //alien.displayAlien();
  //bullet.displayBullet();
  player.displayPlayer();
  player.movePlayer();
  player.playerConstrain();
  textAlign(CENTER);
  textSize(32);
  text(frameRate,200,200);
}
