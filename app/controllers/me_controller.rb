require 'json'

class MeController < ApplicationController
    before_action :authenticate
    def show
        collection = Mongoid.default_client.collections.find { |col| col.name == "discordUsers" }
        view = collection.find ({ :user_id => "#{current_user.username}##{current_user.discriminator}" })
        player = view.first
        ally_code = player["ally_code"]
        result = {
            :user => current_user,
            :player => player,
            :ally_code => ally_code
        }
        format.json {render :json => result}
    end
end