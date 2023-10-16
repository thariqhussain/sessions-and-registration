class UsersController < ApplicationController
# before_action :require_login 

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.with(user: @user).welcome_mail.deliver_later
      session[:user_id] = @user.id
      redirect_to root_path, notice:"Account created Succesfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def login
  end

  def authenticate
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice:"You have successfuly logged in"
    else
      render :login, status: :unprocessable_entity
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path, notice:"Logged out"
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
