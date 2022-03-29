class WelcomeMailer < ApplicationMailer
	def welcome_send
		@user = params[:user]
		mail(to: @user.email, subject: 'Welcome To Taskcraft Team.') 
    end
end
