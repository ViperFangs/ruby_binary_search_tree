# frozen_string_literal: true

require_relative 'node'

# class Tree accepts an array when initialized and has a root attribute
class Tree
  attr_accessor :root

  def initialize(array)
    @included_data_array = []
    self.root = build_tree(array.sort.uniq)
  end

  def build_tree(array, start_index = 0, end_index = (array.length - 1))
    return nil if start_index > end_index

    mid_index = (start_index + end_index) / 2

    return nil if @included_data_array.include? array[mid_index]

    new_node = Node.new(array[mid_index])
    new_node.left = build_tree(array, start_index, mid_index - 1)
    new_node.right = build_tree(array, mid_index + 1, end_index)

    new_node
  end

  def insert(data, root = self.root)
    return Node.new(data) if root.nil?

    return root if root.data == data

    if root.data < data
      root.right = insert(data, root.right)

    else
      root.left = insert(data, root.left)
    end

    root
  end

  def find(data, root = self.root)
    return root if root.nil? || root.data == data

    return find(data, root.right) if root.data < data

    find(data, root.left)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

new_tree = Tree.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
new_tree.pretty_print

new_tree.insert(10)
puts
puts
new_tree.pretty_print
