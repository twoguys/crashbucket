class AddBundleIdentifierToApps < ActiveRecord::Migration
  def self.up
    add_column :apps, :bundle_identifier, :string
  end

  def self.down
    remove_column :apps, :bundle_identifier
  end
end
