class Pachimaris {
  float xPos;
  float yPos;
  PImage pachimari;
  float velocity;
  
  Pachimaris() {
    xPos = random(50,450);
    yPos = 50;
    velocity = 2;
  }
  
  void load() {
    pachimari = loadImage("Pachimari.png");
    //background(star);
    image(pachimari,xPos,yPos);
  }
  
  void downMove() {
    if (yPos == this.yPos) {
      yPos += velocity;
    } 
    if (yPos > 450) {
      reset();
    }
  }
  
  void reset() {
    yPos = 50;
    xPos = random(50,450);
  }
}
