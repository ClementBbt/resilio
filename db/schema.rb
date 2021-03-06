# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_19_175923) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bank_accounts", force: :cascade do |t|
    t.string "name"
    t.bigint "bank_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bank_id"], name: "index_bank_accounts_on_bank_id"
  end

  create_table "banks", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_banks_on_user_id"
  end

  create_table "resiliations", force: :cascade do |t|
    t.string "from_last_name"
    t.string "from_first_name"
    t.string "from_email"
    t.string "from_subscription_reference"
    t.string "to_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.float "price"
    t.string "category"
    t.string "periodicity"
    t.boolean "commitment"
    t.integer "notice"
    t.bigint "user_id", null: false
    t.text "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "visible"
    t.string "alias"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.text "title"
    t.text "reference"
    t.date "date"
    t.float "amount"
    t.bigint "bank_account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "subscription_id"
    t.index ["bank_account_id"], name: "index_transactions_on_bank_account_id"
    t.index ["subscription_id"], name: "index_transactions_on_subscription_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "civility"
    t.string "first_name"
    t.string "last_name"
    t.text "address"
    t.string "phone_number"
    t.integer "zip_code"
    t.string "city"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bank_accounts", "banks"
  add_foreign_key "banks", "users"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "transactions", "bank_accounts"
end
