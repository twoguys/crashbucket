class UpdateReports < ActiveRecord::Migration
  def self.up
    add_column :reports, :os_version, :string
    add_column :reports, :device, :string
    add_column :reports, :app_version, :string
    add_column :reports, :exc_name, :string
    add_column :reports, :exc_reason, :string
    add_column :reports, :library_version, :string
    add_column :reports, :backtrace, :text
    
    remove_column :reports, :raw
  end

  def self.down
    add_column :reports, :raw, :text
    
    remove_column :reports, :backtrace
    remove_column :reports, :library_version
    remove_column :reports, :exc_reason
    remove_column :reports, :exc_name
    remove_column :reports, :app_version
    remove_column :reports, :device
    remove_column :reports, :os_version
  end
end
