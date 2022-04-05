class UpdateMailer < ApplicationMailer
	def update_send
		@event = params[:event]
		mail(form: @event.user.email, to:"deepalidhakad1996@gmail.com", subject: 'Update Scheduled Meeting.')
	end
end
