class List < ActiveRecord::Base
  attr_accessible :user_id, :item1
  belongs_to :user
  validates_presence_of :item1
end