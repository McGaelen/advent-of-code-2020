require 'set'
require '../utils'

$groups = open('input.txt').read.split(/\n\n/)

def part1
  puts $groups
    .map { |group|
      answers = Set.new
      group
        .gsub(/\n/, '')
        .each_char { |c| answers << c }
      answers
    }.reduce(0) { |acc, answers| acc += answers.length }
end

def part2
  puts $groups
    .map { |group|
      individuals = group.split /\n/
      individuals.reduce(individuals[0].split '') { |acc, individual| acc & individual.split('')}
    }.reduce(0) { |acc, answers| acc += answers.length }
end

part1