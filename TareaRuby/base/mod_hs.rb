module Monoid
    #Minimal implementation
        # mempty  :: a
        # mappend :: a -> a -> a

    # mconcat :: [a] -> a
    def mconcat(as)
    end
end

module Functor
    #Minimal implementation
        # fmap :: (a -> b) -> f a -> f b

    # (<$) :: a -> f b -> f a
    def inj a, fb
    end
end

# Monoid Instances

# All
class TrueClass
    extend Monoid
end

# Any
class FalseClass
    extend Monoid
end

class String
    extend Monoid
end

class Fixnum
    extend Monoid
end

# Functor Instances

class String
    extend Functor
end

class Fixnum
    extend Functor
end