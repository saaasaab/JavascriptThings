float[] x = new float[5];
float[] y = new float[5];
float segLength = 50;
float x1,x2,x3,x4,x5,x6,    y1,y2,y3,y4,y5,y6,   CMx,CMy;

void setup() {
  size(640, 360);
  strokeWeight(10.0);
  stroke(255, 100);
}

void draw() {
  x1=mouseX;y1=mouseY;
  background(0);
  dragSegment(0, mouseX, mouseY);
  dragSegment(1, x[0], y[0]);
  dragSegment(2, x[1], y[1]);
  dragSegment(3, x[2], y[2]);
  dragSegment(4, x[3], y[3]);
}

void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * segLength;
  y[i] = yin - sin(angle) * segLength;
  segment(x[i], y[i], angle);
  if     (i==0){x2=x[i];y2=y[i];}
  else if(i==1){x3=x[i];y3=y[i];}
  else if(i==2){x4=x[i];y4=y[i];}
  else if(i==3){x5=x[i];y5=y[i];}
  else         {x6=x[i];y6=y[i];}
  CMx=((x1 +(x2 - x1)/2)+(x2+(x3 - x2)/2)+(x3+(x4 - x3)/2)+(x4+(x5 - x4)/2)+(x5+(x6 - x5)/2))/5;
  CMy=((y1 +(y2 - y1)/2)+(y2+(y3 - y2)/2)+(y3+(y4 - y3)/2)+(y4+(y5 - y4)/2)+(y5+(y6 - y5)/2))/5;
  ellipse(CMx,CMy,5,5);  
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}