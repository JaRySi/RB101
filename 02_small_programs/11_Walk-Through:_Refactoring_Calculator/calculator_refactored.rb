# Ask the user for two numbers.
# Ask the user for an operation to perform.
# Perform the operation on the two numbers.
# Output the result.

# answer = Kernel.gets()
# Kernel.puts(answer)
def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i.to_s == num
end

def operation_to_message(op)
  case op
  when '1'
    return 'Adding'
  when '2'
    return 'Subtracting'
  when '3'
    return 'Multiplying'
  when '4'
    return 'Dividing'
  end

  puts 'test'
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
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt("That's not a valid number.")
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
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('Must choose 1, 2, 3 or 4')
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("The result is #{result}!")

  prompt('Do you want to perform another calculation? (Y to calculate again)')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('Bye bye.')

=begin
Things to think about:

  1: Is there a better way to validate that the user has input a number?
  We'll cover this in more detail in a future assignment.
    We can use (num.to_i.to_s == num) as a check.
    This allows the user to input 0.

  2: It looks like you can call to_i or to_f to convert strings to integers and
  floats, respectively. Look up the String#to_i and String#to_f documentation in
  Ruby docs and look at their various examples and use cases.
    Ok.

  3: Our operation_to_message method is a little dangerous, because we're
  relying on the case statement being the last expression in the method. What if
  we needed to add some code after the case statement within the method? What
  changes would be needed to keep the method working with the rest of the
  program? We'll show a solution in an upcoming assignment.
    We can add explicit returns to each of our conditons
    inside the case statement.

  4: Most Rubyists don't invoke methods with parentheses, unless they're passing
  in an argument. For example, we use name.empty?(), but most Rubyists would
  write name.empty?. Some Rubyists even go as far as not putting parentheses
  around method calls even when passing in arguments. For example, they would
  write prompt "hi there" as opposed to prompt("hi there").
  Try removing some of the optional parentheses when calling methods to get your
  eyes acquainted with reading different styles of Ruby code. This will be
  especially useful if you are using a DSL written in Ruby, like Rspec or Rails.
      Ok.

  5: We're using Kernel.puts() and Kernel.gets(). But the Kernel. is extraneous
  as well as the parentheses. Therefore, we can just call those methods by gets
  and puts. We already know that in Ruby we can omit the parentheses, but how
  come we can also omit the Kernel.?
      BEFORE clicking the answer drop down: Kernel is part of Ruby by default,
      so it does not need to be told where these methods are coming from? I am
      not confident in this answer.

      AFTER clicking the answer drop down: Not really sure what "an object
      called 'main', which is an instance of 'Object'" means. I do think however
      I was pretty much correct.

  6: There are lots of messages sprinkled throughout the program. Could we move
  them into some configuration file and access by key? This would allow us to
  manage the messages much easier, and we could even internationalize the
  messages. This is just a thought experiment, and no need to code this up.
        Sounds interesting to me.
=end
