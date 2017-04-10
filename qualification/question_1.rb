#!/usr/bin/ruby -w

input  = File.new('inputs/input_1.txt', 'r')
output = File.new('outputs/output_1.txt', 'wb')


def min_usage(sequence, k)
  count = 0

  (0..(sequence.length - 1)).to_a.reverse.each do |index|
    next if sequence[index].eql?'+'
    if (index - k + 1) < 0
      count = 'IMPOSSIBLE'
      break
    end
    count+=1

    ((index-k+1)..index).to_a.each do |op_index|
      if sequence[op_index].eql?'+'
        sequence[op_index] = '-'
      else
        sequence[op_index] = '+'
      end
    end
  end
  return count.to_s
end

n = input.gets.to_i
(0..(n-1)).to_a.each do |i|
  sequence, k = input.gets.split(" ")
  output.puts "Case ##{i+1}: #{min_usage(sequence, k.to_i)}"
end