module Monoid
    #Minimal implementation
        # mempty  :: a
        # mappend :: a -> a -> a

    # mconcat :: [a] -> a
    def mconcat(as)
        total = self.mempty
        for i in as
            total = self.mappend(total,i)
        end

        return total
    end
end

module Functor
    #Minimal implementation
        # fmap :: (a -> b) -> f a -> f b

    # (<$) :: a -> f b -> f a
    def inj a, fb
        return a.fmap(Proc.new{|x| (x << a)},fb)
    end
end

# Monoid Instances

# All
class TrueClass
    extend Monoid

    def self.mempty 
        return true
    end

    def self.mappend(x, y)
        return (x & y)
    end
end

# Any
class FalseClass
    extend Monoid

    def self.mempty
        return false
    end

    def self.mappend(x, y)
        return (x | y)
    end
end

class String
    extend Monoid

    def self.mempty
        return ""
    end

    def self.mappend(x, y)
        return (x + y)
    end
end

class Fixnum
    extend Monoid

    def self.mempty
        return 0
    end

    def self.mappend(x, y)
        return (x + y)
    end
end

# Functor Instances

class String
    extend Functor

    def fmap(f,x)
        total = ""
        i = 0 
        while i < x.length
            total = f.call(total)
            i = i+1
        end

        return total
    end

end

class Fixnum
    extend Functor

    def fmap(f,x)
        total = []
        for i in x
            total = f.call(total)
        end

        return total
    end
end