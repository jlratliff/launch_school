def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt('Welcome to calculator. Enter your name:')

name = nil
loop do
  name = gets().chomp()
  break unless name.empty?()
  prompt("Your mom didn't name you? Try again.")
end

prompt("Hi #{name}")

loop do
  num1 = nil
  loop do
    prompt('First number: ')
    num1 = gets().chomp()
    break if valid_number?(num1)
    prompt("Hmmm....that doesn't compute")
  end

  num2 = nil
  loop do
    prompt('Second number: ')
    num2 = gets().chomp()
    break if valid_number?(num2)
    prompt("Hmmm....that doesn't compute")
  end

  operator_prompt = <<-MSG
    Which operation:
    1 = add
    2 = subtract
    3 = multiply
    4 = divide
  MSG

  puts(operator_prompt)
  operator = nil
  loop do
    operator = gets().chomp()

    break if %w(1 2 3 4).include?(operator)
    prompt("Choose 1, 2, 3 or 4")
  end

  prompt("#{operation_to_message(operator)} the two numbers")

  result = case operator
           when '1'
             num1.to_i + num2.to_i
           when '2'
             num1.to_i - num2.to_i
           when '3'
             num1.to_i * num2.to_i
           when '4'
             num1.to_f / num2.to_f
           end

  prompt("The result is #{result}")

  prompt("Do you want to calculate again (Y to continue):")
  answer = gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thanks for calculating with us.")
