PImage img = createImage(1280, 720, RGB);
Button color_button, set_color_button, opacity_button, set_opacity_button, text_button, set_text_button, save_button;  // the button
color rectangleFill;
HScrollbar hs1, hs2, hs3, hs4;
String myText = " ";
int opacity = 255;
boolean selecting = true;
boolean first_time = true;
boolean colorSelection = false;
boolean opacitySelection = false;
boolean selectOpacity = false;
boolean text_create = false;
boolean type_text = false;
boolean save_picture = false;
boolean saved = false;
PFont font;

void setup() {
  //textAlign(CENTER, CENTER);

  //textSize(30);

  font = createFont("LucidaBright-40", 32) ;
  font = createFont("Sylfaen", 32) ;
  textFont(font);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  rectangleFill = color(180, 100, 100);
  hs1 = new HScrollbar(0, height-64, width, 16, 16, 0);
  hs2 = new HScrollbar(0, height-20, width, 16, 16, 1);
  hs3 = new HScrollbar(0, height-64, width, 16, 16, 2);
  hs4 = new HScrollbar(0, height-20, width, 16, 16, 3);
  selectInput("Select a file to process:", "fileSelected");
  size(1280, 720);
  image(img, 0, 0);


  color_button = new Button("Select the Color", 20, height-130, 100, 50);
  set_color_button = new Button("Set the Color", 20, height-180, 100, 50);
  opacity_button = new Button("Select Opacity", 120, height-130, 100, 50);
  set_opacity_button = new Button("Set Opacity", 120, height-180, 100, 50);
  text_button = new Button("Select the Text", 220, height-130, 100, 50);
  set_text_button = new Button("Set the Text", 220, height-180, 100, 50);
  save_button = new Button("SAVE", 320, height-130, 100, 50);
}

void draw() {
  int[] textPos = {0, height/15, width, height};
  background(0);
  if (!selecting) {
    if (!saved) {
      noStroke();
      colorMode(HSB, 360, 100, 100);
      if (first_time && !colorSelection) image(img, 0, 0);
      else if (!first_time && !saved) {
        fill(rectangleFill, opacity);
        image(img, 0, 0);
        rect(0, 0, width, height/3);
      }


      if (!colorSelection) {
        color_button.Draw();
      }


      if (colorSelection) {
        hs1.update();
        hs1.display();

        hs2.update();
        hs2.display();

        //hs4.update();
        //hs4.display();

        set_color_button.Draw();
      }

      if (opacitySelection) {
        opacity_button.Draw();
      }

      if (selectOpacity) {
        hs3.update();
        hs3.display();
        opacity = int(map(hs3.spos, 0, width, 10, 255));
        set_opacity_button.Draw();
      }

      if (text_create) {
        text_button.Draw();
      }


      if (type_text) {
        set_text_button.Draw();
        if (myText.length() > 0) {

          fill(0, 0, 100);
          textAlign(CENTER);
          textSize(130);

          text(myText, textPos[0], textPos[1], textPos[2], textPos[3]);
          textSize(12);
        }
      }


      if (save_picture) {
        save_button.Draw();
      }

      if (!type_text) {
        fill(0, 0, 100);
        textSize(130);
        textAlign(CENTER);
        text(myText, textPos[0], textPos[1], textPos[2], textPos[3]);
        textSize(12);
      }
    } else if (saved) {

      background(0);
      noStroke();
      fill(rectangleFill, opacity);
      image(img, 0, 0);
      rect(0, 0, width, height/3);

      fill(0, 0, 100);
      textSize(130);
      textAlign(CENTER);
      text(myText, textPos[0], textPos[1], textPos[2], textPos[3]);


      save(myText + ".jpeg");
      println("Saved");
      exit();
    }

    rectangleFill = hs1.centerColor;
  }
}

void mousePressed() {
  if (color_button.MouseIsOver()) {
    colorSelection=true;
    first_time = false;
  }
  if (set_color_button.MouseIsOver()) {
    colorSelection=false;
    opacitySelection = true;
  }

  if (opacity_button.MouseIsOver()) {
    opacitySelection = false;
    selectOpacity = true;
  }
  if (set_opacity_button.MouseIsOver()) {
    selectOpacity = false;
    opacitySelection = true;
    text_create = true;
  }

  if (text_button.MouseIsOver()) {
    text_create = false;
    type_text = true;
    myText = "Video Name";
  }
  if (set_text_button.MouseIsOver()) {
    type_text = false;
    text_create = true;
    save_picture = true;
  }

  if (save_button.MouseIsOver()) {
    saved = true;
  }
}

void keyPressed() {
  if (type_text) {
    if (keyCode == BACKSPACE) {
      if (myText.length() > 0) {
        myText = myText.substring(0, myText.length()-1);
      }
    } else if (keyCode == DELETE) {
      myText = "";
    } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
      myText = myText + key;
    } 
    if (keyCode==ENTER)
      key = 54;
  }
}




void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    img =  loadImage(selection.getAbsolutePath());
    img.resize(width, height);
    selecting = false;
  }
}

class Button {
  String label; // button label
  float x;      // top left corner x position
  float y;      // top left corner y position
  float w;      // width of button
  float h;      // height of button

  // constructor
  Button(String labelB, float xpos, float ypos, float widthB, float heightB) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
  }

  void Draw() {
    fill(218);
    stroke(141);
    rect(x, y, w, h, 10);
    textAlign(CENTER, CENTER);
    fill(0);
    text(label, x + (w / 2), y + (h / 2));
  }

  boolean MouseIsOver() {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      return true;
    }
    return false;
  }
}






class HScrollbar {
  float numRectangles = 600;
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;
  color centerColor;
  int barCase;
  float colorFromSlider;
  float brightnessFromSlider;
  float saturationFromSlider;

  HScrollbar (float xp, float yp, int sw, int sh, int l, int bc) {
    swidth = sw;
    sheight = sh;
    barCase = bc;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
      mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    colorFromSlider = map(spos, 0, swidth, 0, 360);
    brightnessFromSlider = map(hs2.spos, hs2.sposMin, hs2.sposMax, 0, 100);
    saturationFromSlider = map(hs2.spos, hs2.sposMin, hs2.sposMax, 100, 0);
    float x = xpos;
    float y = ypos;
    float dx = swidth/numRectangles;
    if (barCase == 0) {
      for (float i = 0; i < numRectangles; i++) {
        fill(i*360.0/numRectangles, 100, brightnessFromSlider);
        rect(x, y, float(swidth)/numRectangles, sheight);
        x += dx;
      }
      centerColor = color(colorFromSlider, 100, brightnessFromSlider);
      fill(centerColor);
    } else if (barCase == 1) {
      for (float i = 0; i < numRectangles; i++) {
        fill(hs1.colorFromSlider, 100, i*100/numRectangles);
        println(i*100/numRectangles);
        rect(x, y, float(swidth)/numRectangles, sheight);
        x += dx;
      }
      println(spos*100/numRectangles);
      fill(hs1.centerColor);
    } 
    
    else if (barCase == 2) { 
      fill(hs1.colorFromSlider,100,hs2.brightnessFromSlider);
      rect(xpos,ypos,swidth,sheight);
    }


    if (over || locked) {
      fill(0, 0, 0);
    } else {
      fill(0, 0, 0);
    }

    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
}