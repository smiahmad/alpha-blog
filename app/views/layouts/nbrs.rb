puts "Simple Calculator"
20.times {print "-"}
puts
puts "Enter first number:"
num1 = gets.chomp
puts "Enter second number:"
num2 = gets.chomp

puts "The first number multiplied by second is: #{num1.to_i * num2.to_i}"
puts "The first number divided by second is: #{num1.to_i / num2.to_i}"
puts "The first number added to second is: #{num1.to_i + num2.to_i}"
puts "The first number subtracted by second is: #{num1.to_i - num2.to_i}"
puts "The first number \"mod\" second number is: #{num1.to_i % num2.to_i}"
