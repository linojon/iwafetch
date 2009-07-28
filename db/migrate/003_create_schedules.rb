class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      t.string :service
      t.string :terms
      t.integer :frequency
      t.datetime :last_run_at

      t.timestamps 
    end
  end

  def self.down
    drop_table :schedules
  end
end
