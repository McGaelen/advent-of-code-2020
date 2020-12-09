def openInput
  file = open('input.txt')

  if file == nil
    puts "couldn't find file"
    exit 1
  end

  return file
end
