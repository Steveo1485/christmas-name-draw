class User < ActiveRecord::Base
  validates_presence_of :first_name
  validates_uniqueness_of :first_name
end