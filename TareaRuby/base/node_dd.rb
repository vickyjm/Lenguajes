

class Node
    attr_reader :x, :y
    
    def initialize x, y
    	@x = x
    	@y = y
    end

    def visitado_por v
    	v.visitar_Nodo(self)
    end

    def to_s
    	@x.to_s + " - " + @y.to_s
    end
end

class Fixnum
	def visitado_por v
		v.visitar_Fixnum(self)
	end
end

class Symbol
	def visitado_por v
		v.visitar_Symbol(self)
	end
end

class Visitor; end

class Mirror < Visitor
	def visitar_Fixnum x
		return -x
	end

	def visitar_Symbol x
		palin = x.to_s.reverse.intern
		return (x.to_s + palin.to_s).intern
	end

	def visitar_Nodo z
		return Node.new(z.x*(-1),z.y*(-1))
	end
end

class Next < Visitor
	def visitar_Fixnum x
		return x+1
	end

	def visitar_Symbol x
		i = 0
		nuevosym = :""
		while i < x.length
			nuevosym = (nuevosym.to_s + x[i].intern.succ[0].intern.to_s).intern
			i = i+1
		end
		return nuevosym
	end

	def visitar_Nodo z
		return Node.new(z.x+1,z.y+1)
	end
end

class Strong < Visitor
	def visitar_Fixnum x
		return x*100
	end

	def visitar_Symbol x
		return x.swapcase
	end

	def visitar_Nodo x
		return Node.new(z.x*100,z.y*100)
	end
end