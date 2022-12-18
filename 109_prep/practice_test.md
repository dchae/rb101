##### RB109 WA Practice

What does the code output? 
What are the return values?
Answer the why behind the output/return:
Focus only on the lines of code that deliver the output and return values.
Summarize what the problem demonstrates and why: i.e. "This problem demonstrates the concept of local variable scope/etc…"
This can be at the beginning or end of your answer - personal preference.


1. First the local variable `arr` is initialised and assigned to an array containing integers 1 through 10. Line 1 returns this array. Next, the select method is called on the `arr` local variable with a block. The block parameter is `n` and the return value of the block is the return value of the `odd?` method called on `n`. The return value of the second line is a new array containing the elements of `arr` for which `odd?` returns true, which would be `[1, 3, 5, 7, 9]`.

This problem demonstrates local variable instantiation and assignment, as well as the operation of the `Array#select` method.

2. First the local variable `arr` is initialised and assigned to an array containing integers 1 through 10. 
Then local variable `new_array` is initialised and assigned to the return value of `map` called on `arr`. `map` is called with a block, for which the block parameter is `n` and the return value is the boolean result of evaluating `n > 1`.
`Array#map` will return a new array containing the return values of the block for each respective element in `arr`. Since every element except for the first in `arr` is greater than 1, the array [false, true, true, true, true, true, true, true, true, true, true] will be assigned to new_array and returned for that line.
On the last line, the `p` method is called with `new_array` as an argument. 
"[false, true, true, true, true, true, true, true, true, true, true]" will be printed and new_array will be returned.

This problem demonstrates the operation of the map method which creates a new array with each respective element "mapped" to the return value of the block. It also demonstrates the `p` method, which prints and then returns its argument.

3. On the first line, the `Enumerable#all?` method is called on the Hash { a: "ant", b: "bear", c: "cat" }. Within the block (lines 1-3), the block parameters key, value are passed in. In this case, `key` will be the iterative keys of the hash (:a, :b, :c) and `value` will be the values ("ant", "bear", "cat"). The block returns the boolean return value of the expression value.length >= 3, which will be true if the length of the string assigned to `value` at the current iteration is equal to or greater than 3. 
The `all?` method returns false if the block return value is falsey for any value in the enumerable it was called on. Since all values in the hash have 3 or more characters, every block will return true and the call will also return true. 

This problem demonstrates the operation of the `Enumerable#all?` method, which iterates through an enumerable to see if all elements evaluate as true for some pattern.

4. On the first line, the `Enumerable#each_with_object` method is called on the same Hash from problem 3. The each_with_object method iterates through an enumerable, passing both the elements of the enumerable and the given object into the block within each iteration. In this case, we have passed in an empty Hash to our method call. We pass in each key, value pair to the block as `key` and `value`, and the empty hash as `hash`. Within the block, at line 2, each value of the original hash is being used as a key in the `hash` hash, and each key is being used as the value. In other words, we create a new hash for which each key, value pair in the original hash is flipped.
Upon completing iteration, each_with_object returns the object that was passed in as an argument. In this case it will return {"ant"=>:a, "bear"=>:b, "cat"=>:c}.

This problem demonstrates the operation of the `each_with_object()` method. Within the block, it can access both the elements of the enumerable it is called on as well as the object that was passed in as an argument.

5. On line 1, local variable `a` is initialised and assigned to an array containing integers [1, 2, 3, 3]. On line 2, local variable `b` is initialised and assigned to the same array that `a` is assigned to. On line 3, local variable `c` is initialised and assigned to the return value of the Array#uniq method called on `a`. Since `uniq` returns a new array with duplicate elements removed, `c` will be assigned to a different array with values [1, 2, 3]. If we had called `uniq!` instead of `uniq`, all three local variables would be assigned to the same original array object with values [1, 2, 3]. This is because `uniq!` mutates the array it is called on, then returns that same array, instead of creating and returning a new array.

This problem demonstrates the concept of variables as pointers and the difference between methods that mutate an object vs methods that return a new object. 

6. On line 1, the method `fix` is defined, taking a parameter `value`. On line 2, within the method definition, the element of value at index 1 is assigned to the string 'x'. On line 3, the local variable `value` is returned. On line 6, the local variable s is initialised and assigned to the string "abc". On line 7, the local variable `t` is initialised and assigned to the return value of the `fix` method called with `s` as an argument. Since `fix` will mutate its argument by reassigning the second element to 'x', then return the argument, `t` will be assigned to the string "axc". Since `[]=` is a mutating method, `s` will also be assigned to the same string. 

This problem demonstrates Ruby's pass by, specifically how it can act as pass by reference, since the method mutates and returns the original object passed into it, as opposed to a copy. It also demonstrates that the reassignment method `[]=` is mutating.

7. First, the local variable `a` is initialised and assigned to the string "hello". Then the method `a_method` is called with `a` passed in as an argument. Within the method definition of `a_method`, the method `<<` is called on `a` with the argument " world". The method will mutate `a` by concatenating the argument to `a`. The method will return the new value of `a`, which is now the string "hello world". The last line, which calls `p` with `a` passed in as an argument, will print that string. 

