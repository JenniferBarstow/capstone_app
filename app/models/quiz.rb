class Quiz < ActiveRecord::Base
	belongs_to :classroom
	has_many :questions
end	