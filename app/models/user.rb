class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :password, :family_group

  has_one :list

  validates_presence_of :first_name
  validates_uniqueness_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :password, :on => :create
  validates_presence_of :family_group
  
  has_secure_password
end