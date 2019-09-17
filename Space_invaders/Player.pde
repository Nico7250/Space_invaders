

public class Player{
  PImage spaceShip;
  public float spaceShipX;
  public float spaceShipY;
  
  // With the PImage as a input string, it is possible to make 2 players with different spaceships
  Player(String playerImage){
    
    spaceShip = loadImage(playerImage);
    spaceShipX = width/2;
    spaceShipY = height - 60;   
  }
  
  // Moves spaceship on the x and y-axis, also possible to move diagonally
  void movePlayer(){
    if (player1Left == true){
    spaceShipX += -5;
    }
    if (player1Right == true){
      spaceShipX += 5;
    }
    if (player1Up == true){
      spaceShipY += -5;
    }
    if (player1Down == true){
      spaceShipY += 5;
    }
  }
  
  // Constraints the player to the screen size, aka it is not possible to move out of the screen
  void playerConstrain(){
   spaceShipX = constrain(spaceShipX,60, width-60);
   spaceShipY = constrain(spaceShipY,height-height/6,height-60);
  }
  
  // Displays player
  void displayPlayer(){
    imageMode(CENTER);
    spaceShip.resize(120, 97);
    image(spaceShip, spaceShipX, spaceShipY);  
  }
  
}
