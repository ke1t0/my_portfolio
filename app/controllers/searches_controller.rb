class SearchesController < ApplicationController
  before_action :authenticate_user!

  def user
    @users = User.order(created_at: :desc).search(params[:search])
    @posts = Post.order(created_at: :desc).search(params[:search])
  end
end
