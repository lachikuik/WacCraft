class HomeController < ApplicationController
  before_action :require_login, only: [:logged]

  def require_login
    unless session[:user_id]
      redirect_to auth_login_path, alert: "You must be logged in to access this section"
    end
  end

  def logged
    if session[:user_id]
      @user = User.find(session[:user_id])
      if @user.nil?
        redirect_to auth_login_path, alert: "You must be logged in to access this section"
      end

      @characters = @user.characters.includes(:classes)
    end
  end



end
