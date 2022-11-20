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
CARD_STR =
  Hash[
    %W[Hearts Diamonds Clubs Spades Jack Queen King Ace].map { |v| [v[0], v] } +
      (2..10).to_a.zip(2..10).to_a
  ]
def prompt(*msgs)
  msgs.each { |msg| puts("=> #{msg}") }
end

def init_deck
  deck = {}
  %w[H D C S].each do |suit|
    (2..10).to_a.concat(%w[J Q K A]).each { |face| deck[[suit, face]] = nil }
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

def display_cards(hand)
  hand
    .map { |house, value| "#{CARD_STR[value]} of #{CARD_STR[house]}" }
    .join(", ")
end

def display_hands(
  deck,
  player_hand_value,
  dealer_hand_value,
  dealer_hidden = true
)
  dealer_hand =
    (
      if dealer_hidden
        display_cards(hand(deck, DEALER).take(1))
      else
        display_cards(hand(deck, DEALER))
      end
    )
  dealer_value = dealer_hidden ? "Hidden" : dealer_hand_value
  puts("Dealer hand: #{dealer_hand}. Value: #{dealer_value}")
  puts(
    "Your hand: #{display_cards(hand(deck, PLAYER))}. Value: #{player_hand_value}",
  )
end

def face_value(face)
  if %w[J Q K].include?(face)
    10
  elsif face == "A"
    11
  else
    face
  end
end

def hand_value(deck, player)
  hand = deck.select { |_, who| who == player }
  value_ceil = hand.reduce(0) { |sum, (card, _)| sum + face_value(card[1]) }
  ace_count = hand.count { |card, _| card[1] == "A" }
  possible_values = (0..ace_count).map { |i| value_ceil - 10 * i }
  possible_values.find(proc { value_ceil - 10 * ace_count }) do |hand_value|
    hand_value <= 21
  end
end

def busted?(deck, player)
  hand_value(deck, player) > 21
end

def get_result(deck)
  p_score, d_score = [PLAYER, DEALER].map { |who| hand_value(deck, who) }

  if p_score > 21
    :player_bust
  elsif d_score > 21
    :dealer_bust
  elsif d_score > p_score
    :dealer_win
  elsif p_score > d_score
    :player_win
  else
    :tie
  end
end

def who_wins?(result)
  if %i[dealer_bust player_win].include?(result)
    PLAYER
  elsif %i[player_bust dealer_win].include?(result)
    DEALER
  else
    0
  end
end

def display_results(result)
  case result
  when :player_bust
    prompt("You busted! Dealer wins.")
  when :dealer_bust
    prompt("Dealer busts. You win!")
  when :dealer_win
    prompt("Dealer wins.")
  when :player_win
    prompt("You win!")
  when :tie
    prompt("Tie!")
  else
    raise ArgumentError, "invalid result"
  end
end

def display_score(score)
  puts("\nRounds won: \nPlayer: #{score[PLAYER]} Dealer: #{score[DEALER]}")
  puts("-----------------------------")
end

def play_round
  deck = init_deck

  # initial deal
  [PLAYER, DEALER].each { |hand| 2.times { draw_random(deck, hand) } }
  player_hand_value = hand_value(deck, PLAYER)
  dealer_hand_value = hand_value(deck, DEALER)

  # player turn
  while !busted?(deck, PLAYER)
    display_hands(deck, player_hand_value, dealer_hand_value)
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
    prompt("You drew #{display_cards([newcard])}")
    player_hand_value = hand_value(deck, PLAYER)
  end

  if !busted?(deck, PLAYER)
    # dealer turn
    while (dealer_hand_value = hand_value(deck, DEALER)) < 17
      puts("Dealer drew #{display_cards([draw_random(deck, DEALER)])}.")
    end
  end

  display_hands(deck, player_hand_value, dealer_hand_value, false)
  result = get_result(deck)
  display_results(result)

  prompt("Press enter to continue...")
  gets

  who_wins?(result)
end

loop do
  score = { PLAYER => 0, DEALER => 0 }
  while score.values.max < 5
    winner = play_round
    score[winner] += 1 if score.key?(winner)
    display_score(score)
  end
  score[PLAYER] >= 5 ? prompt("You win!") : prompt("Dealer wins!")

  prompt("Would you like to play again? (y/n)")
  break unless gets.chomp.downcase.start_with?("y")
  prompt("New game started!")
end
