# frozen_string_literal: true

require_relative 'tree'

tree = Tree.new
tree.build_tree(Array.new(rand(1..15)) { rand(1..100) })
puts ''
tree.pretty_print
puts ''

random_number = rand(1..100)
puts "Insert #{random_number}"
tree.insert(random_number)
puts ''
tree.pretty_print
puts ''

random_number = rand(1..100)
puts "Delete #{random_number}"
tree.delete(random_number)
puts ''
tree.pretty_print
puts ''

random_number = rand(1..100)
puts ''
puts "Find #{random_number}"
p tree.find(random_number)
puts ''

puts ''
puts '#level_order without block'
p tree.level_order
puts ''

puts ''
puts '#level_order with block'
tree.level_order do |node|
  puts "#{node} - #{node.data}"
end
puts ''

puts ''
puts '#inorder without block'
p tree.inorder
puts ''

puts ''
puts '#inorder with block'
tree.inorder do |node|
  puts "#{node} - #{node.data}"
end
puts ''

puts ''
puts '#preorder without block'
p tree.preorder
puts ''

puts ''
puts '#preorder with block'
tree.preorder do |node|
  puts "#{node} - #{node.data}"
end
puts ''

puts ''
puts '#postorder without block'
p tree.postorder
puts ''

puts ''
puts '#postorder with block'
tree.postorder do |node|
  puts "#{node} - #{node.data}"
end
puts ''

puts ''
puts "Height of #{random_number}"
tree.pretty_print
puts tree.height(tree.find(random_number))
puts ''

puts ''
puts "Depth of #{random_number}"
tree.pretty_print
puts tree.depth(tree.find(random_number))
puts ''

puts ''
puts 'Balanced?'
puts tree.balanced?
puts ''

puts ''
puts 'Rebalance'
tree.rebalance
tree.pretty_print
puts ''
