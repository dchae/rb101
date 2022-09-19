MOVES = %w[rock paper scissors]

def prompt(message)
  puts("=> #{message}")
end

def who_wins?(player, computer)
  if (player == "rock" && computer == "scissors") ||
       (player == "paper" && computer == "rock") ||
       (player == "scissors" && computer == "paper")
    prompt("You won!")
  elsif (player == "rock" && computer == "paper") ||
        (player == "paper" && computer == "scissors") ||
        (player == "scissors" && computer == "rock")
    prompt("Computer won!")
  else
    prompt("It's a tie!")
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

  computer_move = MOVES.sample

  puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  who_wins?(choice, computer_move)

  prompt("Do you want to play again? (y/n)")
  answer = gets.chomp()
  break unless answer.downcase().start_with?("y")
end
