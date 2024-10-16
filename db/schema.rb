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

ActiveRecord::Schema[7.2].define(version: 2024_10_15_200644) do
  create_table "fornecedores", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nome"
    t.bigint "segmento_id"
    t.bigint "regiao_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["regiao_id"], name: "index_fornecedores_on_regiao_id"
    t.index ["segmento_id"], name: "index_fornecedores_on_segmento_id"
  end

  create_table "regiaos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "segmentos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nome"], name: "index_segmentos_on_nome", unique: true
  end

  add_foreign_key "fornecedores", "regiaos"
  add_foreign_key "fornecedores", "segmentos"
end
