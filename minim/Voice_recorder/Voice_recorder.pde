import ddf.minim.*;

Minim minim;
AudioInput mic;
AudioRecorder right;//rightrecord
AudioSample Pright;//right playback

void setup() {
  size(400, 300);

  minim=new Minim(this);
  mic=minim.getLineIn();

  right=minim.createRecorder(mic, "right.wav");
}

void draw() {
  background(255);
  fill(0);
  if (right.isRecording()) 
    text("Press RIGHT to stop recording", 20, height-80);
  else
    text("Press RIGHT to start recording", 20, height-80);

  text("Press UP to playback record", 20, height-40);
}

void keyPressed() {
  if (keyCode==RIGHT) {
    if (right.isRecording()) {
      right.endRecord();
      right.save();
    } else {
      right.beginRecord();
    }
  }

  if (keyCode==UP) {
    Pright=minim.loadSample("right.wav");
    Pright.trigger();
  }
}