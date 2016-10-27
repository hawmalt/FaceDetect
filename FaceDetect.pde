import gab.opencv.*;
import java.awt.Rectangle;
import processing.video.*;

OpenCV opencv;
Capture video;
PImage hat;

void setup() {
  size(640, 480);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  hat = loadImage("Hat.png");
  
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  video.start();
}

void captureEvent(Capture c){
  c.read();
}

void draw() {
  scale(2);
  
  pushMatrix();
  translate(video.width,0);
  scale(-1,1);
  
  opencv.loadImage(video);
  
  image(video, 0, 0);

  Rectangle[] faces = opencv.detect();
  
  fill(255, 0, 0);
  strokeWeight(4.0);
  stroke(0);

  
  
  for (int i = 0; i < faces.length; i++) {
    ellipse(faces[i].x + faces[i].width / 2, faces[i].y + faces[i].height / 2, 24, 24);
    image(hat, faces[i].x, faces[i].y - faces[i].height, faces[i].width, faces[i].height);
  }
  
  popMatrix();
  
  
}