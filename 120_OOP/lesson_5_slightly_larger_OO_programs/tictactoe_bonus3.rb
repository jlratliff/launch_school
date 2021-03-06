# frozen_string_literal: true
require "pry"
class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  attr_reader :squares

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  def display_unmarked_squares
    joinor(unmarked_keys)
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end

  def joinor(arr, delimiter = ', ', conjunction = 'or')
    arr[-1] = "#{conjunction} #{arr.last}" if arr.length > 1
    arr.join(delimiter)
  end

  public

  def find_square_at_risk(marker)
    WINNING_LINES.each do |line|
      line_vals = []
      line.each {|val| line_vals << @squares[val].marker}
      if line_vals.count(marker) == 2 && line_vals.include?(Square::INITIAL_MARKER)
        return line[line_vals.index(Square::INITIAL_MARKER)]
      end
    end
    nil
  end

  def find_winning_square(marker)
    WINNING_LINES.each do |line|
      line_vals = []
      line.each {|val| line_vals << @squares[val].marker}
      if line_vals.count(marker) == 2 && line_vals.include?(Square::INITIAL_MARKER)
        return line[line_vals.index(Square::INITIAL_MARKER)]
      end
    end
    nil
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    !marked?
  end
end

class Player
  attr_reader :marker, :score

  def initialize(marker)
    @marker = marker
    @score = 0
  end

  def increase_score
    @score += 1
  end

  def reset_score
    @score = 0
  end

end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = HUMAN_MARKER
  WINNING_SCORE = 2

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = HUMAN_MARKER
    @current_marker = FIRST_TO_MOVE
  end

  private

  def display_welcome_message
    puts "Welcome to Tic Tac Toe"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe. Goodbye."
  end

  def clear
    system 'clear'
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_board
    puts "You're an #{human.marker}. Computer is an #{computer.marker}."
    puts "Game is to #{WINNING_SCORE}."
    puts "Score ==>   You: #{human.score}   Computer: #{computer.score}"
    board.draw
    puts ""
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def joinor
    join(', ')
  end

  def human_moves
    puts "Choose a square (#{board.display_unmarked_squares}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry. Not valid. Reenter"
    end
    board[square] = human.marker
  end

  def computer_moves
    computer_move = board.find_winning_square(computer.marker)
    if !computer_move
      computer_move = board.find_square_at_risk(human.marker)
    end
    if !computer_move && board.unmarked_keys.include?(5)
      computer_move = 5
    end
    if !computer_move
      computer_move = board.unmarked_keys.sample
    end
    board[computer_move] = computer.marker
  end

  def display_round_result
    clear_screen_and_display_board
    case board.winning_marker
    when human.marker
      puts "You won this round."
    when computer.marker
      puts "Computer won this round."
    else
      puts "It's a tie."
    end
  end

  def display_match_result
    case board.winning_marker
    when human.marker
      puts "You won this match."
    when computer.marker
      puts "Computer won this match."
    end
  end

  def increase_winner_score
    case board.winning_marker
    when human.marker
      human.increase_score
    when computer.marker
      computer.increase_score
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n."
    end
    answer == 'y'
  end

  def reset_round
    board.reset
    @current_marker = FIRST_TO_MOVE
  end

  def reset_match
    reset_round
    human.reset_score
    computer.reset_score
  end


  def match_winner?
    human.score == WINNING_SCORE || computer.score == WINNING_SCORE
  end

  def press_enter_to_continue
    puts "Press enter to continue"
    temp = gets
  end

  public

  def play_match
    clear
    display_welcome_message
    press_enter_to_continue

    loop do

      loop do
        play_round
        display_round_result
        break if match_winner?
        reset_round
        press_enter_to_continue
      end

      display_match_result
      break unless play_again?
      reset_match
    end
    display_goodbye_message
  end

  def play_round
    clear_screen_and_display_board
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board
    end
    increase_winner_score
  end

end

game = TTTGame.new
game.play_match
