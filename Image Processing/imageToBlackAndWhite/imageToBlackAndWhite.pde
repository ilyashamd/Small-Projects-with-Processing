PImage img,phot;


void setup(){
  size(980,352);
  img=loadImage("image.jpg"); //load image
  phot=createImage(980,352,RGB);  //create new image
}


void draw(){
  //initialization
  phot.loadPixels();
  img.loadPixels();
  //pixels!!
  for(int x=0; x<img.width; x++){
    for(int y=0; y<img.height; y++) {
      int loc=x+y*width;
      
      color pix = img.pixels[loc];
      float br =brightness(pix);
      //threshold=170
      if(br>170)  phot.pixels[loc]=color(255);
      else  phot.pixels[loc]=color(0);
    }
  }
  
  phot.updatePixels();  //must be done!
  
  image(phot,0,0);  //displaying the new image
  
}
