require '../utils'

$numbers = openInput :to_i

# pt 1
def part1
  $numbers.each do |num1|
    $numbers.each do |num2|
      if num1 + num2 == 2020
        puts "#{num1 * num2}"
        return
      end
    end
  end
end

# pt 2
def part2
  $numbers.each do |num1|
    $numbers.each do |num2|
      $numbers.each do |num3|
        if num1 + num2 + num3 == 2020
          puts "#{num1 * num2 * num3}"
          return
        end
      end
    end
  end
end

# part1
part2
