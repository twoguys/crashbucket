# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100729152648) do

  create_table "apps", :force => true do |t|
    t.string   "name"
    t.string   "api_key"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bundle_identifier"
    t.integer  "reports_count",     :default => 0, :null => false
  end

  add_index "apps", ["user_id"], :name => "index_apps_on_user_id"

  create_table "beta_invites", :force => true do |t|
    t.string   "email"
    t.string   "code"
    t.datetime "sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "app_id"
    t.string   "os_version"
    t.string   "device"
    t.string   "app_version"
    t.string   "exc_name"
    t.string   "exc_reason"
    t.string   "library_version"
    t.text     "backtrace"
    t.integer  "count",           :default => 1
    t.string   "fingerprint"
  end

  add_index "reports", ["app_id"], :name => "index_reports_on_app_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "perishable_token",  :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"

end
