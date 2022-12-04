require_relative 'algorithm.rb'
    cake =  "........\n" +
            "..o.....\n" +
            "...o....\n" +
            "........\n"

    algorithm = Algorithm.new(cake)

    matrix = algorithm.convert_to_matrix()
    puts "Ur cake: "
    algorithm.show_matrix(matrix)

    solutions = algorithm.split()
    algorithm.show_solution_details(solutions)
