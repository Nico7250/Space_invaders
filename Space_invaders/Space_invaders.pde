Alien alien;
Player player;

void setup(){
  fullScreen();
  //size(800,800);
  alien = new Alien();
  player = new Player("spaceShip.png");
}



void draw(){
  background(0);
  alien.displayAlien();
  player.displayPlayer();
  player.movePlayer();
  player.playerConstrain();
  
}
