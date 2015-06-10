class TeachersController < ApplicationController

	def index
		@teachers = Teacher.all
		@classrooms = Classroom.all
		@quizzes = Quiz.all
	end
	
	def create
		@teacher = Teacher.new(teacher_params)
		if @teacher.save
			session[:user_id] = @teacher.id
			flash[:notice] = "You have successfully signed up!"
			redirect_to teachers_path
		else
			redirect_to root_path
			flash[:notice] = "Try again!"
		end
	end

	private

	def teacher_params
		params.require(:teacher).permit(:email, :password, :first_name, :last_name)
	end

end