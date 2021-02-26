class Follow < ApplicationRecord
    belongs_to :follower, class_name: 'User'
    belongs_to :followee, class_name: 'User'


    def request_connection(args)
        root_user_id = args['root_user_id']
        other_user_id = args['id']
        Follow.where(follower_id: other_user_id, connected: false)
    end

    def create_connection(args)
        root_user = User.find(args['root_user_id'])
        other_user = User.find(args['id'])

        root_user.followers << other_user
        other_user.followers << root_user
    end
end
