# == Schema Information
#
# Table name: investors
#
#  id                  :integer(4)      not null, primary key
#  username            :string(255)
#  crypted_password    :string(255)     not null
#  password_salt       :string(255)     not null
#  persistence_token   :string(255)     not null
#  single_access_token :string(255)     not null
#  perishable_token    :string(255)     not null
#  created_at          :datetime
#  updated_at          :datetime
#

class Investor < ActiveRecord::Base
  acts_as_authentic

  named_scope :username_find, lambda { |username| {:conditions => ["username = ?", username]}}
  
end
