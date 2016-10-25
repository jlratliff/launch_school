require "pry"
class Deck
  attr_reader :cards

  NUM_CARDS_IN_DECK = 52

  def initialize
    @cards = [] # array of card objects
    new_deck
    shuffle!
  end

  def new_deck
    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
  end

  def shuffle!
    @cards.shuffle!
  end

  def to_s
    @cards.each_index do |index|
      print @cards[index], ' '
      puts if (index + 1) % 10 == 0
    end
    puts
  end

  def cheat
    to_s
  end
end

class Card
  RANKS = %w(A K Q J 10 9 8 7 6 5 4 3 2)
  SUITS = %w(S C H D)

  attr_reader :rank, :suit
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{self.rank}_#{self.suit}"
  end
end

class Card_Player
  attr_accessor :name

  def initialize
    cards = []
    set_name
  end
end

class Player < Card_Player
  def initialize
    set_name
  end

  def set_name
    loop do
      puts 'Your name please:'
      self.name = gets.chomp.strip
      break unless self.name.empty?
      puts 'You gotta have a name.'
    end
  end
end

class Dealer < Card_Player
  DEALER_NAMES = ['Stan', 'Kenny', 'Kyle', 'Eric']
  def set_name
    self.name = DEALER_NAMES.sample
  end

end

class Game
  attr_accessor :player, :dealer

  def initialize
    system 'clear'
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def play
    welcome
    deal_flop ###start here
  end

  def welcome
    system "clear"
    puts "Welcome to the game of 21, #{player.name}.\n\n"
    puts "#{dealer.name} hits until 17.\n\n"
  end
end

game = Game.new
game.play