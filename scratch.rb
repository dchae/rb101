require "pry"
require "debug"
hsh = {
  first: %w[the quick],
  second: %w[brown fox],
  third: ["jumped"],
  fourth: %w[over the lazy dog],
}
# hsh.values.flatten.join.scan(/[aeiou]/i).each { |vowel| p vowel }
# OR
hsh.each do |k, v|
  v.each do |word|
    word.chars do |char|
      binding.b
      p char if char.match?(/[aeiou]/i)
    end
  end
end
