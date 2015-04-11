class Fibber
  def initialize(print_method)
    @file_name = print_method.file_name
  end

  def print(number)
    output = fibberate(number)
    if @file_name
      File.open(@file_name, 'w') { |file| file.write(output) }
    else
      puts output
    end
  end

  def fibberate(number)
    sequence = [ 0, 1]
    (number - 2).times { sequence << sequence[-2] + sequence[-1] }
    sequence.join(" ")
  end
end







# sequence.each_slice(5) { |row| puts row.map { |num| "%#{sequence[-1].to_s.length + 1}d" % num }.join }
