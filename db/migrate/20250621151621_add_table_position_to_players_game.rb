class AddTablePositionToPlayersGame < ActiveRecord::Migration[8.0]
  def change
    add_column :players_games, :table_position, :integer
  end
end
