# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.

require('bst_node')
require 'byebug'


class BinarySearchTree

  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value, node = @root)
    if node.nil?
      @root = BSTNode.new(value)
      return
    else
      if value <= node.value
        if node.left
          insert(value, node.left)
        else
          node.left = BSTNode.new(value)
        end
      end
      if value >= node.value
        if node.right
          insert(value, node.right)
        else
          node.right = BSTNode.new(value)
        end
      end
    end
  end

  def find(value, tree_node = @root)
    return nil if tree_node.nil?
    return tree_node if tree_node.value == value
    if tree_node.value > value
      find(value, tree_node.left)
    else
      find(value, tree_node.right)
    end
  end

  def delete(value)
    tree_node = find(value)
    if tree_node.left.nil? && tree_node.right.nil?
      return @root = nil if tree_node == @root
      parent = find_parent(tree_node, @root)
      parent.left == tree_node ? parent.left = nil : parent.right = nil

    elsif children_amt(tree_node) == 1
      parent = find_parent(tree_node, @root)
      if parent.left == tree_node
        tree_node.left ? parent.left = tree_node.left : parent.left = tree_node.right
      else
        tree_node.left ? parent.right = tree_node.left : parent.right = tree_node.right
      end

    elsif children_amt(tree_node) == 2
      parent_node = find_parent(tree_node, @root)
      max_decendent = maximum(tree_node.left)
      # puts max_decendent.value
      max_parent = find_parent(max_decendent, @root)
      if parent_node.left == tree_node
        parent_node.left == max_decendent
      else
        parent_node.right == max_decendent
      end
      if max_decendent.left
        max_parent.right = max_decendent.left
      end
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return tree_node if tree_node.right.nil?
    maximum(tree_node.right)
  end

  def depth(tree_node = @root)
    return 0 if tree_node.nil?
    return 0 if tree_node.left.nil? && tree_node.right.nil?
    if tree_node.left
      left_tree_depth = 1 + depth(tree_node.left)
    else
      left_tree_depth = 0
    end
    if tree_node.right
      right_tree_depth = 1 + depth(tree_node.right)
    else
      right_tree_depth = 0
    end
    [left_tree_depth, right_tree_depth].max
  end

  def is_balanced?(tree_node = @root)
    return true if tree_node.nil?
    right_depth = depth(tree_node.right)
    left_depth = depth(tree_node.left)

    if (right_depth - left_depth).abs <= 1 && is_balanced?(tree_node.left) && is_balanced?(tree_node.right)
      return true
    end
    false

  end

  def in_order_traversal(tree_node = @root, arr = [])
    return arr if tree_node.nil?
    left_side = in_order_traversal(tree_node.left)
    right_side = in_order_traversal(tree_node.right)
    left_side.concat([tree_node.value]).concat(right_side)
  end


  private
  def find_parent(tree_node, node_to_check)
    if node_to_check.right == tree_node || node_to_check.left == tree_node
      return node_to_check
    end
      find_parent(tree_node, node_to_check.left) ||
      find_parent(tree_node, node_to_check.right)
  end

  def children_amt(node)
    if node.left && node.right
      return 2
    else
      return 1
    end
  end

  # optional helper methods go here:

end
