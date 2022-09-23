str = "joe's favorite color is blue"
str.split.each { |word| str[str.index(word)] = str[str.index(word)].upcase! }
p str
