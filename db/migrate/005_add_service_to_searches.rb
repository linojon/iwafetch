class AddServiceToSearches < ActiveRecord::Migration
  def self.up
    add_column :searches, :service, :string
  end

  def self.down
    remove_column :searches, :service
  end
end
