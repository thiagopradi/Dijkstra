class Vertice
  attr_accessor :nome, :dist, :pi
  
  def initialize(nome)
    @nome = nome
    @pi = nil
    @dist = inifinity()
  end
  
  def inifinity
    1.1/0.0
  end
end