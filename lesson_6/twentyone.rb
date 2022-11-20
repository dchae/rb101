# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

PLAYER = 1
DEALER = -1

def prompt(*msgs)
  msgs.each { |msg| puts("=> #{msg}") }
end

def init_deck
  deck = {}
  %w[H D C S].each do |suit|
    (2..10).to_a.concat(%w[j q k a]).each { |face| deck[[suit, face]] = nil }
  end
  deck
end

def draw_random(deck, who)
  choice = deck.select { |_, v| v.nil? }.keys.sample
  deck[choice] = who
  choice
end

def hand(deck, who)
  deck.select { |_, v| v == who }.map { |hand, _| hand }
end

def display_hands(deck, dealer_hidden = true)
  dealer_hand = dealer_hidden ? hand(deck, DEALER).first : hand(deck, DEALER)
  dealer_value = dealer_hidden ? "Hidden" : hand_value(deck, DEALER)
  puts("Dealer hand: #{dealer_hand}. Value: #{dealer_value}")
  puts("Your hand: #{hand(deck, PLAYER)}. Value: #{hand_value(deck, PLAYER)}")
end

def face_value(face)
  if %w[j q k].include?(face)
    10
  elsif face == "a"
    11
  else
    face
  end
end

def hand_value(deck, player)
  hand = deck.select { |_, who| who == player }
  value_ceil = hand.reduce(0) { |sum, (card, _)| sum + face_value(card[1]) }
  ace_count = hand.count { |card, _| card[1] == "a" }
  possible_values = (0..ace_count).map { |i| value_ceil - 10 * i }
  possible_values.find(proc { value_ceil - 10 * ace_count }) do |hand_value|
    hand_value <= 21
  end
end

def busted?(deck, player)
  hand_value(deck, player) > 21
end

def display_results(deck)
  p_score, d_score = [PLAYER, DEALER].map { |who| hand_value(deck, who) }

  if p_score > 21
    prompt("You busted! Dealer wins.")
  elsif d_score > 21
    prompt("Dealer busts. You win!")
  elsif d_score > p_score
    prompt("Dealer wins.")
  elsif p_score > d_score
    prompt("You win!")
  else
    prompt("Tie!")
  end
end

def main
  deck = init_deck

  # initial deal
  [PLAYER, DEALER].each { |hand| 2.times { draw_random(deck, hand) } }

  # player turn
  while !busted?(deck, PLAYER)
    display_hands(deck)
    prompt("Would you like to hit or stay? (h/s)")
    choice = gets.chomp.downcase
    if choice.start_with?("s")
      prompt("You stayed.")
      break
    elsif !choice.start_with?("h")
      prompt("Not a valid choice.")
      next
    end
    newcard = draw_random(deck, PLAYER)
    prompt("You drew #{newcard}")
  end

  if !busted?(deck, PLAYER)
    # dealer turn
    while hand_value(deck, DEALER) < 17
      puts("Dealer drew #{draw_random(deck, DEALER)}.")
    end
  end

  display_hands(deck, false)
  display_results(deck)
end

loop do
  main
  prompt("Would you like to play again? (y/n)")
  break if gets.chomp.downcase.start_with?("n")
end
