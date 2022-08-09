module Api
  module V1
    class ChatMessagesController < ApplicationController
      def index
      end

      def show
        chat_room = ChatRoom.find(params[:id])
        other_user = chat_room.chat_messages.where.not(user_id: current_user.id)[0]&.user

        chat_messages = chat_room.chat_messages

        my_profile = current_user.user_profile
        my_image = current_user.user_image

        others_profile = other_user&.user_profile
        others_image = other_user&.user_image

        render json: {chat_messages: chat_messages,
                      my_profile: my_profile, others_profile: others_profile,
                      my_image: my_image, others_image: others_image}
      end

      def create
        chat_message = ChatMessage.new(_chat_message_params)
        if chat_message.save!
          render json: chat_message
        else
          render json: { status: 500 }
        end
      end

      private

      def _chat_message_params
        params.require(:chat_message).permit(:chat_room_id, :message).merge(user_id: current_user.id)
      end
    end
  end
end
