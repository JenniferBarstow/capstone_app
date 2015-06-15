class QuestionsController < ApplicationController

	def new
		@quiz = Quiz.find(params[:quiz_id])
		@question = Question.new
	end

	def create
		@quiz = Quiz.find(params[:quiz_id])
		@classroom = @quiz.classroom
		@question = Question.new(questions_params.merge(quiz_id: @quiz.id))
		if @question.save
			if params["commit"] == "Save Question And View Quiz"
				redirect_to classroom_quiz_path(@classroom, @quiz)
			else
				redirect_to new_quiz_question_path(@quiz)
			end
		else
			render :new
			flash[:notice] = "Please fill out all fields"
		end
	end

	def show
		@quiz = Quiz.find(params[:quiz_id])
		@question = Question.find(params[:id])
	end

	private

	def questions_params
		params.require(:question).permit(:content, :answer_id, :answers => [])
	end
end