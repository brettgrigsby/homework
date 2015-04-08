class EncryptionEngine
  attr_reader :alphabet
  def initialize
    @alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
                "j", "k", "l", "m", "n", "o", "p", "q", "r",
                "s", "t", "u", "v", "w", "x", "y", "z"]
  end

  def decrypt(key=13, string)
    @alphabet = @alphabet.reverse
    ec = encrypt(key, string)
    @alphabet = @alphabet.reverse
    ec
  end

  def engine(message)
    return ' ' if message == ' '
    input_index = @alphabet.index(message)
    output_index = input_index + @key


    if output_index > 25
      output_index = output_index - 26
    end
    alphabet[output_index]
  end

  def uppercase?(character)
    character.upcase == character
  end

  def encrypt(key=13, string)
    @key = key.to_i
    string.chars.map do |character|
      if uppercase?(character)
        engine(character.downcase).upcase
      else
        engine(character)
      end
    end.join
  end
end
