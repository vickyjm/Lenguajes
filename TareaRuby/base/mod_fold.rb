module Foldable

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