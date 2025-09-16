class SessionsController < ApplicationController
  def new

  end
  def create
    user = User.find_by(email: params[:email_or_username]) || User.find_by(username: params[:email_or_username])
    if user && user.authenticate(params[:password])
      #put user id in session
      session[:user_id] = user.id
      redirect_to user, notice: "welcome back. #{user.name}"
    else
      flash.now[:alert] = "Invalid email/username or password"
      render :new, status: :unprocessable_entity
    end

  end

  def destroy

  end
end