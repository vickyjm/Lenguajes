require_relative "mod_hs"

puts (String.mconcat(["hola"," mundo"]))
#=> hola mundo
puts (TrueClass.mconcat([true,false]))
#=> false
puts (FalseClass.mconcat([true,false]))
#=> true
puts (Fixnum.mconcat([1,2,3,4,5]))
#=> 15
puts(String.inj 'c', "hola")
#=> cccc
print(Fixnum.inj 27, [1,2,3,4]); puts
#=> [27,27,27,27] 