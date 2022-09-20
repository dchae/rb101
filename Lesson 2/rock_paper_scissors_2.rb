MOVES = %w[rock paper scissors]
BEATS = { "rock" => "scissors", "paper" => "rock", "scissors" => "paper" }

def prompt(message)
  puts("=> #{message}")
end

def who_wins?(player, computer)
  if BEATS[player] == computer
    puts "You win!"
  elsif BEATS[computer] == player
    puts "Computer wins!"
  else
    puts "It's a tie!"
  end
end

while true
  while true
    prompt("Choose one: #{MOVES.join(", ")}")
    choice = gets.chomp()

    if MOVES.include?(choice)
      break
    else
      prompt("That's not a valid move.")
    end
  end

  computer_choice = MOVES.sample

  puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  who_wins?(choice, computer_choice)

  prompt("Do you want to play again? (y/n)")
  answer = gets.chomp()
  break unless answer.downcase().start_with?("y")
end
