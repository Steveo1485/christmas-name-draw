namespace :pairing do

  desc "Pair users with Christmas lists"
  task :pair_users => :environment do
    puts "Pairing Users with Christmas Lists"
    group1 = User.all.select { |user| user.family_group == "Nugent/Lim/Saito" }
    group2 = User.all.select { |user| user.family_group != "Nugent/Lim/Saito" }

    group1.each do |user|
      group2_lists = group2.map { |user| user.list }
      matched = false
      until matched == true
        list = group2_lists.sample
        if list.paired_user_id == nil
          user.update_attributes(paired_list_id: list.id)
          list.update_attributes(paired_user_id: user.id)
          matched = true
        end
      end
    end

    group2.each do |user|
      group1_lists = group1.map { |user| user.list }
      matched = false
      until matched == true
        list = group1_lists.sample
        if list.paired_user_id == nil
          user.update_attributes(paired_list_id: list.id)
          list.update_attributes(paired_user_id: user.id)
          matched = true
        end
      end
    end
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