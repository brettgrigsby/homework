require_relative 'encryption_engine'

class Encryptor

  def initialize
    @key = 13
    @message = ''
  end


  def self.within_range?
    (@key.to_i <= 26 && @key.to_i >= 0)
  end

  def self.is_an_integer?
    @key.to_i.to_s == @key
  end

  def self.get_key
    puts "Choose your key:\n"
    @key = gets.chomp


    if is_an_integer? && within_range?

      return @key
    else
      puts 'Please enter an Integer between 0 and 26.'
      get_key
    end

  end
  def self.run
    get_key

    puts "Please enter your message: "
    @message = gets.chomp

    engine = EncryptionEngine.new
    puts engine.encrypt(@key, @message)
  end
end

