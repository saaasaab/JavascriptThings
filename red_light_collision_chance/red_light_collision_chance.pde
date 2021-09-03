
float startingX;
float randomX=-1;
float numCollisions = 0;
float numRuns = 0; 
boolean checkBuffer;
float averageBuffer = 0;
//float randomX=0;
Car[] cs = new Car[3];


int carWidth = 75;
int carHeight=125;
int xBetweenCars=250;
float Va=8;
float Vb=1;

void setup() {
  size(1000, 400);
  checkBuffer = false;
  frameRate(8000);
  startingX=(width/2+carWidth);  
//  randomX=random(0,xBetweenCars+carHeight-1);
  randomX+=1;
  if(randomX>xBetweenCars+carHeight-1){
    noLoop();}
  //randomX=random(46,47);
  cs[0]  = new Car(width/2, height/2+carWidth, 0, Va, carWidth, carHeight, 0);
  cs[1]  = new Car(startingX+ randomX, height/2, Vb, 0, carHeight, carWidth, 1);
  cs[2]  = new Car(startingX-(xBetweenCars+carHeight) + randomX, height/2, Vb, 0, carHeight, carWidth, 2);
  //print("Buffer: ");
  //println(averageBuffer/(numRuns-numCollisions));
  if (numRuns!=0) {
    print("Probability: ");
    println(1-numCollisions/numRuns);
  }
}

void draw() {
  background(120);
  for (Car c : cs) {
    c.update();
  }

  //print(cs[0].ypos + cs[0].carHeight);
  //print(" ");
  //println(cs[2].ypos);
  if ((cs[0].xpos<=cs[2].xpos + carHeight && cs[0].ypos + carHeight >= cs[2].ypos)) {
    //(cs[0].xpos<cs[2].xpos && cs[0].xpos > cs[2].xpos - carHeight)) {
    numCollisions++;
    numRuns++;
    setup();
  } 
}