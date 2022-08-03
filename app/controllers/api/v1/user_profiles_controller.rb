module Api
  module V1
    class UserProfilesController < ApplicationController

      def index
        user_profiles = UserProfile.all
        render json: user_profiles
      end

      def new
        # edit的な扱い
        render json: current_user.user_profile if current_user.user_profile.present?
      end

      def create
        # binding.irb
        if current_user.user_profile.present?
          # update的な扱い
          user_profile = current_user.user_profile.update(_user_profile_update_params)
          render json: user_profile
        else
          # create的な扱い
          user_profile = UserProfile.new(_user_profile_params)
          if user_profile.save!
            render json: user_profile
          else
            render json: {status: 500, message: "作成に失敗"}
          end
        end

        # Fix: user_profileの処理の中にbradndに関する処理が入ってしまっているので分ける
        brand_lists = params[:favorite_brands][:names].split(" ")
        brand_lists.each do |brand_list|
          brand = Brand.where(name: brand_list).first_or_initialize
          brand.save!

          user_favorite_brand = UserFavoriteBrand.where(user_id: current_user.id, brand_id: brand.id).first_or_initialize
          user_favorite_brand.save!
        end
      end

      private

      def _user_profile_params
        params.require(:user_profile).permit(:name, :gender, :age, :self_introducement, :twitter, :instagram).merge(user_id: current_user.id)
      end

      def _user_profile_update_params
        params.require(:user_profile).permit(:name, :gender, :age, :self_introducement, :twitter, :instagram)
      end
    end
  end
end
