x = "some other important value"
p "Starting value of x: #{x}"

# for x in (0..10)
#   x = x*x
#   p x
# end


(0..10).each { |x| x = x*x; p x }

p "End value of x: #{x}"