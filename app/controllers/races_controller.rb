class RacesController < ApplicationController
	# quizzes/:id/race
	def show
		@quiz = Quiz.find(params[:quiz_id])
		student_quizzes = StudentQuiz.where(quiz_id: @quiz.id).order(:created_at)

		@questions = Question.where(quiz_id: @quiz)
		student_quiz = StudentQuiz.find_by({student_id: current_user.id, quiz_id: @quiz.id})

		if student_quizzes.length >= 5 && student_quiz.nil?
			flash[:notice] = "Too slow!"
			redirect_to root_path
		elsif student_quiz.nil?
			student_quiz = StudentQuiz.create({student_id: current_user.id, quiz_id: @quiz.id})
			student_quizzes = StudentQuiz.where(quiz_id: @quiz.id).order(:created_at)
		end

		@player_number = 0
		student_quizzes.each_with_index do |student_quiz, i|
			if student_quiz.student_id = current_user.id
				@player_number = i + 1
			end
		end
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
			# if student has 10points, game is ova! Send a winner back to the client.
		else

		end
		# all student quizzes for the quiz
		student_quizzes = StudentQuiz.where(quiz_id: question.quiz_id).order(:created_at)

		# send back the current status of the quiz
		respond_to do |format|
			format.json { render json: student_quizzes.to_json }
		end
	end
end