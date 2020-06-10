class SearchesController < ApplicationController
  before_action :authenticate_user!

  # 検索機能
  def user
    @users = User.order(created_at: :desc).search(params[:search])
    @posts = Post.order(created_at: :desc).search(params[:search])
  end
end
