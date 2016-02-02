import processing.video.*;

Capture video;
PImage img;  //to store the background
int a=1;

void setup(){
  size(640,480);
  video= new Capture(this,640,480,30);
  video.start();
  img=createImage(video.width,video.height,RGB);
}

void draw(){
  
 video.loadPixels();
 img.loadPixels();
 loadPixels();
  image(video,0,0);
  for(int x=0; x<video.width; x++){
    for(int y=0; y<video.height; y++) {
      int loc=x+y*video.width;
      
      float r1= red(video.pixels[loc]);
      float g1= green(video.pixels[loc]);
      float b1= blue(video.pixels[loc]);
      
      float r2= red(img.pixels[loc]);
      float g2= green(img.pixels[loc]);
      float b2= blue(img.pixels[loc]);
      float diff= dist(r1,g1,b1,r2,g2,b2);
      
      if (diff >50) pixels[loc]=video.pixels[loc];
      else pixels[loc]=color(0,100,0);     
      
    }
    
  }
     updatePixels();
      
}

void captureEvent(Capture video){
      video.read();
}

void mousePressed(){
  img.copy(video,0,0,video.width,video.height,0,0,video.width,video.height);
  img.updatePixels();
  image(img,0,0);
  save("img.jpg");
  
}