This problem also demonstrates Ruby acting as pass by reference. It also demonstrates that the `<<` method is mutating.

8. First, the local var `s` is initialised and assigned to the string "hello". Then the local variable `t` is initialised and assigned to the return value of the `fix` method. Within the method definition for `fix`, we see that it takes the parameter `value`, reassigns `value` to the return value of calling String#upcase! on `value`, then returns the return value of calling String#concat on value with the argument "!". The method call will return "HELLO!", and both `s` and `t` will be assigned to the same original string which now has the value "HELLO!", since both upcase! and concat are mutating methods.

This problem also demonstrates Ruby acting as pass by reference. It also demonstrates that the String#upcase! and concat methods are mutating. It also demonstrates that assigning a variable `x` to the return value of a mutating method which returns self called on `x` has no effect.

9. First local var `a` is initialised and assigned to the string "Hello". Then, local variable `b` is initialised and assigned to the return value of `a`, which is that same string. Then, `a` is reassigned to a new string "Goodbye". The last two lines call `puts` with the arguments `a` and `b` respectively, and will print their respective values, which are "Goodbye" and "Hello".

This problem demonstrates assignment in Ruby, `b = a` assigns `b` to the object that `a` is currently assigned to, not to `a` itself. 

10. On line 1, local variable `a` is initialised and assigned to string "hello". On line 3, the map method is called on the array [1, 2, 3], with a block. Within the block, `num` is passed in as a block parameter, but is not used. The block returns `a`. The `map` method call will return a new three element array, where each element is the object that `a` is assigned to: ["hello", "hello", "hello"].

This problem demonstrates local variable scope in Ruby, namely that a block can access (but not reassign) local variables declared outside of its scope. It also demonstrates the operation of the `map` method. 

11. On line 1, the `each` method is called on the integer array, and the block parameter `num` is passed into the do..end block spanning lines 1-3. Within the block, the `puts` method is called with `num` as an argument. Each call to the block will print `num` (a successive element of the integer array) and return nil. The `each` method itself will return self, the integer array [1, 2, 3].

This problem demonstrates iteration through an array with the `each` method, and outputting elements with the `puts` method. 

12. On line 1, local variable `arr` is initialised and assigned to an integer array. On line 3, the local variable `incremented` is initialised and assigned to the return value of `map` called with a block spanning lines 3-5. The local variable `n` is passed into the block, and each call to the block will return `n + 1`. Since map returns a new array containing the return values for each block call, `incremented` will be assigned to the new array [2, 3, 4, 5, 6, 7, 8, 9, 10, 11]. On the last line `p` is called with `incremented` as an argument, which will output, then return the array that `incremented` is assigned to.

This problem demonstrates the operation of `Array#map` method, and the `p` method.

13. On line 1, local variable a is initialised and assigned to the int 4. On line 3, the `loop` method is called with a do..end block spanning lines 3-8. Within the block, `a` is reassigned to 5, then local variable `b` is initialised and assigned to int 3 within the inner scope of the block. On line 7, the break keyword halts the execution of the block and we exit the loop. On lines 10 and 11, `puts` is called with arguments `a` and `b` respectively. Line 10 outputs the new value of `a`, which is 5. Line 11 will raise a NameError, since `b` was initialised within the inner scope of the block, it cannot be accessed outside of the block. 

This problem demonstrates variable scope in Ruby; namely that variables initialised outside of a block can be accessed and reassigned within a block, but not the other way around.

14. On line 1, local variable `a` is initialised and assigned to the string "Bob". On line 3, the `times` method is called on the integer 5, passing the local variable `x` as a block parameter into the blcok spanning lines 3-5. Within the block, a is reassigned to the string "Bill". On line 7, `p` is called with argument `a`, printing and returning the value of `a` which is now "Bill".

This problem demonstrates variable scope in Ruby; showing how variables initialised outside of a block can be accessed and reassigned within the inner scope of a block.

15. On line 5, local variable `y` is initialised and assigned to the string "a". On line 6, the method `increment` is called with the argument `y`. On line 1, `increment` is defined, taking parameter `x`. On line 2, `<<` is called on x with argument string "b". `increment` returns the return value of that method call. After line 6, the value of `y` is "ab", which is what is returned by line 6 and outputted by the `puts` call on line 8.

This problem demonstrates Ruby's pass by, namely how it can act as pass by reference and mutate objects passed into a function. 

16. On line 1, local variable `arr1` is initialised and assigned to an array of strings. On line 2, the local variable `arr2` is initialised and assigned to the return value of arr1.dup, which will be a shallow copy of `arr1`, namely a new array object containing the same element objects. On line 3, `map!` is called on `arr2`, with a block spanning lines 3-5. Within the block, each element of the array is passed in as block parameter `char`. Each block call returns the return value of calling String#upcase on `char`. `map!` mutates then returns the array it is called on, so each string in `arr2` will not be upcased. Since upcase does not mutate its caller, but returns a new string, `arr1` is not changed. Lines 7 and 8 will print each element in `arr1` and `arr2` respectively, where `arr1 = ["a", "b", "c"], arr2 = ["A", "B", "C"]`. 

