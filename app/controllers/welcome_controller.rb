class WelcomeController < ApplicationController

	def index
		@teacher = Teacher.new
	end

end