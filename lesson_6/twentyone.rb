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

def init_deck()
  deck = {}
  %w[H D C S].each do |suit|
    (2..10).to_a.concat(%w[j q k a]).each { |face| deck[[suit, face]] = nil }
  end
  deck
end

def draw_random(deck, who)
  choice = deck.select { |k, v| v == nil }.keys.sample
  deck[choice] = who
  return choice
end

def hand(deck, who)
  deck.select { |k, v| v == who }.map { |hand, who| hand }
end

def display_hands(deck, dealer_hidden = true)
  puts("Your hand: #{hand(deck, PLAYER)}")
  puts(
    "Dealer hand: #{dealer_hidden ? hand(deck, DEALER).first : hand(deck, DEALER)}",
  )
end

def value(face)
  # if face is a number, return number
  # elsif face is a, return ace logic
  # else return 10
end

def busted?(deck, PLAYER)
  deck.reduce(0) { |hand, who| who == PLAYER ? value(hand[1]) : 0} > 21
end

end
def main()
  deck = init_deck

  # initial deal
  [PLAYER, DEALER].each { |hand| 2.times { draw_random(deck, hand) } }

  # player turn
  while !busted?(deck, PLAYER)
    display_hands(deck) # not yet implemented
    prompt("Would you like to hit or stay? (h/s)")
    choice = gets.chomp.downcase()
    break if choice.start_with?("s")
    newcard = draw_random(deck, PLAYER)
    prompt("You drew #{newcard}")
  end
end

main
