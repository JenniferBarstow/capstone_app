class ClassroomsController < ApplicationController

	def index
		@classrooms = current_user.classrooms
	end

	def new
		@classroom = Classroom.new
	end

	def create
		@classroom = Classroom.new(classroom_params.merge(teacher_id: current_user.id))
		if @classroom.save
			flash[:notice] = "New Classroom Added!"
			redirect_to teachers_path
		else
			render :new
		end
	end

	def edit
		@classroom = Classroom.find(params[:id])
	end

	def show
		@classroom = Classroom.find(params[:id])
	end

	def destroy
		Classroom.destroy(params[:id])
		redirect_to teachers_path
	end

	private

	def classroom_params
		params.require(:classroom).permit(:name)
	end

end