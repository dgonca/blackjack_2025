class DealsController < ApplicationController

    # Take in the current deal
    # What player is next?
    # What actions are they able to take on their hand?

    def next_avaliable_actions
        deal = params[:deal_id]
        current_player = deal.current_player
        current_hand = current_player.current_hand(deal)

        deal.hands.select { |hand| hand.players_game.player_id === self.id }

    end


end
