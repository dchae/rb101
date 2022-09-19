MSG = {
  loan: {
    prompt: "Enter loan amount: ",
    invalid_input: "Input must be an integer or decimal value."
  },
  apr: {
    prompt: "Enter Annual Percentage Rate (APR): ",
    invalid_input: "Input must be an integer or decimal value. E.g. 6% or 5.5%"
  },
  duration: {
    prompt: "Enter loan duration in months: ",
    invalid_input: "Input must be an integer value."
  }
}

def valid_int?(n)
  n == n.to_i.to_s
end

def valid_float?(n)
  n == n.to_f.to_s
end

def get_val(field)
  while true
    puts MSG[field][:prompt]
    val = gets.chomp
    break if valid_int?(val) || (field != :duration && valid_float?(val))
    puts "Not a valid input", MSG[field][:invalid_input]
  end
  val = val.to_f
end

# main loop
in_program = true
while in_program
  loan_amt = get_val(:loan)
  apr = get_val(:apr)
  duration = get_val(:duration)

  monthly_rate = apr * 0.01 / 12
  monthly_payment =
    loan_amt * (monthly_rate / (1 - (1 + monthly_rate)**(-duration)))
  monthly_payment = monthly_payment.round(2)
  puts "Your monthly payment is $#{sprintf("%.2f", monthly_payment)}."
  while true
    puts "Go again? (y/n)"
    command = gets.chomp.downcase
    case command
    when "y"
    when "n"
      in_program = false
      puts "Goodbye!"
    else
      puts "Not a valid command."
      next
    end
    break
  end
end
