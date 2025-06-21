class RemovePlayerTypeFromPlayers < ActiveRecord::Migration[8.0]
  def change
    remove_column :players, :player_type
  end
end
