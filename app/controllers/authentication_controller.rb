class AuthenticationController < ApplicationController

	def new
	end

	def create
		@user = User.find_by(email: params[:email])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to users_path
			flash[:notice] = "Welcome!"
		else 
			redirect_to root_path
		end
	end

	def destroy
		session.clear
		flash[:notice] = "Thanks for visiting!"
		redirect_to root_path
	end



end