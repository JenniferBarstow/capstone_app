class AuthenticationController < ApplicationController

	def new
	end

	def create
		@teacher = Teacher.find_by(email: params[:email])
		if @teacher && @teacher.authenticate(params[:password])
			session[:user_id] = @teacher.id
			redirect_to teachers_path
			flash[:notice] = "You have successfully signed in!"
		else 
			redirect_to root_path
		end
	end

	def destroy
		session.clear
		redirect_to root_path
	end



end