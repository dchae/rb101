def joinor(arr, sep = ", ", pen = "or")
  case arr.length
  when 1
    "#{arr[0]}"
  when 2
    arr.join(" #{pen} ")
  else
    "#{arr[...-1].join(sep)}#{sep}#{pen} #{arr[-1]}"
  end
end
p joinor([1, 2]) # => "1 or 2"
p joinor([1, 2, 3]) # => "1, 2, or 3"
p joinor([1, 2, 3], "; ") # => "1; 2; or 3"
p joinor([1, 2, 3], ", ", "and") # => "1, 2, and 3"