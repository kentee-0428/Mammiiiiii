class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.with_attached_image.includes(:posts, :spots).page(params[:page]).per(15).order(created_at: :desc)
  end

  def profile
    @user = User.includes(posts: [:likes], spots: [:categories]).find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.image.nil?
      @user.image = "default.png"
    end
    if @user.update(user_params)
      flash[:notice] = "#{@user.name}の情報を更新しました"
      redirect_to profile_user_path
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @user.destroy
    redirect_to users_path
    flash[:notice] = "#{@user.name}のアカウントを削除しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :gender, :introduction)
  end

end
