int col = 15;
int row = 15;
float square;

int colorX, colorY;

color overColor;
color[][] clickedColor = new color[col][row];
int[][] closed  = new int[col][row];
int[][] action  = new int[col][row];
int[][] grid = new int[col][row];
char[] delta_name = {'^', '<', 'v', '>'};

boolean rectOver = false;
boolean circleOver = false;
char[][] policy  = new char[col][row];

int[] init = {0, 0};
int[] goal = {col-1, row-1};
int cost = 1;

int[][] delta = 
  {{-1, 0 }, // # go up
  { 0, -1}, //# go left
  { 1, 0 }, //# go down
  { 0, 1 }}; //# go right

void setup() {
  size(600, 600);
  square = width/col;
  for (int i = 0; i < col; i++) {
    for (int j = 0; j < row; j++) {
      clickedColor[i][j] = color(55);
      grid[i][j] = 0;
    }
  }
}

void draw() {
  background(255);
  drawGrid();
  search(grid, init, goal, cost);
}


void drawGrid() {
  for (int i = 0; i < col; i++) {
    for (int j = 0; j < row; j++) {
      if (overRect(i*square, j*square, square, square)) {
        rectOver = true;
        overColor= color(105);
        colorX = i;
        colorY = j;
      } else {
        rectOver = false;
        overColor= clickedColor[i][j];
      }
      for (int k = 0; k < delta_name.length; k++) {
        if (policy[j][i] == delta_name[k] || policy[j][i] == '*') {
          overColor = color(245, 65, 40);
        }
      }
      fill(overColor);
      rect(i*square, j*square, square, square);
    }
  }
}

boolean overRect(float x, float y, float width, float height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

void mousePressed() {

  if (grid[colorY][colorX]==1) {
    grid[colorY][colorX]=0;
    clickedColor[colorX][colorY] = color(55);
  } else {
    clickedColor[colorX][colorY] = color(155);
    grid[colorY][colorX]=1;
  }
}





void search(int[][] grid, int[] init, int[] goal, int cost) {

  for (int i = 0; i < col; i++) {
    for (int j = 0; j < row; j++) {
      closed[i][j] = 0;
      action[i][j] = 0;
    }
  }
  closed[init[0]][init[1]] = 1;

  int x = init[0];
  int y = init[1];
  int g = 0;
  int open[][] = {{g, x, y}};

  boolean found = false;   //  # flag that is set when search is complete
  boolean resign = false;  // # flag set if we can't find expand
  while (!found && !resign) {
    if (open.length == 0) {
      resign = true;
      break;
    } else {

      //SORT
      arrayBubbleSort(open);

      //REVERSE
      open = reverseArray(open);
      //POP
      int[] next = open[open.length-1];
      open = removeElement(open);


      x = next[1];
      y = next[2];
      g = next[0];

      if ( x == goal[0] && y == goal[1]) {
        found = true;
      } else {
        for (int i = 0; i < delta.length; i++) {
          int x2 = x + delta[i][0];
          int y2 = y + delta[i][1];
          if (x2 >= 0 && x2 < grid.length && y2 >=0 && y2 < grid[0].length) {
            if (closed[x2][y2] == 0 && grid[x2][y2] == 0) {
              int g2 = g + cost;
              open = (int [][])append(open, new int[]{g2, x2, y2});
              closed[x2][y2] = 1;
              action[x2][y2] = i;
            }
          }
        }
      }
    }
  }
  policy  = new char[col][row];

  for (int i = 0; i < col; i++) {
    for (int j = 0; j < row; j++) {
      policy[i][j] = ' ';
    }
  }
  x = goal[0];
  y = goal[1];
  if (!resign) {
    policy[x][y] = '*';

    while ((x != init[0] || y != init[1]) ) {
      int x2 = x - delta[action[x][y]][0];
      int y2 = y - delta[action[x][y]][1];
      policy[x2][y2] = delta_name[action[x][y]];
      x = x2;
      y = y2;
    }
  }
}
//

int[][] arrayBubbleSort(int[][] a) {

  boolean unsorted = true;
  while (unsorted) {
    int count = 0;
    for (int i = 0; i < a.length-1; i++) {
      if (a[i][0]> a[i+1][0]) {
        int[] scape = a[i];
        a[i] = a[i+1];
        a[i+1] = scape;
      } else {
        count++;
      }
    }

    if (count == a.length-1) {
      unsorted = false;
    }
  }  

  for (int k = 1; k < 3; k++) {
    unsorted = true;
    while (unsorted) {
      int count = 0;
      for (int i = 0; i < a.length-1; i++) {
        if ((a[i][k]> a[i+1][k])&&(a[i][k-1] == a[i+1][k-1])) {
          int[] scape = a[i];
          a[i] = a[i+1];
          a[i+1] = scape;
        } else {
          count++;
        }
      }

      if (count == a.length-1) {
        unsorted = false;
      }
    }
  }
  return(a);
}

int[][] removeElement(int[][] a) { //Removes the last element in the given array
  int[][] scape = a;
  a = new int[a.length-1][];
  for (int i = 0; i< a.length; i++) {
    a[i] = scape[i] ;
  }
  return(a);
}

int[][] reverseArray(int[][] a) {
  int[][] reversed = new int[a.length][a[0].length];
  for (int i= 0; i < a.length; i++) {
    int back = int(map(i, -1, a.length, a.length, -1));  //Problems may occure here
    reversed[i] = a[back];
  }
  return(reversed);
}