namespace :email do

  desc "Email test user - countdown reminder"
  task :countdown => :environment do
    steven = User.find_by_first_name("Steven")
    puts "Sending Email"
    CountdownMailer.countdown(steven).deliver
    puts "Email sent to #{steven.first_name}"
  end

  desc "Email all users - countdown reminder"
  task :countdown => :environment do
    User.all.each do |user|
      puts "Sending Email"
      CountdownMailer.countdown(user).deliver
      puts "Email sent to #{user.first_name}"
    end
  end
end