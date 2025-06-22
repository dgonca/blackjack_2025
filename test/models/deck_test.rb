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

require "test_helper"

class DeckTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
