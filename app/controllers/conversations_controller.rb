class ConversationsController < ApplicationController
    def create
        current_user = User.find(params[:current_user_id])
        conversation = Conversation.get(current_user.id, params[:user_id])
        serialized_data = ActiveModelSerializers::Adapter::Json.new(
            ConversationSerializer.new(conversation)
          ).serializable_hash

        ActionCable.server.broadcast 'conversations_channel', serialized_data
        head :ok
    end
end
