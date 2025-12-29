class MainController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
    else
      redirect_to login_path, alert: "You must be logged in to access this section."
    end
  end
end