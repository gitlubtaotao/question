class AddNode
	
	attr_accessor :src_name, :root_node, :view_array,
	              :button_array
	
	TREE = {
			id: '1',
			type: 'View',
			name: 'view',
			children: [{
					           id: '2',
					           type: 'Button',
					           name: 'button'
			           },
			           {
					           id: '3',
					           type: 'View',
					           name: 'view_1',
					           children: [{
							                      id: '4',
							                      type: 'Button',
							                      name: 'button_1'
					                      },
					                      {
							                      id: '5',
							                      type: 'View',
							                      name: 'view_2'
					                      }]}]
	}
	
	def initialize(src_name, root_node = TREE)
		@src_name = src_name
		@root_node = root_node
		@view_array = []
		@button_array = []
	end
	
	def get_inc_name
		find_children(@root_node)
	end
	
	def find_children(tree_node)
		if tree_node[:type] == 'View'
			if tree_node[:children].nil?
				return add_node(tree_node)
			else
				tree_node[:children].each do |node|
					number = node[:name].split('_')[1].to_i
					node[:type] == "Button" ? @button_array.push(number) : @view_array.push(number)
					next if node[:type] == 'Button'
					value =  find_children(node)
					return value unless value.nil?
				end
			end
		end
	end
	
	def add_node(tree_node)
		current_id = search_node_id(@src_name == 'button' ? @button_array : @view_array)
		{
				id: tree_node[:id].to_i + 1,
				name: @src_name + '_' + current_id.to_s,
				type: @src_name
		}
	end
	
	def search_node_id(attr)
		attr = attr.sort
		min = attr.min
		(0..attr.max).each do |i|
			return (min + i) unless (min + i).in?(attr)
		end
	end
end

