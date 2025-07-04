class Deal < ApplicationRecord
   belongs_to :game
   has_many :hands
   has_many :seats, through: :hands, class_name: "PlayersGame"

   # returns a Player who is at the current table position
   def current_player
      seats.find(table_position: self.table_position).player
   end
end

# == Schema Information
#
# Table name: deals
#
#  id             :integer          not null, primary key
#  game_id        :integer          not null
#  status         :string
#  table_position :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_deals_on_game_id  (game_id)
#
