
float triAngle = 60*PI/180;
float lengthOfRope=1000;
float B, b;  //B is height, b is base
float baseAngle, changingAngle;
float lengthCalc, bCalc, hCalc, xCalc;
float startX, startY;
float sum=0;
float MaxLength = 1000;

void setup() {
  size(900, 600);
  frameRate(10);
}

void draw() {
  b=map(mouseX, 0, .5*width, 0, width);
  B=map(mouseY, 0, height, height, 0);

  bCalc = b;
  background(255);
  translate(0, height);
  strokeWeight(3);
  stroke(0, 0, 0);
  line(0, 0, b, 0);
  line(b/2, -B, b, 0);
  line(0, 0, b/2, -B);
  stroke(255, 0, 0);

  baseAngle=atan2(B, b/2);
  changingAngle =PI/20;
  startX=0;
  startY=0;
  sum=0;
  //for (changingAngle=baseAngle; changingAngle>0; changingAngle=changingAngle-.01) {
  for (int i = 0; i<100; i++) {
    lengthCalc=bCalc*sin(baseAngle)/sin(PI-baseAngle-changingAngle);
    hCalc=sin(changingAngle)*lengthCalc;
    xCalc=cos(changingAngle)*lengthCalc;

    if (i%2==0) {
      line(startX, -startY, startX+xCalc, -(startY+hCalc));
      startX = startX + xCalc; 
      startY = startY + hCalc;
    } else {
      line(startX, -startY, startX-xCalc, -(startY+hCalc));
      startX = startX - xCalc; 
      startY = startY + hCalc;
    }
    bCalc = bCalc - 2*(bCalc - xCalc);
    if (sum > MaxLength){break;}
     println(sum);
    sum=sum+lengthCalc;
    
  }

 
}