//This is Scala file
object MyClass {
  def gameOfLife(board: Array[Array[Int]], gen: Int): Unit = {
    var neighbors = Array.ofDim[Int](8, 2)
    //x and y directions to explore neighbors
    var x_n = Array(1, 1, 0, -1, -1, -1, 0, 0)
    var y_n = Array(0, -1, -1, -1, 0, 1, 1, 0)

    val rows = board.size;
    val cols = board(0).size;

    //running for "gen" generations
    for (g <- 0 until gen) {
      for (row <- 0 until rows) {
        for (col <- 0 until cols) {
          var live_n = 0
          //looking at eight neighbors of cell and updating value of live neighbors
          for (n <- 0 until 8) {
            val r = row + x_n(n);
            val c = col + y_n(n);

            if ((r < rows && r >= 0) && (c < cols && c >= 0) && (board(r)(c).abs == 1)) {
              live_n += 1

            }
          }
          if ((board(row)(col) == 1) && (live_n < 2 || live_n > 3)) {
            board(row)(col) = -1
          }

          if ((board(row)(col) == 0) && (live_n == 3)) {
            board(row)(col) = 2
          }

        }
      }
      //updating board with new cell values
      for (row <- 0 until rows) {
        for (col <- 0 until cols) {
          if (board(row)(col) > 0) {
            board(row)(col) = 1
          } else {
            board(row)(col) = 0
          }
        }
      }
    }
    for (row <- 0 until rows) {
      for (col <- 0 until cols) {
        print(board(row)(col));
      }
      println();
    }
  }

  def main(args: Array[String]) {
    var dim = args(0).toInt;
    var gen = args(1).toInt;

    //var board = Array(Array(0,1,0),Array(0,0,1),Array(1,1,1),Array(0,0,0));
    var board = Array.ofDim[Int](dim, dim);
    for (row <- 0 until dim) {
      board(row) = Array.fill(dim) { scala.util.Random.nextInt(2) };
    }

    println("Initial Board");
    for (row <- 0 until dim) {
      for (col <- 0 until dim) {
        print(board(row)(col));
      }
      println();
    }
    println("After generations: " + gen);
    gameOfLife(board, gen);
  }
}
