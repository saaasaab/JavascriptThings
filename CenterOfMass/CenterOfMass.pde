float[] x = new float[2];
float[] y = new float[2];
float segLength = 50;

void setup() {
  size(640, 360);
  strokeWeight(20.0);
  stroke(255, 100);
}


void draw() {
  background(0);

}




class segment{
  float X,Y,A;
  segment(float x, float y, float a){
    X=x; Y=y; A=a;
    pushMatrix();
    translate(x, y);
    rotate(a);
    line(0, 0, segLength, 0);
    popMatrix();
  }
 
  void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  X = xin - cos(angle) * segLength;
  Y = yin - sin(angle) * segLength;
  }
}