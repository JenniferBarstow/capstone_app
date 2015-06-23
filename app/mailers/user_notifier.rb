class UserNotifier < ActionMailer::Base
  default :from => 'quizracer@quizracer.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(student_invite)
    @student_invite = student_invite
    mail( :to => @student_invite.email,
    :subject => 'Thanks for signing up for our amazing app' )
  end
end