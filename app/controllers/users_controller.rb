class UsersController < ApplicationController

	def index
		@users = User.all
		@classrooms = Classroom.all
		@quizzes = Quiz.all
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			flash[:notice] = "You have successfully signed up!"
			redirect_to users_path
		else
			redirect_to root_path
			flash[:notice] = "Try again!"
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :first_name, :last_name)
	end

end