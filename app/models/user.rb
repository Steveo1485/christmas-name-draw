class User < ActiveRecord::Base
  validates_presence_of :first_name
  validates_uniqueness_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :password, :on => :create
  has_secure_password
end