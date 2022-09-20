#### Practice Problems: Easy 1

1. arr#uniq does not mutate caller
```
OUTPUT:
1 
2
2
3
``` 
2. As a conditional operator `!` before a bool is boolean not. `?` in a ternary operator is boolean if. In syntax convention, `!` after a method usually means it is destructive and `?` usually means it returns a boolean value.
   1. `!=` means 'not equal'; e.g., `1 != 2`
   2. `!user_name` means not (the opposite of) the truthy value of `user_name`.
   3. `words.uniq!` means call the destructive version of the uniq method on words. Will mutate and return self (without repeated values).
   4. `?` before something usually signals a ternary operator. e.g. `a = 1 == 1 ? "true" : "not true"`
   5. `?` after a method signals that the method will return a bool value. e.g. `3.odd? #=> true`
   6. `!!` is not not, acts as a conversion to boolean value.
3. ```ruby
    advice = "Few things in life are as important as house training your pet dinosaur."
    advice.sub!("important", "urgent")
    ```
4. `numbers.delete_at(1)` will delete the element at index 1 (numbers[1]).
`numbers.delete(1)` will delete all occurences of 1 in numbers.
5. ```ruby
   num = 42
   p (10..100).include? num
   # SOLUTION NOTES
   # range#cover? is more efficient, 
   # checks value comparisons between endpoints of range.
   p (10..100).cover? num
   ```
6. ```ruby
   famous_words = "seven years ago..."
   famous_words = "Four score and " + famous_words
   # OR
   famous_words.insert(0, "Four score and ")
   ```
7. `flintstones.flatten!`
8. ```ruby
   flintstones = flintstones.select! { |k, _| k == "Barney" }.flatten
   # OR 
   flintstones = flintstones.assoc("Barney")
   # OR
   flintstones = ["Barney", flintstones["Barney"]]
   ```
