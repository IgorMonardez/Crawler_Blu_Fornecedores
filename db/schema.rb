# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_10_10_211502) do
  create_table "fornecedors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nome"
    t.bigint "segmentos_id"
    t.bigint "regiaos_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["regiaos_id"], name: "index_fornecedors_on_regiaos_id"
    t.index ["segmentos_id"], name: "index_fornecedors_on_segmentos_id"
  end

  create_table "regiaos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nome"
    t.bigint "segmentos_id"
    t.bigint "regiaos_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["regiaos_id"], name: "index_regiaos_on_regiaos_id"
    t.index ["segmentos_id"], name: "index_regiaos_on_segmentos_id"
  end

  create_table "segmentos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "fornecedors", "regiaos", column: "regiaos_id"
  add_foreign_key "fornecedors", "segmentos", column: "segmentos_id"
  add_foreign_key "regiaos", "regiaos", column: "regiaos_id"
  add_foreign_key "regiaos", "segmentos", column: "segmentos_id"
end
