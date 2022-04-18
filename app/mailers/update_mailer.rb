class UpdateMailer < ApplicationMailer
	def update_send
		@event = params[:event]
		mail(form: @event.user.email, to:"hr@taskcraft.in", subject: 'Update Scheduled Meeting.')
	end
end
