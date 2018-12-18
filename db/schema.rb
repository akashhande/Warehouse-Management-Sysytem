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

ActiveRecord::Schema.define(version: 20180421214848) do

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.index ["company_id"], name: "index_categories_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "company_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_ins", force: :cascade do |t|
    t.integer "product_id"
    t.integer "source_id"
    t.date "order_date"
    t.date "expected_out_date"
    t.integer "product_quantity"
    t.decimal "purchase_price"
    t.decimal "sale_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.index ["company_id"], name: "index_order_ins_on_company_id"
    t.index ["product_id"], name: "index_order_ins_on_product_id"
    t.index ["source_id"], name: "index_order_ins_on_source_id"
  end

  create_table "order_outs", force: :cascade do |t|
    t.integer "product_id"
    t.integer "source_id"
    t.integer "product_quantity"
    t.string "customer_name"
    t.date "order_date"
    t.string "orderer_name"
    t.string "delivery_address"
    t.string "delivery_address_city"
    t.string "delivery_address_country"
    t.string "delivery_address_zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.index ["company_id"], name: "index_order_outs_on_company_id"
    t.index ["product_id"], name: "index_order_outs_on_product_id"
    t.index ["source_id"], name: "index_order_outs_on_source_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "source_id"
    t.integer "category_id"
    t.string "product_name"
    t.string "brand"
    t.string "purchase_price"
    t.string "sale_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.integer "product_quantity"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["company_id"], name: "index_products_on_company_id"
    t.index ["source_id"], name: "index_products_on_source_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "address"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "source_name"
    t.string "source_category"
    t.string "address"
    t.string "email"
    t.integer "contact_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.index ["company_id"], name: "index_sources_on_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.integer "company_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
