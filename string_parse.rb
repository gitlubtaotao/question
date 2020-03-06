class StringParse
	attr_accessor :str
	
	def initialize(str)
		@str = str
	end
	
	def string_to_array
		str_array = @str.split('')
		temp = ''
		str_array.each do |i|
			temp += i and next if i != '<' && i != ',' && i != '>'
			
		end
	end
	
	def string_parse
		#拆分为数组
		str_array = @str.split('')
		result = {type: '', }
		item = '', temp = ''
		sub1 = 0
		str_array.each_with_index do |i, index|
			if i != "<" && i != ','
				item += i and next
			end
			if i == '<'
				sub1 += 1
				if sub1 == 1
					result[:type] = item
					temp = item
					item = ""
				elsif sub1 > 1
					result[]
				end
			end
		end
	end
	
	private

end