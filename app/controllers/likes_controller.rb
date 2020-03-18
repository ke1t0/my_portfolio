class LikesController < ApplicationController
  before_action :post_params

  def create
    like = current_user.likes.new(post_id: @post.id)
    like.save
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, post_id: @post.id).destroy
  end

  private

    def post_params
      @post = Post.find(params[:post_id])
    end
end
