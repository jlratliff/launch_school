MAX_SCORE = 21
DEALER_HITS_UNTIL = 17
GAMES_PER_MATCH = 5

def prompt(msg)
  puts "=> #{msg}".chomp
end

def init_deck
  ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
  suits = %w(S H C D)
  suits.product(ranks).shuffle
end

def total(hand)
  card_ranks = hand.map { |card| card[1] }
  sum = 0
  card_ranks.each do |value|
    sum = if value == 'A'
            sum + 11
          elsif value.to_i == 0 # for face cards
            sum + 10
          else
            sum + value.to_i
          end
  end

  while sum > MAX_SCORE && card_ranks.include?('A')
    sum -= 10 if card_ranks.pop == 'A'
  end
  sum
end

def display_hand(hand)
  line1 = ''
  line2 = '   '
  hand.each_with_index do |(suit, value), index|
    one_card = value + ' ' + suit + '   '
    if index.even?
      line1 << one_card
    else
      line2 << one_card
    end
  end
  puts line1.chomp
  puts line2.chomp
end

def display_board(dealer_hand, player_hand, scores, hide_dealer_card = false)
  system 'clear'
  puts "GAME OF #{MAX_SCORE}\nDealer hits until #{DEALER_HITS_UNTIL}\n"
  puts "You: #{scores['You']}   Dealer: #{scores['Dealer']}\n"
  if hide_dealer_card
    dealer_hand_hidden = []
    dealer_hand.each { |card| dealer_hand_hidden << card }
    dealer_hand_hidden[0] = ['X', 'X']
    puts "Dealer's Hand"
    display_hand(dealer_hand_hidden)
  else
    puts "Dealer's Hand: #{total(dealer_hand)}"
    display_hand(dealer_hand)
  end
  puts "\nYour Hand: #{total(player_hand)}"
  display_hand(player_hand)
end

def player_turn!(dealer_hand, player_hand, deck, scores)
  hide_dealer_card = true
  display_board(dealer_hand, player_hand, scores, hide_dealer_card)
  while total(player_hand) < MAX_SCORE
    answer = nil
    loop do
      prompt "(H)it or (S)tay?"
      answer = gets.chomp
      break if ['h', 'H', 's', 'S'].include?(answer) || busted?(player_hand)
      prompt "Invalid response. Please enter H or S"
    end
    break if ['s', 'S'].include?(answer)
    player_hand << deal_card!(deck)
    display_board(dealer_hand, player_hand, scores, hide_dealer_card)
  end
  total(player_hand)
end

def busted?(hand)
  total(hand) > MAX_SCORE
end

def dealer_turn!(dealer_hand, player_score, deck)
  while (total(dealer_hand) <= DEALER_HITS_UNTIL ||
         total(dealer_hand) <= player_score) &&
        !busted?(dealer_hand)
    dealer_hand << deal_card!(deck)
  end
end

def deal!(hand, deck)
  2.times { hand << deal_card!(deck) }
end

def deal_card!(deck)
  card = deck.sample
  deck.delete_at(deck.index(card))
  card
end

# ----- Main Program

loop do
  scores = { "You" => 0, "Dealer" => 0 }

  loop do
    deck = init_deck
    dealer_hand = []
    player_hand = []

    deal!(dealer_hand, deck)
    deal!(player_hand, deck)

    player_score = player_turn!(dealer_hand, player_hand, deck, scores)
    display_board(dealer_hand, player_hand, scores)
    if player_score == MAX_SCORE
      prompt "You won this round."
      scores["You"] += 1
    elsif player_score > MAX_SCORE
      prompt "You busted. Dealer won this round."
      scores["Dealer"] += 1
    else
      dealer_turn!(dealer_hand, player_score, deck)
      display_board(dealer_hand, player_hand, scores)
      if busted?(dealer_hand)
        prompt "Dealer busted. You won this round."
        scores["You"] += 1
      else
        prompt "Dealer won this round."
        scores["Dealer"] += 1
      end
    end
    if scores.value?(GAMES_PER_MATCH)
      prompt "#{scores.key(GAMES_PER_MATCH)} won the match."
      break
    end
    prompt "Press Enter to continue."
    gets
  end
  answer = ''
  loop do
    prompt "Play again? (y or n)"
    answer = gets.chomp
    break if ['y', 'n', 'Y', 'N'].include?(answer)
    prompt "Invalid choice."
  end
  break if ['n', 'N'].include?(answer)
end

prompt "Thanks for playing #{MAX_SCORE}."
