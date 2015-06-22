class Question < ActiveRecord::Base
	validates :content, :answers, :answer_id, presence: true
	validate :answers_are_present

	def answers_are_present
		result = true
		self.answers.each do |answer|
			if answer == ""
				self.errors[:answers] << "Answers can't be blank"
			end
		end
	end
end