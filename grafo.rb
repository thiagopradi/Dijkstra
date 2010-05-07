require "util"
class Grafo
  attr_accessor :list
  attr_accessor :adj_list

  def initialize()
    @list = []
    @adj_list = {}
  end

  def add_vertice(v)
    @list << v
  end

  def add_aresta(v1, v2, valor)
    if @adj_list[v1].is_a?(Hash)
      @adj_list[v1][v2] = valor
    else
      @adj_list[v1] = {v2 => valor}
    end
  end

  def adj_vertices(vertice)
    if @adj_list[vertice].nil?
      return []
    else
      return @adj_list[vertice].keys 
    end
  end

  def distancia(v1, v2)
    if(v1 == v2)
      return 0
    elsif !@adj_list[v1].nil? && @adj_list[v1].keys.include?(v2)
      return @adj_list[v1][v2]
    else
      return infinity
    end
  end
end