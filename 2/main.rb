$regexes = []
$passwords = []

file = open('input.txt')

file.each do |line|
  passDetails = line.split ' '

  uses = passDetails[0].split '-'
  atLeast = uses[0]
  atMost = uses[1]
  letter = passDetails[1].chomp ':'
  # [letter]{atLeast,atMost}
  $regexes.push Regexp.new("[#{letter}]{#{atLeast},#{atMost}}")

  # password
  password = passDetails[2]
  $passwords.push password
end

def part1
  puts $regexes
  numCorrect = 0
  $passwords.each_with_index do |pass, index|
    numCorrect += 1 if (pass =~ $regexes[index]) != nil
  end
  puts numCorrect
end

part1
