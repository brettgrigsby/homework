require_relative 'noder'

class RecursiveLinkedList

  def initialize
    @head = nil
  end

  def <<(data)
    node = Noder.new
    node.data = data
    @head ? @head.pass_down(node) : @head = node
    @head.set_index(0)
  end

  def size
    @head ? @head.count : 0
  end

  def at_index(num)
    @head ? @head.at_index(num) : nil
  end

  def last
    @head ? @head.last : nil
  end

  def pop
    @head ? @head.pop : nil
  end

  def shift(data)
    temp = @head
    @head = Noder.new
    @head.data = data
    @head.link = temp
    @head.set_index(0)
  end

  def unshift
    temp = @head
    @head = @head.link
    @head.set_index(0)
    temp.data
  end

  def include?(data)
    @head ? @head.include?(data) : false
  end

  def index_pop(num)
    @head.index_pop(num)
    @head.set_index(0)
  end

  def remove_first(data)
    if @head.data == data
      @head = @head.link
    elsif @head
      @head.remove_first(data)
    end
    @head.set_index(0)
  end

  def remove_all(data)
    if @head.data == data
      @head = @head.link
      remove_all(data)
    elsif @head
      @head.remove_all(data)
    end
    @head.set_index(0)
  end

  def insert_at(index, data)
    new_node = Noder.new
    new_node.data = data
    if index == 0
      shift(data)
    elsif @head
      @head.insert_at(index, new_node)
    end
    @head.set_index(0)
  end

  def separation(data1, data2)
    @head.separation(data1, data2)
  end

  def find_index(data)
    @head.find_index(data)
  end

  def add_after(known_data, new_data)
    target = find_index(known_data)
    insert_at(target + 1, new_data)
    @head.set_index(0)
  end

  def all_data
    @head.all_data
  end

  def sort
    until @head.data < @head.link.data
      temp = @head
      @head = @head.link
      temp.data = nil
      @head.pass_down(temp)
    end

    @head.sort

  end
end
