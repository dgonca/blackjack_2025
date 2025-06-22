class Hand < ApplicationRecord
    has_many :cards
    belongs_to :players_game
    belongs_to :deal

    def game
        players_game.game
    end
end

# == Schema Information
#
# Table name: hands
#
#  id              :integer          not null, primary key
#  players_game_id :integer          not null
#  bet             :integer
#  status          :string
#  score           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  deal_id         :integer          not null
#
# Indexes
#
#  index_hands_on_deal_id          (deal_id)
#  index_hands_on_players_game_id  (players_game_id)
#
