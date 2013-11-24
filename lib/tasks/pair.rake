namespace :pairing do

  desc "Pair users with Christmas lists"
  task :pair_users => :environment do
    puts "Pairing Users with Christmas Lists"
    User.all.shuffle.each do |user|
      until user.paired_list_id != nil
        list = List.all.sample
        if list.paired_user_id == nil && user.family_group != User.find(list.id).family_group
          user.paired_list_id = list.id
          list.paired_user_id = user.id
        end
      end
    end
    puts "Pairing completed"
  end
end