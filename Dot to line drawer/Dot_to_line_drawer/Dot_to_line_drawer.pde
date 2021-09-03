PImage img, grey;
int h, w;
PVector points[];

void setup() {
  size(583, 732);
  img = loadImage("coco.jpg");
  background(255);
  img.loadPixels();
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      int gVal = (int)(r+g+b)/3;
      float rand = random(0, 1);
      float prob = map(gVal, 0, 255, .02, 0);

      if (prob > rand) {
        points = append(points,{x,y});
        ellipse(x, y, 1, 1);
      }
    }
  }
  //img.filter(GRAY);

  //image(img, 0, 0, width, height); // fills the screen with the picture
}


void draw() {
  
  

  img.updatePixels();

  //image(img, 0, 0, width, height);
}