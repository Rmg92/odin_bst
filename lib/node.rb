# frozen_string_literal: true

# Node contains everything necessary for a creation of a new node
class Node
  include Comparable
  attr_accessor :data, :left, :right

  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end

  def <=>(other)
    @data <=> other.data
  end

  def leaf_node?
    true if @left.nil? && @right.nil?
  end
end
