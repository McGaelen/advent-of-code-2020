require 'set'

REQUIRED_FIELDS = Set.new(%w[byr iyr eyr hgt hcl ecl pid])
EYE_COLORS = %w[amb blu brn gry grn hzl oth]

file = open('input.txt').read

$passportStrings = file.split /\n\n/
$passports = $passportStrings.map do |passport|
  passport
    .gsub(/\n/, ' ')
    .split(/ /)
    .reduce({}) do |acc, field|
      key, value = field.split /:/
      acc.merge({ key => value })
    end
end

def part1
  numValid = 0

  $passports.each do |passport|
    numValid += 1 if Set.new(passport.keys) & REQUIRED_FIELDS == REQUIRED_FIELDS
  end

  puts numValid
end

def part2
  numValid = 0

  $passports.each do |passport|
    next unless Set.new(passport.keys) & REQUIRED_FIELDS == REQUIRED_FIELDS

    byr = passport['byr']
    iyr = passport['iyr']
    eyr = passport['eyr']
    hgt = passport['hgt']
    hcl = passport['hcl']
    ecl = passport['ecl']
    pid = passport['pid']

    correctFields = 0b0

    correctFields = correctFields | 0b0000001 if
      byr.to_i >= 1920 and byr.to_i <= 2002

    correctFields = correctFields | 0b0000010 if
      iyr.to_i >= 2010 and iyr.to_i <= 2020

    correctFields = correctFields | 0b0000100 if
      eyr.to_i >= 2020 and eyr.to_i <= 2030

    correctFields = correctFields | 0b0001000 if
      (hgt.include? 'cm' and hgt.to_i >= 150 and hgt.to_i <= 193) or
      (hgt.include? 'in' and hgt.to_i >= 59 and hgt.to_i <= 76)

    correctFields = correctFields | 0b0010000 if
      hcl[/#[0-9a-f]{6}/] == hcl

    correctFields = correctFields | 0b0100000 if
      EYE_COLORS.include? ecl

    correctFields = correctFields | 0b1000000 if
      pid[/[0-9]{9}/] == pid

    numValid += 1 if correctFields == 0b1111111

    puts "#{correctFields.to_s(2)} - #{correctFields == 0b1111111}\n"
  end

  puts numValid
end

part2
