class Fibber
  def initialize(method_array)
    @print_method = method_array[0]
    @file_name = method_array[1]
  end

  def print(number)
    sequence = [ 0, 1]
    (number - 2).times { sequence << sequence[-2] + sequence[-1] }
    output = sequence.join(" ")
    if @print_method == :file
      File.open("output.txt", 'w') { |file| file.write("#{output}") }
    else
      puts output
    end
  end
end







# sequence.each_slice(5) { |row| puts row.map { |num| "%#{sequence[-1].to_s.length + 1}d" % num }.join }
