class MessagesController < ApplicationController

    def create
        conversation = Conversation.includes(:recipient).find(params[:conversation_id])
        message = conversation.messages.create(message_params)
        MessagesChannel.broadcast_to conversation, message
        head :ok
        # ConversationChannel.broadcast_to(conversation, message)
        # byebug

        # puts 'hi'
    end



    private

    def message_params
        params.permit(:user_id, :body)
    end
end
