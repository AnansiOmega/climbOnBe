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

    def delete_notifications
        notifications = Notification.where( notice_type: "newMessage", notice_id: params[:user_id], user_id: params[:current_user_id] )
        notifications.destroy_all
    end



    private

    def message_params
        params.permit(:user_id, :body)
    end
end
