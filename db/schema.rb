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

ActiveRecord::Schema.define(version: 20160722000523) do

  create_table "contracts", force: :cascade do |t|
    t.string   "customer"
    t.string   "shipping_address"
    t.string   "shipping_contact"
    t.float    "price"
    t.float    "discount"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.date     "date_begin"
    t.date     "date_end"
    t.integer  "rental_period_id"
    t.string   "contract_number"
    t.string   "order_number"
    t.index ["rental_period_id"], name: "index_contracts_on_rental_period_id"
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
    t.string   "customer_code"
    t.string   "description"
    t.string   "supplier"
    t.string   "category"
    t.float    "price"
    t.string   "serial_number"
    t.string   "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
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
  end

  create_table "rented_equipment", id: false, force: :cascade do |t|
    t.integer "contract_id"
    t.integer "equipment_id"
    t.index ["contract_id"], name: "index_rented_equipment_on_contract_id"
    t.index ["equipment_id"], name: "index_rented_equipment_on_equipment_id"
  end

end
