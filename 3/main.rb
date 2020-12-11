require '../utils'

$grid = openInput

def width
  $grid[0].length
end

def height
  $grid.length
end

def findNumTrees(slopeX = 3, slopeY = 1)
  numTrees = 0

  yIndex = slopeY
  xIndex = slopeX

  while yIndex < height
    numTrees += 1 if $grid[yIndex][xIndex] == '#'

    yIndex += slopeY

    xIndex += slopeX
    if xIndex >= width
      # wrap around
      xIndex = xIndex - width
    end
  end

  numTrees
end


def part1
  puts findNumTrees 3, 1
end

def part2
  slopes = [
    [1, 1],
    [3, 1],
    [5, 1],
    [7, 1],
    [1, 2]
  ]

  numTreesPerSlope = []

  slopes.each do |slope|
    numTreesPerSlope.push(findNumTrees slope[0], slope[1])
  end

  puts numTreesPerSlope.reduce :*
end

part2