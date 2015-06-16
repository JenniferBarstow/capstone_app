class Classroom < ActiveRecord::Base
	validates :name, presence: true
	belongs_to :teacher
	has_many :quizzes

end