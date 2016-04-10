# mortgage.rb
require 'yaml'
PROMPTS = YAML.load_file('mortgage_messages.yml')

def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def integer?(num)
  num.to_i.to_s == num && num.to_i > 0
end

def float?(num)
  num.to_f.to_s == num && num.to_f > 0
end

prompt(PROMPTS['welcome'])

name = nil
loop do
  name = gets().chomp()
  break unless name.empty?()
  prompt(PROMPTS['invalid_name'])
end

prompt("Hi #{name}")

loop do
  loan_amount = nil
  prompt(PROMPTS['loan_amount'])
  loop do
    loan_amount = gets().chomp()
    break if integer?(loan_amount)
    prompt(PROMPTS['invalid_int'])
  end
  loan_amount = loan_amount.to_i

  monthly_rate = nil
  prompt(PROMPTS['apr'])
  loop do
    apr = gets().chomp()
    if valid_number?(apr)
      monthly_rate = apr.to_f / 1200
      break
    end
    prompt(PROMPTS['invalid_float'])
  end

  months = nil
  prompt(PROMPTS['months'])
  loop do
    months = gets().chomp()
    break if integer?(months)
    prompt(PROMPTS['invalid_int'])
  end
  months = months.to_i

  p = (loan_amount * monthly_rate * (1 + monthly_rate)**months) /
      (((1 + monthly_rate)**months) - 1)

  prompt("Your monthly payment is $#{format('%02.2f', p)}")

  prompt(PROMPTS['again'])

  response = gets().chomp()

  break unless response.downcase().start_with?('y')
end

prompt(PROMPTS['ending'])
