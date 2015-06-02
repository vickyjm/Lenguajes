class Node
    attr_reader :x, :y
    
    def initialize x, y
    end

    def visitado_por v
    end

    def to_s
    end
end

class Visitor; end

class Mirror < Visitor
end

class Next < Visitor
end

class Strong < Visitor
end