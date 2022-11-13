# TODO:
#
# Write a program to calculate expressions
#
# description:
#
# The entry program expects the usual mat. expression and translate it into Polish notation
# Outputs an expression in Polish notation and outputs the result
#
# requirements:
#
# Expressions can have nested arguments of any depth, for example (+ (* 1 8) (* 2 (+ 3 1)))
# Expression operators, functions, and arguments will be inline.
# Expressions will always have balanced parentheses and spaces between list items.
#
# @Author: Denis Yarovoy
# @Date: 06.11.22

#-------------------------------------

def main
    prefix_expression = define_prefix_expression(get_expression)
    puts "Expression in prefix notation: #{prefix_expression}"
    puts "Result of expression: #{get_result_from_prefix_expression(prefix_expression)}"
end

# get text from user's console
def get_expression()
  puts 'Enter your expression to calculate: '
  return gets.chomp
end

# Convert to prefix expression
def define_prefix_expression(str)
    operators = []
    operands = []
    operator_template = "+-/*^()"
    expression = ""

    for substring in str.split("")
        if operator_template.include? substring
           #string wth spaces
            expression += " #{substring} "
        else
            #simple concat
            expression += substring
        end
    end

    for substring in expression.split(" ").delete_if {|x| x == " "}
            # add a number to the operand stack
        if is_number?(substring)
            operands.push(substring + " ")
            # add operator to operator stack
        elsif is_math_operator?(substring)
            while operators.length != 0 && define_priority(substring) <= define_priority(operators.last.strip)
                push_expression(operators, operands)
            end
            operators.push(substring + " ")
        elsif substring == "("
            operators.push(substring)
        elsif substring == ")" # add operator to operator stack
            while operators.length != 0  && operators.last != "("
                push_expression(operators, operands)
            end
             # pop the opening brace off the stack
            operators.pop
        end
    end
    # Push statements off the statement stack until it is empty.
    # The operation adds the result of each pushing operand stack.
    while operators.length != 0
        push_expression(operators, operands)
    end
    return operands.last
end

  # Push statements off the statement stack
def push_expression(operators, operands)
    operator = operators.pop
    if !operator.nil?
        if is_trigonometry_operator?(operator.strip)
            operand = operands.pop
            operands.push(operator + operand) if !operand.nil?
        else
            a = operands.pop
            b = operands.pop
            operands.push(operator + b + a) if !a.nil? && !b.nil?
        end
    end
end

# Expression calculator
def get_result_from_prefix_expression(expression)
    stack = []
    for i in expression.split(" ").reverse
        if is_number?(i)
            stack.push(i.to_f)
        else
            case i
                when "+"
                    a = stack.pop.to_f
                    b = stack.pop.to_f
                    stack.push(a + b)
                when "-"
                    a = stack.pop.to_f
                    b = stack.pop.to_f
                    stack.push(a - b)
                when "*"
                    a = stack.pop.to_f
                    b = stack.pop.to_f
                    stack.push(a * b)
                when "/"
                    a = stack.pop.to_f
                    b = stack.pop.to_f
                    stack.push(a / b)
                when "^"
                    a = stack.pop.to_f
                    b = stack.pop.to_f
                    stack.push(a ** b)
                when "sin"
                      a = stack.pop.to_f
                      stack.push(Math.sin(a))
                when "cos"
                    a = stack.pop.to_f
                    stack.push(Math.cos(a))
                when "tg"
                    a = stack.pop.to_f
                    stack.push(Math.tan(a))
                when "ctg"
                    a = stack.pop.to_f
                    stack.push(1/Math.tan(a))
            end
        end
    end

    return stack.pop;
end

# Determine if string is a number
def is_number? (str)
        return str.match?(/[[:digit:]]/)
end

# Determine if string is a math operator
def is_math_operator? (str)
      return true  if is_trigonometry_operator?(str)
      return str =~ /[\+\-\*\/\^]/
end

# Determine if string is a trigonometry operator
def is_trigonometry_operator? (str)
    return str == "sin" || str == "cos" || str == "tg" || str == "ctg"
end

# Get math operation priority
def define_priority(str)
      return 1 if (str == "+" || str == "-")
      return 2 if str == "^"
      return 3 if is_trigonometry_operator? (str)
      return 4 if (str == "*" || str == "/")
      return 0
end

main
