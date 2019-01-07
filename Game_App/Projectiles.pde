// Class for the bullets/beam that shoots the Pachimari enemies
class Projectiles {
  float x,y;
  float velocity;
  boolean fire;
  
  Projectiles() {
    x = 250;
    y = 450;
    velocity = 0;
    fire = false;
  }
  
  void startPos(float X1, float Y1) {
    if (fire == false) {
      x = X1;
      y = Y1;
      fire = true;
      velocity = 5;
    }
  }
  
  void shoot() {
    if (fire == true) {
      y -= velocity;
      if (y < 0) {
        reset();
      }
    }
  }
  
  void reset() {
    velocity = 0;
    fire = false;
    y = 600;
  }
  
  void show() {
    fill(0);
    rect(x,y,5,10);
  }
}
