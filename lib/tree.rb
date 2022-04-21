# frozen_string_literal: true

require_relative 'node'

# Builds a binary search tree
class Tree
  def initialize
    @root = nil
  end

  def build_tree(data)
    treated_data = data.sort.uniq
    return nil if treated_data.empty?

    mid = treated_data.length / 2
    node = Node.new(treated_data[mid])
    node.left = build_tree(treated_data[0, mid])
    node.right = build_tree(treated_data[mid + 1, treated_data.length])
    @root = node
    @root
  end

  def insert(value, root = @root)
    return @root = Node.new(value) if root.nil?

    if value < root.data
      return root.left = Node.new(value) if root.left.nil?

      insert(value, root.left)
    elsif value > root.data
      return root.right = Node.new(value) if root.right.nil?

      insert(value, root.right)
    else
      root
    end
  end

  def delete(value, root = @root, predecessor = nil)
    return if root.nil?

    if root.data == value && root.leaf_node?
      delete_leaf_node(root, predecessor)
    elsif root.data == value && root.one_child?
      delete_one_child_node(root, predecessor)
    else
      delete(value, root.left, root)
      delete(value, root.right, root)
    end
  end

  def delete_leaf_node(node, predecessor)
    if predecessor.left == node
      predecessor.left = nil
    elsif predecessor.right == node
      predecessor.right = nil
    end
  end

  def delete_one_child_node(node, predecessor)
    if predecessor.left == node
      predecessor.left = if node.left.nil?
                           node.right
                         else
                           node.left
                         end
    elsif predecessor.right == node
      predecessor.right = if node.left.nil?
                           node.right
                         else
                           node.left
                         end
    end
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
