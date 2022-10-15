# Problem 1
arr = %w[10 11 9 7 8]
# p arr.sort { |a, b| b.to_i <=> a.to_i }
# Problem 2
books = [
  {
    title: "One Hundred Years of Solitude",
    author: "Gabriel Garcia Marquez",
    published: "1967",
  },
  {
    title: "The Great Gatsby",
    author: "F. Scott Fitzgerald",
    published: "1925",
  },
  { title: "War and Peace", author: "Leo Tolstoy", published: "1869" },
  { title: "Ulysses", author: "James Joyce", published: "1922" },
]
# p books.sort_by { |book_hash| book_hash[:published].to_i }

# Problem 3
arr1 = ["a", "b", ["c", %w[d e f g]]]
p arr1[2][1][3]
arr2 = [{ first: %w[a b c], second: %w[d e f] }, { third: %w[g h i] }]
p arr2[1][:third][0]
arr3 = [["abc"], ["def"], { third: ["ghi"] }]
p arr3[2][:third][0][0]
hsh1 = { "a" => %w[d e], "b" => %w[f g], "c" => %w[h i] }
p hsh1["b"][1]
hsh2 = {
  first: {
    "d" => 3,
  },
  second: {
    "e" => 2,
    "f" => 1,
  },
  third: {
    "g" => 0,
  },
}
p hsh2[:third].keys[0]

# Problem 4
arr1 = [1, [2, 3], 4]

arr2 = [{ a: 1 }, { b: 2, c: [7, 6, 5], d: 4 }, 3]

hsh1 = { first: [1, 2, [3]] }

hsh2 = { ["a"] => { a: ["1", :two, 3], b: 4 }, "b" => 5 }

arr1[1][1] = 4
arr2[2] = 4
hsh1[:first][2][0] = 4
hsh2[["a"]][:a][2] = 4

p arr1
p arr2
p hsh1
p hsh2

# Problem 5
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

total_age_male =
  munsters
    .values
    .reduce(0) { |sum, v| v["gender"] == "male" ? (sum + v["age"]) : sum }
p total_age_male

# Problem 6
munsters.each { |k, d| puts "#{k} is a #{d["age"]}-year-old #{d["gender"]}" }

# Problem 7
# a = 2, b = [3, 8]
# The first element in arr points to the immutable integer object '2'.
# Therefore arr[0] += 2 is reassignment, not mutation and does not
# affect the object that 'a' points to.

# Problem 8
hsh = {
  first: %w[the quick],
  second: %w[brown fox],
  third: ["jumped"],
  fourth: %w[over the lazy dog],
}
# hsh.values.flatten.join.scan(/[aeiou]/i).each { |vowel| p vowel }
# OR
hsh.each do |k, v|
  v.each { |word| word.chars { |char| p char if char.match?(/[aeiou]/i) } }
end

# Problem 9
arr = [%w[b c a], [2, 1, 3], %w[blue black green]]
p arr.map { |subarray| subarray.sort { |a, b| b <=> a } }

# Problem 10
h_arr = [{ a: 1 }, { b: 2, c: 3 }, { d: 4, e: 5, f: 6 }]
p h_arr
p h_arr.map { |h| h.map { |k, v| [k, v + 1] }.to_h }

# Problem 11
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
p arr.map { |s_arr| s_arr.select { |x| x % 3 == 0 } }

# Problem 12
arr = [[:a, 1], %w[b two], ["sea", { c: 3 }], [{ a: 1, b: 2, c: 3, d: 4 }, "D"]]
p arr.each_with_object({}) { |sa, h| h[sa[0]] = sa[1] }

# Problem 13
arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]
p arr.sort_by { |sa| sa.select { |x| x.odd? } }

# Problem 14
hsh = {
  "grape" => {
    type: "fruit",
    colors: %w[red green],
    size: "small",
  },
  "carrot" => {
    type: "vegetable",
    colors: ["orange"],
    size: "medium",
  },
  "apple" => {
    type: "fruit",
    colors: %w[red green],
    size: "medium",
  },
  "apricot" => {
    type: "fruit",
    colors: ["orange"],
    size: "medium",
  },
  "marrow" => {
    type: "vegetable",
    colors: ["green"],
    size: "large",
  },
}
p hsh.map { |_, sh|
    sh[:type] == "fruit" ? sh[:colors].map(&:capitalize) : sh[:size].upcase
  }

# Problem 15
arr = [
  { a: [1, 2, 3] },
  { b: [2, 4, 6], c: [3, 6], d: [4] },
  { e: [8], f: [6, 10] },
]
p arr.select { |h| h.values.flatten.all? { |x| x.even? } }
# OR
p arr.select { |h| h.all? { |k, v| v.all? { |x| x.even? } } }

# Problem 16
# def gen_UUID()
#   pool = "0123456789abcdef".chars
#   [8, 4, 4, 4, 12].map { |len| pool.sample(len).join() }.join("-")
# end
# OR
# def gen_UUID()
#   [8, 4, 4, 4, 12].map do |len|
#       len.times.reduce("") { |s, i| s + rand(17).to_s(16) }
#     end
#     .join("-")
# end
# OR
require "securerandom"
def gen_UUID()
  SecureRandom.uuid
end

p gen_UUID
