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

ActiveRecord::Schema.define(:version => 20120221020144) do

  create_table "answers", :force => true do |t|
    t.string   "location"
    t.string   "pricing"
    t.text     "answer_details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_id"
    t.boolean  "sure",           :default => false
    t.integer  "user_id"
    t.integer  "submitter_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "category_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "city_categories", :force => true do |t|
    t.integer  "city_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "body"
    t.integer  "deal_id"
    t.integer  "user_id"
  end

  create_table "deals", :force => true do |t|
    t.string   "item_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
    t.integer  "category_id"
    t.integer  "submitter_id"
    t.string   "image"
    t.string   "town"
    t.text     "details"
    t.decimal  "price"
    t.boolean  "flagged",         :default => false
    t.integer  "user_id"
    t.decimal  "reg_price"
    t.date     "end_date"
    t.boolean  "until_sold"
    t.integer  "available_items"
    t.boolean  "official",        :default => false
    t.integer  "quantity"
    t.integer  "n_item_free"
    t.integer  "percent_off"
    t.boolean  "fixed_price"
    t.string   "unfixed"
    t.boolean  "other_details",   :default => false
    t.string   "sub_city"
    t.decimal  "saving"
  end

  create_table "feedbacks", :force => true do |t|
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "ips", :force => true do |t|
    t.string   "ip_address"
    t.integer  "ip_count",   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.boolean  "how_much"
    t.boolean  "where"
    t.text     "additional_details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "item"
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "city_id"
  end

  create_table "store_deals", :force => true do |t|
    t.integer  "store_id"
    t.integer  "deal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "store_name"
    t.string   "address"
  end

  create_table "stores", :force => true do |t|
    t.string   "store_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
    t.integer  "city_id"
    t.string   "website"
    t.integer  "user_id"
    t.string   "town"
    t.string   "state"
    t.string   "zipcode"
    t.string   "phone"
  end

  create_table "user_deals", :force => true do |t|
    t.integer  "user_id"
    t.integer  "deal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "",    :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.boolean  "business",                            :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.boolean  "vote",          :default => false
    t.integer  "voteable_id",                      :null => false
    t.string   "voteable_type",                    :null => false
    t.integer  "voter_id"
    t.string   "voter_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["voteable_id", "voteable_type"], :name => "index_votes_on_voteable_id_and_voteable_type"
  add_index "votes", ["voter_id", "voter_type", "voteable_id", "voteable_type"], :name => "fk_one_vote_per_user_per_entity", :unique => true
  add_index "votes", ["voter_id", "voter_type"], :name => "index_votes_on_voter_id_and_voter_type"

end
