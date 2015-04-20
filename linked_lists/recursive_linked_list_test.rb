gem 'minitest'
require 'minitest/autorun'
require 'minitest/emoji'
require_relative 'noder'
require_relative 'recursive_linked_list'

class RecursiveLinkedListTest < Minitest::Test

  def setup
    @list = RecursiveLinkedList.new
  end

  def test_append_to_list
    refute @list.at_index(0)
    @list << "test"
    assert_equal "test", @list.at_index(0)
  end

  def test_returns_the_number_of_nodes
    @list << "some"
    @list << "data"
    assert_equal 2, @list.size
    @list << "dawg"
    assert_equal 3, @list.size
  end

  def test_returns_data_at_a_given_index
    @list << "some"
    @list << "data"
    assert_equal "data", @list.at_index(1)

    @list << "love"
    @list << "pizza"
    assert_equal "love", @list.at_index(2)
  end

  def test_can_identify_the_last_element_of_the_list
    @list << "some"
    @list << "data"
    @list << "pizza"
    assert_equal "pizza", @list.last
  end

  def test_can_pop_off_the_tail
    @list << "some"
    @list << "data"
    @list << "pizza"
    assert_equal "pizza", @list.pop
    assert_equal "data", @list.last
  end

  def test_shift_new_element_to_top_of_list
    @list << "some"
    @list << "data"
    @list.shift("pizza")
    assert_equal "pizza", @list.at_index(0)
    assert_equal "data", @list.at_index(2)
  end

  def test_unshift_first_element_off_the_list
    @list << "some"
    @list << "data"
    @list << "pizza"
    assert_equal "some", @list.unshift
    assert_equal "data", @list.at_index(0)
  end

  def test_can_ask_if_list_includes_some_data
    @list << "some"
    @list << "data"
    @list << "pizza"
    assert @list.include?("data")
    refute @list.include?("pizzas")
  end

  def test_remove_a_node_by_index
    @list << "first"
    @list << "second"
    @list << "third"
    @list.index_pop(1)
    assert_equal "third", @list.at_index(1)
    refute @list.include?("second")

  end

  def test_remove_first_instance_of_data
    @list << "some"
    @list << "data"
    @list << "some"
    @list << "data"
    @list.remove_first("data")
    assert_equal "some", @list.at_index(0)
    assert_equal "some", @list.at_index(1)
    assert_equal "data", @list.at_index(2)
  end

  def test_remove_all_instances_of_a_data_value
    @list << "some"
    @list << "data"
    @list << "some"
    @list << "data"
    @list.remove_all("some")
    assert_equal 2, @list.size
    refute @list.include?("some")
  end

  def test_insert_at_index_value
    @list << "some"
    @list << "data"
    @list << "some"
    @list << "data"
    @list.insert_at(2, "insertion")
    assert_equal 5, @list.size
    assert_equal "insertion", @list.at_index(2)
    assert_equal "some", @list.at_index(3)
  end

  def test_find_distance_between_2_nodes
    @list << 1
    @list << 2
    @list << 3
    @list << 4
    @list << 5
    assert_equal 3, @list.separation(2, 5)
  end

  def test_find_index_of_data
    @list << "first"
    @list << "second"
    @list << "third"
    assert_equal 2, @list.find_index("third")
  end

  def test_add_after_known_node
    @list << "first"
    @list << "second"
    @list << "third"
    @list.add_after("second", "bye third")
    assert_equal "bye third", @list.at_index(2)
    assert_equal "third", @list.at_index(3)
  end

  def test_can_sort_by_data
    skip
    @list << 5
    @list << 2
    @list << 4
    @list << 1
    @list << 3
    @list.sort
    assert_equal 1, @list.at_index(0)
    assert_equal 2, @list.at_index(1)
    assert_equal 3, @list.at_index(2)
  end

end
