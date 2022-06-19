# frozen_string_literal: true

require_relative 'node'

# class Tree accepts an array when initialized and has a root attribute
class Tree
  attr_accessor :root

  def initialize
    self.root = build_tree
  end

  def build_tree
    return
  end
end