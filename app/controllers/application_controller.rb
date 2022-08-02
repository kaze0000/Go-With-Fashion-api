class ApplicationController < ActionController::Base
  # https://github.com/heartcombo/devise/issues/5473
  include RackSessionFix

  skip_before_action :verify_authenticity_token

  helper_method :login!, :current_user

  private

  def login!
      session[:user_id] = @user.id
  end

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
