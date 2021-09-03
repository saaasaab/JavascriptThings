int carWidth = 75;
int carHeight=125;
int xBetweenCars=800;

float startingX;
float randomX=0;
float numCollisions = 0;
float numRuns = 0; 
boolean checkBuffer;
float averageBuffer = 0;
float laneSpace = carWidth/6;
//float randomX=0;
Car[] cs = new Car[3];


float Va=4;
float Vb=3;
float Vc=3;
PImage bg;
void setup() {
  size(960, 540);
  checkBuffer = false;
  frameRate(5);
  //startingX=(width/2+carWidth);  
  startingX=width/2;  

  bg = loadImage("background.png");
  randomX+=1;
  //if (randomX>xBetweenCars+carHeight-1) {
  //  noLoop();
  //} 

  //cs[0]  = new Car(width/2, height/2+carWidth, 0, Va, carWidth, carHeight, 0);

  //cs[1]  = new Car(startingX+ randomX, height/2, Vb, 0, carHeight, carWidth, 1);
  //cs[2]  = new Car(startingX-(xBetweenCars+carHeight) + randomX, height/2, Vb, 0, carHeight, carWidth, 2);

  //cs[3]  = new Car(startingX+ randomX, height/2-carWidth-laneSpace, -Vc, 0, carHeight, carWidth, 2);
  //cs[4]  = new Car(startingX-(xBetweenCars+carHeight) + randomX, height/2-carWidth, -Vc, 0, carHeight, carWidth, 2);   


  cs[0]  = new Car(startingX, height/2+2*carWidth, 0, Va, carWidth, carHeight, 0);

  randomX = random(00, 300);
  xBetweenCars=int(random(0, 800));
  cs[1]  = new Car(randomX, height/2, Vb, 0, carHeight, carWidth, 1);
  randomX = random(00, 100);
  cs[2]  = new Car(width-randomX, height/2-carWidth-laneSpace, -Vc, 0, carHeight, carWidth, 2);
}

void draw() {
  background(bg);
  for (Car c : cs) {
    c.update();
  }
  boolean collision = false;

  if (cs[0].xpos<=cs[1].xpos  + carHeight - 10 && cs[0].ypos + carHeight >= cs[1].ypos) {
    collision = true;
  } else if (
    (cs[0].xpos+carWidth>=cs[2].xpos+10) && 
    ((cs[0].ypos + carHeight  >= cs[2].ypos) && (cs[0].ypos <= cs[2].ypos + carWidth))) {
    collision = true;
  }

  if (collision) {
    numCollisions++;
    numRuns++;
    if (numRuns!=0) {
      print("Probability: ");
      println(1-numCollisions/numRuns);
    }
    setup();
  }
}