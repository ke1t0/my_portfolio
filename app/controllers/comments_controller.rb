class CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: post_path(post.id))
    else
      flash[:danger] = "コメントできません"
      redirect_back(fallback_location: post_path(post.id))
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    # @comment = post.comments.find(params[:id])
    # @comment.destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: post_path(post.id))
  end

  private

    def comment_params
      params.require(:comment).permit(:text, :post_id, :user_id)
    end
end
