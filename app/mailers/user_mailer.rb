class UserMailer < ActionMailer::Base
  default from: "accounts@spunfibers.com"

	def welcome_email(user)
		@user = user
		@url = 'http://www.spunfibers.com/user_sessions/login'
		mail(to: @user.email, subject: 'Welcome to Spunfibers!')
	end
end
