class Player < ApplicationRecord
    has_many :players_games
    has_many :games, through: :players_games


    def won_games
        game_ids = self.player_games.pluck(&:game_id)
    end

    def self.create_new_cpu(bank_roll)
        create!(
            bank_roll: bank_roll
        )
    end
end

# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  bank_roll  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
