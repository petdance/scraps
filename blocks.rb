#!/usr/bin/env ruby

# First block
x = 1337
puts "Before the loop, x = #{x}"

3.times{|x| puts "Looping #{x}" }

puts "After the loop, x = #{x}"
puts '-' * 20
puts

# Second block
x = 1337
puts "Before the loop, x = #{x}"

3.times do|y|
    puts "Looping #{y}"
    x = y
end

puts "After the loop, x = #{x}"
puts '-' * 20
puts

# Third block
x = 1337
puts "Before the loop, x = #{x}"

#3.times do|y;x|
#puts "Looping #{y}"
#x = y
#end

