//import processing.sound.*;
import java.util.Iterator;


Alien alien;
Player player;
Bullet bullet;
Rules rules;

int stage = 0;
//SoundFile mainMusic;

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
  rules = new Rules();
  //aliens.add(new Alien());
  createFleet();
  createStars();
  /*mainMusic = new SoundFile(this, "Space_Invaders.mp3");
   if (stage == 0){
   mainMusic.play();
   }
   if (stage == 1) {
   mainMusic.stop();
   }*/
}

void draw() {
  if (stage == 0) {
    stage0();
  } else if (stage == 1) {
    stage1();
  }
}
