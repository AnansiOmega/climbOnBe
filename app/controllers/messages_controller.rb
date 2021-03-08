class MessagesController < ApplicationController

    def create
        conversation = Conversation.includes(:recipient).find(params[:conversation_id])
        message = conversation.messages.create(message_params)
        Notification.create(user_id: conversation.sender_id, notice_type: 'newMessage', notice_id: conversation.recipient_id)
        serialized_data = ActiveModelSerializers::Adapter::Json.new(
            MessageSerializer.new(message)
            ).serializable_hash
            MessagesChannel.broadcast_to conversation, serialized_data
            head :ok
    end



    private

    def message_params
        params.permit(:user_id, :body)
    end
end
