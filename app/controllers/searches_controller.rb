class SearchesController < ApplicationController
  def user
    # User.allでなくて良さそう
    @users = User.search(params[:search])
    @posts = Post.search(params[:search])
  end
end
