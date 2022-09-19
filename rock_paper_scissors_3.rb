MOVES = %w[rock paper scissors]
BEATS = { "rock" => "scissors", "paper" => "rock", "scissors" => "paper" }

def prompt(message)
  puts("=> #{message}")
end

def win?(player1, player2)
  BEATS[player1] == player2
end

def who_wins?(player, computer)
  if win?(player, computer)
    puts "You win!"
  elsif win?(computer, player)
    puts "Computer wins!"
  else
    puts "It's a tie!"
  end
end

loop do
  while true
    prompt("Choose one: #{MOVES.join(", ")}")
    choice = gets.chomp()

    break if MOVES.include?(choice)
    prompt("That's not a valid move.")
  end

  computer_choice = MOVES.sample
  puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  who_wins?(choice, computer_choice)

  prompt("Do you want to play again? (y/n)")
  answer = gets.chomp()
  break unless answer.downcase().start_with?("y")
end
