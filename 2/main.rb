require '../utils'

$passwords = []

file = openInput

file.each do |line|
  passDetails = line.split ' '

  uses = passDetails[0].split '-'
  atLeast = uses[0].to_i
  atMost = uses[1].to_i
  letter = passDetails[1].chomp ':'
  regex = Regexp.new("[#{letter}]")
  password = passDetails[2]

  $passwords.push({
    'password' => password,
    'atLeast' => atLeast,
    'atMost' => atMost,
    'regex' => regex
  })
end

def part1
  numCorrect = 0

  $passwords.each do |pass|
    matches = pass['password'].scan(pass['regex'])
    numCorrect += 1 if matches.length >= pass['atLeast'] and matches.length <= pass['atMost']
  end

  puts numCorrect
end

part1
