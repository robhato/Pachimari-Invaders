//Goal: Make Pachimari's attack and have a hero defend against them.
//Images use courtsey of Ohmonah
//Music made by ThoseRedlights: https://www.youtube.com/watch?v=hBuAEC13LWs&index=33&list=FLeXExZB7QAx0Oin4NfP1s3w

//Imports song for game
//Sketch- Import Library- Add Library- Type Sound- Install to processing for music
//import processing.sound.*;
//SoundFile file;

//background image for game
PImage star;
PImage title;
PImage invaders;
PImage dva;
PFont fontName;
int score = 0;
int highscore;
int lives = 3;
boolean gameStart = false;
boolean keyW = false;
// Player object
Player player;
// Pachimaris object
Pachimaris pachi = new Pachimaris();
// Projectiles object
Projectiles p = new Projectiles();


//Setup for stage and sound
void setup() {
  star = loadImage("Starsbackground.jpg");
  title = loadImage("Pachimari_title.png");
  invaders = loadImage("Invaders_title.png");
  dva = loadImage("hero1.png");
  fontName = loadFont("Calibri-Bold-48.vlw");
  player = new Player();
  size(500,500);
  smooth();
// Music- Victory Theme [RED REMIX] by ThoseRedLights
//file = new SoundFile(this, "Victory Theme.mp3");
  //file.loop();
}

void draw() {
  if (gameStart == false) {
    startScreen();
  }
   else if (gameStart == true) {
  background(star);
  frameRate(60);
  textSize(15);
  fill(255);
  text("Score: " + score, 20, 20);
  text("Lives: " + lives, 20, 40);
  pachi.load();
  pachi.downMove();
  if (keyW == true) {
    p.startPos(player.x,player.y);
  }
  p.show();
  p.shoot();
  player.show();
  if (intersect(p, pachi)) {
    scoreUp();
  } else if (pachi.yPos == 450) {
    livesDown();
  }
  if (intersect(player, pachi)) {
    death();
  }
  if (lives < 0) {
    death();
  }
}
}

void keyPressed() {
  if (key == 'a') {
    player.move(-15);
  } else if (key == 'd') {
    player.move(+15);
  }
  if (key == 'w') {
      keyW = true;
  }
}

void keyReleased() {
  if (key == 'w') {
    keyW = false;
  }
}

void startScreen() {
  background(255);
  imageMode(CORNERS);
  image(title,55,20);
  image(invaders,55,100);
  fill(0);
  textFont(fontName);
  textSize(24);
  text("Highscore: " + highscore,20,480);
  //sets up the instruction information
  textFont(fontName);
  textSize(14);
  text("Instructions to play:", 200,345);
  text("Use A and D to move left and right", 155,360);
  text("Use W to shoot the Pachmaris!", 165, 375);
  startButton();
}

void startButton() {
  //green colour rectangle for button
  strokeWeight(3);
  stroke(3,141,255);
  fill(0,225,130);
  rect(135,225,240,100);
  textSize(70);
  textFont(fontName);
  fill(246,0,119);
  text("START", 188,290);
}

void scoreUp() {
  pachi.velocity += 0.1;
  score += 10;
  pachi.reset();
  p.reset();
}

void scoreDown() {
  score -= 10;
  pachi.reset();
  p.reset();
} 

void livesDown() {
  lives--;
  pachi.reset();
  p.reset();
}

void death() {
  gameStart = false;
  highscore = max(highscore, score);
  pachi.velocity = 2;
  score = 0;
  lives = 3;
}


void mousePressed() {
  if (mouseX > 135 && mouseX < 375) {
    if (mouseY > 225 && mouseY < 335) {
        gameStart = true;
    }
  }
  }
  
boolean intersect(Projectiles p, Pachimaris pachi){
  float differenceX = (p.x) - (pachi.xPos);
  float differenceY = (p.y) - (pachi.yPos);
  if (abs(differenceX) < 35) {
    if (abs(differenceY) < 25) {
  return true;
    }
  }
  return false;
}

boolean intersect(Player player, Pachimaris pachi){
  float differenceX = (player.x) - (pachi.xPos);
  float differenceY = (player.y) - (pachi.yPos);
  if (abs(differenceX) < 25) {
    if (abs(differenceY) < 25) {
  return true;
    }
  }
  return false;
}
