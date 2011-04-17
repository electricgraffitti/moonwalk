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

require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
