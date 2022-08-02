module Api
  module V1
    class UserProfilesController < ApplicationController

      def index
        user_profiles = UserProfile.all
        render json: user_profiles
      end

      def show
        user_profile = current_user.user_profile
        render json: user_profile
      end

      def create
        user_profile = UserProfile.new(_user_profile_params)
        if user_profile.save
          render json: user_profile
        else
          render json: {status: 500, message: "作成に失敗"}
        end
      end

      def update
        # binding.irb
        user_profile = current_user.user_profile.update(_user_profile_update_params)
        # binding.irb
        render json: user_profile
      end

      private

      def _user_profile_params
        params.require(:user_profile).permit(:name, :gender, :self_introducement, :twitter, :instagram).merge(user_id: current_user.id)
      end

      def _user_profile_update_params
        params.require(:user_profile).permit(:name, :gender, :self_introducement, :twitter, :instagram)
      end
    end
  end
end
