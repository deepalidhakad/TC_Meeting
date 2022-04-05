class ConfirmMailer < ApplicationMailer
	def confirm_send
		@event = params[:event]
		mail(to: @event.user.email, subject: 'Confirm Meeting.')
	end
end
