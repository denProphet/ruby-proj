class SudokuSolver

  def initialize(grid)
      @grid = grid
  end

# Main method
  def run ()
    if solve(@grid,0,0)
      puts 'result:'
      show(@grid)
    else
      puts 'not supported'
    end
  end

# Is whole grid is valid (could be solved)
# Invokes supplementary methods
# returns: boolean
def is_solvable?(grid,row,column,number)
return check_row(grid, row, number) == true && check_column(grid, column, number) == true && check_square(grid, row, column, number) == true
end

# Is row is valid (does not include the same number)
# returns: boolean
def check_row(grid, row, number)
    return !grid[row].include?(number)
end

# Is column is valid (does not include the same number)
# returns: boolean
def check_column(grid, column, number)
    for i in 0...grid.length
        return false if grid[i][column] == number
    end
    return true
end

# Is square is valid (does not include the same number)
# returns: boolean
def check_square(grid, row, column, number)
    bottom = 3 * (row / 3)
    upper = bottom + 3
    left = 3 * (column / 3)
    right = left + 3

    for i in bottom...upper
        for j in left...right
            return false if grid[i][j] == number
        end
    end
    return true
end

# Prints matrix with borders
# returns: void
def show(grid)
  length = grid.length
  width = grid[0].length

res = ".............................\n"

  for i in (0..length-1)
    if (i == 3) or (i == 6)
      res += ".............................\n"
    end

    for j in (0..width-1)
      if grid[i][j] == 0
        res += " ? "
      else
        res += " " +grid[i][j].to_s+ " "
      end
      if (j == 2) or (j == 5)
        res += ":"
      end
    end
    res += "\n"
  end
  print res += "............................."
end

# Solving algorithm
# recursed method
# returns: boolean
def solve(grid,row,column)
  # end of the recursion
  if (row == 8) and (column == 9)
    return true
  end
  # go to next row
  if (column == 9)
    row += 1
    column = 0 # drop
  end
  # if not null (has value) go to next value (recursion)
  if (grid[row][column] > 0)
    return solve(grid,row,column+1)
  end

  (1..9).each do|i| # brute force
    if is_solvable?(grid,row,column,i) # if this number fits
      grid[row][column] = i # insert this number
      if solve(grid,row,column+1) #recursion
        return true
      end
    end
    grid[row][column]=0
  end
  return false
end

end
