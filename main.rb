require "util"
require "aresta"
require "vertice"
require "grafo"
require "pqueue"

def relax(v1, v2, grafo)
  if(v2.dist > v1.dist + grafo.distancia(v1, v2))
    v2.dist = v1.dist + grafo.distancia(v1, v2)
    v2.pi = v1
  end
end        
        
v1 = Vertice.new(:v1)
v2 = Vertice.new(:v2)
v3 = Vertice.new(:v3)
v4 = Vertice.new(:v4)
v5 = Vertice.new(:v5)

v1.dist = 0

g = Grafo.new()
g.add_vertice(v1)
g.add_vertice(v2)
g.add_vertice(v3)
g.add_vertice(v4)
g.add_vertice(v5)

g.add_aresta(v1,v2,2)
g.add_aresta(v1,v5,10)
g.add_aresta(v2,v3,3)
g.add_aresta(v2,v5,7)
g.add_aresta(v3,v4,4)
g.add_aresta(v5,v3,8)
g.add_aresta(v5,v4,5)        

#Djikstra
s = []
q = PQueue.new(proc{|v1, v2| v1.dist < v2.dist})
q.push_array(g.list)

while(!q.to_a.empty?)
  vertice = q.pop()
  s << vertice
  puts vertice.nome
  
  g.adj_vertices(vertice).each do |adj_v|
    relax(vertice, adj_v, g)
  end
end

s.each do |vertice|
  if !vertice.pi.nil?
    puts "Vertice: #{vertice.nome} Distancia: #{vertice.dist} Pi: #{vertice.pi.nome}"
  else
    puts "Vertice: #{vertice.nome} Distancia: #{vertice.dist}"
  end    
end





