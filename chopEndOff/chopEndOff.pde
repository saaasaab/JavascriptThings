void setup() {
  size(500, 500);
  noLoop();
}
void draw() {

  int[][] a = {{1, 3, 2}, {3, 2, 7}, {5, 3, 5}, {1, 2, 3}, {3, 2, 5}};

  int[][] scape = a;
  a = new int[a.length-1][];
  for (int i = 0; i< a.length; i++) {
    a[i] = scape[i] ;
  }


  for (int i = 0; i < a.length; i++) {
    for (int j = 0; j < a[0].length; j++) {
      print(a[i][j]);
    }
    println();
  }
}