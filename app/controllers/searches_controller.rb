class SearchesController < ApplicationController
  def user
    # User.allでなくて良さそう
    @users = User.order(created_at: :desc).search(params[:search])
    @posts = Post.order(created_at: :desc).search(params[:search])
  end
end
