gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'super_funky_dirty_sort'

class SortTest < Minitest::Test

  def test_returns_array
    sample = []
    assert_equal Array, FunkySorter.funkysort(sample).class
  end

  def test_can_sort_empty_array
    sample = []
    assert_equal [], FunkySorter.funkysort(sample)
  end

  def test_can_sort_1_element
    sample = [1]
    assert_equal [1], FunkySorter.funkysort(sample)
  end

  def test_can_sort_2_elements_in_order
    sample = [1, 2]
    assert_equal [1, 2], FunkySorter.funkysort(sample)
  end

  def test_can_sort_2_elements_out_of_order
    sample = [2, 1, 3]
    assert_equal [1, 2, 3], FunkySorter.funkysort(sample)
  end

  def test_can_sort_many_numbers
    sample = [5, 8, 3, 1]
    assert_equal [1, 3, 5, 8], FunkySorter.funkysort(sample)
  end

  def test_can_supersort_1_number
    sample = [2]
    assert_equal [2], FunkySorter.supersort(sample)
  end

  def test_can_super_2_numbers
    sample = [4, 2]
    assert_equal [2, 4], FunkySorter.supersort(sample)
  end

  def test_can_super_4_numbers
    sample = [2, 5, 3, 1]
    assert_equal [1, 2, 3, 5], FunkySorter.supersort(sample)
  end
end
