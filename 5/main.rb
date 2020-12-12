# F = 0
# B = 1
# R = 1
# L = 0

require '../utils'

$passes = []

passesStr = openInput
passesStr.each do |pass|
  col = pass.slice! 7, pass.length-7

  pass.gsub! /F/, '0'
  pass.gsub! /B/, '1'
  col.gsub! /R/, '1'
  col.gsub! /L/, '0'

  $passes.push({ :row => pass.to_i(2), :col => col.to_i(2) })
end

def part1
  puts $passes
    .collect { |pass| pass[:row] * 8 + pass[:col] }
    .reduce { |acc, seatId| seatId > acc ? seatId : acc }
end

def part2
  ids = $passes
          .collect { |pass| pass[:row] * 8 + pass[:col] }
          .sort

  ids.each_with_index do |id, ind|
    next if ind == 0 or ind == ids.length - 1

    if id - ids[ind-1] > 1
      puts id - 1
      exit
    end
  end
end

part2