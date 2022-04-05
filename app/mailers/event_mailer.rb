class EventMailer < ApplicationMailer
	def event_send
		@event = params[:event]
		mail(form: @event.user.email, to:"deepalidhakad1996@gmail.com", subject: 'New Scheduled Meeting.')
	end
end
