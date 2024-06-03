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

ActiveRecord::Schema.define(version: 2024_06_02_183900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "itens_pedidos", force: :cascade do |t|
    t.bigint "pedido_id", null: false
    t.string "nome"
    t.integer "quantidade"
    t.decimal "preco"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pedido_id"], name: "index_itens_pedidos_on_pedido_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.datetime "data_hora"
    t.string "numero_nota_fiscal"
    t.decimal "valor_frete"
    t.decimal "valor_desconto"
    t.decimal "valor_total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "itens_pedidos", "pedidos"
end
