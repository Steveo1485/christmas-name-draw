namespace :capitalize do

  desc "Capitalize names"
  task :all_names => :environment do
    User.all.each do |user|
      user.update_attributes(first_name: user.first_name.capitalize, last_name: user.last_name.capitalize)
      puts "#{user.first_name} #{user.last_name} updated"
    end
  end
end