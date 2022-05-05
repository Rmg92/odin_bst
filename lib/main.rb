# frozen_string_literal: true

require_relative 'tree'

tree = Tree.new
tree.build_tree(Array.new(rand(1..15)) { rand(1..100) })
puts ' '
tree.pretty_print
puts ' '
puts "Tree is balanced? #{tree.balanced?}"
puts ' '
puts 'Level Order'
p tree.level_order
puts ' '
puts 'Preorder'
p tree.preorder
puts ' '
puts 'Postorder'
p tree.postorder
puts ' '
puts 'Inorder'
p tree.inorder
tree.insert(1000)
tree.insert(100)
tree.insert(500)
puts ' '
tree.pretty_print
puts ' '
puts "Tree is balanced? #{tree.balanced?}"
puts ' '
puts "Rebalancing tree"
tree.rebalance
puts ' '
puts "Tree is balanced? #{tree.balanced?}"
puts ' '
puts 'Level Order'
p tree.level_order
puts ' '
puts 'Preorder'
p tree.preorder
puts ' '
puts 'Postorder'
p tree.postorder
puts ' '
puts 'Inorder'
p tree.inorder
puts ' '
tree.pretty_print
