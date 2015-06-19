class RacesController < ApplicationController
	def show
		@questions = Question.where(quiz_id: params[:quiz_id])
	end

	def answer
		question = Question.find(params[:question_id])
		submitted_answer_id = params[:answer_id]
		student_quiz = StudentQuiz.find_or_create_by({student_id: 1, quiz_id: question.quiz_id})

		if question.answer_id == submitted_answer_id.to_i
			student_quiz.update_attributes(score: student_quiz.score + 1)
		else

		end

		respond_to do |format|
			format.json { render json: student_quiz.to_json }
		end
	end
end