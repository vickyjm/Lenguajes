module Foldable

    # Método que realiza un recorrido BFS desde el self. Llama al bloque con cada
    # valor de los nodos del árbol y toma b como valor base de la operación. 
    # Recibe dos argumentos: b, que es el acumulador y bloque.
    def fold(b, &bloque)
    	cola = [self]
    	while (!cola.empty?)
    		actual = cola.shift
    		b = yield b,actual.n
    		actual.each do |hijo|
    			cola.push(hijo)
    		end
    	end
    	return b
    end

    # Recorre el árbol con BFS desde el self, llamando al bloque con cada valor
    # de los nodos del árbol.
    def map &block
    	cola = [self]
		while(!cola.empty?)
			actual = cola.shift
			yield actual
			actual.each do |hijo|
				cola.push(hijo)
			end
		end    	
    end

    # Recorre el árbol con BFS desde el self, llamando al bloque con cada valor
    # de los nodos del árbol y cambiando su valor a medida que avanza el recorrido.
    def map! &block
    	cola = [self]
    	while (!cola.empty?)
    		actual = cola.shift
    		actual.n = yield actual
    		actual.each do |hijo|
    			cola.push(hijo)
    		end
    	end
    end

end