

public class Alien{
  PImage alien;
  public float alienLocX;
  
  Alien(){
    alien = loadImage("alien.png");
    alienLocX = 0;
    
    
  }
  
  void displayAlien(){
    imageMode(CENTER);
    alien.resize(100, 50);
    image(alien, alienLocX, height/2);
  }
  
}
