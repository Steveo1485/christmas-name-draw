class Item < ActiveRecord::Base
  attr_accessible :item, :list_id
  belongs_to :list
  validates_presence_of :item
end