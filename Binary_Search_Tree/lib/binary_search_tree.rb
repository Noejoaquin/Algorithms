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
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
  end

  def depth(tree_node = @root)
  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:

end
