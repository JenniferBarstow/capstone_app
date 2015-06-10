class QuizzesController < ApplicationController

	def new
		@quiz = Quiz.new
	end

	def create
		quiz = Quiz.new(quiz_params)
		quiz.save
		redirect_to quizzes_path
		end

		private 

		def quiz_params
			params.require(:quiz).permit(:question, :answer)
		end

end