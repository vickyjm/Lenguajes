

class Node
    attr_reader :x, :y
    
    def initialize x, y
    	@x = x
    	@y = y
    end

    def visitado_por v
    	v.visitar(self)
    end

    def mirror 
    	return Node.new(@x*(-1),@y*(-1))
    end

    def next
    	return Node.new(@x+1,@y+1)
    end

    def strong 
    	return Node.new(@x*100,@y*100)
    end

    def to_s
    	@x.to_s + " - " + @y.to_s
    end
end

class Fixnum

	def visitado_por v
		v.visitar(self)
	end

	def mirror
		return -self
	end

	def next
		return self+1
	end

	def strong
		return self*100
	end
end

class Symbol

	def visitado_por v
		v.visitar(self)
	end

	def mirror
		palin = self.to_s.reverse.intern
		return (self.to_s + palin.to_s).intern
	end

	def next
		i = 0
		nuevosym = :""
		while i < self.length
			nuevosym = (nuevosym.to_s + self[i].intern.succ[0].intern.to_s).intern
			i = i+1
		end
		return nuevosym
	end

	def strong 
		return self.swapcase
	end


end

class Visitor; end

class Mirror < Visitor
	def visitar x
		puts x.mirror()
	end
end

class Next < Visitor
	def visitar x
		puts x.next()
	end
end

class Strong < Visitor
	def visitar x
		puts x.strong()
	end
end