# frozen_string_literal: true

require_relative 'tree'

tree = Tree.new
# tree.build_tree(Array.new(rand(1..15)) { rand(1..100) })
# puts ''
# tree.pretty_print
# puts ''

# tree.insert(rand(1..100))
# puts ''
# tree.pretty_print
# puts ''

tree.build_tree([1, 2, 3, 4, 5, 6])
puts ''
tree.pretty_print
puts ''

tree.delete(1)
puts ''
tree.pretty_print
puts ''

tree.delete(2)
puts ''
tree.pretty_print
puts ''

tree.delete(4)
puts ''
tree.pretty_print
puts ''
