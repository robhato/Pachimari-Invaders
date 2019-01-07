class Player {
  float x = width/2;
  float y = 450;
  //PImage[] heroes;
  
  
  void show() {
    for(int i = 0; i < 12; i++) {
      //heroes[i] = loadImage("hero" + i + ".png");
      imageMode(CENTER);
      image(dva, x, y);
    } 
  }
  
  // Allows movement of character
  void move(float moves) {
    x += moves;
    x = constrain(x, 50, width-50);
  }
}
