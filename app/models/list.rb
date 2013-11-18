class List < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :item1
end