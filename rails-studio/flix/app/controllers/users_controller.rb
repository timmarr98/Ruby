class UsersController < ApplicationController

  before_action :require_signin, except: [:new, :create]

  def require_signin
    unless current_user
      redirect_to new_session_url, alert: "You must be logged in to access this page!"
    end
  end
  def index
    @users  = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id #all the session needs is the user id
      redirect_to @user, notice: 'Thanks for signing up!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user,  notice: "Account successfully updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to movies_url, status: :see_other, alert: "Account successfully deleted."
  end

  def user_params
    return params.require(:user).permit(:name, :email, :password, :password_confirmation, :username)
  end



end
