"Function to create board by randomly choosing alive cells."
function createBoard(size, num_alive_cells)
  grid = falses(size, size)
  foreach(i -> grid[i] = true, rand(1 : size * size, num_alive_cells))
  grid
end

"Function to get the minimum row or column number while counting neighbours."
function getMin(x)
  if x > 1
    x - 1
  else
    1
  end
end

"Function to get the maximum row or column number while counting neighbours."
function getMax(grid_size, x)
  if x < grid_size
    x + 1
  else
    grid_size
  end
end


"Function to get the number of neighbors of a cell."
function getNeighborCount(grid, grid_size, row, col)
  c = count(grid[getMin(row):getMax(grid_size, row), getMin(col):getMax(grid_size, col)])
end

"Function to check if a cell will be alive in the net state or not."
function isAlive(grid, grid_size ,row, col)
  nc = getNeighborCount(grid, grid_size, row, col)

  if nc == 3 || (grid[row, col] && (nc == 2 || nc == 3))
    return true
  else
    return false
  end
end

"Driver function to get the next state of the grid"
function getNextState(grid)
  (grid_size, _) = size(grid)
  [isAlive(grid, grid_size, row, col) for row in 1 : grid_size, col in 1 : grid_size]
end

"Main function"
function main()
  "Argument handling"
  length(ARGS) < 3 && error("No enough arguments!")
  grid_size = parse(Int, ARGS[1])
  num_alive_cells = parse(Int, ARGS[2])
  generation = parse(Int, ARGS[3])
  println("Grid Size: ", grid_size)
  println("Number of cells alive: ", num_alive_cells)
  println("Number of generations: ", generation)
  println(" ")

  "Board creation"
  grid = createBoard(grid_size, num_alive_cells)
  for row in 1 : grid_size, col in 1 : grid_size
    print(grid[row, col] ? "1 " : "0 ")
    if col == grid_size
      println("")
    end
  end

  "Get final state of grid"
  gen = 0
  while gen < generation
    grid = getNextState(grid)
    gen += 1
  end
  
  println(" ")
  println("After all generations-")
  println(" ")
  for row in 1 : grid_size, col in 1 : grid_size
    print(grid[row, col] ? "1 " : "0 ")
    if col == grid_size
      println("")
    end
  end
  
end

main()
