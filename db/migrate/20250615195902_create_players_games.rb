class CreatePlayersGames < ActiveRecord::Migration[8.0]
  def change
    create_table :players_games do |t|
      t.references :game, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.timestamps
    end
  end
end
