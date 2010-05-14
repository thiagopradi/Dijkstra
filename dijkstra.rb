require "util"
require "vertex"
require "graph"
require "pqueue"

class Dijkstra
  attr_accessor :graph, :queue, :result_list

  def initialize(graph)
    @graph = graph
    @queue = PQueue.new(proc{|v1, v2| v1.dist < v2.dist})
    @result_list = []
  end

  def run()
    @result_list = []

    @queue.push_array(@graph.list)

    while(!@queue.to_a.empty?)
      vertex = @queue.pop()
      @result_list << vertex

      @graph.adj_vertices(vertex).each do |adj_v|
        relax(vertex, adj_v)
      end
    end
  end
  
  def print()
    self.run() if @result_list.empty?
    
    @result_list.each do |vertex|
      if !vertex.pi.nil?
        puts "Vertex: #{vertex.name} Distance: #{vertex.dist} Pi: #{vertex.pi.name}"
      else
        puts "Vertex: #{vertex.name} Distance: #{vertex.dist}"
      end    
    end
  end


  def relax(v1, v2)
    if(v2.dist > v1.dist + @graph.distance(v1, v2))
      v2.dist = v1.dist + @graph.distance(v1, v2)
      v2.pi = v1
    end
  end
end



 








