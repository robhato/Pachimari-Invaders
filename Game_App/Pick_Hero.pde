class Pick_Hero {

}

PImage[] heroes = new PImage[11];

void heroInsert() {
  for(int i =0; i < heroes.length; i++) {
    heroes[i] = loadImage("hero" + i + ".png");
  }


int x = 25;
int y = 25;
x += 50;

if(x>width){
  x=25;
  y+=50;
}

 stroke(255);
 imageMode(CENTER);
 for(int i = 0; i < heroes.length; i++) {
   image(heroes[i],x,y);
 }
}
