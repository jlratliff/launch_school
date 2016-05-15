require "pry"
# frozen_string_literal: true
class Move
  VALUES = { R: 'Rock', P: 'Paper', S: 'Scissors' }.freeze

  def to_s
    self.class.to_s
  end

  def beats?(object)
    self > object
  end

  def loses?(object)
    self < object
  end
end

class Scissors < Move
  def >(object)
    object.class == Paper
  end

  def <(object)
    object.class == Rock
  end
end

class Paper < Move
  def >(object)
    object.class == Rock
  end

  def <(object)
    object.class == Scissors
  end
end

class Rock < Move
  def >(object)
    object.class == Scissors
  end

  def <(object)
    object.class == Paper
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
    name = ''
    loop do
      puts "What's your name?"
      name = gets.chomp
      break unless name.empty?
      puts "You have to have a name."
    end
    self.name = name
  end

  def choose
    choice = nil
    loop do
      puts "Please choose (r)ock, (p)aper or (s)cissors:"
      choice = gets.chomp.capitalize
      break if Move::VALUES.value?(choice) || Move::VALUES.key?(choice[0].to_sym)
      puts "Invalid choice. Try again."
    end
    self.move = Object.const_get(Move::VALUES[choice[0].to_sym]).new
  end
end

class Computer < Player
  def set_name
    self.name = ['Hal', 'C3P0', 'Comp'].sample
  end

  def choose
    self.move = Object.const_get(Move::VALUES[Move::VALUES.keys.sample]).new
  end
end

class RPSGame
  WINNING_SCORE = 2
  attr_accessor :human, :computer

  def initialize
    clear_screen
    @human = Human.new
    @computer = Computer.new
  end

  def clear_screen
    system "clear"
    system "cls"
  end

  def display_welcome_message
    clear_screen
    reset_scores
    puts "Welcome to Rock, Paper, Scissors"
    display_scores
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
    human.score == WINNING_SCORE || computer.score == WINNING_SCORE
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
