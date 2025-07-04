class Hand < ApplicationRecord
    has_many :cards
    belongs_to :players_game
    belongs_to :deal

    def current_score
        # As soon as the non-Ace cards total 11 or more, the Ace must drop to 1 to avoid busting
        total = 0
        aces = 0

        cards.each do |card|
            case card.rank
            when "A"
                aces += 1
            when "K", "Q", "J", "10"
                total += 10
            else
                total += card.rank.to_i
            end
        end

        # We only care about whether the next Ace can safely be counted as 11, if not treat it as 1
        aces.times do
            if total + 11 <= 21
                total += 11
            else
                total += 1
            end
        end

        total
    end

    def is_soft?
        current_score < 21 && card_ranks.include?("A")
    end

    def hit
        game.deal_card(id)
    end

    def blackjack?
        card_ranks = cards.pluck(&:rank)
        has_ace = card_ranks.include?("A")
        has_ten_value = card_ranks.any? { |r| [ "10", "J", "Q", "K" ].include?(r) }

        has_ace && has_ten_value
    end

    def can_split?
        cards.count == 2 && cards[0] == cards[1]
    end

    def busted?
        score > 21
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
