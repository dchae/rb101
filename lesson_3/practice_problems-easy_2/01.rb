ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.include?("Spot")

p !!ages["Spot"]

begin
  p ages.fetch("Spot")
rescue KeyError
  p false
end

# SOLUTION

p ages.key?("Spot")
p ages.member?("Spot")
