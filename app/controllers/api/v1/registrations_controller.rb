module Api
  module V1
    class RegistrationsController < ApplicationController
      # https://github.com/heartcombo/devise/issues/5473
      include RackSessionFix
      def signup
        @user = User.new(_registrations_params)

        if @user.save
            # binding.irb
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
