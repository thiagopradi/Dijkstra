require "util"
class Graph
  attr_accessor :list
  attr_accessor :adj_list

  def initialize()
    @list = []
    @adj_list = {}
  end

  def add_vertex(v)
    @list << v
  end

  def add_edge(v1, v2, value)
    if @adj_list[v1].is_a?(Hash)
      @adj_list[v1][v2] = value
    else
      @adj_list[v1] = {v2 => value}
    end
  end

  def adj_vertices(vertex)
    if @adj_list[vertex].nil?
      return []
    else
      return @adj_list[vertex].keys 
    end
  end

  def distance(v1, v2)
    if(v1 == v2)
      return 0
    elsif !@adj_list[v1].nil? && @adj_list[v1].keys.include?(v2)
      return @adj_list[v1][v2]
    else
      return infinity
    end
  end
end