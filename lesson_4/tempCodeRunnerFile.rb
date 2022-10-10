
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
def categorise(age)
  age < 64 ? (age < 18 ? "kid" : "adult") : "senior"
munsters.each { |k,v| v["age_group"] = categorise(v["age"])}
