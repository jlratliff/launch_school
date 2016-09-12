class Deck
  def initialize
    ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
    suits = %w(S H C D)
    @cards = ranks.product(suits).shuffle
  end

  def deal_card!
    @cards.pop
  end

  def display_card(card)
    puts "#{card[0]} #{card[1]}"
  end
end

module Hand
  def add_card(new_card)
    cards << new_card
  end

  def display_hand
    line1 = ''
    line2 = '   '
    cards.each_with_index do |(rank, suit), index|
      one_card = rank + ' ' + suit + '   '
      if index.even?
        line1 << one_card
      else
        line2 << one_card
      end
    end
    puts "#{name}'s Hand: #{total}"
    puts line1
    puts line2
    puts
  end

  def total
    card_ranks = @cards.map(&:first)
    sum = 0
    card_ranks.each do |value|
      sum += if value == 'A'
              11
            elsif value.to_i == 0 # for face cards
              10
            else
              value.to_i
            end
    end

    while sum > TwentyOne::MAX_SCORE && card_ranks.include?('A')
      sum -= 10 if card_ranks.pop == 'A'
    end
    sum
  end

  def busted?
    total > TwentyOne::MAX_SCORE
  end
end

class CardPlayer
  include Hand

  attr_accessor :name, :cards, :score
  def initialize
    @cards = []
    @score = 0
    set_name
  end
end

class Player < CardPlayer
  def set_name
    name = ''
    loop do
      puts "Your name please: "
      name = gets.chomp.strip
      break unless name.empty?
      puts "You must have a name. Try again."
    end
    self.name = name
    system "clear"
  end
end

class Dealer < CardPlayer
  DEALER_NAMES = ['Eric', 'Kenny', 'Kyle', 'Stan'].freeze
  def set_name
    self.name = DEALER_NAMES.sample
  end

  def display_flop
    puts "#{name}'s Hand:"
    puts "#{cards[0][0]} #{cards[0][1]}"
    puts "   X X"
    puts
  end
end

class TwentyOne
  MAX_SCORE = 21
  DEALER_HITS_UNTIL = 17
  GAMES_PER_MATCH = 2

  attr_accessor :player, :dealer, :deck

  def initialize
    system "clear"
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
    display_header
  end

  private

  def display_header
    system 'clear'
    puts "Welcome to the game of #{MAX_SCORE}."
    puts "#{dealer.name} hits until #{DEALER_HITS_UNTIL}."
    puts "The first to win #{GAMES_PER_MATCH} games wins the match."
    puts
    puts "Score: #{player.name}: #{player.score}  " \
         "#{dealer.name}: #{dealer.score}"
    puts
  end

  def reset_game
    self.deck = Deck.new
    player.cards = []
    dealer.cards = []
  end

  def reset_match
    reset_game
    player.score = 0
    dealer.score = 0
  end

  def deal_flop
    2.times do
      player.add_card(deck.deal_card!)
      dealer.add_card(deck.deal_card!)
    end
  end

  def display_hands(flop = true)
    display_header
    if flop
      dealer.display_flop
    else
      dealer.display_hand
    end
    player.display_hand
  end

  def player_turn
    while player.total < MAX_SCORE
      answer = nil
      loop do
        puts "(H)it or (S)tay?"
        answer = gets.chomp.downcase
        break if %w(h s).include?(answer)
        puts "Please enter 'H' or 'S'"
      end

      break if answer == 's'
      player.add_card(deck.deal_card!)
      display_hands
    end
  end

  def dealer_turn
    while dealer.total <= DEALER_HITS_UNTIL ||
          dealer.total <= player.total && !dealer.busted?
      dealer.add_card(deck.deal_card!)
    end
    flop = false
    display_hands(flop)
  end

  def display_busted
    if player.busted?
      puts "#{player.name} busted. #{dealer.name} wins this hand."
    elsif dealer.busted?
      puts "#{dealer.name} busted. #{player.name} wins this hand."
    end
  end

  def display_result
    if player.total > dealer.total
      puts "#{player.name} won this hand."
    elsif dealer.total > player.total
      puts "#{dealer.name} won this hand."
    else
      puts "It's a tie."
    end
  end

  def update_score
    if player.busted?
      dealer.score += 1
    elsif dealer.busted?
      player.score += 1
    elsif player.total > dealer.total
      player.score += 1
    else
      dealer.score += 1
    end
  end

  def display_winner
    if player.score == GAMES_PER_MATCH
      puts "Congratulations #{player.name}. You won the match."
    else
      puts "#{dealer.name} won the match."
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts "Sorry, must be y or n."
    end
    answer == 'y'
  end

  def enter_to_continue
    puts "Press Enter to continue"
    gets
  end

  def play_hand
    deal_flop
    display_hands

    player_turn
    if player.busted?
      display_busted
    else
      dealer_turn
      if dealer.busted?
        display_busted
      end
    end

    if !dealer.busted? && !player.busted?
      display_result
    end
  end

  public

  # rubocop:disable MethodLength
  def start
    loop do
      play_hand
      update_score
      enter_to_continue
      if player.score < GAMES_PER_MATCH && dealer.score < GAMES_PER_MATCH
        reset_game
        next
      else
        display_winner
      end
      if play_again?
        reset_match
        next
      else
        break
      end
    end
  end
end

game = TwentyOne.new
game.start
