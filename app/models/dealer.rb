class Dealer < ApplicationRecord
    has_many :games

    LEVEL_TYPES = ['easy', 'medium', 'hard'].freeze
    DEALER_NAMES = [
        'Lightning Larry',
        'Medium Mark',
        'Slow Down Susan'
    ].freeze

    DEALER_TYPES = {
        easy: {level: 'easy', name: 'Slow Down Susan'},
        medium: {level: 'medium', name: 'Medium Mark'},
        hard: {level: 'hard', name: 'Lightning Larry'}
    }

    # validates :name, inclusion: {in: DEALER_NAMES}
    # validates :level, inclusion: {in: LEVEL_TYPES}

    def self.find_or_create_new_dealer(level)
        dealer_type = DEALER_TYPES[level]
        Dealer.find_or_create_by!(level: dealer_type[:level], name: dealer_type[:name])
    end
end

# == Schema Information
#
# Table name: dealers
#
#  id         :integer          not null, primary key
#  name       :string
#  level      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
