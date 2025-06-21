# == Schema Information
#
# Table name: players_games
#
#  id             :integer          not null, primary key
#  game_id        :integer          not null
#  player_id      :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  table_position :integer
#  game_bank_roll :integer          not null
#
# Indexes
#
#  index_players_games_on_game_id    (game_id)
#  index_players_games_on_player_id  (player_id)
#

require "test_helper"

class PlayersGameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
