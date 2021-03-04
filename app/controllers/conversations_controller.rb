class ConversationsController < ApplicationController
    def create
        current_user = User.find(params[:current_user_id])
        conversation = Conversation.get(current_user.id, params[:user_id])
        Action.cable.server.broadcast 'conversations_channel', conversation, include: '*.*'
        head :ok
        # render json: conversation, include: '*.*'
    end
end
