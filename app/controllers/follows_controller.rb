class FollowsController < ApplicationController

    def request_connect
        Follow.request_connection(connect_params)

    end

    def connect
        byebug
        Follow.create_connection(connect_params)
        
    end



    private

    def connect_params
        params.permit(:root_user_id, :id)
    end

end
