class Car { 
  float xpos, ypos, speedx, speedy, carWidth, carHeight, index; 
  PImage img1, img2, img3;
  Car (float x, float y, float vx, float vy, float w, float h, float i) {  
    xpos = x;
    ypos = y; 
    speedx = vx;
    speedy = vy;
    carWidth = w;
    carHeight = h;
    index = i;
    img1=loadImage("Car1.png");
    img2=loadImage("Car2.png");
    img3=loadImage("Car3.png");
  } 
  void update() { 


    ypos -= speedy; 
    xpos += speedx; 
    if (ypos < -carHeight) { 
      ypos = height; 
      numRuns++;
      setup();
    } 
    //if (xpos > width) { 
    //  xpos = 0; 
    //} 
    if (index == 0) {
      image(img3, xpos, ypos, carWidth, carHeight);
    }
    if (index == 1) {
      image(img2, xpos, ypos, carWidth, carHeight);
    }
    if (index == 2) {
      image(img1, xpos, ypos, carWidth, carHeight);
    }
  }

} 