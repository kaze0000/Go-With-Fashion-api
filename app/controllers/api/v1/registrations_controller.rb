module Api
  module V1
    class RegistrationsController < ApplicationController
      def signup
        @user = User.new(_registrations_params)

        if @user.save
            login!
            render json: { status: :created, user: @user }
        else
            render json: { status: 500 }
        end
      end

      private

        def _registrations_params
            params.require(:user).permit(:email, :password, :password_confirmation)
        end
    end
  end
end
