#This is Ruby File 
def life(name, size, generation, initial = nil)
  board = newBoard size
  randomSeed board, size, initial
  printBoard board, name, 0
  reason = generation.times do |g|
    new = nextGeneration board, size
    printBoard new, name, g+1
    break :all_dead if emptyOrNot new, size
    break :static if board == new
    board = new
  end

  if    reason == :all_dead then puts "Life ended."
  elsif reason == :static   then puts "Static, no movement."
  else                           puts "Lifetime ended."
  end
  puts
end

def newBoard(size)
  Array.new(size) {Array.new(size, 0)}
end

def randomSeed(board, size, points=nil)
  if points.nil?
    indices = []
    size.times{ |x| size.times {|y| indices << [x,y]}}
    indices.shuffle[0,10].each {|x,y| board[y][x] = 1}
  else
    points.each{|x, y| board[y][x]=1}
  end
end

def nextGeneration(board, size)
  new = newBoard size
  size.times {|i| size.times {|j| new[i][j] = fate board, i, j, size}}
  new
end

def fate(board, i, j, n)
  i1 = [0, i-1].max
  i2 = [i+1, n-1].min
  j1 = [0, j-1].max
  j2 = [j+1, n-1].min
  sum = 0

  for ii in (i1..i2)
    for jj in (j1..j2)
      sum += board[ii][jj] if not (ii==i and jj==j)
    end
  end
  (sum==3 or (sum==2 and board[i][j]==1))?1:0
end

def emptyOrNot(board, size)
  size.times {|i| size.times {|j| return false if board[i][j]==1}}
  true
end

def printBoard(m, name, generation)
  print "\r" + ("\e[A\e[K"*6)
  print "#{name}, Generation #{generation}\n"
  m.each {|row| row.each {|val| print "#{val == 1 ? 'o' : '.'} "}; print "\n"}
  $stdout.flush
  sleep 1
end

life "random", 5, 10