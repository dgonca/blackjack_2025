class CreateDeals < ActiveRecord::Migration[8.0]
  def change
    create_table :deals do |t|
      t.references :game, null: false, foreign_key: true
      t.string :status
      t.integer :table_position
      t.timestamps
    end
  end
end
