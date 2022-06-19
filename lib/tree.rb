# frozen_string_literal: true

require_relative 'node'

# class Tree accepts an array when initialized and has a root attribute
class Tree
  attr_accessor :root

  def initialize(array)
    self.root = build_tree(array)
  end

  def build_tree(array, start_index = 0, end_index = (array.length - 1))
    return nil if start_index > end_index

    mid_index = (start_index + end_index) / 2
    new_node = Node.new(array[mid_index])

    new_node.right = build_tree(array, start_index, mid_index - 1)
    new_node.left = build_tree(array, mid_index + 1, end_index)

    new_node
  end
end

# Tree.new([1, 2, 3, 4])