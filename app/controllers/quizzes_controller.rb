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

	def edit
		@classroom = Classroom.find(params[:classroom_id])
		@quiz = Quiz.find(params[:id])
	end

	def destroy
		Quiz.delete(params[:id])
		redirect_to teachers_path, notice: "Deleted Quiz"
	end

	private 

	def quiz_params
		params.require(:quiz).permit(:name)
	end
end