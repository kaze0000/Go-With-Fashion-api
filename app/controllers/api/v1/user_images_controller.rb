module Api
  module V1
    class UserImagesController < ApplicationController
      def create
        user_image = UserImage.new(_user_image_params)
        if user_image.save
          render json: user_image
        else
          render json: {status: 500, message: "作成に失敗"}
        end
      end

      private

      def _user_image_params
        params.require(:user_image).permit(:image).merge(user_id: current_user.id)
      end
    end
  end
end
