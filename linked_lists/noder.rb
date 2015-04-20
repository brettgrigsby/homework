class Noder
  attr_accessor :data, :link, :index

  def initialize
    @link = nil
    @data = nil
    @index = nil
  end

  def count
    @link ? @link.count + 1 : 1
  end

  def set_index(num)
    @index = num
    @link.set_index(@index + 1) if @link
  end

  def last
    @link ? @link.last : @data
  end

  def pop
    if @link.link
      @link.pop
    else
      temp = @link
      @link = nil
      temp.data
    end
  end

  def include?(data)
    if @data == data
      true
    elsif @link
      @link.include?(data)
    else
      false
    end
  end

  def index_pop(num)
    if @link.index == num
      @link = @link.link
    elsif @link
      @link.index_pop(num)
    end
  end

  def remove_link
    @link = @link.link
  end

  def pop_at_index(num)
    (@link.index == num ? remove_link : @link.pop_at_index(num)) if @link
  end

  def remove_first(data)
    if @link && (@link.data == data)
      remove_link
    elsif @link
      @link.remove_first(data)
    end
  end

  def remove_all(data)
    if @link && @link.data == data
      remove_link
      remove_all(data)
    elsif @link
      @link.remove_all(data)
    end
  end

  def at_index(num)
    if @index == num
      @data
    elsif @link
      @link.at_index(num)
    else
      nil
    end
  end

  def class_types
    @link ? @link.class_types << @data.class : [@data.class]
  end


  def pass_down(node)
    @link ? @link.pass_down(node) : @link = node
  end

  def insert_at(index, node)
    if @link.index == index
      node.link = @link
      @link = node
    elsif @link
      @link.insert_at(index, node)
    end
  end

  def separation(data1, data2)
    if @data == data1
      @link.data_count(data2)
    elsif @link
      @link.separation(data1, data2)
    end
  end

  def data_count(data)
    if @data == data
      1
    elsif @link
      @link.data_count(data) + 1
    end
  end

  def find_index(data)
    if @data == data
      @index
    elsif @link
      @link.find_index(data)
    end
  end

  def all_data
    puts @data
    @link.all_data if @link
  end

end
