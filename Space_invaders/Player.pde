

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
    if (player1Left == true){
    spaceShipX += -5;
    }
    else if (player1Right == true){
      spaceShipX += 5;
    }
    // Stop when both right and left clickd
    /*else if(player1RIGHT == true && player1LEFT == true){
      spaceShipX = 0;
    }*/
  }
  
  void playerConstrain(){
   spaceShipX = constrain(spaceShipX,60, width-60); 
  }
  
  void displayPlayer(){
    imageMode(CENTER);
    spaceShip.resize(120, 97);
    image(spaceShip, spaceShipX, spaceShipY);  
  }
  
}
