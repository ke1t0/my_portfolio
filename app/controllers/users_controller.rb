class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    unless current_user.admin == true
      redirect_to posts_path
    end
    # @users = User.order(name: :asc)
    @users = User.order(name: :asc).search(params[:search])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @like_posts = current_user.likes
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_back(fallback_location: users_path)
  end
end
