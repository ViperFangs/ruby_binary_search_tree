# frozen_string_literal: true

# class Node contains data, left and right attributes
class Node
  include Comparable

  def <=>(other)
    data <=> other.data
  end

  attr_accessor :data, :left, :right

  def initialize
    self.data = nil
    self.left = nil
    self.right = nil
  end
end
