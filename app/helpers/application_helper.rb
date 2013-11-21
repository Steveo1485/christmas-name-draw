module ApplicationHelper

  def days_until_christmas
    christmas = Time.local(2013, 12, 25)
    ((christmas - Time.now) / 86400).to_i
  end
end
