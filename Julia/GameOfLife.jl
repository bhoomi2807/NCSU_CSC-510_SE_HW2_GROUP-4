function createBoard(size, num_alive_cells)
  grid = falses(size, size)
  foreach(i -> grid[i] = true, rand(1 : size * size, num_alive_cells))
  grid
end

"Calculate the number of neighbors of a cell."
function getNeighborCount(grid, row, col)
  (grid_size, _) = size(grid)

  getmin(x) = x > 1 ? x - 1 : 1
  getmax(x) = x < grid_size ? x + 1 : grid_size

  c = count(grid[getmin(row):getmax(row), getmin(col):getmax(col)])
  if grid[row, col]
    c - 1
  else
    c
  end
end

"Return a boolean value indicating if given cell will be alive."
function isAlive(grid, row, col)
  nc = getNeighborCount(grid, row, col)

  nc == 3 || (grid[row, col] && (nc == 2 || nc == 3))
end

function getNextState(grid)
  (grid_size, _) = size(grid)
  [isAlive(grid, row, col) for row in 1 : grid_size, col in 1 : grid_size]
end


function main()
  length(ARGS) < 2 && error("No enough arguments!")
  grid_size = parse(Int, ARGS[1])
  num_alive_cells = parse(Int, ARGS[2])
  println(grid_size)
  println(num_alive_cells)
  generation = 1
  

  grid = createBoard(grid_size, num_alive_cells)
  for row in 1 : grid_size, col in 1 : grid_size
    print(grid[row, col] ? "1 " : "0 ")
    if col == grid_size
      println("")
    end
  end
  gen = 0
  while gen < generation
    grid = getNextState(grid)
    gen += 1
  end
  
  print("After all generations")
  println(" ")
  for row in 1 : grid_size, col in 1 : grid_size
    print(grid[row, col] ? "1 " : "0 ")
    if col == grid_size
      println("")
    end
  end
  
end

main()
