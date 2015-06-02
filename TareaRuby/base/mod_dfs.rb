module DFS
    def dfs &block
    	yield self
    	self.each {|i| i.dfs &block}
    end

    def dfs! &block

    end
end