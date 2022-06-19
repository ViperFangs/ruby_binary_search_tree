# frozen_string_literal: true

require_relative 'lib/tree'

# Step 1: Create a binary search tree from an array of random numbers (Array.new(15) { rand(1..100) })
new_tree = Tree.new(Array.new(15) { rand(1..100) })
new_tree.pretty_print
puts

# Step 2: Confirm that the tree is balanced by calling #balanced?
puts new_tree.balanced?
puts

# Step 3: Print out all elements in level, pre, post, and in order
puts new_tree.level_order.to_s
puts new_tree.level_order { |node| print "#{node.data} " }
puts

puts new_tree.preorder.to_s
puts new_tree.preorder { |node| print "#{node.data} " }
puts

puts new_tree.inorder.to_s
puts new_tree.inorder { |node| print "#{node.data} " }
puts

puts new_tree.postorder.to_s
puts new_tree.postorder { |node| print "#{node.data} " }
puts

# Step 4: Unbalance the tree by adding several numbers > 100
10.times { new_tree.insert(rand(100..200)) }
new_tree.pretty_print
puts

# Step 5: Confirm that the tree is unbalanced by calling #balanced?
puts new_tree.balanced?
puts

# Step 6: Balance the tree by calling #rebalance
new_tree.rebalance
new_tree.pretty_print
puts

# Step 7: Confirm that the tree is balanced by calling #balanced?
puts new_tree.balanced?
puts

# Step 8: Print out all elements in level, pre, post, and in order
puts new_tree.level_order.to_s
puts new_tree.level_order { |node| print "#{node.data} " }
puts

puts new_tree.preorder.to_s
puts new_tree.preorder { |node| print "#{node.data} " }
puts

puts new_tree.inorder.to_s
puts new_tree.inorder { |node| print "#{node.data} " }
puts

puts new_tree.postorder.to_s
puts new_tree.postorder { |node| print "#{node.data} " }
puts
