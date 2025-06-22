class CreatePlayers < ActiveRecord::Migration[8.0]
  def change
    create_table :players do |t|
      t.string :player_type
      t.integer :bank_roll
      t.timestamps
    end
  end
end
