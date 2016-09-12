require "pry"
# frozen_string_literal: true
class Move
  VALUES = { r: 'rock', p: 'paper', s: 'scissors',
             l: 'lizard', o: 'spock' }.freeze

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def >(other_move)
    (rock? && (other_move.scissors? || other_move.lizard?)) ||
      (paper? && (other_move.rock? || other_move.spock?)) ||
      (scissors? && (other_move.paper? || other_move.lizard?)) ||
      (lizard? && (other_move.spock? || other_move.paper?)) ||
      (spock? && (other_move.scissors? || other_move.rock?))
  end

  def <(other_move)
    (rock? && (other_move.paper? || other_move.spock?)) ||
      (paper? && (other_move.scissors? || other_move.lizard?)) ||
      (scissors? && (other_move.rock? || other_move.spock?)) ||
      (lizard? && (other_move.scissors? || other_move.rock?)) ||
      (spock? && (other_move.lizard? || other_move.paper?))
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "You have to have a name."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose (r)ock, (p)aper, (s)cissors, (l)izard, or sp(o)ck:"
      choice = gets.chomp.downcase
      break if Move::VALUES.value?(choice) || Move::VALUES.key?(choice.to_sym)
      puts "Invalid choice. Try again."
    end
    self.move = Move.new(Move::VALUES[choice[0].to_sym])
  end
end

class Computer < Player
  def set_name
    self.name = ['Hal', 'C3P0', 'Comp'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES[Move::VALUES.keys.sample])
  end
end

class RPSGame
  WINNINGSCORE = 2
  attr_accessor :human, :computer

  def initialize
    clearscreen
    @human = Human.new
    @computer = Computer.new
  end

  def clearscreen
    system "clear"
    system "cls"
  end

  def display_welcome_message
    clearscreen
    reset_scores
    puts "Welcome to Rock, Paper, Scissors"
    puts "The score is #{computer.name}: #{computer.score}" \
         "   #{human.name}: #{human.score}"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Bye."
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_scores
    puts "The score is #{computer.name}: #{computer.score}   " \
         "#{human.name}: #{human.score}"
  end

  def display_round_winner
    if human.move > computer.move
      puts "#{human.name} won."
    elsif human.move < computer.move
      puts "#{computer.name} won."
    else
      puts "Tie."
    end
  end

  def update_scores
    if human.move > computer.move
      human.score += 1
    elsif human.move < computer.move
      computer.score += 1
    end
  end

  def winner?
    human.score == WINNINGSCORE || computer.score == WINNINGSCORE
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again (y/n)?"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts "Sorry. Enter y or n."
    end

    answer == 'y'
  end

  def reset_scores
    human.score = 0
    computer.score = 0
  end

  def play
    display_welcome_message
    loop do
      loop do
        human.choose
        computer.choose
        display_moves
        display_round_winner
        update_scores
        display_scores
        break if winner?
      end
      break unless play_again?
      display_welcome_message
    end
    display_goodbye_message
  end
end

RPSGame.new.play
