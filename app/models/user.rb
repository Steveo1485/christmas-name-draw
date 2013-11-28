class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :password, :family_group, :paired_list_id

  has_one :list

  validates_presence_of :first_name
  validates_uniqueness_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :password, :on => :create
  validates_presence_of :family_group
  
  has_secure_password

  def paired?
    self.paired_list_id != nil
  end

  def paired_with_list
    paired_list = List.find(self.paired_list_id)
  end

  def paired_with
    paired_list = List.find(self.paired_list_id)
    User.find(paired_list.user_id).first_name
  end
end