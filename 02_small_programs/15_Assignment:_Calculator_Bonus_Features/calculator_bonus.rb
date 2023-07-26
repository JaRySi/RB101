=begin
1: We can use (num.to_i.to_s == num) for validation.

2: We can use .to_f instead of .to_i. (Float instead of integer conversion)
I also converted from .to_i to .to_f inside the operator case, so decimals
can be used with all operations.

3: We can saved the return value of the case to a variable.
We then put that variable at the last line of the case.

4: I had no idea how to do this, but I did it after looking at the solution.

5: That was cool!
=end

def prompt(message)
  puts "=> #{message}"
end

def float?(num)
  num.to_f.to_s == num
end

def integer?(num)
  num.to_i.to_s == num
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def operation_to_message(op)
  test = case op
         when '1'
           'Adding'
         when '2'
           'Subtracting'
         when '3'
           'Multiplying'
         when '4'
           'Dividing'
         end

  test
end

prompt 'Welcome to Calculator! Enter your name:'

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt 'Make sure to use a valid name.'
  else
    break
  end
end

prompt "Hi #{name}!"

loop do # Main loop
  number1 = ''
  loop do
    prompt "What's the first number?"
    number1 = gets.chomp

    if valid_number? number1
      break
    else
      prompt "That's not a valid number."
    end
  end

  number2 = ''
  loop do
    prompt "What's the second number?"
    number2 = gets.chomp

    if valid_number? number2
      break
    else
      prompt "That's not a valid number."
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) Addition
    2) Subtraction
    3) Multiplication
    4) Division
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include? operator
      break
    else
      prompt 'Must choose 1, 2, 3 or 4'
    end
  end

  prompt "#{operation_to_message(operator)} the two numbers..."

  result = case operator
           when '1'
             number1.to_f + number2.to_f
           when '2'
             number1.to_f - number2.to_f
           when '3'
             number1.to_f * number2.to_f
           when '4'
             number1.to_f / number2.to_f
           end

  prompt "The result is #{result}!"

  prompt 'Do you want to perform another calculation? (Y to calculate again)'
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt 'Bye bye.'
