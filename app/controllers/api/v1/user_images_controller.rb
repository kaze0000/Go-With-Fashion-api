module Api
  module V1
    class UserImagesController < ApplicationController

      def new
        render json: current_user.user_image if current_user.user_image.present?
      end

      def create
        if current_user.user_image.present?
          # update的な扱い
          user_image = current_user.user_image.update(_user_image_update_params)
          render json: user_image
        else
          user_image = UserImage.new(_user_image_params)
          if user_image.save
            render json: user_image
          else
            render json: {status: 500, message: "作成に失敗"}
          end
        end
      end

      private

      def _user_image_params
        params.require(:user_image).permit(:image).merge(user_id: current_user.id)
      end

      def _user_image_update_params
        params.require(:user_image).permit(:image)
      end
    end
  end
end
