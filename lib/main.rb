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
puts "Find #{random_number}"
p tree.find(random_number)
