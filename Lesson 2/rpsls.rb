MOVES = %w[rock paper scissors lizard spock]
TABLE = Hash[%w[r p s l k].zip(MOVES)]
BEATS = {
  "rock" => %w[scissors lizard],
  "paper" => %w[rock spock],
  "scissors" => %w[paper lizard],
  "lizard" => %w[spock paper],
  "spock" => %w[scissors rock]
}

def prompt(*messages)
  messages.each { |message| puts("=> #{message}") }
end

def win?(player1, player2)
  BEATS[player1].include?(player2)
end

def who_wins?(player, computer)
  if win?(player, computer)
    "player"
  elsif win?(computer, player)
    "computer"
  else
    "tie"
  end
end

def display_results(winner, wins)
  case winner
  when "player"
    prompt("You win this round!")
  when "computer"
    prompt("Computer wins this round!")
  when "tie"
    prompt("That was a tie!")
  else
    puts "Error: display_results() received invalid input"
  end
  prompt "The current score is:",
         "  Player:   #{wins["player"]}",
         "  Computer: #{wins["computer"]}"
end

def choice_to_move(choice)
  if TABLE.include? choice
    TABLE[choice]
  else
    choice
  end
end

wins = Hash.new(0)

loop do
  while true
    prompt("Choose one: ")
    TABLE.each { |letter, move| puts "     #{move.ljust(9)} (#{letter})" }
    player_move = choice_to_move(gets.chomp())

    break if MOVES.include?(player_move)
    prompt("That's not a valid move.")
  end

  computer_move = MOVES.sample
  prompt("You chose: #{player_move}")
  prompt("Computer chose: #{computer_move}")

  winner = who_wins?(player_move, computer_move)
  wins[winner] += 1
  display_results(winner, wins)

  # if someone wins three times, end game or restart
  if [wins["player"], wins["computer"]].max > 2
    prompt("The grand winner is: #{winner.capitalize}!")
    prompt("Do you want to play again? (y)")
    answer = gets.chomp()
    if answer.downcase().start_with?("y")
      wins.clear
    else
      break
    end
  end
end
