class RenameUrlToTerms < ActiveRecord::Migration
  def self.up
    rename_column :searches, :url, :terms
  end

  def self.down
    rename_column :searches, :terms, :url
  end
end
