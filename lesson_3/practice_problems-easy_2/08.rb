advice =
  "Few things in life are as important as house training your pet dinosaur."
p advice.slice!(..38)
p advice

# advice.slice(..38) would return the same without mutating advice

# SOLUTION
advice =
  "Few things in life are as important as house training your pet dinosaur."
p advice.slice!(0, advice.index("house"))
p advice
