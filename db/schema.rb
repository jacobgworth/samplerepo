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

ActiveRecord::Schema.define(:version => 20120805235017) do

  create_table "assets", :force => true do |t|
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.integer  "experience_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "categoryname"
    t.integer  "categorizable_id"
    t.string   "categorizable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "categoryicon"
    t.string   "categorydesc"
  end

  create_table "categories_posts", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "post_id"
  end

  create_table "categories_projects", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "project_id"
  end

  create_table "categories_updates", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "update_id"
  end

  create_table "communities", :force => true do |t|
    t.string   "communityname"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "communities_experiences", :id => false, :force => true do |t|
    t.integer "community_id"
    t.integer "experience_id"
  end

  create_table "communities_projects", :id => false, :force => true do |t|
    t.integer "community_id"
    t.integer "project_id"
  end

  create_table "contents", :force => true do |t|
    t.string   "url"
    t.text     "content"
    t.string   "headline"
    t.string   "description"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experiences", :force => true do |t|
    t.string   "headline"
    t.string   "summary"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "experiences_projects", :id => false, :force => true do |t|
    t.integer "experience_id"
    t.integer "project_id"
  end

  create_table "partners", :force => true do |t|
    t.string   "partnername"
    t.string   "partnerURL"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "partners_projects", :id => false, :force => true do |t|
    t.integer "partner_id"
    t.integer "project_id"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.text     "body"
    t.string   "imagelink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "projectname"
    t.float    "latitude"
    t.float    "longitude"
    t.date     "completion"
    t.text     "description",        :limit => 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "goal"
    t.decimal  "progress"
    t.decimal  "fundsneeded"
    t.decimal  "fundsraised"
    t.date     "startdate"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "stage"
  end

  create_table "projects_updates", :id => false, :force => true do |t|
    t.integer "project_id"
    t.integer "update_id"
  end

  create_table "tags", :force => true do |t|
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags_updates", :id => false, :force => true do |t|
    t.integer "tag_id"
    t.integer "update_id"
  end

  create_table "updates", :force => true do |t|
    t.string   "title"
    t.string   "body"
    t.string   "media"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "user_name"
    t.integer  "convio_id"
    t.string   "convio_primary_email"
    t.string   "email"
    t.string   "first"
    t.string   "last"
    t.string   "street1"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "convio_authtoken"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "authtoken"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.integer  "is_admin"
  end

end
