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

ActiveRecord::Schema[8.0].define(version: 2025_06_21_174659) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string "suit"
    t.string "rank"
    t.bigint "deck_id", null: false
    t.bigint "hand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["deck_id"], name: "index_cards_on_deck_id"
    t.index ["hand_id"], name: "index_cards_on_hand_id"
  end

  create_table "dealers", force: :cascade do |t|
    t.string "name"
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deals", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.string "status"
    t.integer "table_position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_deals_on_game_id"
  end

  create_table "decks", force: :cascade do |t|
    t.bigint "shoe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shoe_id"], name: "index_decks_on_shoe_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dealer_id", null: false
    t.integer "table_minimum", null: false
    t.integer "table_maximum", null: false
    t.index ["dealer_id"], name: "index_games_on_dealer_id"
  end

  create_table "hands", force: :cascade do |t|
    t.bigint "players_game_id", null: false
    t.integer "bet"
    t.string "status"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "deal_id", null: false
    t.index ["deal_id"], name: "index_hands_on_deal_id"
    t.index ["players_game_id"], name: "index_hands_on_players_game_id"
  end

  create_table "players", force: :cascade do |t|
    t.integer "bank_roll"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players_games", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "table_position"
    t.integer "game_bank_roll", null: false
    t.index ["game_id"], name: "index_players_games_on_game_id"
    t.index ["player_id"], name: "index_players_games_on_player_id"
  end

  create_table "shoes", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_shoes_on_game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.bigint "player_id", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["player_id"], name: "index_users_on_player_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cards", "decks"
  add_foreign_key "cards", "hands"
  add_foreign_key "deals", "games"
  add_foreign_key "decks", "shoes"
  add_foreign_key "games", "dealers"
  add_foreign_key "hands", "deals"
  add_foreign_key "hands", "players_games"
  add_foreign_key "players_games", "games"
  add_foreign_key "players_games", "players"
  add_foreign_key "shoes", "games"
  add_foreign_key "users", "players"
end
