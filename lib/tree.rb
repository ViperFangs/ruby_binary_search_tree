# frozen_string_literal: true

require_relative 'node'

# class Tree accepts an array when initialized and has a root attribute
class Tree
  attr_accessor :root

  def initialize(array)
    self.root = build_tree(array.sort.uniq)
  end

  def build_tree(array, start_index = 0, end_index = (array.length - 1))
    return nil if start_index > end_index

    mid_index = (start_index + end_index) / 2

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

  def delete(data, root = self.root)
    return root if root.nil?

    if data < root.data
      root.left = delete(data, root.left)

    elsif data > root.data
      root.right = delete(data, root.right)

    else
      if root.left.nil?
        temp = root.right
        root = nil
        return temp

      elsif root.right.nil?
        temp = root.left
        root = nil
        return temp
      end

      temp = minimum_left_node(root.right)
      root.data = temp.data
      root.right = delete(temp.data, root.right)
    end

    root
  end

  def minimum_left_node(node)
    current_node = node

    current_node = current_node.left until current_node.left.nil?

    current_node
  end

  def find(data, root = self.root)
    return root if root.nil? || root.data == data

    return find(data, root.right) if root.data < data

    find(data, root.left)
  end

  def level_order
    return if root.nil?

    queue = []
    queue.push(root)

    if block_given?
      until queue.empty?
        yield current_node = queue.first
        queue.push(current_node.left) unless current_node.left.nil?
        queue.push(current_node.right) unless current_node.right.nil?
        queue.shift
      end

    else
      return_queue = []
      until queue.empty?
        current_node = queue.first
        queue.push(current_node.left) unless current_node.left.nil?
        queue.push(current_node.right) unless current_node.right.nil?
        return_queue.push(queue.shift.data)
      end

      return_queue
    end
  end

  def inorder(current_node = root, array = [], &block)
    if block_given?
      return if current_node.nil?

      inorder(current_node.left, &block)
      block.call(current_node)
      inorder(current_node.right, &block)

    else
      return [] if current_node.nil?

      inorder(current_node.left, array)
      array.push current_node.data
      inorder(current_node.right, array)

      array
    end
  end

  def preorder(current_node = root, array = [], &block)
    if block_given?
      return if current_node.nil?

      block.call(current_node)
      preorder(current_node.left, &block)
      preorder(current_node.right, &block)

    else
      return [] if current_node.nil?

      array.push current_node.data
      preorder(current_node.left, array)
      preorder(current_node.right, array)

      array
    end
  end

  def postorder(current_node = root, array = [], &block)
    if block_given?
      return if current_node.nil?

      postorder(current_node.left, &block)
      postorder(current_node.right, &block)
      block.call(current_node)

    else
      return [] if current_node.nil?

      postorder(current_node.left, array)
      postorder(current_node.right, array)
      array.push current_node.data
      array
    end
  end

  def height(node = root)
    return 0 if node.nil?

    1 + [height(node.left), height(node.right)].max.to_i
  end

  def balanced?(node = root)
    return true if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)

    return true if (left_height - right_height).abs <= 1 && balanced?(node.left) && balanced?(node.right)

    false
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

new_tree = Tree.new([1, 2, 3, 4, 5, 6, 7])
new_tree.pretty_print

new_tree.insert(10)
puts
puts
new_tree.pretty_print

new_tree.delete(10)
puts
puts
new_tree.pretty_print

new_tree.delete(5)
puts
puts
new_tree.pretty_print

puts new_tree.level_order.to_s

puts new_tree.postorder.to_s

puts new_tree.height

puts new_tree.balanced?