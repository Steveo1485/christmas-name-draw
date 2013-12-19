class CountdownMailer < ActionMailer::Base
  default from: ENV["EMAIL_ADDRESS"]

  def countdown(user)
    @user = user
    mail(to: user.email, subject: "Reminder from Family Christmas Name Draw")
  end
end