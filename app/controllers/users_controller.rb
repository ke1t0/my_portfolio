class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    unless current_user.admin == true
      redirect_to posts_path
    end
    @users = User.order(name: :asc).search(params[:search]).page(params[:page]).per(1)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @like_posts = current_user.likes
    @comment_posts = current_user.comments
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_back(fallback_location: users_path)
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(1).order(created_at: :desc)
    # render 'follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(1).order(created_at: :desc)
    # render 'follower'
  end

  def destroy_image
    current_user.update(image: nil)
    redirect_to edit_user_registration_path
  end
end
