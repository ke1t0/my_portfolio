class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to action: 'index'
    else
      flash[:danger] = '失敗' #表示できていない
      render :new
    end
  end

  def destroy
    
  end

  private

    def post_params
      params.require(:post).permit(:body, :user_id)
    end
end
