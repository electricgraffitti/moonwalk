# == Schema Information
#
# Table name: subscriptions
#
#  id                 :integer(4)      not null, primary key
#  name               :string(255)
#  email              :string(255)
#  product_updates    :boolean(1)
#  potential_investor :boolean(1)
#  created_at         :datetime
#  updated_at         :datetime
#

class Subscription < ActiveRecord::Base
  
  validates_presence_of :name, :on => :create, :message => "Name can't be blank"
  validates_presence_of :email, :on => :create, :message => "Email can't be blank"
  validates_uniqueness_of :email, :on => :create, :message => "Email Address is already taken."
  validate :valid_email?
  
  
  def valid_email?
    TMail::Address.parse(email)
  rescue
    errors.add_to_base("Must be a valid email")
  end
  
  
end
