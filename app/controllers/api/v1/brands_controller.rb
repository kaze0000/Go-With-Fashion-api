module Api
  module V1
    class BrandsController < ApplicationController
      def index
        brands = current_user.brands
        render json: brands
      end

      def destroy
        brands = Brand.find(params[:id]).destroy!
        render json: brands
      end
    end
  end
end
