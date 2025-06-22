class Shoe < ApplicationRecord
    has_many :decks
    belongs_to :game
    has_many :cards, through: :decks

    def self.generate_shoe(game)
        shoe = Shoe.create!(game: game)
        6.times do
            deck = Deck.create!(shoe: shoe)

            deck.generate_deck
        end
        shoe
    end

    def shuffle
        # shuffle all the cards order
        shuffled_cards = cards.shuffle

        shuffled_cards.each_with_index do |card, index|
            card.update!(position: index)
        end
    end
end

# == Schema Information
#
# Table name: shoes
#
#  id         :integer          not null, primary key
#  game_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_shoes_on_game_id  (game_id)
#
