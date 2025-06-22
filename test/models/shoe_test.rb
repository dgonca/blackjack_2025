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

require "test_helper"

class ShoeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'generate_shoe' do
    # in generate_shoe we expect
    # a Shoe object to be generated
    # 6 Deck objects to be generated, that tie back to the Shoe
    # and 52 Card objects per Deck to be generated with the correct rank & suit

    dealer = Dealer.find_or_create_new_dealer(:medium)
    game = Game.create(dealer: dealer, table_minimum: 5, table_maximum: 500)
    shoe = Shoe.generate_shoe(game)

    assert shoe.persisted?
    assert_equal 6, shoe.decks.count
    assert_equal 52, shoe.decks.first.cards.count
    assert_equal 312, shoe.cards.count

    
  end

  test 'shuffle' do
    dealer = Dealer.find_or_create_new_dealer(:medium)
    game = Game.create(dealer: dealer, table_minimum: 5, table_maximum: 500)
    shoe = Shoe.generate_shoe(game)
    first_5_cards = shoe.cards.first(5)
    first_5_cards_indices = []
    first_5_cards.each_with_index {|card, index| first_5_cards_indices << index }
    assert first_5_cards.all? {|card| card.position.nil? }
    shoe.shuffle
    first_5_cards.each {|card| card.reload }
    assert_not first_5_cards.all? {|card| card.position.nil? }
    assert_not_equal first_5_cards_indices, first_5_cards.pluck(:position)
  end
end
