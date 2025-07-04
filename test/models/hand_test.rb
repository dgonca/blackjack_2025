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

require "test_helper"

class HandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "current_score" do
    hand_1 # A, 4, A
    # what this should equal
    hand_1.current_score
  end
end
