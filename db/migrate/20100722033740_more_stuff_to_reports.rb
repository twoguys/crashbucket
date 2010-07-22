class MoreStuffToReports < ActiveRecord::Migration
  def self.up
    add_column :reports, :count, :integer, :default => 1
    add_column :reports, :fingerprint, :string
  end

  def self.down
    remove_column :table_name, :fingerprint
    remove_column :reports, :count
  end
end
