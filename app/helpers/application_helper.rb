module ApplicationHelper

  def days_until_christmas
    christmas = Time.local(2013, 12, 25)
    ((christmas - Time.now) / 86400).ceil
  end

  def countdown_before_christmas(countdown)
    if countdown > 1
      "#{countdown} Days Until Christmas!"
    else
      "#{countdown} Day Until Christmas!"
    end
  end

  def countdown_after_christmas
    "Hope You Had a Merry Christmas!"
  end

  def countdown_message
    if days_until_christmas > 0
      countdown_before_christmas(days_until_christmas)
    else
      countdown_after_christmas
    end
  end

  def signed_in?(user)
    session[:user_id] == user.id
  end

end
