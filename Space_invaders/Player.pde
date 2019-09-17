

public class Player{
  PImage spaceShip;
  
  Player(){
    spaceShip = loadImage("spaceShip.png");
    
  }
  
  void displayPlayer(){
    imageMode(CENTER);
    spaceShip.resize(150, 122);
    image(spaceShip, 200,200);
    
  }
  
}
