# frozen_string_literal: true

require_relative 'node'

# Builds a binary search tree
class Tree
  def initialize
    @root = nil
    @treated_data = false
  end

  def build_tree(data)
    treated_data = data.sort.uniq
    mid = treated_data.length / 2
    node = Node.new(treated_data[mid])
    return nil if treated_data.empty?

    node.left = build_tree(treated_data[0, mid])
    node.right = build_tree(treated_data[mid + 1, treated_data.length])
    @root = node
  end

  
end
