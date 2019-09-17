

public class Player{
  PImage spaceShip;
  float spaceShipX;
  float spaceShipY;
  
  Player(){
    
    spaceShip = loadImage("spaceShip.png");
    spaceShipX = width/2;
    spaceShipY = height - 60;
    
  }
  
  void displayPlayer(){
    imageMode(CENTER);
    spaceShip.resize(120, 97);
    image(spaceShip, spaceShipX, spaceShipY);
    
  }
  
}
