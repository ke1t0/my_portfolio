class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.order(created_at: :desc)
    @posts = Post.page(params[:page]).per(4).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = '投稿しました'
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:body, :user_id)
    end
end