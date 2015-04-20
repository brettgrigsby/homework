gem 'minitest'
require 'minitest/autorun'
require 'minitest/emoji'
require_relative 'header'
require_relative 'noder'

class HeaderTest < Minitest::Test
  def test_header_has_link_but_no_data
    head = Header.new
    refute head.link
    refute head.data
  end

  def test_node_can_link_to_header
    head = Header.new
    node = Noder.new
    node.attach(head)
    assert_equal node, head.link
  end

  def test_header_assigns_index
    head = Header.new
    node = Noder.new
    node2 = Noder.new

    node.attach(head)
    node2.attach(head)
    refute node2.index

    head.set_index
    assert_equal 1, node2.index
  end

  def test_head_can_initiate_count
    head = Header.new
    node = Noder.new
    node2 = Noder.new

    node.attach(head)
    node2.attach(head)
    assert_equal 2, head.count
  end

  def test_unshift_adds_to_the_top
    head = Header.new
    node = Noder.new
    node2 = Noder.new

    node.attach(head)
    node2.attach(head)
    node3 = Noder.new
    head.unshift(node3)
    assert_equal node3, head.link
  end
end

  
