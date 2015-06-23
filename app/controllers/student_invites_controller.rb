class StudentInvitesController < ApplicationController
	def index
		@classroom = Classroom.find(params[:classroom_id])
		@student_invites = StudentInvite.where(classroom_id: @classroom.id)
	end

	def new
		@classroom = Classroom.find(params[:classroom_id])
		@student_invite = StudentInvite.new
	end

	def create
		@classroom = Classroom.find(params[:classroom_id])
		@student_invite = StudentInvite.new(student_invite_params.merge({classroom_id: @classroom.id, checked: false}))
		if @student_invite.save
      UserNotifier.send_signup_email(@student_invite).deliver
			flash[:notice] = "Invite Sent"
			redirect_to new_classroom_student_invite_path(@classroom)
		else
			render :new
		end
	end

	private

	def student_invite_params
		params.require(:student_invite).permit(:email, :checked)
	end
end