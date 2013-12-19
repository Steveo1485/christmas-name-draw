namespace :email do

  desc "Email all users - countdown reminder"
  task :countdown => :environment do
    User.all.each do |user|
      puts "Sending Email"
      CountdownMailer.countdown(user).deliver
      puts "Email sent to #{user.first_name}"
    end
  end
end