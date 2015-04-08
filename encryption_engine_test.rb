gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'encryption_engine'
require_relative 'encryptor'

class EncryptionEngineTest < Minitest::Test

  def setup
    @engine = EncryptionEngine.new
  end

  def test_a_returns_n
    assert_equal 'n', @engine.encrypt("a")
  end

  def test_n_returns_a
    assert_equal 'a', @engine.encrypt("n")
  end

  def test_ab_returns_no
    assert_equal 'no', @engine.encrypt("ab")
  end

  def test_A_retuns_N
    assert_equal 'N', @engine.encrypt("A")
  end

  def test_space_returns_space
    assert_equal ' ', @engine.encrypt(" ")
  end

  def test_it_encrypts_using_rot13
    output = @engine.encrypt("My Message")
    assert_equal "Zl Zrffntr", output
  end

  def test_decrypt
    output = @engine.decrypt(2, "C")
    assert_equal "A", output
  end

  def test_decrypt_harder
    output = @engine.decrypt(13, "Zl Zrffntr")
    assert_equal "My Message", output
  end

  def test_key_of_2_wordks_for_A_with_2
    output = @engine.decrypt(2, "A")
    assert_equal "Y", output
  end

  def test_decrypt_key_higher_than_13
    output = @engine.decrypt(22, "B")
    assert_equal "F", output
  end

  def test_key_of_2_wordks_for_xy
    output = @engine.decrypt(2, "xy")
    assert_equal "vw", output
  end

  def test_encrypt_and_decrypt
    encryption = @engine.encrypt(5, "A") #F
    decryption = @engine.decrypt(5, encryption) #A
    assert_equal "A", decryption
    encryption2 = @engine.encrypt(5, decryption)
    assert_equal "F", encryption2
  end
end
