module Api
  module V1
    class ChatRoomsController < ApplicationController
      def index
        chat_rooms = current_user.chat_rooms

        other_users = []
        chat_room_index_hash = {}

        chat_rooms.each_with_index do |chat_room, i|
          other_users << chat_room.chat_room_users.where.not(user_id: current_user.id)[0].user
          chat_room_index_hash[i] = {chat_room: chat_room}
        end

        other_users.each_with_index do |other_user, i|
          user_image = other_user.user_image
          user_profile = other_user.user_profile
          chat_room_index_hash[i]["user_image"] = user_image
          chat_room_index_hash[i]["user_profile"] = user_profile
        end
        render json: chat_room_index_hash
      end

      def new
      end

      def show
        chat_room = ChatRoom.find(params[:id])
        render json: chat_room
      end

      # def show
      #   post = Post.find(params[:id])
      #   post_and_user_profile_hash = {}
      #   user_profile = post.user.user_profile
      #   user_image = post.user.user_image
      #   posted_brands = post.brands
      #   posted_area = post.area
      #   post_and_user_profile_hash[0] = [post: post, user_profile: user_profile, user_image: user_image, posted_brands: posted_brands, posted_area: posted_area]
      #   render json: post_and_user_profile_hash
      # end

      def create
        # すでにchat_roomがある場合も考慮せねば
        # current_user.chat_room_user.chat_room_id == params[:user_id].chat_room_user.chat_room_id
        # ならば、chat_roomを作らずにshowに遷移

        chat_room = ChatRoom.create!
        chat_room_user = ChatRoomUser.create!(chat_room_id: chat_room.id, user_id: current_user.id)
        chat_room_other_user = ChatRoomUser.create!(chat_room_id: chat_room.id, user_id: params[:user_id])
        render json: chat_room
      end
    end
  end
end
