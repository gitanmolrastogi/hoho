class NotifyMailer < ApplicationMailer
  default from: "info@mobiledevelopmenttaxiapp.com"

def inform_admin contact_params
  @contact_params=contact_params
  mail(:to => "vk@yopmail.com", :subject => 'Contact Request-Delhi Airport')
end


end
