class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_createe_params)
    if @post.save
      flash[:notice] = "#{@post.user.name}さんの投稿が完了しました。"
      redirect_to posts_path
    else
      render "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_update_params)
      flash[:notice] = "#{@post.user.name}さんの投稿を更新しました"
      redirect_to posts_path
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
    flash[:notice] = "#{@post.user.name}さんの投稿を削除しました"
  end

  private

  def post_createe_params
    params.require(:post).permit(:content, :user_id, :post_image)
  end

  def post_update_params
    params.require(:post).permit(:content, :user_id, :post_image)
  end
end
