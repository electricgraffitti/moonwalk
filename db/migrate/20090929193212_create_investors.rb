class CreateInvestors < ActiveRecord::Migration
  def self.up
    create_table :investors do |t|
      t.string  :username
      t.string  :crypted_password,    :null => false                # optional, see below
      t.string  :password_salt,       :null => false                # optional, but highly recommended
      t.string  :persistence_token,   :null => false                # required
      t.string  :single_access_token, :null => false                # optional, see Authlogic::Session::Params
      t.string  :perishable_token,    :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :investors
  end
end
