class AddReportsCountToApps < ActiveRecord::Migration
  def self.up
    add_column :apps, :reports_count, :integer, :default => 0, :null => false
  end

  def self.down
    remove_column :apps, :reports_count
  end
end
