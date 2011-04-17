class CreateInvestorSessions < ActiveRecord::Migration
  def self.up
    create_table :investor_sessions do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :investor_sessions
  end
end
