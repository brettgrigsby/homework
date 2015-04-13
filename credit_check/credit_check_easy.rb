class Checker

  def credit_check(input)
    if valid_input?(input)
      result = valid?(process(input))
      "The number #{input} is #{result}!"
    else
      "'#{input}' is not acceptable input. Please enter a positive integer."
    end
  end

  def valid_input?(input)
    input.to_i.to_s == input && input.to_i >= 0
  end

  def process(string)
    sum = 0
    string.chars.reverse.each_with_index do |element, index|
      number = modify_every_other(element.to_i, index)
      sum += number
    end
    return sum
  end

  def modify_every_other(number, index)
    number = number * 2 if index.odd?
    number = number - 9 if number > 9
    return number
  end

  def valid?(number)
    number % 10 == 0 ? 'VALID' : 'INVALID'
  end

end
