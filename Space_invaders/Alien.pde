

public class Alien{
  PImage alien;
  
  Alien(){
    alien = loadImage("alien.png");
    
  }
  
  void displayAlien(){
    imageMode(CENTER);
    alien.resize(100, 50);
    image(alien, width/2, height/2);
  }
  
}
