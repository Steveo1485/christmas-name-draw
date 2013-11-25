class List < ActiveRecord::Base
  attr_accessible :user_id
  belongs_to :user
  has_many :items

  def any_items?
    self.items.count != 0
  end

end