# 1
flintstones = %w[Fred Barney Wilma Betty Pebbles BamBam]
p flintstones.each_with_index.to_h { |v, i| [v, i] }
# OR
p flintstones.each_with_index.each_with_object({}) { |(v, i), h| h[v] = i }

# 2
ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 5843,
  "Eddie" => 10,
  "Marilyn" => 22,
  "Spot" => 237,
}
p ages.values.sum
# OR
ages_sum = 0
ages.each { |_, v| ages_sum += v }
p ages_sum

# 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# ages.delete_if { |k, v| v >= 100 }
# OR
# ages.select! { |k, v| v <= 100 }
# OR
ages.each { |k, v| ages.delete(k) if v >= 100 } # Feels dirty to delete elements from collection while iterating through it though.
p ages

# 4
ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 5843,
  "Eddie" => 10,
  "Marilyn" => 22,
  "Spot" => 237,
}
p ages.values.min

# 5
flintstones = %w[Fred Barney Wilma Betty BamBam Pebbles]
i = 0
while i < flintstones.length
  break if flintstones[i][0..1] == "Be"
  i += 1
end
p i >= flintstones.length ? nil : i
# OR
p flintstones.index { |v| v.start_with?("Be") }

# 6
p flintstones.map { |v| v[...3] }

# 7
statement = "The Flintstones Rock"
counter = Hash.new(0)
statement.chars.each { |c| counter[c] += 1 if c != " " }
p counter

# 8
# Will output:
#  1
#  3
# Won't throw IndexError, Ruby evaluates ary length at every iteration

# Will output:
#  1
#  2

# 9

def titleize(s)
  s.split.map { |word| word.capitalize }.join(" ")
end
words = "the flintstones rock"
p titleize(words)

# 10
munsters = {
  "Herman" => {
    "age" => 32,
    "gender" => "male",
  },
  "Lily" => {
    "age" => 30,
    "gender" => "female",
  },
  "Grandpa" => {
    "age" => 402,
    "gender" => "male",
  },
  "Eddie" => {
    "age" => 10,
    "gender" => "male",
  },
  "Marilyn" => {
    "age" => 23,
    "gender" => "female",
  },
}

munsters.each do |k, v|
  v["age_group"] = v["age"] < 64 ? (v["age"] < 18 ? "kid" : "adult") : "senior"
end
puts munsters
