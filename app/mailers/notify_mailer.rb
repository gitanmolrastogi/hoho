class NotifyMailer < ApplicationMailer
	#default from: "info@mobiledevelopmenttaxiapp.com"
	default from: "info@mobiledevelopmentdelhiairport.com"

	def inform_admin contact_params
		@contact_params=contact_params
		mail(:to => "vk@yopmail.com", :subject => 'Contact Request-Delhi Airport')
	end
	def user_mailer user,order_ids,transaction_id, ipg_transaction_id
	@user = user
    @order_ids  = order_ids
    @transaction_id = transaction_id
    @ipg_transaction_id = ipg_transaction_id
    mail(to: @user.email, subject:'Payment Success')
	end
end