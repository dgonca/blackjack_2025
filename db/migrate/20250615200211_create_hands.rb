class CreateHands < ActiveRecord::Migration[8.0]
  def change
    create_table :hands do |t|
      t.references :players_game, null: false, foreign_key: true
      t.integer :bet
      t.string :status
      t.integer :score
      t.timestamps
    end
  end
end
