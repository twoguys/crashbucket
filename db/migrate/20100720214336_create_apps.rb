class CreateApps < ActiveRecord::Migration
  def self.up
    create_table :apps do |t|
      t.string :name
      t.string :api_key
      t.integer :user_id

      t.timestamps
    end
    
    add_index :apps, :user_id
  end

  def self.down
    drop_table :apps
  end
end
