class FindNode
	attr_accessor :tree_node, :id
	
	def initialize(tree_node, id)
		@tree_node = tree_node
		@id = id
	end
	
	def find_node
		find_children(@tree_node)
	end

	#递归调用
	def find_children(tree_node)
		return tree_node if tree_node[:id] == @id
		return nil unless tree_node.key?(:children)
		tree_node[:children].each do |tree|
			item = find_children(tree)
			return item unless item.nil?
		end
		nil
	end
end
