public class Player {
  PImage spaceShip;
  PImage spaceShip2;
  public PVector position;
  int shipMoveSpeed;
  int health;

  // With the PImage as a input string, it is possible to make 2 players with different spaceships
  Player(String playerImage, float x, float y) {

    spaceShip = loadImage(playerImage);
    spaceShip2 = loadImage(playerImage);
    position = new PVector(x, y);
    shipMoveSpeed = 5;
    health = 3;
  }

  // Moves spaceship on the x and y-axis, also possible to move diagonally
  void movePlayer1() {
    if (player1Left) {
      position.x += -shipMoveSpeed;
    }
    if (player1Right) {
      position.x += shipMoveSpeed;
    }
    if (player1Up) {
      position.y += -shipMoveSpeed;
    }
    if (player1Down) {
      position.y += shipMoveSpeed;
    }
    if (player1Shoot){
      bullet.shoot(position.x, position.y);
    }
  }

  void movePlayer2() {
    if (player2Left) {
      position.x += -shipMoveSpeed;
    }
    if (player2Right) {
      position.x += shipMoveSpeed;
    }
    if (player2Up) {
      position.y += -shipMoveSpeed;
    }
    if (player2Down) {
      position.y += shipMoveSpeed;
    }
    if (player2Shoot){
       bullet.shoot(position.x, position.y);
    }
  }

  // Constraints the player to the screen size, aka it is not possible to move out of the screen
  void playerConstrain() {
    position.x = constrain(position.x, 60, width-60);
    position.y = constrain(position.y, height-height/6, height-60);
  }
  void displayPlayer2() {
    imageMode(CENTER);
    spaceShip2.resize(118, 115);
    image(spaceShip2, position.x, position.y);
  }
  // Displays player
  void displayPlayer() {
    imageMode(CENTER);
    spaceShip.resize(120, 97);
    image(spaceShip, position.x, position.y);
  }

  void playerHit() {
    for (int i = aliens.size() - 1; i >=0; i--) {
      Alien alien = aliens.get(i);
      float d = dist(position.x, position.y, alien.alienLocX, alien.alienLocY);
      if (d < 40 + 40) {
        //aliens.remove(i);
        println("kaboom");
        health --;
      }
    }
  }
}
