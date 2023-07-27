require "pry"

def float?(num)
  num.to_f.to_s == num
end

def integer?(num)
  num.to_i.to_s == num
end

def valid_number?(num)
  integer?(num) || float?(num)
end

total_loan = ''
loop do
  puts "What is the total amount of the loan? (Use numbers, not words.)"
  total_loan = gets.chomp
  total_loan.tr!(',', '')

  if valid_number? total_loan
    break
  else
    puts "That's not a valid number."
  end
end

puts <<-MSG
Is the duration of the loan in:
1) Years
2) Months
MSG

duration_years_or_months = ''
loop do
  duration_years_or_months = gets.chomp

  if %w(1 2).include? duration_years_or_months
    break
  else
    puts 'Must choose 1 or 2.'
  end
end

loan_duration = ''
loop do
  puts "What is the duration of the loan? (Use numbers, not words.)"
  loan_duration = gets.chomp

  if valid_number? loan_duration
    break
  else
    puts "That's not a valid number."
  end
end

if duration_years_or_months == '1'
  loan_duration = loan_duration.to_i
  loan_duration *= 12
end

interest_rate = ''
loop do
  puts "What is the interest rate?"
  interest_rate = gets.chomp
  interest_rate.tr!('%', '')

  if valid_number? interest_rate
    break
  else
    puts "That's not a valid number."
  end
end

interest_rate = interest_rate.to_f / 100
interest_rate /= 12

monthly_payment = total_loan.to_f * (interest_rate / (1 - (
                  (1 + interest_rate)**(-loan_duration.to_i))))

puts "Your monthly payment is $#{monthly_payment}"
