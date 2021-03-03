class FriendshipsController < ApplicationController
    include ApplicationHelper

    def create
        current_user = User.find(params[:current_user_id])
        return if current_user.id == params[:user_id]
        return if friend_request_sent?(User.find(params[:user_id]))
        return if friend_request_received?(User.find(params[:user_id]))

        user = User.find(params[:user_id])
        friendship = current_user.friend_sent.build(sent_to_id: params[:user_id])
        if friendship.save
            Notification.create(user_id: params[:user_id], notice_type: 'friendRequest', notice_id: current_user.id)
            render json: { message: 'Friend Request Success' }
        else
            render json: { errors: friendship.errors.full_messages }
        end
    end

    def accept_friend
        current_user = User.find(params[:current_user_id])
        friendship = Friendship.find_by(sent_by_id: params[:user_id], sent_to_id: current_user.id, status: false)
        return unless friendship

        friendship.status = true
        if friendship.save
            friendship2 = current_user.friend_sent.build(sent_to_id: params[:user_id], status: true)
            friendship2.save
        else
            render json: {errors: "Friend Request could not be accepted" }
        end
    end

    def decline_friend
        friendship = Friendship.find_by(sent_by_id: params[:user_id], sent_to_id: current_user.id, status: false)
        return unless friendship

        friendship.destroy
        render json: {message: "Friend Request Declined" }        
    end

    
end
