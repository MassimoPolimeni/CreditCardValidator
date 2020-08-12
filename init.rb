# frozen_string_literal: true

# 539 1488 0343 6467

# The first step of the Luhn algorithm is to double every second digit, starting from the right. We will be doubling
# 4_3_ 1_8_ 0_4_ 6_6_

# If doubling the number results in a number greater than 9 then subtract 9 from the product. The results of our doubling:
# 8569 2478 0383 3437

# Then sum all of the digits:
# 8+5+6+9+2+4+7+8+0+3+8+3+3+4+3+7 = 80
# If the sum is evenly divisible by 10, then the number is valid. This number is valid!

def check(credit_card_number)
  credit_card_array = credit_card_number.to_s.split('').map(&:to_i)

  credit_card_array.reverse!

  credit_card_array.each_with_index do |_, index|
    credit_card_array[index] = credit_card_array[index] * 2 if index.even?
    credit_card_array[index] -= 9 if credit_card_array[index] > 9
  end

  sum = 0
  credit_card_array.each { |x| sum += x }

  if (sum % 10).zero?
    puts 'The credit number is correct! ✅'
  else
    puts 'The credit number is not correct! 🙅‍♂️'
  end

  puts "\n\n"
end

puts 'Welcome to Credit Card validator!'
puts 'Please insert your credit card number:'

credit_card = Integer(gets.chomp)
check(credit_card)

luhn_number1 = 499273987176 # true
luhn_number2 = 79927398713 # true
luhn_number3 = 123426242 # false
luhn_number4 = 8285728192342 # false

check(luhn_number1)
check(luhn_number2)
check(luhn_number3)
check(luhn_number4)


