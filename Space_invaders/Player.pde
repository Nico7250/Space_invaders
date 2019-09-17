

public class Player{
  PImage spaceShip;
  
  Player(){
    spaceShip = loadImage("spaceShip.png");
    
  }
  
  void displayPlayer(){
    imageMode(CENTER);
    spaceShip.resize(120, 97);
    image(spaceShip, width/2,height-60);
    
  }
  
}
