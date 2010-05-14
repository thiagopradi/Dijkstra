class Vertex
  attr_accessor :name, :dist, :pi
  
  def initialize(name)
    @name = name
    @pi = nil
    @dist = inifinity()
  end
  
  def inifinity
    1.1/0.0
  end
end