class EventMailer < ApplicationMailer
	def event_send
		@event = params[:event]
		mail(form: @event.user.email, to:"hr@taskcraft.in", subject: 'New Scheduled Meeting.')
	end
end
