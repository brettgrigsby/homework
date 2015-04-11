require 'minitest/autorun'
require 'minitest/emoji'
require './credit_check/credit_check_easy'

class CreditCheckTest < Minitest::Test

  def test_can_check_a_empty_string
    check = Checker.new
    result = check.credit_check("")
    assert_equal "'' is not acceptable input. Please enter a positive integer.", result
  end
    
  end

  def test_determine_invalid_input
    check = Checker.new
    result = check.valid_input?("pizza")
    refute result
  end

  def test_can_check_a_single_digit_string
    check = Checker.new
    result = check.credit_check("1")
    assert_equal "The number 1 is INVALID!", result
  end

  def test_can_process_2_digit_string
    check = Checker.new
    result = check.process("26")
    assert_equal 10, result
  end

  def test_can_return_valid_for_valid_number
    check = Checker.new
    result = check.valid?(40)
    assert_equal "VALID", result
  end

  def test_can_return_invalid_for_invalid_nubmer
    check = Checker.new
    result = check.valid?(24)
    assert_equal "INVALID", result
  end

  def test_modifies_numbers_with_odd_indicies
    check = Checker.new
    number = check.modify_every_other(8, 1)
    assert_equal 7, number
  end

  def test_will_not_modify_even_indecies
    check = Checker.new
    number = check.modify_every_other(8, 0)
    assert_equal 8, number
  end

  def test_can_check_a_long_invalid_number
    check = Checker.new
    result = check.credit_check("85974647695746668567464")
    assert_equal result, "The number 85974647695746668567464 is INVALID!"
  end

  def test_can_check_a_long_valid_number
    check = Checker.new
    result = check.credit_check("5541808923795240")
    assert_equal result, "The number 5541808923795240 is VALID!"
  end
end
