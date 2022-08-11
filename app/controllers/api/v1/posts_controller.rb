module Api
  module V1
    class PostsController < ApplicationController
      def index
        posts = Post.all.order(preferred_at: :desc)
        posts_and_user_profiles_hash = {}
        posts.each_with_index do |post, i|
          user_profile = post.user.user_profile
          user_image = post.user.user_image
          posted_brands = post.brands
          posted_area = post.area
          posts_and_user_profiles_hash[i] = [post: post,
                                             user_profile: user_profile,
                                             user_image: user_image,
                                             posted_brands: posted_brands,
                                             posted_area: posted_area]
        end
        render json: posts_and_user_profiles_hash
      end

      def show
        post = Post.find(params[:id])
        post_and_user_profile_hash = {}
        user_profile = post.user.user_profile
        user_image = post.user.user_image
        posted_brands = post.brands
        posted_area = post.area
        post_and_user_profile_hash[0] = [post: post,
                                         user_profile: user_profile,
                                         user_image: user_image,
                                         posted_brands: posted_brands,
                                         posted_area: posted_area]
        render json: post_and_user_profile_hash
      end

      def create
        post = Post.new(_post_params)
        if post.save!
          render json: post
        else
          render json: {status: 500, message: "作成に失敗"}
        end

        # Fix: postsの処理の中にbradndに関する処理が入ってしまっているので分ける
        brand_lists = params[:posted_brands][:names].split(" ")
        brand_lists.each do |brand_list|
          brand = Brand.where(name: brand_list).first_or_initialize
          brand.save!
          posted_brand = PostedBrand.where(post_id: post.id, brand_id: brand.id).first_or_initialize
          posted_brand.save!
        end
      end

      def destroy
        Post.find(params[:id]).destroy!
        posts = Post.all
        render json: posts
      end

      private

      def _post_params
        params.require(:post).permit(:body, :preferred_at, :area_id).merge(user_id: current_user.id)
      end
    end
  end
end
