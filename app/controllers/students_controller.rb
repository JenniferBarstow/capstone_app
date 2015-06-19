class StudentsController < ApplicationController

	def index
		@student = Student.all
		@classrooms = Classroom.all
		@quizzes = Quiz.all
	end
end