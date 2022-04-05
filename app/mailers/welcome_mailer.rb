class WelcomeMailer < ApplicationMailer
	def welcome_send
		@user = params[:user]
		mail(to: @user.email, subject: 'Wlecome to The TaskCraft Team.')
	end
end
