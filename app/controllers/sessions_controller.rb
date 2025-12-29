class SessionsController < ApplicationController
  def new
    Rails.logger.info("Rendering login form")
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully"
    else
      Rails.logger.warn("Failed login attempt for email: #{params[:email]}")
      redirect_to login_path, alert: "Invalid email or password"
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: "Logged out successfully"
  end
end
