

public class Player {
  PImage spaceShip;
  PImage spaceShip2;
  public float spaceShipX;
  public float spaceShipY;
  public float spaceShip2X;
  public float spaceShip2Y;
  int shipMoveSpeed;

  // With the PImage as a input string, it is possible to make 2 players with different spaceships
  Player(String playerImage) {

    spaceShip = loadImage(playerImage);
    spaceShip2 = loadImage(playerImage);
    spaceShipX = width/2;
    spaceShipY = height;
    shipMoveSpeed = 5;
    spaceShip2X = width/4;
    spaceShip2Y = height-50;
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
      spaceShip2X += -shipMoveSpeed;
    }
    if (player2Right) {
      spaceShip2X += shipMoveSpeed;
    }
    if (player2Up) {
      spaceShip2Y += -shipMoveSpeed;
    }
    if (player2Down) {
      spaceShip2Y += shipMoveSpeed;
    }
  }

  // Constraints the player to the screen size, aka it is not possible to move out of the screen
  void playerConstrain() {
    spaceShipX = constrain(spaceShipX, 60, width-60);
    spaceShipY = constrain(spaceShipY, height-height/6, height-60);
  }
  void player2Constrain() {
    spaceShip2X = constrain(spaceShip2X, 60, width-60);
    spaceShip2Y = constrain(spaceShip2Y, height-height/6, height-60);
  }

  void displayPlayer2(){
    imageMode(CENTER);
    spaceShip2.resize(118,115);
    image(spaceShip2,spaceShip2X, spaceShip2Y); 
  }
  // Displays player
  void displayPlayer() {
    imageMode(CENTER);
    spaceShip.resize(120, 97);
    image(spaceShip, spaceShipX, spaceShipY);
  }
}
