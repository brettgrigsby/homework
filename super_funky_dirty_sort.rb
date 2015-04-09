class FunkySorter

  def self.funkysort(init_array)
    index = 1
    until init_array[index].nil?
      if init_array[index] < init_array[(index - 1)]
        place_holder = init_array[index]
        init_array[index] = init_array[index - 1]
        init_array[index - 1] = place_holder
        index = 1
      else
        index += 1
      end
    end
    init_array
  end

  def self.supersort(init_array)

    index = 1
    swaps = 0

    until init_array[index].nil? && swaps.zero?

      if init_array[index].nil?
        index = 1
        swaps = 0
      end

      if init_array[index] < init_array[(index - 1)]
        place_holder = init_array[index]
        init_array[index] = init_array[index - 1]
        init_array[index - 1] = place_holder
        swaps += 1
      end

      index += 1

    end

    init_array
  end

  def self.recursive_sort(array)
    array.size times do |index|
      if array[index] == nil FunkySorter.recursive_sort(array)
      elsif array[index - 1] <=> array[index] == -1
        placeholder
      end
    end
    FunkySorter.recursive_sort(array)

  end
end





#puts "Final result: #{result}"
#puts "Swaps: #{swaps}"
