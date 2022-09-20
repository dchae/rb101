# get input from user (two numbers)
# get operation from user
# perform operation on two numbers
# output result

puts("Welcome to Calculator!")

def get_number(nth = "first")
  while true
    puts ">> Input the #{nth} number: "
    x = gets.chomp
    if x == x.to_i.to_s
      x = x.to_i
      break
    elsif x == x.to_f.to_s
      x = x.to_f
      break
    else
      puts "Not a valid input."
    end
  end
  return x
end

a = get_number
b = get_number("second")

puts HELP = ">> Enter operation (add, sub, mul, div): "

while true
  op = gets.chomp.downcase
  case op
  when "add"
    res = a + b
  when "sub"
    res = a - b
  when "mul"
    res = a * b
  when "div"
    res = a / b.to_f
  else
    puts "Not a valid operation", HELP
    next
  end
  break
end

puts "The result is #{res == res.to_i ? res.to_i : res}"
