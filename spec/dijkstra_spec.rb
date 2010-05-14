require "spec_helper"

describe Dijkstra do
  before(:each) do
    @graph = Graph.new()

    @v1 = Vertex.new(:v1)
    @v2 = Vertex.new(:v2)
    @v3 = Vertex.new(:v3)
    @v4 = Vertex.new(:v4)
    @v5 = Vertex.new(:v5)

    @v1.dist = 0

    @graph.add_vertex(@v1)
    @graph.add_vertex(@v2)
    @graph.add_vertex(@v3)
    @graph.add_vertex(@v4)
    @graph.add_vertex(@v5)

    @graph.add_edge(@v1,@v2,2)
    @graph.add_edge(@v1,@v5,10)
    @graph.add_edge(@v2,@v3,3)
    @graph.add_edge(@v2,@v5,7)
    @graph.add_edge(@v3,@v4,4)
    @graph.add_edge(@v5,@v3,8)
    @graph.add_edge(@v5,@v4,5)

    @dijkstra = Dijkstra.new(@graph)
  end

  it "deve retornar uma lista vazia no caso de não calculado os caminhos minimos" do
    @dijkstra.result_list.should == []
  end

  it "deve retornar a lista de caminhos mínimos" do
    @dijkstra.run()
    @dijkstra.result_list.should_not be_empty
  end

  describe "calculando os caminhos mínimos" do
    before(:each) do
      @dijkstra.run()
    end
    
    it "deve calcular os caminhos minimos para o vértice inicial" do
      @v1.dist.should == 0
      @v1.pi.should be_nil
    end

    it "deve calcular os caminhos minimos para o vértice v2" do
      @v2.dist.should == 2
      @v2.pi.should == @v1
    end
    
    it "deve calcular os caminhos minimos para o vértice v3" do
      @v3.dist.should == 5
      @v3.pi.should == @v2
    end  
    
    it "deve calcular os caminhos minimos para o vértice v4" do
      @v4.dist.should == 9
      @v4.pi.should == @v3
    end 
    
    it "deve calcular os caminhos minimos para o vértice v5" do
      @v5.dist.should == 9
      @v5.pi.should == @v2
    end
  end



end