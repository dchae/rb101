# Naive algebraic solution
def rowsum(row)
  i = 1
  firstnum = 2
  while i < row
    firstnum += i * 2
    i += 1
  end
  res = 0
  row.times do |x|
    res += firstnum
    firstnum += 2
  end
  res
end

# def rowsum(row)
#   (firstnum = ((1 + 0.upto(row - 1).reduce(&:+)) * 2)).step(
#     firstnum + 2 * (row - 1),
#     2,
#   ).sum
# end

# def rowsum(row)
#   lastnum = row * (row + 1)
#   firstnum = lastnum - (row - 1) * 2
#   (firstnum + lastnum) * row / 2 + (firstnum + lastnum) * row % 2
# end

# Algebraic solution
# def rowsum(row)
#   doublesum = 2 * row * (row**2 + 1)
#   doublesum / 2 + doublesum % 2
# end

p rowsum(1)
p rowsum(2)
p rowsum(3)
p rowsum(4)
p rowsum(5)
p rowsum(6)

# 1: 2
# 2: 4, 6
# 3: 8, 10, 12
# 4: 14, 16, 18, 20
# 5: 22, 24, 26, 28, 30
# 6: 32, 34, 36, 38, 40, 42

# OUTPUT:
# 2
# 10
# 30
# 68
# 130
# 222
