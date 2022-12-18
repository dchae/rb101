def add_name(arr, name)
  arr = arr + [name]
end

names = %w[bob kim]
add_name(names, "jim")
puts names
