namespace :email do

  desc "Email all users - countdown reminder"
  task :countdown => :environment do
    steven = User.find_by_first_name("Steven")
    puts "Sending Email"
    CountdownMailer.countdown(steven).deliver
    puts "Email sent to #{steven.first_name}"
  end
end