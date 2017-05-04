int score = 0;
float x, y, speedX, speedY;
float diam = 30;
float rectSize = 200;
final int WAIT_TIME = (int) (15 * 1000); // 3.5 seconds
int startTime;
int s = second();

void setup() {
  fullScreen();
  fill(255, 0, 0);
  reset();
}

void reset() {
  x = width/3;
  y = height/3;
  speedX = random(7.5, 25);
  speedY = random(7.5, 25);
  s=15;
  s--;
}

void draw() { 
 background(0, 255, 255);
 
 s=15-second();
 if(s<.00000001) {
   speedX = 0;
   speedY=0;
   score = 0;
    fill(0);
    textSize (32);
    textAlign(width/2, CENTER);
    text ("Game Over", 650, 425);
    text ("Click to Restart", 620, 475);
    s=0;
   reset(); }
 if(x<50) {
   s=15; 
   }
   
 fill(0);
 textSize(30);
 text(":"+s, (width/2)-50, 150);
 
 
   
   

  
  fill(0);
  textAlign(TOP, CENTER);
  textSize(32);
  text( "Score: "+score, 35, 20);
 
  fill(0, 255, 0);
  ellipse(x, y, diam, diam);

  rect(0, 0, 20, height);
  rect(width-30, mouseY-rectSize/2, 10, rectSize);

  x += speedX;
  y += speedY;

  // if ball hits movable bar, invert X direction
  if ( x > width-50 && y < width -5 && y > mouseY-rectSize/2 && y < mouseY+rectSize/2 ) {
    speedX = speedX * -1 + 1;
  } 
  if ( x > width+250 ) {
    speedX=0;
    speedY=0;
    score = 0;
   
    fill(0);
    textSize (32);
    textAlign(width/2, CENTER);
    text ("Game Over", 650, 425);
    text ("Click to Restart", 620, 475);
  }

  // if ball hits wall, change direction of X
  if (x < 25) {
    speedX *= -1;
    speedY *= 1.25;
    x += speedX;
    score ++;
  }


  // if ball hits up or down, change direction of Y   
  if ( y > height || y < 0 ) {
    speedY *= -1;
  }
}

  void mousePressed() {
    
  reset();
  x = width/3;
  y = height/3;
  speedX = random(7.5, 25);
  speedY = random(7.5, 25);

}