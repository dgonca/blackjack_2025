class AddGameBankRollToPlayersGames < ActiveRecord::Migration[8.0]
  def change
    add_column :players_games, :game_bank_roll, :integer, null: false
  end
end
