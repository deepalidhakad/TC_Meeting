class WelcomeMailer < ApplicationMailer

	def welcome_send
		@user = params[:user]
		mail(to: @user.email, subject: 'Welcome To The Taskcraft Team.') 
    end

    # def event_send
    # 	session[:current_user] = User.find(session[:current_user]).id
    # 	mail(form: session[:current_user].email to: "digital.invitation.website@gmail.com", subject: '.') 
    # end

end