This problem demonstrates the notion of a shallow copy, here achieved by calling the `dup` method. It is shown that the copied array is distinct since the mutative `map!` call does not affect the original array that was copied. 

17. On line 1, local variable `arr` is initialised and assigned to an integer array. On line 3 and 4, local variables `counter` and `sum`, respectively, are initialised and assigned to 0. On line 6, `loop` method is called with a block spanning lines 6-10. Within the block, on line 7, `sum` is incremented by the value of the element of `arr` at index `counter`. On line 8, `counter` is incremented by 1. On line 9, the break keyword is invoked conditionally, such that we will exit the loop if the value of `counter` is equal to the size of the `arr` array. 
The loop will iterate through each element of the array, then break. By the end of the iteration, sum will be equal to the sum of all elements in the array.

On line 12, `puts` is called with an interpolated string, taking the `sum` variable. The output will be "Your total is 10", and the return value will be `nil`.

This problem demonstrates iteration through an array, the operation of a do..while loop, and string interpolation.

18. On line 1, local variable `arr` is initialised and assigned to an array containing integers 1 through 10. On line 3, local variable `new_array` is initialised and assigned to the return value of calling `Array#select` on `arr`. Local variable `n` is passed into the block as a parameter, and each block call will return `n + 1`. Since `n + 1` will be truthy for all values of `arr`, the `select` method call will just return a shallow copy of `arr1`, which will then be assigned to the `new_array` variable. 
On line 6, `p` is called with argument `new_array`, which will both output and return the value of new_array, which is [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].

This problem demonstrates truthiness in Ruby, namely that all values except for `false` and `nil` are truthy and evaluate as true in boolean expressions.

19. On line 1, the `any?` method is called on the array `[1, 2, 3]` with a block spanning lines 1-3. Given the block parameter `num`, each block call returns the result of the boolean expression `num > 2`. Since the expression evaluates as true for at least one block call, namely the last call in which `num == 3`, `any?` will return true. 

This problem demonstrates the operation of the `any?` method which returns true if any element in the enumerable meets the given criterion.

20. On line 7, local variable `s` is initialised and assigned to the string "hello". On line 8, local variable `t` is initialised and assigned to the return value of calling the method `fix` with argument `s`. Within the method definition spanning lines 1-5, the string "hello" is passed in as the local variable argument `value`. On line 2, the `upcase!` method is called on `value`. At this point, since `upcase!` is mutating, `value` and `s` both point to the same string object which is now "HELLO". On line 3, the `+=` method is called on value with string argument "!". At this point `value` points to a new string object "HELLO!", while `s` points to the original string object "HELLO". On line 4, `value` is returned and then assigned to `t` on line 8. At the end of the execution of this code, the value of `s` is "HELLO" and the value of `t` is "HELLO!". 

This problem demonstrates Ruby's pass by, namely how it can act as pass by reference. The string object "hello" was mutated after being passed into the function. It also demonstrates that while methods like `upcase!` are mutating, methods like `+=` are not. The `+=` method is shorthand for `x = x + y`, and is therefore reassignment. 

21. On lines 1 and 2, local variables `a` and `b` are assigned to the integers 4 and 2, respectively. On line 4, `loop` is called with a block spanning lines 4-8. Within the inner scope of the block, on line 5, the local variable `c` is initialised and assigned to the integer 3. On line 6, the local variable `a` is reassigned to the value of `c`. On line 7, the break keyword is invoked to exit the loop. On line 10, `puts` is called with argument `a`, which will output 3 and return `nil`. On line 11, `puts` is called with argument `b` which will output 2 and return `nil`. 

This problem demonstrates variable scope in Ruby. Within the inner scope of a block, variables initialised in the outer scope can be accessed and reassigned. It also demonstrates the concept of variables as pointers. `a` is reassigned to `c` on line 6, but there is no error when accessing `a` on line 10, even though `c` cannot be accessed from outside the block. This is because `a` is actually reassigned to the value which `c` points to. 

22. On line 1, local variable `a` is initialised and assigned to an array of strings. On line 2, the element at index 1 in `a` is reassigned to the string "-", mutating `a`. On line 3, `p` is called with `a` as an argument, which will both print and return `a`: ["a", "-", "c"].

This problem demonstrates that although the `[]=` looks like assignment, it is mutating respective to the object it is called on.

23. On line 5, local variable `names` is initialised and assigned to the array of strings ['bob', 'kim']. On line 6, the method `add_names` is called with the arguments `names` and "jim". On line 1, the `add_name` method is defined with parameters `arr` and `name`. On line 2, `arr` is reassigned within the scope of the method definition to the return value of calling `+` on `arr` with argument `[name]`, which will return a new array containing all elements of `arr` plus `name`. This new array is then returned, therefore line 6 will return ['bob', 'kim', 'jim'].
On line 7, `puts` is called with argument `names`. Since the array object that `names` points to was never mutated, line 7 will output "bob", then "kim".

This problem demonstrates variable scope in Ruby, namely that method definitions create a new inner scope within which reassignment will not be reflected in the outer scope. 