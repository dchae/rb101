def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors(12)

# Bonus 1:
# The purpose of the number % divisor == 0 is to check if the
# number being tested is cleanly divisible by divisor.

# Bonus 2:
# The purpose of line 8 is to make the function return the factors array.
