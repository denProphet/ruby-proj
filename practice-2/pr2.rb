def main
  while true do
    print 'Type number: '
    a = gets.strip.to_i
    print 'Type operation: '
    operation = gets.strip

    print 'Type number: '
    b = gets.strip.to_i

    if operation == "+"
      result = sum(a,b)
    elsif operation == "-"
      result = subtraction(a, b)
    elsif operation == "*"
result =  multy(a, b)
    elsif operation == "/"
      begin
    result = div(a, b)
  rescue ZeroDivisionError => error
    result = 'error'
    puts(error.message)
    end
  end

    print 'Result: '
    puts result

  end
end

def sum(a, b)
    return a+b
end
    def subtraction (a, b)

        return a-b
end
      def div (a, b)
          return a/b
end
          def multy (a, b)
              return a*b
end
 main
