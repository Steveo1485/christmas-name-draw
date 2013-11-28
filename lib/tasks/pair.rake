namespace :pairing do

  desc "Pair users with Christmas lists"
  task :pair_users => :environment do
    puts "Pairing Users with Christmas Lists"
    
    # Option 1
    paired_users = []
    until paired_users.length == User.all.length
      puts paired_users.length
      paired_users.clear
      User.all.each { |user| user.update_attributes(paired_list_id: nil) }
      List.all.each { |list| list.update_attributes(paired_user_id: nil) }
      puts paired_users.length
      puts "Still working"
      User.all.shuffle.each do |user|
        puts "Attemping to match #{user.first_name}"
        list = List.all[rand(List.all.length)]
        p list
        list_creator = User.find(list.user_id)
        puts "with #{list_creator.first_name}'s list"
        if user.family_group != list_creator.family_group && list.paired_user_id == nil
          user.update_attributes(paired_list_id: list.id)
          list.update_attributes(paired_user_id: user.id)
          paired_users << user
          puts "We have a match!"
        end
      end
    end



    # User.all.each do |user|
    #   until user.paired_list_id != nil
    #     list = List.all[rand(List.all.length)]
    #     if list.paired_user_id == nil && user.family_group != User.find(list.user_id).family_group
    #       user.paired_list_id = list.id
    #       user.save
    #       list.paired_user_id = user.id
    #       list.save
    #     end
    #   end
    # puts "*" * 60
    # puts "Users left:"
    # User.all.each do |user|
    #   if user.paired_list_id == nil
    #     puts "#{user.first_name} #{user.last_name}"
    #   end
    # end
    # end
    puts "Pairing completed"
  end


  desc "See pairs"
  task :see_pairs => :environment do
    User.all.each do |user|
      paired_list = List.find(user.paired_list_id)
      paired_user = User.find(paired_list.user_id)
      puts "#{user.first_name} given #{paired_user.first_name}'s list"
    end
  end

  desc "Reset pairs"
  task :reset_pairs => :environment do
    puts "Resetting pairs"
    User.all.each do |user|
      user.paired_list_id = nil
      user.save
    end
    List.all.each do |list|
      list.paired_user_id = nil
      list.save
    end
    puts "Finished resetting pairs"
  end
end