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

# Problem 2
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
