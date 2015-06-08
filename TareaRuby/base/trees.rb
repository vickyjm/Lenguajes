# Representación de árboles binarios
class BT
    attr_accessor :n        #Objeto que guarda el nodo
    attr_reader :l, :r      #Hijos izquierdo y derecho

    # Constructor de un árbol binario. Si no se indican explícitamente los hijos
    # por defecto se inicializan en nil.
    def initialize(n, l=nil, r=nil)
        @n = n
        @l = l
        @r = r
    end

    # Método para iterar sobre los hijos de un nodo. Recibe implícitamente un
    # bloque.
    def each 
        if (l != nil)
            yield l
        end
        if (r != nil)
            yield r 
        end 
    end
end

# Representación de árboles rosa (Rose Tree)
class RT
    attr_accessor :n  # Objeto que guarda el nodo
    attr_reader :ss   # Arreglo de hijos

    # Constructor de un árbol rosa. Recibe un nodo y una cantidad variable de
    # parámetros que serán los hijos del nodo y se almacenarán en el arreglo sons.
    def initialize(n, *sons)
        @n = n
        @ss = sons
    end

    # Método para iterar sobre los hijos de un nodo en caso de estar definidos.
    # Recibe implícitamente un bloque.
    def each
        yield n
        for i in ss
            yield i
        end
    end
end