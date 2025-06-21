class Card < ApplicationRecord
    belongs_to :deck
    belongs_to :hand, optional: true

    SUIT_TYPES = ['heart', 'spade', 'club', 'diamond'].freeze
    RANK_TYPES = [
        'A',
        '2',
        '3',
        '4',
        '5',
        '6',
        '7',
        '8',
        '9',
        '10',
        'J',
        'Q',
        'K'
    ].freeze

    validates :suit, inclusion: {in: SUIT_TYPES}
    validates :rank, inclusion: {in: RANK_TYPES}


    # suit [heart, spade, club, diamond]
    # rank [ace -> king]
end

# == Schema Information
#
# Table name: cards
#
#  id         :integer          not null, primary key
#  suit       :string
#  rank       :string
#  deck_id    :integer          not null
#  hand_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  position   :integer
#
# Indexes
#
#  index_cards_on_deck_id  (deck_id)
#  index_cards_on_hand_id  (hand_id)
#
