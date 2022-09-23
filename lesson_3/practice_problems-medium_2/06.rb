# def color_valid(color)
#   color == "blue" || color == "green"
# end

# OR

def color_valid(color)
  %w[blue green].include?(color)
end

p color_valid("blue")
