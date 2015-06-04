module DFS
    def dfs &block
    	yield self
    	self.each {|i| i.dfs &block}
    end

    def dfs! &block
    	self.n = yield self
    	self.each {|i| i.dfs! &block}
    end
end