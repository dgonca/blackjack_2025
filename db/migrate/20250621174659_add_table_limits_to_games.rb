class AddTableLimitsToGames < ActiveRecord::Migration[8.0]
  def change
    add_column :games, :table_minimum, :integer, null: false
    add_column :games, :table_maximum, :integer, null: false
  end
end
