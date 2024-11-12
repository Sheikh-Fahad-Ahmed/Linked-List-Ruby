# frozen_string_literal: true

require_relative 'node'

class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def to_s
    temp = head
    until temp.nil?
      print "( #{temp.value} ) -> "
      temp = temp.next_node
    end
    'nil'
  end

  def append(value)
    new_node = Node.new(value)
    if head.nil?
      self.head = new_node
      self.tail = new_node
    else
      temp = head
      temp = temp.next_node until temp.next_node.nil?
      temp.next_node = new_node
      self.tail = new_node
    end
    self.size += 1
    true
  end

  def prepend(value)
    new_node = Node.new(value)
    if head.nil?
      self.head = new_node
      self.tail = new_node
    else
      new_node.next_node = head
      self.head = new_node
    end
    self.size += 1
    true
  end

  def at(index)
    return 'empty' if head.nil?

    temp = head
    1.upto(index) { temp = temp.next_node }
    temp
  end

  def pop
    return 'list is empty' if head.nil?

    if size == 1
      temp = head
      self.head = nil
      self.tail = nil
    else
      temp = head
      temp = temp.next_node until temp.next_node == tail
      self.tail = temp
      temp = temp.next_node
      tail.next_node = nil
    end
    self.size -= 1
    puts temp.value
  end

  def contains?(value)
    return 'list is empty' if head.nil?

    temp = head
    loop do
      return puts 'true' if temp.value == value

      temp = temp.next_node
    end
    puts 'false'
  end

  def find(value)
    return 'list is empty' if head.nil?

    temp = head
    index = 0
    until temp.value == value
      temp = temp.next_node
      index += 1
    end
    index
  end

  def insert_at(value, index)
    append(value) if head.nil?

    new_node = Node.new(value)
    temp = at(index - 1)
    new_node.next_node = temp.next_node
    temp.next_node = new_node
    self.size += 1
  end
end

list = LinkedList.new

list.append(1)
list.append(2)
list.append(3)

puts list

list.at(1)

list.contains?(2)
puts list.find(2)

list.insert_at('hello', 1)
puts list