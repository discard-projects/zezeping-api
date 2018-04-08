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

ActiveRecord::Schema.define(version: 20180408104941) do

  create_table "adjustments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "source_type"
    t.bigint "source_id"
    t.string "adjustable_type"
    t.bigint "adjustable_id"
    t.bigint "order_id"
    t.decimal "amount", precision: 10, scale: 2
    t.string "label"
    t.boolean "eligible"
    t.boolean "included"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adjustable_type", "adjustable_id"], name: "index_adjustments_on_adjustable_type_and_adjustable_id"
    t.index ["order_id"], name: "index_adjustments_on_order_id"
    t.index ["source_type", "source_id"], name: "index_adjustments_on_source_type_and_source_id"
  end

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
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
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_admins_on_uid_and_provider", unique: true
  end

  create_table "attachment_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "file"
    t.string "owner_type"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_type", "owner_id"], name: "index_attachment_images_on_owner_type_and_owner_id"
  end

  create_table "banners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.string "image"
    t.string "desc"
    t.string "link"
    t.boolean "enabled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "calculators", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "type"
    t.string "calculable_type"
    t.bigint "calculable_id"
    t.text "preferences"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calculable_type", "calculable_id"], name: "index_calculators_on_calculable_type_and_calculable_id"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.boolean "recommended", default: false
    t.boolean "enabled", default: true
    t.integer "position"
    t.string "logo"
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "categories_stores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "category_id"
    t.bigint "store_id"
    t.index ["category_id"], name: "index_categories_stores_on_category_id"
    t.index ["store_id"], name: "index_categories_stores_on_store_id"
  end

  create_table "collections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "user_id"
    t.string "collectable_type"
    t.bigint "collectable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collectable_type", "collectable_id"], name: "index_collections_on_collectable_type_and_collectable_id"
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "user_id"
    t.string "content"
    t.decimal "rank", precision: 2, scale: 1, default: "0.0"
    t.decimal "rank_taste", precision: 2, scale: 1
    t.decimal "rank_env", precision: 2, scale: 1
    t.decimal "rank_service", precision: 2, scale: 1
    t.integer "per_expense"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "anonymous", default: false
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.string "tmp_nickname"
    t.string "tmp_avatar"
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "coupons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "user_id"
    t.bigint "promotion_id"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promotion_id"], name: "index_coupons_on_promotion_id"
    t.index ["user_id"], name: "index_coupons_on_user_id"
  end

  create_table "discussions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "user_id"
    t.string "discussable_type"
    t.bigint "discussable_id"
    t.string "content"
    t.boolean "enabled", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "votes_count", default: 0
    t.index ["discussable_type", "discussable_id"], name: "index_discussions_on_discussable_type_and_discussable_id"
    t.index ["user_id"], name: "index_discussions_on_user_id"
  end

  create_table "footprints", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
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

  create_table "moments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "store_id"
    t.string "content"
    t.integer "comments_count", default: 0
    t.boolean "enabled", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "views_count", default: 0
    t.integer "votes_count", default: 0
    t.index ["store_id"], name: "index_moments_on_store_id"
  end

  create_table "order_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "order_id"
    t.bigint "product_id"
    t.integer "quantity", default: 0
    t.decimal "price", precision: 10, scale: 2, default: "0.0"
    t.decimal "adjustment_price", precision: 10, scale: 2, default: "0.0"
    t.decimal "additional_tax_price", precision: 10, scale: 2, default: "0.0"
    t.decimal "payment_price", precision: 10, scale: 2, default: "0.0"
    t.decimal "promo_price", precision: 10, scale: 2, default: "0.0"
    t.decimal "real_payment_price", precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "order_promotions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "order_id"
    t.bigint "promotion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_promotions_on_order_id"
    t.index ["promotion_id"], name: "index_order_promotions_on_promotion_id"
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "oid"
    t.bigint "user_id"
    t.bigint "store_id"
    t.integer "status", limit: 1, default: 0
    t.integer "order_products_count", default: 0
    t.decimal "amount", precision: 10, scale: 2, default: "0.0"
    t.decimal "adjustment_amount", precision: 10, scale: 2, default: "0.0"
    t.decimal "shipment_amount", precision: 10, scale: 2, default: "0.0"
    t.decimal "additional_tax_amount", precision: 10, scale: 2, default: "0.0"
    t.decimal "payment_amount", precision: 10, scale: 2, default: "0.0"
    t.decimal "promo_amount", precision: 10, scale: 2, default: "0.0"
    t.decimal "real_payment_amount", precision: 10, scale: 2, default: "0.0"
    t.string "special_instruction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_orders_on_store_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "content"
    t.boolean "enabled", default: false
    t.integer "discussions_count", default: 0
    t.integer "votes_count", default: 0
    t.integer "views_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "collections_count", default: 0
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "product_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "store_id"
    t.bigint "category_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "products_count", default: 0
    t.index ["category_id"], name: "index_product_categories_on_category_id"
    t.index ["store_id"], name: "index_product_categories_on_store_id"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "store_id"
    t.string "name"
    t.decimal "price", precision: 10, scale: 2, default: "0.0"
    t.string "dest"
    t.decimal "rank", precision: 2, scale: 1, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_category_id"
    t.integer "comments_count", default: 0
    t.string "image"
    t.decimal "adjustment_price", precision: 10, scale: 2, default: "0.0"
    t.decimal "additional_tax_price", precision: 10, scale: 2, default: "0.0"
    t.decimal "payment_price", precision: 10, scale: 2, default: "0.0"
    t.boolean "support_promotion", default: false
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
    t.index ["store_id"], name: "index_products_on_store_id"
  end

  create_table "promotion_actions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "promotion_id"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promotion_id"], name: "index_promotion_actions_on_promotion_id"
  end

  create_table "promotion_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "promotion_rule_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "product_id"
    t.bigint "promotion_rule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_promotion_rule_products_on_product_id"
    t.index ["promotion_rule_id"], name: "index_promotion_rule_products_on_promotion_rule_id"
  end

  create_table "promotion_rules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "promotion_id"
    t.string "type"
    t.text "preferences"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promotion_id"], name: "index_promotion_rules_on_promotion_id"
  end

  create_table "promotions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "store_id"
    t.bigint "promotion_category_id"
    t.string "name"
    t.string "desc"
    t.datetime "start_at"
    t.datetime "expire_at"
    t.string "code"
    t.integer "usage_limit"
    t.string "match_policy"
    t.boolean "advertise", default: false
    t.integer "category", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promotion_category_id"], name: "index_promotions_on_promotion_category_id"
    t.index ["store_id"], name: "index_promotions_on_store_id"
  end

  create_table "regions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_regions_on_ancestry"
  end

  create_table "store_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "store_id"
    t.string "wechat_qrcode"
    t.string "phones"
    t.string "extra_contact_detail"
    t.string "rank_detail"
    t.text "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_store_details_on_store_id"
  end

  create_table "stores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "name"
    t.string "desc"
    t.integer "status", default: 0
    t.integer "comments_count", default: 0
    t.bigint "region_id"
    t.string "address"
    t.string "logo"
    t.decimal "rank", precision: 2, scale: 1, default: "0.0"
    t.integer "per_expense", default: 0
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "lng", precision: 10, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "open_time_desc"
    t.datetime "suggested_at"
    t.bigint "user_id"
    t.integer "moments_count", default: 0
    t.integer "products_count", default: 0
    t.integer "views_count", default: 0
    t.integer "votes_count", default: 0
    t.index ["region_id"], name: "index_stores_on_region_id"
    t.index ["user_id"], name: "index_stores_on_user_id"
  end

  create_table "subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "title"
    t.string "content"
    t.boolean "enabled", default: false
    t.bigint "user_id"
    t.integer "discussions_count", default: 0
    t.integer "votes_count", default: 0
    t.integer "views_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_subjects_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
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
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
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

  create_table "views", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "viewable_type"
    t.bigint "viewable_id"
    t.integer "user_id"
    t.string "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ip"], name: "index_views_on_ip"
    t.index ["viewable_type", "viewable_id"], name: "index_views_on_viewable_type_and_viewable_id"
  end

  create_table "votes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "user_id"
    t.string "voteable_type"
    t.bigint "voteable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_votes_on_user_id"
    t.index ["voteable_type", "voteable_id"], name: "index_votes_on_voteable_type_and_voteable_id"
  end

  add_foreign_key "adjustments", "orders"
  add_foreign_key "collections", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "coupons", "promotions"
  add_foreign_key "coupons", "users"
  add_foreign_key "discussions", "users"
  add_foreign_key "moments", "stores"
  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
  add_foreign_key "order_promotions", "orders"
  add_foreign_key "order_promotions", "promotions"
  add_foreign_key "orders", "stores"
  add_foreign_key "orders", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "product_categories", "categories"
  add_foreign_key "product_categories", "stores"
  add_foreign_key "products", "product_categories"
  add_foreign_key "products", "stores"
  add_foreign_key "promotion_actions", "promotions"
  add_foreign_key "promotion_rule_products", "products"
  add_foreign_key "promotion_rule_products", "promotion_rules"
  add_foreign_key "promotion_rules", "promotions"
  add_foreign_key "promotions", "promotion_categories"
  add_foreign_key "promotions", "stores"
  add_foreign_key "store_details", "stores"
  add_foreign_key "stores", "regions"
  add_foreign_key "stores", "users"
  add_foreign_key "subjects", "users"
  add_foreign_key "votes", "users"
end
