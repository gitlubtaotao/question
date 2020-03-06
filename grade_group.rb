# frozen_string_literal: true
# 学⽣按成绩分组
class GradeGroup
	attr_accessor :students
	
	def initialize(students)
		@students = students
	end
	
	def group_by_grade
		attr = @students.each_with_object({}) do |student, attr|
			grade = get_grade(student[:score])
			if attr.key?(grade)
				attr[grade].push(student)
			else
				attr[grade] = [student]
			end
		end
		attr.sort.to_h
	end
	
	private
	def get_grade(score)
		return 'C' if score < 60
		
		score < 80 ? 'B' : 'A'
	end
end

