class RacesController < ApplicationController
	def show
		@quiz = Quiz.find(params[:quiz_id])
		@questions = Question.where(quiz_id: @quiz)
		student_quiz = StudentQuiz.find_or_create_by({student_id: current_user.id, quiz_id: @quiz.id})
	end

	def answer
		# find question and submitted answer
		question = Question.find(params[:question_id])
		submitted_answer_id = params[:answer_id]

		# find or create a student_quiz based on the current_user id sent through the params
		student_quiz = StudentQuiz.find_or_create_by({student_id: params[:student_id], quiz_id: question.quiz_id})

		# determine if answer is correct
		if question.answer_id == submitted_answer_id.to_i
			student_quiz.update_attributes(score: student_quiz.score + 1)
		else

		end
		# all student quizzes for the quiz
		student_quizzes = StudentQuiz.where(quiz_id: question.quiz_id)
		# send back the current status of the quiz
		respond_to do |format|
			format.json { render json: student_quizzes.to_json }
		end
	end
end