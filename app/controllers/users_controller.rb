class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @like_posts = current_user.likes
  end
end
