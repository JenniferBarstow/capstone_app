class StudentQuizzesController < ApplicationController

	def index
		student_quizzes = StudentQuiz.where({quiz_id: params[:quiz_id]})
		render json: student_quizzes.to_json
	end
end