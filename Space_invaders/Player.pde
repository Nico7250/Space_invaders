public class Player {
  PImage spaceShip;
  PImage spaceShip2;
  public float spaceShipX;
  public float spaceShipY;
  int shipMoveSpeed;

  // With the PImage as a input string, it is possible to make 2 players with different spaceships
  Player(String playerImage, float x, float y) {

    spaceShip = loadImage(playerImage);
    spaceShip2 = loadImage(playerImage);
    spaceShipX = x;
    spaceShipY = y;
    shipMoveSpeed = 5;
  }

  // Moves spaceship on the x and y-axis, also possible to move diagonally
  void movePlayer1() {
    if (player1Left) {
      spaceShipX += -shipMoveSpeed;
    }
    if (player1Right) {
      spaceShipX += shipMoveSpeed;
    }
    if (player1Up) {
      spaceShipY += -shipMoveSpeed;
    }
    if (player1Down) {
      spaceShipY += shipMoveSpeed;
    }
  }
  
   void movePlayer2() {
    if (player2Left) {
      spaceShipX += -shipMoveSpeed;
    }
    if (player2Right) {
      spaceShipX += shipMoveSpeed;
    }
    if (player2Up) {
      spaceShipY += -shipMoveSpeed;
    }
    if (player2Down) {
      spaceShipY += shipMoveSpeed;
    }
  }

  // Constraints the player to the screen size, aka it is not possible to move out of the screen
  void playerConstrain() {
    spaceShipX = constrain(spaceShipX, 60, width-60);
    spaceShipY = constrain(spaceShipY, height-height/6, height-60);
  }
  void displayPlayer2(){
    imageMode(CENTER);
    spaceShip2.resize(118,115);
    image(spaceShip2,spaceShipX, spaceShipY); 
  }
  // Displays player
  void displayPlayer() {
    imageMode(CENTER);
    spaceShip.resize(120, 97);
    image(spaceShip, spaceShipX, spaceShipY);
  }
  
  void playerHit(){
  for (int i = aliens.size() - 1; i >=0; i--){
    Alien alien = aliens.get(i);
    float d = dist(spaceShipX, spaceShipY, alien.alienLocX, alien.alienLocY);
    if (d < 40 + 40){
      aliens.remove(i);
      println("kaboom");
    }
  }
}
}
