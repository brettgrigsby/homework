require_relative 'noder'

class Header < Noder
  attr_accessor :link

  def count
    @link? @link.count : 0
  end

  def remove_all(data)
    @link.remove_all(data) if @link
  end
  def last
    @link ? @link.last : nil
  end

  def set_index
    @link.set_index(0) if @link
  end

  def shift
    temp_var = @link
    (@link = @link.link) if @link
    temp_var.data
  end

  def unshift(node)
    temp_var = @link
    @link = node
    node.link = temp_var if node.link
  end

  def class_types
    @link ? @link.class_types : []
  end

end
