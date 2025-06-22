# == Schema Information
#
# Table name: games
#
#  id            :integer          not null, primary key
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  dealer_id     :integer          not null
#  table_minimum :integer          not null
#  table_maximum :integer          not null
#
# Indexes
#
#  index_games_on_dealer_id  (dealer_id)
#

require "test_helper"

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
