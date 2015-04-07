gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class CountPatternTest < Minitest::Test

  def test_count_count_words_with_e
    words = ["thing", "phone", "bark", "belt", "shoe", "bath"]
    tally = 0
    words.each do |word|
      tally += 1 if word.include?('e')
    end
    assert_equal 3, tally
  end

  def test_count_numbers_greater_than_17
    numbers = [9, 18, 12, 17, 1, 3, 99]
    tally = 0
    numbers.each do |number|
      if number > 17
        tally += 1
      end
    end
    assert_equal 2, tally
  end

  def test_count_words_that_are_uppercase
    words = ["trousers", "SOCKS", "sweater", "Cap", "SHOE", "TIE"]
    tally = 0
    words.each do |word|
      if word.upcase == word
        tally += 1
      end
    end
    assert_equal 3, tally
  end

  def test_count_words_ending_in_ing
    words = ["thought", "brake", "shin", "juice", "trash"]
    tally = 0
    words.each do |word|
      if word.chars[-3..-1].join == "ing"
        tally += 1
      end
    end
    assert_equal 0, tally
  end

  def test_count_even_numbers
    numbers = [9, 2, 1, 3, 18, 39, 71, 4, 6]
    tally = 0
    numbers.each do |num|
      if (num % 2) == 0
        tally += 1
      end
    end
    assert_equal 4, tally
  end

  def test_count_multiples_of_5
    numbers = [2, 5, 19, 25, 35, 67]
    tally = 0
    numbers.each do |num|
      if (num % 5) == 0
        tally += 1
      end
    end
    assert_equal 3, tally
  end

  def test_count_round_prices
    prices = [1.0, 3.9, 5.99, 18.5, 20.0]
    tally = 0
    prices.each do |price|
      if price == price.to_i
        tally += 1
      end
    end
    assert_equal 2, tally
  end

  def test_count_four_letter_words
    words = ["bake", "bark", "corn", "apple", "wart", "bird", "umbrella", "fart"]
    tally = 0
    words.each do |word|
      if word.length == 4
        tally += 1
      end
    end
    assert_equal 6, tally
  end

end