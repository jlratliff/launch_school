require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end


def operation_to_message(op)
  msg = case op
          when '1'
            'Adding'
          when '2'
            'Subtracting'
          when '3'
            'Multiplying'
          when '4'
            'Dividing'
        end
  msg
end

prompt(MESSAGES['welcome'])

name = nil
loop do
  name = gets().chomp()
  break unless name.empty?()
  prompt(MESSAGES['valid_name'])
end

prompt("Hi #{name}")

loop do
  num1 = nil
  loop do
    prompt(MESSAGES['num1'])
    num1 = gets().chomp()
    break if valid_number?(num1)
    prompt(MESSAGES['num_error'])
  end

  num2 = nil
  loop do
    prompt(MESSAGES['num2'])
    num2 = gets().chomp()
    break if valid_number?(num2)
    prompt(MESSAGES['num_error'])
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
    prompt(MESSAGES['operators'])
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

  prompt(MESSAGES['continue'])
  answer = gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['thanks'])
