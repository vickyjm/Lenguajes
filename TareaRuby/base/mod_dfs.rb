module DFS
	# Método que permite moverse por árboles (binarios y rosas) siguiendo un 
	# recorrido DFS. 
    def dfs &block
    	yield self
    	self.each {|i| i.dfs &block}
    end

    # Método que permite realizar un recorrido DFS pero modificando el valor
    # de los nodos a medida que avanza. 
    def dfs! &block
    	self.n = yield self
    	self.each {|i| i.dfs! &block}
    end
end