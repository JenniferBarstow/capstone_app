class Question < ActiveRecord::Base
	validates :content, :answers, presence: true

end