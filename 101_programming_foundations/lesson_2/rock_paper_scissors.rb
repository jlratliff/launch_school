# rock_paper_scissors.rb

VALID_CHOICES = %w(rock paper scissors).freeze

def winner?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors') && second == 'paper'
end

def display_results(player, computer)
  if winner?(player, computer)
    prompt "You won."
  elsif winner?(computer, player)
    prompt "You lost."
  else
    prompt "Tie"
  end
end

def prompt(message)
  puts("=> #{message}")
end

loop do
  choice = nil
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets().chomp()

    break if VALID_CHOICES.include?(choice)
    prompt("That's not a valid choice.")
  end

  computer_choice = VALID_CHOICES.sample()

  prompt("You chose #{choice}. Computer chose #{computer_choice}.")

  display_results(choice, computer_choice)

  prompt("Play again?")
  response = gets().chomp()
  break unless response.downcase().start_with?('y')
end

prompt("Thanks for playing.")
