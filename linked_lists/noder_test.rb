gem 'minitest'
require 'minitest/autorun'
require 'minitest/emoji'
require_relative 'noder'

class NoderTest < Minitest::Test

  def test_new_node_has_data_and_link_set_to_nil
    node = Noder.new
    refute node.link
    refute node.data
  end

  def test_can_assign_value_to_data
    node = Noder.new
    node.data = "test string"
    assert_equal "test string", node.data
  end

  def test_attach_new_nodes_to_the_end
    node = Noder.new
    node2 = Noder.new
    node3 = Noder.new
    node.pass_down(node2)
    node.pass_down(node3)
    assert_equal node2, node.link
    assert_equal node3, node2.link
  end

  def test_can_remove_node_with_a_link
    node = Noder.new
    node2 = Noder.new
    node3 = Noder.new
    node.pass_down(node2)
    node.pass_down(node3)
    node.remove_link
    assert_equal node3, node.link
  end

  def test_remove_based_on_data
    node = Noder.new
    node2 = Noder.new
    node3 = Noder.new
    node.pass_down(node2)
    node.pass_down(node3)
    node.data = 1
    node2.data = 2
    node3.data = 3
    node.remove_first(2)
    assert_equal node3, node.link
  end

  def test_insert_at_index_value
    node = Noder.new
    node.index = 0
    node2 = Noder.new
    node2.index = 1
    node3 = Noder.new
    node3.index = 2
    node.pass_down(node2)
    node.pass_down(node3)
    node4 = Noder.new
    node.insert_at(1, node4)
    assert_equal node4, node.link

  end

end
