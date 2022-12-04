class Algorithm

  #fields: cake (string)
  def initialize(cake)
      @cake = cake
  end

# get a matrix from cake (string field)
  def convert_to_matrix()
    matrix = []
    array = @cake.split("\n")

      for i in 0...array.length
          matrix[i] = array[i].split("")
      end
      return matrix
  end

# get a sub matrix
  def get_piece_of_matrix(matrix, x, row_number, y, column_number)
      if matrix.nil?
          return nil
      end

      sub_matrix = []

      for i in 0...row_number
          sub_matrix[i] = []
          for j in 0...column_number
              sub_matrix[i][j] = matrix[i + x][j + y]
          end
      end
      return sub_matrix
  end

# print matrix to console
  def show_matrix(matrix)
      for i in 0...matrix.length
          for j in 0...matrix[i].length
              print "#{matrix[i][j]}"
          end
          puts ""
      end
      puts ""
  end

# split cake
# root algorithm
def split()
    matrix = convert_to_matrix()
    rows = matrix.length
    cols = matrix[0].length

  probable_appropriate_submatrix_x = []
    for i in 1..rows
        probable_appropriate_submatrix_x << i if matrix.length % i == 0
    end

    probable_appropriate_submatrix_y = []
    for i in 1..cols
        probable_appropriate_submatrix_y << i if matrix[0].length % i == 0
    end

    solutions = []
    for i in 0...probable_appropriate_submatrix_x.length
        for j in 0...probable_appropriate_submatrix_y.length
            pieces = []
            possible = true
            row_n = rows / probable_appropriate_submatrix_x[i]
            col_n = cols / probable_appropriate_submatrix_y[j]

            x = 0
            while x < rows
                y = 0
                while y < cols
                    sub_m = get_piece_of_matrix(matrix, x, row_n, y, col_n)

                    if check_out_raisins(sub_m) != 1
                        possible = false
                        break
                    end
                    pieces << sub_m
                    y += col_n
                end
                break if !possible
                x += row_n
            end
            if possible
                solutions << pieces
            end
        end
    end
    return solutions
end

# print solutions details
# get result of task
# print count of solutions and pieces
def show_solution_details(solutions)
    return nil if solutions.nil?
    print "Count of solutions: #{solutions.length}\n\n"

    for i in 0...solutions.length
        puts "Solution #{i + 1}:"
        for j in 0...solutions[i].length
            puts "Piece #{j + 1}"
            show_matrix(solutions[i][j])
        end
        puts "=========================="
    end
end

# get count of raisins
def check_out_raisins(matrix)
    count = 0
    for i in 0...matrix.length
        for j in 0...matrix[i].length
            if matrix[i][j] == "o"
                count += 1
            end
        end
    end
    return count
end
end
