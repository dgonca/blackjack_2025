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

require "test_helper"

class CardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
