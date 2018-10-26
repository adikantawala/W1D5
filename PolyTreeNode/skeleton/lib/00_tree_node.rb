class PolyTreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    self.parent
  end

  def children
    self.children
  end

  def value
    self.value
  end

  def parent=(parent_property)
    @parent = parent_property
    parent_property.children << self unless parent_property.nil?
  end



  attr_reader :value, :children, :parent

end
