module ApplicationHelper

  def days_until_christmas
    christmas = Time.local(2013, 12, 25)
    ((christmas - Time.now) / 86400).to_i
  end

  def signed_in?(user)
    session[:user_id] == user.id
  end

  def paired_with(user)
    paired_list = List.find(user.paired_list_id)
    User.find(paired_list.user_id)
  end
end
