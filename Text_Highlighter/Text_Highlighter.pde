String text = "This is the test";
float timeInterval;
float timePast;
int startA=25;
int alphaValue = startA;
int fadeIn= 4;
String[] list = split(text, ' ');
int index = 0;
void setup() {
  frameRate(25);
  size(500, 500);
  timePast = millis();
  timeInterval = 2000.0f;
  
}

void draw() {
  background(105, 100, 12); 
  //for (int i = 0; i < list.length; i++) {

  //if (millis() < timeInterval + timePast) {
  print(alphaValue);
  print(" ");
  fill(255, 255, 255, alphaValue);
  int min = 36;
  int max = 72;
  textSize(map(alphaValue,startA,255,min,max));
  textAlign(CENTER);
  text(list[index], 180, 180);
  if (alphaValue < 255) {
    alphaValue +=  fadeIn;
  } 
  
  else {
    timePast = millis();
    index++;
    alphaValue = startA;
    if(index>= list.length){
     index=0; 
    }
  }
}