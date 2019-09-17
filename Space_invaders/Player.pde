

public class Player{
  PImage spaceShip;
  float spaceShipX;
  float spaceShipY;
  
  Player(String playerImage){
    
    spaceShip = loadImage(playerImage);
    spaceShipX = width/2;
    spaceShipY = height - 60;   
  }
  
  void movePlayer(){
    if (player1LEFT == true){
    spaceShipX += -1;
    }
    else if (player1RIGHT == true){
      spaceShipX += 1;
    }
  }
  
  void displayPlayer(){
    imageMode(CENTER);
    spaceShip.resize(120, 97);
    image(spaceShip, spaceShipX, spaceShipY);  
  }
  
}
