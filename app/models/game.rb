class Game < ApplicationRecord
    has_many :seats, class_name: "PlayersGame"
    has_many :players, through: :seats
    has_one :shoe
    belongs_to :dealer
    has_many :deals

    CPU_MAX = 5
    LIMITS = {
        '5': { table_minimum: 5, table_maximum: 500 },
        '10': { table_minimum: 10, table_maximum: 1000 },
        '25': { table_minimum: 25, table_maximum: 2500 },
        '50': { table_minimum: 50, table_maximum: 5000 },
        '100': { table_minimum: 100, table_maximum: 10000 },
        '500': { table_minimum: 500, table_maximum: 50000 }
    }

    # user is the current actual player
    # game_info consists of

    # @params: {
    #   user: User,
    #   game_info: {
    #       game_bank_roll: Integer
    #       table_limit: Integer
    #       number_of_cpus: Integer
    #       seat: Integer
    #       difficulty: String
    #   }
    # }
    def self.new_game(user, game_info)
        # find the dealer based on selected difficulty
        dealer = Dealer.find_or_create_new_dealer(game_info["difficulty"].to_sym)

        # get table limit
        limits = LIMITS[game_info["table_limit"].to_s]
        # create the game object with the selected table limits
        game = Game.create!(
            status: "in_progress",
            dealer: dealer,
            table_minimum: limits[:table_minimum],
            table_maximum: limits[:table_maximum]
        )

        # set the player's game bank roll
        game.seats.create!(
            player: user.player,
            game_bank_roll: game_info["game_bank_roll"],
            table_position: game_info["seat"]
        )

        # assign out the cpus' seats
        cpu_count = game_info["number_of_cpus"]
        raise ArgumentError if cpu_count > CPU_MAX
        seats_needed = (cpu_count + 1).times.to_a
        seats_available = seats_needed.each_with_object([]) do |s, arr|
            arr << s unless s === game_info[:seat]
        end
        seats_available.each do |cpu|
            player = Player.create_new_cpu(limits[:table_minimum]*10)
            game.seats.create!(
                player: player,
                game_bank_roll: player.bank_roll,
                table_position: cpu
            )
        end
        game
    end
end

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
