import ddf.minim.*;

Minim minim;
AudioPlayer song;
void setup(){
  size(400,300);
  
  minim=new Minim(this);
  song=minim.loadFile("Mask.mp3");
  
  song.play();
}

void draw(){
  background(255);
  fill(0);
  textSize(32);
  textAlign(CENTER);
  text(song.position()+" out of "+song.length(),width/2, height/2);
}