a method that returns the sum of two integers
```
START
DEFINE method that takes two integer arguments: a, b
  RETURN a + b
END
```
a method that takes an array of strings, and returns a string that is all those strings concatenated together
```
START
DEFINE method that takes an array of strings: arr
SET res = ""
FOR string in arr
  add string to res
RETURN res
END
```
a method that takes an array of integers, and returns a new array with every other element from the original array, starting with the first element.
```
START
DEFINE method that takes array of int: arr
  SET res = []
  SET i = 0
  WHILE i < length of arr
    PUSH ith element of arr to res
    SET i = i + 2
  RETURN res
END
```
a method that determines the index of the 3rd occurrence of a given character in a string. For instance, if the given character is 'x' and the string is 'axbxcdxex', the method should return 6 (the index of the 3rd 'x'). If the given character does not occur at least 3 times, return nil.
```
START
DEFINE method that takes two string arguments: string, char
  SET count = 0
  SET i = 0
  WHILE i < length of string
    if string[i] == char
      count += 1
    if count == 3
      RETURN i
    i += 1
  RETURN nil
END
```

a method that takes two arrays of numbers and returns the result of merging the arrays. The elements of the first array should become the elements at the even indexes of the returned array, while the elements of the second array should become the elements at the odd indexes.

high level pseudo-code:
```
- initialise empty result array
- set iterator to 0
- iterate from 0 to last index in array
  - push element at index of arr 1 to result array
  - push element at index of arr 2 to result array
- return result array
```

formal pseudo-code:
```
START
DEFINE method that takes two arrays as args: arr1, arr2
  SET res = []
  SET i = 0
  WHILE i < length of arr1
    PUSH arr1[i] to res
    PUSH arr2[i] to res
    i += 1
  RETURN res
END
```
    