class UsersController < ApplicationController
  before_action :ensure_correct_user, {only: [:edit]}

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
    @user =User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render edit
    end
  end

  def ensure_correct_user
    if current_user.id != params[:id].to_i
      redirect_to user_path(current_user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
