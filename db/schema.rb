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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180228042748) do

  create_table "attachment_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "shop_id"
    t.string "content"
    t.decimal "rank", precision: 2, scale: 1
    t.string "rank_detail"
    t.integer "per_expense", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_comments_on_shop_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "footprints", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "before"
    t.text "after"
    t.string "action"
    t.string "trackable_type"
    t.bigint "trackable_id"
    t.string "actorable_type"
    t.bigint "actorable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actorable_type", "actorable_id"], name: "index_footprints_on_actorable_type_and_actorable_id"
    t.index ["trackable_type", "trackable_id"], name: "index_footprints_on_trackable_type_and_trackable_id"
  end

  create_table "regions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_regions_on_ancestry"
  end

  create_table "shop_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "shop_id"
    t.string "phones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_shop_details_on_shop_id"
  end

  create_table "shops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "desc"
    t.integer "status", default: 0
    t.integer "comments_count", default: 0
    t.bigint "category_id"
    t.bigint "region_id"
    t.string "address"
    t.string "logo"
    t.decimal "rank", precision: 2, scale: 1
    t.string "rank_detail"
    t.integer "per_expense", default: 0
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "lng", precision: 10, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_shops_on_category_id"
    t.index ["region_id"], name: "index_shops_on_region_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "comments", "shops"
  add_foreign_key "comments", "users"
  add_foreign_key "shop_details", "shops"
  add_foreign_key "shops", "categories"
  add_foreign_key "shops", "regions"
end
