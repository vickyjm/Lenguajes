require_relative "trees"
require_relative "node_dd"
require_relative "mod_dfs"

# Main

class BT; include DFS; end

cuatro = BT.new(4)
cinco  = BT.new(5)
seis   = BT.new(6)
siete  = BT.new(7)
tres = BT.new(3, seis,   siete)
dos  = BT.new(2, cuatro, cinco)
arbol = BT.new(1, dos, tres)

x = BT.new(:Z)
y = BT.new(:btzkpthdqz)
z = BT.new(:ohcz)
w = BT.new(:czkd)
p = BT.new(:ptd, z, w)
q = BT.new(Node.new(5,29), x, y)
arbol2 = BT.new(:Ktbzr, q, p)

puts "--> Arbol1:"
arbol.dfs { |x| puts x.n }

puts "--> Arbol2:"
v = Next.new
arbol2.dfs { |x| puts (x.n.visitado_por v) }