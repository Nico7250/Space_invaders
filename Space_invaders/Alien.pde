
public class Alien {
  PImage alien;
  float alienLocX;
  float alienLocY;

  Alien(float x, float y) {
    alien = loadImage("alien.png");
    alienLocX = x;
    alienLocY = y;
  }

  void displayAlien() {
    imageMode(CENTER);
    alien.resize(100, 50);
    image(alien, alienLocX, alienLocY);
  }
}

/*void createFleet(){
 for (int i = 0; i < 9; i ++){
 aliens[i] = new Alien(i*150 + 150, 50);
 }
 
 }*/


int getNumberAliensX() {
  int alienWidth = width/18;
  int avalibleSpaceX = width -2 *alienWidth;
  int numberAliensX = (avalibleSpaceX /(2 * alienWidth));

  println("alien numbere x" + numberAliensX);
  return numberAliensX;
}

int getNumberRows(){
 int alienHeight = 50;
 int shipHeight = 97;
 
 int avalibleSpaceY = (height - (3 * alienHeight) - shipHeight);
 int numberRows = int(avalibleSpaceY / (2 * alienHeight));
 
 return numberRows;
}


void createAlien(int alienNumber,int rowNumber) {
  int alienWidth = width/18;
  int alienHeight = 50;
  
  alien = new Alien(0, 50);
  int alienX = alienWidth + 2 * alienWidth * alienNumber;
  int alienY = alienHeight +2 * alienHeight * rowNumber;
  alien.alienLocY = alienY;
  alien.alienLocX = alienX;
  println(alienNumber);
  aliens.add(alien);
}


void createFleet() {
  int numberAliensX = getNumberAliensX();
  int numberRows = getNumberRows();
  
  for (int rowNumber = 0; rowNumber < numberRows; rowNumber += 1){
    for (int alienNumber = 0; alienNumber < numberAliensX; alienNumber += 1) {
      createAlien(alienNumber, rowNumber);
    }
  }
}
