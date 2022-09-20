require "yaml"

OPMESSAGE = { a: "Adding", s: "Subtracting", m: "Multiplying", d: "Dividing" }
MESSAGES = YAML.load_file("calculator_messages.yml")

def prompt(*messages)
  messages.each { |message| puts("=> #{message}") }
end

def number?(n)
  if n == n.to_i.to_s
    n.to_i
  elsif n == n.to_f.to_s
    n.to_f
  else
    false
  end
end

def get_number(nth = "first")
  while true
    prompt "Input the #{nth} number: "
    x = number?(gets.chomp)
    break if x
    prompt MESSAGES["invalid_"] + "input"
  end
  x
end

def get_result(x, y)
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
        if y != 0
          x / y.to_f
        else
          prompt MESSAGES["zero_div_error"], MESSAGES["help"]
          next
        end
      else
        prompt MESSAGES["invalid_"] + "operation", MESSAGES["help"]
        next
      end
    break
  end
  [res, op]
end

def get_name
  name = ""
  loop do
    prompt(MESSAGES["welcome"])
    name = gets.chomp
    break if !name.empty?
    prompt(MESSAGES["invalid_"] + "name")
  end
  name
end

name = get_name

# main loop
in_program = true
while in_program
  prompt("Hi #{name}!")
  a = get_number
  b = get_number("second")

  prompt(MESSAGES["help"])

  res_op = get_result(a, b)
  res = res_op[0]
  op = res_op[1]
  prompt("#{OPMESSAGE[op.to_sym]} the two numbers...")
  prompt "The result is #{res == res.to_i ? res.to_i : res}"

  loop do
    prompt("Go again? (y/n)")
    command = gets.chomp.downcase
    case command
    when "y"
      break
    when "n"
      prompt(MESSAGES["quit"])
      in_program = false
      break
    else
      prompt(MESSAGES["invalid_"] + "command")
    end
  end
end
