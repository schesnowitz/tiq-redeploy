# ActionMailer::Base.delivery_method = :smtp
# ActionMailer::Base.smtp_settings = {
# 	address:                  'smtp.office365.com',
# 	port:                     587,
# 	authentication:           :login, 
# 	user_name:                ENV["MAIL_USERNAME"],
# 	password:                 ENV["MAIL_PASSWORD"],
# 	domain:                   'sandbox.transportationiq.com',
# 	enable_starttls_auto:     true 
# }
  
  
#   Setting	IMAP (incoming)	SMTP (outgoing)
# Server Name	outlook.office365.com	smtp.office365.com
# Port Number	993	587
# Encryption Method	SSL	TLS

# ActionMailer::Base.delivery_method = :smtp
# ActionMailer::Base.smtp_settings = {
# 	address:                  'smtp.office365.com',
# 	port:                     587,
# 	authentication:           :login, 
# 	user_name:                ENV["MAIL_USERNAME"],
# 	password:                 ENV["MAIL_PASSWORD"],
# 	domain:                   'https://rails-chesnowitz.c9users.io',
# 	enable_starttls_auto:     true,
# }

# bundle exec rails console production
# ActionMailer::Base.delivery_method
# ActionMailer::Base.smtp_settings
# Notify.test_email('s.chesnowitz@gmail.com', 'Hello World', 'This is a test message').deliver_now
# class TestMailer < ActionMailer::Base

#   default :from => "steve@mysite.com"

#   def welcome_email
#     mail(:to => "s.chesnowitz@gmail.com", :subject => "Test mail", :body => "Test mail body")
#   end
# end

# TestMailer.welcome_email.deliver
