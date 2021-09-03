
PImage myImage;

int boxSize = 10;
int[][] averages;

int average = 0;
int a,r,g,b;
void setup(){
  size(500,500);
  averages = new int[height/boxSize][width/boxSize];
  myImage = loadImage("morgan.png");
  //print(height/boxSize," ",width/boxSize);

  myImage.filter(GRAY);
  myImage.resize(width-50,height-50);
  imageMode(CENTER);
}  

void draw(){
  //println(averages.length);
  image(myImage, width/2, height/2);
  
  
  
  //color c = get(mouseX,mouseY);
  //color argb = color(c);
  //a = (argb >> 24) & 0xFF;
  //r = (argb >> 16) & 0xFF;  // Faster way of getting red(argb)
  //g = (argb >> 8) & 0xFF;   // Faster way of getting green(argb)
  //b = argb & 0xFF;          // Faster way of getting blue(argb)
  
  for (int w = 0; w < width/boxSize; w++){
    for (int x = 0; x < height/boxSize; x++){
      for (int y = 0; y < boxSize; y++){
        for (int z = 0; z < boxSize; z++){
          
          color c = get(y+x*boxSize,z+w*boxSize);
          color argb = color(c);
          a = (argb >> 24) & 0xFF;
          r = (argb >> 16) & 0xFF;  // Faster way of getting red(argb)
          g = (argb >> 8) & 0xFF;   // Faster way of getting green(argb)
          b = argb & 0xFF;          // Faster way of getting blue(argb)
          
          average = average + int(r);
          
        }
      }
      //println(width/boxSize, height/boxSize);
      averages[x][w]= average/(boxSize*boxSize);
      average=0;
    }     
  }
  
  //print(averages.length, " ", averages[0].length);
  for (int i = 0; i < averages.length ; i++){
    for (int j = 0; j < averages[i].length ; j++){
      println(i, " ", j);
      fill(averages[i][j]);
      rect(i*boxSize,j*boxSize,boxSize,boxSize);
      
     // print(averages[j][i]," ");
    }
    //println();
  }
   
  noLoop();
  
  
}