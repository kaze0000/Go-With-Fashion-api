module Api
  module V1
    class PostsController < ApplicationController
      def index
        posts = Post.all
        render json: posts
      end

      def new
        post = Post.new
      end

      def create
        post = Post.new(_post_params)
        post.save
        render json: {status: 200, post: post}
      end
      
      private

      def _post_params
        params.require(:post).permit(:title)
      end
    end
  end
end
