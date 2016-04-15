VALID_CHOICES = %w(r p s l o).freeze
EXPANDED_CHOICES = { r: 'rock', p: 'paper',  s: 'scissors',
                     l: 'lizard', o: 'Spock' }.freeze

def winner?(first, second)
  combo = first + second
  winning_combos = %w(rl rs pr po sl sp lp lo or os)
  winning_combos.include?(combo)
end

def display_results(player, computer)
  if winner?(player, computer)
    prompt "You won this round."
  elsif winner?(computer, player)
    prompt "You lost this round."
  else
    prompt "You tied this round."
  end
end

def prompt(message)
  puts("=> #{message}")
end

loop do
  player_score = 0
  computer_score = 0
  game_over = FALSE

  until game_over
    choice = nil
    loop do
      prompt("Choose one: (r)ock, (p)aper, (s)cissors, (l)izard, Sp(o)ck")
      choice = gets().chomp()
      break if %w(r p s l o R P S L O).include?(choice)
      prompt("That's not a valid choice.")
    end

    computer_choice = VALID_CHOICES.sample()

    prompt("You chose #{EXPANDED_CHOICES[choice.to_sym]}. " \
      "Computer chose #{EXPANDED_CHOICES[computer_choice.to_sym]}.")

    display_results(choice, computer_choice)

    if winner?(choice, computer_choice)
      player_score += 1
    elsif winner?(computer_choice, choice)
      computer_score += 1
    end

    prompt("Your score: #{player_score}. Computer score: #{computer_score}")

    if player_score == 5 || computer_score == 5
      prompt("We have a winner.")
      game_over = TRUE
    end
  end

  prompt("Play again (y/n)?")
  response = gets().chomp()
  break unless response.downcase().start_with?('y')
end

prompt("Thanks for playing.")
