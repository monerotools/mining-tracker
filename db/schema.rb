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

ActiveRecord::Schema.define(version: 20180101062605) do

  create_table "stats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "address", null: false
    t.bigint "amtPaid", default: 0
    t.bigint "amtDue", default: 0
    t.bigint "payment", default: 0
    t.bigint "integer", default: 0
    t.bigint "total", default: 0
    t.timestamp "created_at"
    t.boolean "genesis", default: false
    t.index ["address"], name: "index_stats_on_address"
    t.index ["amtDue"], name: "index_stats_on_amtDue"
    t.index ["amtPaid"], name: "index_stats_on_amtPaid"
    t.index ["created_at"], name: "index_stats_on_created_at"
    t.index ["genesis"], name: "index_stats_on_genesis"
    t.index ["payment"], name: "index_stats_on_payment"
    t.index ["total"], name: "index_stats_on_total"
  end

end
