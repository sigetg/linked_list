# Author: George Sigety

class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = nil
  end
end


class LinkedList < Node
  attr_accessor :head, :tail

  def initialize
    head = nil
    tail = nil
    index = nil
    size = 0
  end

  def append(value)
    node = Node.new(value)
    if self.head.nil?
      self.head = node
      self.tail = node
    else
      self.tail.next_node = node
      self.tail = node
    end
  end

  def prepend(value)
    node = Node.new(value)
    if self.head.nil?
      self.head = node
      self.tail = node
    else
      node.next_node = self.head
      self.head = node
    end
  end

  def size
    count = 0
    node = self.head
    while node != nil
      count += 1
      node = node.next_node
    end
    count
  end

  def at(index)
    iterator = 0
    node = self.head
    while node != nil
      if index == iterator
        return node
      end
      iterator += 1
      node = node.next_node
    end
    nil
  end

  def to_s
    string = ""
    node = self.head
    while node!= nil
      string += node.value.to_s + " -> "
      node = node.next_node
    end
    string += "nil"
    string
  end


  # need to set tail
  def pop
    if self.head.nil?
      nil
    else
      self.tail = self.tail.next_node
    end
  end

end

l = LinkedList.new
puts l.append(1)
puts l.append(2)
puts l.prepend(0)
puts l.size
puts l.at(1)
puts l.size
puts l.to_s
