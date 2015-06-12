class QuizzesController < ApplicationController

	def index
		@quizzes = Quiz.all
		@classroom = Classroom.all
	end
	
	def new
		@quiz = Quiz.new
		@classroom = Classroom.new
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