class CountdownMailer < ActionMailer::Base
  default from: "stevennugent@gmail.com"

  def countdown(user)
    @user = user
    mail(to: user.email, subject: "Reminder from Family Christmas Name Draw")
  end
end