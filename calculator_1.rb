# get input from user (two numbers)
# get operation from user
# perform operation on two numbers
# output result

def prompt(*messages)
  messages.each { |message| puts("=> #{message}") }
end

def get_number(nth = "first")
  while true
    prompt "Input the #{nth} number: "
    x = gets.chomp
    if x == x.to_i.to_s
      x = x.to_i
      break
    elsif x == x.to_f.to_s
      x = x.to_f
      break
    else
      prompt "Not a valid input."
    end
  end
  return x
end

def get_result(x, y, help)
  while true
    op = gets.chomp.downcase
    res =
      case op
      when "a"
        x + y
      when "s"
        x - y
      when "m"
        x * y
      when "d"
        x / y.to_f
      else
        prompt "Not a valid operation", help
        next
      end
    break
  end
  return res, op
end

opmessage = { a: "Adding", s: "Subtracting", m: "Multiplying", d: "Dividing" }

help = <<-MSG
Enter operation:
  add      (a)
  subtract (s)
  multiply (m)
  divide   (d)
MSG

name = ""
loop do
  prompt("Welcome to Calculator! Enter your name: ")
  name = gets.chomp
  if name.empty?
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

in_program = true
while in_program
  prompt("Hi #{name}!")
  a = get_number
  b = get_number("second")

  prompt(help)

  res_op = get_result(a, b, help)
  res = res_op[0]
  op = res_op[1]
  prompt("#{opmessage[op.to_sym]} the two numbers...")
  prompt "The result is #{res == res.to_i ? res.to_i : res}"

  loop do
    prompt("Go again? (y/n)")
    command = gets.chomp.downcase
    case command
    when "y"
      break
    when "n"
      prompt("Goodbye!")
      in_program = false
      break
    else
      prompt("Not a valid command")
    end
  end
end
