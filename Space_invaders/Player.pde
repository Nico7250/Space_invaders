

public class Player {
  PImage spaceShip;
  public float spaceShipX;
  public float spaceShipY;
  public float rectX;
  public float rectY;
  int shipMoveSpeed;

  // With the PImage as a input string, it is possible to make 2 players with different spaceships
  Player(String playerImage) {

    spaceShip = loadImage(playerImage);
    spaceShipX = width/2;
    spaceShipY = height;
    shipMoveSpeed = 5;
    rectX = width/4;
    rectY = height - 50;
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
      rectX += -shipMoveSpeed;
    }
    if (player2Right) {
      rectX += shipMoveSpeed;
    }
    if (player2Up) {
      rectY += -shipMoveSpeed;
    }
    if (player2Down) {
      rectY += shipMoveSpeed;
    }
  }

  // Constraints the player to the screen size, aka it is not possible to move out of the screen
  void playerConstrain() {
    spaceShipX = constrain(spaceShipX, 60, width-60);
    spaceShipY = constrain(spaceShipY, height-height/6, height-60);
  }

  void displayPlayer2(){
    rectMode(CENTER);
    fill(0,0,255);
   rect(rectX, rectY - 50, 100, 100); 
  }
  // Displays player
  void displayPlayer() {
    imageMode(CENTER);
    spaceShip.resize(120, 97);
    image(spaceShip, spaceShipX, spaceShipY);
  }
}
