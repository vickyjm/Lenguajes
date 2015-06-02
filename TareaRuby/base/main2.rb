require_relative "trees"
require_relative "mod_fold"

class BT; include Foldable; end

x = BT.new(4)
y = BT.new(5)
z = BT.new(6)
w = BT.new(7)
p = BT.new(3, z, w)
q = BT.new(2, x, y)
arbol = BT.new(1, q, p)

puts "--> Arbol -- Original:"
arbol.map { |x| puts x.n }

puts "--> Arbol -- Fold:"
puts(arbol.fold(0) { |acc,x| acc + x })

arbol.map! { |x| x.n * 2 }
puts "--> Arbol -- Map (*2):"
arbol.map { |x| puts x.n }