class CreateSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :subscriptions do |t|
      t.string :name
      t.string :email
      t.boolean :product_updates
      t.boolean :potential_investor

      t.timestamps
    end
  end

  def self.down
    drop_table :subscriptions
  end
end
