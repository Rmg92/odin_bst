# frozen_string_literal: true

require_relative 'node'

# Builds a binary search tree
class Tree # rubocop:disable Metrics/ClassLength
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

  def inorder(&block)
    nodes = inorder_tree
    if block_given?
      nodes.each(&block)
    else
      inorder_array = []
      nodes.each { |element| inorder_array << element.data }
      inorder_array
    end
  end

  def preorder(&block)
    nodes = preorder_tree
    if block_given?
      nodes.each(&block)
    else
      preorder_array = []
      nodes.each { |element| preorder_array << element.data }
      preorder_array
    end
  end

  def postorder(&block)
    nodes = postorder_tree
    if block_given?
      nodes.each(&block)
    else
      postorder_array = []
      nodes.each { |element| postorder_array << element.data }
      postorder_array
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

  def inorder_tree(root = @root)
    return [] if root.nil?

    inorder_tree(root.left) + [root] + inorder_tree(root.right)
  end

  def preorder_tree(root = @root)
    return [] if root.nil?

    [root] + preorder_tree(root.left) + preorder_tree(root.right)
  end

  def postorder_tree(root = @root)
    return [] if root.nil?

    postorder_tree(root.left) + postorder_tree(root.right) + [root]
  end

  def height(node)
    if node.nil?
      0
    else
      [1 + height(node.left), 1 + height(node.right)].max
    end
  end

  def depth(node, root = @root)
    return 'Node not found!' if node.nil?

    if node == root
      1
    elsif node < root
      1 + depth(node, root.left)
    elsif node > root
      1 + depth(node, root.right)
    end
  end

  def pretty_print(node = @root, prefix = '', is_left = true) # rubocop:disable Style/OptionalBooleanParameter
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
