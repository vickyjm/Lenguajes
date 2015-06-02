class BT
    attr_accessor :n
    attr_reader :l, :r

    def initialize(n, l=nil, r=nil)
        @n = n
        @l = l
        @r = r
    end

    def each 
        if (l != nil)
            yield l
        end
        if (r != nil)
            yield r 
        end 
    end
end

class RT
    attr_accessor :n
    attr_reader :ss

    def initialize(n, *sons)
        @n = n
        @ss = sons
    end

    def each
        yield n
        for i in ss
            yield i
        end
    end
end