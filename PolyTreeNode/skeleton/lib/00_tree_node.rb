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

  def parent=(new_parent)
    if self.parent.nil?
      @parent = new_parent
      new_parent.children << self unless new_parent.nil? || new_parent.children.include?(self)
    else
      if new_parent.nil?
        self.parent.children.delete(self)
        @parent = new_parent
      else
        new_parent.children << self.parent.children.delete(self)
        @parent = new_parent
      end
    end

    def add_child(child_node)
      child_node.parent=(self)
    end

    def remove_child(child_node)
      raise "Error" unless self.children.include?(child_node)
      child_node.parent=(nil)
    end

    def dfs(target_value)
      return self if self.value == target_value
      return nil if self.children.empty?

      self.children.each do |child|
        temp = child.dfs(target_value)
        return temp unless temp.nil?
      end
      nil
    end

    def bfs(target_value)
      
    end

    def inspect
      self.value
    end

  end



  attr_reader :value, :children, :parent

end
