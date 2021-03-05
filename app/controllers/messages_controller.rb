class MessagesController < ApplicationController

    def create
        conversation = Conversation.includes(:recipient).find(params[:conversation_id])
        message = conversation.messages.create(message_params)
        serialized_data = ActiveModelSerializers::Adapter::Json.new(
            MessageSerializer.new(message)
            ).serializable_hash
            
            MessagesChannel.broadcast_to conversation, serialized_data
            head :ok
            
            # byebug
            # puts 'hi'
        # ConversationChannel.broadcast_to(conversation, message)
    end



    private

    def message_params
        params.permit(:user_id, :body)
    end
end
