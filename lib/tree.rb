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

  def insert(value, root = @root) # rubocop:disable Metrics/AbcSize
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

  def delete(value, root = @root)
    if root.nil?
      root
    elsif value < root.data
      root.left = delete(value, root.left)
    elsif value > root.data
      root.right = delete(value, root.right)
    else
      root = delete_node(root)
    end
    root
  end

  def find(value, root = @root)
    if root.nil?
      root
    elsif value < root.data
      root = find(value, root.left)
    elsif value > root.data
      root = find(value, root.right)
    else
      root
    end
    root
  end

  def level_order(&block)
    nodes = level_order_tree
    if block_given?
      nodes.each(&block)
    else
      level_order_data = []
      nodes.each { |element| level_order_data << element.data }
      level_order_data
    end
  end

  def delete_node(node)
    if node.leaf_node?
      node = nil
    elsif node.one_child?
      node = delete_one_child_node(node)
    elsif node.two_children?
      node.data = find_min(node.right).data
      node.right = delete(node.data, node.right)
    end
    node
  end

  def delete_one_child_node(node)
    if node.left.nil?
      node.right
    else
      node.left
    end
  end

  def find_min(node)
    return node if node.left.nil?

    find_min(node.left)
  end

  def level_order_tree(queue = [@root]) # rubocop:disable Metrics/AbcSize
    return [] if queue.empty?

    queue << queue[0].left unless queue[0].left.nil?
    queue << queue[0].right unless queue[0].right.nil?
    [queue[0]] + level_order_tree(queue[1..-1])
  end

  def pretty_print(node = @root, prefix = '', is_left = true) # rubocop:disable Style/OptionalBooleanParameter
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
