class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: :index
  before_action :authorize_user, except: :index

  def show
  end

  def index
    @users = User.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Your profile was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "User was successfully deleted."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_user
    redirect_to root_path, alert: "Access denied." unless @user == current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :gender, :weight, :height, :password, :password_confirmation)
  end
end