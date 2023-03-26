class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find(current_user.id)
  end

  def new
    @user = User.new
  end

  def create
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.image.nil?
      @user.image = "default.png"
    end
    if @user.update(user_update_params)
      flash[:notice] = "#{@user.name}の情報を更新しました"
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy
  end

  private

  def user_update_params
    params.require(:user).permit(:name, :image, :gender, :introduction)
  end

end
