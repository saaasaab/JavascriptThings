class Car { 
  float xpos, ypos, speedx, speedy, carWidth, carHeight, index; 
  Car (float x, float y, float vx, float vy, float w, float h, float i) {  
    xpos = x;
    ypos = y; 
    speedx = vx;
    speedy = vy;
    carWidth = w;
    carHeight = h;
  } 
  void update() { 


    ypos -= speedy; 
    xpos += speedx; 
    if (ypos < 0) { 
      ypos = height; 
      numRuns++;
      setup();
    } 
    //if (xpos > width) { 
    //  xpos = 0; 
    //} 
    rect(xpos, ypos, carWidth, carHeight);
  } 

  void checkCollision() {
  }
} 