class QuizzesController < ApplicationController

	def index
		@quizzes = Quiz.all
		@classroom = Classroom.all
	end
	
	def new
		@quiz = Quiz.new
		@classroom = Classroom.find(params[:classroom_id])
	end

	def create
		quiz = Quiz.new(quiz_params.merge(classroom_id: params[:classroom_id]))
		quiz.save
		redirect_to new_quiz_question_path(quiz)
	end

	def show
		@quiz = Quiz.find(params[:id])
		@questions = @quiz.questions
	end

	private 

	def quiz_params
		params.require(:quiz).permit(:name)
	end
end