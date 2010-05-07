class Aresta
  attr_accessor :origem, :destino
  
  def initialize(opts={})
    @origem = opts[:origem]
    @destino = opts[:destino]
  end
end