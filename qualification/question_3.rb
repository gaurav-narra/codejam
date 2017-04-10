#!/usr/bin/ruby -w

input  = File.new('inputs/input_3.txt', 'r')
output = File.new('outputs/output_3.txt', 'wb')

def best_potty(n, k)
  i = 0
  people_filled = 0
  level_nodes = 1

  while(true)
    level_nodes = 2**i
    if k <= people_filled + level_nodes
      remainging_objects = n - people_filled
      remainging_people = k - people_filled

      if (remainging_objects%level_nodes) >= remainging_people
        l = (remainging_objects/level_nodes)
        break
      else
        l = (remainging_objects/level_nodes) - 1
        break
      end
    end
    people_filled += 2**i
    i += 1
  end

  return [l/2, (l-(l/2))].sort.reverse.join(' ')
end

n = input.gets.strip.to_i
(1..n).to_a.each do |i|
  n, k = input.gets.strip.split(' ').map(&:to_i)
  output.puts "Case ##{i}: #{best_potty(n, k)}"
end


