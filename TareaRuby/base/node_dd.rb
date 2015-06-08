class Node
    attr_reader :x, :y
    
    def initialize x, y
    	@x = x
    	@y = y
    end

    # Método que recibe una instancia de clase que operará sobre el objeto y
    # retornará otro objeto de clase Fixnum, Symbol o Node, dependiendo de cuál
    # instancia se visite.
    def visitado_por v
    	v.visitar_Nodo(self)
    end

    # Método que permite convertir un objeto Node en un String.
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

# Clase abstracta Visitor
class Visitor; end

class Mirror < Visitor

	# Con un nodo Fixnum retorna el negativo.
	def visitar_Fixnum x
		return -x
	end

	# Con un nodo Symbol retorna un símbolo que sea palíndromo.
	def visitar_Symbol x
		palin = x.to_s.reverse.intern
		return (x.to_s + palin.to_s).intern
	end

	# Con un nodo Node retorna un nodo con los atributos negados.
	def visitar_Nodo z
		return Node.new(z.x*(-1),z.y*(-1))
	end
end

class Next < Visitor

	# Con un nodo Fixnum retorna el próximo número.
	def visitar_Fixnum x
		return x+1
	end

	# Con un nodo Symbol retorna un símbolo con los sucesores de cada caracter.
	def visitar_Symbol x
		i = 0
		nuevosym = :""
		while i < x.length
			nuevosym = (nuevosym.to_s + x[i].intern.succ[0].intern.to_s).intern
			i = i+1
		end
		return nuevosym
	end

	# Con un nodo Node retorna un nodo donde cada atributo tendrá su sucesor.
	def visitar_Nodo z
		return Node.new(z.x+1,z.y+1)
	end
end

class Strong < Visitor

	# Con un nodo Fixnum retorna el número multiplicado por 100.
	def visitar_Fixnum x
		return x*100
	end

	# Con un nodo Symbol retorna el símbolo en mayúsculas.
	def visitar_Symbol x
		return x.swapcase
	end

	# Con un nodo Node retorna un nodo donde cada atributo tendrá 100 veces su
	# valor.
	def visitar_Nodo x
		return Node.new(z.x*100,z.y*100)
	end
end