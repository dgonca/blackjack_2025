class AddDealerIdToGames < ActiveRecord::Migration[8.0]
  def change
    add_reference :games, :dealer, null: false, foreign_key: true
  end
end
