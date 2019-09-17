Alien alien;
Player player;
Bullet bullet;

float[] stars = new float[1000];
float[] stars2 = new float[1000];
float[] stars3 = new float [1000];

ArrayList <Alien> aliens;


void setup(){
  fullScreen();
  //size(800,800);
  frameRate(60);
  //alien = new Alien();
  aliens = new ArrayList<Alien>();
  player = new Player("spaceShip.png");
  bullet = new Bullet(player);
  aliens.add(new Alien());
  createFleet();
  
  for (int i=0; i<1000; i++){
    stars[i] = (random(0,width));
    stars2[i] = (random(0,height));
    stars3[i] = (random(0,4));
  }
}

void createFleet(){
   // alien = new Alien();
    float alienWidth = 50;
    //float avalibleSpaceX = width + alienWidth;
    float numberAliensX = int(width /(2 * alienWidth));
    
    for (int alienNumber = 1; alienNumber < numberAliensX; alienNumber += 1){
     alien = new Alien();
     float alienX = alienWidth +2 * alienWidth * alienNumber;
     alienX = constrain(alienX,60, width-60);
     alien.alienLocX = alienX;
     println(alienNumber);
     aliens.add(alien);
    }
  }



void draw(){
  background(0);
  for(int i = 0; i<1000; i++){
  rect(stars[i],stars2[i],stars3[i],stars3[i]);
}
  for (Alien alien : aliens){
   alien.displayAlien();
  }
  //alien.displayAlien();
  bullet.displayBullet();
  player.displayPlayer();
  player.movePlayer();
  player.playerConstrain();
}
