#!/usr/bin/ruby -w

input  = File.new('inputs/input_2.txt', 'r')
output = File.new('outputs/output_2.txt', 'wb')

def nearest_tidy(num)
  digits = num.split('').map(&:to_i)
  (0..(digits.length-1)).to_a.each do |i|
    break if i == (digits.length-1)
    next if digits[i] <= digits[i+1]

    digits[i] -= 1
    k = i
    while(k > 0)
      j = k-1
      if digits[j] > digits[k]
        digits[j] -= 1
        digits[k] = 9
      end
      k -= 1
    end

    ((i+1)..(digits.length-1)).to_a.each do |p|
      digits[p] = 9
    end
  end

  return digits.join.to_i
end

n = input.gets.to_i
(1..n).to_a.each do |i|
  num = input.gets.strip
  output.puts "Case ##{i}: #{nearest_tidy(num)}"
end
