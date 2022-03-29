class WelcomeMailer < ApplicationMailer

	def welcome_send
		@user = params[:user]
		mail(to: @user.email, subject: 'Welcome To Taskcraft Team.') 
    end

    # def event_send
    # 	@current_user = params[:current_user]
    # 	mail(from: @current_user.email, to: "digital.invitation.website@gmail.com", subject: "Event Schedule ")
    # end

end
