class Item < ActiveRecord::Base
  attr_accessible :item
  belongs_to :list
  validates_presence_of :item
end