class Deck < ApplicationRecord
    has_many :cards
    belongs_to :shoe


    def valid
        cards.count == 52
    end
    # deck should always be 52 cards

    def generate_deck
        Card::SUIT_TYPES.each do |suit|
            Card::RANK_TYPES.each do |rank|
                Card.create!(
                    suit: suit,
                    rank: rank,
                    deck_id: self.id
                )
            end
        end
    end
end

# == Schema Information
#
# Table name: decks
#
#  id         :integer          not null, primary key
#  shoe_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_decks_on_shoe_id  (shoe_id)
#
