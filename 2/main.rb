$regexes = []
$passwords = []

file = open('input.txt')

file.each do |line|
  passDetails = line.split ' '

  uses = passDetails[0].split '-'
  atLeast = uses[0].to_i
  atMost = uses[1].to_i
  letter = passDetails[1].chomp ':'
  $regexes.push Regexp.new("[#{letter}]")

  # password
  password = passDetails[2]
  $passwords.push({
    'password' => password,
    'atLeast' => atLeast,
    'atMost' => atMost
  })
end

puts $regexes.length
puts $passwords.length

def part1
  numCorrect = 0

  $passwords.each_with_index do |pass, index|
    matches = pass['password'].scan($regexes[index])
    numCorrect += 1 if matches.length >= pass['atLeast'] and matches.length <= pass['atMost']
  end

  puts numCorrect
end

part1
