require 'pry'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
GAMES_PER_MATCH = 5
FIRST_MOVE = 'choose'.freeze

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

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: " + joinor(empty_squares(brd), ', ', 'and')
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry. Not a valid choice. Try again"
  end

  brd[square] = PLAYER_MARKER
end

def find_square_at_risk(brd)
  WINNING_LINES.each do |line|
    line_vals = []
    (0..2).each { |element| line_vals << brd[line[element]] }
    if line_vals.count(PLAYER_MARKER) == 2 && line_vals.include?(INITIAL_MARKER)
      return line[line_vals.index(INITIAL_MARKER)]
    end
  end
  nil
end

def find_winning_square(brd)
  WINNING_LINES.each do |line|
    line_vals = []
    (0..2).each { |element| line_vals << brd[line[element]] }
    if line_vals.count(COMPUTER_MARKER) == 2 && line_vals.include?(INITIAL_MARKER)
      return line[line_vals.index(INITIAL_MARKER)]
    end
  end
  nil
end

def computer_places_piece!(brd)
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
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    line_vals = []
    (0..2).each { |element| line_vals << brd[line[element]] }
    next unless line_vals.uniq.length == 1 && brd[line[0]] != ' '
    if brd[line[0]] == PLAYER_MARKER
      return "Player"
    else
      return "Computer"
    end
  end
  nil
end

def player_first(board, scores)
  loop do
    display_board(board, scores)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end
end

def computer_first(board, scores)
  loop do
    computer_places_piece!(board)
    display_board(board, scores)
    break if someone_won?(board) || board_full?(board)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end
end

# ----- Main program
loop do
  scores = { "Player" => 0, "Computer" => 0 }

  loop do
    board = initialize_board

    display_board(board, scores)

    case FIRST_MOVE
    when 'player'
      player_first(board, scores)
    when 'computer'
      computer_first(board, scores)
    when 'choose'
      answer = ''
      loop do
        prompt "Who goes first (c)omputer or (p)layer?"
        answer = gets.chomp
        break if ['c', 'p', 'C', 'P'].include?(answer)
        prompt "Invalid choice."
      end
      case answer
      when 'p', 'P'
        player_first(board, scores)
      when 'c', 'C'
        computer_first(board, scores)
      end
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
  loop do
    prompt "Play another match? (y or n)"
    answer = gets.chomp
    break if ['y', 'n', 'Y', 'N'].include?(answer)
    prompt "Invalid choice."
  end
end

prompt "Thanks for playing tic-tac-toe"
