#### Example 3

`map` is being called with a block on a two-dimensional outer array. Each nested subarray is passed into the block as an argument. Within the block, the first element of each subarray is printed, then returned as the return value of the block to be used in the map transformation. This code will print the first element of each subarray `1, 3` and return a new array `[1, 3]`.

| Line | Action                | Object                    | Side Effect                             | Return Value              | Is Return Value Used?                        |
| ---- | --------------------- | ------------------------- | --------------------------------------- | ------------------------- | -------------------------------------------- |
| 1    | method call (`map`)   | outer array               | none                                    | new array                 | No                                           |
| 1-4  | block execution       | each subarray             | none                                    | first element of subarray | yes, used by map for transformation          |
| 2    | method call (`first`) | each subarray             | None                                    | first element of subarray | yes, used by `puts`                          |
| 2    | method call (`puts`)  | first element of subarray | Outputs string representation of an Int | `nil`                     | No                                           |
| 3    | method call (`first`) | each subarray             | None                                    | first element of subarray | yes, used to determine return value of block |


#### Example 4
Variable `my_arr` is assigned to the return value of the outer `each` method. 

Each subarray is passed in as an argument to the outer `each` method block. Within that block, each element of the subarray is passed in as an argument to the inner `each` method block. Within the inner block, the element is printed if it is greater than 5. 

Since the `each` method returns `self`, and no modifications are made to the outer array, `my_arr` will reference the array that the outer `each` method is called on (`[[18, 7], [3, 12]]`). Elements `18, 7, 12` will be printed.

#### Example 5
Return value will be return value of `map` called on outer array `[[1, 2], [3, 4]]`. Return value of `map` will be array of return values of block for each subarray. Return values of block for each subarray will be return value of `map` called on subarray. Return value of `map` called on each subarray will be array of return values of block for each element. Return values of block for each element will be `element * 2`. 
Inner map will return `[2, 4]` for first subarray, and `[6, 8]` for second subarray. 
Outer map will return `[[2, 4], [6, 8]]`

#### Example 6
Return value will be return value of `select` called on outer array of hashes; i.e., new array containing elements for which block returns truthy.
Each hash element is passed into `select` block as argument.
`all?` method is called on each hash element, passing in each key-value pair within the hash to the `all?` block. 
`all?` returns false if any block iteration returns false. 
The block checks if the first letter in the value equals the string representation of the key. 
Since the first hash element contains a key-value pair for which this block returns false, the first hash element is not selected.
The second hash element does not contain such a key-value pair, so it is selected.
The return value is a new array containing only the second hash element: `[{ c: 'cat' }]`

FE: 
If we used `any?` instead of `all?`, select would return all hash elements that contain a key-value pair for which the first element of the value == the string rep of the key. Since both hash elements in the input array contain such key-value pairs, a copy of the original array would be returned.

#### Example 7

```rb
arr = [%w[2, 1], %w[1 8 11], %w[2 6 13], %w[2 12 15], %w[1 8 9]]
p arr.sort_by { |subarray| subarray.map { |e| e.to_i } }
```

#### Example 8
```rb
arr = [[8, 13, 27], %w[apple banana cantaloupe]]
arr.map { |s| s.select { |x| x.to_s.to_i == x ? x > 13 : x.size < 6 } }

# different (probably slower) way to do this
arr
  .flatten
  .select do |x|
    (x.is_a?(Integer) && x > 13) | (x.is_a?(String) && x.length < 6)
  end
  .partition { |x| x.is_a?(Integer) }
```

#### Example 9
We call map on this array:
```
[
  [[1], [2], [3], [4]], 
  [['a'], ['b'], ['c']],
]
```
for each element in the outer array, we call each, which returns the same element.
Since no methods within the `map` block mutate the original array, we return a copy of the original array.

#### Example 10
We call map on the outer array `[[[1, 2], [3, 4]], [5, 6]]`.
We call map on each subarray.
For each element in the subarray,
if the element is an integer, 
we return element + 1 in the block
else (if the element is another subarray)
we call map on the subarray
for each element in the subarray
we return element + 1 in the block.
each subarray returns its incremented copy to the map block below it in the stack until the outer array is returned.
`# => [[[2, 3], [4, 5]], [6, 7]]`


