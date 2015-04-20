gem 'minitest'
require 'minitest/autorun'
require 'minitest/emoji'
require_relative 'simple_node'
require_relative 'iterative_linked_list'

class IterativeLinkedListTest < Minitest::Test
  def setup
    @list = IterativeLinkedList.new
  end

  def test_append_to_list
    @list << 1
    @list << 2
    assert_equal 1, @list.head.data
    assert_equal 2, @list.head.link.data
  end

  def test_list_can_return_its_size
    @list << 1
    @list << 2
    assert_equal 2, @list.size
    @list << 3
    @list << 4
    @list << 5
    assert_equal 5, @list.size
  end

  def test_returns_last_element_in_list
    refute @list.last
    @list << 1
    @list << 2
    @list << 3
    @list << 4
    assert_equal 4, @list.last
  end

  def test_can_pop_the_last_element
    refute @list.pop
    @list << 1
    @list << 2
    @list << 3
    @list << 4
    assert_equal 4, @list.pop
    assert_equal 3, @list.size
  end

  def test_access_element_from_index
    @list << 1
    @list << 2
    @list << 3
    @list << 4
    assert_equal 1, @list.at_index(0)
    assert_equal 3, @list.at_index(2)
  end

  def test_unshift_the_first_element
    @list << 1
    @list << 2
    @list << 3
    @list << 4
    assert_equal 1, @list.unshift
    assert_equal 2, @list.at_index(0)
  end

  def test_shift_in_new_data
    @list << 1
    @list << 2
    @list << 3
    @list.shift(4)
    assert_equal 4 , @list.at_index(0)
  end

end
