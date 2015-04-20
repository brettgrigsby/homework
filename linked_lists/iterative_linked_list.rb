class IterativeLinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def <<(data)
    new_node = SimpleNode.new
    new_node.data = data
    if @head == nil
      @head = new_node
    else
      node = @head
      until node.link == nil
        node = node.link
      end
      node.link = new_node
    end
  end

  def size
    node = @head
    count = 0
    while node
      count += 1
      node = node.link
    end
    count
  end

  def last
    node = @head
    return nil if @head.nil?
    while node.link
      node = node.link
    end
    node.data
  end

  def pop
    node = @head
    data = nil
    return nil if @head.nil?
    if @head.link
      while node.link.link
        node = node.link
      end
      data = node.link.data
      node.link = nil
    else
      data = @head.data
      @head = nil
    end
    data
  end

  def at_index(num)
    node = @head
    index = 0
    until index == num
      node = node.link
      index += 1
    end
    node.data
  end

  def unshift
    data = @head.data
    @head = @head.link
    data
  end

  def shift(data)
    new_node = SimpleNode.new
    new_node.data = data
    temp = @head
    new_node.link = temp
    @head = new_node
  end

end
