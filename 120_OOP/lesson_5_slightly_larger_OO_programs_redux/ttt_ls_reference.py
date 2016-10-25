











































                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals
        break if board.someone_won? || board.full?
        clear_screen_and_display_board if human_turn?
        current_player_moves
        return squares.first.marker
      @current_marker = COMPUTER_MARKER
      @current_marker = HUMAN_MARKER
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      break if board.unmarked_keys.include?(square)
      break unless play_again?
      computer_moves
      display_board
      display_play_again_message
      display_result
      end
      end
      human_moves
      if three_identical_markers?(squares)
      loop do
      puts "Computer won!"
      puts "It's a tie!"
      puts "Sorry, must be y or n"
      puts "Sorry, that's not a valid choice."
      puts "Would you like to play again? (y/n)"
      puts "You won!"
      reset
      square = gets.chomp.to_i
      squares = @squares.values_at(*line)
    !!winning_marker
    (1..9).each { |key| @squares[key] = Square.new }
    @board = Board.new
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
    @current_marker = FIRST_TO_MOVE
    @current_marker == HUMAN_MARKER
    @human = Player.new(HUMAN_MARKER)
    @marker
    @marker = marker
    @marker = marker
    @squares = {}
    @squares.keys.select { |key| @squares[key].unmarked? }
    @squares[num].marker = marker
    answer = nil
    answer == 'y'
    board.draw
    board.reset
    board[board.unmarked_keys.sample] = computer.marker
    board[square] = human.marker
    case board.winning_marker
    clear
    clear
    clear
    clear_screen_and_display_board
    display_board
    display_goodbye_message
    display_welcome_message
    else
    else
    end
    end
    end
    end
    end
    end
    if human_turn?
    loop do
    loop do
    loop do
    marker != INITIAL_MARKER
    marker == INITIAL_MARKER
    markers = squares.select(&:marked?).collect(&:marker)
    markers.min == markers.max
    nil
    puts "     |     |"
    puts "     |     |"
    puts "     |     |"
    puts "     |     |"
    puts "     |     |"
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts ""
    puts ""
    puts ""
    puts ""
    puts "-----+-----+-----"
    puts "-----+-----+-----"
    puts "Choose a square (#{board.unmarked_keys.join(', ')}): "
    puts "Let's play again!"
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
    puts "Welcome to Tic Tac Toe!"
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    reset
    return false if markers.size != 3
    square = nil
    system "clear"
    unmarked_keys.empty?
    when computer.marker
    when human.marker
    WINNING_LINES.each do |line|
  attr_accessor :marker
  attr_reader :board, :human, :computer
  attr_reader :marker
  COMPUTER_MARKER = "O"
  def []=(num, marker)
  def clear
  def clear_screen_and_display_board
  def computer_moves
  def current_player_moves
  def display_board
  def display_goodbye_message
  def display_play_again_message
  def display_result
  def display_welcome_message
  def draw
  def full?
  def human_moves
  def human_turn?
  def initialize
  def initialize
  def initialize(marker)
  def initialize(marker=INITIAL_MARKER)
  def marked?
  def play
  def play_again?
  def reset
  def reset
  def someone_won?
  def three_identical_markers?(squares)
  def to_s
  def unmarked?
  def unmarked_keys
  def winning_marker
  end
  end
  end
  end
  end
  end
  end
  end
  end
  end
  end
  end
  end
  end
  end
  end
  end
  end
  end
  end
  end
  end
  end
  end
  end
  end
  end
  end
  end
  FIRST_TO_MOVE = HUMAN_MARKER
  HUMAN_MARKER = "X"
  INITIAL_MARKER = " "
  private
  private
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
# frozen_string_literal: true
class Board
class Player
class Square
class TTTGame
end
end
end
end
game = TTTGame.new
game.play