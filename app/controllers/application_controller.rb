class ApplicationController < ActionController::Base
 
  protect_from_forgery with: :exception

  def current_user
  	Teacher.find_by(id: session[:user_id])
	end

	helper_method :current_user
end
