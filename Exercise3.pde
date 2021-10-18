PImage back, road;
PVector b1, r1;
int cx, cy;
int savedTime;
float second;
float minute;
float hour;
float clock;
int totalTime = 60000;

void setup() {
  
  size(920, 675);
  background(255);
  int radius = min(width, height) / 2;
  back = loadImage("clock.png");
  second = radius * 0.72;
  minute = radius * 0.42;
  hour = radius * 0.30;
  b1 = new PVector(-1, -1);
  r1 = new PVector (-1, -1);
  
  cx = width / 2;
  cy = height / 2;
  
}

void draw() {
  
  ellipse(cx, cy, clock, clock);
  image(back,b1.x, b1.y);
  
  
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  float R = random(255);
  float G = random (255);
  float B = random (255);
  
  //fill(255, 150, 0);
  stroke(255, 150, 0);
  strokeWeight(2);
  line(cx, cy, cx + cos(s) * second, cy + sin(s) * second);
  strokeWeight(3);
  line(cx, cy, cx + cos(m) * minute, cy + sin(m) * minute);
  strokeWeight(5);
  line(cx, cy, cx + cos(h) * hour, cy + sin(h) * hour);
  
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * second;
    float y = cy + sin(angle) * second;
    vertex(x, y); 
    
    int passedTime = millis() - savedTime;
    
    if(passedTime > totalTime)
    {
     println("ChangeColor") ;
     background(R, G, B);
     savedTime = millis();
    }
  }
  endShape();
}
