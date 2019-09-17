Alien alien;
Player player;
Bullet bullet;

float[] stars = new float[1000];
float[] stars2 = new float[1000];
float[] stars3 = new float [1000];


void setup(){
  fullScreen();
  //size(800,800);
  frameRate(60);
  alien = new Alien();
  player = new Player("spaceShip.png");
  bullet = new Bullet(player);
  
  for (int i=0; i<1000; i++){
    stars[i] = (random(0,width));
    stars2[i] = (random(0,height));
    stars3[i] = (random(0,4));
  }
}



void draw(){
  background(54, 57, 63);
  alien.displayAlien();
  player.displayPlayer();
  player.movePlayer();
  player.playerConstrain();
  bullet.displayBullet();
  
    for(int i = 0; i<1000; i++){
  rect(stars[i],stars2[i],stars3[i],stars3[i]);
}
}
