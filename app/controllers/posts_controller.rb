class PostsController < ApplicationController
  before_action :authenticate_user!

  # 投稿一覧
  def index
    @posts = Post.order(created_at: :desc)
    @posts = Post.page(params[:page]).per(20).order(created_at: :desc)
  end

  # 投稿詳細
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  # 投稿作成
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

  # 投稿削除
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:body, :user_id, :image)
    end
end
