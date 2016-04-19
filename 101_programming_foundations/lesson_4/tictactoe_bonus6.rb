require 'pry'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
GAMES_PER_MATCH = 2
FIRST_MOVE = 'choose'.freeze
PLAYERS = { 'c' => 'computer', 'p' => 'player' }.freeze

def prompt(msg)
  puts "=> #{msg}".chomp
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd, scores)
  system 'clear'
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts "Match is to #{GAMES_PER_MATCH}"
  puts "Player: #{scores['Player']}   Computer: #{scores['Computer']}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def initialize_board
  new_board = {}
  (1..9). each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(empty_squares, delimiter = ', ', conjunction = 'or')
  if empty_squares.length == 1
    return empty_squares[0].to_s
  end
  joined_string = empty_squares.join(delimiter)
  joined_string.insert(joined_string.length - 1, conjunction + INITIAL_MARKER)
  joined_string
end

def find_square_at_risk(brd)
  WINNING_LINES.each do |line|
    line_vals = brd.values_at(*line)
    if line_vals.count(PLAYER_MARKER) == 2 && line_vals.include?(INITIAL_MARKER)
      return line[line_vals.index(INITIAL_MARKER)]
    end
  end
  nil
end

def find_winning_square(brd)
  WINNING_LINES.each do |line|
    line_vals = brd.values_at(*line)
    if line_vals.count(COMPUTER_MARKER) == 2 && line_vals.include?(INITIAL_MARKER)
      return line[line_vals.index(INITIAL_MARKER)]
    end
  end
  nil
end

def computer_turn(brd)
  square = find_winning_square(brd)
  if !square
    square = find_square_at_risk(brd)
  end
  if !square && brd[5] == INITIAL_MARKER
    square = 5
  end
  if !square
    square = empty_squares(brd).sample
  end
  square
end

def place_piece!(brd, current_player)
  if current_player == 'computer'
    square = computer_turn(brd)
    # square = find_winning_square(brd)
    # if !square
    #   square = find_square_at_risk(brd)
    # end
    # if !square && brd[5] == INITIAL_MARKER
    #   square = 5
    # end
    # if !square
    #   square = empty_squares(brd).sample
    # end
    brd[square] = COMPUTER_MARKER
  else
    square = ''
    loop do
      prompt "Choose a square: " + joinor(empty_squares(brd), ', ', 'and')
      square = gets.chomp.to_i
      break if empty_squares(brd).include?(square)
      prompt "Sorry. Not a valid choice. Try again"
    end
    brd[square] = PLAYER_MARKER
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    line_vals = brd.values_at(*line)
    next unless line_vals.uniq.length == 1 && brd[line[0]] != ' '
    return brd[line[0]] == PLAYER_MARKER ? 'Player' : 'Computer'
  end
  nil
end

# ----- Main program
loop do
  scores = { "Player" => 0, "Computer" => 0 }

  loop do
    board = initialize_board

    display_board(board, scores)

    answer = FIRST_MOVE
    if answer == 'choose'
      loop do
        prompt "Who goes first (c)omputer or (p)layer?"
        answer = gets.chomp
        break if ['c', 'p', 'C', 'P'].include?(answer)
        prompt "Invalid choice."
      end
    end

    current_player = PLAYERS[answer[0].downcase]

    loop do
      display_board(board, scores)
      place_piece!(board, current_player)
      current_player = current_player == 'computer' ? 'player' : 'computer'
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board, scores)

    if someone_won?(board)
      winner = detect_winner(board)
      prompt "#{winner} won this game."
      scores[winner] += 1
      if scores.value?(GAMES_PER_MATCH)
        prompt "#{winner} won the match."
        break
      end
    else
      prompt "It's a tie."
    end
    prompt "Press Enter to continue."
    gets
  end
  answer = ''
  loop do
    prompt "Play another match? (y or n)"
    answer = gets.chomp
    break if ['y', 'n', 'Y', 'N'].include?(answer)
    prompt "Invalid choice."
  end
  break if ['n', 'N'].include?(answer)
end

prompt "Thanks for playing tic-tac-toe"
