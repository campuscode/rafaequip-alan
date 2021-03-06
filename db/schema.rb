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

ActiveRecord::Schema.define(version: 20160727211718) do

  create_table "contracts", force: :cascade do |t|
    t.string   "shipping_address"
    t.string   "shipping_contact"
    t.float    "price"
    t.float    "discount"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.date     "date_begin"
    t.date     "date_end"
    t.string   "contract_number"
    t.string   "order_number"
    t.integer  "rental_period_id"
    t.string   "status",           default: "Em aberto"
    t.integer  "customer_id"
    t.index ["customer_id"], name: "index_contracts_on_customer_id"
    t.index ["rental_period_id"], name: "index_contracts_on_rental_period_id"
  end

  create_table "customers", force: :cascade do |t|
    t.integer  "code"
    t.string   "name"
    t.string   "document"
    t.string   "billing_address"
    t.string   "billing_city"
    t.string   "billing_state"
    t.string   "billing_zipcode"
    t.string   "financial_contact"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "delivery_receipts", force: :cascade do |t|
    t.integer  "contract_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["contract_id"], name: "index_delivery_receipts_on_contract_id"
  end

  create_table "devolution_receipts", force: :cascade do |t|
    t.string   "employer"
    t.string   "customer_document"
    t.integer  "contract_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["contract_id"], name: "index_devolution_receipts_on_contract_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string   "description"
    t.string   "supplier"
    t.string   "category"
    t.float    "price"
    t.string   "serial_number"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "equipment_code"
    t.boolean  "available",      default: true
  end

  create_table "prices", force: :cascade do |t|
    t.float    "amount"
    t.integer  "rental_period_id"
    t.integer  "equipment_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["equipment_id"], name: "index_prices_on_equipment_id"
    t.index ["rental_period_id"], name: "index_prices_on_rental_period_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.string   "name"
    t.string   "mail"
    t.string   "phone"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "rental_periods", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "period"
  end

  create_table "rented_equipment", id: false, force: :cascade do |t|
    t.integer "contract_id"
    t.integer "equipment_id"
    t.index ["contract_id"], name: "index_rented_equipment_on_contract_id"
    t.index ["equipment_id"], name: "index_rented_equipment_on_equipment_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
