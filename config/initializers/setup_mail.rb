ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "smtp.gmail.com",
  :user_name => "christmas.name.draw",
  :password => "password",
  :authentication => "plain",
  :enable_starttls_auto => true
}