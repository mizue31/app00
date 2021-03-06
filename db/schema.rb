# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131012121649) do

  create_table "component_servers", :force => true do |t|
    t.integer  "component_id"
    t.integer  "server_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "component_servers", ["component_id"], :name => "index_component_servers_on_component_id"
  add_index "component_servers", ["server_id"], :name => "index_component_servers_on_server_id"

  create_table "components", :force => true do |t|
    t.string   "name"
    t.string   "domain"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "migrations", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "server_softwares", :force => true do |t|
    t.integer  "server_id"
    t.integer  "software_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "server_softwares", ["server_id"], :name => "index_server_softwares_on_server_id"
  add_index "server_softwares", ["software_id"], :name => "index_server_softwares_on_software_id"

  create_table "servers", :force => true do |t|
    t.string   "host_name"
    t.string   "p_or_v"
    t.string   "os"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "service_components", :force => true do |t|
    t.integer  "service_id"
    t.integer  "component_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "service_components", ["component_id"], :name => "index_service_components_on_component_id"
  add_index "service_components", ["service_id"], :name => "index_service_components_on_service_id"

  create_table "services", :force => true do |t|
    t.string   "name"
    t.string   "sid"
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "softwares", :force => true do |t|
    t.string   "maker"
    t.string   "sw_name"
    t.string   "version"
    t.date     "eos_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "expiration_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
