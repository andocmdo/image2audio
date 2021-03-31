import processing.sound.*;
SinOsc sine;

int ONE = 1270;
int ZERO = 1070;
int START = 870;
int END = 670;
int BPS = 300;
int INTERVAL;
PImage img;


void setup() {
  img = loadImage("ClaudeShannon_MFO3807.jpg");
  size(800, 600);
  
  
  imageMode(CENTER);
  //noStroke();
  background(255);
  
  INTERVAL = round((1.0 / BPS) * 1000);
  
  // Create the sine oscillator.
  sine = new SinOsc(this);
  sine.freq(ZERO);
}

void draw() {
  byte data[] = loadBytes("ClaudeShannon_MFO3807.jpg");
  
  sine.play();
  
  println("Interval is " + INTERVAL);
  delay(1000);
  //sine.freq(ONE);
  
  for (int i = 0; i < data.length; i++) {
    String bstring = binary(data[i]);
    //println(bstring);
    //sine.freq(START);
    //delay(INTERVAL);
    for (int j=0; j<8; j++) {
      //println(bstring.charAt(j));
      if (bstring.charAt(j) == '1') {
        print('1');
        sine.freq(ONE);
        //sine.play();
      } else {
        sine.freq(ZERO);
        print('0');
      }
      delay(INTERVAL);
    }
    //sine.freq(START);
    //delay(INTERVAL);
  }
  println("DONE");
  delay(3000);
  
  while (true) {
    delay(1000);
  }
}
