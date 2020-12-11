def openInput(transform = :chomp)
  inputArray = []
  file = open('input.txt')

  if file == nil
    puts "couldn't find file"
    exit 1
  end

  file.each do |thing|
    inputArray.push thing.method(transform).call
  end

  inputArray
end
