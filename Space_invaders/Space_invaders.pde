//import processing.sound.*;
import java.util.Iterator;


Alien alien;
Player player;
Player player2;
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

  aliens = new ArrayList<Alien>();
  bullets = new ArrayList<Bullet>();

  player = new Player("spaceShip.png", width/2, height);
  player2 = new Player("spaceShip2.png", width/4, height);
  bullet = new Bullet(player.position.x, player.position.y);
  rules = new Rules();
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

// Stages are made in the display tab
void draw() {
  if (stage == 0) {
    stage0();
  } else if (stage == 1) {
    stage1();
  } else if (stage == 2) {
    stage2();
  } else if (stage == 3) {
    stage3();
  } else if (stage == 4) {
    stage4();
  } else if (stage == 5) {
    stage5();
  }
}
