class AddAppIdToReports < ActiveRecord::Migration
  def self.up
    add_column :reports, :app_id, :integer
    
    add_index :reports, :app_id
  end

  def self.down
    remove_index :reports, :app_id
    
    remove_column :reports, :app_id
  end
end
