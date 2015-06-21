class Quiz < ActiveRecord::Base
	belongs_to :classroom
	has_many :questions
	has_many :student_quizzes
end	