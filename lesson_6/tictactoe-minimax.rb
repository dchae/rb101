# initialise constants
CELL_WIDTH = 7
CELL_HEIGHT = 3
HORIZONTAL_SEPARATOR = "#{["-" * CELL_WIDTH] * 3 * "+"}\n"
HORIZONTAL_SPACER = "#{[" " * CELL_WIDTH] * 3 * "|"}\n"
PLAYER_MARKER = "X"
CPU_MARKER = "O"

# init variables
score = { "Player" => 0, "Computer" => 0 }

# methods
def prompt(*msgs)
  msgs.each { |msg| puts "=> #{msg}" }
end

def joinor(arr, sep = ", ", pen = "or")
  case arr.length
  when 0
    ""
  when 1
    arr[0]
  when 2
    arr.join(" #{pen} ")
  else
    "#{arr[...-1].join(sep)}#{sep}#{pen} #{arr[-1]}"
  end
end

def initialise_board(numbered_squares = false)
  if numbered_squares
    (0..2).map { |row| (0..2).map { |col| (row * 3 + col).to_s } }
  else
    Array.new(3) { Array.new(3, " ") }
  end
end

def empty_squares(brd)
  brd.flatten.each_with_index.map { |v, i| i if v =~ /[^XO]/ }.compact
end

def rendered_rows(brd)
  (0..2)
    .map do |row|
      HORIZONTAL_SPACER * (CELL_HEIGHT / 2) +
        (0..2).map { |col| brd[row][col].center(CELL_WIDTH) }.join("|") + "\n" +
        HORIZONTAL_SPACER * (CELL_HEIGHT / 2)
    end
    .join(HORIZONTAL_SEPARATOR)
end

def display_board(brd, s)
  system("clear")
  puts "Score: \nPlayer (#{PLAYER_MARKER}): #{s["Player"]}. Computer (#{CPU_MARKER}): #{s["Computer"]}."
  puts "\n#{rendered_rows(brd)}"
end

# base case:
# no moves left:
# return -1, 0, 1 based on whether computer wins or not
# one move left:
# play the move and call method on itself

def get_best_move(brd, player)
  best_score = -Float::INFINITY
  best_move = nil
  empty_squares(brd).each do |square|
    exec_move(brd, square, CPU_MARKER)
    score = minimax(brd, "Player")
    exec_move(brd, square) # undo move
    if score > best_score
      best_score = score
      best_move = square
    end
  end
  return best_move
end

def minimax(brd, player)
  possible_moves = empty_squares(brd)
  if possible_moves.size < 1 || (winner = who_wins?(brd))
    if winner
      return winner == "Computer" ? 1 : -1
    else
      return 0
    end
  end

  scores = []
  possible_moves.each do |square|
    marker = player == "Computer" ? CPU_MARKER : PLAYER_MARKER
    exec_move(brd, square, marker)
    next_player = player == "Computer" ? "Player" : "Computer"
    scores << minimax(brd, next_player)
    exec_move(brd, square)
  end
  player == "Computer" ? scores.max : scores.min
end

def get_player_move(brd, player)
  if player == "Player"
    loop do
      empty = empty_squares(brd)
      prompt "Please select a square: (#{joinor(empty)})"
      move = gets.chomp.to_i
      return move if empty.include?(move)
      prompt "Not a valid move."
    end
  elsif player == "Computer"
    get_best_move(brd, player)
  end
end

def exec_move(brd, sq, marker = " ")
  row = sq / 3
  col = sq % 3
  brd[row][col] = marker
end

def winning_lines(brd)
  lines = []
  brd.each { |horizontal| lines << horizontal }
  3.times do |col|
    vertical = (0..2).map { |row| brd[row][col] }
    lines << vertical
  end
  lines << (0..2).map { |i| brd[i][i] }
  lines << (0..2).map { |i| brd[i][2 - i] }
end

def who_wins?(brd)
  winning_lines(brd).each do |line|
    return "Player" if line.all?(PLAYER_MARKER)
    return "Computer" if line.all?(CPU_MARKER)
  end
  nil
end

# main program
settings_set = false
loop do
  if !settings_set
    choice = nil
    loop do
      prompt("Who goes first? Player: (1), CPU: (2), Random (3)")
      choice = gets.chomp.to_i
      break if (1..3).include?(choice)
      prompt("Not a valid choice.")
    end
    cpu_first_move =
      case choice
      when 1
        false
      when 2
        true
      else
        [true, false].sample
      end
    settings_set = true
  end
  board = initialise_board
  winner = false
  while !(winner || empty_squares(board).empty?)
    display_board(board, score)
    if cpu_first_move
      cpu_move = 4
      exec_move(board, cpu_move, CPU_MARKER)
      display_board(board, score)
      cpu_first_move = false
    end
    player_move = get_player_move(board, "Player")
    exec_move(board, player_move, PLAYER_MARKER)
    winner = who_wins?(board)
    break if winner || empty_squares(board).empty?
    cpu_move = get_player_move(board, "Computer")
    exec_move(board, cpu_move, CPU_MARKER)
    winner = who_wins?(board)
  end

  score[winner] += 1 if winner

  display_board(board, score)
  if score.values.max < 5
    prompt(!winner ? "It's a tie!" : "#{winner} wins this round!")
  else
    prompt("#{score.max_by { |k, v| v }[0]} wins the game!")
    prompt("The final score was: ")
    puts("   #{score.map { |p, s| "#{p}: #{s}" }.join(", ")}")
    prompt("Play again? (y/n)")
    break unless gets.chomp.start_with?("y")
    score.clear
    next
  end

  prompt("Play next round? (y/n)")
  break unless gets.chomp.start_with?("y")
end
prompt("Goodbye!")
