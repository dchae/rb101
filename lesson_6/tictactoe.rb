# initialise constants
CELL_WIDTH = 7
CELL_HEIGHT = 3
HORIZONTAL_SEPARATOR = "#{["-" * CELL_WIDTH] * 3 * "+"}\n"
HORIZONTAL_SPACER = "#{[" " * CELL_WIDTH] * 3 * "|"}\n"
PLAYER_MARKER = "X"
CPU_MARKER = "O"

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

def rendered_row(brd)
  (0..2)
    .map do |row|
      HORIZONTAL_SPACER * (CELL_HEIGHT / 2) +
        (0..2).map { |col| brd[row][col].center(CELL_WIDTH) }.join("|") + "\n" +
        HORIZONTAL_SPACER * (CELL_HEIGHT / 2)
    end
    .join(HORIZONTAL_SEPARATOR)
end

def display_board(brd)
  system("clear")
  puts "You are #{PLAYER_MARKER}. Computer is #{CPU_MARKER}"
  puts "\n#{rendered_row(brd)}"
end

def get_player_move(brd)
  loop do
    empty = empty_squares(brd)
    prompt "Please select a square: (#{joinor(empty)})"
    move = gets.chomp.to_i
    return move if empty.include?(move)
    prompt "Not a valid move."
  end
end

def exec_move(brd, sq, marker)
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

def winner(brd)
  winning_lines(brd).each do |line|
    return "Player" if line.all?(PLAYER_MARKER)
    return "Computer" if line.all?(CPU_MARKER)
  end
  nil
end

# main program
loop do
  board = initialise_board
  winner = false
  while !(winner || empty_squares(board).empty?)
    display_board(board)
    player_move = get_player_move(board)
    exec_move(board, player_move, PLAYER_MARKER)
    winner = winner(board)
    break if winner || empty_squares(board).empty?
    cpu_move = empty_squares(board).sample
    exec_move(board, cpu_move, CPU_MARKER)
    winner = winner(board)
  end

  display_board(board)
  prompt(!winner ? "It's a tie!" : "#{winner} wins!")
  prompt("Play again? (y/n)")
  break unless gets.chomp.start_with?("y")
end
prompt("Goodbye!")
