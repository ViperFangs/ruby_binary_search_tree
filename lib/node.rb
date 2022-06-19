# class Node contains data, left and right attributes
class Node
  attr_accessor :data, :left, :right

  def initialize
    self.data = nil
    self.left = nil
    self.right = nil
  end
end
