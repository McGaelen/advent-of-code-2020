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

def part2
  numCorrect = 0

  $passwords.each do |pass|
    password = pass['password']
    pos1 = pass['atLeast'] - 1
    pos2 = pass['atMost'] - 1

    positions = password.enum_for(:scan, pass['regex']).map do
      Regexp.last_match.begin(0)
    end

    # XOR the positions
    numCorrect += 1 if positions.include?(pos1) ^ positions.include?(pos2)
  end

  puts numCorrect
end

part2
