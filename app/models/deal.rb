class Deal < ApplicationRecord
   belongs_to :game
   has_many :hands
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
