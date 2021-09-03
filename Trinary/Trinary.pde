int boxSize=50;

String[][] TRYTES = {{"w", "w", "r", "w", "b", "b", "b", "r", "r"}, 
  {"w", "w", "r", "w", "b", "b", "r", "r", "b"}, 
  {"w", "w", "r", "b", "r", "r", "w", "b", "b"}, 
  {"w", "w", "r", "b", "r", "r", "b", "b", "w"}, 
  {"w", "w", "r", "b", "b", "w", "b", "r", "r"}, 
  {"w", "w", "r", "b", "b", "w", "r", "r", "b"}, 
  {"w", "w", "r", "r", "r", "b", "w", "b", "b"}, 
  {"w", "w", "r", "r", "r", "b", "b", "b", "w"}, 
  {"b", "w", "w", "w", "r", "r", "b", "b", "r"}, 
  {"b", "w", "w", "w", "r", "r", "r", "b", "b"}, 
  {"b", "w", "w", "b", "b", "r", "w", "r", "r"}, 
  {"b", "w", "w", "b", "b", "r", "r", "r", "w"}, 
  {"b", "w", "w", "r", "b", "b", "w", "r", "r"}, 
  {"b", "w", "w", "r", "b", "b", "r", "r", "w"}, 
  {"b", "w", "w", "r", "r", "w", "b", "b", "r"}, 
  {"b", "w", "w", "r", "r", "w", "r", "b", "b"}, 
  {"b", "r", "r", "w", "b", "b", "w", "w", "r"}, 
  {"b", "r", "r", "w", "b", "b", "r", "w", "w"}, 
  {"b", "r", "r", "w", "w", "r", "w", "b", "b"}, 
  {"b", "r", "r", "w", "w", "r", "b", "b", "w"}, 
  {"b", "r", "r", "b", "b", "w", "w", "w", "r"}, 
  {"b", "r", "r", "b", "b", "w", "r", "w", "w"}, 
  {"b", "r", "r", "r", "w", "w", "w", "b", "b"}, 
  {"b", "r", "r", "r", "w", "w", "b", "b", "w"}, 
  {"b", "b", "w", "w", "w", "r", "b", "r", "r"}, 
  {"b", "b", "w", "w", "w", "r", "r", "r", "b"}, 
  {"b", "b", "w", "b", "r", "r", "w", "w", "r"}, 
  {"b", "b", "w", "b", "r", "r", "r", "w", "w"}, 
  {"b", "b", "w", "r", "w", "w", "b", "r", "r"}, 
  {"b", "b", "w", "r", "w", "w", "r", "r", "b"}, 
  {"b", "b", "w", "r", "r", "b", "w", "w", "r"}, 
  {"b", "b", "w", "r", "r", "b", "r", "w", "w"}, 
  {"b", "b", "r", "w", "r", "r", "w", "w", "b"}, 
  {"b", "b", "r", "w", "r", "r", "b", "w", "w"}, 
  {"b", "b", "r", "w", "w", "b", "w", "r", "r"}, 
  {"b", "b", "r", "w", "w", "b", "r", "r", "w"}, 
  {"b", "b", "r", "b", "w", "w", "w", "r", "r"}, 
  {"b", "b", "r", "b", "w", "w", "r", "r", "w"}, 
  {"b", "b", "r", "r", "r", "w", "w", "w", "b"}, 
  {"b", "b", "r", "r", "r", "w", "b", "w", "w"}, 
  {"r", "w", "w", "w", "b", "b", "b", "r", "r"}, 
  {"r", "w", "w", "w", "b", "b", "r", "r", "b"}, 
  {"r", "w", "w", "b", "r", "r", "w", "b", "b"}, 
  {"r", "w", "w", "b", "r", "r", "b", "b", "w"}, 
  {"r", "w", "w", "b", "b", "w", "b", "r", "r"}, 
  {"r", "w", "w", "b", "b", "w", "r", "r", "b"}, 
  {"r", "w", "w", "r", "r", "b", "w", "b", "b"}, 
  {"r", "w", "w", "r", "r", "b", "b", "b", "w"}, 
  {"r", "b", "b", "w", "r", "r", "w", "w", "b"}, 
  {"r", "b", "b", "w", "r", "r", "b", "w", "w"}, 
  {"r", "b", "b", "w", "w", "b", "w", "r", "r"}, 
  {"r", "b", "b", "w", "w", "b", "r", "r", "w"}, 
  {"r", "b", "b", "b", "w", "w", "w", "r", "r"}, 
  {"r", "b", "b", "b", "w", "w", "r", "r", "w"}, 
  {"r", "b", "b", "r", "r", "w", "w", "w", "b"}, 
  {"r", "b", "b", "r", "r", "w", "b", "w", "w"}, 
  {"r", "r", "w", "w", "w", "b", "b", "b", "r"}, 
  {"r", "r", "w", "w", "w", "b", "r", "b", "b"}, 
  {"r", "r", "w", "b", "w", "w", "b", "b", "r"}, 
  {"r", "r", "w", "b", "w", "w", "r", "b", "b"}, 
  {"r", "r", "w", "b", "b", "r", "w", "w", "b"}, 
  {"r", "r", "w", "b", "b", "r", "b", "w", "w"}, 
  {"r", "r", "w", "r", "b", "b", "w", "w", "b"}, 
  {"r", "r", "w", "r", "b", "b", "b", "w", "w"}, 
  {"r", "r", "b", "w", "b", "b", "w", "w", "r"}, 
  {"r", "r", "b", "w", "b", "b", "r", "w", "w"}, 
  {"r", "r", "b", "w", "w", "r", "w", "b", "b"}, 
  {"r", "r", "b", "w", "w", "r", "b", "b", "w"}, 
  {"r", "r", "b", "b", "b", "w", "w", "w", "r"}, 
  {"r", "r", "b", "b", "b", "w", "r", "w", "w"}, 
  {"r", "r", "b", "r", "w", "w", "w", "b", "b"}, 
  {"r", "r", "b", "r", "w", "w", "b", "b", "w"}};

int start = int(random(0,TRYTES.length));
void setup() {
  size(600, 600);
  println(TRYTES[start][0],TRYTES[start][1],TRYTES[start][2],TRYTES[start][3],TRYTES[start][4],TRYTES[start][5],TRYTES[start][6],TRYTES[start][7],TRYTES[start][8]);
  println(start);
}

void draw() {

  color fill;
  background(100, 100, 100);
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      
      if (TRYTES[start][i*3+j]=="r") {
        fill = color(230, 10, 10);
      } else if (TRYTES[start][i*3+j]=="w") {
        fill = color(230, 230, 230);
      } else {
        fill = color(10, 10, 10);
      } 
      fill(fill);
      rect(boxSize*j, boxSize*i, boxSize, boxSize);
    }
  }
  //start = int(random(0,TRYTES.length));
}

void mousePressed(){
  start = int(random(0,TRYTES.length));
  println(TRYTES[start][0],TRYTES[start][1],TRYTES[start][2],TRYTES[start][3],TRYTES[start][4],TRYTES[start][5],TRYTES[start][6],TRYTES[start][7],TRYTES[start][8]);
  

}