# frozen_string_literal: true

require_relative 'tree'

tree = Tree.new
tree.build_tree((Array.new(rand(1..15)) { rand(1..100) }))
puts ''
tree.pretty_print
puts ''
